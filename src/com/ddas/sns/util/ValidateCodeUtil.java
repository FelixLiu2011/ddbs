package com.ddas.sns.util;

import org.patchca.color.SingleColorFactory;
import org.patchca.filter.predefined.CurvesRippleFilterFactory;
import org.patchca.font.RandomFontFactory;
import org.patchca.service.ConfigurableCaptchaService;
import org.patchca.utils.encoder.EncoderHelper;
import org.patchca.word.RandomWordFactory;
import org.patchca.word.WordFactory;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;
import java.io.OutputStream;

/**
 * ClassName:	ValidateCode
 * Function: 	todo
 *
 * @author shaojx
 * @date 2016/7/13 23:29
 * @since JDK 1.6
 */
public final  class ValidateCodeUtil {
    private static final String DEFAULT_CHARACTERS = "1234";
    private static int DEFAULT_FONT_SIZE = 25;
    private static int DEFAULT_WORD_LENGTH = 4;
    private static int DEFAULT_WIDTH = 80;
    private static int DEFAULT_HEIGHT = 26;
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
        clearValidCodeFromSession(request);

        RandomFontFactory ff = new RandomFontFactory();
        ff.setMinSize(DEFAULT_FONT_SIZE);
        ff.setMaxSize(DEFAULT_FONT_SIZE);
        RandomWordFactory rwf = new RandomWordFactory();
        rwf.setMinLength(DEFAULT_WORD_LENGTH);
        rwf.setMaxLength(DEFAULT_WORD_LENGTH);

        ConfigurableCaptchaService cs = new ConfigurableCaptchaService();
        cs.setColorFactory(new SingleColorFactory(new Color(25, 60, 170)));
        cs.setFilterFactory(new CurvesRippleFilterFactory(cs.getColorFactory()));

        cs.setWordFactory(rwf);
        cs.setFontFactory(ff);
        cs.setWidth(DEFAULT_WIDTH);
        cs.setHeight(DEFAULT_HEIGHT);

        // 禁止图像缓存。
        response.setContentType("image/png");
        response.setHeader("cache", "no-cache");
        OutputStream outputStream = response.getOutputStream();
        String code = EncoderHelper.getChallangeAndWriteImage(cs, "png", outputStream);
        // 将四位数字的验证码保存到Session中。
        HttpSession session = request.getSession(true);
        session.setAttribute("validateCode",code);
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
