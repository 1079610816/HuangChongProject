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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
