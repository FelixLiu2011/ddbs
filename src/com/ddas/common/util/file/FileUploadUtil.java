package com.ddas.common.util.file;


import com.ddas.common.util.string.StringUtil;
import com.ddas.common.util.uuid.UUIDUtil;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URISyntaxException;
import java.util.Date;

/**
 * 文件上传工具类
 *
 * @author ray
 */
public class FileUploadUtil {
    /**
     * 文件上传 文件名可以为空
     *
     * @param file     文件对象
     * @param fileName 文件名
     * @param fileType 文件类型
     * @param fileUrl  文件存放路径
     * @return
     * @throws URISyntaxException
     * @throws IOException
     */
    public static String uploadFile(File file, String fileName, String fileType, String fileUrl) throws URISyntaxException, IOException {
        //文件上传存放路径
        String fileUploadRoot = "";
        //如果文件存在就把文件上传到目录
        if (file != null && StringUtil.isNotNull(fileUrl)) {
            String rootUrl = "";
            String newFileUrl = FileUploadUtil.class.getResource("/").toURI().getPath();
            File newFile = new File(newFileUrl.substring(0, newFileUrl.length() - 16) + fileUrl);
            if (!newFile.exists()) {
                newFile.mkdirs();
            }
            rootUrl = newFile.getPath();
            //获得文件流
            InputStream inFile = new FileInputStream(file);
            //普通做法获取文件类型
            fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            fileName = "/" + UUIDUtil.createUUID(16) + fileType;
            //文件输出
            OutputStream outFile = new FileOutputStream(new File(rootUrl + fileName));
            //文件保存路径
            fileUploadRoot = fileUrl + fileName;
            int count = 0;
            byte[] buffer = new byte[1024];
            while ((count = inFile.read(buffer)) > 0) {
                outFile.write(buffer, 0, count);
            }
            //关闭流
            outFile.close();
            inFile.close();

        }
        return fileUploadRoot;
    }

    public static String uploadFile(InputStream inputStream, String fileName, String fileUrl) throws IOException, URISyntaxException {
        if (inputStream == null || fileUrl == null || fileName == null) {
            throw new IllegalArgumentException("输入的参数不正确!");
        }
        //文件上传存放路径
        String fileUploadRoot;
        //如果文件存在就把文件上传到目录
        String rootUrl;
        String newFileUrl = FileUploadUtil.class.getResource("/").toURI().getPath();
        File newFile = new File(newFileUrl.substring(0, newFileUrl.length() - 16) + fileUrl);
        if (!newFile.exists()) {
            boolean mkdirs = newFile.mkdirs();
            if(!mkdirs){
                throw new IllegalStateException("创建文件夹出错!");
            }
        }
        rootUrl = newFile.getPath();
        //普通做法获取文件类型
        String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        fileName = "/" + UUIDUtil.createUUID(16) + fileType;
        //文件输出
        OutputStream outFile = new FileOutputStream(new File(rootUrl + fileName));
        //文件保存路径
        fileUploadRoot = fileUrl + fileName;
        int count;
        byte[] buffer = new byte[1024];
        while ((count = inputStream.read(buffer)) > 0) {
            outFile.write(buffer, 0, count);
        }
        //关闭流
        outFile.close();
        inputStream.close();
        return fileUploadRoot;
    }

    /**
     * 删除文件
     *
     * @param imageUrl 文件路径
     * @throws Exception
     */
    public static void deleteFile(String imageUrl) throws Exception {
        //获取文件路径
        String newFileUrl = FileUploadUtil.class.getResource("/").toURI().getPath();
        File newFile = new File(newFileUrl.substring(0, newFileUrl.length() - 16) + imageUrl);
        //文件存在就删除
        if (newFile.exists()) {
            newFile.delete();
        }
    }

    /**
     * @param tile    图片
     * @param fileUrl 图片路径
     * @return 返回图标路径
     */
    public static String uploadImg(BufferedImage tile, String fileUrl) {
        String name = "t" + new Date().getTime() + ".png";
        try {
            String newFileUrl = FileUploadUtil.class.getResource("/").toURI().getPath();
            OutputStream os1 = new FileOutputStream(new File(newFileUrl.substring(0, newFileUrl.length() - 16) + fileUrl + "/" + name));
            ImageIO.write(tile, "png", os1);
            os1.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileUrl + "/" + name;
    }
}
