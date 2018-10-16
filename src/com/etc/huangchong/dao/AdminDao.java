package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Admin;
/**
 * 管理员dao
 * @author Administrator
 *
 */
public interface AdminDao {
	/**
	 * 查询所有的管理员
	 * @return List<Admin>
	 */
	List<Admin> queryAdmin();
	/**
	 * 删除管理员
	 * @param adminName 管理员
	 * @return true 删除成功 false 删除失败
	 */
	boolean DeleteByAdminName(String adminName);
	
	/**
	 * 管理员登录
	 * @param adminName 管理员
	 * @param adminPwd 管理密码
	 * @return Admin
	 */
    Admin login(String adminName,String  adminPwd);
}
