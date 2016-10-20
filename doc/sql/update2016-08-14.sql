/**插入相应的权限值 信息*/
INSERT INTO user_vip_info(vip_info_id, user_id, vip_type_code, vip_start_date, vip_end_start, describ)
VALUES ('1','1',0,'2016-8-14','2017-8-14','这是一条测试数据!');

/**privis type_code=0*/
INSERT INTO vip_privs(vip_priv_id, vip_type_code, priv_type, priv_value)
VALUES ('1','0','photoCount',1);
INSERT INTO vip_privs(vip_priv_id, vip_type_code, priv_type, priv_value)
VALUES ('2','0','dailyEamilCount',1);
/*高级会员*/
INSERT INTO vip_privs(vip_priv_id, vip_type_code, priv_type, priv_value)
VALUES ('3','1','photoCount',50);
INSERT INTO vip_privs(vip_priv_id, vip_type_code, priv_type, priv_value)
VALUES ('4','1','dailyEamilCount',20);
/*VIP*/
INSERT INTO vip_privs(vip_priv_id, vip_type_code, priv_type, priv_value)
VALUES ('5','2','photoCount',100);
INSERT INTO vip_privs(vip_priv_id, vip_type_code, priv_type, priv_value)
VALUES ('6','2','dailyEamilCount',50);