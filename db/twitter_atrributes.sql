CREATE TABLE `twitter_attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `link_status` int(11) unsigned DEFAULT NULL COMMENT '1 = internal, 2 = magazin, 3 = external',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
