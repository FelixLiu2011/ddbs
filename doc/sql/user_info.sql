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
  `memb_gagaid` varchar(32) NOT NULL COMMENT '用户id--主键',
  `memb_gagano` varchar(50) DEFAULT NULL COMMENT '用户编号',
  `memb_light_gagano` varchar(50) DEFAULT NULL COMMENT '点亮的用户编号',
  `memb_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `memb_light_nickname` varchar(50) DEFAULT NULL COMMENT '点亮的用户昵称',
  `memb_date` varchar(50) DEFAULT NULL COMMENT '用户日期',
  `memb_birth` varchar(50) DEFAULT NULL COMMENT '用户生日',
  `memb_age` varchar(10) DEFAULT NULL COMMENT '用户年龄',
  `memb_sex` varchar(50) DEFAULT NULL COMMENT '用户性别,1是男性,2是女性',
  `memb_email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `memb_country` varchar(50) DEFAULT NULL COMMENT '用户国家代号',
  `memb_language` varchar(20) DEFAULT NULL COMMENT '用户语言',
  `memb_job` varchar(50) DEFAULT NULL COMMENT '工作',
  `memb_height` varchar(15) DEFAULT NULL COMMENT '身高,单位厘米',
  `memb_pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `memb_weight` varchar(50) DEFAULT NULL COMMENT '体重,单位kg',
  `memb_bigimg` varchar(100) DEFAULT NULL COMMENT '用户大图',
  `memb_registertime` varchar(50) DEFAULT NULL COMMENT '用户注册时间',
  `mefi_level` varchar(32) DEFAULT NULL COMMENT '用户会员等级',
  `mefi_isshowfirst` varchar(32) DEFAULT NULL COMMENT '是否显示在网站前面',
  `last_login` varchar(32) DEFAULT NULL COMMENT '最后登录时间',
  `if_online` varchar(32) DEFAULT NULL COMMENT '是否在线',
  `weight_val` varchar(32) DEFAULT NULL COMMENT '体重值',
  `is_hand` varchar(32) DEFAULT NULL COMMENT '是否手机',
  `memb_lable` varchar(512) DEFAULT NULL COMMENT '个人标签',
  `memb_country_code` varchar(16) DEFAULT NULL COMMENT '国家代码',
  `memb_signature` varchar(512) DEFAULT NULL COMMENT '个人签名',
  `memb_coin` varchar(32) DEFAULT NULL COMMENT '金币数',
  `memb_phone_no` varchar(32) DEFAULT NULL COMMENT '手机号',
  `meco_isopenperson` varchar(4) DEFAULT NULL COMMENT '是否公开个人信息',
  `meco_isonline` varchar(4) DEFAULT NULL COMMENT '是否显示我的在线状态',
  `meco_isallowaddfriend` varchar(4) DEFAULT NULL COMMENT '是否允许别人加我为好友',
  `meco_isletter` varchar(4) DEFAULT NULL COMMENT '是否信息通知',
  `meco_islike` varchar(4) DEFAULT NULL COMMENT '当有人喜欢时是否通知',
  `meco_isvisito` varchar(4) DEFAULT NULL COMMENT '当有访客时是否通知',
  `meco_isaddfriend` varchar(4) DEFAULT NULL COMMENT '暂无',
  `meco_isacceptgift` varchar(4) DEFAULT NULL COMMENT '是否接受礼物',
  `meco_iszone` varchar(4) DEFAULT NULL COMMENT '暂无',
  `meco_isbuy` varchar(4) DEFAULT NULL COMMENT '暂无',
  `meco_issound` varchar(4) DEFAULT NULL COMMENT '暂无',
  PRIMARY KEY (`memb_gagaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';