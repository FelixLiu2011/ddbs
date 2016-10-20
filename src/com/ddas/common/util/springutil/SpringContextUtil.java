package com.ddas.common.util.springutil;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.*;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.util.*;

public class SpringContextUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.applicationContext = applicationContext;
	}

	/**
	 * 鏍规嵁key 鏉ユ煡鎵�鍊�
	 * 
	 * @param key
	 * @return
	 */
	public static String getMsgByKey(String key) {
		if (key == null | key.trim().length() <= 0) {
			return null;
		}
		return applicationContext.getMessage(key, null, Locale.getDefault());
	}

	/**
	 * 根据local获取相应的信息
	 * @param key
	 * @param locale
     * @return
     */
	public static String getMsgByKey(String key,Locale locale) {
		if (key == null | key.trim().length() <= 0) {
			return null;
		}
		return applicationContext.getMessage(key, null, locale);
	}

	/**
	 * 根据local获取相应的信息
	 * @param key
	 * @param locale
	 * @return
	 */
	public static String getMsgByKey(String key,String localeStr) {
		if (key == null | key.trim().length() <= 0) {
			return null;
		}
		return applicationContext.getMessage(key, null, new Locale(localeStr));
	}

	/**
	 * 寰楀埌鎵�湁鐨勫垎鍖轰俊鎭�
	 * 
	 * @return
	 */
	public static List<Integer> parseSplitBlocks() {
		List<Integer> splits = new ArrayList<Integer>();
		String splitBlocksString = getMsgByKey("split.blocks");
		String[] mapped = splitBlocksString.split("},");
		for (String keyValue : mapped) {
			String[] levelSplits = keyValue.replace("{", "").replace("}", "")
					.split(",");
			splits.add(Integer.valueOf(levelSplits[0]),
					Integer.valueOf(levelSplits[1]));
		}
		return splits;
	}

	/**
	 * 寰楀埌鎵�湁鐨勯噸杞姐�杩囪浇淇℃伅
	 * 
	 * @return
	 */

	public static Map<String, String> parseOverRideInfo() {
		String codeRelDbs = getMsgByKey("city_code_rel_db");
		Map<String, String> result = new HashMap<String, String>();
		// 瑙ｆ瀽琛ㄤ笌city code鐨勫搴斿叧绯�
		if (codeRelDbs != null && codeRelDbs.trim().length() > 0) {
			String rels[] = codeRelDbs.split(",");
			for (String temp : rels) {
				String res[] = temp.split("-");
				result.put(res[0], res[1]);
			}
		}
		return result;
	}

	/**
	 * 閲嶈浇銆佽繃杞界殑鏍囪瘑
	 * 
	 * @return
	 */
	public static Map<String, String> parseOverRideFlags() {
		String overRids = getMsgByKey("over_ride");
		Map<String, String> result = new HashMap<String, String>();
		// 瑙ｆ瀽閲嶈浇銆佽繃杞芥爣璇�
		if (overRids != null && overRids.trim().length() > 0) {
			String rels[] = overRids.split(",");
			for (String temp : rels) {
				String res[] = temp.split("-");
				result.put(res[0], res[1]);
			}
		}
		return result;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	public boolean containsBean(String arg0) {
		return applicationContext.containsBean(arg0);
	}

	public boolean containsBeanDefinition(String arg0) {
		return applicationContext.containsBeanDefinition(arg0);
	}

	public boolean containsLocalBean(String arg0) {
		return applicationContext.containsLocalBean(arg0);
	}

	public <A extends Annotation> A findAnnotationOnBean(String arg0,
			Class<A> arg1) throws NoSuchBeanDefinitionException {
		return applicationContext.findAnnotationOnBean(arg0, arg1);
	}

	public String[] getAliases(String arg0) {
		return applicationContext.getAliases(arg0);
	}

	public String getApplicationName() {
		return applicationContext.getApplicationName();
	}

	public AutowireCapableBeanFactory getAutowireCapableBeanFactory()
			throws IllegalStateException {
		return applicationContext.getAutowireCapableBeanFactory();
	}

	public <T> T getBean(Class<T> arg0) throws BeansException {
		return applicationContext.getBean(arg0);
	}

	public <T> T getBean(String arg0, Class<T> arg1) throws BeansException {
		return applicationContext.getBean(arg0, arg1);
	}

	public Object getBean(String arg0, Object... arg1) throws BeansException {
		return applicationContext.getBean(arg0, arg1);
	}

	public Object getBean(String arg0) throws BeansException {
		return applicationContext.getBean(arg0);
	}

	public int getBeanDefinitionCount() {
		return applicationContext.getBeanDefinitionCount();
	}

	public String[] getBeanDefinitionNames() {
		return applicationContext.getBeanDefinitionNames();
	}


	public String[] getBeanNamesForType(Class<?> arg0, boolean arg1,
			boolean arg2) {
		return applicationContext.getBeanNamesForType(arg0, arg1, arg2);
	}

	public String[] getBeanNamesForType(Class<?> arg0) {
		return applicationContext.getBeanNamesForType(arg0);
	}

	public <T> Map<String, T> getBeansOfType(Class<T> arg0, boolean arg1,
			boolean arg2) throws BeansException {
		return applicationContext.getBeansOfType(arg0, arg1, arg2);
	}

	public <T> Map<String, T> getBeansOfType(Class<T> arg0)
			throws BeansException {
		return applicationContext.getBeansOfType(arg0);
	}

	public Map<String, Object> getBeansWithAnnotation(
			Class<? extends Annotation> arg0) throws BeansException {
		return applicationContext.getBeansWithAnnotation(arg0);
	}

	public ClassLoader getClassLoader() {
		return applicationContext.getClassLoader();
	}

	public String getDisplayName() {
		return applicationContext.getDisplayName();
	}

	public Environment getEnvironment() {
		return applicationContext.getEnvironment();
	}

	public String getId() {
		return applicationContext.getId();
	}

	public String getMessage(MessageSourceResolvable arg0, Locale arg1)
			throws NoSuchMessageException {
		return applicationContext.getMessage(arg0, arg1);
	}

	public String getMessage(String arg0, Object[] arg1, Locale arg2)
			throws NoSuchMessageException {
		return applicationContext.getMessage(arg0, arg1, arg2);
	}

	public String getMessage(String arg0, Object[] arg1, String arg2,
			Locale arg3) {
		return applicationContext.getMessage(arg0, arg1, arg2, arg3);
	}

	public ApplicationContext getParent() {
		return applicationContext.getParent();
	}

	public BeanFactory getParentBeanFactory() {
		return applicationContext.getParentBeanFactory();
	}

	public Resource getResource(String arg0) {
		return applicationContext.getResource(arg0);
	}

	public Resource[] getResources(String arg0) throws IOException {
		return applicationContext.getResources(arg0);
	}

	public long getStartupDate() {
		return applicationContext.getStartupDate();
	}

	public Class<?> getType(String arg0) throws NoSuchBeanDefinitionException {
		return applicationContext.getType(arg0);
	}

	public boolean isPrototype(String arg0)
			throws NoSuchBeanDefinitionException {
		return applicationContext.isPrototype(arg0);
	}

	public boolean isSingleton(String arg0)
			throws NoSuchBeanDefinitionException {
		return applicationContext.isSingleton(arg0);
	}

	public boolean isTypeMatch(String arg0, Class<?> arg1)
			throws NoSuchBeanDefinitionException {
		return applicationContext.isTypeMatch(arg0, arg1);
	}

	public void publishEvent(ApplicationEvent arg0) {
		applicationContext.publishEvent(arg0);
	}

}
