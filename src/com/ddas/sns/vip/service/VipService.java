package com.ddas.sns.vip.service;

import com.ddas.common.exception.ServiceException;
import com.ddas.common.service.BaseService;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import com.ddas.sns.vip.domain.*;
import com.ddas.sns.vip.mapper.UserVipInfoMapper;
import com.ddas.sns.vip.mapper.VipPrivsMapper;
import com.ddas.sns.vip.mapper.VipRechargeRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * ClassName:	VipService
 * Function: 	Vip  Service类
 *
 * @author shaojx
 * @date 2016/8/12 22:19
 * @since JDK 1.6
 */
@Service
public class VipService extends BaseService {
    @Autowired
    private VipPrivsMapper vipPrivsMapper;

    @Autowired
    private UserVipInfoMapper userVipInfoMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private VipRechargeRecordMapper vipRechargeRecordMapper;

    /**
     *根据VIP的类型来获取相应的权限信息
     * @param vipCode vip类型code
     *@return java.util.List<com.ddas.sns.vip.domain.VipPrivs>
     *@author shaojx
     *@date 2016/8/12 22:53
     *@version 1.0
     *@since 1.6
     */
    public List<VipPrivs> fetchVipPrivsByVipCode(String vipCode){
        VipPrivsCriteria criteria=new VipPrivsCriteria();
        VipPrivsCriteria.Criteria criterion = criteria.createCriteria();
        criterion.andVipTypeCodeEqualTo(vipCode);
        List<VipPrivs> vipPrivses = vipPrivsMapper.selectByExample(criteria);
        return vipPrivses;
    }

    /**
     *根据用户的id来获取相应的用户vip信息
     * @param userId 用户id
     *@return com.ddas.sns.vip.domain.UserVipInfo vip信息
     *@author shaojx
     *@date 2016/8/12 22:58
     *@version 1.0
     *@since 1.6
     */
    public UserVipInfo fetchUserVipInfoByUserId(String userId){
        if(StringUtil.isNotEmpty(userId)){
            UserVipInfoCriteria userVipInfoCriteria =new UserVipInfoCriteria();
            UserVipInfoCriteria.Criteria criteria = userVipInfoCriteria.createCriteria();
            criteria.andUserIdEqualTo(userId);
            List<UserVipInfo> userVipInfos = userVipInfoMapper.selectByExample(userVipInfoCriteria);
            if(userVipInfos!=null&&userVipInfos.size()>0){
                return userVipInfos.get(0);
            }
            return null;
        }
        return null;
    }

    /**
     *根据用户的id来获取用户相应的vip权限
     * @param userId 用户的id
     *@return java.util.List<com.ddas.sns.vip.domain.VipPrivs> vip相应的权限
     *@author shaojx
     *@date 2016/8/12 23:03
     *@version 1.0
     *@since 1.6
     */
    public List<VipPrivs> fetchVipPrivsByUserId(String userId){
        UserVipInfo userVipInfo = fetchUserVipInfoByUserId(userId);
        if(userVipInfo==null){
            return new ArrayList<VipPrivs>();
        }
        return fetchVipPrivsByVipCode(userVipInfo.getVipTypeCode());
    }

    /**
     *根据用户的id来获取用户相应的vip权限
     * @param userId 用户的id
     * @param userId 用户选择的vip等级
     *@return boolean true的时候开通vip成功
     *@author shaojx
     *@date 2016/8/12 23:03
     *@version 1.0
     *@since 1.6
     */
    public boolean payForVip(String userId, String vipType, UserInfo userInfo) throws ServiceException{
        Double totalPrice = 0.00;
        String vipCode = "";
        int vipTime = 0;
        if("1_20_1".equals(vipType)) {
            totalPrice = 20.00;
            vipCode = "1";
            vipTime = 1;
        }else if("1_50_3".equals(vipType)) {
            totalPrice = 50.00;
            vipCode = "1";
            vipTime = 3;
        }else if("1_90_6".equals(vipType)) {
            totalPrice = 90.00;
            vipCode = "1";
            vipTime = 6;
        }else if("1_150_12".equals(vipType)) {
            totalPrice = 150.00;
            vipCode = "2";
            vipTime = 12;
        }else if("2_99_1".equals(vipType)) {
            totalPrice = 99.00;
            vipCode = "2";
            vipTime = 1;
        }else if("2_269_3".equals(vipType)) {
            totalPrice = 269.00;
            vipCode = "2";
            vipTime = 3;
        }else if("2_489_6".equals(vipType)) {
            totalPrice = 489.00;
            vipCode = "2";
            vipTime = 6;
        }else if("2_899_12".equals(vipType)) {
            totalPrice = 899.00;
            vipCode = "2";
            vipTime = 12;
        }
        DecimalFormat df = new DecimalFormat("0.00");//保留两位小数
        //扣除我的金币数量
        String myCoin = StringUtil.isEmpty(userInfo.getUserCoin())? "0" : userInfo.getUserCoin();
        Double doubleMyCoin = Double.valueOf(myCoin) - totalPrice;
        if(doubleMyCoin < 0) {//余额不足，此处后面可以自定义异常，抛出去，提示余额不足。
            throw new ServiceException("moneyNotEnough");//此处的异常信息与国际化文件中的key对应
        }
        //扣除此次的总价，余额存到用户信息中
        userInfo.setUserCoin(df.format(doubleMyCoin));
        userInfoMapper.updateByPrimaryKeySelective(userInfo);
        UserVipInfo userVipInfo = new UserVipInfo();

        userVipInfo.setUserId(userId);
        userVipInfo.setVipInfoId(UUIDUtil.createUUID16());
        userVipInfo.setVipTypeCode(vipCode);
        userVipInfo.setVipStartDate(DateUtil.getCurrentDateString());
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        switch (vipTime){
            case 1 : calendar.add(calendar.MONTH, + 1);
                break;
            case 3 : calendar.add(calendar.MONTH, + 3);
                break;
            case 6 : calendar.add(calendar.MONTH, + 6);
                break;
            case 9 : calendar.add(calendar.MONTH, + 9);
                break;
            case 12 : calendar.add(calendar.MONTH, + 12);
                break;
            default : return false;
        }
        String vipEndTime = dft.format(calendar.getTime());
        userVipInfo.setVipEndStart(vipEndTime);

        userVipInfoMapper.insertSelective(userVipInfo);

        //存储到vip record表中
        VipRechargeRecord vipRechargeRecord = new VipRechargeRecord();
        vipRechargeRecord.setRecordsId(UUIDUtil.createUUID16());
        vipRechargeRecord.setUserId(userInfo.getUserId());
        vipRechargeRecord.setRechargeToUser(userId);
        vipRechargeRecord.setRechargeDate(DateUtil.getCurrentDateString());
        vipRechargeRecord.setVipCode(vipCode);
        vipRechargeRecord.setRechargeMoneyCount(String.valueOf(totalPrice));
        vipRechargeRecord.setRechargeMonthsCount(String.valueOf(vipTime));
        vipRechargeRecordMapper.insertSelective(vipRechargeRecord);

        return true;
    }
}
