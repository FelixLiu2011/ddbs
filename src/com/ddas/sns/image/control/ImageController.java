package com.ddas.sns.image.control;

import com.ddas.common.result.Attachment;
import com.ddas.common.result.Result;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.constants.Constants;
import com.ddas.sns.userinfo.domain.UserInfo;
import com.ddas.sns.util.QinNiuAuthUtil;
import com.qiniu.util.StringMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/03 0003.
 */
@Controller
@RequestMapping("/Image")
public class ImageController extends BaseController {
    private final String accessKey = "ve7WLsyJZJeG8kJe68Twif9Yxib4pZDV5wCJJjuj";
    private final String SecretKey = "Hny6e9-k4GGZd4xsF6JXFPtAl9xNW4L_SfHW0ELV";
    private final String bucketKey = "felix-bucket";

    /**
     *
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/uploadInit")
    @ResponseBody
    public Result uploadInit(HttpServletRequest request, String type, Integer imgNum) {
        Result result = new Result();
        result.setSuccess(false);
        List<String> imgList = new ArrayList<String>();
        Attachment attachment = new Attachment();

        StringMap map = new StringMap();
        String returnUrl = "http://localhost:8080/Image/callback";
        //map.put("returnUrl", returnUrl);
        if (StringUtil.isNotEmpty(type) && imgNum != null && imgNum > 0) {
            for (int i = 0; i < imgNum; i++) {
                String imageName = UUIDUtil.createUUID16();
                String key = type + "_" + imageName;
                imgList.add(key);
                //String returnBody = "haha";
            }
        }

        String uploadToken = QinNiuAuthUtil.create(accessKey, SecretKey).uploadToken(bucketKey, null, 1451491200, map);
        Map objMap = new HashMap<String, List<String>>();
        objMap.put("img", imgList);
        objMap.put("upToken", uploadToken);
        result.setObj(objMap);
        result.setSuccess(true);
        result.setMsg(Constants.SUCCESS);
        return result;
    }

    /**
     *
     * @param request
     *@return org.springframework.web.servlet.ModelAndView
     *@author shaojx
     *@date 2016/7/9 21:23
     *@version 1.0
     *@since 1.6
     */
    @RequestMapping("/callback")
    public ModelAndView callback(HttpServletRequest request){
        ModelAndView modelAndView= withLocal(request,"member/test");
        return modelAndView;
    }

}
