/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-27 22:31:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_email`
-- ----------------------------
DROP TABLE IF EXISTS `user_email`;
CREATE TABLE `user_email` (
  `ue_id` varchar(64) NOT NULL COMMENT '主键,邮件ID',
  `email_sender` varchar(64) DEFAULT NULL COMMENT '邮件发送者ID',
  `email_receiver` varchar(64) DEFAULT NULL COMMENT '邮件接收者ID',
  `email_title` varchar(512) DEFAULT NULL COMMENT '邮件标题',
  `email_content` varchar(1024) DEFAULT NULL COMMENT '邮件内容',
  `email_status` varchar(2) DEFAULT NULL COMMENT '邮件的状态，0表示未读，1表示已读',
  `created_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_email
-- ----------------------------
INSERT INTO `user_email` VALUES ('246bd849c9bdebbc', '1', '1', null, 'aaaa', null, '2016-07-17 19:31:36', '2016-07-17 19:31:36');
INSERT INTO `user_email` VALUES ('45400d83fbfe998b', '1', '1', null, '你哈啊', null, '2016-07-17 19:27:18', '2016-07-17 19:27:18');
INSERT INTO `user_email` VALUES ('48b914fba8743483', '1', '1', null, 'asdasd', null, '2016-07-17 19:35:59', '2016-07-17 19:35:59');
INSERT INTO `user_email` VALUES ('553d4000bad300e2', '1', '1', null, 'aaa', null, '2016-07-17 19:29:26', '2016-07-17 19:29:26');
INSERT INTO `user_email` VALUES ('6f87469cb5ee4c64', '1', '1', null, 'adsasd', null, '2016-07-17 20:11:21', '2016-07-17 20:11:21');
INSERT INTO `user_email` VALUES ('7c73325488411080', '1', '1', null, '你好吗？？？？？', null, '2016-07-17 19:13:01', '2016-07-17 19:13:01');
INSERT INTO `user_email` VALUES ('82d7e7e6b4cc8b24', '1', '1', null, 'ada', null, '2016-07-17 19:31:14', '2016-07-17 19:31:14');
INSERT INTO `user_email` VALUES ('924f7eb442f91c86', '1', '1', null, 'dasdasas', null, '2016-07-17 19:29:54', '2016-07-17 19:29:54');
INSERT INTO `user_email` VALUES ('9c0f44fa68852fc3', '1', '1', null, 'asdasas', null, '2016-07-17 19:32:54', '2016-07-17 19:32:54');
INSERT INTO `user_email` VALUES ('a954fa49f4941f98', '1', '1', null, '你好！', null, '2016-07-17 19:09:59', '2016-07-17 19:09:59');
INSERT INTO `user_email` VALUES ('f2e7877442d1a57b', '1', '3', null, '', null, '2016-07-17 16:39:51', '2016-07-17 16:39:51');
