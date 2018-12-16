package com.beeyt.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.beeyt.service.IQueryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/register")
public class RegisterAction {
	@Autowired
	public IQueryService queryService;
	Gson gson = new GsonBuilder().serializeNulls().create();

	@RequestMapping(value = "/getBank", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String initShowImage() {
		List<Map<String, Object>> list = queryService.getBank();
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("bank", list);
		return gson.toJson(resMap);
	}

	public IQueryService getQueryService() {
		return queryService;
	}

	public void setQueryService(IQueryService queryService) {
		this.queryService = queryService;
	}

}
