package com.ddas.sns.blogcomment.control;

import com.ddas.common.Msg;
import com.ddas.common.page.Page;
import com.ddas.sns.blogcomment.service.BlogCommentService;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userblog.service.UserBlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:	BlogCommentController
 * Function: 	日志评论Controller
 *
 * @author shaojx
 * @date 2016/7/10 13:31
 * @since JDK 1.6
 */
@Controller
@RequestMapping("/blogComment")
public class BlogCommentController extends BaseController {

    private static  final Logger LOGGER= LoggerFactory.getLogger(BlogCommentController.class);
    @Resource
    private BlogCommentService blogCommentService;

    @Resource
    private UserBlogService userBlogService;


    /**
     *保存朋友日志评论信息
     * @param blogId 日志id
     * @param comment 评论内容
     *@return com.ddas.common.Msg
     *@author shaojx
     *@date 2016/7/10 13:53
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/saveFriendComment")
    @ResponseBody
    public Msg saveFriendComment(String blogId, String comment) {
        boolean saveResult=blogCommentService.saveFriendComment(blogId,comment,getLoginUserAutoBySpringMVC());
        Msg msg=new Msg();
        if(saveResult){
            msg.setSuccessful(true);
            msg.setMsg("success");
        }else{
            msg.setSuccessful(false);
            msg.setMsg(getMsgByKeyViaLocal("saveBlogComment.error"));
        }
        return msg;
    }


    /**
     *根据blogId来获取相应的评论总数n
     * @param blogId
     *@return com.ddas.common.Msg
     *@author shaojx
     *@date 2016/7/10 15:05
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/fetchCommentCountById")
    @ResponseBody
    public Msg fetchCommentCountById(String blogId){
        int count=blogCommentService.fetchCommentCountById(blogId);
        Msg msg=new Msg();
        msg.setSuccessful(true);
        msg.setMsg(count+"");
        return msg;
    }

    /**
     * 分页获取日志评论的内容
     * @param currentPage 当前页
     * @param pageSize 每页的数目
     * @param blogId 评论的日志id
     * @return
     */
    @RequestMapping("/fetchAllCommentByPage")
    @ResponseBody
    public Page fetchAllCommentByPage(int currentPage,int pageSize,String blogId){
        return blogCommentService.fetchAllCommentByPage(currentPage,pageSize,blogId);
    }

    /**
     * 跳转到日志评论详情页
     * @param blogId
     * @return
     */
    @RequestMapping("/gotoCommentDetail")
    public ModelAndView gotoCommentDetail(String blogId, HttpServletRequest request){
        if(blogId!=null&&!"".equals(blogId)){
            ModelAndView modelAndView=withLocal(request,"blogcomment/blogCommentDetail");
            modelAndView.addObject("blogId",blogId);
            modelAndView.addObject("blog",userBlogService.findById(blogId));
            return  modelAndView;
        }else{
            LOGGER.error("blogId is empty!", new IllegalArgumentException());
            return null;
        }
    }
}
