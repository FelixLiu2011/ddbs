package com.ddas.sns.mylog.service;

import com.ddas.common.page.Page;
import com.ddas.sns.mylog.domain.MyLogInfoExample;
import com.ddas.sns.mylog.mapper.MyLogInfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * ClassName:	MyLogService
 * Function: 	我的日志Service
 *
 * @author shaojx
 * @date 2016/6/29 23:07
 * @since JDK 1.6
 */
@Service
public class MyLogService {
    @Resource
    private MyLogInfoMapper myLogInfoMapper;

    public Page queryRecodsByPage(int currentPage, int pageSize) {
        Page page = new Page();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        MyLogInfoExample myLogInfoExample = new MyLogInfoExample();
        myLogInfoExample.setOrderByClause("create_time");
        myLogInfoExample.setLimitStart(page.getPageStart());
        myLogInfoExample.setLimitEnd(pageSize);
        //MyLogInfoExample.Criteria criteria = myLogInfoExample.createCriteria();
        //这个criteria可以设置 字段条件
        // criteria.
        if(currentPage==1){//如果是当前第一页，则要求总数
            page.setTotalCount(myLogInfoMapper.countByExample(myLogInfoExample));
        }
        page.setDataList(myLogInfoMapper.selectByExample(myLogInfoExample));
        return page;
    }
}
