package com.ddas.sns.constants;

/**
 * ClassName:	VipTypeEnum
 * Function: 	vip的种类
 *
 * @author shaojx
 * @date 2016/8/16 22:11
 * @since JDK 1.6
 */
public enum VipTypeEnum {
    NORMAL("普通用户",0),HIGH_LEVEL_NORMAL("高级会员",1),VIP("VIP",2);
    private int type;
    private String name;

    VipTypeEnum(String name,int type) {
        this.type=type;
        this.name=name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
