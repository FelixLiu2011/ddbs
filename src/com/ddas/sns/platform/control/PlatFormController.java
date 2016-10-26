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
import com.ddas.sns.common.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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

}
