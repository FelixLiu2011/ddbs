DROP TABLE IF EXISTS blog_comment;

CREATE TABLE blog_comment (
  blog_comment_id   VARCHAR(32) PRIMARY KEY COMMENT '日志评论id',
  blog_id           VARCHAR(32) COMMENT '日志id',
  comment_user_id  VARCHAR(32) COMMENT '评论者的id',
  comment_content   VARCHAR(2000) COMMENT '评论内容',
  comment_parent_id VARCHAR(32) COMMENT '当对评论进行评论时，这个字段表示评论的id',
  comment_time      VARCHAR(32) COMMENT '评论时间'
)ENGINE =innodb DEFAULT CHARSET =utf8 COMMENT '日志评论表';