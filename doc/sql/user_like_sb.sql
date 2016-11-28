CREATE TABLE  user_like_sb(
  id VARCHAR(32) PRIMARY KEY COMMENT '主键，无意义',
  user_id VARCHAR(32) COMMENT '用户id',
  sb_id VARCHAR(32) COMMENT  '喜欢的人id'
)COMMENT '用户关注somebody表(一对多)' ENGINE =innodb,CHARSET =utf8;