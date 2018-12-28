package com.beeyt.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;


public class ReadHTMLTemplate {
	
    public static String getTemplateString(){
    	InputStream is = ReadHTMLTemplate.class.getResourceAsStream("/template.html");
	    InputStreamReader reader = null;
	    BufferedReader br = null;
	    String contextStr = "";
	    try{
	    	reader = new InputStreamReader(is,"UTF-8");
	    	br = new BufferedReader(reader);
	    	String end = null;
	 	    while((end=br.readLine())!=null){
	 	    	contextStr += end+"\n";
	 	    }
	    } catch(UnsupportedEncodingException e){
	    	e.printStackTrace();
	    } catch(IOException e){
	    	e.printStackTrace();
	    } catch(Exception e){
	    	e.printStackTrace();
	    }finally{
    		try {
    			if(br !=null){
				    br.close();
    			}
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
	    
	    return contextStr;
    }
    
    public static void main(String agrs[]){
    	String str = getTemplateString();
    	System.out.println(str);
    }
}
