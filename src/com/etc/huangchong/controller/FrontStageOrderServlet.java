package com.etc.huangchong.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Orders;
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
		case "userAll":
			orderList=os.queryUserOrder(1);
			request.setAttribute("orderStatus", orderStatus);
			request.setAttribute("orderList", orderList);		
			request.getRequestDispatcher("frontStage/ordersinfo.jsp").forward(request, response);
			break;
		case "userPayed":
			//userId=((Users)request.getSession().getAttribute("user")).getUserId();
			userId=1;
			orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
			orderList=os.queryUserOrder(userId,orderStatus);
			request.setAttribute("orderStatus", orderStatus);
			request.setAttribute("orderList", orderList);		
			request.getRequestDispatcher("frontStage/ordersinfo.jsp").forward(request, response);
			break;
		case "userPaying":
			//userId=((Users)request.getSession().getAttribute("user")).getUserId();
			userId=1;
			orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
			orderList=os.queryUserOrder(userId,orderStatus);
			request.setAttribute("orderStatus", orderStatus);
			request.setAttribute("orderList", orderList);		
			request.getRequestDispatcher("frontStage/ordersinfo.jsp").forward(request, response);
			break;
		case "allLandlordOrders":
			doQueryAllOrder(request, response);
			break;
		case "payingList":
			//待支付
			 doQueryAllOrderByLandlord(request, response);
			break;
		case "payedList":
			//已支付
			 doQueryAllOrderByLandlord(request, response);
			break;
		case "tradedefeatList":
			//交易失败
			 doQueryAllOrderByLandlord(request, response);
			break;
		case "refundList":
			//退款订单
           doQueryAllOrderByLandlord(request, response);
			break;
		default:
			break;
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doQueryAllOrderByLandlord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId=1;
		int orderStatus;
		List<Orders> orderLandlordList=null;
         orderStatus=Integer.parseInt(request.getParameter("orderStatus"));
         orderLandlordList=os.getQueryLandlordOrder(userId, orderStatus);
 		 request.setAttribute("orderStatus", orderStatus);
		 request.setAttribute("orderLandlordList", orderLandlordList);
		 request.getRequestDispatcher("frontStage/landlordOrder.jsp").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doQueryAllOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int orderStatus=-1;
		List<Orders> orderLandlordList=null;
		orderLandlordList=os.getQueryLandlordOrder(2);
		request.setAttribute("orderStatus", orderStatus);
		request.setAttribute("orderLandlordList", orderLandlordList);
		request.getRequestDispatcher("frontStage/landlordOrder.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
