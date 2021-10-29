create table job_hosts(
  jobid bigint,
  nid int,
  PRIMARY KEY (`jobid`,`nid`),
  KEY `jobid` (`jobid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB
