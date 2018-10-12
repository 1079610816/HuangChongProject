package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Admin;
import com.etc.huangchong.entity.Orders;

public interface OrderDao {

	List<Orders> queryOrder();
}
