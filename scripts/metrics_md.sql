CREATE TABLE `metrics_md` (
  `order` smallint(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `string` varchar(255) NOT NULL,
  `divisor` int(11) NOT NULL DEFAULT '1',
  `units` varchar(255) NOT NULL DEFAULT 'units',
  `description` varchar(255) NOT NULL DEFAULT 'describe',
  `hidden` int(11) NOT NULL DEFAULT '0',
  `metric_table` varchar(255) NOT NULL,
  PRIMARY KEY (`name`,`metric_table`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
