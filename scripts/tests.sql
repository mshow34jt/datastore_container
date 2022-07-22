create table tests(
 `id` int(11), 
 testName VARCHAR(64),
 testType VARCHAR(64),
 typeId VARCHAR(64),
 duration int,
 metric TEXT,
 threshold bigint(20),
 calc varchar(64),
 grouping varchar(64),
 filters varchar(128),
 PRIMARY KEY (`id`),
 KEY `testName` (`testName`)
) ENGINE=InnoDB

