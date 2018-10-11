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
}
