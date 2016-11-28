package com.ddas.sns.userlikesb.service;

import com.ddas.common.util.StringUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.constants.Constants;
import com.ddas.sns.userlikesb.domain.UserLikeSomebody;
import com.ddas.sns.userlikesb.domain.UserLikeSomebodyCriteria;
import com.ddas.sns.userlikesb.mapper.UserLikeSomebodyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * ClassName:	UserLikeSbService
 * Function: 	用户关注Service
 *
 * @author shaojx
 * @date 2016/11/12 23:17
 * @since JDK 1.6
 */
@Service
public class UserLikeSbService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserLikeSbService.class);
    @Resource
    private UserLikeSomebodyMapper userLikeSomebodyMapper;

    /**
     * 获取用户关注的用户列表
     *
     * @param lovedIdList 前台查询的用户ids
     * @param curUserId   当前用户
     * @return java.util.Map<java.lang.String,java.lang.Object> 返回相应的信息
     * success:true 表示查询成功,false表示查询失败
     * obj:用户id:1表示为该用户为自己所关注的 用户id:0表示该用户不是自己所关注的
     * msg:返回的查询信息
     * attributes:一些附带的属性
     * @author shaojx
     * @date 2016/11/12 23:41
     * @version 1.0
     * @since 1.6
     */
    public Map<String, Object> findIfIloveList(String lovedIdList, String curUserId) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", true);
        result.put("obj", null);
        result.put("attributes", null);
        result.put("msg", Constants.SUCCESS);

        try {
            if (StringUtil.isBlank(lovedIdList)) {//如果调用的ids为空直接返回
                return result;
            }
            if (StringUtil.isBlank(curUserId)) {//如果当前用户没有登录，或者是`游客`,全部填充`0`
                Map<String, String> fillZero = fillZero(lovedIdList);
                result.put("obj", fillZero);
                return result;
            }
            UserLikeSomebodyCriteria example = new UserLikeSomebodyCriteria();
            UserLikeSomebodyCriteria.Criteria criteria = example.createCriteria();
            criteria.andUserIdEqualTo(curUserId);
            criteria.andSbIdIn(Arrays.asList(lovedIdList.split(",")));
            List<UserLikeSomebody> userLikeSomebodies = userLikeSomebodyMapper.selectByExample(example);
            Map<String, String> stringStringMap = fillOneValueIfLiked(userLikeSomebodies, lovedIdList);
            result.put("obj", stringStringMap);
        } catch (Exception e) {
            LOGGER.error("查询用户关注列表失败！", e);
            result.put("success", false);
            result.put("obj", null);
            result.put("msg", Constants.FAILED);
        }
        return result;
    }

    /**
     * 解析是否为自己所关注的人
     *
     * @param userLikeSomebodies 从数据库关注表查询的记录
     * @param lovedIdList        前台查询的用户ids
     * @return java.util.Map<java.lang.String,java.lang.String> `1`表示为关注 `0`表示为不关注
     * @author shaojx
     * @date 2016/11/12 23:39
     * @version 1.0
     * @since 1.6
     */
    private Map<String, String> fillOneValueIfLiked(List<UserLikeSomebody> userLikeSomebodies, String lovedIdList) {
        Set<String> sbIds = new HashSet<String>(userLikeSomebodies.size());
        for (UserLikeSomebody userLikeSomebody : userLikeSomebodies) {
            sbIds.add(userLikeSomebody.getSbId());
        }
        Map<String, String> result = new HashMap<String, String>(userLikeSomebodies.size());
        for (String id : lovedIdList.split(",")) {
            if (sbIds.contains(id)) {
                result.put("\"" + id + "\"", "1");
            } else {
                result.put("\"" + id + "\"", "0");
            }
        }
        return result;
    }

    /**
     * 填充相应的值为o
     *
     * @param lovedIdList 查询的用户ids
     * @return java.util.Map<java.lang.String,java.lang.String>
     * @author shaojx
     * @date 2016/11/12 23:46
     * @version 1.0
     * @since 1.6
     */
    private Map<String, String> fillZero(String lovedIdList) {
        Set<String> userIds = new HashSet<String>(Arrays.asList(lovedIdList.split(",")));
        Map<String, String> result = new HashMap<String, String>(userIds.size());
        for (String id : userIds) {
            result.put("\"" + id + "\"", "0");
        }
        return result;
    }

    /**
     * 用户关注某人
     *
     * @param mid           somebody id
     * @param currentUserId 当前用户的id
     * @return boolean {true}表示关注成功，{false}表示关注失败
     * @author shaojx
     * @date 2016/11/13 0:13
     * @version 1.0
     * @since 1.6
     */
    public boolean iliketoonly(String mid, String currentUserId) {
        if (StringUtil.isBlank(mid)) {
            return false;
        }
        int i = 0;
        try {
            UserLikeSomebody record = new UserLikeSomebody();
            record.setId(UUIDUtil.createUUID20());
            record.setUserId(currentUserId);
            record.setSbId(mid);
            i = userLikeSomebodyMapper.insertSelective(record);
        } catch (Exception e) {
            LOGGER.error("用户关注失败!",e);
        }
        return i == 1;
    }

    /**
     * 用户取消关注
     * @param mid           关注的用户id
     * @param currentUserId 当前用户id
     * @return boolean {true}取消关注成功，{false}取消关注失败
     * *@author shaojx
     * @date 2016/11/13 15:52
     * @version 1.0
     * @since 1.6
     */
    public boolean deleteILiked(String mid, String currentUserId) {
        if (StringUtil.isBlank(mid)) {
            return false;
        }
        int deleteByExample = 0;
        try {
            UserLikeSomebodyCriteria example = new UserLikeSomebodyCriteria();
            UserLikeSomebodyCriteria.Criteria criteria = example.createCriteria();
            criteria.andUserIdEqualTo(currentUserId);
            criteria.andSbIdEqualTo(mid);
            deleteByExample = userLikeSomebodyMapper.deleteByExample(example);
        } catch (Exception e) {
           LOGGER.error("用户取消关注失败!",e);
        }
        return deleteByExample == 1;
    }
}
