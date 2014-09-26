
-- 6. SQL set-up
-- 6.1 Explanation of entities
-- Below on entity level, follows a short description of the entities used in our data model.
-- Category – table that holds the category structure information. Category names can be found in 
-- ‘vocabulary’, referenced via the ‘sid’ key
-- Category feature – link between feature and category
-- Category feature group – a group that holds a number of category features, to group them for display
-- Category keywords – category keywords that can be used for a search
-- Feature – holds the information about the features available for product description
-- Feature group – a generic features groups available in Icecat
-- Language – identifier of the language of a data element
-- Measure – units, e.g. meter, megabyte etc
-- Product – main information about the product
-- Product bundled – in case that a product is a distri bundle, info about components is here
-- Product description – language specific description
-- Product family – product lines families per supplier & category
-- Product series – product lines series per supplier, category & family
-- Product feature – product specs features are here. resolution of features/measures is via - > 
-- category_feature -feature -> measure
-- Product gallery – some more product images
-- Product multimedia object – place for storing multimedia data, like swf, animated gifs, etc
-- Product related product cross-sell-relations or alternatives are stored here. The type of link can be 
-- determenined by categories. e.g. if the categories are the same -> link gives an “alternative”. Categories 
-- are different -> link is “option”.
-- Sid index – table for holding the autoincrement index for the vocabulary. needed only in case of issuing 
-- new records to the vocabulary
-- Supplier – manufacturers are stored in this table
-- Tex – vocabulary for large data elements
-- Tid index – index of tex table 
-- Vocabulary – table for storing misc language dependent data

CREATE TABLE `category` (
 `catid` int(13) NOT NULL AUTO_INCREMENT,
 `ucatid` varchar(255) DEFAULT NULL,
 `pcatid` int(13) NOT NULL DEFAULT '1',
 `sid` int(13) NOT NULL DEFAULT '0',
 `tid` int(13) DEFAULT NULL,
 `searchable` int(3) NOT NULL DEFAULT '0',
 `low_pic` varchar(255) NOT NULL DEFAULT '', 
 `thumb_pic` varchar(255) DEFAULT '',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `last_published` int(14) DEFAULT '0',
 `watched_top10` int(3) NOT NULL DEFAULT '0',
 `visible` int(3) NOT NULL DEFAULT '0',
 `ssid` int(13) NOT NULL,
 PRIMARY KEY (`catid`),
 UNIQUE KEY `ucatid` (`ucatid`),
 KEY `pcatid` (`pcatid`),
 KEY `catid` (`catid`,`sid`),
 KEY `searchable_2` (`searchable`,`catid`),
 KEY `sid_index` (`sid`),
 KEY `visible` (`visible`,`catid`),
 KEY `ssid` (`ssid`)
) ENGINE=MyISAM;


CREATE TABLE `category_feature` (
 `category_feature_id` int(13) NOT NULL AUTO_INCREMENT,
`feature_id` int(13) NOT NULL DEFAULT '0',
 `catid` int(13) NOT NULL DEFAULT '0',
 `no` int(5) NOT NULL DEFAULT '0',
 `searchable` int(3) NOT NULL DEFAULT '0',
 `category_feature_group_id` int(13) NOT NULL DEFAULT '0',
 `restricted_search_values` mediumtext,
 `use_dropdown_input` char(3) DEFAULT '',
 `mandatory` tinyint(2) DEFAULT '0',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`category_feature_id`),
 UNIQUE KEY `feature_id` (`feature_id`,`catid`),
 KEY `catid` (`catid`),
 KEY `category_feature_id` (`category_feature_id`,`feature_id`)
) ENGINE=MyISAM;

CREATE TABLE `category_feature_group` (
 `category_feature_group_id` int(13) NOT NULL AUTO_INCREMENT,
 `catid` int(13) NOT NULL DEFAULT '0',
 `feature_group_id` int(13) NOT NULL DEFAULT '0',
 `no` int(15) DEFAULT '0',
 PRIMARY KEY (`category_feature_group_id`),
 UNIQUE KEY `catid` (`catid`,`feature_group_id`)
) ENGINE=MyISAM;

