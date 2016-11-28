package com.ddas.sns.userlikesb.control;

import com.ddas.common.result.Result;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.constants.Constants;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.userlikesb.service.UserLikeSbService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:	UserLikeSbController
 * Function: 	用户关注Controller
 *
 * @author shaojx
 * @date 2016/11/12 22:59
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/like")
public class UserLikeSbController extends BaseController {
    @Resource
    private UserLikeSbService userLikeSbService;

    @RequestMapping("/findIfIloveList")
    @ResponseBody
    public Map<String, Object> findIfIloveList(String lovedIdList, HttpServletRequest request) {
        UserInfo loginUser = getLoginUser(request);
        String currentUserId = loginUser == null ? null : loginUser.getMembGagaid();
        return userLikeSbService.findIfIloveList(lovedIdList, currentUserId);
        /**
         *
         * @param lovedIdList
         * @param request
         *@return java.util.Map<java.lang.String,java.lang.Object>
         *@author shaojx
         *@date 2016/11/13 0:04
         *@version 1.0
         *@since 1.6
         */
    }

    /**
     * 用户关注某人
     *
     * @param mid     somebody id
     * @param request 当前请求
     * @return com.ddas.common.result.Result
     * @author shaojx
     * @date 2016/11/13 0:16
     * @version 1.0
     * @since 1.6
     */
    @RequestMapping("/iliketoonly")
    @ResponseBody
    public Result likeToOnly(String mid, String flag, HttpServletRequest request) {
        UserInfo loginUser = getLoginUser(request);
        String currentUserId = loginUser == null ? null : loginUser.getMembGagaid();
        Result result = new Result();
        if (currentUserId == null) {
            result.setSuccess(true);
            result.setMsg(Constants.SUCCESS);
        } else {
            if(flag==null||flag.trim().length()<=0){//insert data
                boolean iliketoonly = userLikeSbService.iliketoonly(mid, currentUserId);
                result.setSuccess(iliketoonly);
                if(iliketoonly){
                    result.setMsg(Constants.SUCCESS);
                }else{
                    result.setMsg(Constants.FAILED);
                }
            }else{//delete data
                boolean deleteILiked=userLikeSbService.deleteILiked(mid,currentUserId);
                result.setSuccess(deleteILiked);
                if(deleteILiked){
                    result.setMsg(Constants.SUCCESS);
                }else{
                    result.setMsg(Constants.FAILED);
                }
            }
        }
        return result;
    }
}
