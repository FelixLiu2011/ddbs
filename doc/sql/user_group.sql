/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-31 17:00:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户分组表的主键ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `group_name` varchar(64) DEFAULT NULL COMMENT '组名',
  `use_property` varchar(16) DEFAULT NULL COMMENT '使用属性(1是好友分组，2是相册分组，3是日志分组)',
  `created_time` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(64) DEFAULT NULL COMMENT '更新时间',
  `level` varchar(2) DEFAULT NULL COMMENT '分组的等级,0表示系统级别，暂无其他级别',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '1000', '默认分组', '1', '2016-07-31 11:33:31', '2016-07-31 11:33:31', '0');
INSERT INTO `user_group` VALUES ('2', '1000', '默认分组', '2', '2016-07-31 11:33:31', '2016-07-31 11:33:31', '0');
