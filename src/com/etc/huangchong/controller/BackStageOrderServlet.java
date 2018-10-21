package com.etc.huangchong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.service.OrderService;
import com.etc.huangchong.service.impl.OrderServiceImpl;
import com.etc.huangchong.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/os.do")
public class BackStageOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService os = new OrderServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BackStageOrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 设置请求编码和响应编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String op = request.getParameter("op");
		PrintWriter out = response.getWriter();
		if ("olist".equals(op)) {
			dolist(request, response);
		} else if ("del".equals(op)) {
			doDel(request,response);
		}else if("batchDel".equals(op)) {
			doBatchDel(request,response);
		}else if("updateorder".equals(op)) {
			doUpdateOrder(request,response);
		}
	}
/**
 * 显示订单列表
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException
 */
	protected void dolist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 得到订单列表
		List<Orders> list = os.getQueryOrder();
		// 得到Gson对象,Out对象和MyData对象
		PrintWriter out = response.getWriter();
		Gson gs = new Gson();
		MyData<Orders> md = new MyData<Orders>();
		// 将得到的list<Orders>转为json字符串
		md.setData(list);
		String jsonstr = gs.toJson(md);
		out.println(jsonstr);
		out.close();
	}
	/**
	 * 删除单个订单记录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doDel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String orderId = request.getParameter("orderId");
		boolean flag = os.getDelOrder(Integer.parseInt(orderId));
		if (flag) {
			out.println("true");
			out.close();
		}
	}
	/**
	 * 批量删除操作
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doBatchDel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		//批量删除的SQL语句
		String sql1="DELETE FROM orders WHERE orderId IN (";
		String sql2="DELETE FROM orderdetails WHERE orderId IN (";
		//获取批量ID
		String[] orderId = request.getParameterValues("orderId");
		//循环拼接ID
		for (String string : orderId) {
			sql1+=string+",";
			sql2+=string+",";
		}
		//最后的SQL语句
		sql1=sql1.substring(0,sql1.lastIndexOf(","))+")";
		
		sql2=sql2.substring(0,sql2.lastIndexOf(","))+")";
		boolean flag = os.getBatchDelOrder(sql1, sql2);
		if (flag) {
			out.println(flag);
			out.close();
		}
	}
	protected void doUpdateOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String orderId = request.getParameter("orderId");
		String bookTime = request.getParameter("bookTime");
		String unsubscribeTime = request.getParameter("unsubscribeTime");
		String fee = request.getParameter("fee");
		String orderStatus = request.getParameter("selectorderStatus");
		Orders o = new Orders(orderId,bookTime,unsubscribeTime,Double.parseDouble(fee),Integer.parseInt(orderStatus));
		boolean flag = os.getUpdateOrder(o);
		if(flag) {
			request.getRequestDispatcher("os.do?op=olist").forward(request, response);
		}
	}
	@Override
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
