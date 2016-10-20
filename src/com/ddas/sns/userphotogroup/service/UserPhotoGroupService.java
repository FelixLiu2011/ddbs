/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userphotogroup.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.string.StringUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userfriendphotogroup.mapper.UserFriendPhotoGroupMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userphotogroup.domain.UserPhotoGroup;
import com.ddas.sns.userphotogroup.domain.UserPhotoGroupCriteria;
import com.ddas.sns.userphotogroup.mapper.UserPhotoGroupMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:	UserGroupService
 * Function: 	todo ADD FUNCTION	
 *
 * @author shaojunxiang
 * @date 13:59
 * @since JDK 1.6      
 */
@Service
public class UserPhotoGroupService {
    @Resource
    private UserPhotoGroupMapper userPhotoGroupMapper;

    @Resource
    private UserFriendPhotoGroupMapper userFriendPhotoGroupMapper;

    /**
     *@param userPhotoGroup
     *@return void
     *@Author liuchen6
     *@Date 2016/7/4 19:22
     *@since JDK1.7
     */
    public void saveUserGroup(UserPhotoGroup userPhotoGroup,UserInfo loginUserInfo) {
        String currentDateString = DateUtil.getCurrentDateString();
        String userId=loginUserInfo.getUserId();
        userPhotoGroup.setUserId(userId);
        userPhotoGroup.setUpdatedTime(currentDateString);
        if(StringUtil.isEmpty(userPhotoGroup.getGroupId())) {
            userPhotoGroup.setGroupId(UUIDUtil.createUUID16());
            userPhotoGroup.setCreatedTime(currentDateString);
            userPhotoGroupMapper.insert(userPhotoGroup);
        }else {
            UserPhotoGroupCriteria userPhotoGroupCriteria = new UserPhotoGroupCriteria();
            UserPhotoGroupCriteria.Criteria criteria = userPhotoGroupCriteria.createCriteria();
            criteria.andUserIdEqualTo(userId);
            criteria.andGroupIdEqualTo(userPhotoGroup.getGroupId());
            userPhotoGroupMapper.updateByExampleSelective(userPhotoGroup, userPhotoGroupCriteria);
        }
    }

    /**
     * 分页查询用户分组，使用属性(1是好友分组，2是日志分组)
     *@param currentPage
     *@param pageSize
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/5 10:53
     *@since JDK1.7
     */
    public Page queryRecordsByPage(int currentPage, int pageSize, String userId) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserPhotoGroupCriteria userPhotoGroupCriteria = new UserPhotoGroupCriteria();
        userPhotoGroupCriteria.setOrderByClause("created_time desc");
        userPhotoGroupCriteria.setLimitStart(page.getPageStart());
        userPhotoGroupCriteria.setLimitEnd(pageSize);
        UserPhotoGroupCriteria.Criteria criteria = userPhotoGroupCriteria.createCriteria();
        criteria.andUserIdEqualTo(userId);
        if(currentPage == 1){//如果是当前第一页，则要求总数
            page.setTotalCount(userPhotoGroupMapper.countByExample(userPhotoGroupCriteria));
        }
        page.setDataList(userPhotoGroupMapper.selectByExample(userPhotoGroupCriteria));
        return page;
    }

    /**
     *根据相册的id来删除相册
     * @param groupId 相册的Id
     *@return int 删除的相册的数量
     *@author shaojx
     *@date 2016/8/15 22:13
     *@version 1.0
     *@since 1.6
     */
    public int deletePhotoGroup(String groupId){
        UserPhotoGroupCriteria example = new UserPhotoGroupCriteria();
        UserPhotoGroupCriteria.Criteria criteria = example.createCriteria();
        criteria.andGroupIdEqualTo(groupId);
        int deleteByExample = userPhotoGroupMapper.deleteByExample(example);
        return deleteByExample;
    }

    /**
     * 分页查询用户分组，使用属性(1是好友分组，2是日志分组)
     *@param currentPage
     *@param pageSize
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/5 10:53
     *@since JDK1.7
     */
 /*   @VipPrivilege("photoCount")*/
    public Page queryFriendPhotoGroupRecordsByPage(int currentPage, int pageSize, UserInfo userInfo) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        Map<String, Object> condition = new HashMap();
        condition.put("userId", userInfo.getUserId());
        condition.put("start", page.getPageStart());
        condition.put("end", page.getPageStart() + pageSize);
        page.setCondition(condition);
        page.setTotalCount(userFriendPhotoGroupMapper.getCount(page));
        page.setDataList(userFriendPhotoGroupMapper.queryByPage(page));
        return page;
    }

    public Map<String, String> queryPhotoFaceAndCount(String groupId) {
        List<Map<String,String>>result= userFriendPhotoGroupMapper.queryPhotoFaceAndCount( groupId);
        if(result!=null&&result.size()>0){
            return result.get(0);
        }
        return new HashMap<String, String>();
    }

    public int updatePhotoGroup(UserPhotoGroup userPhotoGroup, UserInfo loginUser) {
        UserPhotoGroupCriteria example = new UserPhotoGroupCriteria();
        UserPhotoGroupCriteria.Criteria criteria = example.createCriteria();
        criteria.andGroupIdEqualTo(userPhotoGroup.getGroupId());
        userPhotoGroup.setUpdatedTime(DateUtil.getCurrentDateString());//update `update_time`
        int updateByExampleSelective = userPhotoGroupMapper.updateByExampleSelective(userPhotoGroup, example);
        return updateByExampleSelective;
    }
}
