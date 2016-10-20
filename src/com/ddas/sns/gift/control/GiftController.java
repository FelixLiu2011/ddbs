package com.ddas.sns.gift.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.gift.service.GiftService;
import com.ddas.sns.mylog.service.MyLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	MyLogController
 * Function: 	我的日志Controller
 *
 * @author shaojx
 * @date 2016/6/29 23:01
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/gift")
public class GiftController extends BaseController{
    private static final Logger LOGGER = LoggerFactory.getLogger(GiftController.class);
    @Resource
    private GiftService giftService;

    /**
     * 跳转到礼物界面
     *@Author liuchen6
     *@Date 2016/7/1 14:52
     *@param
     *@return org.springframework.web.servlet.ModelAndView
     *@since JDK1.6
     */
    @RequestMapping(value = "/gotoIndex", method = {RequestMethod.GET})
    public ModelAndView goToGiftPage(HttpServletRequest request) {
        ModelAndView modelAndView = containLocal(request);
        modelAndView.setViewName("gift/gift");

        return modelAndView;
    }

    /**
     * 送礼物给好友
     *@Author liuchen6
     *@Date 2016/7/1 14:52
     *@param
     *@return msg
     *@since JDK1.6
     */
    @RequestMapping(value = "/sendGiftToFriend")
    @ResponseBody
    public Msg sendGiftToFriend(String giftId, int giftCount, String friendId, HttpServletRequest request) {
        Msg msg = new Msg();
        boolean success = false;
        try{
            success = giftService.sendGiftToFriend(giftId, giftCount, friendId, getLoginUser(request));
        }catch (Exception e){
            LOGGER.error(e.getMessage(), e);
            msg.setSuccessful(false);
            msg.setMsg("赠送礼物失败！");
        }
        if(success) {
            msg.setMsg("赠送礼物成功,好友马上就会收到你的礼物");
        }else{
            msg.setMsg("赠送礼物失败，余额不足，请充值");
        }

        return msg;
    }

    /**
     * 查询我收到的，或者送出的礼物
     *@Author liuchen6
     *@Date 2016/7/1 14:52
     *@param
     *@return msg
     *@since JDK1.6
     */
    @RequestMapping(value = "/queryRecordsByPage")
    @ResponseBody
    public Page queryUserGiftByPage(int currentPage, int pageSize, String giftProperty, HttpServletRequest request) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        try{
            page = giftService.queryUserGiftByPage(page, giftProperty, getLoginUser(request));
        }catch (Exception e){
            LOGGER.error(e.getMessage(), e);
        }

        return page;
    }

}
