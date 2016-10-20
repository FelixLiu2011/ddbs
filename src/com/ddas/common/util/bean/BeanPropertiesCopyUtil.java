package com.ddas.common.util.bean;


import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * ClassName:	BeanPropertiesCopyUtil
 * Function: 	这是一个简单的属性复制工具类，只是一个浅拷贝
 *
 * @author shaojx
 * @date 2016/8/9 22:38
 * @since JDK 1.6
 */
public final class BeanPropertiesCopyUtil {
    private BeanPropertiesCopyUtil() {
    }

    public static <D, S> void copyProperties(D d, S s) {
        Class<?> dClass = d.getClass();
        Class<?> sClass = s.getClass();
        Method[] declaredMethods = dClass.getMethods();//public methods,include inherit methods
        //目标bean
        List<Method> setterMethodsFromDestination = new ArrayList<Method>();
        List<Method> getterMethodFromDestination = new ArrayList<Method>();
        //保存属性，注意:针对目标bean，只取相应的setter方法的属性。即每一个set方法会作为一个属性,不考虑相应的get方法
        List<String> propertiesFormDestination = new ArrayList<String>();
        for (Method method : declaredMethods) {
            String methodName = method.getName();
            if (methodName.startsWith("set")) {
                setterMethodsFromDestination.add(method);
                propertiesFormDestination.add(methodName.substring("set".length()));
            } else if (methodName.startsWith("get")) {
                getterMethodFromDestination.add(method);
            } else if (methodName.startsWith("is")) {//is 为布尔属性
                getterMethodFromDestination.add(method);
            }
        }

        Method[] sClassDeclaredMethods = sClass.getMethods();//public methods,include inherit methods
        //源bean
        List<Method> setterMethodsFromSource = new ArrayList<Method>();
        List<Method> getterMethodFromSource = new ArrayList<Method>();
        //保存属性，注意:针对源bean，只取相应的getter方法的属性。即每一个get方法会作为一个属性,不考虑相应的set方法
        List<String> propertiesFormSource = new ArrayList<String>();
        for (Method method : sClassDeclaredMethods) {
            String methodName = method.getName();
            if (methodName.startsWith("set")) {
                setterMethodsFromSource.add(method);
            } else if (methodName.startsWith("get")) {
                getterMethodFromSource.add(method);
                propertiesFormSource.add(methodName.substring("get".length()));
            } else if (methodName.startsWith("is")) {//is 为布尔属性
                getterMethodFromSource.add(method);
                propertiesFormSource.add(methodName.substring("is".length()));
            }
        }
        //开始复制
        for (int index = 0; index < propertiesFormSource.size(); index++) {
            String property = propertiesFormSource.get(index);//获得相应的属性名字
            if (propertiesFormDestination.contains(property)) {//存在相应的属性
                Method getMethod = getterMethodFromSource.get(index);//getter method from source
                Method setMethod = setterMethodsFromDestination.get(propertiesFormDestination.indexOf(property));//setter method from destination
                try {
                    setMethod.invoke(d, getMethod.invoke(s));//set value
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
