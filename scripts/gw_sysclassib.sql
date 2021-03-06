CREATE TABLE `gw_sysclassib` (
  `cTime` bigint(20) unsigned NOT NULL,
  `cTime_usec` bigint(20) unsigned DEFAULT NULL,
  `DT` bigint(20) unsigned DEFAULT NULL,
  `DT_usec` bigint(20) unsigned DEFAULT NULL,
  `ProducerName` VARCHAR(64),
  `CompId` bigint(20) unsigned NOT NULL,
  `jobid` bigint(20) NOT NULL,
  `mlx5_symbol_error_rate` bigint(20) NOT NULL,
  `mlx5_port_rcv_error_rate` bigint(20) NOT NULL,
  `mlx5_port_rcv_remote_physical_error_rate` bigint(20) NOT NULL,
  `mlx5_port_rcv_switch_relay_error_rate` bigint(20) NOT NULL,
  `mlx5_port_xmit_discards_rate` bigint(20) NOT NULL,
  `mlx5_port_xmit_constraint_error_rate` bigint(20) NOT NULL,
  `mlx5_port_rcv_constraint_error_rate` bigint(20) NOT NULL,
  `mlx5_local_link_integrity_error_rate` bigint(20) NOT NULL,
  `mlx5_VL15_dropped_rate` bigint(20) NOT NULL,
  `mlx5_port_xmit_data_rate` bigint(20) NOT NULL,
  `mlx5_port_rcv_data_rate` bigint(20) NOT NULL,
  `mlx5_port_xmit_packets_rate` bigint(20) NOT NULL,
  `mlx5_port_rcv_packets_rate` bigint(20) NOT NULL,
  `mlx5_port_unicast_xmit_packets_rate` bigint(20) NOT NULL,
  `mlx5_port_unicast_rcv_packets_rate` bigint(20) NOT NULL,
  `mlx5_port_multicast_xmit_packets_rate` bigint(20) NOT NULL,
  `mlx5_port_multicast_rcv_packets_rate` bigint(20) NOT NULL,
   PRIMARY KEY (`cTime`,`CompId`),
   KEY `cTime` (`cTime`),
   KEY `CompId` (`CompId`)
) ENGINE=InnoDB;

