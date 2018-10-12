package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.dao.impl.OrderDaoImpl;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao od = new OrderDaoImpl();

	/**
	 * 查询订单列表
	 */
	@Override
	public List<Orders> getQueryOrder() {
		// TODO Auto-generated method stub
		return od.queryOrder();
	}

	/**
	 * 删除单条订单记录
	 */
	@Override
	public boolean getDelOrder(int orderId) {
		// TODO Auto-generated method stub
		return od.delOrder(orderId);
	}
}
