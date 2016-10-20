package com.ddas.sns.util;

import org.patchca.color.SingleColorFactory;
import org.patchca.filter.predefined.CurvesRippleFilterFactory;
import org.patchca.service.ConfigurableCaptchaService;
import org.patchca.utils.encoder.EncoderHelper;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;

/**
 * ClassName:	ValidateCode
 * Function: 	todo
 *
 * @author shaojx
 * @date 2016/7/13 23:29
 * @since JDK 1.6
 */
public final  class ValidateCodeUtil {

    /**
     *生成验证码到页面以及保存 ValidateCode到session中
     * @param request 当前的http请求
     * @param response 当前的http响应
     *@return void
     *@author shaojx
     *@date 2016/7/13 23:43
     *@version 1.0
     *@since 1.6
     */
    public static void flushValidateCodeAndCacheInSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ConfigurableCaptchaService cs = new ConfigurableCaptchaService();
        cs.setColorFactory(new SingleColorFactory(new Color(25, 60, 170)));
        cs.setFilterFactory(new CurvesRippleFilterFactory(cs.getColorFactory()));
        String code=cs.getCaptcha().getChallenge();
        // 将四位数字的验证码保存到Session中。
        HttpSession session = request.getSession(true);
        session.setAttribute("validateCode",code);
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        //FileOutputStream fos = new FileOutputStream("patcha_demo.png");
        ServletOutputStream outputStream = response.getOutputStream();
        EncoderHelper.getChallangeAndWriteImage(cs, "png", outputStream);
        outputStream.flush();
        outputStream.close();
    }

    /**
     *清空session中的validateCode
     * @param request 当前请求
     *@return void
     *@author shaojx
     *@date 2016/7/13 23:45
     *@version 1.0
     *@since 1.6
     */
    public static  void  clearValidCodeFromSession(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("validateCode",null);
    }


}
