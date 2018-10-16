package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.AdminDao;
import com.etc.huangchong.entity.Admin;
import com.etc.huangchong.util.BaseDao;

public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Admin> queryAdmin() {
		// TODO Auto-generated method stub
		String sql = "select * from admin";
		@SuppressWarnings("unchecked")
		List<Admin> list = (List<Admin>) BaseDao.select(sql, Admin.class);
		return list;
	}

	@Override
	public boolean DeleteByAdminName(String adminName) {
		// TODO Auto-generated method stub
		String sql = "delete from admin where adminName = ?";
		return BaseDao.execute(sql, adminName) > 0;
	}

	
	/**
	 * 管理员登录
	 * 
	 * @param adminName
	 *            管理员
	 * @param adminPwd
	 *            管理密码
	 * @return Admin
	 */
	@Override
	public Admin login(String adminName, String adminPwd) {
		// TODO Auto-generated method stub
		String sql = "select * from admin where adminName=? and adminPwd=?";
		@SuppressWarnings("unchecked")
		List<Admin> list = (List<Admin>) BaseDao.select(sql, Admin.class, adminName, adminPwd);
		if (list.size() > 0) {
			Admin admin = list.get(0);
			return admin;
		} else {
			return null;
		}
	}

}
