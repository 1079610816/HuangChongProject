package com.etc.huangchong.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.util.BaseDao;

public class OrderDaoImpl implements OrderDao {

	private String sql;
	private BaseDao bd = new BaseDao();
/**
 * 查询订单信息
 * 返回Orders的集合
 */
	@Override
	public List<Orders> queryOrder() {
		// TODO Auto-generated method stub
		sql = "SELECT orders.orderId, orderdetails.bookTime, orderdetails.unsubscribeTime, orderdetails.fee, orderdetails.orderStatus, users.userName, accommodation.accomTitle FROM orders ,orderdetails ,users ,accommodation WHERE orders.orderId = orderdetails.orderId AND orders.accomId = accommodation.accomId AND orders.userId = users.userId";
		List<Orders> list = (List<Orders>) bd.select(sql, Orders.class);
		return list;
	}
/**
 * 删除单条订单记录
 * 返回值为false时表示删除失败，true时为删除成功
 */
	@Override
	public boolean delOrder(int orderId) {
		// TODO Auto-generated method stub
		Connection conn = BaseDao.getConn();
		boolean flag = false;// flag为false时表示删除失败，true时为删除成功
		try {
			// 设置自动提交为false
			conn.setAutoCommit(false);
			String sql1 = "DELETE FROM orderdetails WHERE orderId=?";
			int s1 = bd.execute(sql1, orderId);
			sql = "DELETE FROM orders WHERE orderId=?";
			int s2 = bd.execute(sql, orderId);
			// 若两条SQL都操作成功则
			if (s1 > 0 && s2 > 0) {
				flag = true;
			}
			//手动提交
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
				//System.out.println("删除失败，自动回滚");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			return flag;
		}

	}
	/**
	 * 批量删除
	 * 返回值为false时表示删除失败，true时为删除成功
	 */
	@Override
	public boolean batchDelOrder(String sql1, String sql2) {
		// TODO Auto-generated method stub
		Connection conn = bd.getConn();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			boolean flag1 = bd.execute(sql1)>0;
			boolean flag2 = bd.execute(sql2)>0;
			if(flag1&&flag2) {
				flag=true;
			}
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				conn.rollback();
				//System.out.println("删除失败，自动回滚");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			return flag;
		}
		
	}
	/**
	 * 修改订单
	 * 返回值为false时表示删除失败，true时为删除成功
	 */
	@Override
	public boolean updateOrder(Orders o) {
		// TODO Auto-generated method stub
		sql="UPDATE orderdetails SET bookTime=?, unsubscribeTime=?, fee=?, orderStatus=? WHERE orderId=?";
		return bd.execute(sql, o.getBookTime(),o.getUnsubscribeTime(),o.getFee(),o.getOrderStatus(),o.getOrderId())>0;
	}
}
