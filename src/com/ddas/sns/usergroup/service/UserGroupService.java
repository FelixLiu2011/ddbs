/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.usergroup.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.string.StringUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.usergroup.domain.UserGroup;
import com.ddas.sns.usergroup.domain.UserGroupCriteria;
import com.ddas.sns.usergroup.mapper.UserGroupMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
public class UserGroupService {
    @Resource
    private UserGroupMapper userGroupMapper;

    /**
     *@param groupName
     *@return void
     *@Author liuchen6
     *@Date 2016/7/4 19:22
     *@since JDK1.7
     */
    public boolean saveUserGroup(UserGroup userGroup, UserInfo userInfo) {
        String currentDateString = DateUtil.getCurrentDateString();
        String userId = userInfo.getUserId();
        userGroup.setUserId(userId);
        userGroup.setUpdatedTime(currentDateString);
        if(StringUtil.isEmpty(userGroup.getGroupId())) {
            userGroup.setGroupId(UUIDUtil.createUUID16());
            userGroup.setCreatedTime(currentDateString);
            userGroupMapper.insert(userGroup);
        }else {
            UserGroupCriteria userGroupCriteria = new UserGroupCriteria();
            UserGroupCriteria.Criteria criteria = userGroupCriteria.createCriteria();
            criteria.andUserIdEqualTo(userId);
            criteria.andUsePropertyEqualTo(userGroup.getUseProperty());
            criteria.andGroupIdEqualTo(userGroup.getGroupId());
            userGroupMapper.updateByExampleSelective(userGroup, userGroupCriteria);
        }

        return true;
    }

    /**
     * 分页查询用户分组，使用属性(1是好友分组，2是相册分组，3是日志分组)
     *@param currentPage
     *@param pageSize
     *@param useProperty
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/5 10:53
     *@since JDK1.7
     */
    public Page queryRecordsByPage(int currentPage, int pageSize, String useProperty, UserInfo userInfo) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserGroupCriteria userGroupCriteria = new UserGroupCriteria();
        userGroupCriteria.setOrderByClause("created_time");
        userGroupCriteria.setLimitStart(page.getPageStart());
        userGroupCriteria.setLimitEnd(pageSize);
        UserGroupCriteria.Criteria criteria = userGroupCriteria.createCriteria();
        criteria.andUsePropertyEqualTo(useProperty);
        List<String> userIdCondition = new ArrayList<String>();
        userIdCondition.add(userInfo.getUserId());
        userIdCondition.add("1000");// 1000表示系统中针对Group，系统默认分组的角色ID
        criteria.andUserIdIn(userIdCondition);
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(userGroupMapper.countByExample(userGroupCriteria));
        }
        page.setDataList(userGroupMapper.selectByExample(userGroupCriteria));
        return page;
    }

    public void deleteUserGroup(UserGroup userGroup){
        UserGroupCriteria userGroupCriteria = new UserGroupCriteria();
        UserGroupCriteria.Criteria criteria = userGroupCriteria.createCriteria();
        criteria.andGroupIdEqualTo(userGroup.getGroupId());
        userGroupMapper.deleteByExample(userGroupCriteria);
    }

}
