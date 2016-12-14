/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.zoneccomment.service;

import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.domain.UserInfoCriteria;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import com.ddas.sns.zone.domain.ZoneInfoCriteria;
import com.ddas.sns.zoneccomment.domain.ZoneComment;
import com.ddas.sns.zoneccomment.domain.ZoneCommentCriteria;
import com.ddas.sns.zoneccomment.mapper.ZoneCommentMapper;
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
public class ZoneCommentService {
    private static final Logger LOGGER= LoggerFactory.getLogger(ZoneCommentService.class);
    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private ZoneCommentMapper zoneCommentMapper;

    public List<ZoneComment> getZoneCommentListByZoneId(String zoneId){
        ZoneCommentCriteria example = new ZoneCommentCriteria();
        ZoneCommentCriteria.Criteria criteria = example.createCriteria();
        criteria.andZocoZoneidEqualTo(zoneId);
        return zoneCommentMapper.selectByExample(example);
    }
}
