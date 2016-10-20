package com.ddas.common.util;


import com.google.gson.Gson;

public class JsonUtil {
	private static Gson gson=new Gson();
	public static synchronized String toJson(Object object){
		return gson.toJson(object);
	}

}
