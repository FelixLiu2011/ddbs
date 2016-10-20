/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.usermessage.control;

import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.usermessage.domain.UserMessage;
import com.ddas.sns.usermessage.service.UserMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	FriendsControl
 * Function: 	朋友模块Controller
 *
 * @author shaojunxiang
 * @date 12:26
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/userMessage")
public class UserMessageController extends BaseController{
    private static  final Logger LOGGER= LoggerFactory.getLogger(UserMessageController.class);

    @Resource
    private UserMessageService userMessageService;

    @RequestMapping(value = "/save", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public UserMessage save(UserMessage userMessage, String memberid, HttpServletRequest request){
        if(StringUtil.isNotEmpty(memberid)) {
            userMessageService.save(userMessage, getLoginUser(request).getUserId(), memberid);
        }else{
            userMessageService.save(userMessage, getLoginUser(request).getUserId(), getLoginUser(request).getUserId());
        }

        return userMessage;
    }

    @RequestMapping(value = "/queryRecordsByPage", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getMessageList(int currentPage, int pageSize, String memberid, HttpServletRequest request){
        Page page;
        if(StringUtil.isNotEmpty(memberid)) {
            page = userMessageService.queryRecordsByPage(currentPage, pageSize, memberid);
        }else {
            page = userMessageService.queryRecordsByPage(currentPage, pageSize, getLoginUser(request).getUserId());
        }

        return page;
    }
}