CREATE TABLE `category_keywords` (
 `category_id` int(11) DEFAULT NULL,
 `langid` int(1) NOT NULL DEFAULT '0',
 `keywords` mediumtext,
 `id` int(11) NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (`id`),
 UNIQUE KEY `langid` (`langid`,`category_id`),
 KEY `category_id` (`category_id`),
 FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM;

CREATE TABLE `feature` (
 `feature_id` int(13) NOT NULL AUTO_INCREMENT,
 `sid` int(13) NOT NULL DEFAULT '0',
 `tid` int(13) NOT NULL DEFAULT '0',
 `measure_id` int(13) NOT NULL DEFAULT '0',
 `type` varchar(60) NOT NULL DEFAULT '',
 `class` tinyint(3) NOT NULL DEFAULT '0',
 `limit_direction` tinyint(3) NOT NULL DEFAULT '0',
 `searchable` tinyint(3) NOT NULL DEFAULT '0',
 `restricted_values` mediumtext,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `last_published` int(14) DEFAULT '0',
 PRIMARY KEY (`feature_id`),
 KEY `tid` (`tid`),
 KEY `sid` (`sid`)
) ENGINE=MyISAM;

CREATE TABLE `feature_group` (
 `feature_group_id` int(13) NOT NULL AUTO_INCREMENT,
 `sid` int(13) NOT NULL DEFAULT '0',
 PRIMARY KEY (`feature_group_id`),
 KEY `sid` (`sid`)
) ENGINE=MyISAM;


CREATE TABLE `language` (
 `langid` int(3) NOT NULL AUTO_INCREMENT,
 `sid` int(13) NOT NULL DEFAULT '0',
 `code` varchar(32) NOT NULL DEFAULT '',
 `short_code` varchar(5) NOT NULL DEFAULT '',
 `published` char(1) NOT NULL DEFAULT 'N',
 `backup_langid` int(3) DEFAULT NULL,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`langid`),
 KEY `short_code` (`short_code`)
) ENGINE=MyISAM;

CREATE TABLE `measure` (
 `measure_id` int(13) NOT NULL AUTO_INCREMENT,
 `sid` int(13) NOT NULL DEFAULT '0',
 `tid` int(13) NOT NULL DEFAULT '0',
 `sign` varchar(255) DEFAULT NULL,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `last_published` int(14) DEFAULT '0',
 `system_of_measurement` enum('metric','imperial') NOT NULL DEFAULT 'metric',
 PRIMARY KEY (`measure_id`),
 KEY `sid` (`sid`),
 KEY `tid` (`tid`),
  KEY `updated` (`updated`),
 KEY `last_published` (`last_published`)
) ENGINE=MyISAM;


CREATE TABLE `measure_sign` (
 `measure_sign_id` int(13) NOT NULL AUTO_INCREMENT,
 `measure_id` int(13) NOT NULL DEFAULT '0',
 `langid` int(13) NOT NULL DEFAULT '0',
 `value` varchar(255) NOT NULL DEFAULT '',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `last_published` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
 PRIMARY KEY (`measure_sign_id`),
 UNIQUE KEY `measure_id` (`measure_id`,`langid`)
) ENGINE=MyISAM;

