DROP table if EXISTS my_log_type;
create TABLE my_log_type(
  my_log_type_id VARCHAR(32) PRIMARY KEY  COMMENT '我的日志分类id，主键',
  user_id VARCHAR(32) COMMENT '所属的用户id',
  my_log_type_name VARCHAR(32) COMMENT '我的日志分类名称',
  create_time DATETIME DEFAULT  now() COMMENT '创建时间'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT '我的日志分类';