package com.ddas.sns.admin.control;

import com.ddas.sns.common.BaseController;
import com.ddas.sns.userinfo.domain.UserInfo;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	AdminBaseController
 * Function: 	管理员模块的AdminBaseController,这个类继承自BaseController并覆盖了一些相应的Admin相关的方法
 *
 * @author shaojx
 * @date 2016/9/8 21:29
 * @since JDK 1.6
 */
public class AdminBaseController extends BaseController {

    public static final String ADMIN_USER_INFO = "adminUserInfo";

    @Override
    public void setLoginUserToSession(UserInfo userInfo, HttpServletRequest request) {
        userInfo.setUserPwd(null);
        String userCoin = userInfo.getUserCoin();
        userInfo.setUserCoin((userCoin ==null||"".equals(userCoin))?"0":userCoin);//reset userCoin
        //set `adminUserInfo` into session,different from @link{super.setLoginUserToSession()}
        request.getSession(true).setAttribute(ADMIN_USER_INFO, userInfo);
    }

    @Override
    public UserInfo getLoginUser(HttpServletRequest request) {
        return (UserInfo) request.getSession(true).getAttribute(ADMIN_USER_INFO);
    }


    /**
     *这个方法用来检测是否为一个x-pjax的请求，所有的页面是通过pjax来请求获取，如果当一个请求不是pjax请求(例如:手动刷新了页面)，则直接
     * 跳转到首页
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/9/15 11:27
     *@version 1.0
     *@since 1.6
     */
    public ModelAndView checkIsXPjaxReuqest(HttpServletRequest request){
        String xpjax = request.getHeader("X-PJAX");
        if(xpjax!=null&&"true".equals(xpjax)){
            return null;
        }
        return withLocal(request,"redirect:gotoIndex");
    }
}
