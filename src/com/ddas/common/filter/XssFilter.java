package com.ddas.common.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
/**
 * ClassName:	XssFilter
 * Function: 	防止网页被XSS攻击XSSFilter
 *
 * @author shaojx
 * @date 2016/9/10 22:34
 * @since JDK 1.6
 */
public class XssFilter implements Filter {

    FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;

    }

    public void destroy() {

        this.filterConfig = null;

    }

    public void doFilter(ServletRequest request, ServletResponse response,

                         FilterChain chain) throws IOException, ServletException {

        chain.doFilter(new XssHttpServletRequestWrapper(

                (HttpServletRequest) request), response);

    }
}