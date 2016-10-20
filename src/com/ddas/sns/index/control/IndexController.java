
/**
 * 项目名称:	OpenSource
 * 文件名称:	IndexController.java
 * 包名:		 com.ddas.sns.index
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/28
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.index.control;

import com.ddas.sns.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	IndexController
 * Function: 	Index Controller
 *
 * @author shaojunxiang
 * @date 16:01
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
    /**
     *获取 首页中的 iframe 内容
     *@param
     *@Author shaojunxiang
     *@Date 2016/6/28 16:02
     *@return java.lang.String
     *@since JDK1.6
     */
    @RequestMapping("/indexContent")
    public ModelAndView getIndexContent(HttpServletRequest httpServletRequest){
        ModelAndView mav = withLocal(httpServletRequest, "index/indexContent");
        return mav;
    }

    /**
     *跳转到首页
     *@param
     *@Author shaojunxiang
     *@Date 2016/6/28 16:23
     *@return java.lang.String
     *@since JDK1.6
     */
    @RequestMapping("/gotoIndex")
    public ModelAndView gotoIndex(HttpServletRequest httpServletRequest){
        ModelAndView mav = withLocal(httpServletRequest, "index/index");
 //       setLoginUserToSession(getLoginUser(httpServletRequest), httpServletRequest);
        return mav;
    }
}
