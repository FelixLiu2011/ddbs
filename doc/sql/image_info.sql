/*
Navicat MySQL Data Transfer

Source Server         : 47.90.53.90
Source Server Version : 50633
Source Host           : 47.90.53.90:3306
Source Database       : social_work_ddbs

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2016-12-06 00:11:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `image_info`
-- ----------------------------
DROP TABLE IF EXISTS `image_info`;
CREATE TABLE `image_info` (
  `zoim_id` varchar(32) NOT NULL DEFAULT '' COMMENT '图片ID,主键',
  `zoim_gagaid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `zoim_zoneid` varchar(32) DEFAULT NULL COMMENT '此条动态ID',
  `zoim_imgurl` varchar(128) DEFAULT NULL COMMENT '图片地址',
  `zoim_sort` int(8) DEFAULT NULL COMMENT '排序，从0开始',
  `zoim_state` varchar(8) DEFAULT NULL COMMENT '1代表xxxx',
  `zoim_isrecommend` varchar(8) DEFAULT NULL COMMENT '1代表xxxx',
  `zoim_likecount` int(16) DEFAULT NULL COMMENT '喜欢这张图片的数量',
  `zoim_time` varchar(32) DEFAULT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`zoim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image_info
-- ----------------------------
INSERT INTO `image_info` VALUES ('43434ac8d41eca14', 'ff7da43749eb8b48', 'feb5ca4bdbae85a2', 'P_43b6ce646fd8e8e8', null, null, null, null, '2016-12-06 00:05:02');
INSERT INTO `image_info` VALUES ('6041b99aca74bd8a', 'ff7da43749eb8b48', 'c1330c6a6b4b109f', 'P_2b641f4607bcca23', null, null, null, null, '2016-12-06 00:06:04');
