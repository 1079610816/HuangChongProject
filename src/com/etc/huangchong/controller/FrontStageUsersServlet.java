package com.etc.huangchong.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.UsersService;
import com.etc.huangchong.service.impl.UsersServiceImpl;

/**
 * Servlet implementation class FrontStageUsersServlet
 */
@WebServlet("/us.action")
public class FrontStageUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersService us = new UsersServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontStageUsersServlet() {
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
		String op = request.getParameter("op");
		if ("".equals(op)) {
			String username = request.getParameter("username");

			String password = request.getParameter("password");

			String validationCode = request.getParameter("validationCode");

			HttpSession session = request.getSession();

			String validation_code = (String) session.getAttribute("validation_code");

			if (validationCode.equalsIgnoreCase(validation_code)) {
				Users users = us.getLogin(username, password);
				if (null != users) {
					session.setAttribute("users", users);

					request.getRequestDispatcher("index.html").forward(request, response);
				} else {
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			} else {
				System.out.println("验证码错误");

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

}
