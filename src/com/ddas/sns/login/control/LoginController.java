/**
 * 项目名称:	SelfCreation
 * 文件名称:	LoginController.java
 * 包名:		 com.ddas.sns.login.control
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/7/6
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.login.control;

import com.ddas.common.Msg;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.login.service.MailService;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.ddas.sns.util.AddressUtils;
import com.ddas.sns.util.DESCoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * ClassName:	LoginController
 * Function: 	登录Controller
 *
 * @author shaojunxiang
 * @date 12:30
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    private static final Logger LOGGER= LoggerFactory.getLogger(LoginController.class);
    @Resource
    private UserInfoService userInfoService;
    @Resource
    private MailService mailService;

    @RequestMapping("/gotoLogin")
    public ModelAndView gotoLogin(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //判断 cookie中的内容
        Cookie[] cookies = request.getCookies();
        String userName = null;
        String userPwd = null;
        String remeberme = null;
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            String value = cookie.getValue();
            if ("userName".equals(name)) {
                userName = value;
            }
            if ("userPwd".equals(name)) {
                userPwd = value;
            }
            if ("remeberme".equals(name)) {
                remeberme = value;
            }
        }
        if ((userName != null && userPwd != null)) {
            UserInfo userInfo = new UserInfo();
            userInfo.setUserName(userName);
            userInfo.setUserPwd(userPwd);
            UserInfo userInfoFromDb = userInfoService.loginInProxy(userInfo);
            if (userInfoFromDb != null) {
                modelAndView.setViewName("redirect:/index/gotoIndex");//直接跳转到首页
                setLoginUserToSession(userInfoFromDb, request);//设置用户到session中
            }
        } else {
            //locale 只为了前端页面的 validator的国际化
            String local = getLocal(request);
            modelAndView.setViewName("login/login");
            modelAndView.addObject("local",local);
        }
        return modelAndView;
    }

    @RequestMapping("/in")
    @ResponseBody
    public Msg login(@RequestParam String remeberme, @RequestBody UserInfo userInfo, HttpServletRequest request, HttpServletResponse response) {
        UserInfo userInfoFromDb = null;
        try {
            userInfoFromDb = userInfoService.loginInProxy(userInfo);
        } catch (Exception e) {
            LOGGER.error("系统出现错误!",e);
            Msg msg = new Msg();
            msg.setSuccessful(false);
            String msgByKey = SpringContextUtil.getMsgByKey("login.sysError", getLocalObject(request));
            msg.setMsg(msgByKey);
            return msg;
        }

        boolean loginInResult = userInfoFromDb != null;
        if (loginInResult) {
            if (remeberme != null && remeberme.equals("true")) {//保存用户名到cookie
                Cookie userNameCookie = new Cookie("userName", userInfo.getUserName());
                Cookie userPwdCookie = new Cookie("userPwd", userInfo.getUserPwd());
                Cookie userRemermeCookie = new Cookie("remeberme", remeberme);
                //set cookie for expire 7days
                userNameCookie.setMaxAge(60*60*24*7);
                userPwdCookie.setMaxAge(60*60*24*7);
                userRemermeCookie.setMaxAge(60*60*24*7);

                response.addCookie(userNameCookie);
                response.addCookie(userPwdCookie);
                response.addCookie(userRemermeCookie);
            }

            try {//记录登录IP和地址
                String ip = "";
                String address = "";
                AddressUtils addressUtils = new AddressUtils();
                ip = addressUtils.getIpAddr(request);
                address = addressUtils.getAddresses(ip, "utf-8");
                userInfoFromDb.setLoginIp(ip);
                userInfoFromDb.setLoginAddress(address);
                userInfoService.save(userInfoFromDb);
            }catch (Exception e){
                LOGGER.error(e.getMessage(), e);
            }

            setLoginUserToSession(userInfoFromDb, request);
            Msg msg = new Msg();
            msg.setMsg("success");
            msg.setSuccessful(true);
            return msg;
        } else {
            Msg msg = new Msg();
            msg.setSuccessful(false);
            msg.setMsg(SpringContextUtil.getMsgByKey("login.errorUserNameOrPwd", getLocalObject(request)));
            return msg;
        }
    }

    /**
     * 跳转到注册页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/gotoRegister")
    public ModelAndView gotoRegister(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "login/register");
        return modelAndView;
    }

    /**
     * 跳转到首页，清除session中的user信息
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/out")
    @ResponseBody
    public Msg logOut(HttpServletRequest request) {
        request.getSession(true).removeAttribute("userInfo");
        Msg msg = new Msg();
        msg.setSuccessful(true);

        return msg;
    }

    /**
     * 跳转到登录页面
     *
     * @return java.lang.String
     * @Author shaojunxiang
     * @Date 2016/7/8 16:34
     * @since JDK1.6
     */
    @RequestMapping("/gotoLoginPage")
    public ModelAndView gotoLoginPage(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "login/login");
        return modelAndView;
    }

    @RequestMapping("/register")
    @ResponseBody
    public Msg register(@RequestBody UserInfo userInfo, String repeatPwd, HttpServletRequest request) {
        boolean save = false;

        try {
            String ip = "";
            String address = "";
            AddressUtils addressUtils = new AddressUtils();
            ip = addressUtils.getIpAddr(request);
            address = addressUtils.getAddresses(ip, "utf-8");
            userInfo.setLoginIp(ip);
            userInfo.setLoginAddress(address);
            if (address.contains("中国")) {
                userInfo.setUserStatus("0");//用0表示中国用户，前台会拦截掉，后台会进行登录审核，审核通过的
            }
        }catch (Exception e){
            LOGGER.error(e.getMessage(), e);
        }

        save = userInfoService.save(userInfo);
        if (save) {
            Msg msg = new Msg();
            msg.setMsg(SpringContextUtil.getMsgByKey("register.success", getLocalObject(request)));
            msg.setSuccessful(true);
            return msg;
        } else {
            Msg msg = new Msg();
            msg.setSuccessful(false);
            msg.setMsg(SpringContextUtil.getMsgByKey("register.error", getLocalObject(request)));
            return msg;
        }
    }

    /**
     * 判断用户名是否被注册
     * @param username
     * @return
     */
    @RequestMapping("/identifyUserName")
    @ResponseBody
    public Map<String, Object> identifyUserName(@RequestParam String username) {
        boolean resigertied = userInfoService.findUserByName(username);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("valid", resigertied);
        return result;
    }

    @RequestMapping("/resetpwd")
    @ResponseBody
    public Msg resetPwd(String userName,String email,HttpServletRequest request){
       Msg msg=new Msg();
        //先确认用户名与邮箱是否匹配
        UserInfo userInfo = userInfoService.fetchUserInfoByUserName(userName);
        if(userInfo==null||email==null||!email.equals(userInfo.getUserEmail())){//不匹配
            msg.setSuccessful(false);
            msg.setMsg(SpringContextUtil.getMsgByKey("login.resetPwd.eamilError", getLocalObject(request)));
            return msg;
        }
        //发送邮件
        //1.加密
      //  String encodedUserName = DESCoder.getEncodedStr(userInfo.getUserName());
      //  String encodedUserEmail = DESCoder.getEncodedStr(userInfo.getUserEmail());
        String encodedUserId = DESCoder.getEncodedStr(userInfo.getUserId());
        mailService.sendResetPwdEmail(userInfo.getUserEmail(),encodedUserId);
        msg.setSuccessful(true);
        return msg;
    }

    /**
     * 跳转到重置密码的页面
     * @param reuqest    请求
     * @param encodedKey 加密的用户id
     * @param email      用户的邮箱
     * @return org.springframework.web.servlet.ModelAndView
     * @author shaojx
     * @date 2016/7/22 22:21
     * @version 1.0
     * @since 1.6
     */
    @RequestMapping("/gotoResetPwdPage")
    public ModelAndView gotoResetPwdPage(HttpServletRequest reuqest,@RequestParam("key") String encodedKey,String email){
        ModelAndView modelAndView = containLocal(reuqest);
        modelAndView.setViewName("login/resetPwdPage");
        modelAndView.addObject("encodedKey",encodedKey);
        return modelAndView;
    }

    /**
     *重置用户的密码
     * @param resetPwd 重置的密码
     * @param repeatPwd 重置密码的repeat
     * @param encodedKey 加密的用户的id
     *@return com.ddas.common.Msg
     *@author shaojx
     *@date 2016/7/22 23:26
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/doResetPwd")
    @ResponseBody
    public Msg doRestPwd(String resetPwd,String repeatPwd,String encodedKey){
        Msg msg=new Msg();
        String userId=DESCoder.getDecodedStr(encodedKey);//decode user key (id)
        if(StringUtil.isEmpty(userId)){
            msg.setSuccessful(false);
            msg.setMsg("login.resetPwd.error");
            LOGGER.error("用户id为空,重置失败!",new IllegalArgumentException());
            return msg;
        }
        //check user is existed(when the server is shut down,so the DESCoder will not be same as the last instance,
        // so check user info for secure!) this will be optimize in the future! // FIXME: 2016/9/8
        UserInfo userInfo = userInfoService.fetchUserInfoByUserId(userId);
        if(userInfo==null){
            msg.setSuccessful(false);
            msg.setMsg("login.resetPwd.error");
            LOGGER.error("找不到对应的用户信息(可以在期间重启了服务器--导致加密实例不一致！),重置失败!",new IllegalArgumentException());
            return msg;
        }
        int count = userInfoService.resetPwd(userId, resetPwd);
        if(count==1){
            msg.setSuccessful(true);
            msg.setMsg(getMsgByKeyViaLocal("login.resetPwd.success"));
        }
        return msg;
    }

    /**
     * 根据用户名来查找对应的注册用户信息
     * @param userName 用户名
     * @return
     */
    @RequestMapping("/fetchEmailByUserName")
    @ResponseBody
    public Msg fetchEmailByUserName(String userName){
        if(StringUtil.isEmpty(userName)){
            return new Msg();
        }
        UserInfo userInfo= userInfoService.fetchUserInfoByUserName(userName);
        if(userInfo!=null){
            Msg msg=new Msg();
            msg.setMsg(userInfo.getUserEmail());
            msg.setSuccessful(true);
            return msg;
        }
        return new Msg();
    }
}
