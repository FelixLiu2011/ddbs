package com.ddas.common.interceptor;


import com.ddas.sns.userinfo.domain.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 管理员登录Interceptor,这个拦截器只针对管理员
 * 详见配置ddas-servlet.xml
 */
public class AdminLoginRequiredInterceptor implements HandlerInterceptor {
    private static final Logger LOGGER = LoggerFactory.getLogger(AdminLoginRequiredInterceptor.class);

    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse reponse, Object arg2, Exception arg3)
            throws Exception {
    }

    public void postHandle(HttpServletRequest req, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

    }

    public boolean preHandle(HttpServletRequest req, HttpServletResponse response,
                             Object handler) throws Exception {
        String requestURL = req.getRequestURL().toString();
        //用户登录判断
        HttpSession session = req.getSession(true);
        UserInfo userInfo = (UserInfo) session.getAttribute("adminUserInfo");
        if (userInfo == null && !requestURL.contains("gotoLoginPage")) {
          //  System.out.println("adminUserInfo is null");
            try {
                response.getWriter().write("<script type='text/javascript'>window.top.location.href='" + req.getContextPath() + "/admin/gotoLoginPage" + "';</script>");
            } catch (IOException e) {
                LOGGER.error("拦截器出现错误!",e);
            }
            return false;
        }
        return true;
    }

}
