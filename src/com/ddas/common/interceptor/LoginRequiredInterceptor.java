package com.ddas.common.interceptor;


import com.ddas.sns.userinfo.domain.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginRequiredInterceptor implements HandlerInterceptor {


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
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        if (requestURL.contains("Process")) {
            return true;
        }
        if (userInfo == null) {
            try {
                req.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(req,response);
                //retry login in with cookie
                //response.getWriter().write("<script type='text/javascript'>window.top.location.href='" + req.getContextPath() + "/login/gotoLogin" + "';</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
        }
        return true;
    }
}
