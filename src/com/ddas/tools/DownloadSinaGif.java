package com.ddas.tools;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.IOUtils;

import java.io.*;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * ClassName:	DownloadSinaGif
 * Function: 	todo
 *
 * @author shaojx
 * @date 2016/9/10 23:18
 * @since JDK 1.6
 */
public class DownloadSinaGif {
    private static final AtomicInteger integer = new AtomicInteger(0);

    public static void main(String[] args) throws Exception {
        Gson gson = new Gson();
        BufferedReader bufferedReader = new BufferedReader(
                new InputStreamReader(DownloadSinaGif.class.getClassLoader().getResourceAsStream("emotions.json"), "UTF-8"));
        Object object = gson.fromJson(bufferedReader, new TypeToken<Map<String, Object>>() {
        }.getRawType());
        List<Map<String, Object>> data = (List) ((Map) object).get("data");
        System.out.println("total:"+data.size());
        for (Map<String, Object> map : data) {
            String phrase = map.get("phrase").toString();
            String type = map.get("type").toString();
            String url = map.get("url").toString();
            boolean hot = (Boolean) map.get("hot");
            Boolean common = (Boolean) map.get("common");
            String category = map.get("category").toString();
            String icon = map.get("icon").toString();
            String value = map.get("value").toString();
            String picid = map.get("picid").toString();
           int i = url.lastIndexOf("/");
            if (i != -1) {
                try {
                    downloadPic2Local(url, url.substring(i + 1));
                } catch (ConnectException exception) {
                    System.out.println(exception.getMessage());
                    System.err.println("Lin 48:" + url);
                }
            }
            int indexOf = icon.lastIndexOf("/");
            if (indexOf != -1) {
                try {
                    downloadPic2Local(icon, icon.substring(indexOf + 1));
                } catch (ConnectException e) {
                    System.err.println("Line 56:" + icon);
                }
            }
        }
        System.out.println("download total icons:" + integer.get());
    }

    private static void downloadPic2Local(String urlStr, String shortIconName) throws Exception {
        File pngFile = new File("d:\\icons\\" + shortIconName);
        if (pngFile.exists()) {
            return;
        }
       URL url = new URL(urlStr);
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
        urlConnection.setRequestMethod("GET");
        urlConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.154 Safari/537.36 LBBROWSER");
        urlConnection.setDoInput(true);
        urlConnection.setConnectTimeout(1000 * 60 * 10);//10 minutes
        urlConnection.setReadTimeout(1000 * 60 * 10);//10 minutes
        urlConnection.connect();
        InputStream inputStream = urlConnection.getInputStream();
        File dir = new File("d:\\icons\\");
        if (!dir.exists()) {
            boolean mkdirs = dir.mkdirs();
            if (!mkdirs) {
                throw new RuntimeException("mk dir failed");
            }
        }
        System.out.println("now downloading :" + shortIconName);
        FileOutputStream fileOutputStream = new FileOutputStream(pngFile);
        int copy = IOUtils.copy(inputStream, fileOutputStream);
        IOUtils.close(urlConnection);
        IOUtils.closeQuietly(fileOutputStream);
        integer.addAndGet(1);
    }
}
