package com.ddas.sns.blogcomment.domain;

import com.ddas.sns.userinfo.domain.UserInfo;

/**
 * ClassName:	BlogCommentDto
 * Function: 	日志评论dto
 *
 * @author shaojx
 * @date 2016/7/11 23:21
 * @since JDK 1.6
 */
public class BlogCommentDto extends BlogComment {
    //评论者
    private UserInfo userInfo;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }
}
