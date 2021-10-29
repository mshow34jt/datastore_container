#!/bin/bash

# Copyright 2018 The Vitess Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# this script brings up zookeeper and all the vitess components
# required for a single shard deployment.

source ./env.sh

# start topo server
if [ "${TOPO}" = "zk2" ]; then
        CELL=zone1 ./scripts/zk-up.sh
elif [ "${TOPO}" = "k8s" ]; then
        CELL=zone1 ./scripts/k3s-up.sh
else
        CELL=zone1 ./scripts/etcd-up.sh
fi



# start vtctld
CELL=zone1 "./scripts/vtctld-up.sh"

# start vttablets for keyspace commerce

for i in 100 101 102; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=-80 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done

for i in 200 201 202; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=80- CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done


sleep 15

# set one of the replicas to master
vtctldclient InitShardPrimary --force ISC/-80 zone1-100
vtctldclient InitShardPrimary --force ISC/80- zone1-200
# create the schema
vtctlclient ApplySchema -sql-file ovis.sql ISC
vtctlclient ApplySchema -sql-file jobs.sql ISC
vtctlclient ApplySchema -sql-file job_hosts.sql ISC
vtctlclient ApplySchema -sql-file tests.sql ISC
vtctlclient ApplySchema -sql-file testFails.sql ISC
vtctlclient ApplySchema -sql-file metrics_md.sql ISC

# create the vschema
vtctlclient ApplyVSchema -vschema_file ovis_sharded.json ISC

# start vtgate
CELL=zone1 "scripts/vtgate-up.sh"

disown -a
