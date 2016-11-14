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
    private Object obj;
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

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public Attachment getAttributes() {
        return attributes;
    }

    public void setAttributes(Attachment attributes) {
        this.attributes = attributes;
    }
}
