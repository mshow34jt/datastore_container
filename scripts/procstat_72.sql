CREATE TABLE `procstat_72` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `user_pct` bigint(20) NOT NULL,
  `nice_pct` bigint(20) NOT NULL,
  `sys_pct` bigint(20) NOT NULL,
  `idle_pct` bigint(20) NOT NULL,
  `iowait_pct` bigint(20) NOT NULL,
  `irq_rate` bigint(20) NOT NULL,
  `context_switches_rate` bigint(20) NOT NULL,
  `procs_running` bigint(20) NOT NULL,
  `procs_blocked` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

