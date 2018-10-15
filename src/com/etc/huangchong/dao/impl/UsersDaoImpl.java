package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.UsersDao;
import com.etc.huangchong.entity.Users;
import com.etc.huangchong.util.BaseDao;

import javafx.scene.layout.Background;

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
		String sql = "select users.userId,users.userName,users.userPwd,users.nickName,users.telNum,userscheck.realName,userscheck.identityCard,users.imgUrl,userscheck.state from users left join userscheck on users.userId=userscheck.userId ";
		@SuppressWarnings("unchecked")
		List<Users> list = (List<Users>) BaseDao.select(sql, Users.class);
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
		String sql="insert into users(userName,userPwd,nickName,imgUrl) values(?,?,?,?) ";
		int n=BaseDao.execute(sql, users.getUserName(),users.getUserPwd(),users.getNickName(),users.getImgUrl());
		return n>0;
	}
	/**
	 * 删除用户
	 * @param userId 用户编号
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean delUsers(int userId) {
		// TODO Auto-generated method stub
		String sql="delete from users where userId=?";
		int n=BaseDao.execute(sql,userId);
		return n>0;
	}
	
	/**
	 * 更新用户信息
	 * @param users 用户
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean updateUsers(Users users) {
		// TODO Auto-generated method stub
		String sql="update users set userName=?,nickName=?,telNum=?,imgUrl=? where userId=?";
		int n=BaseDao.execute(sql, users.getUserName(),users.getNickName(),users.getTelNum(),users.getImgUrl(),users.getUserId());
		return n>0;
	}
	/**
	 * 批量删除
	 * @param sql
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean batchDelUsers(String sql) {
		// TODO Auto-generated method stub		
		return BaseDao.execute(sql)>0;
	}
	/**
	 * 修改密码
	 * @param users 用户
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean changePassword(Users users) {
		// TODO Auto-generated method stub
		String sql="update users set userPwd=? where userId=?";
		int n=BaseDao.execute(sql, users.getUserPwd(),users.getUserId());
		return n>0;
	}

	
}
