# datastore_container


git clone https://github.com/vitessio/vitess.git  

cd vitess  
To ensure the same soure build as tested....  
git checkout 853d88d4eb3928d132d2cb8f717c062f4e9bb73a  

make docker_local  

singularity build vitess.sif docker-daemon://vitess/local:latest  
cp vitess.sif {storage dir}/images  


git clone https://github.com/mshow34jt/datastore_container  
mkdir {storage dir}/vitess  
midir {storage dir}/vtdataroot.16  
cp -a datastore_container/scripts {storage dir}/vitess  

singularity instance start  --bind {storage dir}/vtdataroot.16:/vt/vtdataroot --bind {storage dir}/vitess/scripts:/vt/local --bind {storage dir}:{storage dir} {storage dir}/images/vitess.sif vitess  

 singularity run instance://vitess bash  
 cd /vt/local  
 ./init16.sh #to initialize the database , use start16.sh for subsequent runs and stop16.sh to terminate  

Note, if using docker directly, you will need to launch with network in host mode, and run either the setinit.sh script to automatically launch the initialization script, or setstart.sh to cause docker to launch the startup script by default. (the vitess docker example with automatically call a predefined script named 101_initial_cluster.sh)  
