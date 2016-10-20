/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userblog.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userblog.domain.UserBlog;
import com.ddas.sns.userblog.domain.UserBlogCriteria;
import com.ddas.sns.userblog.mapper.UserBlogMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ClassName:	UserGroupService
 * Function: 	todo ADD FUNCTION	
 *
 * @author shaojunxiang
 * @date 13:59
 * @since JDK 1.6      
 */
@Service
public class UserBlogService {
    private static final Logger LOGGER= LoggerFactory.getLogger(UserBlogService.class);
    @Resource
    private UserBlogMapper userBlogMapper;

    /**
     * 分页查找userBlog
     *@param currentPage
     *@param pageSize
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/7 18:04
     *@since JDK1.7
     */
    public Page queryRecordsByPage(int currentPage, int pageSize, String userId) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserBlogCriteria userBlogCriteria = new UserBlogCriteria();
        userBlogCriteria.setOrderByClause("created_time desc");
        userBlogCriteria.setLimitStart(page.getPageStart());
        userBlogCriteria.setLimitEnd(pageSize);
        UserBlogCriteria.Criteria criteria = userBlogCriteria.createCriteria();
        criteria.andUserIdEqualTo(userId);
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(userBlogMapper.countByExample(userBlogCriteria));
        }
        page.setDataList(userBlogMapper.selectByExample(userBlogCriteria));
        return page;
    }

    public boolean save(UserBlog userBlog, UserInfo userInfo) {
        String currentTmeString = DateUtil.getCurrentDateString();
        userBlog.setUserId(userInfo.getUserId());
        userBlog.setUbId(UUIDUtil.createUUID16());
        userBlog.setCreatedTime(currentTmeString);
        userBlog.setUpdatedTime(currentTmeString);
        userBlogMapper.insertSelective(userBlog);
        return true;
    }

    /**
     *根据blogID来获取相应的UserBlog信息,如果没有找到或者找到的数量大于1，则返回null
     *@param blogId UserBlog id
     *@Author shaojunxiang
     *@Date 2016/7/11 19:22
     *@return com.ddas.sns.userblog.domain.UserBlog
     *@since JDK1.6
     */
    public UserBlog findById(String blogId){
        if(blogId==null||"".equals(blogId)){
            return null;
        }
        UserBlogCriteria criteria=new UserBlogCriteria();
        criteria.createCriteria().andUbIdEqualTo(blogId);
        List<UserBlog> list=userBlogMapper.selectByExample(criteria);
        if(list.size()>0){
            if(list.size()>1){
                LOGGER.error("find UserBlog by id count >1",new IllegalStateException());
                return null;
            }
            return list.get(0);
        }
        return null;
    }

}
