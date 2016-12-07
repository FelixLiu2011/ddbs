package com.ddas.common.placeholder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.Properties;

/**
 * ClassName:	SecurityPropertyPlaceholderConfigurer
 * Function: 	解密Properties中的加密字段
 *
 * @author shaojx
 * @date 2016/12/7 22:11
 * @since JDK 1.6
 */
public class SecurityPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    private static final Logger LOGGER= LoggerFactory.getLogger(SecurityPropertyPlaceholderConfigurer.class);
    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {
        String password = props.getProperty("jdbc.password");
        String userName=props.getProperty("jdbc.username");
        String mailFrom=props.getProperty("mail.from");
        String mailPassword=props.getProperty("mail.password");
        if (password != null) {
            //解密jdbc.password属性值，并重新设置
            try {
                props.setProperty("jdbc.password", DesUtil.decrypt(password,DesUtil.KEY));
            } catch (Exception e) {
               LOGGER.error("解密出错!",e);
            }
        }
        if(userName!=null){
            //解密jdbc.username属性值，并重新设置
            try {
                props.setProperty("jdbc.username", DesUtil.decrypt(userName,DesUtil.KEY));
            } catch (Exception e) {
                LOGGER.error("解密出错!",e);
            }
        }
        if(mailFrom!=null){
            //解密mail.from属性值，并重新设置
            try {
                props.setProperty("mail.from", DesUtil.decrypt(mailFrom,DesUtil.KEY));
            } catch (Exception e) {
                LOGGER.error("解密出错!",e);
            }
        }
        if(mailPassword!=null){
            //解密mail.password属性值，并重新设置
            try {
                props.setProperty("mail.password", DesUtil.decrypt(mailPassword,DesUtil.KEY));
            } catch (Exception e) {
                LOGGER.error("解密出错!",e);
            }
        }

        super.processProperties(beanFactoryToProcess, props);
    }
}
