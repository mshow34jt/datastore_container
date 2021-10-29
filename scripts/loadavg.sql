CREATE TABLE `loadavg` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `load1min` int NOT NULL,
  `load5min` int NOT NULL,
  `load15min` int NOT NULL,
  `runnable` int NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

