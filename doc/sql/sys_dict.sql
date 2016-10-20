DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict(
  sys_dict_id VARCHAR(32) PRIMARY KEY COMMENT '主键',
  sys_dict_type VARCHAR(32)COMMENT '字典类型',
  sys_dict_code VARCHAR(32) COMMENT '字典分类,以code来作字典分类',
  parent_code VARCHAR(32) COMMENT '上一级的字典code',
  create_date DATETIME DEFAULT now() COMMENT '创建时间',
  update_date DATETIME DEFAULT now() COMMENT '修改时间'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT '系统字典表';