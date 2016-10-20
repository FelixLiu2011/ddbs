package com.ddas.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.net.*;
import java.util.ArrayList;
import java.util.List;

public class NetWorkUtil {
	public static String  telnet(String ip,int port){
		try {
			Socket socket=new Socket();
		//	socket.setSoTimeout(2000);
			socket.connect(new InetSocketAddress(ip, port),2000);
			socket.close();
			return "t";
		} catch (SocketException e) {
			//e.printStackTrace();
		} catch (IOException e) {
			//e.printStackTrace();
		}
		return "e";
	}
	
	public static String ping(String ip){
		try {
			InetAddress address=InetAddress.getByName(ip);
			address.isReachable(2000);
			return "p";
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "e";
	}
	public static void main(String[] args) {
		List<String> list=new ArrayList<String>();
		String ip="10.137.248.131";
		
		for(int i=7000;i<=65535;i++){
			//System.out.println("褰撳墠鍒ゆ柇:"+i);
			if("t".equals(NetWorkUtil.telnet(ip,i))){
				list.add(i+"");
			}
			if((i-7000)%10==0){
				System.out.println("褰撳墠鎵ц鍒扮鍙�"+i);
			}
		}
		try {
			System.setOut(new PrintStream(new File("telnet.txt")));
			System.out.println("鎵�湁鐨勭鍙�"+list);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
