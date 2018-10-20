package com.etc.huangchong.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.huangchong.entity.FangDong;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.entity.ShowComment;
import com.etc.huangchong.service.HomestayService;
import com.etc.huangchong.service.SearchService;
import com.etc.huangchong.service.ShowCommentService;
import com.etc.huangchong.service.impl.HomestayServiceImpl;
import com.etc.huangchong.service.impl.SearchServiceImpl;
import com.etc.huangchong.service.impl.ShowCommentServiceImpl;
import com.etc.huangchong.util.PageData;

/**
 * Servlet implementation class FrontStageSearchServlet
 */
@WebServlet("/ss.action")
public class FrontStageSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SearchService ss = new SearchServiceImpl();
	private HomestayService hs = new HomestayServiceImpl();
	private ShowCommentService scs = new ShowCommentServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontStageSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String op = request.getParameter("op");
		String Area = request.getParameter("Area");
		if ("searchlist".equals(op)) {
			List<Homestay> list = ss.getQuerySearch(Area);
			request.setAttribute("list", list);
			request.getRequestDispatcher("frontStage/SearchAccomodation.jsp").forward(request, response);
		} else if ("searchpage".equals(op)) {
			int page = 1;
			int pageSize = 4;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			if (request.getParameter("pageSize") != null) {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}
			PageData<Homestay>  pd = ss.getQuerySearchPage(page, pageSize, Area);
			request.setAttribute("pd", pd);
			request.getRequestDispatcher("frontStage/SearchAccomodation.jsp").forward(request, response);
		} else if ("todetailPage".equals(op)) {
			int page = 1;
			int pageSize = 4;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			if (request.getParameter("pageSize") != null) {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			}
			int accomId = Integer.parseInt(request.getParameter("accomId"));
			Homestay h = hs.getSingleHomestay(accomId);
			request.setAttribute("homestay", h);
			PageData<ShowComment> pd = scs.getQueryShowCommentByPage(page, pageSize, accomId);
			request.setAttribute("pd", pd);
			FangDong fd=scs.getLandlordPhoto(accomId);
			request.setAttribute("fd", fd);
			request.getRequestDispatcher("frontStage/detail.jsp").forward(request, response);
			
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
