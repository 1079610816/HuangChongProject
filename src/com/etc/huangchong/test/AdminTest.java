package com.etc.huangchong.test;

import java.util.List;

import com.etc.huangchong.entity.Admin;
import com.etc.huangchong.service.AdminService;
import com.etc.huangchong.service.impl.AdminServiceImpl;
import com.etc.huangchong.util.MD5Util;

public class AdminTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AdminService as = new AdminServiceImpl();
		List<Admin> list = as.getQueryAdmin();
		list.forEach(System.out::println);
		
	System.out.println(MD5Util.getEncodeByMd5("123456"));
	}

}