CREATE TABLE `product` (
 `product_id` int(13) NOT NULL AUTO_INCREMENT,
 `supplier_id` int(13) NOT NULL DEFAULT '0',
 `prod_id` varchar(60) NOT NULL DEFAULT '',
 `catid` int(13) NOT NULL DEFAULT '0',
 `user_id` int(13) NOT NULL DEFAULT '1',
 `launch_date` int(17) DEFAULT NULL,
 `obsolence_date` int(17) DEFAULT NULL,
 `name` varchar(255) NOT NULL DEFAULT '',
 `low_pic` varchar(255) NOT NULL DEFAULT '',
 `high_pic` varchar(255) NOT NULL DEFAULT '',
 `publish` char(1) NOT NULL DEFAULT 'Y',
 `public` char(1) NOT NULL DEFAULT 'Y',
 `thumb_pic` varchar(255) DEFAULT NULL,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `date_added` date NOT NULL DEFAULT '2004-11-01',
 `family_id` int(13) NOT NULL DEFAULT '0',
 `dname` varchar(255) NOT NULL DEFAULT '',
  `topseller` varchar(255) NOT NULL DEFAULT '',
 `low_pic_size` int(13) DEFAULT '0',
 `high_pic_size` int(13) DEFAULT '0',
 `thumb_pic_size` int(13) DEFAULT '0',
 `high_pic_width` int(13) NOT NULL DEFAULT '0',
 `high_pic_height` int(13) NOT NULL DEFAULT '0',
 `low_pic_width` int(13) NOT NULL DEFAULT '0',
 `low_pic_height` int(13) NOT NULL DEFAULT '0',
 `high_pic_origin` varchar(255) NOT NULL DEFAULT '',
 `series_id` int(17) NOT NULL DEFAULT '1',
 `checked_by_supereditor` tinyint(1) NOT NULL DEFAULT '0',
 `medium_pic` varchar(255) NOT NULL,
 `medium_pic_size` int(13) NOT NULL,
 `medium_pic_width` int(13) NOT NULL,
 `medium_pic_height` int(13) NOT NULL,
 `high_pic_origin_size` int(13) NOT NULL,
 PRIMARY KEY (`product_id`),
 UNIQUE KEY `prod_id_2` (`prod_id`,`supplier_id`),
 KEY `user_id` (`user_id`),
 KEY `date_added` (`date_added`),
 KEY `name` (`name`),
 KEY `supplier_id_2` (`supplier_id`,`catid`),
 KEY `publish` (`publish`,`public`),
 KEY `catid` (`catid`,`updated`),
 KEY `updated` (`updated`),
 KEY `catid_2` (`catid`,`supplier_id`,`product_id`)
) ENGINE=InnoDB;


CREATE TABLE `product_description` (
 `product_description_id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `langid` int(13) NOT NULL DEFAULT '0',
 `short_desc` varchar(3000) NOT NULL DEFAULT '',
  `long_desc` mediumtext NOT NULL,
 `specs_url` varchar(255) NOT NULL DEFAULT '',
 `support_url` varchar(255) NOT NULL DEFAULT '',
 `official_url` text,
 `warranty_info` mediumtext,
 `option_field_1` mediumtext,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `pdf_url` varchar(255) NOT NULL DEFAULT '',
 `option_field_2` mediumtext,
 `pdf_size` int(13) DEFAULT '0',
 `manual_pdf_url` varchar(255) NOT NULL DEFAULT '',
 `manual_pdf_size` int(13) DEFAULT '0',
 `pdf_url_origin` text,
 `manual_pdf_url_origin` text,
 `pdf_updated` int(13) NOT NULL DEFAULT '0',
 `manual_pdf_updated` int(13) NOT NULL DEFAULT '0',
 PRIMARY KEY (`product_description_id`),
 UNIQUE KEY `product_id` (`product_id`,`langid`),
 KEY `updated` (`updated`)
) ENGINE=InnoDB;

CREATE TABLE `product_family` (
 `family_id` int(17) NOT NULL AUTO_INCREMENT,
 `parent_family_id` int(17) NOT NULL DEFAULT '1',
 `supplier_id` int(17) NOT NULL DEFAULT '0',
 `sid` int(13) NOT NULL DEFAULT '0',
 `tid` int(13) NOT NULL DEFAULT '0',
 `low_pic` varchar(255) DEFAULT NULL,
 `thumb_pic` varchar(255) DEFAULT NULL,
 `catid` int(13) NOT NULL DEFAULT '0',
 `data_source_id` int(13) NOT NULL DEFAULT '0',
 `symbol` varchar(120) NOT NULL DEFAULT '',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`family_id`),
 KEY `supplier_id_3` (`supplier_id`,`sid`),
 KEY `sid` (`sid`,`supplier_id`),
 KEY `data_source_id` (`data_source_id`),
 KEY `symbol` (`symbol`)
) ENGINE=MyISAM;


CREATE TABLE `product_series` (
 `series_id` int(17) NOT NULL AUTO_INCREMENT,
 `sid` int(13) NOT NULL,
 `tid` int(13) NOT NULL,
 `supplier_id` int(17) NOT NULL,
 `catid` int(13) NOT NULL,
 `family_id` int(17) NOT NULL,
 PRIMARY KEY (`series_id`),
 KEY `sid` (`sid`),
 KEY `supplier_id` (`supplier_id`),
 KEY `family_id` (`family_id`)
) ENGINE=MyISAM;

CREATE TABLE `product_feature` (
 `product_feature_id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `category_feature_id` mediumint(8) unsigned NOT NULL,
 `value` varchar(20000) NOT NULL DEFAULT '',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`product_feature_id`),
 UNIQUE KEY `category_feature_id_2` (`category_feature_id`,`product_id`),
 KEY `product_id` (`product_id`),
 KEY `value` (`value`(255)),
 KEY `updated` (`updated`),
 KEY `category_feature_id` (`category_feature_id`,`value`(250))
 ) ENGINE=InnoDB;
 
 
