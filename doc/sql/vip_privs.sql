/*会员对应的权限**/
drop table if EXISTS vip_privs;
CREATE TABLE vip_privs(
  vip_priv_id VARCHAR(32) PRIMARY KEY COMMENT '主键',
  vip_type_code VARCHAR(100) COMMENT '权限的code,对应权限的type_code',
  priv_type VARCHAR(50) COMMENT '权限类型比如logCount,表示可以发表的日志数',
  priv_value VARCHAR(50) COMMENT '权限值比如50，说明可以有50条的权限'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'vip类型对应的权限';