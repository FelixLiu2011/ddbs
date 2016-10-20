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
  `user_status` varchar(50) DEFAULT NULL COMMENT '用户状态(可以对用户进行相应的限制)',
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
/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-31 12:54:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_friend`
-- ----------------------------
DROP TABLE IF EXISTS `user_friend`;
CREATE TABLE `user_friend` (
  `uf_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户好友表的主键ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '关联的用户ID',
  `friend_id` varchar(32) DEFAULT NULL COMMENT '关联的好友ID',
  `friend_name` varchar(256) DEFAULT NULL COMMENT '好友名字',
  `group_id` varchar(64) DEFAULT NULL COMMENT '分组ID',
  `status` varchar(64) DEFAULT NULL COMMENT '0表示在申请列表中，非0用1表示是好友通过，拒绝就删掉该条好友记录',
  `created_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`uf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_friend
-- ----------------------------
INSERT INTO `user_friend` VALUES ('590c3e5d9471eb0c', '039bbb50491faff0', 'a7caeacb64c6eb53', 'test1', '1', '1', '2016-07-31 12:33:35', '2016-07-31 12:33:44');
INSERT INTO `user_friend` VALUES ('ca038658ab2418f9', 'a7caeacb64c6eb53', '039bbb50491faff0', 'admin', '1', '1', '2016-07-31 11:48:01', '2016-07-31 12:31:01');
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
DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict(
  sys_dict_id VARCHAR(32) PRIMARY KEY COMMENT '主键',
  sys_dict_type VARCHAR(32)COMMENT '字典类型',
  sys_dict_code VARCHAR(32) COMMENT '字典分类,以code来作字典分类',
  parent_code VARCHAR(32) COMMENT '上一级的字典code',
  create_date DATETIME DEFAULT now() COMMENT '创建时间',
  update_date DATETIME DEFAULT now() COMMENT '修改时间'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT '系统字典表';
/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : social_work

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-11 20:36:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_photo_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_photo_group`;
CREATE TABLE `user_photo_group` (
  `group_id` varchar(64) DEFAULT NULL COMMENT '日志分组的主键ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `group_name` varchar(64) DEFAULT NULL COMMENT '组名',
  `cover` varchar(128) DEFAULT NULL COMMENT '相册组的封面',
  `privilege` varchar(8) DEFAULT NULL COMMENT '权限,"0"表示自己可见,"1"表示好友可见,"2"表示所有人可见',
  `description` varchar(512) DEFAULT NULL COMMENT '相册组描述',
  `created_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_photo_group
-- ----------------------------
INSERT INTO `user_photo_group` VALUES ('aebf4ea69b758baf', '1', '相册名称', null, '1', '相册描述', '2016-07-09 20:22:17', '2016-07-09 20:22:17');
INSERT INTO `user_photo_group` VALUES ('10ad54ee3b5fded6', '1', '一只美丽的逗B', null, '1', '一只美丽的逗B一只美丽的逗B', '2016-07-09 22:03:45', '2016-07-09 22:03:45');
DROP TABLE IF EXISTS `user_photo`;
CREATE TABLE `user_photo` (
  `up_id` varchar(64) DEFAULT NULL COMMENT '照片表主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '关联的用户ID',
  `group_id` varchar(64) DEFAULT NULL COMMENT '关联的分组ID',
  `photo_description` varchar(256) DEFAULT NULL COMMENT '照片描述',
  `photo_url` varchar(256) DEFAULT NULL COMMENT '照片存储路径',
  `thumbnailUrl` varchar(256) DEFAULT NULL COMMENT '缩略图',
  `created_time` varchar(32) DEFAULT NULL COMMENT '创建的时间',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '更新的时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_photo
-- ----------------------------
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
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_blog`
-- ----------------------------
DROP TABLE IF EXISTS `user_blog`;
CREATE TABLE `user_blog` (
  `ub_id` varchar(64) DEFAULT NULL COMMENT '用户日志的主键ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '关联的用户ID',
  `group_id` varchar(16) DEFAULT NULL COMMENT '关联的分组ID',
  `blog_title` varchar(256) DEFAULT NULL COMMENT '日志标题',
  `blog_content` varchar(2000) DEFAULT NULL COMMENT '日志内容',
  `blog_privilege` varchar(8) DEFAULT NULL COMMENT '日志开放权限,0表示全部可见,1表示自己可见',
  `blog_tags` varchar(256) DEFAULT NULL COMMENT '日志标签，用逗号隔开',
  `created_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_blog
-- ----------------------------
INSERT INTO `user_blog` VALUES ('8a9e24ff4b0f9e02', '1', '1', '是是非非 你要勇敢去面对', '自由自在的飞 让梦纯粹 静候轮回', '0', 'heart', '2016-07-07 21:59:56', null);
INSERT INTO `user_blog` VALUES ('6d7f67429e2499b9', '1', '1', '将军', '当敌人是空 我战法无穷 我攻势如风 用单车入宫 辗过你懊丧的脸孔', '0', 'heart', '2016-07-07 22:00:48', null);
INSERT INTO `user_blog` VALUES ('8a9e24ff4b0f9e02', '1', '1', '是是非非 你要勇敢去面对', '自由自在的飞 让梦纯粹 静候轮回', '0', 'heart', '2016-07-07 21:59:56', null);
INSERT INTO `user_blog` VALUES ('6d7f67429e2493b9', '1', '1', '将军', '当敌人是空 我战法无穷 我攻势如风 用单车入宫 辗过你懊丧的脸孔', '0', 'heart', '2016-07-07 22:00:48', null);
INSERT INTO `user_blog` VALUES ('8a9e24ff4b0f9e12', '1', '1', '是是非非 你要勇敢去面对', '自由自在的飞 让梦纯粹 静候轮回', '0', 'heart', '2016-07-07 21:59:56', null);
INSERT INTO `user_blog` VALUES ('6d7f67429e2439b9', '1', '1', '将军', '当敌人是空 我战法无穷 我攻势如风 用单车入宫 辗过你懊丧的脸孔', '0', 'heart', '2016-07-07 22:00:48', null);
DROP TABLE IF EXISTS blog_comment;

CREATE TABLE blog_comment (
  blog_comment_id   VARCHAR(32) PRIMARY KEY COMMENT '日志评论id',
  blog_id           VARCHAR(32) COMMENT '日志id',
  comment_user_id  VARCHAR(32) COMMENT '评论者的id',
  comment_content   VARCHAR(2000) COMMENT '评论内容',
  comment_parent_id VARCHAR(32) COMMENT '当对评论进行评论时，这个字段表示评论的id',
  comment_time      VARCHAR(32) COMMENT '评论时间'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT '日志评论表';/*
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
/*增加用户的头像字段*/
ALTER TABLE user_info ADD COLUMN head_photo_url VARCHAR(500);
COMMIT ;