CREATE TABLE `product_feature_local` (
 `product_feature_local_id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `category_feature_id` int(13) NOT NULL DEFAULT '0',
 `value` varchar(15000) NOT NULL DEFAULT '',
 `langid` int(5) NOT NULL DEFAULT '0',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (`product_feature_local_id`),
 UNIQUE KEY `category_feature_id` (`category_feature_id`,`product_id`,`langid`),
 KEY `product_id` (`product_id`,`langid`),
 KEY `langid` (`langid`),
 KEY `value` (`value`(250))
) ENGINE=InnoDB;


CREATE TABLE `product_gallery` (
 `id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `link` varchar(255) NOT NULL DEFAULT '',
 `thumb_link` varchar(255) NOT NULL DEFAULT '',
 `height` int(10) NOT NULL DEFAULT '0',
 `width` int(10) NOT NULL DEFAULT '0',
 `size` int(15) NOT NULL DEFAULT '0',
 `quality` tinyint(2) DEFAULT '0',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `thumb_size` int(15) NOT NULL DEFAULT '0',
 `link_origin` varchar(255) NOT NULL DEFAULT '',
 `low_link` varchar(255) NOT NULL,
 `medium_link` varchar(255) NOT NULL,
 `low_height` int(13) NOT NULL,
 `medium_height` int(13) NOT NULL,
 `low_width` int(13) NOT NULL,
 `medium_width` int(13) NOT NULL,
 `low_size` int(13) NOT NULL,
 `medium_size` int(13) NOT NULL,
 `size_origin` int(13) NOT NULL,
 `langid` int(3) NOT NULL DEFAULT '0',
 PRIMARY KEY (`id`),
 UNIQUE KEY `product_id_2` (`product_id`,`link`),
 KEY `updated` (`updated`),
 KEY `product_id` (`product_id`,`langid`)
) ENGINE=MyISAM;


CREATE TABLE `product_multimedia_object` (
 `id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `link` varchar(255) NOT NULL DEFAULT '',
 `short_descr` mediumtext NOT NULL,
 `langid` int(13) NOT NULL DEFAULT '0',
 `size` int(15) NOT NULL DEFAULT '0',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `content_type` varchar(255) NOT NULL DEFAULT '',
 `keep_as_url` int(1) NOT NULL DEFAULT '0',
`type` varchar(255) NOT NULL DEFAULT 'standard',
 `height` int(13) NOT NULL DEFAULT '0',
 `width` int(13) NOT NULL DEFAULT '0',
 `data_source_id` int(13) NOT NULL DEFAULT '0',
 `link_origin` varchar(255) NOT NULL DEFAULT '',
 PRIMARY KEY (`id`),
 UNIQUE KEY `product_id_3` (`product_id`,`langid`,`link`(200)),
 KEY `product_id` (`product_id`,`updated`),
 KEY `product_id_2` (`product_id`,`langid`),
 KEY `data_source_id` (`data_source_id`,`product_id`),
 KEY `type` (`type`),
 KEY `updated` (`updated`)
) ENGINE=MyISAM;


CREATE TABLE `product_related` (
 `product_related_id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `rel_product_id` int(13) NOT NULL DEFAULT '0',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `preferred_option` tinyint(1) NOT NULL DEFAULT '0',
 `data_source_id` int(13) NOT NULL DEFAULT '0',
 `order` smallint(5) unsigned NOT NULL DEFAULT '65535',
 PRIMARY KEY (`product_related_id`),
 UNIQUE KEY `product_id` (`product_id`,`rel_product_id`),
 KEY `rel_product_id` (`rel_product_id`),
 KEY `data_source_id` (`data_source_id`,`product_id`,`rel_product_id`)
) ENGINE=InnoDB;

