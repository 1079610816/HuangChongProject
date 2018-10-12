package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.dao.impl.OrderDaoImpl;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao od = new OrderDaoImpl();
	@Override
	public List<Orders> getQueryOrder() {
		// TODO Auto-generated method stub
		return od.queryOrder();
	}

}
