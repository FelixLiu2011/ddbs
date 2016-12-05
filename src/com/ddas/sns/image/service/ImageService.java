/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.image.service;

import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.image.domain.ImageInfo;
import com.ddas.sns.image.mapper.ImageInfoMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.zone.domain.ZoneInfo;
import com.ddas.sns.zone.mapper.ZoneInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * ClassName:	ImageService
 * Function: 	用户信息的Service
 *
 * @author shaojunxiang
 * @date 13:59
 * @since JDK 1.6
 */
@Service
public class ImageService {
    private static final Logger LOGGER= LoggerFactory.getLogger(ImageService.class);
    @Resource
    private ImageInfoMapper imageInfoMapper;

    /**
     * 若动态ID为空，则新增，保存，若不为空，则直接保存
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public boolean saveImageInfo(ImageInfo imageInfo) {
        if(imageInfo == null) {
            return false;
        }
        String currentDateTime = DateUtil.getCurrentDateString();
        if(StringUtil.isEmpty(imageInfo.getZoimId())) {//动态ID为空，那么新增
            imageInfo.setZoimId(UUIDUtil.createUUID16());
            imageInfo.setZoimTime(currentDateTime);
            imageInfoMapper.insertSelective(imageInfo);
            return true;
        }else {
            imageInfoMapper.updateByPrimaryKey(imageInfo);
            return true;
        }
    }

}
