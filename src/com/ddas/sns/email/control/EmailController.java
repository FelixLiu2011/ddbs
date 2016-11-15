/**
 * 项目名称:	OpenSource
 * 文件名称:	FriendsControl.java
 * 包名:		 com.ddas.sns.friends.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.email.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.email.domain.UserEmail;
import com.ddas.sns.email.service.EmailService;
import com.ddas.sns.privilege.service.PrivilegeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	EmailController
 * Function: 	邮件Controller
 *
 * @author shaojunxiang
 * @date 12:26
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/email")
public class EmailController extends BaseController{
    private static  final Logger LOGGER= LoggerFactory.getLogger(EmailController.class);

    @Resource
    private EmailService emailService;

    @Autowired
    private PrivilegeService privilegeService;

    /**
     *升级会员页面
     *@return java.lang.String 升级会员的页面
     *@author shaojx
     *@date 2016/7/8 21:45
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/gotoIndex")
    public ModelAndView gotoEmail(HttpServletRequest httpServletRequest){
        ModelAndView mav = withLocal(httpServletRequest,"email/index");
        mav.addObject("currentLoginUserId", getLoginUser(httpServletRequest).getUserId());
        return mav;
    }

    @RequestMapping("/save")
    @ResponseBody
    public Msg save(UserEmail userEmail, HttpServletRequest request){
        Msg msg=new Msg();
        msg.setSuccessful(false);
        try {
            int save = emailService.save(userEmail, getLoginUser(request));
            if(save==1){
                msg.setSuccessful(true);
            }
        } catch (Exception e) {
            LOGGER.error("新建邮件或者回复邮件失败！",e);
            msg.setSuccessful(false);
        }
        return msg;
    }

    @RequestMapping(value = "/queryRecordsByPage", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getGroupList(int currentPage, int pageSize, UserEmail userEmail, HttpServletRequest httpServletRequest){
        Page page = new Page();
        try{
            page = emailService.queryRecordsByPage(currentPage, pageSize, userEmail, getLoginUser(httpServletRequest));
        }catch (Exception e){
            LOGGER.error(e.getMessage(), e);
        }
        return page;
    }

    /**
     *获取相应的回复列表
     * @param emailId 邮件的id
     * @param pageNo 当前的页码
     * @param pageSize 每页的数据量
     * @param request 当前请求
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/8/10 21:35
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/fetchEmailDetailByEmailId")
    @ResponseBody
    public Page fetchEmailDetailByEmailId(String emailId,int pageNo,int pageSize,HttpServletRequest request){
        Page page=emailService.fetchEmailDetailByEmailId(emailId,pageNo,pageSize,getLoginUser(request));
        return page;
    }

    /**
     *回复邮件
     * @param emailId 回复邮件的id
     * @param senderId 当前邮件的发送者
     * @param request 当前请求
     * @param emailContent 回复内容
     *@return com.ddas.common.Msg
     *@author shaojx
     *@date 2016/8/10 21:47
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/reply")
    @ResponseBody
    public Msg reply(String emailId,String senderId,String emailContent,HttpServletRequest request){
        Msg msg=new Msg();
        msg.setSuccessful(false);
        try {
            int reply = emailService.reply(emailId, senderId,emailContent, getLoginUser(request));
            if(reply==1){
                msg.setSuccessful(true);
            }
        } catch (Exception e) {
           LOGGER.error("回复邮件失败！",e);
            msg.setSuccessful(false);
        }
        return msg;
    }

    /**
     *查询每天的限额值
     * @param request
     *@return com.ddas.common.Msg @see msg.setSuccessful==true表示超过
     *@author shaojx
     *@date 2016/8/17 22:12
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/checkDailyEmailCount")
    @ResponseBody
    public Msg checkDailyEmailCount(HttpServletRequest request){
        boolean overFlow = false;
        Msg msg=new Msg();
        try {
            overFlow = privilegeService.checkDailyEmailCountOverFlow(getLoginUser(request));
        } catch (Exception e) {
            LOGGER.error("查询每天的限额值失败!",e);
        }
        msg.setSuccessful(overFlow);
        return msg;
    }

}
