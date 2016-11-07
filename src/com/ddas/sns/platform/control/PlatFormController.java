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
import javax.servlet.http.HttpServletRequest;

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
    public Msg regMember(String sex, String language, String uuid) {
        UserInfo userInfo = userInfoService.fetchUserInfoByUserId(uuid);
        userInfo.setUserSex(sex);
        // TODO: 2016/11/7 设置语言
        userInfoService.save(userInfo);
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
    public Msg register(@RequestBody UserInfo userInfo, HttpServletRequest request) {
        boolean save = false;

        try {
            String ip = "";
            String address = "";
            AddressUtils addressUtils = new AddressUtils();
            ip = addressUtils.getIpAddr(request);
            address = addressUtils.getAddresses(ip, "utf-8");
            userInfo.setLoginIp(ip);
            userInfo.setLoginAddress(address);
            if (address.contains("中国")) {
                userInfo.setUserStatus("0");//用0表示中国用户，前台会拦截掉，后台会进行登录审核，审核通过的
            }
        }catch (Exception e){
            LOGGER.error(e.getMessage(), e);
        }

        save = userInfoService.save(userInfo);
        if (save) {
            Msg msg = new Msg();
            msg.setMsg(SpringContextUtil.getMsgByKey("register.success", getLocalObject(request)));
            msg.setSuccessful(true);
            return msg;
        } else {
            Msg msg = new Msg();
            msg.setSuccessful(false);
            msg.setMsg(SpringContextUtil.getMsgByKey("register.error", getLocalObject(request)));
            return msg;
        }
    }

}
