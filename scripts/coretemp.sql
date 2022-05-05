CREATE TABLE `coretemp` (
	  `cTime` bigint(20) unsigned NOT NULL,
	  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
	  `ProducerName` VARCHAR(64),
	  `CompId` bigint(20) unsigned NOT NULL,
	  `jobid` bigint(20) NOT NULL,
	  `apid` bigint(20) NOT NULL,
	  `maxTemp` int NOT NULL,
	  `avgTemp` int NOT NULL,
	   PRIMARY KEY (`cTime`,`CompId`),
	   KEY `cTime` (`cTime`),
	   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;
