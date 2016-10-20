/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.payfor.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userfriend.domain.UserFriend;
import com.ddas.sns.userfriend.domain.UserFriendCriteria;
import com.ddas.sns.userfriend.mapper.UserFriendMapper;
import com.ddas.sns.userfriendblog.mapper.UserFriendBlogMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:	UserInfoService
 * Function: 	todo ADD FUNCTION	
 *
 * @author shaojunxiang
 * @date 13:59
 * @since JDK 1.6      
 */
@Service
public class PayService {

    private static final String clientID = "AdXFF0sPxNMYjNltGOGlwfbBvqFrsql7fOBv-_5ww0V4izpmmgzrCArQGblGhYoGX_IB2LrkpBavEs7c";
    private static final String clientSecret = "EMef1NW1OGzzHn-86cjxfXTEecNTEc3dklDRVQ9TwWKNUM1SnqzgfSjaNoACkaurSWsl355GVAEza-QD";

    public String getRedirectUrl(String userId, String mount, UserInfo userInfo) throws PayPalRESTException {
        APIContext context = new APIContext(clientID, clientSecret, "sandbox");
        // Create Payment Object
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        Amount amount = new Amount();
        amount.setTotal(mount);
        amount.setCurrency("USD");
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("This is the payment tranasction description.");
        List<Transaction> transactions = new ArrayList<Transaction>();
        transactions.add(transaction);

        FuturePayment futurePayment = new FuturePayment();
        futurePayment.setIntent("sale");
        futurePayment.setPayer(payer);
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/payfor/callBack?userid=" + userId + "&&hquserid=" + userInfo.getUserId());//userid全小写是因为返回来的参数名会自动全部小写
        redirectUrls.setReturnUrl("http://localhost:8080/payfor/paypalProcess?userid=" + userId + "&&hquserid=" + userInfo.getUserId());
        futurePayment.setRedirectUrls(redirectUrls);
        futurePayment.setTransactions(transactions);
        Payment createdPayment = futurePayment.create(context);
        return createdPayment.getLinks().get(1).getHref();
    }
}
