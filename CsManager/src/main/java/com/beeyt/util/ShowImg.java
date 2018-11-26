package com.beeyt.util;

import java.io.File;
import java.io.IOException;

public class ShowImg {
    public static void main(String[] args) {
    	String path = ShowImg.class.getClassLoader().getResource("").toString();
    	System.out.println(path);
    	File file = new File(path+"showImg/showImg.html");
    	if(!file.exists()) {
    		try {
				file.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    }
}
