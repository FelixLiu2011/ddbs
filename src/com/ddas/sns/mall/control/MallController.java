/**
 * 项目名称:	OpenSource
 * 文件名称:	MySpaceController.java
 * 包名:		 com.ddas.sns.myspace
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/27
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.mall.control;

import com.ddas.sns.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	MySpaceController
 * Function: 	我的空间Controller
 *
 * @author shaojunxiang
 * @date 12:30
 * @since JDK 1.6      
 */
@Controller
@RequestMapping("/mall")
public class MallController extends BaseController {
    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/giftReal/shopHome")
    public ModelAndView goToShopHome(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"mall/realGiftShopHome");
        return modelAndView;
    }

}
