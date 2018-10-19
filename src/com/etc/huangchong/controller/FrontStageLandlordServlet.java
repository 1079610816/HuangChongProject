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

/**
 * Servlet implementation class FrontStageLandlordServlet
 */
@WebServlet("/ls.action")
public class FrontStageLandlordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private HomestayService hs=new HomestayServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontStageLandlordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   request.setCharacterEncoding("utf-8");
	   response.setCharacterEncoding("uft-8");
	  
	   String op=request.getParameter("op");
	   
	   if("allPublish".equals(op)) {
		   doQueryAllHome(request, response);
	   }else if("published".equals(op)) {
		   doHomeByStatus(request, response);
	   }else if("publishFail".equals(op)) {
		   doHomeByStatus(request, response);
	   }else if("publishing".equals(op)) {
		   doHomeByStatus(request, response);
	   }else if("".equals(op)) {
		   //发布房屋的操作
	   }
	   
	}
	/**通过房屋的状态查询房屋列表
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doHomeByStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accomStatus=request.getParameter("accomStatus");
		List<Homestay>  allHomeList= hs.getQueryLandlordHomestay(1,Integer.parseInt(accomStatus));
		request.setAttribute("allHomeList", allHomeList);
		request.setAttribute("accomStatus", accomStatus);
		request.getRequestDispatcher("frontStage/landlordPublish.jsp").forward(request, response);
	}
	/**查询当前房东的房屋全部列表
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doQueryAllHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accomStatus=request.getParameter("accomStatus");
		 List<Homestay>  allHomeList= hs.getQueryLandlordHomestay(1);
		   request.setAttribute("allHomeList", allHomeList);
		   request.setAttribute("accomStatus", accomStatus);
		   request.getRequestDispatcher("frontStage/landlordPublish.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
