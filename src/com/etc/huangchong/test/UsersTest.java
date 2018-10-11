package com.etc.huangchong.test;

import java.util.List;

import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.UsersService;
import com.etc.huangchong.service.impl.UsersServiceImpl;
/**
 * 用户的测试类
 * @author Administrator
 *
 */
public class UsersTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
       UsersService us=new UsersServiceImpl();
       List<Users> list=us.getAllUsers();
       for (Users users : list) {
		System.out.println(users);
	}
	}

}
