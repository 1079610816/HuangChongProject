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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("CommentServlet");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String op = request.getParameter("op");
		if("queryComment".equals(op)) {
		List<Comment> list = cs.getQueryComment();
		MyData<Comment> md = new MyData<Comment>();
		md.setData(list);
		Gson gson = new Gson();
		String jsonString = gson.toJson(md);

		// 使用printWriter对象
		PrintWriter out = response.getWriter();

		out.print(jsonString);
		System.out.println("[jsonString] :" + jsonString);

		out.close();
		}else if("commentUpdate".equals(op)) {
			int commentId = Integer.parseInt(request.getParameter("commentId"));
			String content = request.getParameter("content");
			int accomId = Integer.parseInt(request.getParameter("accomId"));
			int userId  = Integer.parseInt(request.getParameter("userId"));
			Comment cm = new Comment(commentId,content,accomId,userId);
			cs.getCommentUpdate(cm);
			request.getRequestDispatcher("cs.do?op=queryComment").forward(request, response);
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
