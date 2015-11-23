CREATE TABLE `twitter_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shorten_link` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `expand_link` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
