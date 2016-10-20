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
  `user_id` varchar(32) NOT NULL COMMENT '�û�id--����',
  `user_name` varchar(50) DEFAULT NULL COMMENT '�û���',
  `user_pwd` varchar(50) DEFAULT NULL COMMENT '�û�����',
  `user_email` varchar(50) DEFAULT NULL COMMENT '�û�����',
  `user_height` varchar(50) DEFAULT NULL COMMENT '�û����',
  `user_weight` varchar(50) DEFAULT NULL COMMENT '�û�����',
  `user_sex` varchar(10) DEFAULT NULL COMMENT '�û��Ա�(ֻ�洢�����ֵ�ֵ)',
  `user_contury` varchar(50) DEFAULT NULL COMMENT '��������',
  `user_birth` varchar(50) DEFAULT NULL COMMENT '��������',
  `user_religion` varchar(50) DEFAULT NULL COMMENT '�ڽ�����',
  `user_education` varchar(50) DEFAULT NULL COMMENT '����',
  `user_declaration` varchar(50) DEFAULT NULL COMMENT '��������',
  `user_enroll` varchar(50) DEFAULT NULL COMMENT '������(ֻ�洢�����ֵ�ֵ)',
  `user_marry_status` varchar(50) DEFAULT NULL COMMENT '����״̬(ֻ�洢�����ֵ�ֵ)',
  `user_status` varchar(50) DEFAULT NULL COMMENT '�û�״̬(���Զ��û�������Ӧ������)',
  `created_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���Ϣ��';

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
  `uf_id` varchar(64) NOT NULL DEFAULT '' COMMENT '�û����ѱ������ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '�������û�ID',
  `friend_id` varchar(32) DEFAULT NULL COMMENT '�����ĺ���ID',
  `friend_name` varchar(256) DEFAULT NULL COMMENT '��������',
  `group_id` varchar(64) DEFAULT NULL COMMENT '����ID',
  `status` varchar(64) DEFAULT NULL COMMENT '0��ʾ�������б��У���0��1��ʾ�Ǻ���ͨ�����ܾ���ɾ���������Ѽ�¼',
  `created_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
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
  `group_id` varchar(64) NOT NULL DEFAULT '' COMMENT '�û�����������ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '�û�ID',
  `group_name` varchar(64) DEFAULT NULL COMMENT '����',
  `use_property` varchar(16) DEFAULT NULL COMMENT 'ʹ������(1�Ǻ��ѷ��飬2�������飬3����־����)',
  `created_time` varchar(64) DEFAULT NULL COMMENT '����ʱ��',
  `updated_time` varchar(64) DEFAULT NULL COMMENT '����ʱ��',
  `level` varchar(2) DEFAULT NULL COMMENT '����ĵȼ�,0��ʾϵͳ����������������',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '1000', 'Ĭ�Ϸ���', '1', '2016-07-31 11:33:31', '2016-07-31 11:33:31', '0');
