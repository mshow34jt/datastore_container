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
        SHARD=-10 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done

for i in 110 111 112; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=10-20 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 120 121 122; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=20-30 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 130 131 132; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=30-40 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 140 141 142; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=40-50 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 150 151 152; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=50-60 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 160 161 162; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=60-70 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 170 171 172; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=70-80 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 180 181 182; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=80-90 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 190 191 192; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=90-a0 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 200 201 202; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=a0-b0 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 210 211 212; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=b0-c0 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 220 221 222; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=c0-d0 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 230 231 232; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=d0-e0 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 240 241 242; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=e0-f0 CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done
for i in 250 251 252; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        SHARD=f0- CELL=zone1 KEYSPACE=ISC TABLET_UID=$i ./scripts/vttablet-up.sh
done

for i in 300 301 302; do
        CELL=zone1 TABLET_UID=$i ./scripts/mysqlctl-up.sh
        CELL=zone1 KEYSPACE=WORK TABLET_UID=$i ./scripts/vttablet-up.sh
done




sleep 15

# set one of the replicas to master
vtctldclient InitShardPrimary --force ISC/-10 zone1-100
vtctldclient InitShardPrimary --force ISC/10-20 zone1-110
vtctldclient InitShardPrimary --force ISC/20-30 zone1-120
vtctldclient InitShardPrimary --force ISC/30-40 zone1-130
vtctldclient InitShardPrimary --force ISC/40-50 zone1-140
vtctldclient InitShardPrimary --force ISC/50-60 zone1-150
vtctldclient InitShardPrimary --force ISC/60-70 zone1-160
vtctldclient InitShardPrimary --force ISC/70-80 zone1-170
vtctldclient InitShardPrimary --force ISC/80-90 zone1-180
vtctldclient InitShardPrimary --force ISC/90-a0 zone1-190
vtctldclient InitShardPrimary --force ISC/a0-b0 zone1-200
vtctldclient InitShardPrimary --force ISC/b0-c0 zone1-210
vtctldclient InitShardPrimary --force ISC/c0-d0 zone1-220
vtctldclient InitShardPrimary --force ISC/d0-e0 zone1-230
vtctldclient InitShardPrimary --force ISC/e0-f0 zone1-240
vtctldclient InitShardPrimary --force ISC/f0- zone1-250
vtctldclient InitShardPrimary --force WORK/0 zone1-300

# create the schema
vtctldclient ApplySchema --sql-file ovis.sql ISC
vtctldclient ApplySchema --sql-file jobs.sql ISC
vtctldclient ApplySchema --sql-file job_hosts.sql ISC
vtctldclient ApplySchema --sql-file tests.sql ISC
vtctldclient ApplySchema --sql-file testFails.sql ISC
vtctldclient ApplySchema --sql-file metrics_md.sql ISC
vtctldclient ApplySchema --sql-file meminfo.sql ISC
vtctldclient ApplySchema --sql-file opa2.sql ISC
vtctldclient ApplySchema --sql-file lustre_client.sql ISC
vtctldclient ApplySchema --sql-file procnfs.sql ISC
vtctldclient ApplySchema --sql-file procnetdev.sql ISC
vtctldclient ApplySchema --sql-file procstat_72.sql ISC
vtctldclient ApplySchema --sql-file gw_sysclassib.sql ISC
vtctldclient ApplySchema --sql-file loadavg.sql ISC
vtctldclient ApplySchema --sql-file procnet.sql ISC
vtctldclient ApplySchema --sql-file lnet_stats.sql ISC
vtctldclient ApplySchema --sql-file coretemp.sql ISC

# create the vschema
vtctldclient ApplyVSchema --vschema-file ovis_sharded.json ISC
vtctldclient ApplyVSchema --vschema-file work.json WORK

# start vtgate
CELL=zone1 "scripts/vtgate-up.sh"

disown -a
