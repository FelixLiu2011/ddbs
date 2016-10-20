package com.ddas.sns.email.domain;

/**
 * ClassName:	UserEmailDto
 * Function: 	一个邮件的dto对象，从UserEmail继承，并添加了一些属性
 *
 * @author shaojx
 * @date 2016/8/9 22:27
 * @since JDK 1.6
 */
public class UserEmailDetailDto extends  UserEmail{
    /*是回复还是来自 1表示回复给别人，0表示来自别人的回复*/
    private String type;
    /*别人的名字 userName()*/
    private String otherUserName;
    /*当前的登录人的名字(邮件只能单对单，所以除了回复者姓名，这个字段就表示当前的登录人姓名)*/
    private String userName;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOtherUserName() {
        return otherUserName;
    }

    public void setOtherUserName(String otherUserName) {
        this.otherUserName = otherUserName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
