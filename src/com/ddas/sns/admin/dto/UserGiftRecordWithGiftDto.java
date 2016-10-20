package com.ddas.sns.admin.dto;

import com.ddas.sns.staticgift.domain.StaticGift;

/**
 * ClassName:	UserGiftWithGiftDto
 * Function: 	礼物记录的dto，包括礼物的信息
 * @author shaojx
 * @date 2016/9/5 15:20
 * @since JDK 1.6
 */
public class UserGiftRecordWithGiftDto extends StaticGift {
    /*以下字段的含义见礼物记录表*/
    private String ugId;
    private String giftSender;
    private String giftReceiver;
    private String giftCount;
    private String giftId;
    private String createdTime;
    private String updatedTime;
    private String giftTotalPrice;
    private static final long serialVersionUID = 1L;

    public String getUgId() {
        return ugId;
    }

    public void setUgId(String ugId) {
        this.ugId = ugId;
    }

    public String getGiftSender() {
        return giftSender;
    }

    public void setGiftSender(String giftSender) {
        this.giftSender = giftSender;
    }

    public String getGiftReceiver() {
        return giftReceiver;
    }

    public void setGiftReceiver(String giftReceiver) {
        this.giftReceiver = giftReceiver;
    }

    public String getGiftCount() {
        return giftCount;
    }

    public void setGiftCount(String giftCount) {
        this.giftCount = giftCount;
    }

    @Override
    public String getGiftId() {
        return giftId;
    }

    @Override
    public void setGiftId(String giftId) {
        this.giftId = giftId;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public String getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(String updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getGiftTotalPrice() {
        return giftTotalPrice;
    }

    public void setGiftTotalPrice(String giftTotalPrice) {
        this.giftTotalPrice = giftTotalPrice;
    }
}
