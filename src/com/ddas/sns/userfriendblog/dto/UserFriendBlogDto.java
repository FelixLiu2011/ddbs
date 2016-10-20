package com.ddas.sns.userfriendblog.dto;

import com.ddas.sns.userblog.domain.UserBlog;
import com.ddas.sns.userfriend.domain.UserFriend;
import com.ddas.sns.usergroup.domain.UserGroup;

import java.io.Serializable;
import java.util.List;

public class UserFriendBlogDto implements Serializable {
    private String userId;
    private String friendId;
    private String friendName;
    private String ubId;
    private String groupId;
    private String blogTitle;
    private String blogContent;
    private String blogTags;
    private String createdTime;
    private String updatedTime;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFriendId() {
        return friendId;
    }

    public void setFriendId(String friendId) {
        this.friendId = friendId;
    }

    public String getFriendName() {
        return friendName;
    }

    public void setFriendName(String friendName) {
        this.friendName = friendName;
    }

    public String getUbId() {
        return ubId;
    }

    public void setUbId(String ubId) {
        this.ubId = ubId;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public String getBlogTags() {
        return blogTags;
    }

    public void setBlogTags(String blogTags) {
        this.blogTags = blogTags;
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
}