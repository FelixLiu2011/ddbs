/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.email.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.bean.BeanPropertiesCopyUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.email.domain.UserEmail;
import com.ddas.sns.email.domain.UserEmailCriteria;
import com.ddas.sns.email.domain.UserEmailDetailDto;
import com.ddas.sns.email.dto.UserEmailDto;
import com.ddas.sns.email.mapper.UserEmailMapper;
import com.ddas.sns.userblog.domain.UserBlog;
import com.ddas.sns.userblog.domain.UserBlogCriteria;
import com.ddas.sns.userblog.mapper.UserBlogMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
public class EmailService {
    private static final Logger LOGGER= LoggerFactory.getLogger(EmailService.class);

    @Resource
    private UserEmailMapper userEmailMapper;

    @Resource
    private UserInfoMapper userInfoMapper;

    //发送邮件
    public int save(UserEmail userEmail, UserInfo userInfo){
        if(StringUtil.isNotEmpty(userEmail.getEmailReceiver())) {
            userEmail.setEmailSender(userInfo.getUserId());
            userEmail.setEmailReceiver(userEmail.getEmailReceiver());
        }
        userEmail.setUeId(UUIDUtil.createUUID16());
        String currentDataString = DateUtil.getCurrentDateString();
        userEmail.setCreatedTime(currentDataString);
        userEmail.setUpdatedTime(currentDataString);
        int insertSelective = userEmailMapper.insertSelective(userEmail);
        return insertSelective;
    }

