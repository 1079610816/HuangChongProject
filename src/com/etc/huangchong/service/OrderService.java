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
	/**
	 * 查询某用户所有订单
	 * @param userId 用户Id
	 * @return 该用户所有订单集合
	 */
	List<Orders> queryUserOrder(int userId);
	/**
	 * 查询某用户某种状态的订单
	 * @param userId 用户Id
	 * @param orderStatus 订单状态
	 * @return 该用户某种状态订单集合
	 */
	List<Orders> queryUserOrder(int userId,int orderStatus);
	/**
	 * 查询某房东所有订单
	 * @param userId 房东Id
	 * @return 该房东所有订单集合
	 */
	List<Orders> getQueryLandlordOrder(int userId);
	
	/**
	 * 查询某房东某种状态的订单
	 * @param userId 用户Id
	 * @param orderStatus 订单状态
	 * @return 该房东某种状态订单集合
	 */
	List<Orders> getQueryLandlordOrder(int userId,int orderStatus);
	
	/**
	 * 增加订单
	 * @param o
	 * @param userId
	 * @param accomId
	 * @return
	 */
	boolean getAddOrder(Orders o,int userId,int accomId);
	/**
	 * 根据orderId修改订单状态
	 * @param orderId
	 * @param orderStatus
	 * @return
	 */
	boolean getUpdateOrder(String orderId,int orderStatus);
	
}
