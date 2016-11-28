package com.ddas.tools;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

/**
 * ClassName:	DownloadQQFaceFromGaga
 * Function: 	todo
 *
 * @author shaojx
 * @date 2016/11/14 23:00
 * @since JDK 1.6
 */
public class DownloadQQFaceFromGaga {
    private static final  String DOWNLOAD_BASE_URL="http://static.gagahi.com/IM/img/qqFace/${index}.gif";

    public static void main(String[] args) throws  Exception {
        File file=new File("d:\\qqFace");
        file.mkdirs();
        for(int i=0;i<=104;i++){
            URL url=new URL(DOWNLOAD_BASE_URL.replace("${index}",i+""));
            URLConnection urlConnection = url.openConnection();
            urlConnection.setConnectTimeout(10*1000);
            InputStream inputStream = urlConnection.getInputStream();
            FileOutputStream fileOutputStream=new FileOutputStream("D:\\qqFace\\"+i+".gif");
            byte[]bs=new byte[1024];
            int len=0;
            while((len=inputStream.read(bs,0,bs.length))!=-1){
                fileOutputStream.write(bs,0,len);
            }
            fileOutputStream.close();
            inputStream.close();
        }
    }
}
