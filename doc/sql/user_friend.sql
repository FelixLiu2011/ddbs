  /*
  Navicat MySQL Data Transfer

  Source Server         : root
  Source Server Version : 50624
  Source Host           : localhost:3306
  Source Database       : social_work

  Target Server Type    : MYSQL
  Target Server Version : 50624
  File Encoding         : 65001

  Date: 2016-07-31 12:54:17
  */

  SET FOREIGN_KEY_CHECKS=0;

  -- ----------------------------
  -- Table structure for `user_friend`
  -- ----------------------------
  DROP TABLE IF EXISTS `user_friend`;
  CREATE TABLE `user_friend` (
    `uf_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户好友表的主键ID',
    `user_id` varchar(64) DEFAULT NULL COMMENT '关联的用户ID',
    `friend_id` varchar(32) DEFAULT NULL COMMENT '关联的好友ID',
    `friend_name` varchar(256) DEFAULT NULL COMMENT '好友名字',
    `group_id` varchar(64) DEFAULT NULL COMMENT '分组ID',
    `status` varchar(64) DEFAULT NULL COMMENT '0表示在申请列表中，非0用1表示是好友通过，拒绝就删掉该条好友记录',
    `created_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
    `updated_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`uf_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
