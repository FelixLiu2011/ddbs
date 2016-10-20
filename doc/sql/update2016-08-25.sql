/**增加推荐用户的字段，方便后台控制，比如说属性为1的显示到首页列表,属性为2的显示到右侧推荐*/
ALTER TABLE user_info ADD COLUMN recommend VARCHAR(16) COMMENT '属性为1的显示到首页列表,属性为2的显示到右侧推荐,属性为3的显示到最近访问';