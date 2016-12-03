package com.ddas.sns.privateletter.control;

import com.ddas.common.action.BaseAction;
import com.ddas.common.result.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/getContacts")
    public Result getContacts(){
        return null;
    }
}
