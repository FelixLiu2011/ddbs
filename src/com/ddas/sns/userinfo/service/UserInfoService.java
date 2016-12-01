/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userinfo.service;

import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.domain.UserInfoCriteria;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ClassName:	UserInfoService
 * Function: 	用户信息的Service
 *
 * @author shaojunxiang
 * @date 13:59
 * @since JDK 1.6
 */
@Service
public class UserInfoService {
    private static final Logger LOGGER= LoggerFactory.getLogger(UserInfoService.class);
    @Resource
    private UserInfoMapper userInfoMapper;

    /**
     * 根据用户ID找到用户
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public UserInfo fetchUserInfoByUserId(String userId) {
        return userInfoMapper.selectByPrimaryKey(userId);
    }

    /**
     * 根据用户有邮箱找到用户
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public List<UserInfo> fetchUserInfosByEmail(String email) {
        UserInfoCriteria example = new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria = example.createCriteria();
        criteria.andMembEmailEqualTo(email);

        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);

        return userInfos;
    }

    /**
     * 若用户ID为空，则新增，保存，若不为空，则直接保存
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public boolean saveUserInfo(UserInfo userInfo) {
        if(userInfo == null) {
            return false;
        }
        String currentDateTime = DateUtil.getCurrentDateString();
        if(StringUtil.isEmpty(userInfo.getMembGagaid())) {//用户ID为空，那么新增
            userInfo.setMembGagaid(UUIDUtil.createUUID16());
            userInfo.setMembRegistertime(currentDateTime);
            userInfoMapper.insertSelective(userInfo);
            return true;
        }else {
            userInfoMapper.updateByPrimaryKey(userInfo);
            return true;
        }
    }

    /**
     * 用户登录
     *
     * @param userInfo 用户信息
     * @return boolean {false}登录失败,{true}登录成功
     * @author shaojx
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public UserInfo loginInProxy(String userName, String userPwd) {
        if (StringUtil.isEmpty(userName) || StringUtil.isEmpty(userPwd)) {
            return null;
        }
        UserInfoCriteria example = new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria = example.createCriteria();
        criteria.andMembEmailEqualTo(userName);
        criteria.andMembPwdEqualTo(userPwd);
        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);
        if (userInfos != null && userInfos.size() == 1) {//有且只有一条记录
            return userInfos.get(0);
        }
        UserInfoCriteria example1 = new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria1 = example1.createCriteria();
        criteria1.andMembNicknameEqualTo(userName);
        criteria1.andMembPwdEqualTo(userPwd);
        userInfos = userInfoMapper.selectByExample(example1);
        if (userInfos != null && userInfos.size() == 1) {//有且只有一条记录
            return userInfos.get(0);
        }
        return null;
    }

    /**
     *根据邮箱来查找对应的邮箱是否被注册
     * @param email 用户名
     *@return boolean {true}没有被注册,{false}被注册
     *@author shaojx
     *@date 2016/7/16 13:08
     *@version 1.0
     *@since 1.6
     */
    public boolean findUserByEmail(String email) {
        UserInfoCriteria userInfoCriteria = new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria = userInfoCriteria.createCriteria();
        criteria.andMembEmailEqualTo(email);
        List<UserInfo> userInfos = userInfoMapper.selectByExample(userInfoCriteria);
        return userInfos.size() <= 0;
    }
}
