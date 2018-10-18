package com.etc.huangchong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.UsersService;
import com.etc.huangchong.service.impl.UsersServiceImpl;
import com.etc.huangchong.util.IndustrySMS;
import com.etc.huangchong.util.MD5Util;

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
		PrintWriter out = response.getWriter();

		if ("loginByPwd".equals(op)) {

			String userName = request.getParameter("userName");

			String userPwd = request.getParameter("userPwd");

			userPwd = MD5Util.getEncodeByMd5(userPwd);

			String validationCode = request.getParameter("validationCode");

			HttpSession session = request.getSession();

			String validation_code = (String) session.getAttribute("validation_code");

			if (validationCode.equalsIgnoreCase(validation_code)) {

				Users user = us.getLogin(userName, userPwd);

				if (null != user) {
					session.setAttribute("user", user);
					out.print("2");
				} else {
					out.print("1");
				}
			} else {
				out.print("0");

			}
			out.close();
		} else if ("getByTelNum".equals(op)) {
			String validationCode1 = request.getParameter("validationCode1");
			HttpSession session = request.getSession();
			// 获得原始的图形验证码
			String validation_code1 = (String) session.getAttribute("validation_code1");
			
			if(validationCode1.equalsIgnoreCase(validation_code1)) {
				
				int number_code = (int) ((Math.random() * 9 + 1) * 100000);
				
				String to = request.getParameter("telNum");
				
				String result = IndustrySMS.execute(to, number_code);
				if (null != result) {
					session.setAttribute("number", number_code);
					out.print("1");
				} else {
					out.print("0");
				}
			}else {
				out.print("2");
			}
			out.close();
		} else if ("loginByMsg".equals(op)) {
			// 获得电话号码
			String telNum = request.getParameter("telNum");
			// 获得图形验证码
			String validationCode1 = request.getParameter("validationCode1");
			// 获得手机验证码
			String loginCode = request.getParameter("loginCode");
			// 创建HttpSession对象
			HttpSession session = request.getSession();
			// 获得原始的图形验证码
			String validation_code = (String) session.getAttribute("validation_code1");
			// 获得原始的手机验证码
			Integer number_code = (Integer) session.getAttribute("number");
			// 转换手机验证码的数据类型
			String number = number_code.toString();
			
			if (validationCode1.equalsIgnoreCase(validation_code) && loginCode.equals(number)) {
				// 图形验证码和手机验证码都正确 执行登录
				Users user = us.getLoginByMsg(telNum);
				System.out.println(user);
				if (null != user) {
					// 用户不为空 ，将user放进session中
					session.setAttribute("user", user);
					out.print("3");
				} else {
					// 为空，执行自动增加用户
					List<String> list=new ArrayList<>();
					list.add("/HuangChong/../img/head/1.jpg");
					list.add("/HuangChong/../img/head/2.jpg");
					list.add("/HuangChong/../img/head/3.jpg");
					list.add("/HuangChong/../img/head/4.jpg");
					list.add("/HuangChong/../img/head/5.jpg");
					boolean flag=us.getAddUsersByTel(telNum,telNum,list.get((int)(Math.random()*5)));
					if(flag) {
						user = us.getLoginByMsg(telNum);
						session.setAttribute("user", user);
					   out.print("2");
					}
				}
			} else if (validationCode1.equalsIgnoreCase(validation_code)) {
				// 手机验证码错误
				out.print("1");
			} else {
				// 图形验证码错误
				out.print("0");
			}
			out.close();
		}else if("loginOut".equals(op)) {
			HttpSession session = request.getSession();
			session.invalidate();
			out.print("success");
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
