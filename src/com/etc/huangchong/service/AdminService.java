package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Admin;

public interface AdminService {
	//显示管理员
	List<Admin> getQueryAdmin();
	//批量删除
	boolean getDeleteByAdminName(String adminName);
	/**
	 * 登录操作
	 * @param adminName 管理员姓名
	 * @param adminPwd 管理员密码
	 * @return Admin 管理员
	 */
	Admin getLogin(String adminName,String adminPwd);
}
