package com.ddas.common.exception;

/**
 * 自定义异常，对于服务调用异常，比如余额不足等异常可抛出此异常
 * Created by Administrator on 2016/8/20.
 */
public class ServiceException extends Exception{
    public ServiceException(String msg) {
        super(msg);
    }
}
