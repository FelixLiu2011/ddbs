/**
 * 项目名称:	SelfCreation
 * 文件名称:	SessionListenerImpl.java
 * 包名:		 com.ddas.sns
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/12/3
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.listener;

import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * ClassName:	SessionListenerImpl
 * Function: 	监听用户Session的生命周期(监控用户的在线信息)
 *
 * @author shaojunxiang
 * @date 15:13
 * @since JDK 1.6
 */
public class SessionListenerImpl implements HttpSessionListener {
    private static final Logger LOGGER = LoggerFactory.getLogger(SessionListenerImpl.class);

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        UserInfo userInfo = (UserInfo) session.getAttribute(SessionConstants.USER_INFO);
        if (userInfo != null) {
            /*get user service*/
            UserInfoService userInfoService = SpringContextUtil.getBean(UserInfoService.class);
            String membGagaid = userInfo.getMembGagaid();
            //update user status into db
            LOGGER.info(">>>>>>>>>>>>>>>>>>user::" + membGagaid + ",is online!");
            userInfo.setIfOnline("1");//set status is `online`
            userInfoService.updateUserOnlineStatus(userInfo);
        }
    }


    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        UserInfo userInfo = (UserInfo) session.getAttribute(SessionConstants.USER_INFO);
        if (userInfo != null) {
            String membGagaid = userInfo.getMembGagaid();
            /*get user service*/
            UserInfoService userInfoService = SpringContextUtil.getBean(UserInfoService.class);
            //delete user status form db
            LOGGER.info(">>>>>>>>>>>>>>>>>>user::" + membGagaid + ",is offline!");
            userInfo.setIfOnline("0");//set status is `offline`
            userInfoService.updateUserOnlineStatus(userInfo);
        }
    }
}
