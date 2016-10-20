package com.ddas.sns.userphoto.control;

import com.ddas.common.Msg;
import com.ddas.common.util.StringUtil;
import com.ddas.common.util.file.FileUploadUtil;
import com.ddas.common.util.springutil.SpringContextUtil;
import com.ddas.common.util.uuid.UUIDUtil;
import com.ddas.sns.common.BaseController;
import com.ddas.sns.userphoto.domain.UserPhoto;
import com.ddas.sns.userphoto.service.UserPhotoService;
import com.jcraft.jsch.Session;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping("/fileUpload")
public class FileUploadController extends BaseController{
    @Resource
    private UserPhotoService userPhotoService;

	@RequestMapping(value="/fileUpload", method= RequestMethod.POST)
    @ResponseBody
	public Map<String,String> upload(@RequestParam MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) throws IOException, URISyntaxException {
		//如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
		//如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解
		//并且上传多个文件时，前台表单中的所有<input type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件
        Map<String,String> map=new HashMap<String,String>();
        String fileName="";
		for(MultipartFile myfile : myfiles){
		 //  fileName=myfile.getOriginalFilename();
			if(myfile.isEmpty()/*||fileName.equals("QQ图片20150803124740.jpg")*/){
                Locale locale= (Locale) request.getSession(true).getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
				//System.out.println("文件未上传");
                map.put("error", SpringContextUtil.getMsgByKey("fileupload.error.isEmpty",locale));
			}else{
				//System.out.println("文件长度: " + myfile.getSize());
				//System.out.println("文件类型: " + myfile.getContentType());
				//System.out.println("文件名称: " + myfile.getName());
				//System.out.println("文件原名: " + myfile.getOriginalFilename());
				//System.out.println("========================================");
                try {
                    fileName=myfile.getOriginalFilename();
                    //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\文件夹中
                    String realPath = request.getServletContext().getRealPath("/upload/");
                    //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的
                    int indexOfDot=myfile.getOriginalFilename().lastIndexOf(".");
                    String fileType="";
                    if(indexOfDot>-1){
                         fileType=fileName.substring(indexOfDot);
                    }
                    String newFileName = UUIDUtil.createUUID16()+fileType;
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, newFileName));

                    String photoGroupId = request.getParameter("photoGroupId");
                    //如果存在PhotoGroup
                    if(StringUtil.isNotEmpty(photoGroupId)) {
                        UserPhoto userPhoto = new UserPhoto();
                        userPhoto.setPhotoUrl("/upload/" + newFileName);
                        userPhoto.setGroupId(photoGroupId);
                        userPhoto.setUserId(getLoginUser(request).getUserId());
                        userPhotoService.save(userPhoto);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    Locale locale= (Locale) request.getSession(true).getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
                    map.put("error",SpringContextUtil.getMsgByKey("fileupload.error",locale));
                }
            }
		}
        return map;
	}
}