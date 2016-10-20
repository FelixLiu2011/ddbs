package com.ddas.sns.privilege.service;

import com.ddas.common.service.BaseService;
import com.ddas.common.util.date.DateUtil;
import com.ddas.sns.cache.VipPrivsCache;
import com.ddas.sns.constants.VipTypeEnum;
import com.ddas.sns.email.domain.UserEmailCriteria;
import com.ddas.sns.email.mapper.UserEmailMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.usermessage.domain.UserMessage;
import com.ddas.sns.vip.domain.UserVipInfo;
import com.ddas.sns.vip.domain.UserVipInfoCriteria;
import com.ddas.sns.vip.domain.VipPrivs;
import com.ddas.sns.vip.mapper.UserVipInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName:	PrivilegeService
 * Function: 	查询权限的信息的Service
 *
 * @author shaojx
 * @date 2016/8/17 21:54
 * @since JDK 1.6
 */
@Service
public class PrivilegeService extends BaseService {
    private static final Logger LOGGER= LoggerFactory.getLogger(PrivilegeService.class);
    @Autowired
    private UserVipInfoMapper userVipInfoMapper;
    @Autowired
    private UserEmailMapper userEmailMapper;

    /**
     *查询当天的邮件发送是否超过数据库的配置 ，数据库的权限配置key为`dailyEamilCount`
     * @param loginUser 当前的登录用户
     *@return boolean {true}表示超过了设置的权限值，{false}表示没有超过相应的设置值
     *@author shaojx
     *@date 2016/8/17 22:08
     *@version 1.0
     *@since 1.6
     */
    public boolean checkDailyEmailCountOverFlow(UserInfo loginUser) {
        UserVipInfoCriteria example = new UserVipInfoCriteria();
        UserVipInfoCriteria.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(loginUser.getUserId());
        List<UserVipInfo> userVipInfos = userVipInfoMapper.selectByExample(example);
        String vipTypeCode= VipTypeEnum.NORMAL.getType()+"";//普通用户
        if(userVipInfos!=null&&userVipInfos.size()>0){
            UserVipInfo userVipInfo = userVipInfos.get(0);
            vipTypeCode=userVipInfo.getVipTypeCode();
        }
        VipPrivsCache instance = VipPrivsCache.getInstance();
        VipPrivs dailyEamilCount = instance.getVipPrivsByTypeCodeAndPrivisType(vipTypeCode, "dailyEamilCount");//查询每天的限额值
        if(dailyEamilCount==null){
            LOGGER.error("查询不到正确的权限配置值，key:dailyEamilCount",new RuntimeException());
        }
        UserEmailCriteria userEmailCriteria = new UserEmailCriteria();
        UserEmailCriteria.Criteria userEmailCriteriaCriteria = userEmailCriteria.createCriteria();
        String currentDateString = DateUtil.getCurrentDateString();
        String dateStr=currentDateString.split(" ")[0];//get date
        userEmailCriteriaCriteria.andCreatedTimeLikeInsensitive(dateStr+"%");//今天的日期
        userEmailCriteriaCriteria.andEmailSenderEqualTo(loginUser.getUserId());//发送者id
        int countByExample = userEmailMapper.countByExample(userEmailCriteria);
        if(countByExample>=Integer.parseInt(dailyEamilCount.getPrivValue())){
            return true;
        }
        return false;
    }
}
