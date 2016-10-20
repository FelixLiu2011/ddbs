package com.ddas.sns.cache;

import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.sns.vip.domain.VipPrivs;
import com.ddas.sns.vip.service.VipPrivisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * ClassName:	VipPrivsCache
 * Function: 	todo
 *
 * @author shaojx
 * @date 2016/8/14 12:47
 * @since JDK 1.6
 */
public final class VipPrivsCache {
    public static final String JOIN = "_";
    /*缓存,map的key为权限的typeCode加上"_"加上权限的type(e.g. photoCount),值为权限值*/
    private ConcurrentMap<String,VipPrivs> cache= new ConcurrentHashMap<String, VipPrivs>();//typeCode_key,value
    private SpringContextUtil springContextUtil;
    private static final Logger LOGGER= LoggerFactory.getLogger(VipPrivsCache.class);
    private ReentrantLock reentrantLock=new ReentrantLock();
    /**标记是否已加载*/
    private volatile boolean loaded=false;
    private VipPrivsCache(){
        //load data into cache
        reload();
    }

    /**
     *解析相应的权限并缓存
     * @param vipPrivses
     *@return void
     *@author shaojx
     *@date 2016/8/14 13:23
     *@version 1.0
     *@since 1.6
     */
    private void parsed(List<VipPrivs> vipPrivses) {
        for(VipPrivs vipPrivs:vipPrivses){
            cache.put(vipPrivs.getVipTypeCode()+ JOIN +vipPrivs.getPrivType(),vipPrivs);
        }
    }

    /**
     *根据相应的值从缓存中获取相应的值
     * @param typeCode 权限的code
     * @param privisType 权限的type
     *@return com.ddas.sns.vip.domain.VipPrivs
     *@author shaojx
     *@date 2016/8/14 13:25
     *@version 1.0
     *@since 1.6
     */
    public VipPrivs getVipPrivsByTypeCodeAndPrivisType(String typeCode,String privisType){
        VipPrivs vipPrivs = cache.get(typeCode + JOIN + privisType);
        return vipPrivs;
    }

    /**
     *重新加载数据
     * NOTE:
     * 这个方法虽然设计为public,但不建议频繁调用(每次调用会重新从数据库中reload数据)
     * @param
     *@return void
     *@author shaojx
     *@date 2016/8/14 13:35
     *@version 1.0
     *@since 1.6
     */
    public void reload(){
        try {
            reentrantLock.lock();
            LOGGER.info("reload vip privileges datas start............");
            VipPrivisService vipPrivisService= springContextUtil.getApplicationContext().getBean(VipPrivisService.class);
            List<VipPrivs> vipPrivses = vipPrivisService.fetchAllDatas();
            parsed(vipPrivses);
            LOGGER.info("reload vip privileges datas end,total data:"+cache.size());
        } finally {
            reentrantLock.unlock();
        }
    }


    public static VipPrivsCache getInstance(){
        return VipPrivsCacheHolder.vipPrivsCache;
    }

    /**单例对象持有者，可以延迟加载类**/
    private static class VipPrivsCacheHolder{
        private static VipPrivsCache vipPrivsCache=new VipPrivsCache();
    }
}
