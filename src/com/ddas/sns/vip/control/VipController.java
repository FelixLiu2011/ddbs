package com.ddas.sns.vip.control;

import com.ddas.common.Msg;
import com.ddas.common.exception.ServiceException;
import com.ddas.common.page.Page;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.vip.domain.VipPrivs;
import com.ddas.sns.vip.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * ClassName:	VipController
 * Function: 	会员Controller
 *
 * @author shaojx
 * @date 2016/7/8 21:44
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/vip")
public class VipController extends BaseController {

    @Autowired
    private VipService vipService;
    /**
     * 升级会员页面
     *
     * @return java.lang.String 升级会员的页面
     * @author shaojx
     * @date 2016/7/8 21:45
     * @version 1.0
     * @since 1.6
     */
    @RequestMapping("/gotoVip")
    public ModelAndView gotoVip(HttpServletRequest request) {
        ModelAndView modelAndView = withLocal(request, "vip/index");
        return modelAndView;
    }

    /**
     *根据用户的id来获取相应的用户所具有vip信息
     * @param request 当前请求
     *@return java.util.List<com.ddas.sns.vip.domain.VipPrivs>
     *@author shaojx
     *@date 2016/8/12 23:07
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/findVipPrivsByUserId")
    @ResponseBody
    public Page findVipPrivsByUserId(HttpServletRequest request){
        Page page=new Page();
        UserInfo loginUser = getLoginUser(request);
        List<VipPrivs> vipPrivses = vipService.fetchVipPrivsByUserId(loginUser.getUserId());
        //return vipPrivses;
        page.setDataList(vipPrivses);
        return  page;
    }

    /**
     *用户进行升级支付
     * @param request 当前请求
     *@return msg
     *@author lc
     *@date 2016/8/12 23:07
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/payForVip")
    @ResponseBody
    public Msg payForVip(String userId, String vipType, HttpServletRequest request) {
        Msg msg = new Msg();
        boolean success = false;
        try {
            success = vipService.payForVip(userId, vipType, getLoginUser(request));
        }catch (ServiceException e) {
            success = false;
            msg.setMsg(getMsgByKeyViaLocal(e.getMessage()));
        }
        msg.setSuccessful(success);
        if(success) {
            msg.setMsg(getMsgByKeyViaLocal("upgradeSuccess"));
        }

        return  msg;
    }
}
