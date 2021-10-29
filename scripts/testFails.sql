create table testFails(
 cTime bigint(20),
 failCount int(11),
 testType VARCHAR(64),
 typeId VARCHAR(64),
 testName VARCHAR(64),
 jobid bigint(20),
 testLink TEXT,
 PRIMARY KEY (`testName`,`jobid`)
) ENGINE=InnoDB

