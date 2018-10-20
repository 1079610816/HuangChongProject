package com.etc.huangchong.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.OrderService;
import com.etc.huangchong.service.impl.OrderServiceImpl;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/os.action")
public class FrontStageOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService os = new OrderServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontStageOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 设置请求编码和响应编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String op=request.getParameter("op");
		List<Orders> orderList=null;
		int userId;
		int orderStatus=-1;
		switch (op) {
		case "allUserOrders":
			userId=Integer.parseInt(request.getParameter("userId"));
			orderList=os.queryUserOrder(userId);
			break;
		case "payed":
			userId=Integer.parseInt(request.getParameter("userId"));
			orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
			orderList=os.queryUserOrder(userId,orderStatus);
			break;
		case "paying":
			userId=Integer.parseInt(request.getParameter("userId"));
			orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
			orderList=os.queryUserOrder(userId,orderStatus);
			break;
		case "fail":
			userId=Integer.parseInt(request.getParameter("userId"));
			orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
			orderList=os.queryUserOrder(userId,orderStatus);
			break;
		}
		request.setAttribute("orderStatus", orderStatus);
		request.setAttribute("orderList", orderList);		
		request.getRequestDispatcher("frontStage/ordersinfo.jsp").forward(request, response);
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
