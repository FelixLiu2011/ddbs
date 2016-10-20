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
