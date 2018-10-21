package com.etc.huangchong.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
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
		String sql = "select users.userId,users.userName,users.userPwd,users.nickName,users.telNum,userscheck.realName,userscheck.identityCard,users.imgUrl,userscheck.state from users left join userscheck on users.userId=userscheck.userId ";
		@SuppressWarnings("unchecked")
		List<Users> list = (List<Users>) BaseDao.select(sql, Users.class);
		return list;
	}

	/**
	 * 增加用户
	 * 
	 * @param users 用户
	 * @return true 增加成功 false 增加失败
	 */
	@Override
	public boolean addUsers(Users users) {
		// TODO Auto-generated method stub
		String sql = "insert into users(userName,userPwd,nickName,imgUrl) values(?,?,?,?) ";
		int n = BaseDao.execute(sql, users.getUserName(), users.getUserPwd(), users.getNickName(), users.getImgUrl());
		return n > 0;
	}

	/**
	 * 删除用户
	 * 
	 * @param userId 用户编号
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean delUsers(int userId) {
		// TODO Auto-generated method stub
		/*
		 * String sql = "delete from users where userId=?"; int n = BaseDao.execute(sql,
		 * userId); return n > 0;
		 */

		Connection conn = BaseDao.getConn();
		boolean flag = false;// flag为false时表示删除失败，true时为删除成功
		try {
			// 设置自动提交为false
			conn.setAutoCommit(false);
			String sql1 = "delete from users where userId=?";
			int s1 = BaseDao.execute(sql1, userId);
			String sql = "delete orders,orderdetails from orders left join orderdetails on orders.orderId=orderdetails.orderId where orders.userId = ?";
			int s2 = BaseDao.execute(sql, userId);
			String sql2 = "delete from userscheck where userId=?";
			int s3 = BaseDao.execute(sql2, userId);
			String sql3 = "delete from comment where userId=?";
			int s4 = BaseDao.execute(sql3, userId);
			String sql4 = "delete from accommodation where userId=?";
			int s5 = BaseDao.execute(sql4, userId);
			// 若两条SQL都操作成功则
			if (s1 > 0 && s2 > 0 & s3 > 0 & s4 > 0 & s5 > 0) {
				flag = true;
			}
			// 手动提交
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
				// System.out.println("删除失败，自动回滚");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			return flag;
		}
	}

	/**
	 * 更新用户信息
	 * 
	 * @param users 用户
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean updateUsers(Users users) {
		// TODO Auto-generated method stub
		String sql = "update users set userName=?,nickName=?,telNum=?,imgUrl=? where userId=?";
		int n = BaseDao.execute(sql, users.getUserName(), users.getNickName(), users.getTelNum(), users.getImgUrl(),
				users.getUserId());
		return n > 0;
	}

	/**
	 * 批量删除
	 * 
	 * @param sql
	 * @return true 删除成功 false 删除失败
	 */
	@Override
	public boolean batchDelUsers(String sql,String sql1,String sql2,String sql3,String sql4) {
		// TODO Auto-generated method stub
		Connection conn = BaseDao.getConn();
		boolean flag = false;
		try {
			//设置自动提交为false
			conn.setAutoCommit(false);
			//执行删除操作
			int s1 = BaseDao.execute(sql1);
			int s2 = BaseDao.execute(sql);
			int s3 = BaseDao.execute(sql2);
			int s4 = BaseDao.execute(sql3);
			int s5 = BaseDao.execute(sql4);
			System.out.println(s1+s2+s3+s4+s5);
			// 若两条SQL都操作成功则
			if (s1 > 0 && s2 > 0 & s3 > 0 & s4 > 0 & s5 > 0) {
				flag = true;
			}
			// 手动提交
			conn.commit();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				//失败回滚操作
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			
			return flag;
		}
		
	}

	/**
	 * 重置密码
	 * 
	 * @param userId 用户编号
	 * @return true 重置成功 false 重置失败
	 */
	@Override
	public boolean resetPassword(int userId) {
		// TODO Auto-generated method stub
		String sql = "update users set userPwd='e10adc3949ba59abbe56e057f20f883e' where userId=?";
		int n = BaseDao.execute(sql, userId);
		return n > 0;
	}

	/**
	 * 修改用户的审核状态
	 * 
	 * @param state        审核状态
	 * @param identityCard 身份证号码
	 * @return true 更新成功 false 更新失败
	 */
	@Override
	public boolean changeState(int state, String identityCard) {
		// TODO Auto-generated method stub
		String sql = "update userscheck set state=? where identityCard=?";
		int n = BaseDao.execute(sql, state, identityCard);
		return n > 0;
	}

	/**
	 * 密码登录操作
	 * 
	 * @param userName 用户名或电话号码
	 * @param userPwd  用户密码
	 * @return Users 用户
	 */
	@Override
	public Users login(String userName, String userPwd) {
		// TODO Auto-generated method stub
		// String sql = "select * from users where (userName=? or telNum=?) and
		// userPwd=?";
		String sql = "select u.userId,u.userName,u.nickName,u.telNum,u.imgUrl,uc.state from users as u left join userscheck as uc on u.userId=uc.userId where (u.userName=? or u.telNum=?) and u.userPwd=?";
		@SuppressWarnings("unchecked")
		List<Users> list = (List<Users>) BaseDao.select(sql, Users.class, userName, userName, userPwd);
		if (list.size() != 0) {
			Users u = list.get(0);
			return u;
		} else {
			return null;
		}
	}

	/**
	 * 手机验证码登录操作
	 * 
	 * @param telNum 手机号码
	 * @return Users 用户
	 */
	@Override
	public Users loginByMsg(String telNum) {
		// TODO Auto-generated method stub
		// String sql = "select * from users where telNum=?";
		String sql = "select u.userId,u.userName,u.nickName,u.telNum,u.imgUrl,uc.state from users as u left join userscheck as uc on u.userId=uc.userId where u.telNum=?";
		@SuppressWarnings("unchecked")
		List<Users> list = (List<Users>) BaseDao.select(sql, Users.class, telNum);
		if (list.size() != 0) {
			Users u = list.get(0);
			return u;
		} else {
			return null;
		}
	}

	/**
	 * 通过手机号增加用户
	 * 
	 * @param telNum 手机号
	 * @return true 增加成功 false 增加失败
	 */
	@Override
	public boolean addUsersByTel(String userName, String nickName, String telNum, String imgUrl) {
		// TODO Auto-generated method stub
		String sql = "insert into users(nickName,telNum,imgUrl) values(?,?,?)";
		int n = BaseDao.execute(sql, telNum, telNum, imgUrl);
		return n > 0;
	}

	@Override
	public boolean upUserInfo(String userName, String nickName) {
		String sql = "update users set nickName = ? where userName = ?";
		int n = BaseDao.execute(sql, nickName, userName);
		return n > 0;
	}

	@Override
	public boolean upUserInfo(String userName, String nickName, String headUrl) {
		String sql = "update users set nickName = ?,imgUrl = ? where userName = ?";
		int n = BaseDao.execute(sql, nickName, headUrl, userName);
		return n > 0;
	}

	@Override
	public boolean upUserPwd(String userName, String userPwd) {
		String sql = "update users set userPwd = ? where userName =?";
		int n = BaseDao.execute(sql, userPwd, userName);
		return n > 0;
	}

	@Override
	public boolean addUserRealInfo(String realName, String identityCard, int userId) {
		// TODO Auto-generated method stub
		String sql = "insert into userscheck(realName,identityCard,userId) values(?,?,?)";
		int n = BaseDao.execute(sql, realName, identityCard, userId);
		return n > 0;
	}

	@Override
	public Users getUser(String userName) {
		// String sql = "select * from users where userName=?";
		String sql = "select u.userId,u.userName,u.nickName,u.telNum,u.imgUrl,uc.state from users as u left join userscheck as uc on u.userId=uc.userId where u.userName=?";
		List<Users> list = (List<Users>) BaseDao.select(sql, Users.class, userName);
		if (list.size() != 0) {
			Users u = list.get(0);
			return u;
		} else {
			return null;
		}
	}

}
