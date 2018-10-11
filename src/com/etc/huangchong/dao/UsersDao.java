package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Users;

/**
 * 用户Dao接口
 * 2018年10月11日17:22:58
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
}
