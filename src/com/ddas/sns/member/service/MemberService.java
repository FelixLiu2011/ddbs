package com.ddas.sns.member.service;

import com.ddas.common.result.Result;
import com.ddas.common.util.StringUtil;
import com.ddas.sns.constants.Constants;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import com.ddas.sns.userinfo.service.UserInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:	MemberService
 * Function: 	MemberService
 *
 * @author shaojx
 * @date 2016/11/13 16:09
 * @since JDK 1.6
 */
@Service
public class MemberService {
    /*设置默认的语言为n-us */
    private final static String DEFALUT_LANGUAGE = "en-us";
    @Resource
    private UserInfoService userInfoService;

    /**
     *根据用户的id来获取相应用户的language,默认值 为en-us
     *@param mid 用户id
     *@return com.ddas.common.result.Result
     *@author shaojx
     *@date 2016/11/13 16:17
     *@version 1.0
     *@since 1.6
     */
    public Result getMemberId(String mid) {
        Result result = new Result();
        if (StringUtil.isBlank(mid)) {
            result.setMsg(Constants.FAILED);
            result.setSuccess(false);
            return result;
        }
        UserInfo userInfo = userInfoService.fetchUserInfoByUserId(mid);
        if (userInfo == null) {//所查找的用户不存在，直接返回
            result.setMsg(Constants.FAILED);
            result.setSuccess(false);
            return result;
        } else {
            String membLanguage = userInfo.getMembLanguage();
            result.setMsg(Constants.SUCCESS);
            result.setSuccess(true);
            Map<String, String> object = new HashMap<String, String>(1);
            if (StringUtil.isBlank(membLanguage)) {
                object.put("membLanguage", DEFALUT_LANGUAGE);
            } else {
                object.put("membLanguage", membLanguage);
            }
            result.setObject(object);
            return result;
        }
    }
}
