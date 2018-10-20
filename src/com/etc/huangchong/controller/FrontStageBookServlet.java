package com.etc.huangchong.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.util.WeekUtil;

/**
 * Servlet implementation class FrontStageBookServlet
 */
@WebServlet("/bs.action")
public class FrontStageBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontStageBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String op = request.getParameter("op");
		if("bookOrder".equals(op)) {
		//获得入住时间
		String checkinday = request.getParameter("checkinday");
		//获得退房时间
		String checkoutday = request.getParameter("checkoutday");
		//民宿单天单价
		String price = request.getParameter("price");
		//订单编号
		String orderId = request.getParameter("orderId");
		//几晚
		int nights = WeekUtil.daysBetween(checkinday, checkoutday);
		request.setAttribute("checkinday", checkinday);
		request.setAttribute("checkoutday", checkoutday);
		request.setAttribute("checkinOfWeek", WeekUtil.CalculateWeekDay(checkinday));
		request.setAttribute("checkoutOfWeek", WeekUtil.CalculateWeekDay(checkoutday));
		request.setAttribute("price", price);
		request.setAttribute("nights",nights);
		request.setAttribute("orderId",orderId);
		request.getRequestDispatcher("frontStage/bookorder.jsp").forward(request, response);
		}else if("pay".equals(op)) {
			String onlinePayAmountShow = request.getParameter("onlinePayAmountShow");
			request.setAttribute("onlinePayAmountShow", onlinePayAmountShow);
			request.getRequestDispatcher("frontStage/pay.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
