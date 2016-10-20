/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userfriend.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userfriend.domain.UserFriend;
import com.ddas.sns.userfriend.service.UserFriendService;
import com.ddas.sns.userinfo.domain.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/userFriend")
public class UserFriendController extends BaseController {
    private static  final Logger LOGGER= LoggerFactory.getLogger(UserFriendController.class);

    @Resource
    private UserFriendService userFriendService;

    /**
     * 分页查找userFriendList
     *@param currentPage
     *@param pageSize
     *@param userFriend
     *@param httpServletRequest
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/1 14:51
     *@since JDK1.6
     */
    @RequestMapping(value = "/queryRecordsByPage", method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Page getFriendList(int currentPage, int pageSize, UserFriend userFriend, HttpServletRequest httpServletRequest){
        return userFriendService.queryRecordsByPage(currentPage, pageSize, userFriend, getLoginUser(httpServletRequest));
    }

    /**
     * 跳转到我的好友界面
     *@Author liuchen6
     *@Date 2016/7/1 14:52
     *@param
     *@return org.springframework.web.servlet.ModelAndView
     *@since JDK1.6
     */
    @RequestMapping(value = "/myFriend", method = {RequestMethod.GET})
    public ModelAndView goToMyFriendPage(HttpServletRequest request) {
        ModelAndView modelAndView = containLocal(request);
        modelAndView.setViewName("myspace/myFriendPage");
        return modelAndView;
    }

    /**测试跳转photo页面可以删除
     *@Author liuchen6
     *@Date 2016/7/1 14:58
     *@param
     *@return org.springframework.web.servlet.ModelAndView
     *@since JDK1.6
     */
    @RequestMapping(value = "/photo", method = {RequestMethod.GET})
    public ModelAndView goToPhotoPage() {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("photo/photo1");
        return modelAndView;
}

    /**
     * 新建或者更新好友
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@param userFriend
     *@return com.ddas.sns.userfriend.domain.UserFriend
     *@since JDK1.6
     */
    @RequestMapping(value = "/save", method = {RequestMethod.POST})
    @ResponseBody
    public Msg saveUserFriend(UserFriend userFriend, HttpServletRequest httpServletRequest){
        Msg msg = new Msg();
        boolean saveSuccess = userFriendService.saveUserFriend(userFriend, getLoginUser(httpServletRequest));
        msg.setSuccessful(saveSuccess);
        if(saveSuccess) {
            msg.setMsg("保存成功！");
        }

        return msg;
    }

    /**
     * 同意添加好友
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@param userFriend
     *@return com.ddas.sns.userfriend.domain.UserFriend
     *@since JDK1.6
     */
    @RequestMapping(value = "/saveNewFriend", method = {RequestMethod.POST})
    @ResponseBody
    public Msg saveNewFriend(UserFriend userFriend, HttpServletRequest httpServletRequest){
        Msg msg = new Msg();
        boolean saveSuccess = false;
        try {
            saveSuccess = userFriendService.saveNewFriend(userFriend, getLoginUser(httpServletRequest));
        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
        }
        msg.setSuccessful(saveSuccess);
        if(saveSuccess) {
            msg.setMsg("添加好友成功！");
        }else {
            msg.setMsg("添加好友失败！");
        }

        return msg;
    }

    /**
     * 申请添加好友
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@param userFriend
     *@return com.ddas.sns.userfriend.domain.UserFriend
     *@since JDK1.6
     */
    @RequestMapping(value = "/applyFriend", method = {RequestMethod.POST})
    @ResponseBody
    public Msg applyFriend(UserFriend userFriend, HttpServletRequest httpServletRequest){
        Msg msg = new Msg();
        if(StringUtil.isEmpty(userFriend.getStatus()) || !"1".equals(userFriend.getStatus())) {
            List<UserFriend> list = userFriendService.findUserFriendByUserIdAndFriendId(userFriend.getUserId() ,getLoginUser(httpServletRequest).getUserId());
            if(list != null && list.size() > 0) {
                msg.setMsg(getMsgByKeyViaLocal("index.confirmAddFriend.duplicate.error"));
                msg.setSuccessful(true);
                return msg;
            }
        }
        boolean saveSuccess = userFriendService.applyFriend(userFriend, getLoginUser(httpServletRequest));
        msg.setSuccessful(saveSuccess);
        if(saveSuccess) {
            msg.setMsg("添加好友成功！");
        }

        return msg;
    }

    /**
     * 删除好友
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@param userFriend
     *@return com.ddas.sns.userfriend.domain.UserFriend
     *@since JDK1.6
     */
    @RequestMapping(value = "/delete", method = {RequestMethod.POST})
    @ResponseBody
    public UserFriend deleteUserFriend(UserFriend userFriend){
        userFriendService.deleteUserFriend(userFriend);
        return userFriend;
    }

    /**
     * 查询好友的Blog
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@return com.ddas.sns.userfriend.domain.UserFriend
     *@since JDK1.6
     */
    @RequestMapping(value = "/queryFriendBlogByPage", method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Page getFriendsBlogList(int currentPage, int pageSize, HttpServletRequest request){
        Page page = new Page();
        try {
            page = userFriendService.queryUserFriendBlogByPage(currentPage, pageSize,getLoginUser(request));
        }catch (Exception e){
            LOGGER.error(e.getMessage(),e);
        }

        return page;
    }


}
