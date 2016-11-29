package com.ddas.sns.ihome.control;

import com.ddas.common.result.Result;
import com.ddas.sns.ihome.service.IHomeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * ClassName:	IHomeController
 * Function: 	`偶遇`首页的Controller
 *
 * @author shaojx
 * @date 2016/11/10 22:19
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/ihome")
public class IHomeController {
    @Resource
    private IHomeService iHomeService;

    /**
     * 获取`偶遇`页面中的用户数据
     * @param pageNo 当前的页码
     * @param pageSize 当前页的数据量
     * @param quickSearchType 1.全部 2.推荐 3.在线 4.最新
     * @param searchType  1.精确,2.模糊,3.类型
     * @return
     */
    @RequestMapping("/getTypeData")
    @ResponseBody
    public Result getTypeData(@RequestParam(value = "pageNo") int pageNo,@RequestParam("pageSize") int pageSize,
                              @RequestParam("quickSearchType") String quickSearchType,@RequestParam("searchType") String searchType){
        Result typeData = iHomeService.getTypeData(pageNo, pageSize, quickSearchType, searchType);
        return typeData;
    }


    /**
     *根据查询条件获取的查询数据
     * @param country 查询国家
     * @param sex 查询的性别
     * @param ageRange 年龄范围
     * @param language 语言
     * @param heightRange 高度范围
     * @param weightRange 体重范围
     * @param jobId 职业
     * @param pageNo 当前页码
     * @param pageSize 每页的数据量
     * @param searchType  1.精确,2.模糊,3.类型
     *@return com.ddas.common.result.Result
     *@author shaojx
     *@date 2016/11/29 23:24
     *@version 1.0
     *@since 1.6
     */
    public Result getSelectionsData(String country,String sex,String ageRange,String language,String heightRange,String weightRange,String jobId,String pageNo,String pageSize,String searchType){
        // FIXME: 2016/11/29 
        return null;
    }

    /**
     *模糊查询数据
     * @param keywords 搜索关键字
     * @param pageNo 查询的页码
     * @param pageSize 每页的数据量
     * @param quickSearchType   1.全部 2.推荐 3.在线 4.最新
     * @param searchType 1.精确,2.模糊,3.类型
     *@return com.ddas.common.result.Result 返回查询的数据
     *@author shaojx
     *@date 2016/11/29 23:30
     *@version 1.0
     *@since 1.6
     */
    public Result getDatas(String keywords,String pageNo,String pageSize,String quickSearchType,String searchType){
        // FIXME: 2016/11/29 
        return null;
    }
}
