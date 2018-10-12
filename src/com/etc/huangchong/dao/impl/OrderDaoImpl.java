package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.util.BaseDao;

public class OrderDaoImpl implements OrderDao {

@Override
public List<Orders> queryOrder() {
	// TODO Auto-generated method stub
	String sql = "SELECT * FROM orders";
	List<Orders> list = (List<Orders>)BaseDao.select(sql, Orders.class);
	return list;
}


}
