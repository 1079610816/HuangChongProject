package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Users;

/**
 * 用户Dao接口 2018年10月11日17:22:58
 * 
 * @author 颜瑞玲
 *
 */
public interface UsersDao {
	/**
	 * 查询所有用户
	 * 
	 * @return List<Users>用户信息的集合
	 */
	List<Users> queryUsers();

	/**
	 * 增加用户
	 * 
	 * @param users
	 *            用户
	 * @return true 增加成功 false 增加失败
	 */
	boolean addUsers(Users users);

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
	boolean batchDelUsers(String sql);

	
	/**
	 * 重置密码
	 * 
	 * @param userId 用户编号
	 * @return true 重置成功 false 重置失败
	 */
	boolean resetPassword(int userId);

	/**
	 * 修改用户的审核状态
	 * 
	 * @param state
	 *            审核状态
	 * @param identityCard
	 *            身份证号码
	 * @return true 更新成功 false 更新失败
	 */
	boolean changeState(int state, String identityCard);

	/**
	 * 密码登录操作
	 * 
	 * @param userName 用户名或电话号码
	 * @param userPwd 用户密码
	 * @return Users 用户
	 */
	Users login(String userName, String userPwd);
	/**
	 * 手机验证码登录操作
	 * @param telNum 手机号码
	 * @return  Users 用户
	 */
	Users loginByMsg(String telNum);
	
	/**
	 * 通过手机号增加用户
	 * 
	 * @param telNum
	 *            手机号
	 * @return true 增加成功 false 增加失败
	 */
	boolean addUsersByTel(String userName,String nickName,String telNum,String imgUrl);
	/**
	 * 修改用户信息
	 * @param userName 用户名
	 * @param nickName 用户昵称
	 * @return true 修改成功  false修改失败
	 */
	boolean upUserInfo(String userName,String nickName);
	/**
	 * 修改用户信息
	 * @param userName 用户名
	 * @param nickName 用户昵称
	 * @param headUrl 头像地址
	 * @return true 修改成功  false修改失败
	 */
	boolean upUserInfo(String userName,String nickName,String headUrl);
	/**
	 * 修改用户密码
	 * @param userPwd 用户密码
	 * @return true 修改成功  false修改失败
	 */
	boolean upUserPwd(String userName,String userPwd);
}
