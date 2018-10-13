package com.etc.huangchong.test;

import com.etc.huangchong.dao.HomestayDao;
import com.etc.huangchong.dao.impl.HomestayDaoImpl;

public class HomestayTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HomestayDao hd=new HomestayDaoImpl();
		System.out.println(hd.queryHomestay());
	}

}
