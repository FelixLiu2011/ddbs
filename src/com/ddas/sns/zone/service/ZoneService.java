/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.zone.service;

import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.image.domain.ImageInfo;
import com.ddas.sns.image.service.ImageService;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.domain.UserInfoCriteria;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import com.ddas.sns.zone.domain.ZoneInfo;
import com.ddas.sns.zone.mapper.ZoneInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import sun.plugin.javascript.navig.ImageArray;

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
public class ZoneService {
    private static final Logger LOGGER= LoggerFactory.getLogger(ZoneService.class);
    @Resource
    private ZoneInfoMapper zoneInfoMapper;

    @Resource
    private ImageService imageService;

    /**
     * 若动态ID为空，则新增，保存，若不为空，则直接保存
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public boolean saveZoneInfo(ZoneInfo zoneInfo) {
        if(zoneInfo == null) {
            return false;
        }
        String currentDateTime = DateUtil.getCurrentDateString();
        if(StringUtil.isEmpty(zoneInfo.getZoneId())) {//动态ID为空，那么新增
            zoneInfo.setZoneId(UUIDUtil.createUUID16());
            zoneInfo.setZoneDatetime(currentDateTime);
            zoneInfoMapper.insertSelective(zoneInfo);
            return true;
        }else {
            zoneInfoMapper.updateByPrimaryKey(zoneInfo);
            return true;
        }
    }

    /**
     * 保存图片，并且保存到一个动态
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public boolean saveImageInfoAndZoneInfo(String[] imgArray, UserInfo userInfo) {
        if(imgArray == null) {
            return false;
        }

        ZoneInfo zoneInfo = new ZoneInfo();
        zoneInfo.setZoneGagaid(userInfo.getMembGagaid());
        zoneInfo.setZoneImgcount(imgArray.length);
        zoneInfo.setZoneContent("");
        saveZoneInfo(zoneInfo);

        for (String imgUrl : imgArray) {
            ImageInfo imageInfo = new ImageInfo();
            imageInfo.setZoimImgurl(imgUrl);
            imageInfo.setZoimGagaid(userInfo.getMembGagaid());
            imageInfo.setZoimZoneid(zoneInfo.getZoneId());
            imageService.saveImageInfo(imageInfo);
        }

        return true;
    }



}
