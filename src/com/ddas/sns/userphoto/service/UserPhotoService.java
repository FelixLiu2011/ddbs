/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userphoto.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.anotation.VipPrivilege;
import com.ddas.sns.usergroup.mapper.UserGroupMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userphoto.domain.UserPhoto;
import com.ddas.sns.userphoto.domain.UserPhotoCriteria;
import com.ddas.sns.userphoto.dto.UserPhotoDto;
import com.ddas.sns.userphoto.mapper.UserPhotoMapper;
import com.ddas.sns.userphotogroup.domain.UserPhotoGroup;
import com.ddas.sns.userphotogroup.mapper.UserPhotoGroupMapper;
import com.paypal.api.openidconnect.Userinfo;
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
public class UserPhotoService {
    @Resource
    private UserPhotoMapper userPhotoMapper;
    @Resource
    private UserPhotoGroupMapper userPhotoGroupMapper;

    public void save(UserPhoto userPhoto) {
        String currentDateTime = DateUtil.getCurrentDateString();
        userPhoto.setUpId(UUIDUtil.createUUID16());
        userPhoto.setCreatedTime(currentDateTime);
        userPhoto.setUpdatedTime(currentDateTime);
        userPhotoMapper.insertSelective(userPhoto);
    }

    /**
     * 分页查找userPhoto
     *@param currentPage
     *@param pageSize
     *@return com.ddas.common.page.Page
     *@Author liuchen6
     *@Date 2016/7/7 18:04
     *@since JDK1.7
     */
    public Page queryRecordsByPage(int currentPage, int pageSize, String groupId) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserPhotoCriteria userPhotoCriteria = new UserPhotoCriteria();
        userPhotoCriteria.setOrderByClause("created_time");
        userPhotoCriteria.setLimitStart(page.getPageStart());
        userPhotoCriteria.setLimitEnd(pageSize);
        UserPhotoCriteria.Criteria criteria = userPhotoCriteria.createCriteria();
        criteria.andGroupIdEqualTo(groupId);
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(userPhotoMapper.countByExample(userPhotoCriteria));
        }
        page.setDataList(userPhotoMapper.selectByExample(userPhotoCriteria));
        return page;
    }

    /**
     *查看好友的相册时会存在权限问题(所以重新开了一个带权限的方法)
     * @param currentPage 当前页
     * @param pageSize 每页的条数
     * @param groupId 相册的id
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/8/16 21:55
     *@version 1.0
     *@since 1.6
     */
    @VipPrivilege("photoCount")
    public Page queryUserFriendRecordsByPage(int currentPage,int pageSize,String groupId){
        return queryRecordsByPage(currentPage,pageSize,groupId);
    }

    public int getPhotoCount(String photoGroupId, UserInfo userInfo){
        UserPhotoCriteria userPhotoCriteria = new UserPhotoCriteria();
        UserPhotoCriteria.Criteria criteria = userPhotoCriteria.createCriteria();
        criteria.andGroupIdEqualTo(photoGroupId);
        int count = userPhotoMapper.countByExample(userPhotoCriteria);
        return count;
    }

    /**
     *设置封面
     * @param upId 照片的id
     * @param groupId 相册的id
     * @param loginUser 登录用户
     *@return int 更新的数目
     *@author shaojx
     *@date 2016/8/5 23:01
     *@version 1.0
     *@since 1.6
     */
    public int userThisPhotoForFace(String upId, String groupId, UserInfo loginUser) {
        int count = userPhotoMapper.userThisPhotoForFace(upId, groupId);
        return count;
    }

    /**
     *设置封面
     * @param loginUser
     *@return int 更新的数目
     *@author shaojx
     *@date 2016/8/5 23:01
     *@version 1.0
     *@since 1.6
     */
    public Page getLatestPhoto(String userId) {
        Page page = new Page();
        page.setCurrentPage(1);
        page.setPageSize(4);
        UserPhotoCriteria userPhotoCriteria = new UserPhotoCriteria();
        userPhotoCriteria.setOrderByClause("created_time");
        userPhotoCriteria.setLimitStart(page.getPageStart());
        userPhotoCriteria.setLimitEnd(4);
        UserPhotoCriteria.Criteria criteria = userPhotoCriteria.createCriteria();
        criteria.andUserIdEqualTo(userId);

        List<UserPhoto> userPhotoList = userPhotoMapper.selectByExample(userPhotoCriteria);
        List<UserPhotoDto> userPhotoDtoList = new ArrayList<UserPhotoDto>();

        for (UserPhoto userPhoto : userPhotoList) {
            UserPhotoDto userPhotoDto = new UserPhotoDto();
            userPhotoDto.setUpId(userPhoto.getUpId());
            userPhotoDto.setCreatedTime(userPhoto.getCreatedTime());
            userPhotoDto.setPhotoUrl(userPhoto.getPhotoUrl());
            userPhotoDto.setGroupId(userPhoto.getGroupId());
            UserPhotoGroup userPhotoGroup = userPhotoGroupMapper.selectByPrimaryKey(userPhoto.getGroupId());
            if(userPhotoGroup != null) {
                userPhotoDto.setGroupName(userPhotoGroup.getGroupName());
            }else{
                userPhotoDto.setGroupName("");
            }
            userPhotoDtoList.add(userPhotoDto);
        }
        page.setDataList(userPhotoDtoList);
        return page;
    }

}
