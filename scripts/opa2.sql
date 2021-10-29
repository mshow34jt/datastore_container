CREATE TABLE `opa2` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `PortXmitData_rate` bigint(20) NOT NULL,
  `PortRcvData` bigint(20) NOT NULL,
  `PortXmitPkts` bigint(20) NOT NULL,
  `PortRcvPkts` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

