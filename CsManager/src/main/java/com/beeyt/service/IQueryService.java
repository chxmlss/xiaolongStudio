package com.beeyt.service;

import java.util.List;
import java.util.Map;

public interface IQueryService {
	
	public List<Map<String, Object>> validateUser(String username,String password);

	public boolean changePwd(String username,String oldPwd,String newPwd);
	
	public List<Map<String, Object>> queryUsers(String name,String group,Integer limit,Integer page,String forGroup);
	
	public String addUser(String name,String sex,String tel,String username,String password,String remarks);

	public void delUser(String username);

	public void addGroup(String groupname, String username,String name);

	public void delGroup(String groupid);

	public List<Map<String, Object>> querGroups(String groupname,Integer limit, Integer page);

	public void userToGroup(String username, String groupid) throws Exception;
	
	public void filePathToUser(String username,String filepath);

	public void changeUserInfo(String userid, String name, String sex, String tel, String password, String remarks);

	public Integer queryUsersSum(String name, String group);
	
	public Integer queryGroupsSum(String groupname);
	
	public List checkUsername(String username);
	
	public String initShowImage(String username);
	
	public String findGroupCapByUsername(String username);
	
	
}
