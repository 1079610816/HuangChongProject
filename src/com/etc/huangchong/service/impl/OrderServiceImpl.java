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
	/**
	 * 批量删除
	 */
	@Override
	public boolean getBatchDelOrder(String sql1, String sql2) {
		// TODO Auto-generated method stub
		return od.batchDelOrder(sql1, sql2);
	}
	@Override
	public boolean getUpdateOrder(Orders o) {
		// TODO Auto-generated method stub
		return od.updateOrder(o);
	}

	@Override
	public List<Orders> queryUserOrder(int userId,int orderStatus) {
		return od.queryUserOrder(userId,orderStatus);
	}

	@Override
	public List<Orders> queryUserOrder(int userId) {
		return od.queryUserOrder(userId);
	}
	/**
	 * 查询某房东所有订单
	 * @param userId 房东Id
	 * @return 该房东所有订单集合
	 */
	@Override
	public List<Orders> getQueryLandlordOrder(int userId) {
		// TODO Auto-generated method stub
		return od.queryLandlordOrder(userId);
	}
	/**
	 * 查询某房东某种状态的订单
	 * @param userId 用户Id
	 * @param orderStatus 订单状态
	 * @return 该房东某种状态订单集合
	 */
	@Override
	public List<Orders> getQueryLandlordOrder(int userId, int orderStatus) {
		// TODO Auto-generated method stub
		return od.queryLandlordOrder(userId, orderStatus);
	}
	
	/**
	 * 增加订单
	 * @param o
	 * @return
	 */
	@Override
	public boolean getAddOrder(Orders o,int userId,int accomId) {
		// TODO Auto-generated method stub
		return od.addOrder(o,userId,accomId);
	}
	/**
	 * 根据orderId修改订单状态
	 * @param orderId
	 * @param orderStatus
	 * @return
	 */
	@Override
	public boolean getUpdateOrder(String orderId, int orderStatus) {
		// TODO Auto-generated method stub
		return od.updateOrder(orderId, orderStatus);
	}
	
}
