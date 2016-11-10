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
@Controller("/ihome")
public class IHomeController {
    @Resource
    private IHomeService iHomeService;

    /**
     * 获取`偶遇`页面中的用户数据
     * @param pageNo 当前的页码
     * @param pageSize 当前页的数据量
     * @param quickSearchType ?
     * @param searchType ?
     * @return
     */
    @RequestMapping(value = "/getTypeData",method = RequestMethod.POST)
    @ResponseBody
    public Result getTypeData(@RequestParam(value = "pageNo") int pageNo,@RequestParam("pageSize") int pageSize,
                              @RequestParam("quickSearchType") String quickSearchType,@RequestParam("searchType") String searchType){
        Result typeData = iHomeService.getTypeData(pageNo, pageSize, quickSearchType, searchType);
        return typeData;
    }
}
