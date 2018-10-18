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
		//获得入住时间
		String inday = request.getParameter("inday");
		//获得退房时间
		String outday = request.getParameter("outday");
		//详情页获得的入住人数
		String peopleNum = request.getParameter("peopleNum");
		//民宿单天单价
		String price = request.getParameter("price");
		//用户订单总价
		String totalPrice = request.getParameter("totalPrice");
		//几晚
		String nights = request.getParameter("nights");
		request.setAttribute("inday", "2018-10-16");
		request.setAttribute("outday", "2018-10-28");
		request.setAttribute("checkinOfWeek", WeekUtil.CalculateWeekDay("2018-10-16"));
		request.setAttribute("checkoutOfWeek", WeekUtil.CalculateWeekDay("2018-10-28"));
		request.setAttribute("peopleNum", "3");
		request.setAttribute("price", 100);
		request.setAttribute("totalPrice", 200);
		request.setAttribute("nights", WeekUtil.daysBetween("2018-10-16", "2018-10-28"));
		request.getRequestDispatcher("frontStage/bookorder.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
