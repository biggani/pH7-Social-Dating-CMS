--
--
-- Title:         SQL Schema Game Install File
--
-- Author:        Pierre-Henry Soria <ph7software@gmail.com>
-- Copyright:     (c) 2012-2014, Pierre-Henry Soria. All Rights Reserved.
-- License:       GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
-- Package:       PH7 / Install / Data / Sql
-- Version:       1.0
--
--

CREATE TABLE IF NOT EXISTS pH7_Games (
  gameId int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(120) NOT NULL,
  title varchar(120) NOT NULL,
  description varchar(255) NOT NULL,
  keywords varchar(255) NOT NULL,
  thumb varchar(200) NOT NULL,
  file varchar(200) NOT NULL,
  categoryId tinyint(4) unsigned NOT NULL DEFAULT '0',
  addedDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  downloads int(9) unsigned DEFAULT '0',
  votes int(9) unsigned DEFAULT '0',
  score float unsigned DEFAULT '0',
  views int(10) unsigned DEFAULT '0',
  PRIMARY KEY (gameId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS pH7_GamesCategories (
  categoryId smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (categoryId),
  UNIQUE KEY (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
