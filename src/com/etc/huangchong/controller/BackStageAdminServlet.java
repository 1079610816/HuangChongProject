package com.etc.huangchong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Admin;
import com.etc.huangchong.service.AdminService;
import com.etc.huangchong.service.impl.AdminServiceImpl;
import com.etc.huangchong.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class BackStageAdminServlet
 */
@WebServlet("/as.do")
public class BackStageAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService as = new AdminServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BackStageAdminServlet() {
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
		response.setContentType("application/json");
		String op = request.getParameter("op");
		if ("queryAdmin".equals(op)) {
			doList(request, response);
		} else if ("adminDelete".equals(op)) {
			String adminName = request.getParameter("adminName");
			System.out.println("adminName:"+adminName);
			boolean flag = as.getDeleteByAdminName(adminName);
			if (flag) {
				// 如果成功，就在查询删除后的列表传给显示页面
				doList(request, response);

			} else {
				System.out.println("删除失败");
			}
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

	/**
	 * 显示管理员
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Admin> list = as.getQueryAdmin();
		MyData<Admin> md = new MyData<Admin>();
		md.setData(list);
		Gson gson = new Gson();
		String jsonString = gson.toJson(md);

		// 使用printWriter对象
		PrintWriter out = response.getWriter();

		out.print(jsonString);
		System.out.println("[jsonString] :" + jsonString);

		out.close();
	}

}
