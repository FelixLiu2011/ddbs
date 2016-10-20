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
