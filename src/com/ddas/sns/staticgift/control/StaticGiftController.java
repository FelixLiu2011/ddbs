package com.ddas.sns.staticgift.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.sns.blogcomment.service.BlogCommentService;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.staticgift.service.StaticGiftService;
import com.ddas.sns.userblog.service.UserBlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	BlogCommentController
 * Function: 	日志评论Controller
 *
 * @author shaojx
 * @date 2016/7/10 13:31
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/staticGift")
public class StaticGiftController extends BaseController {
    private static  final Logger LOGGER = LoggerFactory.getLogger(StaticGiftController.class);

    @Resource
    private StaticGiftService staticGiftService;
    /**
     * 分页查找礼物列表
     *@param currentPage
     *@param pageSize
     *@param giftProperty
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/1 14:51
     *@since JDK1.6
     */
    @RequestMapping(value = "/queryRecordsByPage", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page getStaticGiftList(int currentPage, int pageSize, String giftProperty){
        return staticGiftService.queryRecordsByPage(currentPage, pageSize, giftProperty);
    }
}
