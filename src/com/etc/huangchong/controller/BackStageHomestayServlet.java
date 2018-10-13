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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String op=request.getParameter("op");
		if(op.equals("homestaylist")) {
			List<Homestay> list=hs.getQueryHomestay();
			MyData<Homestay> mydata=new MyData<>();
			mydata.setData(list);
			Gson gson=new Gson();
			String jsonString=gson.toJson(mydata);
			PrintWriter out=response.getWriter();
			out.print(jsonString);
			out.close();
		}else if(op.equals("edit")) {
			System.out.println("民宿编辑");
			int homestayId=Integer.parseInt(request.getParameter("homestayId"));
			String homestayTitle=request.getParameter("homestayTitle");
			String homestayIntro=request.getParameter("homestayIntro");
			String homestayArea=request.getParameter("homestayArea");
			String homestayAddress=request.getParameter("homestayAddress");
			int homestayStatus=Integer.parseInt(request.getParameter("homestayStatus"));
			int peopleNum=Integer.parseInt(request.getParameter("peopleNum"));
			String userName=request.getParameter("userName");
			Homestay h=new Homestay(homestayId, homestayTitle, homestayIntro, homestayArea, homestayAddress, homestayStatus, peopleNum, userName);
			hs.getHomestayUpdate(h);
			request.getRequestDispatcher("hs.do?op=homestaylist").forward(request, response);
		}else if(op.equals("homestayDelete")) {
			System.out.println("删除了");
			int accomId=Integer.parseInt(request.getParameter("accomId"));
			boolean flag=hs.getHomestayDel(accomId);
			if(flag) {
				request.getRequestDispatcher("hs.do?op=homestaylist").forward(request, response);
			}else {
				System.out.println("删除失败");
			}
			
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
