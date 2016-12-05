/*
Navicat MySQL Data Transfer

Source Server         : 47.90.53.90
Source Server Version : 50633
Source Host           : 47.90.53.90:3306
Source Database       : social_work_ddbs

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2016-12-06 00:11:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zone_info`
-- ----------------------------
DROP TABLE IF EXISTS `zone_info`;
CREATE TABLE `zone_info` (
  `zone_id` varchar(32) NOT NULL DEFAULT '' COMMENT '动态ID,主键',
  `zone_content` varchar(5012) DEFAULT NULL COMMENT '动态内容',
  `zone_datetime` varchar(32) DEFAULT NULL COMMENT '动态发布时间',
  `zone_likecount` int(32) DEFAULT NULL COMMENT '动态喜欢数',
  `zone_gagaid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `zone_imgcount` int(32) DEFAULT NULL COMMENT '动态的图片数',
  `zone_state` varchar(8) DEFAULT NULL COMMENT '1代表xxxx',
  `zone_commentcount` int(32) unsigned DEFAULT NULL COMMENT '评论数',
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zone_info
-- ----------------------------
INSERT INTO `zone_info` VALUES ('c1330c6a6b4b109f', '', '2016-12-06 00:06:04', null, 'ff7da43749eb8b48', '1', null, null);
INSERT INTO `zone_info` VALUES ('feb5ca4bdbae85a2', '', '2016-12-06 00:05:02', null, 'ff7da43749eb8b48', '1', null, null);
