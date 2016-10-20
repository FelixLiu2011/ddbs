/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-07 21:31:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gift`
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
  `gift_id` varchar(32) NOT NULL DEFAULT '' COMMENT '礼物表的ID,该礼物表存的是静态礼物',
  `gift_url` varchar(500) DEFAULT NULL COMMENT '礼物的图片路径',
  `gift_price` varchar(32) DEFAULT NULL COMMENT '礼物的单价',
  `gift_property` varchar(8) DEFAULT NULL COMMENT '区别礼物的性质，"0"表示虚拟,"1"表示',
  `gift_name` varchar(64) DEFAULT NULL COMMENT '礼物名称',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gift
-- ----------------------------
INSERT INTO `gift` VALUES ('1', '/business/gift/images/watch1.jpg', '399', '0', '电子表');
INSERT INTO `gift` VALUES ('2', '/business/gift/images/watch2.jpg', '299', '0', '机械表');
INSERT INTO `gift` VALUES ('3', '/business/gift/images/watch3.jpg', '199', '0', '智能表');
INSERT INTO `gift` VALUES ('4', '/business/gift/images/watch4.jpg', '100', '0', '名牌表');
INSERT INTO `gift` VALUES ('5', '/business/gift/images/watch5.jpg', '1999', '0', '土豪表');
