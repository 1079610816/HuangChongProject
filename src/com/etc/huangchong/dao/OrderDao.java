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
}
