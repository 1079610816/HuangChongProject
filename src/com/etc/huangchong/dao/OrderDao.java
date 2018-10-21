package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Admin;
import com.etc.huangchong.entity.Orders;

/**
 * 
 * @author Administrator
 *
 */
public interface OrderDao {

	//查询订单表
	List<Orders> queryOrder();
	//删除单条订单信息，使用事务操作
	boolean delOrder(int orderId);
	//批量删除
	boolean batchDelOrder(String sql1,String sql2);
	//订单修改
	boolean updateOrder(Orders o);
	/**
	 * 查询用户所有订单
	 * @return 用户所有订单集合
	 */
	List<Orders> queryUserOrder(int userId);
	/**
	 * 根据订单状态查询某用户的订单
	 * @param userId 用户id
	 * @param orderStatus 订单状态
	 * @return 该用户某种状态订单集合
	 */
	List<Orders> queryUserOrder(int userId,int orderStatus);
	/**
	 * 查询房东的所有订单
	 * @return 房东所有订单集合
	 */
	List<Orders> queryLandlordOrder(int userId);
	
	/**
	 * 根据订单状态查询某房东的订单
	 * @param userId 用户id
	 * @param orderStatus 订单状态
	 * @return 该房东某种状态订单集合
	 */
	List<Orders> queryLandlordOrder(int userId,int orderStatus);
	/**
	 * 增加订单
	 * @param o
	 * @param userId
	 * @param accomId
	 * @return
	 */
	boolean addOrder(Orders o,int userId,int accomId);
	/**
	 * 根据orderId修改订单状态
	 * @param orderId
	 * @param orderStatus
	 * @return
	 */
	boolean updateOrder(String orderId,int orderStatus);
	
}
