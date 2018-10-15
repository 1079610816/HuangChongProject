package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Orders;

public interface OrderService {

	//查询订单列表
	List<Orders> getQueryOrder();
	//删除单条订单记录
	boolean getDelOrder(int orderId);
	//批量删除
	boolean getBatchDelOrder(String sql1,String sql2);
	//修改订单
	boolean getUpdateOrder(Orders o);
}