CREATE TABLE `product_review` (
 `product_review_id` int(13) NOT NULL AUTO_INCREMENT,
 `product_id` int(13) NOT NULL DEFAULT '0',
 `langid` int(13) NOT NULL DEFAULT '0',
 `review_group` varchar(60) NOT NULL DEFAULT '',
 `review_code` varchar(60) NOT NULL DEFAULT '',
 `review_id` int(13) NOT NULL DEFAULT '0',
 `score` int(13) NOT NULL DEFAULT '0',
 `url` varchar(255) NOT NULL DEFAULT '',
 `logo_url` varchar(255) NOT NULL DEFAULT '',
 `value` blob,
 `value_good` blob,
 `value_bad` blob,
 `postscriptum` blob,
 `review_award_name` varchar(120) NOT NULL DEFAULT '',
 `high_review_award_url` varchar(255) NOT NULL DEFAULT '',
 `low_review_award_url` varchar(255) NOT NULL DEFAULT '',
 `date_added` date DEFAULT NULL,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`product_review_id`),
 UNIQUE KEY `product_id` (`product_id`,`review_id`,`langid`),
 KEY `date_added` (`date_added`),
 KEY `review_group` (`review_group`,`product_id`),
 KEY `updated` (`updated`)
) ENGINE=MyISAM;


CREATE TABLE `sid_index` (
 `sid` int(13) NOT NULL AUTO_INCREMENT,
 `dummy` int(1) DEFAULT NULL,
 PRIMARY KEY (`sid`)
) ENGINE=MyISAM;


CREATE TABLE `supplier` (
 `supplier_id` int(13) NOT NULL AUTO_INCREMENT,
 `user_id` int(13) NOT NULL DEFAULT '1',
 `name` varchar(255) NOT NULL DEFAULT '',
 `low_pic` varchar(255) DEFAULT NULL,
 `thumb_pic` varchar(255) DEFAULT NULL,
 `acknowledge` char(1) NOT NULL DEFAULT 'N',
 `is_sponsor` char(1) NOT NULL DEFAULT 'N',
 `public_login` varchar(80) DEFAULT '',
 `public_password` varchar(80) DEFAULT '',
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `last_published` int(14) DEFAULT '0',
 `ftp_homedir` varchar(255) DEFAULT NULL,
 `template` mediumtext,
 `folder_name` varchar(255) NOT NULL DEFAULT '',
 `suppress_offers` char(1) NOT NULL DEFAULT 'N',
 `last_name` varchar(255) NOT NULL DEFAULT '',
 `prod_id_regexp` text,
 `has_vendor_index` tinyint(1) NOT NULL DEFAULT '0',
 `hide_products` tinyint(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (`supplier_id`),
 UNIQUE KEY `name` (`name`),
 KEY `is_sponsor` (`is_sponsor`),
 KEY `public_login` (`public_login`),
 KEY `folder_name` (`folder_name`),
 KEY `updated` (`updated`),
 FULLTEXT KEY `fulltext_name` (`name`)
) ENGINE=MyISAM;

CREATE TABLE `tex` (
 `tex_id` int(13) NOT NULL AUTO_INCREMENT,
 `tid` int(13) NOT NULL DEFAULT '0',
 `langid` int(3) NOT NULL DEFAULT '0',
 `value` mediumtext,
 PRIMARY KEY (`tex_id`),
 UNIQUE KEY `tid` (`tid`,`langid`),
 KEY `langid` (`langid`)
) ENGINE=MyISAM;


CREATE TABLE `tid_index` (
 `tid` int(13) NOT NULL AUTO_INCREMENT,
 `dummy` int(1) DEFAULT NULL,
 PRIMARY KEY (`tid`)
) ENGINE=MyISAM;


CREATE TABLE `vocabulary` (
 `record_id` int(13) NOT NULL AUTO_INCREMENT,
 `sid` int(13) NOT NULL DEFAULT '0',
 `langid` int(3) NOT NULL DEFAULT '0',
 `value` varchar(255) DEFAULT NULL,
 `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
 UNIQUE KEY `sid_2` (`sid`,`langid`),
 KEY `langid` (`langid`),
 KEY `updated` (`updated`)
) ENGINE=MyISAM;


