package com.ddas.sns.payment;

import com.paypal.api.openidconnect.Tokeninfo;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/7/14.
 */
public class PaymentUsePaypalTest {


    public static final String clientID = "AdXFF0sPxNMYjNltGOGlwfbBvqFrsql7fOBv-_5ww0V4izpmmgzrCArQGblGhYoGX_IB2LrkpBavEs7c";
    public static final String clientSecret = "EMef1NW1OGzzHn-86cjxfXTEecNTEc3dklDRVQ9TwWKNUM1SnqzgfSjaNoACkaurSWsl355GVAEza-QD";

    public static void main(String[] args) {
        try {
            // Authorization Code and Co-relationID retrieved from Mobile SDK.
            //String authorizationCode = "C101.Rya9US0s60jg-hOTMNFRTjDfbePYv3W_YjDJ49BVI6YJY80HvjL1C6apK8h3IIas.ZWOGll_Ju62T9SXRSRFHZVwZESK";
            //String correlationId = "123456123";

            APIContext context = new APIContext(clientID, clientSecret, "sandbox");

            // Fetch the long lived refresh token from authorization code.
            //String refreshToken = FuturePayment.fetchRefreshToken(context, authorizationCode);
            // Store the refresh token in long term storage for future use.

            // Set the refresh token to context to make future payments of
            // pre-consented customer.
            //context.setRefreshToken(refreshToken);

            // Create Payment Object
            Payer payer = new Payer();
            payer.setPaymentMethod("paypal");
            Amount amount = new Amount();
            amount.setTotal("1.17");
            amount.setCurrency("USD");
            Transaction transaction = new Transaction();
            transaction.setAmount(amount);
            transaction.setDescription("This is the payment tranasction description.");
            List<Transaction> transactions = new ArrayList<Transaction>();
            transactions.add(transaction);

            FuturePayment futurePayment = new FuturePayment();
           // futurePayment.setIntent("authorize");
            futurePayment.setIntent("sale");
            futurePayment.setPayer(payer);
            RedirectUrls redirectUrls = new RedirectUrls();
            redirectUrls.setCancelUrl("http://localhost:8080/payfor/callBack?userid=111");
            redirectUrls.setReturnUrl("http://localhost:8080/payfor/paypalProcess?userid=11");
            futurePayment.setRedirectUrls(redirectUrls);
            futurePayment.setTransactions(transactions);

            Payment createdPayment = futurePayment.create(context);
            System.out.println(createdPayment.toString()+"````"+createdPayment.getLinks().get(1).getHref());
            System.out.println("付款Redirect的URL是这里"+createdPayment.getLinks().get(1).getHref());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(Payment.getLastRequest());
            System.out.println(Payment.getLastResponse());
        }
    }
}
