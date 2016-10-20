/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userphoto.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userphoto.service.UserPhotoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/userPhoto")
public class UserPhotoController extends BaseController{
    private static  final Logger LOGGER= LoggerFactory.getLogger(UserPhotoController.class);

    @Resource
    private UserPhotoService userPhotoService;

    /**
     *跳转到"我的相册" 首页
     *@Author shaojunxiang
     *@Date 2016/7/5 16:40
     *@return java.lang.String
     *@since JDK1.6
     */
    @RequestMapping("/gotoIndex")
    public ModelAndView gotoIndex(HttpServletRequest request){
        ModelAndView modelAndView=withLocal(request,"photo/index");
        return modelAndView;
    }

    /**
     *跳转到照片上传的页面
     *@Author shaojunxiang
     *@Date 2016/7/5 16:40
     *@return java.lang.String
     *@since JDK1.6
     */
    @RequestMapping("/gotoUploadPhotoIndex")
    public ModelAndView gotoUploadPhotoIndex(HttpServletRequest request){
        ModelAndView modelAndView = withLocal(request,"photo/uploadPhoto");
        return modelAndView;
    }

    /**
     * 跳转到相册的详情页
     *
     * @param groupId     相册的id
     * @param friendPhoto 是否为查看好友的相册详情{true}为是
     * @return
     */
    @RequestMapping("/photoDetail")
    public ModelAndView gotoPhotoDetail(String groupId,boolean friendPhoto,HttpServletRequest request){
        ModelAndView modelAndView = withLocal(request, "photo/photoDetail");
        modelAndView.addObject("groupId",groupId);
        modelAndView.addObject("friendPhoto",friendPhoto);
        return modelAndView;
    }

    @RequestMapping("/queryRecordsByPage")
    @ResponseBody
    public Page queryRecordsByPageByGroupId(int currentPage, int pageSize, String groupId, String friendPhoto){
        Page page = null;
        try{
            if(friendPhoto!=null&&"true".equals(friendPhoto)){//查看好友的相册(会有权限控制)
                page=userPhotoService.queryUserFriendRecordsByPage(currentPage,pageSize,groupId);
            }else{
                page = userPhotoService.queryRecordsByPage(currentPage, pageSize, groupId);
            }
        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
        }

        return page;
    }

    @RequestMapping("/getPhotoCount")
    @ResponseBody
    public int getPhotoCount(String photoGroupId, HttpServletRequest httpServletRequest){
        int count = 0;
        try{
            count = userPhotoService.getPhotoCount(photoGroupId, getLoginUser(httpServletRequest));
        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
        }

        return count;
    }

    /**
     *设置照片为封面
     * @param upId 照片的id
     * @param groupId 相册的id
     * @param request 当前请求
     *@return com.ddas.common.Msg 返回相应的Msg
     *@author shaojx
     *@date 2016/8/5 23:06
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/userThisPhotoForFace")
    @ResponseBody
    public Msg userThisPhotoForFace(String upId, String groupId, HttpServletRequest request){
        Msg msg=new Msg();
        try {
            String msgByKeyViaLocal = getMsgByKeyViaLocal("usePhoto.success");
            int updateCount = userPhotoService.userThisPhotoForFace(upId, groupId, getLoginUser(request));
            if(updateCount>0){
                msg.setSuccessful(true);
                msg.setMsg(msgByKeyViaLocal);
            }
            return msg;
        } catch (Exception e) {
           LOGGER.error("设置封面出错!",e);
            msg.setSuccessful(false);
            msg.setMsg(getMsgByKeyViaLocal("usePhoto.error"));
        }
        return msg;
    }

    /**
     *我的首页拿到最近的Photo
     * @param httpServletRequest 照片的id
     *@return com.ddas.common.Msg 返回相应的Msg
     *@author shaojx
     *@date 2016/8/5 23:06
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/getLatestPhoto")
    @ResponseBody
    public Page getLatestPhoto(String memberid, HttpServletRequest httpServletRequest){
        Page page = null;
        try{
            if(StringUtil.isNotEmpty(memberid)) {
                page = userPhotoService.getLatestPhoto(memberid);
            }else {
                page = userPhotoService.getLatestPhoto(getLoginUser(httpServletRequest).getUserId());
            }

        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
        }

        return page;
    }


}
