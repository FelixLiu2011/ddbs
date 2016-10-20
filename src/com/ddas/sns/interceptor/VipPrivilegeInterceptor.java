package com.ddas.sns.interceptor;

import com.ddas.common.page.Page;
import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.anotation.VipPrivilege;
import com.ddas.sns.cache.VipPrivsCache;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.constants.VipTypeEnum;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.vip.domain.UserVipInfo;
import com.ddas.sns.vip.domain.VipPrivs;
import com.ddas.sns.vip.service.UserVipInfoService;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/**
 * ClassName:	VipPrivilegeInterceptor
 * Function: 	这个类主要作用为:为Service类的有些权限方法增加方法参数修改
 * 注意点:
 * 1.这个拦截器只对使用了@VipPrivilege这个注解的方法过滤
 * 2.过滤的方法的签名为 package.method(int currentPage,int pageSize,..),也就是前两个参数必须为当前页和当前请求的每页的数据量
 * 3.确保把这个Interceptor放置在所有的Interceptor的最后，因为一旦匹配上了方法，会修改方法参数并立即执行方法
 *
 * @author shaojx
 * @date 2016/8/13 22:47
 * @since JDK 1.6
 */
public class VipPrivilegeInterceptor implements MethodInterceptor {
    /**
     * 使用这个类主要是为了获取绑定在Request中的用户信息
     */
    private static BaseController baseController = new BaseController();
    private static final Logger LOGGER = LoggerFactory.getLogger(VipPrivilegeInterceptor.class);
    /**
     * vip extra msg key
     **/
    private static final String VIP_EXTRA_INFO = "vipExtraInfo";

    @Override
    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        System.out.println(methodInvocation.getMethod().toString());
        Method method = methodInvocation.getMethod();
        Annotation[] declaredAnnotations = method.getDeclaredAnnotations();
        for (Annotation annotation : declaredAnnotations) {
            if (annotation.annotationType() == VipPrivilege.class) {
                boolean checkMethodSigture = checkMethodSigture(method);
                if (!checkMethodSigture) {
                    break;
                }
                String value = annotation.annotationType().getMethod("value").invoke(annotation).toString();
                UserInfo loginUserAutoBySpringMVC = baseController.getLoginUserAutoBySpringMVC();
                // TODO: 2016/8/14 this place can optimize?
                //get data from data
                UserVipInfoService userVipInfoService = SpringContextUtil.getApplicationContext().getBean(UserVipInfoService.class);
                String userId = loginUserAutoBySpringMVC.getUserId();
                String userName = loginUserAutoBySpringMVC.getUserName();
                UserVipInfo userVipInfo = userVipInfoService.fetchUserVipInfoCodeByUserId(userId);
                String vipTypeCode = "0";//普通用户
                if (userVipInfo == null) {
                    vipTypeCode = VipTypeEnum.NORMAL.getType() + "";//普通用户
                } else {
                    vipTypeCode = userVipInfo.getVipTypeCode();
                }
                VipPrivs vipPrivsByTypeCodeAndPrivisType = VipPrivsCache.getInstance().getVipPrivsByTypeCodeAndPrivisType(vipTypeCode, value);
                if (vipPrivsByTypeCodeAndPrivisType != null) {
                    String privValue = vipPrivsByTypeCodeAndPrivisType.getPrivValue();
                    LOGGER.info("get privilege value from VipPrivsCache by userId:" + userId + "userName:" + userName
                            + ";typeCode:" + vipTypeCode + ";privilegeKey:" + value);
                    Object[] arguments = methodInvocation.getArguments();
                    //cast to int or integer.class ,already check
                    int currentPage = Integer.parseInt(arguments[0].toString());
                    int pageSize = Integer.parseInt(arguments[1].toString());
                    int privValueOfInt = Integer.parseInt(privValue);
                    boolean marked = false;
                    if ((currentPage - 1) * pageSize > privValueOfInt) {
                        int left = privValueOfInt - ((currentPage - 1) * pageSize);
                        //left count can be extract
                        if (left > pageSize) {//if left count can extract is greater than this pageSize,use pageSize,otherwise use left
                        } else {
                            pageSize = left;
                            LOGGER.info("modify method arguments by VipPrivilegeInterceptor!currentPage:"
                                    + currentPage + ";oldValue:" + pageSize + ";newValue:" + left + ";method:" + method.toString());
                            marked = true;
                        }
                    } else {
                        LOGGER.info("modify method arguments by VipPrivilegeInterceptor!oldValue:"
                                + pageSize + ";newValue:" + privValueOfInt + ";method:" + method.toString());
                        pageSize = privValueOfInt;//直接设置为权限的值
                    }
                    arguments[0] = currentPage;
                    arguments[1] = pageSize;
                    //invoke method immediately,so make sure this interceptor will be placed in the last index of interceptors' chain
                    Object invoke = method.invoke(methodInvocation.getThis(), arguments);
                    Page page = (Page) invoke;
                    //如果存在多页并且重新设置了pageSize,或者是请求页为第一页并且数据量总数大于相应的pageSize
                    if (marked || (currentPage == 1 && page.getTotalCount() > pageSize)) {
                        page.getExtra().put(VIP_EXTRA_INFO, Boolean.TRUE);//put <VIP_EXTRA_INFO,true>
                    }
                    //change total count,for pagnation
                    page.setTotalCount(page.getTotalCount() > 0 ? privValueOfInt : 0);//设置为权限值，为了前台分页
                    return invoke;
                }
            }
            break;
        }
        //  methodInvocation.getThis()
        Object proceed = methodInvocation.proceed();
        return proceed;
    }

    private boolean checkMethodSigture(Method method) {
        Class<?>[] parameterTypes = method.getParameterTypes();
        if (parameterTypes.length >= 2) {//check arguments
            Class p1 = parameterTypes[0];
            Class p2 = parameterTypes[1];
            if (p1 == Integer.class || p1 == Integer.TYPE) {//int.class or Integer.class
                // TODO: 2016/8/14  can compatiable other int types?like short?
            } else {
                LOGGER.error("method " + method.toString() + " has privilige annotation,but the first argument is not match(int or Integer) ,so ignore!", new IllegalArgumentException());
                return false;
            }
            if (p1 == Integer.class || p1 == Integer.TYPE) {//int.class or Integer.class
                // TODO: 2016/8/14  can compatiable other int types?like short?
            } else {
                LOGGER.error("method " + method.toString() + " has privilige annotation,but the second argument is not match(int or Integer) ,so ignore!", new IllegalArgumentException());
                return false;
            }
            //check method return type
            Class<?> returnType = method.getReturnType();
            if (returnType == Page.class) {//returnType match `Page.class`
                return true;
            } else {
                return false;
            }
        } else {
            LOGGER.error("method " + method.toString() + " has privilige annotation,but the arguments is not match ,so ignore!", new IllegalArgumentException());
        }
        return false;
    }
}
