package com.etc.huangchong.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 数据库操作的辅助类
 */
public class BaseDao {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/homestay?useunicode=true&characterEncoding=utf-8";
	private static final String USER = "root"; // 用户名
	private static final String PASSWORD = "1";// 密码

	/**
	 * 获取连接对象
	 * 
	 * @return 连接对象
	 */
	public static Connection getConn() {

		Connection conn = null;
		try {

			Class.forName(DRIVER);
			// 得到连接对象
			conn = DriverManager.getConnection(URL, USER, PASSWORD);

		} catch (Exception e) {
			throw new RuntimeException("数据库连接失败!", e);
		}
		return conn;
	}

	/**
	 * 释放资源
	 * 
	 * @param rs    结果集
	 * @param pstmt 命令处理对象
	 * @param conn  连接对象
	 */
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException("释放资源失败!", e);
		}
	}

	/**
	 * 设置参数
	 * 
	 * @param sql
	 * @param conn
	 * @param pstmt
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	private static PreparedStatement setPstmt(String sql, Connection conn, PreparedStatement pstmt, Object... param)
			throws SQLException {
		pstmt = conn.prepareStatement(sql);
		if (param != null) {
			for (int i = 0; i < param.length; i++) {
				pstmt.setObject(i + 1, param[i]);
			}
		}
		return pstmt;
	}

	/**
	 * 通用的数据库(增,删,改)操作方法
	 * 
	 * @param sql   sql语句
	 * @param param sql语句参数
	 * @return 受影响行数
	 */
	public static int execute(String sql, Object... param) {
		Connection conn = getConn();
		try {
			return execute(sql, conn, param);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 通用的增删改操作(事务访问)
	 * 
	 * @param sql
	 * @param conn
	 * @param param
	 * @return
	 */
	public static int execute(String sql, Connection conn, Object... param) {
		PreparedStatement pstmt = null;
		try {
			pstmt = setPstmt(sql, conn, pstmt, param);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// 这里最好得到异常信息
			e.printStackTrace();
			throw new RuntimeException("数据库操作失败!", e);
		} finally {
			close(null, pstmt, null);
		}
	}

	/**
	 * 通用查询方法
	 * 
	 * @param sql   要查询的sql语句
	 * @param cla   Class对象
	 * @param param 参数
	 * @return
	 */
	public static Object select(String sql, Class cla, Object... param) {
		Connection conn = getConn();
		try {
			return select(sql, conn, cla, param);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 带事务的查询方法
	 * 
	 * @param sql
	 * @param conn
	 * @param cla
	 * @param param
	 * @return
	 */
	public static Object select(String sql, Connection conn, Class cla, Object... param) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		// 创建了一个ArrayList对象,之前我们封装的是HashMap
		// <Object> =>Emp Dept
		List<Object> list = new ArrayList<Object>();
		try {
			pstmt = setPstmt(sql, conn, pstmt, param);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// ?rs 结果集 cla Class对象
				// object其实就是数据表结构对应的一条实体记录,object就是那个实体类对象
				// 这个方法convert是将结果集和cla对象进行转换
				Object object = convert(rs, cla);
				list.add(object);
			}
			return list;
		} catch (SQLException e) {
			throw new RuntimeException("数据库查询失败!", e);
		} finally {
			close(rs, pstmt, null);
		}
	}

	/**
	 * 获取单个记录值,是单个记录注意,类似count(1)
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static Object getFirst(String sql, Object... param) {
		Connection conn = getConn();
		try {
			return getFirst(sql, conn, param);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 获取单个记录 事务
	 * 
	 * @param sql
	 * @param conn
	 * @param param
	 * @return
	 */
	public static Object getFirst(String sql, Connection conn, Object... param) {
		List list = (List) select(sql, conn, Object.class, param);
		if (list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * 事务处理操作
	 * 
	 * @param tran
	 * @return
	 */
	public static Object transaction(ITransaction tran) {
		Connection conn = getConn();
		try {
			conn.setAutoCommit(false);
			Object obj = tran.execute(conn);
			conn.commit();
			return obj;
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new RuntimeException("回滚失败!", e);
			}
			throw new RuntimeException("事务执行失败", e);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 查询结果的转换
	 * 
	 * @param rs  结果集
	 * @param cla Class类型的对象,例如: Emp.class Dept.class
	 * @return 某个类对象 Emp的对象,Dept对象
	 */
	public static Object convert(ResultSet rs, Class cla) {
		try {
			if ("java.lang.Object".equals(cla.getName())) {
				return rs.getObject(1);
			}
			// 创建实体类的实例 Class类对象的方法，创建指定对象的实例
			// Emp =>Emp对象
			Object object = cla.newInstance();
			//// 结果集头信息对象 ResultSet 对象的列的编号、类型和属性。查询语句有关.
			ResultSetMetaData metaData = rs.getMetaData();
			// 循环为实体类的实例的属性赋值 getColumnCount得到列的个数
			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				// 获取列名
				String name = metaData.getColumnLabel(i);
				//// 注：列名与属性名必须一致。最好遵循骆驼命名方法. rs.getObject(i) 结果集中的查询结果和对象匹配
				// 查询结果 查询的结果列可以有别名
				BeanUtils.setProperty(object, name, rs.getObject(i));
			}
			return object;
		} catch (Exception e) {
			throw new RuntimeException("属性设置失败!", e);
		}
	}

	/**
	 * 分页操作 mysql
	 * @param sql 查询语句
	 * @param page 查询的页码
	 * @param pageSize 查询记录数
	 * @param cla 查询后的对象
	 * @param param 参数
	 * @return PageData对象
	 */
	public static PageData getPage(String sql, Integer page, Integer pageSize, Class cla, Object... param) {
		// 这里是sql嵌套查询,把查询结果作新表,计算数据库里记录数
		String selSql = "select count(1) from (" + sql + ") t";
		// 默认是第一页,第一页不能继续-1查询
		if (page == null) {
			page = 1;
		}
		// 默认一页显示十条数据
		if (pageSize == null) {
			pageSize = 10;
		}
		// 得到总记录数
		Integer count = Integer.parseInt(getFirst(selSql, param).toString());
		//记录总数/每页的记录数
		int totalPage = count / pageSize;
		//判断是否有余数,如果有就再加一页
		if (count % pageSize != 0) {
			totalPage++;
		}
		//判断page是否超出总的记录,如果超出就显示最后一页
		if (page > totalPage) {
			page = totalPage;
		}
		// start查询语句limit的起始位置
		int start = (page - 1) * pageSize;
		if(start<0) {
			start=0;
		}
		selSql = sql + " limit " + start + "," + pageSize;
		List list = (List) select(selSql, cla, param);
		PageData data = new PageData(list, count, pageSize, page);
		return data;
	}

	/**
	 * 分页操作 sqlserver
	 * 
	 * @param page
	 * @param pageSize
	 * @param cla
	 * @param identity
	 * @return
	 */
	public PageData getPage(Integer page, Integer pageSize, Class cla, String identity) {
		String name = cla.getName().substring(cla.getName().lastIndexOf(".") + 1);// 根据命名规则从类名获取数据库表名
		String selSql = "select count(*) from " + name;// 获取总数
		if (page == null) {
			page = 1;
		}
		if (pageSize == null) {
			pageSize = 20;
		}
		int start = (page - 1) * pageSize;
		Integer count = Integer.parseInt(getFirst(selSql, null).toString());
		selSql = "select top " + pageSize + " * from " + name + " where " + identity + " not in (select top " + start
				+ " " + identity + " from " + name + " )"; // 拼接查询语句
		List list = (List) select(selSql, cla, null);
		PageData data = new PageData(list, count, pageSize, page);
		return data;
	}

}
