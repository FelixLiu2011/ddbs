package com.ddas.sns.payfor.control;

import com.ddas.common.Msg;
import com.ddas.common.util.StringUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.payfor.service.PayService;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.service.UserInfoService;
import com.ddas.sns.userrechargerecords.domain.UserRechargeRecord;
import com.ddas.sns.userrechargerecords.service.UserRechargeRecordService;
import com.ddas.sns.util.MD5Util;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.base.rest.APIContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.Enumeration;

/**
 * ClassName:	PayForController
 * Function: 	充值中心Controller
 *
 * @author shaojx
 * @date 2016/7/9 18:48
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/payfor")
public class PayForController extends BaseController{
    private static  final Logger LOGGER= LoggerFactory.getLogger(PayForController.class);
    private static final String clientID = "AdXFF0sPxNMYjNltGOGlwfbBvqFrsql7fOBv-_5ww0V4izpmmgzrCArQGblGhYoGX_IB2LrkpBavEs7c";
    private static final String clientSecret = "EMef1NW1OGzzHn-86cjxfXTEecNTEc3dklDRVQ9TwWKNUM1SnqzgfSjaNoACkaurSWsl355GVAEza-QD";

    @Resource
    private PayService payService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private UserRechargeRecordService userRechargeRecordService;
    /**
     *跳转到 充值中心 的首页
     *@return java.lang.String
     *@author shaojx
     *@date 2016/7/9 18:49
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/gotoIndex")
    public ModelAndView gotoIndex(HttpServletRequest httpServletRequest){
        UserInfo loginUser = getLoginUser(httpServletRequest);
        ModelAndView mav = new ModelAndView("payfor/paycenter");
        mav.addObject("loginUserId", loginUser.getUserId());
        return mav;
    }

    /**
     *跳转到 充值中心 的首页
     *@return java.lang.String
     *@author shaojx
     *@date 2016/7/9 18:49
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/payPalRedirect")
    @ResponseBody
    public Msg gotoPaypal(String userId, String payMethod, String mount, HttpServletRequest request){
        String redirectUrl = "";
        if("1".equals(payMethod)) {//使用paypal支付
            try {
                redirectUrl = payService.getRedirectUrl(userId, mount, getLoginUser(request));
            }catch(Exception e){
                LOGGER.error("Paypal 支付失败！" + e.getMessage(), e);
            }
        }else if("2".equals(payMethod)){
            // TODO: 2016/7/15 其他的支付方式
        }
        Msg msg = new Msg();
        msg.setMsg(redirectUrl);
        return msg;
    }

    @RequestMapping("/paypalPro")
    @ResponseBody
    public ModelAndView callBackForPaypal(String userid, String paymentId, String token, String PayerID, String hquserid, HttpServletRequest request){//userid代表钱冲到哪个用户，hquserid代表花钱的用户ID
        APIContext context = new APIContext(clientID, clientSecret, "sandbox");
        Payment payment = new Payment();
        payment.setId(paymentId);
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(PayerID);
        Msg msg = new Msg();
        try{
            payment = payment.execute(context, paymentExecution);
            if(("approved").equals(payment.getState())){
                UserInfo userInfo = userInfoService.fetchUserInfoByUserId(userid);
                String payAmount = payment.getTransactions().get(0).getAmount().getTotal();
                Double userAmount = Double.valueOf(StringUtil.isEmpty(userInfo.getUserCoin()) ? "0.00" : userInfo.getUserCoin());
                Double totalAmount = userAmount + Double.valueOf(payAmount);//将用户的剩余金额和此次支付成功的金额加起来
                DecimalFormat df = new DecimalFormat("0.00");//保留两位小数，存到数据库
                userInfo.setUserCoin(df.format(totalAmount));
                userInfoService.saveUserInfo(userInfo);
                //userRechargeRecordService.saveRechargeRecords(userid, hquserid, payAmount);

                msg.setMsg("Pay Success，the balance on your account is <strong>" + userAmount + " </strong>coins");
            }else {
                msg.setMsg("Pay failed！Please contact customer service.");
            }
        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
            msg.setMsg("Pay failed！Please contact customer service.");
        }

        ModelAndView mav = withLocal(request, "payfor/callBack");
        mav.addObject("msg", msg);
        return mav;
    }

    /**
     *跳转到 充值中心 的首页
     *@return java.lang.String
     *@author shaojx
     *@date 2016/7/9 18:49
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/payRedirect")
    public ModelAndView gotoRedirect(String userId1, String payMethod1, String mount1, String payssionMethod1, HttpServletRequest request){
        ModelAndView mav = withLocal(request, "payfor/payRedirect");
        String urId = userRechargeRecordService.saveRechargeRecords(userId1, getLoginUser(request).getUserId(), mount1, "0");//0代表未付款
        if("1".equals(payMethod1)) {//使用paypal支付
            mav.addObject("payMethod", "1");
            String custom = userId1 + "_" + getLoginUser(request).getUserId() + "_" + urId;
            mav.addObject("custom", custom);
            mav.addObject("amount", mount1);
        }else if("2".equals(payMethod1)) {
            mav.addObject("payMethod", "2");
            String custom = userId1 + "_" + getLoginUser(request).getUserId()  + "_" + urId;
            String tracId = "tracId";
            String apiKey = "2883f09148b3c151";
            String secretKey = "4d752511795e119711ecd6f67ab520f6";
            String currency = "USD";
            String apiSig = MD5Util.getMD5(apiKey + "|" + payssionMethod1 + "|" + mount1 + "|" + currency + "|" + tracId + "|" + custom + "|" + secretKey);
            mav.addObject("custom", custom);
            mav.addObject("tracId", tracId);
            mav.addObject("amount", mount1);
            mav.addObject("payssionMethod", payssionMethod1);
            mav.addObject("apiSig", apiSig);
            mav.addObject("apiKey", apiKey);

        }
        return mav;
    }

    @RequestMapping("/paypalProcess")
    public ModelAndView callBackForPaypal1(HttpServletRequest request){//userid代表钱冲到哪个用户，hquserid代表花钱的用户ID
        Msg msg = new Msg();
        String business = request.getParameter("business");
        if (!"felixliu2011-facilitator@outlook.com".equals(business)) {//对比订单
            LOGGER.error("不是像这个号付款felixliu2011-facilitator@outlook.com");
        }
        try {
            String payment_status  = request.getParameter("payment_status");
            String mc_gross  = request.getParameter("mc_gross");
            String custom = request.getParameter("custom");

            //*************************************这段代码打印返回参数
            String parameterName = null;
            String parameterValue = null;
            Enumeration parameterNames = null;
            parameterNames = request.getParameterNames();
            while(parameterNames.hasMoreElements()){//循环打印paypal的返回参数信息
                parameterName = (String) parameterNames.nextElement();
                parameterValue = request.getParameter(parameterName);
                if (parameterValue == null) {
                    parameterValue = "";
                }
                LOGGER.error("parameterName:" + parameterName + ":" + "parameterValue:" + parameterValue);
            }
            //*************************************这段代码打印返回参数
            if(("Completed").equals(payment_status)){//付款成功

                String[] customArray = custom.split("_");
                String userid = customArray[0];
                String hquserid = customArray[1];
                String urId = customArray[2];
                UserInfo userInfo = userInfoService.fetchUserInfoByUserId(userid);
                UserRechargeRecord userRechargeRecord = userRechargeRecordService.findUserRechargeRecord(urId);
                if (userRechargeRecord != null && "1" != userRechargeRecord.getRechargeStatus()) {
                    String payAmount = mc_gross;
                    Double userAmount = Double.valueOf(StringUtil.isEmpty(userInfo.getUserCoin()) ? "0.00" : userInfo.getUserCoin());
                    Double totalAmount = userAmount + Double.valueOf(payAmount);//将用户的剩余金额和此次支付成功的金额加起来
                    DecimalFormat df = new DecimalFormat("0.00");//保留两位小数，存到数据库
                    userInfo.setUserCoin(df.format(totalAmount));
                    userInfoService.saveUserInfo(userInfo);
                    userRechargeRecordService.saveRechargeRecordsAfterPay(urId, "1");
                }

                msg.setMsg("Pay Success，the balance on your account is <strong>" + userInfo.getUserCoin() + " </strong>coins");
            } else if ("Pending".equals(payment_status)) {
                msg.setMsg("Pay Pending...Please contact customer service.");
                LOGGER.error(request.getParameter("pending_reason"));
            } else {
                msg.setMsg("Pay failed！Please contact customer service.");
                LOGGER.error("支付状态payment_status为：" + payment_status);
            }

        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
            msg.setMsg("Pay failed！Please contact customer service.");
        }
        ModelAndView mav = new ModelAndView("payfor/callBack");
        mav.addObject("msg", msg);
        return mav;
    }

    @RequestMapping("/payssionProcess")
    public ModelAndView callBackForPassion(HttpServletRequest request){//userid代表钱冲到哪个用户，hquserid代表花钱的用户ID
        Msg msg = new Msg();
        try {
            String payment_status  = request.getParameter("state");
            String amount  = request.getParameter("amount");
            String customId = request.getParameter("sub_track_id");

            //*************************************这段代码打印返回参数
            String parameterName = null;
            String parameterValue = null;
            Enumeration parameterNames = null;
            parameterNames = request.getParameterNames();
            while(parameterNames.hasMoreElements()){//循环打印paypal的返回参数信息
                parameterName = (String) parameterNames.nextElement();
                parameterValue = request.getParameter(parameterName);
                if (parameterValue == null) {
                    parameterValue = "";
                }
                LOGGER.error("parameterName" + parameterName + ":" + "parameterValue" + parameterValue);
            }
            //*************************************这段代码打印返回参数

            //1、将api_key, pm_id, amount, currency, track_id, sub_track_id, state以及应用的sercret_key字符串，以 “|”为分隔符串联成一个字符串
            //2、将第一步骤串联起来的的字符串经md5加密生成最终的notify_sig 具体代码示例：
            //3.$msg = implode("|", array($api_key, $pm_id, $amount, $currency,$track_id, $sub_track_id, $state, $secret_key));
            //$notify_sig = md5($msg);
            //这个$notify_sig应该和返回的notify_sig参数一致，就代表客户的支付是正确的，一切参数正常
            //后面再看看是否需要验证一致性

            //以上的代码是验证回调是否正确
            if(("completed").equals(payment_status)){//付款成功
                String[] customArray = customId.split("_");
                String userid = customArray[0];
                String hquserid = customArray[1];
                String urId = customArray[2];
                UserInfo userInfo = userInfoService.fetchUserInfoByUserId(userid);
                UserRechargeRecord userRechargeRecord = userRechargeRecordService.findUserRechargeRecord(urId);
                if (userRechargeRecord != null && "1" != userRechargeRecord.getRechargeStatus()) {
                    String payAmount = amount;
                    Double userAmount = Double.valueOf(StringUtil.isEmpty(userInfo.getUserCoin()) ? "0.00" : userInfo.getUserCoin());
                    Double totalAmount = userAmount + Double.valueOf(payAmount);//将用户的剩余金额和此次支付成功的金额加起来
                    DecimalFormat df = new DecimalFormat("0.00");//保留两位小数，存到数据库
                    userInfo.setUserCoin(df.format(totalAmount));
                    userInfoService.saveUserInfo(userInfo);
                    userRechargeRecordService.saveRechargeRecordsAfterPay(urId, "1");
                }

                msg.setMsg("Pay Success，the balance on your account is <strong>" + userInfo.getUserCoin() + " </strong>coins");
            } else if ("pending".equals(payment_status)) {
                msg.setMsg("Pay Pending...Please contact customer service.");
                LOGGER.error(request.getParameter("pending_reason"));
            } else {
                msg.setMsg("Pay failed！Please contact customer service.");
            }

        }catch(Exception e){
            LOGGER.error(e.getMessage(), e);
            msg.setMsg("Pay failed！Please contact customer service.");
        }
        ModelAndView mav = new ModelAndView("payfor/callBack");
        mav.addObject("msg", msg);
        return mav;
    }
}
