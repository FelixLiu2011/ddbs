package com.ddas.common.result;

/**
 * ClassName:	Result
 * Function: 	页面结果集封装
 *
 * @author shaojx
 * @date 2016/11/10 22:25
 * @since JDK 1.6
 */
public class Result {
    private boolean success=true;
    private String msg;
    private Object object;
    private Attachment attributes;

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

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public Attachment getAttributes() {
        return attributes;
    }

    public void setAttributes(Attachment attributes) {
        this.attributes = attributes;
    }
}
