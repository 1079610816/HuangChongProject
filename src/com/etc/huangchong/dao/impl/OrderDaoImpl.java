package com.etc.huangchong.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.etc.huangchong.dao.OrderDao;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.util.BaseDao;

public class OrderDaoImpl implements OrderDao {

	private String sql;
	
/**
 * 查询订单信息
 * 返回Orders的集合
 */
	@Override
	public List<Orders> queryOrder() {
		// TODO Auto-generated method stub
		sql = "SELECT orders.orderId, orderdetails.bookTime, orderdetails.unsubscribeTime, orderdetails.fee, orderdetails.orderStatus, users.userName, accommodation.accomTitle FROM orders ,orderdetails ,users ,accommodation WHERE orders.orderId = orderdetails.orderId AND orders.accomId = accommodation.accomId AND orders.userId = users.userId";
		List<Orders> list = (List<Orders>) BaseDao.select(sql, Orders.class);
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
			int s1 = BaseDao.execute(sql1, orderId);
			sql = "DELETE FROM orders WHERE orderId=?";
			int s2 = BaseDao.execute(sql, orderId);
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
		Connection conn = BaseDao.getConn();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			boolean flag1 = BaseDao.execute(sql1)>0;
			boolean flag2 = BaseDao.execute(sql2)>0;
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
		return BaseDao.execute(sql, o.getBookTime(),o.getUnsubscribeTime(),o.getFee(),o.getOrderStatus(),o.getOrderId())>0;
	}
	/**
	 * 查询用户所有的订单
	 */
	@Override
	public List<Orders> queryUserOrder(int userId) {
		sql="select o.orderId,a.accomId,a.accomTitle,a.accomAddress,od.bookTime,od.unsubscribeTime,od.fee,od.orderStatus from orders as o inner join accommodation as a on o.accomId=a.accomId inner join orderdetails as od on o.orderId=od.orderId where o.userId=?";
		return (List<Orders>)BaseDao.select(sql, Orders.class, userId);
	}
	@Override
	public List<Orders> queryUserOrder(int userId,int orderStatus) {
		sql="select o.orderId,a.accomId,a.accomTitle,a.accomAddress,od.bookTime,od.unsubscribeTime,od.fee,od.orderStatus from orders as o inner join accommodation as a on o.accomId=a.accomId inner join orderdetails as od on o.orderId=od.orderId where o.userId=? and od.orderStatus =?";
		return (List<Orders>)BaseDao.select(sql, Orders.class, userId,orderStatus);
	}
	/**
	 * 查询房东的所有订单
	 * @return 房东所有订单集合
	 */
	@Override
	public List<Orders> queryLandlordOrder(int userId) {
		// TODO Auto-generated method stub
		String sql="select orderdetails.orderId,orderdetails.bookTime,orderdetails.unsubscribeTime,orderdetails.fee,orderdetails.orderStatus,accommodation.accomTitle,accommodation.accomId,accommodation.accomAddress from orderdetails inner join orders on orders.orderId=orderdetails.orderId inner join accommodation on orders.accomId=accommodation.accomId where accommodation.userId=?";
		List<Orders>list=(List<Orders>)BaseDao.select(sql, Orders.class, userId);
		return list;
	}
	/**
	 * 根据订单状态查询某房东的订单
	 * @param userId 用户id
	 * @param orderStatus 订单状态
	 * @return 该房东某种状态订单集合
	 */
	@Override
	public List<Orders> queryLandlordOrder(int userId, int orderStatus) {
		// TODO Auto-generated method stub
		String sql="select orderdetails.orderId,orderdetails.bookTime,orderdetails.unsubscribeTime,orderdetails.fee,orderdetails.orderStatus,accommodation.accomTitle,accommodation.accomId,accommodation.accomAddress from orderdetails inner join orders on orders.orderId=orderdetails.orderId inner join accommodation on orders.accomId=accommodation.accomId where accommodation.userId=? and orderdetails.orderStatus=? ";
		List<Orders>list=(List<Orders>)BaseDao.select(sql, Orders.class, userId,orderStatus);
		return list;
	}
	/**
	 * 增加订单
	 * @param o
	 * @return
	 */
	@Override
	public boolean addOrder(Orders o,int userId,int accomId) {
		// TODO Auto-generated method stub
		Connection conn = BaseDao.getConn();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			sql="INSERT INTO orderdetails (orderId, bookTime, unsubscribeTime, fee, orderStatus) VALUES (?, ?, ?, ?, ?)";
			int a1 = BaseDao.execute(sql, o.getOrderId(),o.getBookTime(),o.getUnsubscribeTime(),o.getFee(),o.getOrderStatus());
			String sql2 = "INSERT INTO orders (orderId,userId,accomId) VALUES (?, ?, ?)";
			int a2 = BaseDao.execute(sql2,o.getOrderId(), userId,accomId);
			if(a1>0&&a2>0) {
				flag = true;
				conn.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally {
			
			return flag;
		}
		
		
	}
	/**
	 * 根据orderId修改订单状态
	 * @param orderId
	 * @param orderStatus
	 * @return
	 */
	@Override
	public boolean updateOrder(String orderId,int orderStatus) {
		// TODO Auto-generated method stub
		sql="UPDATE orderdetails SET orderStatus=? WHERE orderId=?";
		return BaseDao.execute(sql, orderStatus, orderId)>0;
	}
	
}
