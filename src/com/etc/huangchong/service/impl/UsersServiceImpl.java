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
	/**
	 * 增加用户
	 * @param users 用户
	 * @return true 增加成功 false 增加失败
	 */
	@Override
	public boolean AddUsers(Users users) {
		// TODO Auto-generated method stub
		return ud.AddUsers(users);
	}

	/**
	 * 删除用户
	 * @param userId 用户编号
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean delUsers(int userId) {
		// TODO Auto-generated method stub
		return ud.delUsers(userId);
	}
	/**
	 * 更新用户信息
	 * @param users 用户
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean updateUsers(Users users) {
		// TODO Auto-generated method stub
		return ud.updateUsers(users);
	}
	/**
	 * 批量删除
	 * @param sql
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean getBatchDelUsers(String sql) {
		// TODO Auto-generated method stub
		return ud.batchDelUsers(sql);
	}
	/**
	 * 修改密码
	 * @param Users 用户
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean getChangePassword(Users users) {
		// TODO Auto-generated method stub
		return ud.changePassword(users);
	}

}
