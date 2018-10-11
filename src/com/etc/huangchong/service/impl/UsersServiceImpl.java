package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.UsersDao;
import com.etc.huangchong.dao.impl.UsersDaoImpl;
import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.UsersService;
/**
 *功能： 用户Service的实现类
 * 时间：2018年10月11日17:36:37
 * 
 * @author 颜瑞玲
 *
 */
public class UsersServiceImpl implements UsersService {
	private UsersDao ud=new UsersDaoImpl();
	/**
	 * 查询所有用户
	 * 
	 * @return List<Users>用户信息的集合
	 */
	@Override
	public List<Users> getAllUsers() {
		// TODO Auto-generated method stub
		List<Users> list=ud.queryUsers();
		return list;
	}

}
