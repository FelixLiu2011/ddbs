/**
 * 项目名称:	SelfCreation
 * 文件名称:	ReloadablePropertiesUtil.java
 * 包名:		 com.ddas.sns.util
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/7/6
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.sns.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Map;
import java.util.Properties;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * ClassName:	ReloadablePropertiesUtil
 * Function: 	缓存properties资源到内存，当获取资源的时候会自动判断是否有更新并自动加载
 *              注意:所有的资源文件加载是通过ClassLoader.getResource（）.
 *
 * @author shaojunxiang
 * @date 14:51
 * @since JDK 1.6      
 */
public class ReloadablePropertiesUtil {
    private Logger logger= LoggerFactory.getLogger(ReloadablePropertiesUtil.class);
    //fileName-->ReloadablePropertiesUtil
    private static WeakHashMap<String,ReloadablePropertiesUtil> properties=new WeakHashMap<String, ReloadablePropertiesUtil>(32);
    //fileName-->entry
    public WeakHashMap<String,Entry> values=new WeakHashMap<String, Entry>(32);

    private String filePath;
    private ReloadablePropertiesUtil(String filePath){
        this.filePath=filePath;
    }

    /**
     *根据Key来获得相应的ReloadablePropertiesUtil
     *@param key key值(资源的名字)
     *@Author shaojunxiang
     *@Date 2016/7/6 16:26
     *@return com.ddas.sns.util.ReloadablePropertiesUtil
     *@since JDK1.6
     */
    public static  ReloadablePropertiesUtil getInstance(String key){
        if(key==null||key.equals("")){
            throw new IllegalArgumentException("Key不能为空!");
        }
        ReloadablePropertiesUtil reloadablePropertiesUtil = properties.get(key);
        if(reloadablePropertiesUtil==null){
            synchronized (ReloadablePropertiesUtil.class){
                reloadablePropertiesUtil = properties.get(key);
                if(reloadablePropertiesUtil==null){
                    ReloadablePropertiesUtil util=new ReloadablePropertiesUtil(key);
                    properties.put(key,util);
                    return util;
                }
            }
        }
        return reloadablePropertiesUtil;
    }

    /**
     *根据key值从缓存中获取相应的value值
     *@param key 对应的property key
     *@Author shaojunxiang
     *@Date 2016/7/6 16:31
     *@return java.lang.String 返回的value，有可能返回""
     *@since JDK1.6
     */
    public String getPropertyByKey(String key){
        Entry entry = values.get(filePath);
        if(entry==null){
            synchronized (this){
                entry=values.get(key);
                if(entry==null){
                    //reload
                    return reloadProperties(filePath,key);
                }
            }
        }else{
            String absouleFilePath;
            try {
                absouleFilePath=ReloadablePropertiesUtil.class.getClassLoader().getResource(filePath).toURI().toURL().getPath();
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("解析配置出错!",e);
            }
            File file=new File(absouleFilePath);
            if(file.lastModified()>entry.getFileLastModified()){//reload
                return  reloadProperties(filePath,key);
            }else{//从缓存中读
                Map<String,String>map=entry.getProperties();
                for(String cacheKey:map.keySet()){
                    if(cacheKey.equals(key)){
                        return map.get(key);
                    }
                }
            }
        }
        return "";
    }
    /**
     *重新加载properties文件
     *@param filePath 资源文件名
     *@param findKey 要查找的key()
     *@Author shaojunxiang
     *@Date 2016/7/6 16:35
     *@return java.lang.String 返回的value
     *@since JDK1.6
     */
    private String reloadProperties(String filePath,String findKey){
        logger.info(">>>>>reload filePath("+filePath+") start!");
        //reload
        Entry entry=new Entry();
        Properties properties=new Properties();
        String absouleFilePath;
        String findValue="";
        try {
            absouleFilePath=ReloadablePropertiesUtil.class.getClassLoader().getResource(filePath).toURI().toURL().getPath();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("解析配置出错!",e);
        }
        File file=new File(absouleFilePath);
        long lastModified = file.lastModified();
        entry.setFileLastModified(lastModified);
        entry.setFileName(filePath);

        try {
            properties.load(new FileInputStream(file));
            for(Object propertyKey:properties.keySet())
            {
                String propertyKeyStr=propertyKey.toString();
                String propertyValue=properties.get(propertyKeyStr).toString();
                if(findKey.equals(propertyKeyStr)){
                    //保存要找的数据
                    findValue=propertyValue;
                }
                entry.getProperties().put(propertyKeyStr,propertyValue);
            }
            values.put(filePath,entry);//cache
        } catch (IOException e) {
            e.printStackTrace();
        }
        return findValue;
    }


    /**
     * 对资源的封装
     */
    private class Entry{
        private volatile  long fileLastModified;
        private volatile String fileName;
        private volatile ConcurrentHashMap<String,String>properties=new ConcurrentHashMap<String, String>();

        public long getFileLastModified() {
            return fileLastModified;
        }

        public void setFileLastModified(long fileLastModified) {
            this.fileLastModified = fileLastModified;
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String fileName) {
            this.fileName = fileName;
        }

        public ConcurrentHashMap<String, String> getProperties() {
            return properties;
        }

        public void setProperties(ConcurrentHashMap<String, String> properties) {
            this.properties = properties;
        }
    }


    public static void main(String[] args) {
        ReloadablePropertiesUtil reloadablePropertiesUtil=ReloadablePropertiesUtil.getInstance("resources/config.properties");
        System.out.println(reloadablePropertiesUtil.getPropertyByKey("excludeURLs"));
    }
}
