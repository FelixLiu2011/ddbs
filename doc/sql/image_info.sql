/*
Navicat MySQL Data Transfer

Source Server         : 47.90.53.90
Source Server Version : 50633
Source Host           : 47.90.53.90:3306
Source Database       : social_work_ddbs

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2016-12-12 21:27:10
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
  `zone_imgcount` int(32) DEFAULT NULL COMMENT '和这张图片一起的组的图片数量',
  PRIMARY KEY (`zoim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image_info
-- ----------------------------
INSERT INTO `image_info` VALUES ('a00435a82f4354a9', 'ff7da43749eb8b48', '9178abec9c94525b', 'P_1745bd2f85b4a7da', '0', '1', '1', null, '2016-12-12 20:56:50', '1');
INSERT INTO `image_info` VALUES ('bab3fa438da3c6eb', 'ff7da43749eb8b48', '48e0ae40af9d2432', 'P_f309471fbdd02e65', '0', null, null, null, '2016-12-06 22:43:06', '1');
