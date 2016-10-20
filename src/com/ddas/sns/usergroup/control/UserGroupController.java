/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.usergroup.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.usergroup.domain.UserGroup;
import com.ddas.sns.usergroup.service.UserGroupService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * ClassName:	FriendsControl
 * Function: 	朋友模块Controller
 *
 * @author shaojunxiang
 * @date 12:26
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/userGroup")
public class UserGroupController extends BaseController{
    private static final Logger LOGGER= LoggerFactory.getLogger(UserGroupController.class);
    private static final String DEFAULT_GROUP = "Default Group";

    @Resource
    private UserGroupService userGroupService;

    /**
     * 保存用户分组
     *@return com.ddas.sns.usergroup.domain.UserGroup
     *@Author liuchen6
     *@Date 2016/7/5 9:27
     *@since JDK1.7
     */
    @RequestMapping("/save")
    @ResponseBody
    public Msg saveUserGroup(UserGroup userGroup, HttpServletRequest httpServletRequest) {
        Msg msg = new Msg();
        boolean success = false;
        try{
            success = userGroupService.saveUserGroup(userGroup, getLoginUser(httpServletRequest));
            msg.setMsg("保存分组成功!");
        }catch (Exception e) {
            msg.setMsg("保存分组失败!");
            LOGGER.error(e.getMessage(), e);
        }
        msg.setSuccessful(success);

        return msg;
    }

    @RequestMapping(value = "/queryRecordsByPage", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getGroupList(int currentPage, int pageSize, String useProperty, HttpServletRequest httpServletRequest){
        Page page = userGroupService.queryRecordsByPage(currentPage, pageSize, useProperty, getLoginUser(httpServletRequest));
        List<UserGroup> list = (List<UserGroup>) page.getDataList();
        for (UserGroup userGroup : list) {
            if(DEFAULT_GROUP.equals(userGroup.getGroupName())) {
                userGroup.setGroupName(getMsgByKeyViaLocal("defaultGroup"));
            }
        }

        return page;
    }

    @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public UserGroup deleteUserGroup(UserGroup userGroup){
        userGroupService.deleteUserGroup(userGroup);
        return userGroup;
    }
}
