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

	@RequestMapping(value = "/getBankInfo", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getBankInfo() {
		List<Map<String, Object>> list = queryService.getBankInfo();
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("banks", list);
		return gson.toJson(resMap);
	}
	
	@RequestMapping(value = "/updateBankURL", produces = "text/html;charset=UTF-8")
	public String updateBankURL(@RequestParam(value = "bank_id", required = true) String bank_id,
			@RequestParam(value = "bank_url", required = true) String bank_url) {
		try {
			queryService.updateBankURL(bank_id,bank_url);
			return "redirect:/views/creditcard.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "redirect:/views/creditcard.jsp";
		}
	}
	
	//银行二维码跳转程序
	//使用链接生成二维码
	//http://iusm.jinmuou.com:8080/CsManager/register/inBankC.do?bank_id=&bank_ab=&user_id=
	@RequestMapping(value = "/inBankC", produces = "text/html;charset=UTF-8")
	public String inBankC(@RequestParam(value = "bank_id", required = true) String bank_id,
			@RequestParam(value = "bank_ab", required = true) String bank_ab,
			@RequestParam(value = "user_id", required = true) String user_id) {
		String URL="";
		try {
			URL=queryService.inBankC(bank_id,bank_ab,user_id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "redirect:"+URL;
	}
	
	
	
	
	@RequestMapping(value = "/updateBankInfo", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String updateBankInfo(@RequestParam(value = "bank_id", required = true) String bank_id,
			@RequestParam(value = "bank_describe", required = false) String bank_describe,
//			@RequestParam(value = "bank_order", required = true) String bank_order,
			@RequestParam(value = "bank_effective", required = false) String bank_effective) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		if(!"".equals(bank_describe)){
			if("0".equals(bank_describe)) {
				bank_describe="高额";
			}else if("1".equals(bank_describe)) {
				bank_describe="秒批";
			}else {
				bank_describe="暂时关闭";
			}
		}
		try {
			queryService.updateBankInfo(bank_id,bank_describe,bank_effective);
			resMap.put("status", 1);
		} catch (Exception e) {
			resMap.put("status", 0);
			resMap.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return gson.toJson(resMap);
	}

	@RequestMapping(value = "/getGroupUserRegister", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getGroupUserRegister(@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "end", required = false) Integer end) {
		int pageSize = 5;
		int totalPage = 10;
		int showPagNum = 5;
		start = start == null ? 1 : start;
		end = end == null ? showPagNum : end;
		limit = limit == null ? pageSize : limit;
		page = page == null ? 1 : page;
		List<Map<String, Object>> list = queryService.getGroupUserRegister(limit, page);
		Integer totalRecord = queryService.getGroupUserRegisterSum();

		Map resMap = new HashMap();
		resMap.put("registerGroupUsers", list);

		Map pageInfo = new HashMap();
		pageInfo.put("limit", limit);
		pageInfo.put("page", page);

		if (totalRecord % pageSize == 0) {
			// 说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
			totalPage = totalRecord / pageSize;
		} else {
			// 不整除，就要在加一页，来显示多余的数据。
			totalPage = totalRecord / pageSize + 1;
		}
		if (totalPage <= end) {
			end = totalPage;
		}
		int[] pageIntalArr = new int[end - start + 1];
		for (int i = start; i <= end; i++) {
			pageIntalArr[i - start] = i;
		}
		pageInfo.put("pageIntal", pageIntalArr);
		pageInfo.put("totalPage", totalPage);
		pageInfo.put("start", start);
		pageInfo.put("end", end);

		resMap.put("pages", pageInfo);
		String json = gson.toJson(resMap);
		return json;
	}

	@RequestMapping(value = "/getRegister", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getRegisterByUser(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "end", required = false) Integer end) {
		int pageSize = 5;
		int totalPage = 10;
		int showPagNum = 5;
		start = start == null ? 1 : start;
		end = end == null ? showPagNum : end;
		limit = limit == null ? pageSize : limit;
		page = page == null ? 1 : page;
		List<Map<String, Object>> list = queryService.getRegisterByUser(userid,limit,page);
		Integer totalRecord = queryService.getRegisterByUserSum(userid);

		Map resMap = new HashMap();
		resMap.put("registers", list);

		Map pageInfo = new HashMap();
		pageInfo.put("limit", limit);
		pageInfo.put("page", page);

		if (totalRecord % pageSize == 0) {
			// 说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
			totalPage = totalRecord / pageSize;
		} else {
			// 不整除，就要在加一页，来显示多余的数据。
			totalPage = totalRecord / pageSize + 1;
		}
		if (totalPage <= end) {
			end = totalPage;
		}
		int[] pageIntalArr = new int[end - start + 1];
		for (int i = start; i <= end; i++) {
			pageIntalArr[i - start] = i;
		}
		pageInfo.put("pageIntal", pageIntalArr);
		pageInfo.put("totalPage", totalPage);
		pageInfo.put("start", start);
		pageInfo.put("end", end);

		resMap.put("pages", pageInfo);
		String json = gson.toJson(resMap);
		return json;
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

	@RequestMapping(value = "/successBank", produces = "text/html;charset=UTF-8")
	public String successBank() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		String userid = request.getSession().getAttribute("userid") != null
				? request.getSession().getAttribute("userid").toString()
				: "";
		if (!"".equals(userid)) {
			return "successBank";
		}
		return "userRegister";
	}

	public IQueryService getQueryService() {
		return queryService;
	}

	public void setQueryService(IQueryService queryService) {
		this.queryService = queryService;
	}

}
