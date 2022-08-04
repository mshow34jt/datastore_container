# datastore_container


git clone https://github.com/vitessio/vitess.git

cd vitess
To ensure the same soure build as tested.... 
git checkout 853d88d4eb3928d132d2cb8f717c062f4e9bb73a

make docker_local

singularity build vitess.sif docker-daemon://vitess/local:latest

git clone https://github.com/mshow34jt/datastore_container
mkdir /storage/nvme0n1/ncsa/vitess
cp -a datastore_container/scripts /storage/nvme0n1/ncsa/vitess

singularity instance start  --bind /storage/nvme0n1/ncsa/vtdataroot.16:/vt/vtdataroot --bind /storage/nvme0n1/ncsa/vitess/scripts:/vt/local --bind /storage:/storage /storage/nvme0n1/ncsa/images/vitess.sif vitess

 singularity run instance://vitess bash
 cd /vt/local
 ./init16.sh #to initialize the database , use start16.sh for subsequent runs and stop16.sh to terminate
