package com.beeyt.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.alibaba.fastjson.JSONObject;
import com.beeyt.service.IQueryService;
import com.beeyt.util.SendSMS;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/register")
public class RegisterAction {
	@Autowired
	public IQueryService queryService;
	Gson gson = new GsonBuilder().serializeNulls().create();

//	@RequestMapping(value = "/getBank", produces = "text/html;charset=UTF-8")
//	@ResponseBody
//	public String getBank() {
//		List<Map<String, Object>> list = queryService.getBank();
//		Map<String, Object> resMap = new HashMap<String, Object>();
//		resMap.put("bank", list);
//		return gson.toJson(resMap);
//	}

	@RequestMapping(value = "/getRegister", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getRegisterByUser(@RequestParam(value = "userid", required = false) String userid) {
		List<Map<String, Object>> list = queryService.getRegisterByUser(userid);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("register", list);
		return gson.toJson(resMap);
	}

	@RequestMapping(value = "/getRegisterBank", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getRegisterBank() {
		List<Map<String, Object>> list = queryService.getRegisterBank();
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("registerBank", list);
		return gson.toJson(resMap);
	}

	@RequestMapping(value = "/getVerifyCode", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getVerifyCode(@RequestParam(value = "telephone", required = true) String telephone) {
		String verifyCode = "";
		JSONObject json = new JSONObject();
		// TODO:待定 是否屏蔽验证手机号、手机号可以重复使用
//		boolean flag = queryService.checkTelephone(telephone);
		try {
//			if(!flag) {
			verifyCode = SendSMS.SendSms(telephone);
			json.put("status", 1);
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
					.getRequest();

			json.put("mobile", telephone);
			json.put("verifyCode", verifyCode);
			json.put("createTime", System.currentTimeMillis());
			request.getSession().setAttribute("verifyCode", json);
//			}else {
//				json.put("msg", "该手机号存在");
//				json.put("status", 0);
//			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			json.put("msg", "输入手机号有误");
			json.put("error", e.getMessage());
			json.put("status", 3);
		}

		return json.toJSONString();
	}

	@RequestMapping(value = "/saveRegister", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String saveRegister(@RequestParam(value = "real_name", required = true) String name,
			@RequestParam(value = "idNo", required = true) String idcard,
			@RequestParam(value = "mobile", required = false) String telephone,
			@RequestParam(value = "code", required = false) String verifyCode) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
//		JSONObject json = (JSONObject)request.getSession().getAttribute("verifyCode");
		String userid = (String) request.getSession().getAttribute("userid");
		JSONObject jsonMsg = new JSONObject();
//		if(json == null){
//			jsonMsg.put("status", 0);
//			jsonMsg.put("msg", "验证码错误!");
//		}
//		if(!json.getString("mobile").equals(telephone)){
//			jsonMsg.put("status", 0);
//			jsonMsg.put("msg", "手机号错误!");
//		}
//		if(!json.getString("verifyCode").equals(verifyCode)){
//			return "验证码错误!";
//		}
//		if((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60 * 5){//5分钟
//			return "验证码已过期!";
//		}
		try {
			int registerId = queryService.saveRegister(name, idcard, telephone, userid);
			jsonMsg.put("status", 1);
			request.getSession().setAttribute("registerId", registerId);
			return jsonMsg.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			jsonMsg.put("status", 0);
			jsonMsg.put("msg", "网络繁忙");
			return jsonMsg.toJSONString();
		}
	}

	@RequestMapping(value = "/updateRegister", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String updateRegister(@RequestParam(value = "bank", required = true) String bank) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		JSONObject jsonMsg = new JSONObject();
		int registerId = (Integer) request.getSession().getAttribute("registerId");
		try {
			queryService.updateRegister(registerId, bank);
			jsonMsg.put("status", 1);
			return jsonMsg.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			jsonMsg.put("status", 0);
			jsonMsg.put("msg", "网络繁忙");
			return jsonMsg.toJSONString();
		}
	}

	public IQueryService getQueryService() {
		return queryService;
	}

	public void setQueryService(IQueryService queryService) {
		this.queryService = queryService;
	}

}
