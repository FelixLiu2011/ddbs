package com.ddas.sns.ihome.service;

import com.ddas.common.page.Page;
import com.ddas.common.result.Attachment;
import com.ddas.common.result.Result;
import com.ddas.sns.constants.Constants;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userinfo.domain.UserInfoCriteria;
import com.ddas.sns.userinfo.mapper.UserInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ClassName:	IHomeService
 * Function: 	`偶遇`模块Service
 *
 * @author shaojx
 * @date 2016/11/10 22:32
 * @since JDK 1.6
 */
@Service
public class IHomeService {
    @Resource
    public UserInfoMapper userInfoMapper;

    public Result getTypeData(int pageNo,int pageSize,String quickSearchType,String searchType){
        Page page=new Page();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        UserInfoCriteria example = new UserInfoCriteria();
        example.setLimitStart(page.getPageStart());
        example.setLimitEnd(pageSize);
        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);
        Attachment attachment=new Attachment();
        attachment.setData(userInfos);
        attachment.setPage(page);
        Result result=new Result();
        result.setSuccess(true);
        result.setMsg(Constants.SUCCESS);
        return result;
    }
}
