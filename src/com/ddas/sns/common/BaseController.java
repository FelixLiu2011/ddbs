package com.ddas.sns.common;

import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.ddas.sns.vip.domain.UserVipInfo;
import org.codehaus.janino.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

/**
 * ClassName:	BaseController
 * Function: 	Base Controller
 *
 * @author shaojx
 * @date 2016/7/9 21:11
 * @since JDK 1.6
 */
public class BaseController {
    private static  final Logger LOGGER= LoggerFactory.getLogger(BaseController.class);

    /**
     *返回当前的local对应的字符串
     * @param request
     *@return java.lang.String
     *@author shaojx
     *@date 2016/7/9 21:15
     *@version 1.0
     *@since 1.6
     */
    public String getLocal(HttpServletRequest request) {
        return getLocalObject(request).toString();
    }

    public Locale getLocalObject(HttpServletRequest request){
        Locale locale = (Locale) WebUtils.getSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        if(locale==null){
            locale=Locale.SIMPLIFIED_CHINESE;
        }
        return locale;
    }

    /**
     *获取一个包含"local"的ModelAndView
     * 1.会从request.getSession().getSessionAttribute()中获取SessionLocalResolver对应的Local的属性，如果获取不到
     * 则使用Local.getDefault的默认值
     * @param request 对应的HttpServletRequet
     *@return org.springframework.web.servlet.ModelAndView 返回包含一个key为"local"，值为Local对应的字符串的ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:18
     *@version 1.0
     *@since 1.6
     */
    public ModelAndView containLocal(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("local",getLocal(request));
        return modelAndView;
    }

    /**
     *获取一个ModelAndView ，包含一个属性"local"，对应的Local的字符串，以及相应的视图名称viewName
     * @param request HttpServletRequest
     * @param viewName 视图名称
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:22
     *@version 1.0
     *@since 1.6
     */
    public ModelAndView withLocal(HttpServletRequest request,String viewName){
        ModelAndView modelAndView=containLocal(request);
        modelAndView.setViewName(viewName);
        return modelAndView;
    }


    /**
     *从session获取当前登录的用户信息
     * @param request
     *@return com.ddas.sns.userinfo.domain.UserInfo
     *@author shaojx
     *@date 2016/7/10 11:19
     *@version 1.0
     *@since 1.6
     */
    public UserInfo getLoginUser(HttpServletRequest request){
        LOGGER.error("CurrentLoginUserName:" + ((UserInfo) request.getSession(true).getAttribute("userInfo")).getUserName());
        return (UserInfo) request.getSession(true).getAttribute("userInfo");
    }

    /**
     *把当前登陆的用户信息放到session，调用此方法会重置session中的用户信息，除掉如密码隐私信息
     * 适用于当更新了用户的某些信息的时候重置session中的用户信息
     * @param request
     *@return com.ddas.sns.userinfo.domain.UserInfo
     *@author shaojx
     *@date 2016/7/10 11:19
     *@version 1.0
     *@since 1.6
     */
    public void setLoginUserToSession(UserInfo userInfo, HttpServletRequest request){
        userInfo.setUserPwd(null);
        String userCoin = userInfo.getUserCoin();
        userInfo.setUserCoin((userCoin ==null||"".equals(userCoin))?"0":userCoin);//reset userCoin
        request.getSession(true).setAttribute("userInfo", userInfo);
    }

    /**
     *使用SpringMVC的ThreadLocal中获取当前的请求,从而从session中获取UserInfo信息
     * @param
     *@return com.ddas.sns.userinfo.domain.UserInfo
     *@author shaojx
     *@date 2016/7/10 11:31
     *@version 1.0
     *@since 1.6
     */
    public UserInfo getLoginUserAutoBySpringMVC(){
        HttpServletRequest curRequest =
                ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
                        .getRequest();
        return getLoginUser(curRequest);
    }

    /**
     *从i18n.properties中获取相应的国际化的值
     * @param key property key
     *@return java.lang.String property value
     *@author shaojx
     *@date 2016/7/10 13:47
     *@version 1.0
     *@since 1.6
     */
    public String getMsgByKeyViaLocal(String key){
        if(key==null||"".equals(key)){
            return "";
        }
        return getMsgByKeyViaLocal(key,getCurrentRequest());
    }
    /**
     *从i18n.properties中获取相应的国际化的值
     * @param key property key
     * @param request current request
     *@return java.lang.String value
     *@author shaojx
     *@date 2016/8/20 21:28
     *@version 1.0
     *@since 1.6
     */
    public String getMsgByKeyViaLocal(String key,HttpServletRequest request){
        if(key==null||"".equals(key)){
            return "";
        }
        return SpringContextUtil.getMsgByKey(key,new Locale(getLocal(request)));
    }


    /**
     *获取当前的请求 绑定到ThreadLocal
     * @param
     *@return javax.servlet.http.HttpServletRequest
     *@author shaojx
     *@date 2016/7/10 13:46
     *@version 1.0
     *@since 1.6
     */
    public HttpServletRequest getCurrentRequest(){
        HttpServletRequest curRequest =
                ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
                        .getRequest();
        return curRequest;
    }

    /** 基于@ExceptionHandler异常处理 */
    @ExceptionHandler
    public void exceptionHandler(HttpServletRequest request, Exception e) {
        // TODO: 2016/8/7 可以根据e的类型去转向不同的错误页面
        LOGGER.error(e.getMessage(), e);
    }

}
