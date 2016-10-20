/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userphotogroup.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userphotogroup.domain.UserPhotoGroup;
import com.ddas.sns.userphotogroup.service.UserPhotoGroupService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:	FriendsControl
 * Function: 	朋友模块Controller
 *
 * @author shaojunxiang
 * @date 12:26
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/userPhotoGroup")
public class UserPhotoGroupController extends BaseController{
    private static  final Logger LOGGER= LoggerFactory.getLogger(UserPhotoGroupController.class);

    @Resource
    private UserPhotoGroupService userPhotoGroupService;

    /**
     * 保存用户分组
     *@param userPhotoGroup
     *@return com.ddas.sns.usergroup.domain.UserGroup
     *@Author liuchen6
     *@Date 2016/7/5 9:27
     *@since JDK1.7
     */
    @RequestMapping("/save")
    @ResponseBody
    public Msg saveUserGroup(UserPhotoGroup userPhotoGroup, HttpServletRequest request) {
        Msg msg=new Msg();
        try {
            userPhotoGroupService.saveUserGroup(userPhotoGroup,getLoginUser(request));
            msg.setSuccessful(true);
        } catch (Exception e) {
           LOGGER.error("保存相册失败!",e);
            msg.setSuccessful(false);
        }
        return msg;
    }

    /**
     *根据groupID来更新相应的相册
     * @param userPhotoGroup 相册
     * @param request
     *@return com.ddas.common.Msg
     *@author shaojx
     *@date 2016/8/15 23:31
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/update")
    @ResponseBody
    public Msg updatePhotoGroup(UserPhotoGroup userPhotoGroup,HttpServletRequest request){
        Msg msg=new Msg();
        try {
            int updatePhotoGroup = userPhotoGroupService.updatePhotoGroup(userPhotoGroup, getLoginUser(request));
            if(updatePhotoGroup==1){
                msg.setSuccessful(true);
            }
        } catch (Exception e) {
            LOGGER.error("更新相册失败!",e);
            msg.setSuccessful(false);
        }
        return msg;
    }

    @RequestMapping(value = "/queryRecordsByPage", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getGroupList(String memberid, int currentPage, int pageSize, HttpServletRequest request){
        Page page;
        if(StringUtil.isNotEmpty(memberid)) {
            page = userPhotoGroupService.queryRecordsByPage(currentPage, pageSize, memberid);
        }else {
            page = userPhotoGroupService.queryRecordsByPage(currentPage, pageSize, getLoginUser(request).getUserId());
        }
        return page;
    }

    @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Msg deletePhotoGroup(String groupId){
        Msg msg=new Msg();
        msg.setSuccessful(false);
        try {
            int deleteCount = userPhotoGroupService.deletePhotoGroup(groupId);
            if(deleteCount==1){
                msg.setSuccessful(true);
            }
        } catch (Exception e) {
            LOGGER.error("删除相册失败!",e);
        }
        return msg;
    }

    /**
     *获取相应的好友的相册(相册的privilege为2或者为1)
     * NOTE:privilege=1---分组可见 还未实现
     * @param currentPage
     * @param pageSize
     * @param request
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/8/15 22:57
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping(value = "/queryFriendPhotoGroupRecordsByPage", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getFriendPhotoGroupList(int currentPage, int pageSize, HttpServletRequest request){
        Page page = new Page();
        try {
            page = userPhotoGroupService.queryFriendPhotoGroupRecordsByPage(currentPage, pageSize, getLoginUser(request));
        }catch (Exception e){
            LOGGER.error(e.getMessage(), e);
        }
        return page;
    }

    /**
     *根据相册组的id来查询对应的相册封面以及相册的照片数量
     * @param groupId 相册组的id
     * @param request
     *@return java.util.Map<java.lang.String,java.lang.String>
     *@author shaojx
     *@date 2016/8/4 23:28
     *@version 1.0
     *@since 1.6
     */
    @ResponseBody
    @RequestMapping("/queryPhotoFaceAndCount")
    public Map<String,String> queryPhotoFaceAndCount(String groupId, HttpServletRequest request){
        Map<String,String> result=userPhotoGroupService.queryPhotoFaceAndCount(groupId);
        return result;
    }
}
