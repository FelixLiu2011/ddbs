package com.ddas.common.util.jdbc;


import com.ddas.common.util.jdbc.interfaces.CompositePropertyReadable;
import com.ddas.common.util.reflect.ReflectionUtil;

import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.*;

/**
 * Auto convert ResultSet to ArrayList tip:make sure the pojo's properties have
 * set Method which you want to have a value! not be supported set array of any
 * type currently!
 * 
 * compare rules:make column's name which replace all REGEX_PATTERN_MATCHER and
 * to lower case,dual with the setter name the same as column's name.(replace
 * all REGEX_PATTERN_MATCHER and to lower case)
 * 
 * @author Administrator
 * 
 */
public class AutomaticSetProperty {
	private static Map<Class<?>, Class<?>> primitiveClassMappingWrapperClass = new HashMap<Class<?>, Class<?>>();
	private static final String SET_METHOD_PREFIX = "set";
	private static final String GET_METHOD_PREFIX = "get";
	private static final String REGEX_PATTERN_MATCHER = "[_&]";
	// fill primitiveClassMappingWrapperClass Map container
	static {
		primitiveClassMappingWrapperClass.put(int.class, Integer.class);
		primitiveClassMappingWrapperClass.put(byte.class, Byte.class);
		primitiveClassMappingWrapperClass.put(short.class, Short.class);
		primitiveClassMappingWrapperClass.put(long.class, Long.class);
		primitiveClassMappingWrapperClass.put(float.class, Float.class);
		primitiveClassMappingWrapperClass.put(double.class, Double.class);
		primitiveClassMappingWrapperClass.put(char.class, Character.class);
	}

	private AutomaticSetProperty() {
	}

	public static <T> List<T> parseProperties(ResultSet resultSet,
			Class<T> clazz) {
		if (resultSet == null || clazz == null) {
			return null;
		}

		try {

			Map<String, String> columnsMap = new HashMap<String, String>();
			ResultSetMetaData rsmd = resultSet.getMetaData();

			int columnCount = rsmd.getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				String columnName = rsmd.getColumnName(i);
				columnsMap.put(columnName.replaceAll(REGEX_PATTERN_MATCHER, "")
						.toLowerCase(), columnName);// 保存原列名与转换后的列名
			}

			List<T> list = new ArrayList<T>();

			while (resultSet.next()) {// 循环记录
				T t = clazz.newInstance();
				Set<String> columnsKeySet = columnsMap.keySet();
				Iterator<String> columnIterator = columnsKeySet.iterator();
				while (columnIterator.hasNext()) {
					String columnKey = columnIterator.next();// the lower case
																// property
					String columnName = columnsMap.get(columnKey);

					parseObject(t, clazz, columnKey, columnName, resultSet);// parse
				}

				list.add(t);// 保存数据
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;

	}

	private static <T> void parseObject(Object t, Class<T> clazz,
			String columnKey, String columnName, ResultSet resultSet) {
		String test = null;
		String testClassName = null;
		try {
			Method[] methods = t.getClass().getMethods();// 得到当前类的所有的方法

			for (Method method : methods) {
				String setterName;
				if (method.getName().contains(SET_METHOD_PREFIX)) {
					setterName = method.getName().substring(3)
							.replaceAll(REGEX_PATTERN_MATCHER, "");// 截取方法
					if (columnKey.equals(setterName.toLowerCase())) {// 如果这个setter方法跟当前的列名相同，则注入
						String cn = test = columnName;

						// Refactor at  2015.1.29
						// get the return type of the method
						Class<?> parameterTypes[] = method.getParameterTypes();
						if (parameterTypes != null
								&& parameterTypes.length == 1) {// make sure the parameter just have one!
							Class<?> parameterType = parameterTypes[0];

							// -----set value------------
							// check the return type is primitive class or not
							Class<?> primitiveClass = checkIsWrapperClass(parameterType);
							if (primitiveClass != null) {
								// the parameter is the wrapper class
								// covert capitalize letter of the return type
								// to uppercase,eg:int -->Int long-->Long
								// BigDecimal-->BigDecimal
								String parameterTypeSimpleName = primitiveClass.getSimpleName();
								String parameterTypeFirstLetterUpper = parameterTypeSimpleName.substring(0, 1).toUpperCase()
										+ parameterTypeSimpleName.substring(1);
								Object object = resultSet.getClass().getMethod(GET_METHOD_PREFIX+ parameterTypeFirstLetterUpper,String.class)
										.invoke(resultSet, cn);
								method.invoke(t, object);
							} else if (checkIsPrimitiveClass(parameterType) != null) { 
								// the parameter is the primitive class
								// covert capitalize letter of the return type
								// to uppercase,eg:int -->Int long-->Long
								// BigDecimal-->BigDecimal
								String parameterTypeSimpleName = parameterType.getSimpleName();
								String parameterTypeFirstLetterUpper = parameterTypeSimpleName.substring(0, 1).toUpperCase()+ parameterTypeSimpleName.substring(1);
								Object object = resultSet.getClass().getMethod(GET_METHOD_PREFIX+ parameterTypeFirstLetterUpper,String.class)
										.invoke(resultSet, cn);
								method.invoke(t, object);
							} else {
								// else the parameter is the other type,use get<MethodName>. e.g:getTimestamp()
								String parameterTypeSimpleName = parameterType.getSimpleName();
								Object object = resultSet.getClass().getMethod(GET_METHOD_PREFIX+ parameterTypeSimpleName,String.class)
										.invoke(resultSet, cn);
								method.invoke(t, object);
							}
						}
					} else {
						// 如果在普通的属性中找不到这个set<Property>方法，则递归查找内部实现了CompositedPropertyReadable接口的属性
						Class<?> parameterTypes[] = method.getParameterTypes();
						if (parameterTypes != null
								&& parameterTypes.length == 1) {
							Class<?> parameterType = parameterTypes[0];
							// check the parameter is the instance of CompositePropertyReadable
							if (CompositePropertyReadable.class
									.isAssignableFrom(parameterType)) {
								Method getInstanceMehtod = ReflectionUtil.getMethodBySpcialName(GET_METHOD_PREFIX+ method.getName().substring(3),t.getClass(), new Class<?>[] {});
								Object checkExisted = getInstanceMehtod.invoke(
										t, new Object[] {});
								Object innerObject = checkExisted == null ? parameterType
										.newInstance() : checkExisted;
								method.invoke(t, innerObject);// set object
								parseObject(innerObject, parameterType,
										columnKey, columnName, resultSet);// parse
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(test + "===" + testClassName);
		}
	}

	/**
	 * check the class is primitive class or not
	 * 
	 * @param clazz
	 */
	private static Class<?> checkIsPrimitiveClass(Class<?> clazz) {
		if (clazz == null) {
			return null;
		}
		Set<Class<?>> keyClassSet = primitiveClassMappingWrapperClass.keySet();
		for (Class<?> keyClass : keyClassSet) {
			if (clazz == keyClass) {
				return primitiveClassMappingWrapperClass.get(keyClass);
			}
		}
		return null;
	}

	/**
	 * check the clazz is the wrapped class or not
	 * 
	 * @param clazz
	 * @return
	 */
	private static Class<?> checkIsWrapperClass(Class<?> clazz) {
		if (clazz == null) {
			return null;
		}
		Set<Class<?>> keyClassSet = primitiveClassMappingWrapperClass.keySet();
		for (Class<?> keyClass : keyClassSet) {
			if (primitiveClassMappingWrapperClass.get(keyClass) == clazz) {
				return keyClass;
			}
		}
		return null;
	}

}
