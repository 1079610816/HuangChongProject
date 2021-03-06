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
import com.etc.huangchong.service.HomestayService;
import com.etc.huangchong.service.impl.HomestayServiceImpl;
import com.etc.huangchong.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class BackStageHomestayServlet
 */
@WebServlet("/hs.do")
public class BackStageHomestayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HomestayService hs=new HomestayServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackStageHomestayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String op=request.getParameter("op");
		PrintWriter out=response.getWriter();
		if("homestaylist".equals(op)) {
			List<Homestay> list=hs.getQueryHomestay();
			MyData<Homestay> mydata=new MyData<>();
			mydata.setData(list);
			Gson gson=new Gson();
			String jsonString=gson.toJson(mydata);
			out.print(jsonString);
			out.close();
		}else if("edit".equals(op)) {
			//System.out.println("民宿编辑");
			int homestayId=Integer.parseInt(request.getParameter("homestayId"));
			String homestayTitle=request.getParameter("homestayTitle");
			String homestayIntro=request.getParameter("homestayIntro");
			String homestayArea=request.getParameter("homestayArea");
			String homestayAddress=request.getParameter("homestayAddress");
			int homestayStatus=Integer.parseInt(request.getParameter("homestayStatus"));
			int houseType=Integer.parseInt(request.getParameter("houseType"));
			double price=Double.parseDouble(request.getParameter("price"));
			String userName=request.getParameter("userName");
			Homestay h=new Homestay(homestayId, homestayTitle, homestayIntro, homestayArea, homestayAddress, homestayStatus, houseType, userName,price);
			hs.getHomestayUpdate(h); 
			request.getRequestDispatcher("hs.do?op=homestaylist").forward(request, response);
		}else if("homestayDelete".equals(op)) {
			//System.out.println("删除了");
			int accomId=Integer.parseInt(request.getParameter("accomId"));
			boolean flag=hs.getHomestayDel(accomId); 
			
		}else if("add".equals(op)) {
			String accomTitle=request.getParameter("accomTitle");
			String accomIntro=request.getParameter("accomIntro");
			String accomArea=request.getParameter("accomArea");
			String accomAddress=request.getParameter("accomAddress");
			int accomStatus=Integer.parseInt(request.getParameter("accomStatus"));
			int houseType=Integer.parseInt(request.getParameter("houseType"));
			double price=Double.parseDouble(request.getParameter("price"));
			int userId=Integer.parseInt(request.getParameter("userId"));
			Homestay h=new Homestay(0, accomTitle, accomIntro, accomArea, accomAddress, accomStatus, houseType, null, price);
			hs.getHomestayAdd(h, userId);
			request.getRequestDispatcher("hs.do?op=homestaylist").forward(request, response);
		}else if("batchDelById".equals(op)) {
			//批量删除的SQL语句
			String sql="DELETE FROM accommodation WHERE accomId IN (";
			//获取批量ID
			String[] accomId = request.getParameterValues("accomId");
			//循环拼接ID
			for (String string : accomId) {
				sql+=string+",";
			} 
			//最后的SQL语句
			sql=sql.substring(0,sql.lastIndexOf(","))+")";
			boolean flag=hs.getHomestayBatchDel(sql);
			
		}
	}
    @Override
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
