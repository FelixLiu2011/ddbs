DROP TABLE IF EXISTS my_log;
CREATE TABLE my_log (
  my_log_id      VARCHAR(32) PRIMARY KEY
  COMMENT '日志表主键',
  user_id VARCHAR(32) COMMENT '所属用户，与用户表的id相对应',
  my_log_title   VARCHAR(50) COMMENT '日志标题',
  my_log_types   VARCHAR(20) COMMENT '日志分类,与表my_log_type字典表相对应',
  my_log_tags    VARCHAR(300) COMMENT '日志标签,多个用逗号隔开',
  my_log_privs   VARCHAR(10) COMMENT '日志开放权限,0表示全部可见，1表示自己可见,2表示分组可见',
  my_log_content VARCHAR(1000) COMMENT '日志内容',
  group_ids VARCHAR(2048) COMMENT  '分组可见时，对应的group的id,多个用英文逗号隔开',
  create_time VARCHAR(50) COMMENT '创建时间',
  update_time VARCHAR(50) COMMENT '修改时间'
)
  ENGINE = innodb
  DEFAULT CHARSET = utf8 COMMENT '我的日志表';