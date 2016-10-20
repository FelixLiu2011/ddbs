package com.ddas.sns.mylog.control;

import com.ddas.common.page.Page;
import com.ddas.sns.mylog.service.MyLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * ClassName:	MyLogController
 * Function: 	我的日志Controller
 *
 * @author shaojx
 * @date 2016/6/29 23:01
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/myLog")
public class MyLogController {
    @Resource
    private MyLogService myLogService;

    @RequestMapping("/queryRecodsByPage")
    @ResponseBody
    public Page queryRecordsByPage(@RequestParam int currentPage, @RequestParam int pageSize){
        return myLogService.queryRecodsByPage(currentPage,pageSize);
    }
}
