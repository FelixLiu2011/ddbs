/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-04 16:43:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_recharge_records`
-- ----------------------------
DROP TABLE IF EXISTS `user_recharge_records`;
CREATE TABLE `user_recharge_records` (
  `ur_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户充值记录表主键',
  `recharge_mount` varchar(128) DEFAULT NULL COMMENT '充值金额',
  `recharge_time` varchar(32) DEFAULT NULL COMMENT '充值时间',
  `user_id` varchar(32) DEFAULT NULL COMMENT '充值的用户ID和user_info表对应',
  `recharge_to_user` varchar(32) DEFAULT NULL COMMENT '充值到哪个用户上',
  PRIMARY KEY (`ur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_recharge_records
-- ----------------------------
