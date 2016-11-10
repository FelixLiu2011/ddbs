package com.ddas.common.result;

import com.ddas.common.page.Page;

import java.util.List;

/**
 * ClassName:	Attachment
 * Function: 	一些附带的属性值
 * @author shaojx
 * @date 2016/11/10 22:27
 * @since JDK 1.6
 */
public class Attachment {
    private List<?> data;
    private Page page;

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
}
