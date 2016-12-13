/**
 * 项目名称:	OpenSource
 * 文件名称:	MySpaceController.java
 * 包名:		 com.ddas.sns.myspace
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/27
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.zone.control;

import com.ddas.common.result.Result;
import com.ddas.common.result.ResultA;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.zone.service.ZoneService;
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
@RequestMapping("/zone")
public class ZoneController extends BaseController {
    @Resource
    private ZoneService zoneService;

    /**
     *跳转到我的空间页面
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/myZone")
    public ModelAndView goToMyZone(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"zone/myZone");
        return modelAndView;
    }

    /**
     *跳转到好友动态的页面
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/friendZone")
    public ModelAndView goToFriendZone(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"zone/friendZone");
        return modelAndView;
    }

    /**
     *跳转到推荐的动态页面
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/recommendZone")
    public ModelAndView goToRecommendZone(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"zone/zoneRecommend");
        return modelAndView;
    }

    /**
     *拿到图片详情
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/get")
    @ResponseBody
    public ResultA getImage(String zoneId, HttpServletRequest request){
        ResultA result = zoneService.getImageAndZoneInfoByZoneId(zoneId, getLoginUser(request));

        return result;
    }

}
