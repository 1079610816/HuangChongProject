package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.util.BaseDao;

public class OrderDaoImpl implements OrderDao {

@Override
public List<Orders> queryOrder() {
	// TODO Auto-generated method stub
	String sql = "SELECT orders.orderId, orderdetails.bookTime, orderdetails.unsubscribeTime, orderdetails.fee, orderdetails.orderStatus, users.userName, accommodation.accomTitle FROM orders ,orderdetails ,users ,accommodation WHERE orders.orderId = orderdetails.orderId AND orders.accomId = accommodation.accomId AND orders.userId = users.userId";
	List<Orders> list = (List<Orders>)BaseDao.select(sql, Orders.class);
	return list;
}


}
