package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Users;

/**
 * 功能： 用户Service
 * 
 * 时间：2018年10月11日17:32:45
 * 
 * @author 颜瑞玲
 *
 */
public interface UsersService {
	/**
	 * 查询所有用户
	 * 
	 * @return List<Users>用户信息的集合
	 */
	List<Users> getAllUsers();

	/**
	 * 增加用户
	 * 
	 * @param users
	 *            用户
	 * @return true 增加成功 false 增加失败
	 */
	boolean AddUsers(Users users);

	/**
	 * 删除用户
	 * 
	 * @param userId
	 *            用户编号
	 * @return true 删除成功 false 删除失败
	 */
	boolean delUsers(int userId);

	/**
	 * 更新用户信息
	 * 
	 * @param users
	 *            用户
	 * @return true 更新成功 false 更新失败
	 */
	boolean updateUsers(Users users);

	/**
	 * 批量删除
	 * 
	 * @param sql
	 * @return true 删除成功 false 删除失败
	 */
	boolean getBatchDelUsers(String sql);

	/**
	 * 修改密码
	 * 
	 * @param Users
	 *            用户
	 * @return true 更新成功 false 更新失败
	 */
	boolean getChangePassword(Users users);

	/**
	 * 修改用户的审核状态
	 * 
	 * @param state
	 *            审核状态
	 * @param identityCard
	 *            身份证号码
	 * @return true 更新成功 false 更新失败
	 */
	boolean getChangeState(int state, String identityCard);

	/**
	 * 用户登录操作
	 * 
	 * @param userName
	 *            用户名或电话号码
	 * @param userPwd
	 *            用户密码
	 * @return Users 用户
	 */
	Users getLogin(String userName, String userPwd);
}
