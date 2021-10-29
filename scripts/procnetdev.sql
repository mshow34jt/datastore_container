CREATE TABLE `procnetdev` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `eth0_rx_bytes_rate` bigint(20) NOT NULL,
  `eth0_tx_bytes_rate` bigint(20) NOT NULL,
  `eth2_rx_bytes_rate` bigint(20) NOT NULL,
  `eth2_tx_bytes_rate` bigint(20) NOT NULL,
  `ib0_rx_bytes_rate` bigint(20) NOT NULL,
  `ib0_tx_bytes_rate` bigint(20) NOT NULL,
  `ib1_rx_bytes_rate` bigint(20) NOT NULL,
  `ib1_tx_bytes_rate` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

