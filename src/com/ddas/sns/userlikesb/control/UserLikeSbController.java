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
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
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

    /*Session中存放的当前用户关注的用户列表(游客使用)*/
    private static final String liketoonlyAttribute = "liketoonly";
    @Resource
    private UserLikeSbService userLikeSbService;

    /**
     * @param lovedIdList
     * @param request
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author shaojx
     * @date 2016/11/13 0:04
     * @version 1.0
     * @since 1.6
     */
    @RequestMapping("/findIfIloveList")
    @ResponseBody
    public Map<String, Object> findIfIloveList(String lovedIdList, HttpServletRequest request) {
        UserInfo loginUser = getLoginUser(request);
        String currentUserId = loginUser == null ? null : loginUser.getMembGagaid();
        if (loginUser == null) {
            List<String> listInSession = (List<String>) request.getSession().getAttribute(liketoonlyAttribute);
            return userLikeSbService.findIfIloveListFromSession(lovedIdList, listInSession);
        }
        return userLikeSbService.findIfIloveList(lovedIdList, currentUserId);
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
        if (currentUserId == null) {//游客，信息放入相应的session中
            result.setSuccess(true);
            result.setMsg(Constants.SUCCESS);
            if (flag != null && "del".equals(flag)) {//游客取消关注某人
                HttpSession session = request.getSession();
                Object liketoonly = session.getAttribute(liketoonlyAttribute);
                if (liketoonly == null) {
                } else {//从Session中移除相应的关注信息
                    List<String> likeList = (List<String>) liketoonly;
                    likeList.remove(mid);
                }
            } else {//游客关注某人
                HttpSession session = request.getSession();
                Object liketoonly = session.getAttribute(liketoonlyAttribute);
                if (liketoonly == null) {
                    List<String> likeList = new ArrayList<String>();
                    likeList.add(mid);
                    session.setAttribute(liketoonlyAttribute, likeList);
                } else {
                    List<String> likeList = (List<String>) liketoonly;
                    likeList.add(mid);
                }
            }
        } else {
            if (flag == null || flag.trim().length() <= 0) {//insert data
                boolean iliketoonly = userLikeSbService.iliketoonly(mid, currentUserId);
                result.setSuccess(iliketoonly);
                if (iliketoonly) {
                    result.setMsg(Constants.SUCCESS);
                } else {
                    result.setMsg(Constants.FAILED);
                }
            } else {//delete data
                boolean deleteILiked = userLikeSbService.deleteILiked(mid, currentUserId);
                result.setSuccess(deleteILiked);
                if (deleteILiked) {
                    result.setMsg(Constants.SUCCESS);
                } else {
                    result.setMsg(Constants.FAILED);
                }
            }
        }
        return result;
    }
}
