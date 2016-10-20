/*�����û���ͷ���ֶ�*/
ALTER TABLE user_info ADD COLUMN head_photo_url VARCHAR(500) COMMENT '�û�ͷ���url';
/*�ʼ��ظ������ֶ�*/
ALTER  TABLE user_email ADD COLUMN parent_email_id VARCHAR(64) COMMENT '�ظ��ʼ���id';
ALTER  TABLE user_email ADD COLUMN mother_email_id VARCHAR(64) COMMENT '���ж༶�ظ�ʱ�����id��ʾ������ʼ�id';
/*增加用户金币字段*/
ALTER TABLE user_info ADD COLUMN user_coin VARCHAR(64) DEFAULT '0' COMMENT '用户金币数,1美元=1金币';

COMMIT ;