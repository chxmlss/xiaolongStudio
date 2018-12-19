package com.beeyt.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.beeyt.service.IQueryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/charts")
public class ChartsAction {
	@Autowired
	public IQueryService queryService;
	Gson gson = new GsonBuilder().serializeNulls().create();
	
	/**
	 * The method aim to show all line charts by checking showType. 
	 * eg.showType = countRegister.This means to show charts about num of register.
	 * @param showType eg.showType
	 * @return jsonArry include xAxis and Data.
	 */
	@RequestMapping(value = "/getLineCharts", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getLineChartsAll(@RequestParam(value = "showType", required = true) String showType) {
		List<Map<String, Object>> list = null;
		List<String> xAxisList= new ArrayList<String>();
		List<String> dataList = new ArrayList<String>();
		JSONObject json = new JSONObject();
		
		if("countRegister".equals(showType)){
			list = queryService.getLineChartsAll();
			if(list != null) {
				for(Map<String,Object> map :list) {
					xAxisList.add(map.get("date").toString());
					dataList.add(map.get("num").toString());
				}
			}
		}
		
		json.put("xAxisData", xAxisList);
		json.put("showData", dataList);
		
		return json.toJSONString();
	}
}
