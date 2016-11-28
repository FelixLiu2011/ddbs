/**
 * 项目名称:	OpenSource
 * 文件名称:	MySpaceController.java
 * 包名:		 com.ddas.sns.myspace
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/27
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.member.control;

import com.ddas.common.result.Result;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.member.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
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
@RequestMapping("/member")
public class MemberController extends BaseController {
    @Resource
    private MemberService memberService;

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/like/likeMe")
    public ModelAndView getLikeMeContent(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/likeMe");
        return modelAndView;
    }

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/like/iLike")
    public ModelAndView getILikeContent(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/iLike");
        return modelAndView;
    }

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/like/likeMeAndILike")
    public ModelAndView getLikeMeAndILikeContent(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/iLike");
        return modelAndView;
    }

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/visitor/myVisitor")
    public ModelAndView getMyVisitorContent(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/myVisitor");
        return modelAndView;
    }

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/memberInformation")
    public ModelAndView goToMemberInformation(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/memberInformation");
        return modelAndView;
    }

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/myInformation")
    public ModelAndView goToMyInformation(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/myInformation");
        return modelAndView;
    }
    @RequestMapping("/getMemberId")
    @ResponseBody
    public Result getMemberId(String mid) {
        return memberService.getMemberId(mid);
    }
}
