package com.ddas.common.util.reflect;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public abstract class ClassUtil {

	private static Map<Class<?>, Class<?>> primitiveTypeMappingWrapperMap = new HashMap<Class<?>, Class<?>>();
	// the array flag
	private static final String ARRAY_FLAG = "[";

	// the two dimensional array flag
	private static final String TWO_ARRAY_DIMENSION_FLAG = "[[";
	static {
		primitiveTypeMappingWrapperMap.put(Byte.TYPE, Byte.class);
		primitiveTypeMappingWrapperMap.put(Short.TYPE, Short.class);
		primitiveTypeMappingWrapperMap.put(Integer.TYPE, Integer.class);
		primitiveTypeMappingWrapperMap.put(Long.TYPE, Long.class);
		primitiveTypeMappingWrapperMap.put(Float.TYPE, Float.class);
		primitiveTypeMappingWrapperMap.put(Double.TYPE, Double.class);
		primitiveTypeMappingWrapperMap.put(Character.TYPE, Character.class);
	}

	/**
	 * check the parameter clazz is one of the primitive types;
	 * 
	 * @param clazz
	 * @return
	 */
	public static Class<?> isPrimitiveType(Class<?> clazz) {
		if (clazz == null) {
			return null;
		}
		Set<Class<?>> keyClassesSet = primitiveTypeMappingWrapperMap.keySet();
		for (Class<?> c : keyClassesSet) {
			if (c == clazz) {
				return primitiveTypeMappingWrapperMap.get(c);
			}
		}
		return null;
	}

	/**
	 * get wrapper type of the basic data type
	 * 
	 * @param clazz
	 * @return
	 */
	public static Class<?> isWrappedTypeOfDataTypes(Class<?> clazz) {
		if (clazz == null) {
			return null;
		}
		Set<Class<?>> keyClassesSet = primitiveTypeMappingWrapperMap.keySet();
		for (Class<?> c : keyClassesSet) {
			if (primitiveTypeMappingWrapperMap.get(c) == clazz) {
				return c;
			}
		}
		return null;
	}

	/**
	 * check the clazz is a array type or not
	 * 
	 * @param clazz
	 * @return
	 */
	public static boolean isArrayType(Class<?> clazz) {
		if (clazz == null) {
			return false;
		}
		return clazz.getSimpleName().contains(ARRAY_FLAG);
	}

	/**
	 * check the clazz is a two dimension array type or not
	 * 
	 * @param clazz
	 * @return
	 */
	public static boolean isTwoDimensionArrayType(Class<?> clazz) {
		if (clazz == null) {
			return false;
		}
		return clazz.getSimpleName().contains(TWO_ARRAY_DIMENSION_FLAG);
	}

	/**
	 * load the class by it's name;
	 * @param className
	 * @return
	 */
	public static  Class<?> forName(String className) {
		try {
			return Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * get a instance by the classname
	 * @param className
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T newInstance(String className){
		try {
			return ((T) forName(className).newInstance());
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * get a instance by the class
	 * @param clazz
	 * @return
	 */
	public static <T> T newInstance(Class<T> clazz){
		if(clazz==null){
			return null;
		}
		try {
			return clazz.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		String a=ClassUtil.newInstance("java.lang.String");
		System.out.println(a);
	}
}
