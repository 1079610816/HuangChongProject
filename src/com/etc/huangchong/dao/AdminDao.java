package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Admin;
/**
 * 管理员dao
 * @author Administrator
 *
 */
public interface AdminDao {
	//显示管理员信息
	List<Admin> queryAdmin();

}
