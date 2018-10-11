package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.UsersDao;
import com.etc.huangchong.entity.Users;
import com.etc.huangchong.util.BaseDao;

/**
 * UserDao接口的实现类
 * 
 * @author Administrator
 *
 */
public class UsersDaoImpl implements UsersDao {
	/**
	 * 查询所有用户
	 * 
	 * @return List<Users>用户信息的集合
	 */
	@Override
	public List<Users> queryUsers() {
		// TODO Auto-generated method stub
		String sql = "select * from users";
		@SuppressWarnings("unchecked")
		List<Users> list = (List<Users>) BaseDao.select(sql, Users.class);
		return list;
	}

}
