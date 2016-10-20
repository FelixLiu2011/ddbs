/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-11 21:42:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_message`
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `umId` varchar(64) DEFAULT NULL COMMENT '留言ID',
  `message_by` varchar(64) DEFAULT NULL COMMENT '留言者',
  `message_to` varchar(64) DEFAULT NULL COMMENT '留言给谁',
  `message_content` varchar(512) DEFAULT NULL COMMENT '留言内容',
  `created_time` varchar(32) DEFAULT NULL COMMENT '留言时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
