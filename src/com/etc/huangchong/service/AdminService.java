package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Admin;

public interface AdminService {
	//显示管理员
	List<Admin> getQueryAdmin();
	//批量删除
	boolean getDeleteByAdminName(String adminName);

}
