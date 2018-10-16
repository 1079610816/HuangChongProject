package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.AdminDao;
import com.etc.huangchong.dao.impl.AdminDaoImpl;
import com.etc.huangchong.entity.Admin;
import com.etc.huangchong.service.AdminService;

public class AdminServiceImpl implements AdminService {
	private AdminDao ad = new AdminDaoImpl();

	@Override
	public List<Admin> getQueryAdmin() {
		// TODO Auto-generated method stub
		
		return ad.queryAdmin();
	}
	@Override
	public boolean getDeleteByAdminName(String adminName) {
		// TODO Auto-generated method stub
		return ad.DeleteByAdminName(adminName);
	}
	
	@Override
	public Admin getLogin(String adminName, String adminPwd) {
		// TODO Auto-generated method stub
		return ad.login(adminName, adminPwd);
	}
	

}
