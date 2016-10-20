/*用户的vip信息*/
DROP TABLE IF EXISTS user_vip_info;
CREATE TABLE user_vip_info(
  vip_info_id VARCHAR(32) PRIMARY KEY COMMENT '主键',
  user_id VARCHAR(32) COMMENT '用户的id，与user_info表id对应',
  vip_type_code VARCHAR(100) COMMENT '会员类型code,与vip_types中的code对应',
  vip_start_date VARCHAR(100) COMMENT 'vip开始时间',
  vip_end_start VARCHAR(100) COMMENT 'vip结束时间',
  describ VARCHAR(1000) COMMENT '说明'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户的vip信息';
