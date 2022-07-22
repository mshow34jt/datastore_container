CREATE TABLE `procnet` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `device` VARCHAR(64),
  `rx_bytes_rate` bigint(20) NOT NULL,
  `tx_bytes_rate` bigint(20) NOT NULL,
  `rx_packet_rate` bigint(20) NOT NULL,
  `tx_packet_rate` bigint(20) NOT NULL,
  `rx_error_rate` bigint(20) NOT NULL,
  `tx_error_rate` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

