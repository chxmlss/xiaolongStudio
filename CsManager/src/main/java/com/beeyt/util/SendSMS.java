package com.beeyt.util;

import java.util.Random;
import com.alibaba.fastjson.JSONObject;
import com.zhenzi.sms.ZhenziSmsClient;

/**
 * 获取验证码
 */
public class SendSMS{
	//短信平台相关参数
	private static String apiUrl = "http://sms_developer.zhenzikj.com";
	private static String appId = "100317";
	private static String appSecret = "43e11150-489f-4a72-b780-53a60d5c19d0";
	/**
	 * 短信平台使用的是榛子云短信(smsow.zhenzikj.com)
	 */
    public static String SendSms(String telephone) throws Exception {
    	String mobile =telephone;
    	JSONObject json = null;
		//生成6位验证码
		String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
		System.out.println("verifyCode="+verifyCode);
		ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
		String result = client.send(mobile, "您的验证码为:" + verifyCode + "，该码有效期为5分钟，该码只能使用一次!");
		System.out.println(result);
		json = JSONObject.parseObject(result);
		if(json.getIntValue("code") != 0){//发送短信失败
			throw new Exception("短信平台返回:"+json.toJSONString());
		}
    	return verifyCode;
    }

}
