CREATE TABLE `lustre_client` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `fs_name` VARCHAR(64),
  `open_rate` bigint(20) NOT NULL,
  `close_rate` bigint(20) NOT NULL,
  `seek_rate` bigint(20) NOT NULL,
  `getattr_rate` bigint(20) NOT NULL,
  `create_rate` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

