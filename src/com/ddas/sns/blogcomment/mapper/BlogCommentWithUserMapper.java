package com.ddas.sns.blogcomment.mapper;

import com.ddas.sns.blogcomment.domain.BlogCommentDto;
import com.ddas.sns.blogcomment.domain.BlogCommentExample;

import java.util.List;

/**
 * ClassName:	BlogCommentWithUserMapper
 * Function: 	todo
 *
 * @author shaojx
 * @date 2016/7/11 23:22
 * @since JDK 1.6
 */
public interface BlogCommentWithUserMapper {
    List<BlogCommentDto> selectBlogCommentWithUser(BlogCommentExample example);

    int countBlogCommentWithUser(BlogCommentExample example);
}
