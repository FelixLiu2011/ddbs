package com.ddas.common.util.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public abstract class ReflectionUtil {
	/**
	 * get the Method (public) which in the clazz
	 * 
	 * @param methodName
	 * @param clazz
	 * @param parameterTypes
	 * @return
	 */
	public static Method getMethodBySpcialName(String methodName,
			Class<?> clazz, Class<?>[] parameterTypes) {
		if (methodName == null || methodName.trim().length() <= 0
				|| clazz == null) {
			return null;
		}
		try {
			return clazz.getMethod(methodName, parameterTypes);
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * get the Constructor in the clazz which depends on the length of the
	 * parameters
	 * 
	 * @param clazz
	 * @param parameterTypes
	 * @return
	 */
	public static Constructor<?> getConstructor(Class<?> clazz,
			Class<?> parameterTypes) {
		if (clazz == null) {
			return null;
		}
		try {
			return clazz.getConstructor(parameterTypes);
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * get the field in the clazz by the name
	 * 
	 * @param clazz
	 * @param name
	 * @return
	 */
	public static Field getFieldBySpecialName(Class<?> clazz, String name) {
		if (clazz == null) {
			return null;
		}
		try {
			return clazz.getField(name);
		} catch (Exception e) {
		}
		return null;
	}
	
	/**
	 * invoke the spcial method which assciates with the object
	 * @param target object target
	 * @param parameters the method parameters
	 * @param methodName the name of the method
	 * @param parameterTypes the parameter types of the method
	 * @return invoke result
	 */
	public static Object invokeMethod(Object target,Object[]parameters,String methodName,Class<?>[] parameterTypes){
		if( target==null){
			return null;
		}
		Method method=getMethodBySpcialName(methodName, target.getClass(), parameterTypes);
		if(method!=null){
			try {
				return method.invoke(target, parameters);
			}  catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	public static Object invokeAnnotationMethod(String methodName,Annotation annotation,Class<?>[]parameterTypes,Object[]args){
		return invokeMethod(annotation, args, methodName, parameterTypes);
	}
}
