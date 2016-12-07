/**
 * 项目名称:	OpenSource
 * 文件名称:	UserInfoService.java
 * 包名:		 com.ddas.sns.friends.service
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/6/24
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.image.service;

import com.ddas.common.page.Page;
import com.ddas.common.result.Result;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.constants.Constants;
import com.ddas.sns.image.domain.ImageInfo;
import com.ddas.sns.image.domain.ImageInfoCriteria;
import com.ddas.sns.image.mapper.ImageInfoMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
     * 若图片ID为空，则新增，保存，若不为空，则直接保存
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public List<ImageInfo> getRecommendImageByMemb(UserInfo userInfo) {
        ImageInfoCriteria criteria = new ImageInfoCriteria();
        ImageInfoCriteria.Criteria criteriaExample = criteria.createCriteria();
        criteriaExample.andZoimGagaidEqualTo(userInfo.getMembGagaid()).andZoimIsrecommendEqualTo("1");//表示显示到首页
        
        return imageInfoMapper.selectByExample(criteria);
    }

    /**
     * 若图片ID为空，则新增，保存，若不为空，则直接保存
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
            imageInfo.setZoimState("1");//默认是1，目前不知道是什么意思

            // TODO: 2016/12/07 0007 这里要根据权限判断显示到首页的图片数量，确认recommend显示为什么 
            
            imageInfo.setZoimIsrecommend("1");//1代表显示在首页,2代表手动操作选择不显示在首页,0代表当已经有最多张图片（由权限决定）显示在首页，都给0.
            imageInfoMapper.insertSelective(imageInfo);
            return true;
        }else {
            imageInfoMapper.updateByPrimaryKey(imageInfo);
            return true;
        }
    }

    /**
     * 主要用于空间获取照片列表
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public Result getPhotoPageList(int pageNo, int pageSize, UserInfo userInfo){
        Page page=new Page();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        ImageInfoCriteria example = new ImageInfoCriteria();
        int countByExample = imageInfoMapper.countByExample(example);
        example.setLimitStart(page.getPageStart());
        example.setLimitEnd(pageSize);
        ImageInfoCriteria.Criteria criteria = example.createCriteria();
        criteria.andZoimGagaidEqualTo(userInfo.getMembGagaid());
        example.setOrderByClause("zoim_time desc");//时间降序
        List<ImageInfo> imageInfos = imageInfoMapper.selectByExample(example);
        page.setTotalCount(countByExample);

        Result result=new Result();
        result.setObj(imageInfos);
        result.setSuccess(true);
        result.setMsg(Constants.SUCCESS);

        return result;
    }

    /**
     * 删除图片。
     * @author liuchen
     * @date 2016/7/9 14:05
     * @version 1.0
     * @since 1.6
     */
    public boolean deleteImageInfoBatch(List<String> imgIdArray) {
        if(imgIdArray == null) {
            return false;
        }

        for (String imgUrl : imgIdArray) {
            ImageInfoCriteria example = new ImageInfoCriteria();
            ImageInfoCriteria.Criteria criteriaCriteria = example.createCriteria();
            criteriaCriteria.andZoimIdIn(imgIdArray);
            imageInfoMapper.deleteByExample(example);
        }

        return true;
    }

}
