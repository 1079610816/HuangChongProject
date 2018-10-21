package com.etc.huangchong.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.service.HomestayService;
import com.etc.huangchong.service.OrderService;
import com.etc.huangchong.service.impl.HomestayServiceImpl;
import com.etc.huangchong.service.impl.OrderServiceImpl;
import com.etc.huangchong.util.WeekUtil;

/**
 * Servlet implementation class FrontStageBookServlet
 */
@WebServlet("/bs.action")
public class FrontStageBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HomestayService hs = new HomestayServiceImpl();
	private OrderService os = new OrderServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontStageBookServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String op = request.getParameter("op");
		// 订单编号
		String orderId = request.getParameter("orderId");
		
		
		if ("bookOrder".equals(op)) {
			// 民宿标题
			int accomId = Integer.parseInt(request.getParameter("accomId"));
			Homestay h = hs.getSingleHomestay(accomId);
			String accomTitle = h.getAccomTitle();
			double price = h.getPrice();
			//获取用户ID
			int userId = Integer.parseInt(request.getParameter("userId"));
			// 获得入住时间
			String checkinday = request.getParameter("checkinday");
			// 获得退房时间
			String checkoutday = request.getParameter("checkoutday");
			// 几晚
			int nights = WeekUtil.daysBetween(checkinday, checkoutday);
			Orders o = new Orders(orderId,checkinday,checkoutday,price,0);
			os.getAddOrder(o,userId,accomId);
			request.getSession().setAttribute("orderIdNum", orderId);
			request.setAttribute("checkinday", checkinday);
			request.setAttribute("checkoutday", checkoutday);
			request.setAttribute("checkinOfWeek", WeekUtil.CalculateWeekDay(checkinday));
			request.setAttribute("checkoutOfWeek", WeekUtil.CalculateWeekDay(checkoutday));
			request.setAttribute("price", price);
			request.setAttribute("nights", nights);
			request.setAttribute("orderId", orderId);
			request.setAttribute("accomId", accomId);
			request.setAttribute("accomTitle", accomTitle);
			request.getRequestDispatcher("frontStage/bookorder.jsp").forward(request, response);
		} else if ("pay".equals(op)) {
			// 民宿标题
			int accomId = Integer.parseInt(request.getParameter("accomId"));
			Homestay h = hs.getSingleHomestay(accomId);
			String accomTitle = h.getAccomTitle();
			double price = h.getPrice();
			String onlinePayAmountShow = request.getParameter("onlinePayAmountShow");
			request.setAttribute("onlinePayAmountShow", onlinePayAmountShow);
			request.setAttribute("orderId", orderId);
			request.setAttribute("accomId", accomId);
			request.setAttribute("accomTitle", accomTitle);
			request.getRequestDispatcher("frontStage/pay.jsp").forward(request, response);
		} else if ("gopay".equals(op)) {
			// 民宿标题
			int accomId = Integer.parseInt(request.getParameter("accomId"));
			Homestay h = hs.getSingleHomestay(accomId);
			String accomTitle = h.getAccomTitle();
			double price = h.getPrice();
			String onlinePayAmountShow = request.getParameter("onlinePayAmountShow");
			request.setAttribute("onlinePayAmountShow", onlinePayAmountShow);
			request.setAttribute("orderId", orderId);
			request.setAttribute("accomId", accomId);
			request.setAttribute("accomTitle", accomTitle);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else if("failed".equals(op)) {
			os.getUpdateOrder(orderId, 2);
			request.getRequestDispatcher("frontStage/ordersinfo.jsp").forward(request, response);
		}else if("success".equals(op)) {
			boolean flag = os.getUpdateOrder((String)request.getSession().getAttribute("orderIdNum"), 1);
			request.getRequestDispatcher("frontStage/ordersinfo.jsp").forward(request, response);
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
