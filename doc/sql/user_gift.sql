/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-09 22:10:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_gift`
-- ----------------------------
DROP TABLE IF EXISTS `user_gift`;
CREATE TABLE `user_gift` (
  `ug_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户礼物表的主键ID',
  `gift_sender` varchar(64) DEFAULT NULL COMMENT '送礼物的人的ID',
  `gift_receiver` varchar(64) DEFAULT NULL COMMENT '礼物接收人的ID',
  `gift_count` varchar(64) DEFAULT NULL COMMENT '礼物数量',
  `gift_id` varchar(64) DEFAULT NULL COMMENT '礼物ID',
  `created_time` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(64) DEFAULT NULL COMMENT '更新时间',
  `gift_total_price` varchar(64) DEFAULT NULL COMMENT '送出或者接收的礼物的总价值',
  PRIMARY KEY (`ug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_gift
-- ----------------------------