    public Page queryRecordsByPage(int currentPage, int pageSize, UserEmail userEmailObj, UserInfo loginUser){
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        UserEmailCriteria userEmailCriteria = new UserEmailCriteria();
        userEmailCriteria.setOrderByClause("created_time desc");//降序
        userEmailCriteria.setLimitStart(page.getPageStart());
        userEmailCriteria.setLimitEnd(pageSize);
        UserEmailCriteria.Criteria criteria = userEmailCriteria.createCriteria();
        if(StringUtil.isNotEmpty(userEmailObj.getEmailSender())) {//如果emailSender不为空，那么就查询LoginUser发送的邮件
            criteria.andEmailSenderEqualTo(loginUser.getUserId());
        }else if(StringUtil.isNotEmpty(userEmailObj.getEmailReceiver())) {
            criteria.andEmailReceiverEqualTo(loginUser.getUserId());
        }
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(userEmailMapper.countByExample(userEmailCriteria));
        }
        List<UserEmail> list = userEmailMapper.selectByExample(userEmailCriteria);
        List<UserEmailDto> dataList = new ArrayList<UserEmailDto>();
        for (UserEmail userEmail : list) {
            UserEmailDto userEmailDto = new UserEmailDto();
            userEmailDto.setUeId(userEmail.getUeId());
            userEmailDto.setCreatedTime(userEmail.getCreatedTime());
            userEmailDto.setEmailContent(userEmail.getEmailContent());
            if(StringUtil.isNotEmpty(userEmail.getEmailSender())) {
                UserInfo userInfo = userInfoMapper.selectByPrimaryKey(userEmail.getEmailSender());
                if (userInfo != null) {
                    userEmailDto.setEmailSenderName(userInfo.getUserName());
                    userEmailDto.setEmailSender(userEmail.getEmailSender());
                    userEmailDto.setSenderHeadPhotoUrl(userInfo.getHeadPhotoUrl());
                }
            }
            if(StringUtil.isNotEmpty(userEmail.getEmailReceiver())) {
                UserInfo userInfo = userInfoMapper.selectByPrimaryKey(userEmail.getEmailReceiver());
                if(userInfo!=null){
                    userEmailDto.setEmailReceiverName(userInfo.getUserName());
                    userEmailDto.setEmailReceiver(userEmail.getEmailReceiver());
                    userEmailDto.setReceiverHeadPhotoUrl(userInfo.getHeadPhotoUrl());
                }
            }

            dataList.add(userEmailDto);
        }
        page.setDataList(dataList);
        return page;
    }

    /**
     *获取邮件的回复列表
     * @param emailId 邮件的id
     * @param pageNo 当前页
     * @param pageSize 每页的大小
     * @param loginUser 登录用户
     *@return com.ddas.common.page.Page
     *@author shaojx
     *@date 2016/8/9 23:27
     *@version 1.0
     *@since 1.6
     */
    public Page fetchEmailDetailByEmailId(String emailId, int pageNo, int pageSize, UserInfo loginUser) {
        String currentUserId=loginUser.getUserId();
        String currentUserName=loginUser.getUserName();
        Map<String,String> userNameCache=new HashMap<String, String>();//user_id,user_name;
        Page page=new Page();
        page.setPageSize(pageSize);
        page.setCurrentPage(pageNo);
        UserEmailCriteria criteria=new UserEmailCriteria();
        criteria.setOrderByClause("created_time desc");//降序
        criteria.createCriteria().andMotherEmailIdEqualTo(emailId);//第一个邮件id相等即可
        criteria.or(criteria.createCriteria().andUeIdEqualTo(emailId));//最初的邮件

        criteria.setLimitEnd(pageSize);
        criteria.setLimitStart(page.getPageStart());
        if(pageNo==1){
            int countByExample = userEmailMapper.countByExample(criteria);
            page.setTotalCount(countByExample);//auto set total pages
        }
        List<UserEmail> userEmails = userEmailMapper.selectByExample(criteria);
        List<UserEmailDetailDto> convertedUserEmail=new ArrayList<UserEmailDetailDto>(userEmails.size());
        //conver dto
        for(UserEmail userEmail:userEmails){
            UserEmailDetailDto userEmailDto=new UserEmailDetailDto();
            //先复制简单的属性
            BeanPropertiesCopyUtil.copyProperties(userEmailDto,userEmail);
            //userEmailDto
            boolean fromMySelf=userEmail.getEmailSender().equals(currentUserId);
            userEmailDto.setType(fromMySelf?"1":"0");//1表示自己回复给别人，0表示别人回复给自己
            if(fromMySelf){//如果为我发送的邮件,别人的名字要从revicerId中取
                String receiverId = userEmail.getEmailReceiver();
                fetchUserNameFromCahcheOrDb(userNameCache, userEmailDto, receiverId);
            }else{//如果为别人发送给我的邮件，别人的名字要从senderid中取
                String senderId=userEmail.getEmailSender();
                fetchUserNameFromCahcheOrDb(userNameCache, userEmailDto, senderId);
            }
            userEmailDto.setUserName(currentUserName);
            //add
            convertedUserEmail.add(userEmailDto);
        }
        page.setDataList(convertedUserEmail);
        return page;
    }

    /**
     *设置用户名字
     * @param userNameCache 用户缓存
     * @param userEmailDto 邮件详情DTO
     * @param userId 查找的用户名
     *@return void
     *@author shaojx
     *@date 2016/8/9 23:24
     *@version 1.0
     *@since 1.6
     */
    private void fetchUserNameFromCahcheOrDb(Map<String, String> userNameCache, UserEmailDetailDto userEmailDto, String userId) {
        if(userNameCache.containsKey(userId)){
            userEmailDto.setOtherUserName(userNameCache.get(userId));//get value from cache
        }else{//get value from db and cache user_id:user_name
            String userName = userInfoMapper.selectByPrimaryKey(userId).getUserName();
            userNameCache.put(userId,userName);
            userEmailDto.setOtherUserName(userName);
        }
    }

    /**
     *回复邮件
     * @param emailId 回复邮件的id
     * @param senderId 当前回复邮件的发送者
     * @param loginUser 当前登录用户
     * @param  emailContent 邮件内容
     *@return int 插入的数据量
     *@author shaojx
     *@date 2016/8/10 21:44
     *@version 1.0
     *@since 1.6
     */
    public int reply(String emailId, String senderId,String emailContent, UserInfo loginUser) {
        UserEmail userEmail=new UserEmail();
        UserEmail parentEmail = userEmailMapper.selectByPrimaryKey(emailId);//获取当前的邮件的信息
        userEmail.setParentEmailId(emailId);//设置parentEamilId，这个id为当前邮件的id
        String motherEmailId = parentEmail.getMotherEmailId();
        if(motherEmailId==null||motherEmailId.trim().length()<=0){
            userEmail.setMotherEmailId(parentEmail.getUeId());//当parentEmail的motherId为空时，设置回复邮件的motherid为当前邮件的id(为第一封回复邮件)
        }else{
            userEmail.setMotherEmailId(parentEmail.getMotherEmailId());//设置当前的回复邮件的motherid与上一封的motherid相同
        }
        userEmail.setUeId(UUIDUtil.createUUID16());
        userEmail.setEmailSender(loginUser.getUserId());//设置邮件发送者的id为当前用户
        userEmail.setEmailReceiver(senderId);//设置邮件接收者为上一封邮件的发送者
        userEmail.setEmailContent(emailContent);
        String currentDataString = DateUtil.getCurrentDateString();
        userEmail.setCreatedTime(currentDataString);
        userEmail.setUpdatedTime(currentDataString);
        int insertSelective = userEmailMapper.insertSelective(userEmail);
        return insertSelective;
    }
}
