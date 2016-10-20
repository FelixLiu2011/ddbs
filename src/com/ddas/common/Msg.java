package com.ddas.common;

import java.io.Serializable;

/**
 * ClassName:	Msg
 * Function: 	用来向页面传递消息的类
 *
 * @author shaojx
 * @date 2016/7/3 21:37
 * @since JDK 1.6
 */
public class Msg implements Serializable{
    /**通用信息*/
    private String msg;
    /**成功消息**/
    private String success;
    /**失败消息**/
    private String error;
    /**是否成功**/
    private boolean successful;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public boolean isSuccessful() {
        return successful;
    }

    public void setSuccessful(boolean successful) {
        this.successful = successful;
    }
}
