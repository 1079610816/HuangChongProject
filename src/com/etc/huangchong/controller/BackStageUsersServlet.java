package com.etc.huangchong.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.UsersService;
import com.etc.huangchong.service.impl.UsersServiceImpl;
import com.etc.huangchong.util.MD5Util;
import com.etc.huangchong.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/us.do")
public class BackStageUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersService us = new UsersServiceImpl();
	private static final String UPLOAD_DIRECTORY = "img";

	/**构造函数
	 * @see HttpServlet#HttpServlet()
	 */
	public BackStageUsersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**doget请求
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
		if ("queryAll".equals(op)) {
			doList(request, response);
		} else if ("userAdd".equals(op)) {
			doAddUser(request, response);
		} else if ("delUser".equals(op)) {
			doDelUser(request, response);
		} else if ("updateUsers".equals(op)) {
			doUpdateUsers(request, response);
		} else if ("batchDel".equals(op)) {
			doBatchDelUsers(request, response);
		} else if ("resetPassword".equals(op)) {
			doChangePassword(request, response);
		}else if("usersChecked".equals(op)){
			doUsersChecked(request, response);
		}
	}

	/**
	 * 查询所有用户
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 查询所有用户
		List<Users> list = us.getAllUsers();
		// 创建myData的对象
		MyData<Users> mydata = new MyData<>();
		// 将所有的用户存储到MyData
		mydata.setData(list);
		// 创建gson对象
		Gson gson = new Gson();
		// 调用gson的方法
		String jsonString = gson.toJson(mydata);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.close();
	}

	/**
	 * 增加用户
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doAddUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 得到一个临时的目录
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// 文件上传操作的对象
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Tomcat当前目录下img文件夹
		String imgPath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY;
		// 如果目录不存在则创建
		File uploadDir = new File(imgPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		String userName = "", userPwd = "", nickName = "", imgUrl = "";
		// 解析对象
		try {
			List<FileItem> items = upload.parseRequest(request);
			// 对集合进行处理
			Iterator<FileItem> iter = items.iterator();

			while (iter.hasNext()) {

				FileItem item = iter.next();
				if (item.isFormField()) {
					// 非文件域
					String name = item.getFieldName();
					String value = item.getString("utf-8");
					if (name.equals("userName")) {
						userName = value;
						nickName = value;
					} else {
						userPwd = value;
					}
				} else {

					String fileName = new File(item.getName()).getName();
					String filePath = imgPath + File.separator + fileName;
					File storeFile = new File(filePath);	
					imgUrl = filePath;
					// 保存文件到硬盘
					item.write(storeFile);
					request.setAttribute("message", "文件上传成功!");
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获取表单数据
		userPwd = MD5Util.getEncodeByMd5(userPwd);

		// 创建用户对象
		Users users = new Users(userName, userPwd, nickName, imgUrl);
		// 调用增加的方法
		boolean flag = us.AddUsers(users);
		// 创建gson对象
		Gson gson = new Gson();
		// 调用gson的方法
		String jsonString = gson.toJson(flag);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.close();
	}
	
	/**
	 * 删除用户
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doDelUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		boolean flag = us.delUsers(Integer.parseInt(userId));
		if (flag) {
			// 创建gson对象
			Gson gson = new Gson();
			// 调用gson的方法
			String jsonString = gson.toJson(flag);
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.close();
		} else {
			doList(request, response);
		}
	}

	/**
	 * 更新用户
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doUpdateUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 得到一个临时的目录
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// 文件上传操作的对象
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Tomcat当前目录下img文件夹
		String imgPath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY;
		// 如果目录不存在则创建
		File uploadDir = new File(imgPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		String userName = "", telNum = "", nickName = "", imgUrl = "", userId = "";
		// 解析对象
		try {
			List<FileItem> items = upload.parseRequest(request);
			// 对集合进行处理
			Iterator<FileItem> iter = items.iterator();
			while (iter.hasNext()) {

				FileItem item = iter.next();

				if (item.isFormField()) {
					// 非文件域
					String name = item.getFieldName();
					String value = item.getString("utf-8");
					if (name.equals("userName")) {
						userName = value;
					} else if (name.equals("nickName")) {
						nickName = value;
					} else if (name.equals("telNum")) {
						telNum = value;
					} else {
						userId = value;
					}
				} else {
					String fileName = new File(item.getName()).getName();
					String filePath = imgPath + File.separator + fileName;
					File storeFile = new File(filePath);

					imgUrl = filePath;
					// 保存文件到硬盘
					item.write(storeFile);
					request.setAttribute("message", "文件上传成功!");
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Users users = new Users(Integer.parseInt(userId), userName, nickName, telNum, imgUrl);
		boolean flag = us.updateUsers(users);
		// 创建gson对象
		Gson gson = new Gson();
		// 调用gson的方法
		String jsonString = gson.toJson(flag);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.close();

	}

	/**
	 * 批量删除
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doBatchDelUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 批量删除的SQL语句
		String sql = "DELETE FROM users WHERE userId IN (";
		// 获取批量ID
		String[] userId = request.getParameterValues("userId");
		// 循环拼接ID
		for (String string : userId) {
			sql += string + ",";
		}
		// 最后的SQL语句
		sql = sql.substring(0, sql.lastIndexOf(",")) + ")";
		boolean flag = us.getBatchDelUsers(sql);
		if (flag) {
			PrintWriter out = response.getWriter();
			out.print(flag);
			out.close();
		} else {
			doList(request, response);
		}
	}

	/**
	 * 修改密码
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		boolean flag = us.getResetPassword(Integer.parseInt(userId));
		if (flag) {
			PrintWriter out = response.getWriter();
			out.print(flag);
			out.close();
		} else {
			doList(request, response);
		}
	}

	/**
	 * 修改用户的身份审核状态
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doUsersChecked(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String identityCard=request.getParameter("identityCard");
		String state=request.getParameter("state");
		boolean flag =us.getChangeState(Integer.parseInt(state), identityCard);
		if (flag) {
			PrintWriter out = response.getWriter();
			out.print(flag);
			out.close();
		} else {
			doList(request, response);
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
