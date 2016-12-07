package com.ddas.sns.privateletter.control;

import com.ddas.common.action.BaseAction;
import com.ddas.common.result.Result;
import com.ddas.sns.privateletter.service.PrivateLetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	PrivateLetterController
 * Function:    私信Controller
 *
 * @author shaojx
 * @date 2016/12/1 23:05
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/pm")
public class PrivateLetterController extends BaseAction {
    @Autowired
    private PrivateLetterService privateLetterService;

    @RequestMapping("/getContacts")
    @ResponseBody
    public Result getContacts(HttpServletRequest request){

        return null;
    }
}
