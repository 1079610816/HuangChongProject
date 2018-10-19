package com.etc.huangchong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.service.HomestayService;
import com.etc.huangchong.service.OrderService;
import com.etc.huangchong.service.UsersService;
import com.etc.huangchong.service.impl.HomestayServiceImpl;
import com.etc.huangchong.service.impl.OrderServiceImpl;
import com.etc.huangchong.service.impl.UsersServiceImpl;

/**
 * Servlet implementation class FrontStageLandlordServlet
 */
@WebServlet("/ls.action")
public class FrontStageLandlordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService os = new OrderServiceImpl();
	private HomestayService hs = new HomestayServiceImpl();
    private UsersService us=new UsersServiceImpl();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontStageLandlordServlet() {
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
		response.setCharacterEncoding("uft-8");

		String op = request.getParameter("op");
		
		if ("allLandlordOrders".equals(op)) {
			doQueryAllOrder(request, response);
		} else if ("payingList".equals(op)) {
			// 待支付
			doQueryAllOrderByLandlord(request, response);
		} else if ("payedList".equals(op)) {
			// 已支付
			doQueryAllOrderByLandlord(request, response);
		} else if ("tradedefeatList".equals(op)) {
			// 交易失败
			doQueryAllOrderByLandlord(request, response);
		} else if ("refundList".equals(op)) {
			// 退款订单
			doQueryAllOrderByLandlord(request, response);
		} else if ("allPublish".equals(op)) {
			// 全部发布的房屋
			doQueryAllHome(request, response);
		} else if ("published".equals(op)) {
			// 发布成功的房屋
			doHomeByStatus(request, response);
		} else if ("publishFail".equals(op)) {
			// 发布失败的房屋
			doHomeByStatus(request, response);
		} else if ("publishing".equals(op)) {
			// 未发布的房屋
			doHomeByStatus(request, response);
		} else if ("".equals(op)) {
			// 发布房屋的操作
		} else if("AddUserRealInfo".equals(op)){
			doAddUserRealInfo(request, response);
		}

	}

	/**根据状态查询该房东的订单
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doQueryAllOrderByLandlord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = 1;
		int orderStatus;
		List<Orders> orderLandlordList = null;
		orderStatus = Integer.parseInt(request.getParameter("orderStatus"));
		orderLandlordList = os.getQueryLandlordOrder(userId, orderStatus);
		request.setAttribute("orderStatus", orderStatus);
		request.setAttribute("orderLandlordList", orderLandlordList);
		request.getRequestDispatcher("frontStage/landlordOrder.jsp").forward(request, response);
	}

	/**查询该房东的全部订单
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doQueryAllOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int orderStatus = -1;
		List<Orders> orderLandlordList = null;
		orderLandlordList = os.getQueryLandlordOrder(1);
		request.setAttribute("orderStatus", orderStatus);
		request.setAttribute("orderLandlordList", orderLandlordList);
		request.getRequestDispatcher("frontStage/landlordOrder.jsp").forward(request, response);
	}

	/**
	 * 通过房屋的状态查询房屋列表
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doHomeByStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accomStatus = request.getParameter("accomStatus");
		List<Homestay> allHomeList = hs.getQueryLandlordHomestay(1, Integer.parseInt(accomStatus));
		request.setAttribute("allHomeList", allHomeList);
		request.setAttribute("accomStatus", accomStatus);
		request.getRequestDispatcher("frontStage/landlordPublish.jsp").forward(request, response);
	}

	/**
	 * 查询当前房东的房屋全部列表
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doQueryAllHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int accomStatus=4;
		List<Homestay> allHomeList = hs.getQueryLandlordHomestay(1);		
		request.setAttribute("allHomeList", allHomeList);
		request.setAttribute("accomStatus", accomStatus);
		request.getRequestDispatcher("frontStage/landlordPublish.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doAddUserRealInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String userId=request.getParameter("userId");
		String realName=request.getParameter("realName");
		String identityCard=request.getParameter("identityCard");
		boolean flag=us.getAddUserRealInfo(realName, identityCard, Integer.parseInt(userId));
		if(flag) {
			out.print("success");
		}else {
			out.print("fail");
		}
		out.close();
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
