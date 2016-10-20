/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.userinfo.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.domain.UserInfoCriteria;
import com.ddas.sns.userinfo.dto.UserInfoDto;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import com.ddas.sns.vip.domain.UserVipInfo;
import com.ddas.sns.vip.domain.UserVipInfoCriteria;
import com.ddas.sns.vip.mapper.UserVipInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource
    private UserVipInfoMapper userVipInfoMapper;
    /*user_info表中status为'9999'时来表明为一个管理员用户*/
    public static final String ADMIN_TEMP_FLAG = "9999";

    /*code为0代表普通用户*/
    public static final String NORMAL_USER = "0";

    /*Admin密码写死*/
    private static  final String ADMIN_PWD="827ccb0eea8a706c4c34a16891f84e7b";

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
        if(StringUtil.isEmpty(userInfo.getUserId())) {//用户ID为空，那么新增
            userInfo.setUserId(UUIDUtil.createUUID16());
            userInfo.setCreatedTime(currentDateTime);
            userInfo.setUpdatedTime(currentDateTime);
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
    public UserInfo loginInProxy(UserInfo userInfo) {
        if (userInfo == null) {
            return null;
        }
        UserInfoCriteria example = new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria = example.createCriteria();
        criteria.andUserNameEqualTo(userInfo.getUserName()).andUserPwdEqualTo(userInfo.getUserPwd());
        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);
        if (userInfos != null && userInfos.size() == 1) {//有且只有一条记录
            return userInfos.get(0);
        }
        return null;
    }

    /**
     *保存用户信息
     * @param userInfo 用户信息
     *@return boolean {false}保存失败 {true}保存成功
     *@author shaojx
     *@date 2016/7/16 12:15
     *@version 1.0
     *@since 1.6
     */
    public boolean save(UserInfo userInfo) {
        if(userInfo==null||userInfo.getUserName()==null||userInfo.getUserPwd()==null){
            return false;
        }
        String currentDateTime = DateUtil.getCurrentDateString();
        userInfo.setUpdatedTime(currentDateTime);
        if (StringUtil.isEmpty(userInfo.getUserId())) {//如果用户ID不存在，表明是新建的用户
            userInfo.setUserId(UUIDUtil.createUUID16());//id
            userInfo.setCreatedTime(currentDateTime);
            userInfoMapper.insertSelective(userInfo);
        }else{
            userInfoMapper.updateByPrimaryKeySelective(userInfo);
        }

        return true;
    }

    /**
     *根据用户名来查找对应的名字是否被注册
     * @param userName 用户名
     *@return boolean {true}没有被注册,{false}被注册
     *@author shaojx
     *@date 2016/7/16 13:08
     *@version 1.0
     *@since 1.6
     */
    public boolean findUserByName(String userName) {
        UserInfoCriteria userInfoCriteria=new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria = userInfoCriteria.createCriteria();
        criteria.andUserNameEqualTo(userName);
        List<UserInfo> userInfos = userInfoMapper.selectByExample(userInfoCriteria);
        return userInfos.size() <= 0;
    }
    /**
     *首页显示其他的用户列表
     *@author shaojx
     *@date 2016/7/16 13:08
     *@version 1.0
     *@since 1.6
     */
    public Page queryUserListExcludeMe(int currentPage, int pageSize, String searchUserName, UserInfo userInfo) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserInfoCriteria userInfoCriteria = new UserInfoCriteria();
        userInfoCriteria.setOrderByClause("updated_time desc");
        userInfoCriteria.setLimitStart(page.getPageStart());
        userInfoCriteria.setLimitEnd(pageSize);
        UserInfoCriteria.Criteria criteria = userInfoCriteria.createCriteria();
        criteria.andUserIdNotEqualTo(userInfo.getUserId());
        if(StringUtil.isNotEmpty(searchUserName)) {
            criteria.andUserNameLikeInsensitive("%" + searchUserName + "%");
        }
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(userInfoMapper.countByExample(userInfoCriteria));
        }
        List<UserInfo> list = userInfoMapper.selectByExample(userInfoCriteria);
        page.setDataList(convertToDto(list));

        return page;
    }

    /**
     *首页推荐用户列表
     *@author shaojx
     *@date 2016/7/16 13:08
     *@version 1.0
     *@since 1.6
     */
    public Page queryUserListExcludeMeAndRecommend(int currentPage, int pageSize, String recommendType, UserInfo userInfo) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserInfoCriteria userInfoCriteria = new UserInfoCriteria();
        userInfoCriteria.setOrderByClause("updated_time");
        userInfoCriteria.setLimitStart(page.getPageStart());
        userInfoCriteria.setLimitEnd(pageSize);
        UserInfoCriteria.Criteria criteria = userInfoCriteria.createCriteria();
        criteria.andUserIdNotEqualTo(userInfo.getUserId());
        criteria.andRecommendLikeInsensitive("%" + recommendType + "%");
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(userInfoMapper.countByExample(userInfoCriteria));
        }
        List<UserInfo> list = userInfoMapper.selectByExample(userInfoCriteria);
        page.setDataList(convertToDto(list));

        return page;
    }

    /**
     *根据用户名来查找注册的邮箱
     * @param userName 用户名
     *@author shaojx
     *@date 2016/7/20 21:52
     *@version 1.0
     *@since 1.6
     */
    public UserInfo fetchUserInfoByUserName(String userName){
        UserInfoCriteria criteria=new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria1 = criteria.createCriteria();
        criteria1.andUserNameEqualTo(userName);
        List<UserInfo> userInfos = userInfoMapper.selectByExample(criteria);
        if(userInfos!=null&&userInfos.size()>0){
            return userInfos.get(0);
        }
        return null;
    }

    /**
     *更新用户的密码
     * @param userId 用户id
     * @param resetPwd 重置的密码
     *@return int 更新的记录数
     *@author shaojx
     *@date 2016/7/22 23:24
     *@version 1.0
     *@since 1.6
     */
    public int resetPwd(String userId, String resetPwd) {
        UserInfo record=new UserInfo();
        record.setUserId(userId);
        record.setUserPwd(resetPwd);
        int count = userInfoMapper.updateByPrimaryKeySelective(record);
        return count;
    }

    /**
     *更新用户的头像
     * @param userId 用户id
     * @param headPhotoUrl 头像的url
     *@return int 更新的数量(根据id来更新的数据，应该为1或者为0)
     *@author shaojx
     *@date 2016/8/7 0007 11:23
     *@version 1.0
     *@since 1.6
     */
    public int updateUserInfoHeadPhoto(String userId, String headPhotoUrl) {
        UserInfo userInfo=new UserInfo();
        userInfo.setUserId(userId);
        userInfo.setHeadPhotoUrl(headPhotoUrl);
        int updateByPrimaryKeySelective = userInfoMapper.updateByPrimaryKeySelective(userInfo);
        return updateByPrimaryKeySelective;
    }

    /**
     *根据用户的id来查询用户的信息
     * @param userId 用户id
     *@return com.ddas.sns.userinfo.domain.UserInfo
     *@author shaojx
     *@date 2016/8/7 0007 13:57
     *@version 1.0
     *@since 1.6
     */
    public UserInfo queryUserInfoByUserId(String userId){
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(userId);
        return userInfo;
    }

    /**
     *更新用户资料
     * @param userInfo 用户信息
     *@return com.ddas.sns.userinfo.domain.UserInfo 从数据库中重新获取的用户信息
     *@author shaojx
     *@date 2016/8/20 21:45
     *@version 1.0
     *@since 1.6
     */
    public UserInfo updateUserInfo(UserInfo userInfo) {
        userInfo.setUpdatedTime(DateUtil.getCurrentDateString());
        int updateByPrimaryKeySelective = userInfoMapper.updateByPrimaryKeySelective(userInfo);
        //get new data
        UserInfo newUserInfo = userInfoMapper.selectByPrimaryKey(userInfo.getUserId());
        return newUserInfo;
    }

    /**
     *更改用户的密码
     * 返回值说明:
     *<p> -9999 说明用户不存在，当作系统错误处理</p>
     * <p>-1 输入的旧密码与数据库中的不一致</p>
     *<p>200 表示更新成功</p>
     * @param oldPwd 旧密码
     * @param newPwd 新密码
     * @param loginUserInfo 当前登录的用户
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author shaojx
     *@date 2016/8/26 23:15
     *@version 1.0
     *@since 1.6
     */
    public Map<String, Object> comparePwd(String oldPwd, String newPwd, UserInfo loginUserInfo) {
        Map<String,Object> map=new HashMap<String, Object>();
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(loginUserInfo.getUserId());
        if(userInfo==null){
            LOGGER.error("用户为空--->更新用户密码时出错!",new RuntimeException());
            map.put("success",false);
            map.put("reason",-9999);
            return map;
        }
        //输入旧密码与数据库中不一致
       if(!StringUtil.equals(oldPwd,userInfo.getUserPwd())){
           map.put("success",false);
           map.put("reason",-1);
           return map;
       }

       //update(new one for not UserInfo other data,e.g. userinfo in `session`)
        UserInfo userinfo=new UserInfo();
        userinfo.setUserId(loginUserInfo.getUserId());
        userinfo.setUserPwd(newPwd);
        int updateByPrimaryKeySelective = userInfoMapper.updateByPrimaryKeySelective(userinfo);
        if(updateByPrimaryKeySelective==1){
            map.put("success",true);
            map.put("reason",200);//success
        }
        return map;
    }

    public UserInfo loginInProxyByAdmin(UserInfo userInfo) {
        // FIXME: 2016/9/8 admin 用户登录
        if("admin".equals(userInfo.getUserName())&&ADMIN_PWD.equals(userInfo.getUserPwd())){
            return userInfo;
        }else {
            return null;
        }
      /*  if (userInfo == null) {
            return null;
        }
        UserInfoCriteria example = new UserInfoCriteria();
        UserInfoCriteria.Criteria criteria = example.createCriteria();
        criteria.andUserNameEqualTo(userInfo.getUserName()).andUserPwdEqualTo(userInfo.getUserPwd())
                .andUserStatusEqualTo(ADMIN_TEMP_FLAG);
        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);
        if (userInfos != null && userInfos.size() == 1) {//有且只有一条记录
            return userInfos.get(0);
        }
        return null;*/
    }

    public List<UserInfoDto> convertToDto(List<UserInfo> userInfoList) {
        List<UserInfoDto> dtoList = new ArrayList<UserInfoDto>();
        for(UserInfo userInfo : userInfoList) {
            UserInfoDto userInfoDto = new UserInfoDto();
            userInfoDto.setUserId(userInfo.getUserId());
            userInfoDto.setUserCoin(userInfo.getUserCoin());
            userInfoDto.setUserStatus(userInfo.getUserStatus());
            userInfoDto.setUserBirth(userInfo.getUserBirth());
            userInfoDto.setCreatedTime(userInfo.getCreatedTime());
            userInfoDto.setHeadPhotoUrl(userInfo.getHeadPhotoUrl());
            userInfoDto.setLoginAddress(userInfo.getLoginAddress());
            userInfoDto.setLoginIp(userInfo.getLoginIp());
            userInfoDto.setRecommend(userInfo.getRecommend());
            userInfoDto.setUpdatedTime(userInfo.getUpdatedTime());
            userInfoDto.setUserContury(userInfo.getUserContury());
            userInfoDto.setUserDeclaration(userInfo.getUserDeclaration());
            userInfoDto.setUserMarryStatus(userInfo.getUserMarryStatus());
            userInfoDto.setUserEmail(userInfo.getUserEmail());
            userInfoDto.setUserEducation(userInfo.getUserEducation());
            userInfoDto.setUserDeclaration(userInfo.getUserDeclaration());
            userInfoDto.setUserEnroll(userInfo.getUserEnroll());
            userInfoDto.setUserReligion(userInfo.getUserReligion());
            userInfoDto.setUserSex(userInfo.getUserSex());
            userInfoDto.setUserWeight(userInfo.getUserWeight());
            userInfoDto.setUserName(userInfo.getUserName());
            userInfoDto.setUserHeight(userInfo.getUserHeight());

            UserVipInfo userVipInfo = fetchUserVipInfoCodeByUserId(userInfo.getUserId());
            if(userVipInfo != null) {
                userInfoDto.setVipTypeCode(userVipInfo.getVipTypeCode());
            }else {
                userInfoDto.setVipTypeCode(NORMAL_USER);
            }

            dtoList.add(userInfoDto);
        }

        return dtoList;
    }

    /**
     *根据用户的id来获取用户的权限信息
     * @param userId
     *@return com.ddas.sns.vip.domain.UserVipInfo
     *@author shaojx
     *@date 2016/8/14 13:47
     *@version 1.0
     *@since 1.6
     */
    public UserVipInfo fetchUserVipInfoCodeByUserId(String userId){
        if(StringUtil.isNotEmpty(userId)){
            UserVipInfoCriteria example = new UserVipInfoCriteria();
            UserVipInfoCriteria.Criteria criteria = example.createCriteria();
            criteria.andUserIdEqualTo(userId);
            String dateStr= DateUtil.getCurrentDateString();
            criteria.andVipEndStartGreaterThanOrEqualTo(dateStr);
            List<UserVipInfo> userVipInfos = userVipInfoMapper.selectByExample(example);
            if (userVipInfos != null&&userVipInfos.size()>0) {
                return userVipInfos.get(0);
            }
        }
        return null;
    }
}
