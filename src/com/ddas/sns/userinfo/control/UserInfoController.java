/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userinfo.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userfriend.domain.UserFriend;
import com.ddas.sns.userfriend.service.UserFriendService;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.ddas.sns.userphoto.domain.UserPhoto;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
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
@RequestMapping("/userInfo")
public class UserInfoController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserInfoController.class);

    @Resource
    private UserInfoService userInfoService;

    /**
     * 分页查找userList
     *
     * @param currentPage
     * @param pageSize
     * @param httpServletRequest
     * @return com.ddas.common.page.Page
     * @Author liuchen6
     * @Date 2016/7/1 14:51
     * @since JDK1.6
     */
    @RequestMapping(value = "/queryUserListExcludeMe", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getUserListExcludeMe(int currentPage, int pageSize, String searchUserName, HttpServletRequest httpServletRequest) {
        return userInfoService.queryUserListExcludeMe(currentPage, pageSize, searchUserName, getLoginUser(httpServletRequest));
    }

    /**
     * 拿到推荐的userList
     *
     * @param currentPage
     * @param pageSize
     * @param httpServletRequest
     * @return com.ddas.common.page.Page
     * @Author liuchen6
     * @Date 2016/7/1 14:51
     * @since JDK1.6
     */
    @RequestMapping(value = "/queryUserListExcludeMeAndRecommend", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getUserListExcludeMeAndRecommend(int currentPage, int pageSize, String recommendType, HttpServletRequest httpServletRequest) {
        return userInfoService.queryUserListExcludeMeAndRecommend(currentPage, pageSize, recommendType, getLoginUser(httpServletRequest));
    }

    /**
     * 修改用户的头像照片
     *
     * @param headPhoto file 类型
     * @param request   当前请求
     * @return com.ddas.common.Msg
     * @author shaojx
     * @date 2016/8/6 0006 16:25
     * @version 1.0
     * @since 1.6
     */
    @RequestMapping("/changeHeadPhoto")
    @ResponseBody
    public Map<String, Object> changeHeadPhoto(@RequestParam MultipartFile headPhoto, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        Msg msg = new Msg();
        String fileName = "";
        msg.setSuccessful(false);
        msg.setMsg(getMsgByKeyViaLocal("fileupload.error"));
        if (headPhoto.isEmpty()) {
            msg.setSuccessful(false);
            msg.setMsg(getMsgByKeyViaLocal("fileupload.error"));
        } else {
            try {
                fileName = headPhoto.getOriginalFilename();
                //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\文件夹中
                String realPath = request.getServletContext().getRealPath("/upload/");
                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
                int indexOfDot = headPhoto.getOriginalFilename().lastIndexOf(".");
                String fileType = "";
                if (indexOfDot > -1) {
                    fileType = fileName.substring(indexOfDot);
                }
                String newFileName = UUIDUtil.createUUID16() + fileType;
                FileUtils.copyInputStreamToFile(headPhoto.getInputStream(), new File(realPath, newFileName));
                String userId = request.getParameter("userId");
                //如果存在PhotoGroup
                if (StringUtil.isNotEmpty(userId)) {
                    String headPhotoUrl="/upload/" + newFileName;
                    int updateUserInfoHeadPhoto = userInfoService.updateUserInfoHeadPhoto(userId, headPhotoUrl);
                    UserInfo userInfo = userInfoService.queryUserInfoByUserId(userId);
                    setLoginUserToSession(userInfo, request);
                    if(updateUserInfoHeadPhoto==1){//表示更新了一条记录
                        result.put("imagePath",headPhotoUrl);//设置照片的url
                        msg.setSuccessful(true);
                        msg.setMsg(getMsgByKeyViaLocal("fileupload.success"));

                    }
                }
            } catch (IOException e) {
                LOGGER.error("修改头像失败!", e);
                msg.setSuccessful(false);
                msg.setMsg(getMsgByKeyViaLocal("fileupload.error"));
            }
        }
        //result.put("error","");
        result.put("msg", msg);
        return result;
    }

    /**
     *更新用户的信息
     * @param userInfo 用户的信息
     * @param request 当前的请求
     *@return com.ddas.common.Msg 更新的信息
     *@author shaojx
     *@date 2016/8/20 21:48
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/update")
    @ResponseBody
    public Msg updateUserInfo(UserInfo userInfo, HttpServletRequest request) {
        Msg msg = new Msg();
        UserInfo newUserInfo = null;
        try {
            newUserInfo = userInfoService.updateUserInfo(userInfo);
            HttpSession session = request.getSession();
            synchronized (session) {//reset user info into session (thread safe)
                setLoginUserToSession(newUserInfo, request);
            }
            if (newUserInfo != null) {
                msg.setSuccessful(true);
                msg.setMsg(getMsgByKeyViaLocal("updateUserInfo.success", request));
            }
        } catch (Exception e) {
            LOGGER.error("更新用户资料失败!", e);
            msg.setSuccessful(false);
            msg.setMsg(getMsgByKeyViaLocal("updateUserInfo.fail",request));
        }
        return msg;
    }

    @RequestMapping("/changePwd")
    @ResponseBody
    public Msg changePwd(String oldPwd, String newPwd, String repeatPwd, HttpServletRequest request) {
        Msg msg = new Msg();
        if (StringUtil.isEmpty(oldPwd) || StringUtil.isEmpty(newPwd) || StringUtil.isEmpty(repeatPwd)) {
            //nerver happen this
            msg.setSuccessful(false);
            msg.setMsg(getMsgByKeyViaLocal("login.sysError", request));
            return msg;
        }
        Map<String, Object> stringObjectMap = userInfoService.comparePwd(oldPwd, newPwd, getLoginUser(request));
        Boolean success = (Boolean) stringObjectMap.get("success");
        if(success){//success
            msg.setMsg(getMsgByKeyViaLocal("changePwd.success",request));
            msg.setSuccessful(true);
        }else{
            int reason=(Integer)stringObjectMap.get("reason");
            if(-9999==reason){//用户不存在，当作系统错误处理
                msg.setSuccessful(false);
                msg.setMsg(getMsgByKeyViaLocal("login.sysError", request));
                return msg;
            }else if(-1==reason){//输入的旧密码与数据库中不一致
                msg.setSuccessful(false);
                msg.setMsg(getMsgByKeyViaLocal("changePwd.notSame", request));
                return msg;
            }//....
        }
        return msg;
    }
}
