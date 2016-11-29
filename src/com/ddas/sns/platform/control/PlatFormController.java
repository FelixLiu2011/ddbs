/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.platform.control;

import com.ddas.common.Msg;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.ddas.sns.util.AddressUtils;
import com.sun.xml.internal.bind.v2.TODO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ClassName:	PlatFormController
 * Function: 	朋友模块Controller
 *
 * @author shaojunxiang
 * @date 12:26
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/platform")
public class PlatFormController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(PlatFormController.class);
    @Resource
    private UserInfoService userInfoService;

    /**
     * 跳转体验选择性别的页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/experience")
    public ModelAndView gotoExperienceSelectSex(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "login/experienceSelectSex");
        return modelAndView;
    }

    /**
     * 跳转体验选择性别的页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/setSex")
    public ModelAndView gotoSetSexPage(HttpServletRequest request, String uuid) {
        ModelAndView modelAndView = withLocal(request, "login/experienceSelectSex");
        modelAndView.addObject("uuid", uuid);

        return modelAndView;
    }

    /**
     * 跳转体验选择语言的页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/experience/languageChoice")
    public ModelAndView gotoExperienceSelectLanguage(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "login/experienceLanguageChoice");
        return modelAndView;
    }

    /**
     * 跳转体验选择语言的页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/setLanguage")
    public ModelAndView gotoSetLanguagePage(HttpServletRequest request, String sex, String uuid) {
        ModelAndView modelAndView = withLocal(request, "login/experienceLanguageChoice");
        modelAndView.addObject("sex", sex);
        modelAndView.addObject("uuid", uuid);

        return modelAndView;
    }

    /**
     * 体验信息完成，返回redirect的Url
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/experience/regExperienceMember")
    @ResponseBody
    public Msg experienceRedirectToHomeIndex(HttpServletRequest request) {
        Msg msg = new Msg();
        msg.setSuccessful(true);

        return msg;
    }

    /**
     * 体验信息完成，返回redirect的Url
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/regMember")
    @ResponseBody
    public Msg regMember(String sex, String language, String uuid, HttpServletRequest request) {
        UserInfo userInfo = userInfoService.fetchUserInfoByUserId(uuid);
        userInfo.setMembSex(sex);
        userInfo.setMembLanguage(language);
        // TODO: 2016/11/7 设置语言
        userInfoService.saveUserInfo(userInfo);
        setLoginUserToSession(userInfo, request);
        Msg msg = new Msg();
        msg.setSuccessful(true);

        return msg;
    }

    /**
     * 跳转我的私信页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/privateLetter")
    public ModelAndView gotoPrivateLetter(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "index/privateLetter");
        return modelAndView;
    }

    @RequestMapping("/register")
    @ResponseBody
    public Msg register(UserInfo userInfo, HttpServletRequest request) {
        boolean save = false;

        save = userInfoService.saveUserInfo(userInfo);
        if (save) {
            Msg msg = new Msg();
            msg.setMsg(userInfo.getMembGagaid());
            msg.setSuccessful(true);
            return msg;
        } else {
            Msg msg = new Msg();
            msg.setSuccessful(false);
            msg.setMsg(SpringContextUtil.getMsgByKey("register.error", getLocalObject(request)));
            return msg;
        }
    }

    /**
     * 验证用户输入的验证码
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/reg/codeCheck")
    @ResponseBody
    public Msg codeCheck(HttpServletRequest request, String imageCode) {
        String code = (String) request.getSession(true).getAttribute("validateCode");
        Msg msg = new Msg();
        msg.setSuccessful(false);
        if (StringUtil.isNotEmpty(imageCode) && StringUtil.isNotEmpty(code)) {
            if (imageCode.equals(code)) {
                msg.setSuccessful(true);
            }
        }

        return msg;
    }

    /**
     * 邮箱唯一性的验证码
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/checkEmail")
    @ResponseBody
    public Msg emailCheck(HttpServletRequest request, String email) {
        Msg msg = new Msg();
        boolean success = false;
        if (StringUtil.isNotEmpty(email)) {
            success = userInfoService.findUserByEmail(email);
        }
        msg.setSuccessful(success);

        return msg;
    }

    @RequestMapping("/login")
    @ResponseBody
    public Msg login(String userName, String userPwd, HttpServletRequest request, HttpServletResponse response) {
        UserInfo userInfoFromDb = null;
        try {
            userInfoFromDb = userInfoService.loginInProxy(userName, userPwd);
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
            Cookie userNameCookie = new Cookie("userName", userName);
            Cookie userPwdCookie = new Cookie("userPwd", userPwd);
            //set cookie for expire 7days
            userNameCookie.setMaxAge(60*60*24*7);
            userPwdCookie.setMaxAge(60*60*24*7);

            response.addCookie(userNameCookie);
            response.addCookie(userPwdCookie);

            setLoginUserToSession(userInfoFromDb, request);
            Msg msg = new Msg();
            msg.setMsg("success");
            msg.setSuccessful(true);
            return msg;
        } else {
            Msg msg = new Msg();
            msg.setSuccessful(false);
            msg.setMsg(SpringContextUtil.getMsgByKey("login.errorUserNameOrPwd", getLocalObject(request)));
            return msg;
        }
    }


}
