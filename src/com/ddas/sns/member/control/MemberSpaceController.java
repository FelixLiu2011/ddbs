/**
 * 项目名称:	OpenSource
 * 文件名称:	MySpaceController.java
 * 包名:		 com.ddas.sns.myspace
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/27
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.member.control;

import com.ddas.common.util.StringUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.paypal.api.openidconnect.Userinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	MySpaceController
 * Function: 	我的空间Controller
 *
 * @author shaojunxiang
 * @date 12:30
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/memberspace")
public class MemberSpaceController extends BaseController {

    @Autowired
    private UserInfoService userInfoService;
    /**
     *点击好友名字或图标时，跳转到好友界面
     *@param
     *@Author shaojunxiang
     *@Date 2016/6/27 12:32
     *@return org.springframework.web.servlet.ModelAndView
     *@since JDK1.6
     */
    @RequestMapping("/gotoindex")
    public ModelAndView gotoIndex(String memberid, HttpServletRequest request){
        ModelAndView modelAndView=withLocal(request,"/memberspace/memberHome");
        UserInfo memberInfo = new UserInfo();
        if(StringUtil.isNotEmpty(memberid)) {
            memberInfo = userInfoService.fetchUserInfoByUserId(memberid);
            memberInfo.setUserPwd(null);
            memberInfo.setUserCoin(null);
        }
        modelAndView.addObject("memberInfo", memberInfo);
        request.getSession().setAttribute("memberInfo", memberInfo);
        setLoginUserToSession(getLoginUser(request), request);

        return modelAndView;
    }

    /**
     *获取 我的空间 首页的iframe内容
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/getMyspceContent")
    public ModelAndView getMyspceContent(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"memberspace/memberSpaceContent");
        //重新从数据库加载最新的数据
        //modelAndView.addObject("userInfo",userInfoService.queryUserInfoByUserId(getLoginUser(request).getUserId()));
        return modelAndView;
    }
}
