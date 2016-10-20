package com.ddas.common.action;


import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.List;

public class BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected List<?> dataList;//数据集合

	private ServletRequest request;
	private ServletResponse response;
	
	protected final static String JSON_RESULT="json";
	protected final static String DATA_LIST="dataList";

    public List<?> getDataList() {
        return dataList;
    }

    public void setDataList(List<?> dataList) {
        this.dataList = dataList;
    }
}
