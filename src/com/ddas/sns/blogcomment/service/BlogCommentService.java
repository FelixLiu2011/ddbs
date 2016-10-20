package com.ddas.sns.blogcomment.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.blogcomment.domain.BlogComment;
import com.ddas.sns.blogcomment.domain.BlogCommentDto;
import com.ddas.sns.blogcomment.domain.BlogCommentExample;
import com.ddas.sns.blogcomment.mapper.BlogCommentMapper;
import com.ddas.sns.blogcomment.mapper.BlogCommentWithUserMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ClassName:	BlogCommentService
 * Function: 	日志评论Service
 *
 * @author shaojx
 * @date 2016/7/10 13:33
 * @since JDK 1.6
 */
@Service
public class BlogCommentService {
    private  final static Logger LOGGER= LoggerFactory.getLogger(BlogCommentService.class);

    @Resource
    private BlogCommentMapper blogCommentMapper;

    @Resource
    private BlogCommentWithUserMapper blogCommentWithUserMapper;
    /**
     *保存朋友日志评论信息
     * @param blogId 日志的id
     * @param comment 评论内容
     * @param loginUserInfo 登录用户信息
     *@return boolean 保存是否成功
     *@author shaojx
     *@date 2016/7/10 13:40
     *@version 1.0
     *@since 1.6
     */
    public boolean saveFriendComment(String blogId, String comment, UserInfo loginUserInfo){
        if(loginUserInfo==null||blogId==null){
            LOGGER.error("blogId is null or loginUserInfo is null! save friend blog comment fail!",new IllegalArgumentException());
        }
        BlogComment blogComment=new BlogComment();
        blogComment.setBlogCommentId(UUIDUtil.createUUID16());
        blogComment.setCommentContent(comment);
        blogComment.setCommentParentId(null);
        blogComment.setCommentTime(DateUtil.getCurrentDateString());
        blogComment.setBlogId(blogId);
        blogComment.setCommentUserId(loginUserInfo.getUserId());
        int insert = blogCommentMapper.insert(blogComment);
        return insert==1;
    }

    /**
     *根据 blogid来获取相应的评论数
     * @param blogId
     *@return int
     *@author shaojx
     *@date 2016/7/10 15:04
     *@version 1.0
     *@since 1.6
     */
    public int fetchCommentCountById(String blogId) {
        BlogCommentExample example=new BlogCommentExample();
        BlogCommentExample.Criteria criteria = example.createCriteria();
        criteria.andBlogIdEqualTo(blogId);
        int count = blogCommentMapper.countByExample(example);
        return count;
    }

    /**
     *分页获取相应的日志评论内容
     * @param currentPage 当前页
     * @param pageSize 页数量
     * @param blogId 评论的日志id
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/7/11 22:54
     *@version 1.0
     *@since 1.6
     */
    public Page fetchAllCommentByPage(int currentPage, int pageSize, String blogId) {
        Page page=new Page();
        page.setPageSize(pageSize);
        page.setCurrentPage(currentPage);
        BlogCommentExample example=new BlogCommentExample();
        BlogCommentExample.Criteria criteria = example.createCriteria();
        criteria.andBlogIdEqualTo(blogId);
        if(currentPage==1){//只有取的时候 才获取相应的总数
            int count = blogCommentWithUserMapper.countBlogCommentWithUser(example);
            page.setTotalCount(count);
        }
        int start=page.getPageStart();
        example.setLimitStart(start);
        example.setLimitEnd(pageSize);
        List<BlogCommentDto> blogComments = blogCommentWithUserMapper.selectBlogCommentWithUser(example);
        page.setDataList(blogComments);
        return page;
    }
}
