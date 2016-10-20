/**增加充钱状态*/
ALTER TABLE user_recharge_records ADD COLUMN recharge_status VARCHAR(2) COMMENT '0代表未付款，1代表付款成功';