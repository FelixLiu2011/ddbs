/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-29 23:38:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id--主键',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_pwd` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `user_email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `user_height` varchar(50) DEFAULT NULL COMMENT '用户身高',
  `user_weight` varchar(50) DEFAULT NULL COMMENT '用户体重',
  `user_sex` varchar(10) DEFAULT NULL COMMENT '用户性别(只存储数据字典值)',
  `user_contury` varchar(50) DEFAULT NULL COMMENT '所属国家',
  `user_birth` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `user_religion` varchar(50) DEFAULT NULL COMMENT '宗教信仰',
  `user_education` varchar(50) DEFAULT NULL COMMENT '教育',
  `user_declaration` varchar(50) DEFAULT NULL COMMENT '交友誓言',
  `user_enroll` varchar(50) DEFAULT NULL COMMENT '年收入(只存储数据字典值)',
  `user_marry_status` varchar(50) DEFAULT NULL COMMENT '婚姻状态(只存储数据字典值)',
  `user_status` varchar(50) DEFAULT NULL COMMENT '用户状态(可以对用户进行相应的限制,0表示中国用户,需要审核)',
  `created_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('094cc57a43de93f6', 'huahua5', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('1', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'test@163.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('1e948e5ae4cce512', 'optiad', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('2', 'zhangsan', '827ccb0eea8a706c4c34a16891f84e7b', 'zhangsan@163.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('259344e8905f7c2a', 'optiazva', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('2c05a34963add4e2', 'ningning', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('3be93db44701ae51', 'huahua4', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('6d3e29f5415b9e2c', 'huahua3', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('7ba5f110dba4a6cb', 'tafal', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('9588436586644420', 'uuyue', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('a5512c81c4dadaae', 'huahua2', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('a75e4a5ba8710327', 'huanhuan', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('c6142a6a85b391cf', 'huahua1', '827ccb0eea8a706c4c34a16891f84e7b', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('d76ac2f89a4adfa4', 'huahua', 'e10adc3949ba59abbe56e057f20f883e', '377932309@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null);
