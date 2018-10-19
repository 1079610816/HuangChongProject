package com.etc.huangchong.test;

import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.dao.impl.OrderDaoImpl;
import com.etc.huangchong.entity.Orders;

public class OrderTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OrderDao os = new OrderDaoImpl();
		//List<Orders> list = os.queryOrder();
		//list.forEach(System.out::println);
//		boolean flag = os.delOrder(6);
//		System.out.println(flag);
       List<Orders>list= os.queryLandlordOrder(2);
       for (Orders orders : list) {
		System.out.println(orders);
	}
	}

}
