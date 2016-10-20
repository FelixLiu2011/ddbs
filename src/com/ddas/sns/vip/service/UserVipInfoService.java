package com.ddas.sns.vip.service;

import com.ddas.common.service.BaseService;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.sns.vip.domain.UserVipInfo;
import com.ddas.sns.vip.domain.UserVipInfoCriteria;
import com.ddas.sns.vip.mapper.UserVipInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName:	UserVipInfoService
 * Function: 	用户vip信息Service
 *
 * @author shaojx
 * @date 2016/8/14 13:42
 * @since JDK 1.6
 */
@Service
public class UserVipInfoService extends BaseService {
    @Autowired
    private UserVipInfoMapper userVipInfoMapper;

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
