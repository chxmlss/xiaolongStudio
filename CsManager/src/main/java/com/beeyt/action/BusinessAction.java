package com.beeyt.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beeyt.service.IQueryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/business")
public class BusinessAction {
	@Autowired
	public IQueryService queryService;
	Gson gson = new GsonBuilder().serializeNulls().create();
	
	@RequestMapping(value="/getUserRegisterUrl", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUserRegiserUrl() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		String userid= session.getAttribute("userid")!=null?session.getAttribute("userid").toString():"";
		//request.setAttribute("url", "http://iusm.jinmuou.com:8080/CsManager/login/userRegiser.do?userid="+userid);
		Map resMap=new HashMap();
		resMap.put("url", "http://iusm.jinmuou.com:8080/CsManager/login/userRegiser.do?userid="+userid);
		String json = gson.toJson(resMap);
		return json;
	}

	/**
	 * 修改密码
	 * 
	 * @param username
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@RequestMapping(value="/changePwd", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String changePassWord(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "oldPwd", required = true) String oldPwd,
			@RequestParam(value = "newPwd", required = true) String newPwd) {
		boolean changed = queryService.changePwd(username, oldPwd, newPwd);
		Map resMap=new HashMap();
		if (changed) {
			resMap.put("msg", "修改成功");
		}else {
			resMap.put("msg", "修改失败");
		}
		
		String json = gson.toJson(resMap);
		return json;
	}

	/**
	 * 获取用户列表
	 * 
	 * @param name
	 *            姓名
	 * @param group
	 *            分组
	 * @param limit
	 *            每页显示数量
	 * @param page
	 *            页码
	 * @return
	 */
	@RequestMapping(value = "/getUsersInfo", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getUsersInfo(@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "group", required = false) String group,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "end", required = false) Integer end,
			@RequestParam(value = "forGroup", required = false) String forGroup) {
		int pageSize = 5;
		int totalPage = 10;
		int showPagNum = 5;
		start = start==null?1:start;
		end = end==null?showPagNum:end;
		limit = limit==null?pageSize:limit;
		page = page==null?1:page;	
		List<Map<String, Object>> list = queryService.queryUsers(name, group, limit, page,forGroup);
		Integer totalRecord = queryService.queryUsersSum(name, group);
		Map resMap = new HashMap();
		resMap.put("users", list);
		
		Map pageInfo=new HashMap();
		pageInfo.put("limit", limit);
		pageInfo.put("page", page);
		
	    if(totalRecord%pageSize==0){
            //说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
            totalPage = totalRecord / pageSize;
        }else{
            //不整除，就要在加一页，来显示多余的数据。
            totalPage = totalRecord / pageSize +1;
        }
	    if(totalPage<=end) {
	    	end = totalPage;
	    }
		int[] pageIntalArr = new int[end-start+1];
		for(int i=start;i<=end;i++) {
			pageIntalArr[i-start]= i;
		}
		pageInfo.put("pageIntal",pageIntalArr);
		pageInfo.put("totalPage", totalPage);
		pageInfo.put("start", start);
		pageInfo.put("end", end);
		
		resMap.put("pages", pageInfo);
		
		String json = gson.toJson(resMap);
		return json;
	}

	/**
	 * 添加用户
	 * 
	 * @param name
	 * @param sex
	 * @param addr
	 * @param username
	 * @param password
	 * @param remarks
	 * @return
	 */
	@RequestMapping(value = "/addUser", produces = "text/html;charset=UTF-8")
	public String addUser(@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "sex", required = false) String sex,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "remarks", required = false) String remarks) {
		sex = "0".equals(sex)?"男":"女";
		return queryService.addUser(name, sex, tel, username, password, remarks);
	}

	/**
	 * 删除用户
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/delUser", produces = "text/html;charset=UTF-8")
	public String delUser(@RequestParam(value = "username", required = false) String username) {
		try {
			queryService.delUser(username);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		return "redirect:/business/getUsersInfo.do";
	}

	/**
	 * 新建分组 相当于设置组长， s_group表 group_name可以和s_user表name 俩个名字可相等
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/addGroup", produces = "text/html;charset=UTF-8")
	public String addGroup(@RequestParam(value = "groupname", required = true) String groupname,
			@RequestParam(value = "username", required = true) String username) {
		try {
			queryService.addGroup(groupname, username);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		return "redirect:/business/getGroupsInfo.do";
	}

	/**
	 * 删除分组 先修改s_user表的isgroup=0 删除s_group_user 删除s_group
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/delGroup", produces = "text/html;charset=UTF-8")
	public String delGroup(@RequestParam(value = "groupid", required = true) String groupid) {
		try {
			queryService.delGroup(groupid);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		return "redirect:/business/getGroupsInfo.do";
	}

	/**
	 * 查询分组 可以全查、可按条件查询
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/getGroupsInfo", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getGroupsInfo(@RequestParam(value = "groupname", required = false) String groupname,@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "start", required = false) Integer start,
			@RequestParam(value = "end", required = false) Integer end) {
		int pageSize = 5;
		int totalPage = 10;
		int showPagNum = 5;
		start = start==null?1:start;
		end = end==null?showPagNum:end;
		limit = limit==null?pageSize:limit;
		page = page==null?1:page;	
		List<Map<String, Object>> list = queryService.querGroups(groupname,limit,page);
		Integer totalRecord = queryService.queryGroupsSum(groupname);
		
		Map resMap = new HashMap();
		resMap.put("groups", list);
		
		Map pageInfo=new HashMap();
		pageInfo.put("limit", limit);
		pageInfo.put("page", page);
		
	    if(totalRecord%pageSize==0){
            //说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
            totalPage = totalRecord / pageSize;
        }else{
            //不整除，就要在加一页，来显示多余的数据。
            totalPage = totalRecord / pageSize +1;
        }
	    if(totalPage<=end) {
	    	end = totalPage;
	    }
		int[] pageIntalArr = new int[end-start+1];
		for(int i=start;i<=end;i++) {
			pageIntalArr[i-start]= i;
		}
		pageInfo.put("pageIntal",pageIntalArr);
		pageInfo.put("totalPage", totalPage);
		pageInfo.put("start", start);
		pageInfo.put("end", end);
		
		resMap.put("pages", pageInfo);
		String json = gson.toJson(resMap);
		return json;
	}
	
	@RequestMapping(value = "/checkUsername", produces = "text/html;charset=UTF-8")
	@ResponseBody
    public String checkUsername(@RequestParam(value = "username", required = true) String username) {
    	List list = queryService.checkUsername(username);
    	Map resMap=new HashMap();
    	
    	if(list.size()>0) {
    		resMap.put("msg", "此账号已经存在！");
    	}else {
    		resMap.put("msg", "可以注册");
    	}
    	String json = gson.toJson(resMap);
		return json;
    }
	/**
	 * 给单个用户分组
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/userToGroup", produces = "text/html;charset=UTF-8")
	public String userToGroup(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "groupid", required = true) String groupid) {
		try {
			queryService.userToGroup(username, groupid);
		} catch (Exception e) {
			if("grouped".equals(e.getMessage())){
				return "grouped";
			}
			e.printStackTrace();
			return "failed";
		}
		return "redirect:/business/getGroupsInfo.do";
	}
	
	/**
	 * 删除用户分组
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/userDelGroup", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String userDelGroup(@RequestParam(value = "username", required = true) String username,@RequestParam(value = "groupname", required = true) String groupname,RedirectAttributes attribute) {
		try {
			queryService.userDelGroup(username);
			attribute.addFlashAttribute("group", groupname);
		} catch (Exception e) {
			if("grouped".equals(e.getMessage())){
				return "grouped";
			}
			e.printStackTrace();
			return "failed";
		}
		return "successed";
	}

	/**
	 * 修改用户信息 即使没有修改的元素，前台要把原有信息带过来
	 * 
	 * @param username
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@RequestMapping("/changeUserInfo")
	@ResponseBody
	public String changeUserInfo(@RequestParam(value = "userid", required = true) String userid,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "sex", required = true) String sex,
			@RequestParam(value = "tel", required = true) String tel,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "remarks", required = true) String remarks) {
			sex = "0".equals(sex)?"男":"女";
		try {
			queryService.changeUserInfo(userid, name, sex, tel, password, remarks);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		return "succeed";
	}

	@RequestMapping("/initShowImage")
	@ResponseBody
	public String initShowImage(@RequestParam(value = "username", required = true) String username) {
		List<Map<String, Object>> list = queryService.initShowImage(username);
		Map<String, Object> resMap=new HashMap();
		resMap.put("idAndPath", list);
		String json = gson.toJson(resMap);
		return json;
	}
	
	@RequestMapping(value="/findGroupCapByUsername",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findGroupCapByUsername(@RequestParam(value = "username", required = true) String username){
		String groupName = queryService.findGroupCapByUsername(username);
		Map resMap=new HashMap();
		resMap.put("groupname", groupName);
		String json = gson.toJson(resMap);
		return json;
	}
	public IQueryService getQueryService() {
		return queryService;
	}

	public void setQueryService(IQueryService queryService) {
		this.queryService = queryService;
	}

}
