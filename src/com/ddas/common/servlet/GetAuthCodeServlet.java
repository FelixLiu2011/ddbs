package com.ddas.common.servlet;

import com.ddas.sns.util.ValidateCodeUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/11/8.
 */
public class GetAuthCodeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ValidateCodeUtil.flushValidateCodeAndCacheInSession(request, response);
    }
}
