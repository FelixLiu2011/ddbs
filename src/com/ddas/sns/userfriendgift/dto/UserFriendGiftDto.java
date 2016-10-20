package com.ddas.sns.userfriendgift.dto;

import java.io.Serializable;

public class UserFriendGiftDto implements Serializable {
    private String ugId;
    private String giftSender;
    private String giftSenderName;
    private String giftReceiver;
    private String giftReceiverName;
    private String giftCount;
    private String giftId;
    private String createdTime;
    private String giftUrl;
    private String giftProperty;
    private String giftName;

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

    public String getGiftId() {
        return giftId;
    }

    public void setGiftId(String giftId) {
        this.giftId = giftId;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public String getGiftUrl() {
        return giftUrl;
    }

    public void setGiftUrl(String giftUrl) {
        this.giftUrl = giftUrl;
    }

    public String getGiftProperty() {
        return giftProperty;
    }

    public void setGiftProperty(String giftProperty) {
        this.giftProperty = giftProperty;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public String getGiftSenderName() {
        return giftSenderName;
    }

    public void setGiftSenderName(String giftSenderName) {
        this.giftSenderName = giftSenderName;
    }

    public String getGiftReceiverName() {
        return giftReceiverName;
    }

    public void setGiftReceiverName(String giftReceiverName) {
        this.giftReceiverName = giftReceiverName;
    }
}