package com.beeyt.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class QueryService implements IQueryService {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Map<String, Object>> validateUser(String username, String password) {
		String sql = "select * from s_user where username=? and password=?";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { username, password });
		return list;
	}

	public boolean changePwd(String username, String oldPwd, String newPwd) {
		String sql1 = "select * from s_user where username='" + username + "'";
		Map<String, Object> user = jdbcTemplate.queryForMap(sql1);
		String pwd = (String) user.get("password");
		if (oldPwd.equals(pwd)) {
			String sql2 = "update s_user set password='" + newPwd + "' where username='" + username + "'";
			jdbcTemplate.update(sql2);
			return true;
		} else {
			return false;
		}
	}

	public List<Map<String, Object>> queryUsers(String name, String group, Integer limit, Integer page,
			String forGroup) {
		String sql = "";
		if ("queryUserForGroup".equals(forGroup)) {
			sql = "select a.* from s_user a where a.id not in (select user_id from s_group_user ) and 1=1 ";
			if (name != null && !"".equals(name)) {
				sql += "and a.name like '%" + name + "%' ";
			}
			if (group != null && !"".equals(group)) {
				sql += "and b.group_name like '%" + group + "%' ";
			}

			int begin = (page - 1) * limit;
			sql += " limit " + begin + "," + limit + "";
		} else {

			sql = "select a.*,b.group_name from s_user a LEFT JOIN s_group_user b on a.id=b.user_id where 1=1 ";
			if (name != null && !"".equals(name)) {
				sql += "and a.name like '%" + name + "%' ";
			}
			if (group != null && !"".equals(group)) {
				sql += "and b.group_name like '%" + group + "%' ";
			}
			int begin = (page - 1) * limit;

			sql += " limit " + begin + "," + limit + "";
		}

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	public String addUser(String name, String sex, String tel, String username, String password, String remarks) {
		try {
			String sql = "select count(*) from s_user where username='" + username + "'";
			int i = jdbcTemplate.queryForObject(sql, Integer.class);
			if (i != 0) {
				return "usered";
			}
			String sql1 = "insert into s_user(name,sex,tel,username,password,remarks) values('" + name + "','" + sex
					+ "','" + tel + "','" + username + "','" + password + "','" + remarks + "')";
			jdbcTemplate.update(sql1);
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
		return "redirect:/business/getUsersInfo.do";
	}

	public void delUser(String username) {
		String sql = "SELECT a.*,b.group_id FROM s_user a LEFT JOIN s_group b ON a.username = b.username WHERE a.username = '"
				+ username + "'";
		Map<String, Object> map = jdbcTemplate.queryForMap(sql);
		String oldPath = (String) map.get("filepath");
		if (oldPath != null && !"".equals(oldPath)) {
			// 删除文件
			File file = new File(oldPath);
			// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
			if (file.exists() && file.isFile()) {
				file.delete();
			}
		}
		// 判断删除的用户是否是组长
		String groupid = (String) map.get("group_id");
		if (groupid != null && "".equals(groupid) && "null".equals(groupid)) {
			String sql1 = "delete from s_group where group_id=" + groupid + "";
			String sql2 = "delete from s_user where username='" + username + "'";
			String sql3 = "delete from s_group_user where group_id=" + groupid + "";
			jdbcTemplate.batchUpdate(sql1, sql2, sql3);
		} else {
			String sql1 = "delete from s_user where username='" + username + "'";
			String sql2 = "delete from s_group_user where user_name='" + username + "'";
			jdbcTemplate.batchUpdate(sql1, sql2);
		}

	}

	public void addGroup(String groupname, String username) throws Exception {
		String sql = "select * from s_user where username='" + username + "'";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		if (list != null && list.size() != 0) {
			String name = (String) list.get(0).get("name");
			String sql1 = "insert into s_group(group_name,username,name) values('" + groupname + "','" + username
					+ "','" + name + "')";
			jdbcTemplate.update(sql1);
		} else {
			throw new Exception("无此用户！");
		}
	}

	public void delGroup(String groupid) {
		String sql = "update s_user set isgroup=0 where id in (select user_id from s_group_user where group_id='"
				+ groupid + "')";
		String sql1 = "delete from s_group_user where group_id='" + groupid + "'";
		String sql2 = "delete from s_group where group_id='" + groupid + "'";

		jdbcTemplate.batchUpdate(sql, sql1, sql2);
	}

	public List<Map<String, Object>> querGroups(String groupname, Integer limit, Integer page) {
		String sql = "select a.*, (SELECT count(1)	FROM s_group_user WHERE group_id = a.group_id) as group_num from s_group a  where 1=1 ";
		if (groupname != null && !"".equals(groupname)) {
			sql += "and group_name like '%" + groupname + "%' ";
		}
		int begin = (page - 1) * limit;
		sql += " limit " + begin + "," + limit + "";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	public void userToGroup(String username, String groupid) throws Exception {
		String sql = "select count(*) from s_group where username='" + username + "'";
		int i = jdbcTemplate.queryForObject(sql, Integer.class);
		if (i != 0) {
			throw new Exception("grouped");
		}

		String sql3 = "select id  from s_user where username='" + username + "'";
		List list = jdbcTemplate.queryForList(sql3);
		Map map = (Map) list.get(0);
		String userid = String.valueOf(map.get("id"));

		String sql4 = "select group_id,group_name from s_group where group_id ='" + groupid + "'";
		List list2 = jdbcTemplate.queryForList(sql4);
		Map map2 = (Map) list2.get(0);
		String groupname = (String) map2.get("group_name");
		String sql1 = "delete from s_group_user where user_id='" + userid + "'";
		String sql2 = "insert into s_group_user(group_id,group_name,user_id,user_name) values(" + groupid + ",'"
				+ groupname + "'," + userid + ",'" + username + "')";
		String sql5 = "update s_user set isgroup=1 where id=" + userid + "";
		jdbcTemplate.batchUpdate(sql1, sql2, sql5);
	}

	@Override
	public void filePathToUser(String username, String filepath, String realPath) {
		String sql1 = "select * from s_user where username='" + username + "'";
		Map<String, Object> map = jdbcTemplate.queryForMap(sql1);
		String oldPath = realPath + (String) map.get("filepath");
		String sql2 = "update s_user set filepath='" + filepath.replaceAll("\\\\", "\\\\\\\\") + "' where username='"
				+ username + "'";
		jdbcTemplate.update(sql2);
		if (oldPath != null && !"".equals(oldPath)) {
			// 删除文件
			File file = new File(oldPath);
			// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
			if (file.exists() && file.isFile()) {
				file.delete();
			}
		}
	}

	@Override
	public void changeUserInfo(String userid, String name, String sex, String tel, String password, String remarks) {
		String sql = "update s_user set name=?,sex=?,tel=?,password=?,remarks=? where id=?";
		jdbcTemplate.update(sql, new Object[] { name, sex, tel, password, remarks, userid });
	}

	@Override
	public Integer queryUsersSum(String name, String group) {
		String sql = "select count(*) from s_user a LEFT JOIN s_group_user b on a.id=b.user_id where 1=1 ";
		if (name != null && !"".equals(name)) {
			sql += "and a.name like '%" + name + "%' ";
		}
		if (group != null && !"".equals(group)) {
			sql += "and b.group_name like '%" + group + "%' ";
		}
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public Integer queryGroupsSum(String groupname) {
		String sql = "select count(*) from s_group a where 1=1 ";
		if (groupname != null && !"".equals(groupname)) {
			sql += "and group_name like '%" + groupname + "%' ";
		}
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public List checkUsername(String username) {
		String sql = "select * from s_user where 1=1 and username='" + username + "'";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	@Override
	public List<Map<String, Object>> initShowImage(String username) {
		String sql = "select id,filepath from s_user where 1=1 and username='" + username + "'";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);

		return list;
	}

	@Override
	public String findGroupCapByUsername(String username) {
		String sql = "select sgp.name from s_user sur inner join s_group_user sgu on sur.id = sgu.user_id "
				+ "inner join s_group sgp on sgu.group_id = sgp.group_id where sur.username = '" + username + "'";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			String filepath = String.valueOf(map.get("name"));
			return filepath;
		} else {
			return null;
		}

	}

	public void userDelGroup(String username) throws Exception {
		String sql1 = "delete from s_group_user where user_name='" + username + "'";
		String sql2 = "update s_user set isgroup=0 where username='" + username + "'";
		jdbcTemplate.batchUpdate(sql1, sql2);
	}

	@Override
	public String findIdByUsername(String username) {
		String sql = "select id from s_user where username='" + username + "'";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		Map map = (Map) list.get(0);
		String userid = String.valueOf(map.get("id"));
		return userid;
	}

	@Override
	public String findGroupNameByUsername(String username) {
		String sql = "select group_name from s_group_user where user_name='" + username + "'";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		Map map = (Map) list.get(0);
		String groupName = String.valueOf(map.get("group_name"));
		return groupName;
	}

	@Override
	public List<Map<String, Object>> getBank() {
		String sql = "select * from s_bank where bank_icon is not null order by bank_order limit 9";
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public int saveRegister(String name, String idcard, String telephone, String userid) throws Exception {
		String sql = "insert into s_register(register_name,register_idcard,register_telephone,user_id,createDate) values(?,?,?,?,sysdate())";
		jdbcTemplate.update(sql, new Object[] { name, idcard, telephone, userid });
		String sql2 = "select register_id from s_register where register_name=? and register_idcard=? and user_id=? order by createDate desc limit 1";
		int registerId = jdbcTemplate.queryForObject(sql2, Integer.class, new Object[] { name, idcard, userid });
		return registerId;
	}

	public boolean checkTelephone(String telephone) {
		String sql = "select register_telephone from s_register where register_telephone=" + telephone;
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		if (list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void updateRegister(int registerId, String bank) throws Exception {
		String sql = "insert into s_register_bank(register_id,bank_id) values (?,?)";
		JSONArray banks=JSONObject.parseArray(bank);
		for (int i = 0; i < banks.size(); i++) {
			jdbcTemplate.update(sql, new Object[] { registerId, banks.get(i) });
		}
	}

	@Override
	public List<Map<String, Object>> getRegisterByUser(String userid) {
		String sql = "SELECT" + "	t.register_id," + "	t.register_name," + "	t.register_idcard,"
				+ "	t.register_telephone," + "	t.createDate,"
				+ "	(select count(*) from s_register_bank b where b.register_id=t.register_id) as bank_count," + "	("
				+ "		SELECT" + "			GROUP_CONCAT(b.bank_name)" + "		FROM" + "			s_register_bank a,"
				+ "			s_bank b" + "		WHERE" + "			a.bank_id = b.bank_id"
				+ "		AND a.register_id = t.register_id" + "		GROUP BY" + "			a.register_id"
				+ "	) AS register_bank" + "FROM" + "	s_register t" + "WHERE 1=1 ";
		if (userid != null && !"".equals(userid)) {
			sql += " and	user_id = " + userid + " ";
		}

		sql += " ORDER BY" + "	createDate DESC" + "";

		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public List<Map<String, Object>> getRegisterBank() {
		String sql = "select t.bank_id,(select bank_name from s_bank where bank_id=t.bank_id) as bank_name ,count(1) as bank_count from s_register_bank t GROUP BY t.bank_id order by bank_count desc";
		return jdbcTemplate.queryForList(sql);
	}
}
