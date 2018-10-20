package com.etc.huangchong.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.service.HomestayService;
import com.etc.huangchong.service.impl.HomestayServiceImpl;
import com.etc.huangchong.util.WeekUtil;

/**
 * Servlet implementation class FrontStageBookServlet
 */
@WebServlet("/bs.action")
public class FrontStageBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HomestayService hs = new HomestayServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontStageBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		// 民宿标题
		int accomId = Integer.parseInt(request.getParameter("accomId"));
		Homestay h = hs.getSingleHomestay(accomId);
		String accomTitle = h.getAccomTitle();
		double price = h.getPrice();
		
		if ("bookOrder".equals(op)) {
			// 获得入住时间
			String checkinday = request.getParameter("checkinday");
			// 获得退房时间
			String checkoutday = request.getParameter("checkoutday");
			// 几晚
			int nights = WeekUtil.daysBetween(checkinday, checkoutday);
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
			String onlinePayAmountShow = request.getParameter("onlinePayAmountShow");
			request.setAttribute("onlinePayAmountShow", onlinePayAmountShow);
			request.setAttribute("orderId", orderId);
			request.setAttribute("accomId", accomId);
			request.setAttribute("accomTitle", accomTitle);
			request.getRequestDispatcher("frontStage/pay.jsp").forward(request, response);
		} else if ("gopay".equals(op)) {
			String onlinePayAmountShow = request.getParameter("onlinePayAmountShow");
			request.setAttribute("onlinePayAmountShow", onlinePayAmountShow);
			request.setAttribute("orderId", orderId);
			request.setAttribute("accomId", accomId);
			request.setAttribute("accomTitle", accomTitle);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}

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
