package com.ddas.sns.anotation;

import org.apache.ibatis.annotations.ResultType;

import java.lang.annotation.*;

/**
 * ClassName:	VipPrivilege
 * Function: 	对所有需要权限控制的方法加上这个注解
 *
 * @author shaojx
 * @date 2016/8/13 23:03
 * @since JDK 1.6
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface VipPrivilege {
    /**要验证的权限的值,比如说为photoCount，说明要验证相应的照片的权限*/
    public String value();
}
