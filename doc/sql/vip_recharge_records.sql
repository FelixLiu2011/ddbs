/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-06 20:52:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `vip_recharge_records`
-- ----------------------------
DROP TABLE IF EXISTS `vip_recharge_records`;
CREATE TABLE `vip_recharge_records` (
  `records_id` varchar(32) NOT NULL DEFAULT '' COMMENT '充值记录id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '花钱的用户ID和user_info表对应',
  `recharge_to_user` varchar(32) DEFAULT NULL COMMENT '充值到哪个用户上',
  `vip_code` varchar(100) DEFAULT NULL COMMENT '充值的vip类型',
  `recharge_money_count` varchar(10) DEFAULT NULL COMMENT '充值花了多少钱',
  `recharge_months_count` varchar(10) DEFAULT NULL COMMENT '充值的是多少个月',
  `recharge_date` varchar(64) DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`records_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip_recharge_records
-- ----------------------------
