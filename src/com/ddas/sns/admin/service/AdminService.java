package com.ddas.sns.admin.service;

import com.ddas.common.page.Page;
import com.ddas.common.service.BaseService;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.date.DateUtil;
import com.ddas.sns.admin.dto.UserRechargeRecordDto;
import com.ddas.sns.gift.mapper.UserGiftMapper;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.domain.UserInfoCriteria;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import com.ddas.sns.userrechargerecords.domain.UserRechargeRecord;
import com.ddas.sns.userrechargerecords.mapper.UserRechargeRecordMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:	AdminService
 * Function: 	后台管理 Service
 *
 * @author shaojx
 * @date 2016/9/4 23:48
 * @since JDK 1.6
 */
@Service
public class AdminService extends BaseService {
    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private UserRechargeRecordMapper userRechargeRecordMapper;

    @Resource
    private UserGiftMapper userGiftMapper;

    /**
     * 获取所有的用户信息
     *
     * @param pageNo    当前页
     * @param pageSize  每页的数据量
     * @param loginUser 登录的用户信息
     * @return com.ddas.common.page.Page 对数据的封装
     * @author shaojx
     * @date 2016/9/5 0:02
     * @version 1.0
     * @since 1.6
     */
    public Page findAllUserInfos(int pageNo, int pageSize,String searchTime,String searchTxt, UserInfo loginUser) {
        Page page = new Page();
        page.setCurrentPage(pageNo);
        page.setPageSize(pageSize);
        Map<String,Object> queryParams=new HashMap<String,Object>();
        if(StringUtil.isNotEmpty(searchTxt)){//设置相应的搜索条件
            queryParams.put("searchTxt",'%'+searchTxt+'%');
        }
        if(pageNo==1){//如果为第一页 ，设置相应的查询时间
            String currentDateString = DateUtil.getCurrentDateString();
            queryParams.put("searchTime",currentDateString);
            Map<String,Object>condition=new HashMap<String,Object>();
            condition.put("searchTime",currentDateString);
            page.setCondition(condition);
        }else{//如果不是第一页，则从前端保存的数据中取中查询的时间
            queryParams.put("searchTime",searchTime);
        }
        if(pageNo==1) {
            int totalCount = userInfoMapper.countAllUsers(queryParams);
            page.setTotalCount(totalCount);
        }
        queryParams.put("startPage",page.getPageStart());
        queryParams.put("endPage",pageSize);

        List<UserInfo> userInfos = userInfoMapper.selectAllUsers(queryParams);
        setPassword2Null(userInfos);
        page.setDataList(userInfos);
        return page;
    }

    /**
     *设置用户的密码为null
     * @param userInfos 用户信息列表
     *@return void
     *@author shaojx
     *@date 2016/9/5 0:26
     *@version 1.0
     *@since 1.6
     */
    private void setPassword2Null(List<UserInfo> userInfos) {
        if(userInfos==null){
            return;
        }
        for(UserInfo userInfo:userInfos){
            userInfo.setUserPwd(null);
        }
    }

    /**
     * 获取用户的充值记录
     * @param pageNo    当前页
     * @param pageSize  每页的数据量
     * @param loginUser 登录的用户信息
     * @return com.ddas.common.page.Page 对数据的封装
     * @author shaojx
     * @date 2016/9/5 0:02
     * @version 1.0
     * @since 1.6
     */
    public Page findUserRechargeInfos(int pageNo, int pageSize,String searchTime,String searchTxt, UserInfo loginUser) {
        Page page = new Page();
        page.setCurrentPage(pageNo);
        page.setPageSize(pageSize);
        Map<String,Object> queryParams=new HashMap<String,Object>();
        if(StringUtil.isNotEmpty(searchTxt)){//设置相应的搜索条件
            queryParams.put("searchTxt",'%'+searchTxt+'%');
        }
        if(pageNo==1){//如果为第一页 ，设置相应的查询时间
            String currentDateString = DateUtil.getCurrentDateString();
            queryParams.put("searchTime",currentDateString);
            Map<String,Object>condition=new HashMap<String,Object>();
            condition.put("searchTime",currentDateString);
            page.setCondition(condition);
        }else{//如果不是第一页，则从前端保存的数据中取中查询的时间
            queryParams.put("searchTime",searchTime);
        }
        if(pageNo==1) {
            int totalCount = userRechargeRecordMapper.countAllRecords(queryParams);
            page.setTotalCount(totalCount);
        }
        queryParams.put("startPage",page.getPageStart());
        queryParams.put("endPage",pageSize);

        List<UserRechargeRecordDto> userRechargeRecords = userRechargeRecordMapper.selectAllRecords(queryParams);
        page.setDataList(userRechargeRecords);
        return page;
    }

    /**
     * 获取礼物的记录列表
     * @param pageNo    当前页
     * @param pageSize  每页的数据量
     * @param loginUser 登录的用户信息
     * @return com.ddas.common.page.Page 对数据的封装
     * @author shaojx
     * @date 2016/9/5 0:02
     * @version 1.0
     * @since 1.6
     */
    public Page findGiftInfos(int pageNo, int pageSize,String searchTime,String searchTxt, UserInfo loginUser) {
        Page page = new Page();
        page.setCurrentPage(pageNo);
        page.setPageSize(pageSize);
        Map<String,Object> queryParams=new HashMap<String,Object>();
        if(StringUtil.isNotEmpty(searchTxt)){//设置相应的搜索条件
            queryParams.put("searchTxt",'%'+searchTxt+'%');
        }
        if(pageNo==1){//如果为第一页 ，设置相应的查询时间
            String currentDateString = DateUtil.getCurrentDateString();
            queryParams.put("searchTime",currentDateString);
            Map<String,Object>condition=new HashMap<String,Object>();
            condition.put("searchTime",currentDateString);
            page.setCondition(condition);
        }else{//如果不是第一页，则从前端保存的数据中取中查询的时间
            queryParams.put("searchTime",searchTime);
        }
        if(pageNo==1) {
            int totalCount = userGiftMapper.countAllRecords(queryParams);
            page.setTotalCount(totalCount);
        }
        queryParams.put("startPage",page.getPageStart());
        queryParams.put("endPage",pageSize);

        List<UserRechargeRecordDto> userRechargeRecords = userGiftMapper.selectAllRecords(queryParams);
        page.setDataList(userRechargeRecords);
        return page;
    }
}