INSERT INTO `user_group` VALUES ('2', '1000', 'Ĭ�Ϸ���', '2', '2016-07-31 11:33:31', '2016-07-31 11:33:31', '0');
DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict(
  sys_dict_id VARCHAR(32) PRIMARY KEY COMMENT '����',
  sys_dict_type VARCHAR(32)COMMENT '�ֵ�����',
  sys_dict_code VARCHAR(32) COMMENT '�ֵ����,��code�����ֵ����',
  parent_code VARCHAR(32) COMMENT '��һ�����ֵ�code',
  create_date DATETIME DEFAULT now() COMMENT '����ʱ��',
  update_date DATETIME DEFAULT now() COMMENT '�޸�ʱ��'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT 'ϵͳ�ֵ��';
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
  `group_id` varchar(64) DEFAULT NULL COMMENT '��־���������ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '�û�ID',
  `group_name` varchar(64) DEFAULT NULL COMMENT '����',
  `cover` varchar(128) DEFAULT NULL COMMENT '�����ķ���',
  `privilege` varchar(8) DEFAULT NULL COMMENT 'Ȩ��,"0"��ʾ�Լ��ɼ�,"1"��ʾ���ѿɼ�,"2"��ʾ�����˿ɼ�',
  `description` varchar(512) DEFAULT NULL COMMENT '���������',
  `created_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_photo_group
-- ----------------------------
INSERT INTO `user_photo_group` VALUES ('aebf4ea69b758baf', '1', '�������', null, '1', '�������', '2016-07-09 20:22:17', '2016-07-09 20:22:17');
INSERT INTO `user_photo_group` VALUES ('10ad54ee3b5fded6', '1', 'һֻ�����Ķ�B', null, '1', 'һֻ�����Ķ�Bһֻ�����Ķ�B', '2016-07-09 22:03:45', '2016-07-09 22:03:45');
DROP TABLE IF EXISTS `user_photo`;
CREATE TABLE `user_photo` (
  `up_id` varchar(64) DEFAULT NULL COMMENT '��Ƭ������',
  `user_id` varchar(64) DEFAULT NULL COMMENT '�������û�ID',
  `group_id` varchar(64) DEFAULT NULL COMMENT '�����ķ���ID',
  `photo_description` varchar(256) DEFAULT NULL COMMENT '��Ƭ����',
  `photo_url` varchar(256) DEFAULT NULL COMMENT '��Ƭ�洢·��',
  `thumbnailUrl` varchar(256) DEFAULT NULL COMMENT '����ͼ',
  `created_time` varchar(32) DEFAULT NULL COMMENT '������ʱ��',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '���µ�ʱ��'
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
  `ue_id` varchar(64) NOT NULL COMMENT '����,�ʼ�ID',
  `email_sender` varchar(64) DEFAULT NULL COMMENT '�ʼ�������ID',
  `email_receiver` varchar(64) DEFAULT NULL COMMENT '�ʼ�������ID',
  `email_title` varchar(512) DEFAULT NULL COMMENT '�ʼ�����',
  `email_content` varchar(1024) DEFAULT NULL COMMENT '�ʼ�����',
  `email_status` varchar(2) DEFAULT NULL COMMENT '�ʼ���״̬��0��ʾδ����1��ʾ�Ѷ�',
  `created_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`ue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_email
-- ----------------------------
INSERT INTO `user_email` VALUES ('246bd849c9bdebbc', '1', '1', null, 'aaaa', null, '2016-07-17 19:31:36', '2016-07-17 19:31:36');
INSERT INTO `user_email` VALUES ('45400d83fbfe998b', '1', '1', null, '�����', null, '2016-07-17 19:27:18', '2016-07-17 19:27:18');
INSERT INTO `user_email` VALUES ('48b914fba8743483', '1', '1', null, 'asdasd', null, '2016-07-17 19:35:59', '2016-07-17 19:35:59');
INSERT INTO `user_email` VALUES ('553d4000bad300e2', '1', '1', null, 'aaa', null, '2016-07-17 19:29:26', '2016-07-17 19:29:26');
INSERT INTO `user_email` VALUES ('6f87469cb5ee4c64', '1', '1', null, 'adsasd', null, '2016-07-17 20:11:21', '2016-07-17 20:11:21');
INSERT INTO `user_email` VALUES ('7c73325488411080', '1', '1', null, '����𣿣�������', null, '2016-07-17 19:13:01', '2016-07-17 19:13:01');
INSERT INTO `user_email` VALUES ('82d7e7e6b4cc8b24', '1', '1', null, 'ada', null, '2016-07-17 19:31:14', '2016-07-17 19:31:14');
INSERT INTO `user_email` VALUES ('924f7eb442f91c86', '1', '1', null, 'dasdasas', null, '2016-07-17 19:29:54', '2016-07-17 19:29:54');
INSERT INTO `user_email` VALUES ('9c0f44fa68852fc3', '1', '1', null, 'asdasas', null, '2016-07-17 19:32:54', '2016-07-17 19:32:54');
INSERT INTO `user_email` VALUES ('a954fa49f4941f98', '1', '1', null, '��ã�', null, '2016-07-17 19:09:59', '2016-07-17 19:09:59');
INSERT INTO `user_email` VALUES ('f2e7877442d1a57b', '1', '3', null, '', null, '2016-07-17 16:39:51', '2016-07-17 16:39:51');
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user_blog`
-- ----------------------------
DROP TABLE IF EXISTS `user_blog`;
CREATE TABLE `user_blog` (
  `ub_id` varchar(64) DEFAULT NULL COMMENT '�û���־������ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '�������û�ID',
  `group_id` varchar(16) DEFAULT NULL COMMENT '�����ķ���ID',
  `blog_title` varchar(256) DEFAULT NULL COMMENT '��־����',
  `blog_content` varchar(2000) DEFAULT NULL COMMENT '��־����',
  `blog_privilege` varchar(8) DEFAULT NULL COMMENT '��־����Ȩ��,0��ʾȫ���ɼ�,1��ʾ�Լ��ɼ�',
  `blog_tags` varchar(256) DEFAULT NULL COMMENT '��־��ǩ���ö��Ÿ���',
  `created_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��',
  `updated_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_blog
-- ----------------------------
INSERT INTO `user_blog` VALUES ('8a9e24ff4b0f9e02', '1', '1', '���ǷǷ� ��Ҫ�¸�ȥ���', '�������ڵķ� ���δ��� �����ֻ�', '0', 'heart', '2016-07-07 21:59:56', null);
INSERT INTO `user_blog` VALUES ('6d7f67429e2499b9', '1', '1', '����', '�������ǿ� ��ս������ �ҹ������ �õ����빬 շ�����ɥ������', '0', 'heart', '2016-07-07 22:00:48', null);
INSERT INTO `user_blog` VALUES ('8a9e24ff4b0f9e02', '1', '1', '���ǷǷ� ��Ҫ�¸�ȥ���', '�������ڵķ� ���δ��� �����ֻ�', '0', 'heart', '2016-07-07 21:59:56', null);
INSERT INTO `user_blog` VALUES ('6d7f67429e2493b9', '1', '1', '����', '�������ǿ� ��ս������ �ҹ������ �õ����빬 շ�����ɥ������', '0', 'heart', '2016-07-07 22:00:48', null);
INSERT INTO `user_blog` VALUES ('8a9e24ff4b0f9e12', '1', '1', '���ǷǷ� ��Ҫ�¸�ȥ���', '�������ڵķ� ���δ��� �����ֻ�', '0', 'heart', '2016-07-07 21:59:56', null);
INSERT INTO `user_blog` VALUES ('6d7f67429e2439b9', '1', '1', '����', '�������ǿ� ��ս������ �ҹ������ �õ����빬 շ�����ɥ������', '0', 'heart', '2016-07-07 22:00:48', null);
DROP TABLE IF EXISTS blog_comment;

CREATE TABLE blog_comment (
  blog_comment_id   VARCHAR(32) PRIMARY KEY COMMENT '��־����id',
  blog_id           VARCHAR(32) COMMENT '��־id',
  comment_user_id  VARCHAR(32) COMMENT '�����ߵ�id',
  comment_content   VARCHAR(2000) COMMENT '��������',
  comment_parent_id VARCHAR(32) COMMENT '�������۽�������ʱ������ֶα�ʾ���۵�id',
  comment_time      VARCHAR(32) COMMENT '����ʱ��'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT '��־���۱�';/*
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
  `umId` varchar(64) DEFAULT NULL COMMENT '����ID',
  `message_by` varchar(64) DEFAULT NULL COMMENT '������',
  `message_to` varchar(64) DEFAULT NULL COMMENT '���Ը�˭',
  `message_content` varchar(512) DEFAULT NULL COMMENT '��������',
  `created_time` varchar(32) DEFAULT NULL COMMENT '����ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
/*�����û���ͷ���ֶ�*/
ALTER TABLE user_info ADD COLUMN head_photo_url VARCHAR(500);
COMMIT ;