/**增加用户登录IP和地址的记录*/
ALTER TABLE user_info ADD COLUMN login_ip VARCHAR(16) COMMENT '用户的登录IP';
ALTER TABLE user_info ADD COLUMN login_address VARCHAR(100) COMMENT '用户的登录地址';