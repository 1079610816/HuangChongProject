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
import com.etc.huangchong.util.PageData;

/**
 * Servlet implementation class FrontStageSearchServlet
 */
@WebServlet("/ss.action")
public class FrontStageSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private SearchService ss = new SearchServiceImpl();
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
		String Area = request.getParameter("Area");
		if("searchlist".equals(op)) {
		List<Homestay> list = ss.getQuerySearch(Area);
		request.setAttribute("list", list);
		request.getRequestDispatcher("frontStage/SearchAccomodation.jsp").forward(request, response);
		}
		if("searchpage".equals(op)) {
			int page = 1;
			int pageSize = 8;
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("pageSize")!=null) {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}
			PageData pd = ss.getQuerySearchPage(page, pageSize, Area);
			request.setAttribute("pd", pd);
			request.getRequestDispatcher("frontStage/SearchAccomodation.jsp").forward(request, response);
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
