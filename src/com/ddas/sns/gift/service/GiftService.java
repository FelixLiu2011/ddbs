package com.ddas.sns.gift.service;

import com.ddas.common.page.Page;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.gift.domain.UserGift;
import com.ddas.sns.gift.mapper.UserGiftMapper;
import com.ddas.sns.staticgift.domain.StaticGift;
import com.ddas.sns.staticgift.mapper.StaticGiftMapper;
import com.ddas.sns.userfriend.domain.UserFriend;
import com.ddas.sns.userfriendgift.dto.UserFriendGiftDto;
import com.ddas.sns.userfriendgift.mapper.UserFriendGiftMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * ClassName:	GiftService
 * Function: 	礼物Service
 *
 * @author shaojx
 * @date 2016/6/29 23:07
 * @since JDK 1.6
 */
@Service
public class GiftService {
    @Resource
    private UserGiftMapper userGiftMapper;
    @Resource
    private StaticGiftMapper staticGiftMapper;
    @Resource
    private UserFriendGiftMapper userFriendGiftMapper;
    @Resource
    private UserInfoMapper userInfoMapper;

    /**
     * 送礼物给好友的过程
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@since JDK1.6
     */
    public boolean sendGiftToFriend(String giftId, int count, String friendId, UserInfo userInfo) {
        UserGift userGift = new UserGift();
        DecimalFormat df = new DecimalFormat("0.00");//保留两位小数
        //以下是计算礼物的总价值
        StaticGift staticGift = staticGiftMapper.selectByPrimaryKey(giftId);
        Double price = Double.valueOf(staticGift.getGiftPrice());
        Double totalPrice = price * count;//计算总价
        //扣除我的金币数量
        String myCoin = StringUtil.isEmpty(userInfo.getUserCoin())? "0" : userInfo.getUserCoin();
        Double doubleMyCoin = Double.valueOf(myCoin) - totalPrice;
        if(doubleMyCoin < 0) {//余额不足，此处后面可以自定义异常，抛出去，提示余额不足。
            return false;
        }
        //扣除此次的总价，余额存到用户信息中
        userInfo.setUserCoin(df.format(doubleMyCoin));
        userInfoMapper.updateByPrimaryKeySelective(userInfo);

        //用户支付完成，将此次礼物赠送存入到礼物表中
        String currentDate = DateUtil.getCurrentDateString();
        userGift.setGiftTotalPrice(df.format(totalPrice));
        userGift.setCreatedTime(currentDate);
        userGift.setUpdatedTime(currentDate);
        userGift.setGiftSender(userInfo.getUserId());
        userGift.setGiftReceiver(friendId);
        userGift.setUgId(UUIDUtil.createUUID16());
        userGift.setGiftCount(String.valueOf(count));
        userGift.setGiftId(giftId);
        userGiftMapper.insertSelective(userGift);

        return true;
    }

    /**
     * 查询我送出的礼物或者我收到的礼物
     *@Author liuchen6
     *@Date 2016/7/1 14:59
     *@since JDK1.6
     */
    public Page queryUserGiftByPage(Page page, String giftProperty, UserInfo userInfo) {
        Map<String, Object> condition = new HashMap();
        condition.put("start", page.getPageStart());
        condition.put("end", page.getPageStart() + page.getPageSize());

        if("2".equals(giftProperty)) {//我收到的礼物的前端查询属性为"2"
            condition.put("giftReceiver", userInfo.getUserId());
        } else if("3".equals(giftProperty)) {//我送出的礼物的前端查询属性为"3"
            condition.put("giftSender", userInfo.getUserId());
        }

        page.setCondition(condition);
        page.setTotalCount(userFriendGiftMapper.getCount(page));
        //以下的逻辑不好，是为了拿到赠送礼物人的名字，最好用存储过程去处理
        List<UserFriendGiftDto> list = new ArrayList<UserFriendGiftDto>();
        for (UserFriendGiftDto userFriendGiftDto : userFriendGiftMapper.queryByPage(page)) {
            if (StringUtil.isNotEmpty(userFriendGiftDto.getGiftReceiver()) && StringUtil.isNotEmpty(userFriendGiftDto.getGiftSender())) {//取到用户名字
                UserInfo uir = userInfoMapper.selectByPrimaryKey(userFriendGiftDto.getGiftReceiver());
                userFriendGiftDto.setGiftReceiverName(uir.getUserName());
                UserInfo uis = userInfoMapper.selectByPrimaryKey(userFriendGiftDto.getGiftSender());
                userFriendGiftDto.setGiftSenderName(uis.getUserName());
            }
            list.add(userFriendGiftDto);
        }
        page.setDataList(list);

        return page;
    }
}
