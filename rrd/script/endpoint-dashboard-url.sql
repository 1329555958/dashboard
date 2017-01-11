/**
* 创建counter对应的描述信息
* mysql -h localhost -u root --password="" < counter-desp.sql
 */
USE graph;
SET NAMES utf8;

DROP TABLE IF EXISTS `graph`.`endpoint_dashboard_url`;
CREATE TABLE `graph`.`endpoint_dashboard_url` (
  `id`       INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `endpoint`  VARCHAR(255)     NOT NULL DEFAULT '',
  `url`     VARCHAR(255)      NOT NULL DEFAULT ''
  COMMENT '链接到监控页面',
  `t_modify` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'last modify time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_endpoint_id_counter` (`endpoint`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = utf8;

ALTER TABLE graph.endpoint_dashboard_url CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;

