package com.ddas.sns.admin.dto;

import com.ddas.sns.userrechargerecords.domain.UserRechargeRecord;

/**
 * ClassName:	UserRechargeRecordDto
 * Function: 	用户的充值记录DTO（包括了用户信息）
 *
 * @author shaojx
 * @date 2016/9/5 14:49
 * @since JDK 1.6
 */
public class UserRechargeRecordDto extends UserRechargeRecord {
    /**充值的用户名*/
    private String userName;
    /**充值用户的头像url*/
    private String userPhotoUrl;
    /**充值帐户的用户名*/
    private String rechargeUserName;
    /**充值帐户的用户头像url**/
    private String rechargePhotoUrl;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhotoUrl() {
        return userPhotoUrl;
    }

    public void setUserPhotoUrl(String userPhotoUrl) {
        this.userPhotoUrl = userPhotoUrl;
    }

    public String getRechargeUserName() {
        return rechargeUserName;
    }

    public void setRechargeUserName(String rechargeUserName) {
        this.rechargeUserName = rechargeUserName;
    }

    public String getRechargePhotoUrl() {
        return rechargePhotoUrl;
    }

    public void setRechargePhotoUrl(String rechargePhotoUrl) {
        this.rechargePhotoUrl = rechargePhotoUrl;
    }
}
