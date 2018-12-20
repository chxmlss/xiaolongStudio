package com.beeyt.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.beeyt.service.IQueryService;

@Controller
@RequestMapping("/login")
public class LoginAction {
	@Autowired
	public IQueryService queryService;

	@RequestMapping(value = "scLogin", produces = "text/html;charset=UTF-8")
	public String toLogin(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password, Model model) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		String s_username = (String) session.getAttribute(username);
		if (username.equals(s_username)) {
			return "index";
		}
		List<Map<String, Object>> list = queryService.validateUser(username, password);
		if (list != null & list.size() > 0) {
			session.setAttribute("userid", list.get(0).get("id"));
			session.setAttribute("username", username);
			return "index";
		} else {
			session.setAttribute("loginMsg", "您的用户名/密码不正确，请联系管理员！");
			return "login";
		}
	}

	@RequestMapping(value = "userRegister", produces = "text/html;charset=UTF-8")
	public String userRegiser(@RequestParam(value = "userid", required = true) String userid) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("registerId")!=null&&!"".equals(session.getAttribute("registerId")))
		{
			return "redirect:/login/showBank.do";
		}
		session.setAttribute("userid", userid);
		return "userRegister";
	}

	@RequestMapping(value = "showBank", produces = "text/html;charset=UTF-8")
	public String showBank() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		String userid = String.valueOf(request.getSession().getAttribute("userid"));
		if (userid != null && !"".equals(userid)&&!"null".equals(userid)) {
			List<Map<String, Object>> list = queryService.getBank();
			request.getSession().setAttribute("list", list);
			return "showBank";
		} else {
			return "failed";
		}
	}

	@RequestMapping("/toLogin")
	public String toLgoin() {
		return "login";
	}

	public IQueryService getQueryService() {
		return queryService;
	}

	public void setQueryService(IQueryService queryService) {
		this.queryService = queryService;
	}
}
