package com.etc.huangchong.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.service.SearchService;
import com.etc.huangchong.service.impl.SearchServiceImpl;

/**
 * Servlet implementation class FrontStageSearchServlet
 */
@WebServlet("/ss.action")
public class FrontStageSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontStageSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String op = request.getParameter("op");
		SearchService ss = new SearchServiceImpl();
		List<Homestay> list = ss.getQuerySearch(op);
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("frontStage/SearchAccomodation.jsp").forward(request, response);
		/*if("厦门".equals(op)) {
			request.getRequestDispatcher("frontStage/xiamen.jsp").forward(request, response);
		}else if("福州".equals(op)) {
			request.getRequestDispatcher("frontStage/fuzhou.jsp").forward(request, response);
		}else if("泉州".equals(op)) {
			request.getRequestDispatcher("frontStage/quanzhou.jsp").forward(request, response);
		}else if("漳州".equals(op)) {
			request.getRequestDispatcher("frontStage/fuzhou.jsp").forward(request, response);
		}else if("泉州".equals(op)) {
			request.getRequestDispatcher("frontStage/fuzhou.jsp").forward(request, response);
		}else if("泉州".equals(op)) {
			request.getRequestDispatcher("frontStage/fuzhou.jsp").forward(request, response);
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
