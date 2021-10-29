CREATE TABLE `procnfs` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `nfs_numcalls_rate` bigint(20) NOT NULL,
  `nfs_create_rate` bigint(20) NOT NULL,
  `nfs_read_bytes_rate` bigint(20) NOT NULL,
  `nfs_write_bytes_rate` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

