package com.ddas.sns.vip.service;

import com.ddas.common.service.BaseService;
import com.ddas.sns.vip.domain.VipPrivs;
import com.ddas.sns.vip.domain.VipPrivsCriteria;
import com.ddas.sns.vip.mapper.VipPrivsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClassName:	VipPrivisService
 * Function: 	权限值对应的service
 *
 * @author shaojx
 * @date 2016/8/14 13:05
 * @since JDK 1.6
 */
@Service
public class VipPrivisService extends BaseService {
    @Autowired
    private VipPrivsMapper vipPrivsMapper;

    /**
     *获取所有的权限值
     * @param
     *@return java.util.List<com.ddas.sns.vip.domain.VipPrivs>
     *@author shaojx
     *@date 2016/8/14 13:17
     *@version 1.0
     *@since 1.6
     */
    public List<VipPrivs> fetchAllDatas(){
        VipPrivsCriteria example = new VipPrivsCriteria();
        List<VipPrivs> vipPrivses = vipPrivsMapper.selectByExample(example);
        return vipPrivses;
    }
}

