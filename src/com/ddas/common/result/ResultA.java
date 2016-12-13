package com.ddas.common.result;

/**
 * ClassName:	Result
 * Function: 	页面结果集封装
 *
 * @author shaojx
 * @date 2016/11/10 22:25
 * @since JDK 1.6
 */
public class ResultA {
    private boolean success=true;
    private String msg;
    private Object obj;
    private Object attributes;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public Object getAttributes() {
        return attributes;
    }

    public void setAttributes(Object attributes) {
        this.attributes = attributes;
    }
}
