/*创建会员类型表*/
drop table if exists vip_types;
create table vip_types(
  vip_id VARCHAR(32)PRIMARY KEY  COMMENT '主键',
  vip_type_code VARCHAR(100) COMMENT '会员类型code,0是普通用户,1是高级会员,2是vip会员',
  describ VARCHAR(1000) COMMENT '说明'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'vip的类型种类';
