package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.UsersDao;
import com.etc.huangchong.dao.impl.UsersDaoImpl;
import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.UsersService;

/**
 * 功能： 用户Service的实现类 时间：2018年10月11日17:36:37
 * 
 * @author 颜瑞玲
 *
 */
public class UsersServiceImpl implements UsersService {
	private UsersDao ud = new UsersDaoImpl();

	/**
	 * 查询所有用户
	 * 
	 * @return List<Users>用户信息的集合
	 */
	@Override
	public List<Users> getAllUsers() {
		// TODO Auto-generated method stub
		List<Users> list = ud.queryUsers();
		return list;
	}

	/**
	 * 增加用户
	 * 
	 * @param users
	 *            用户
	 * @return true 增加成功 false 增加失败
	 */
	@Override
	public boolean getAddUsers(Users users) {
		// TODO Auto-generated method stub
		return ud.addUsers(users);
	}

	/**
	 * 删除用户
	 * 
	 * @param userId
	 *            用户编号
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean delUsers(int userId) {
		// TODO Auto-generated method stub
		return ud.delUsers(userId);
	}

	/**
	 * 更新用户信息
	 * 
	 * @param users
	 *            用户
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean updateUsers(Users users) {
		// TODO Auto-generated method stub
		return ud.updateUsers(users);
	}

	/**
	 * 批量删除
	 * 
	 * @param sql
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean getBatchDelUsers(String sql,String sql1,String sql2,String sql3,String sql4) {
		// TODO Auto-generated method stub
		return ud.batchDelUsers(sql,sql1,sql2,sql3,sql4);
	}
	/**
	 * 重置密码
	 * 
	 * @param userId
	 *            用户编号
	 * @return true 重置成功 false 重置失败
	 */
	@Override
	public boolean getResetPassword(int userId) {
		// TODO Auto-generated method stub
		return ud.resetPassword(userId);
	}

	/**
	 * 修改用户的审核状态
	 * 
	 * @param state
	 *            审核状态
	 * @param identityCard
	 *            身份证号码
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean getChangeState(int state, String identityCard) {
		// TODO Auto-generated method stub
		return ud.changeState(state, identityCard);
	}

	/**
	 * 用户登录操作
	 * 
	 * @param userName
	 *            用户名或电话号码
	 * @param userPwd
	 *            用户密码
	 * @return Users 用户
	 */
	@Override
	public Users getLogin(String userName, String userPwd) {
		// TODO Auto-generated method stub
		return ud.login(userName, userPwd);
	}
	/**
	 * 验证码登录操作
	 * @param telNum 手机号码
	 * @return  Users 用户
	 */
	@Override
	public Users getLoginByMsg(String telNum) {
		// TODO Auto-generated method stub
		return ud.loginByMsg(telNum);
	}

	@Override
	public boolean getAddUsersByTel(String userName,String nickName,String telNum,String imgUrl) {
		// TODO Auto-generated method stub
		return ud.addUsersByTel(telNum,nickName,telNum,imgUrl);
	}

	@Override
	public boolean upUserInfo(String userName, String nickName) {
		return ud.upUserInfo(userName, nickName);
	}

	@Override
	public boolean upUserInfo(String userName, String nickName, String headUrl) {
		return ud.upUserInfo(userName, nickName, headUrl);
	}

	@Override
	public boolean upUserPwd(String userName,String userPwd) {
		return ud.upUserPwd(userName, userPwd);
	}

	@Override
	public boolean getAddUserRealInfo(String realName, String identityCard, int userId) {
		// TODO Auto-generated method stub
		return ud.addUserRealInfo(realName, identityCard, userId);
	}

	@Override
	public Users getUser(String userName) {
		return ud.getUser(userName);
	}

}
