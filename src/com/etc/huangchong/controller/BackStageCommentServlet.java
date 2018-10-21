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
import com.etc.huangchong.entity.Comment;
import com.etc.huangchong.service.CommentService;
import com.etc.huangchong.service.impl.CommentServiceImpl;
import com.etc.huangchong.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class BackStageCommentServlet
 */
@WebServlet("/cs.do")
public class BackStageCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentService cs = new CommentServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackStageCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		
		String op = request.getParameter("op");
		if("queryComment".equals(op)) {
		doList(request,response);
		}else if("commentUpdate".equals(op)) {
			int commentId = Integer.parseInt(request.getParameter("commentId"));
			String content = request.getParameter("content");
			int accomId = Integer.parseInt(request.getParameter("accomId"));
			int userId  = Integer.parseInt(request.getParameter("userId"));
			Comment cm = new Comment(commentId,content,accomId,userId);
			cs.getCommentUpdate(cm);
			request.getRequestDispatcher("cs.do?op=queryComment").forward(request, response);
		}else if("commentDelete".equals(op)) {
			int commentId = Integer.parseInt(request.getParameter("commentId"));
			boolean flag = cs.getCommentDelete(commentId);
			if(flag) {
				//如果成功，就在查询删除后的列表传给显示页面
				doList(request,response);
			}else {
				
			}
			
		}else if("batchDelete".equals(op)) {
			//批量删除的SQL语句
			String sql="DELETE FROM comment WHERE commentId IN (";
			//获取批量ID
			String[] commentId = request.getParameterValues("commentId");
			PrintWriter out = response.getWriter();
			//循环拼接ID
			for (String string : commentId) {
				sql+=string+",";
			}
			//最后的SQL语句
			sql=sql.substring(0,sql.lastIndexOf(","))+")";
			boolean flag = cs.getCommentBatchDelete(sql);
			if(flag) {
				out.println(flag);				
			}else {
				out.println(flag);
			}

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
	/**
	 * 封装成一个doList方法调用
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Comment> list = cs.getQueryComment();
		MyData<Comment> md = new MyData<Comment>();
		md.setData(list);
		Gson gson = new Gson();
		String jsonString = gson.toJson(md);

		// 使用printWriter对象
		PrintWriter out = response.getWriter();

		out.print(jsonString);

		out.close();
	}

}
