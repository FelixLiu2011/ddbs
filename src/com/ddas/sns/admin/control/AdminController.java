/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.admin.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.admin.service.AdminService;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.ddas.sns.util.AddressUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;
import java.util.Map;

/**
 * ClassName:	AdminController
 * Function: 	后台管理Controller
 *
 * @author shaojunxiang
 * @date 12:26
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends AdminBaseController{
    private static  final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);

    @Resource
    private AdminService adminService;

    @Resource
    private UserInfoService userInfoService;

    /**
     *admin 首页
     *@return java.lang.String 升级会员的页面
     *@author shaojx
     *@date 2016/7/8 21:45
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/gotoIndex")
    public ModelAndView gotoIndex(HttpServletRequest httpServletRequest){
        ModelAndView mav = withLocal(httpServletRequest,"admin/index");
        return mav;
    }

    /**
     *跳转到用户的信息页面
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/9/4 14:39
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/gotoUserInfos")
    public ModelAndView gotoUserInfos(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = checkIsXPjaxReuqest(request);
        if(mv!=null){
            return mv;
        }
        ModelAndView modelAndView=withLocal(request,"admin/userInfos");
        return modelAndView;
    }
    /**
     *跳转到充值记录的信息页面
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/9/4 14:39
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/gotoRecordsInfos")
    public ModelAndView gotoRecordsInfos(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mv = checkIsXPjaxReuqest(request);
        if(mv!=null){
            return mv;
        }
        ModelAndView modelAndView=withLocal(request,"admin/recordsInfos");
        return modelAndView;
    }

    /**
     *跳转到充值记录的信息页面
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/9/4 14:39
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/gotoGiftInfos")
    public ModelAndView gotoGiftInfos(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mv = checkIsXPjaxReuqest(request);
        if(mv!=null){
            return mv;
        }
        ModelAndView modelAndView=withLocal(request,"admin/giftInfos");
        return modelAndView;
    }

    /**
     *获取所有的用户信息
     * @param pageNo 当前页
     * @param pageSize 每页的数据量
     * @param request 当前请求
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/9/5 0:04
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/findAllUserInfos")
    @ResponseBody
    public Page findAllUserInfos(int pageNo, int pageSize, String searchTime,String searchTxt, HttpServletRequest request) {
        Page page = adminService.findAllUserInfos(pageNo, pageSize,searchTime,searchTxt, getLoginUser(request));
        return page;
    }

    /**
     *获取所有的用户信息
     * @param pageNo 当前页
     * @param pageSize 每页的数据量
     * @param request 当前请求
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/9/5 0:04
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/findUserRechargeInfos")
    @ResponseBody
    public Page findUserRechargeInfos(int pageNo, int pageSize, String searchTime,String searchTxt, HttpServletRequest request) {
        Page page = adminService.findUserRechargeInfos(pageNo, pageSize,searchTime,searchTxt, getLoginUser(request));
        return page;
    }

    /**
     *获取所有的用户信息
     * @param pageNo 当前页
     * @param pageSize 每页的数据量
     * @param request 当前请求
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/9/5 0:04
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/findGiftInfos")
    @ResponseBody
    public Page findGiftInfos(int pageNo, int pageSize, String searchTime,String searchTxt, HttpServletRequest request) {
        Page page = adminService.findGiftInfos(pageNo, pageSize,searchTime,searchTxt, getLoginUser(request));
        return page;
    }

    //=============登录一些操作(暂时写在这个类里面)================

    @RequestMapping("/gotoLogin")
    public ModelAndView gotoLogin(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //判断 cookie中的内容
        Cookie[] cookies = request.getCookies();
        String userName = null;
        String userPwd = null;
        String remeberme = null;
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            String value = cookie.getValue();
            if ("userName".equals(name)) {
                userName = value;
            }
            if ("userPwd".equals(name)) {
                userPwd = value;
            }
            if ("remeberme".equals(name)) {
                remeberme = value;
            }
        }
        if ((userName != null && userPwd != null)) {
            UserInfo userInfo = new UserInfo();
            userInfo.setUserName(userName);
            userInfo.setUserPwd(userPwd);
            UserInfo userInfoFromDb = userInfoService.loginInProxyByAdmin(userInfo);
            if (userInfoFromDb != null) {
                modelAndView.setViewName("redirect:/admin/gotoIndex");//直接跳转到首页
                setLoginUserToSession(userInfoFromDb, request);//设置用户到session中
            }
        } else {
            //locale 只为了前端页面的 validator的国际化
            Locale locale = (Locale) WebUtils.getSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
            modelAndView.setViewName("admin/login");
            if (locale == null) {
                locale = Locale.getDefault();
            }
            modelAndView.addObject("local", locale.toString());
        }
        return modelAndView;
    }

    @RequestMapping("/in")
    @ResponseBody
    public Msg login(@RequestParam String remeberme, @RequestBody UserInfo userInfo, HttpServletRequest request, HttpServletResponse response) {
        UserInfo userInfoFromDb = null;
        try {
            userInfoFromDb = userInfoService.loginInProxyByAdmin(userInfo);
        } catch (Exception e) {
            LOGGER.error("系统出现错误!",e);
            Msg msg = new Msg();
            msg.setSuccessful(false);
            String msgByKey = SpringContextUtil.getMsgByKey("login.sysError", getLocalObject(request));
            msg.setMsg(msgByKey);
            return msg;
        }

        boolean loginInResult = userInfoFromDb != null;
        if (loginInResult) {
            if (remeberme != null && remeberme.equals("true")) {//保存用户名到cookie
                Cookie userNameCookie = new Cookie("userName", userInfo.getUserName());
                Cookie userPwdCookie = new Cookie("userPwd", userInfo.getUserPwd());
                Cookie userRemermeCookie = new Cookie("remeberme", remeberme);
                response.addCookie(userNameCookie);
                response.addCookie(userPwdCookie);
                response.addCookie(userRemermeCookie);
            }
            setLoginUserToSession(userInfoFromDb, request);
            Msg msg = new Msg();
            msg.setMsg("success");
            msg.setSuccessful(true);
            return msg;
        } else {
            Msg msg = new Msg();
            msg.setSuccessful(false);
            Locale locale = (Locale) WebUtils.getSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
            msg.setMsg(SpringContextUtil.getMsgByKey("login.errorUserNameOrPwd", locale));
            return msg;
        }
    }


    /**
     * 跳转到登录页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/gotoLoginPage")
    public ModelAndView gotoLoginPage(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "admin/login");
        return modelAndView;
    }

    /**
     * 跳转到首页，清除session中的user信息
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/out")
    @ResponseBody
    public Msg logOut(HttpServletRequest request) {
        request.getSession(true).removeAttribute("adminUserInfo");
        Msg msg = new Msg();
        msg.setSuccessful(true);
        return msg;
    }
}
