
create TABLE user_private_letter(
  id VARCHAR(32) PRIMARY KEY COMMENT '主键,无意义',
  sender_id VARCHAR(32) COMMENT '发件人id',
  recive_id VARCHAR(32) COMMENT '收信人id',
  letter_comment VARCHAR(4000) COMMENT '私信内容',
  create_time VARCHAR(32) COMMENT '发送日期',
  is_read VARCHAR(2) COMMENT '是否已读，1表示已读，0表示未读'
)COMMENT '私信' ENGINE =innodb,CHARSET =utf8;