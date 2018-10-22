package com.etc.huangchong.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.entity.Orders;
import com.etc.huangchong.entity.Users;
import com.etc.huangchong.service.HomestayService;
import com.etc.huangchong.service.OrderService;
import com.etc.huangchong.service.UsersService;
import com.etc.huangchong.service.impl.HomestayServiceImpl;
import com.etc.huangchong.service.impl.OrderServiceImpl;
import com.etc.huangchong.service.impl.UsersServiceImpl;

/**
 * Servlet implementation class FrontStageLandlordServlet
 */
@WebServlet("/ls.action")
public class FrontStageLandlordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService os = new OrderServiceImpl();
	private HomestayService hs = new HomestayServiceImpl();
    private UsersService us=new UsersServiceImpl();
    // 图片上传配置
 	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 临时存储3MB
 	private static final int MAX_FILE_SIZE = 1024 * 1024 * 10; // 最大上传100MB
 	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 10; // 表单最大请求100MB
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontStageLandlordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
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
		
		if ("allLandlordOrders".equals(op)) {
			doQueryAllOrder(request, response);
		} else if ("payingList".equals(op)) {
			// 待支付
			doQueryAllOrderByLandlord(request, response);
		} else if ("payedList".equals(op)) {
			// 已支付
			doQueryAllOrderByLandlord(request, response);
		} else if ("tradedefeatList".equals(op)) {
			// 交易失败
			doQueryAllOrderByLandlord(request, response);
		} else if ("refundList".equals(op)) {
			// 退款订单
			doQueryAllOrderByLandlord(request, response);
		} else if ("allPublish".equals(op)) {
			// 全部发布的房屋
			doQueryAllHome(request, response);
		} else if ("published".equals(op)) {
			// 发布成功的房屋
			doHomeByStatus(request, response);
		} else if ("publishFail".equals(op)) {
			// 发布失败的房屋
			doHomeByStatus(request, response);
		} else if ("publishing".equals(op)) {
			// 未发布的房屋
			doHomeByStatus(request, response);
		} else if("relHouse".equals(op)) {
			//增加房屋数据
			String accomTitle=request.getParameter("accomTitle");
			String accomIntro=request.getParameter("accomIntro");
			String accomArea=request.getParameter("accomArea");
			String accomAddress=request.getParameter("accomAddress");
			String price=request.getParameter("price");
			Homestay h=new Homestay(accomTitle, accomIntro, accomArea, accomAddress, 1, Double.parseDouble(price), ((Users)request.getSession().getAttribute("user")).getUserId());
			hs.relHouse(h);
			request.getSession().setAttribute("accomId", hs.selAccomId(h));
			request.getSession().setAttribute("index",1);
		}else if("uploadImg".equals(op)) {
			//上传图片保存在本地
			upLoad(request, response);
		} else if("AddUserRealInfo".equals(op)){
			doAddUserRealInfo(request, response);
		}

	}
	
	private void upLoad(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);
		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);
		// 中文处理
		upload.setHeaderEncoding("UTF-8");
		File uploadDir = new File("D:\\eclipse\\apache-tomcat-8.5.13\\webapps\\img\\"+request.getSession().getAttribute("accomId"));
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
			// 解析请求的内容提取文件数据
			List<FileItem> formItems = upload.parseRequest(request);
			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {
					if (!item.isFormField()) {
						synchronized(this) {
							File storeFile = new File("D:\\eclipse\\apache-tomcat-8.5.13\\webapps\\img\\"+request.getSession().getAttribute("accomId")+"\\"+ request.getSession().getAttribute("index") +".jpg");
							// 保存文件到硬盘
							item.write(storeFile);
							if((int)request.getSession().getAttribute("index")<7) {
								request.getSession().setAttribute("index", ((int)request.getSession().getAttribute("index"))+1);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**根据状态查询该房东的订单
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doQueryAllOrderByLandlord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer.parseInt(request.getParameter("userId"));
		int orderStatus;
		List<Orders> orderLandlordList = null;
		orderStatus = Integer.parseInt(request.getParameter("orderStatus"));
		orderLandlordList = os.getQueryLandlordOrder(userId, orderStatus);
		request.setAttribute("orderStatus", orderStatus);
		request.setAttribute("orderLandlordList", orderLandlordList);
		request.getRequestDispatcher("frontStage/landlordOrder.jsp").forward(request, response);
	}

	/**查询该房东的全部订单
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doQueryAllOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int orderStatus = -1;
		List<Orders> orderLandlordList = null;
		int userId = Integer.parseInt(request.getParameter("userId"));
		orderLandlordList = os.getQueryLandlordOrder(userId);
		request.setAttribute("orderStatus", orderStatus);
		request.setAttribute("orderLandlordList", orderLandlordList);
		request.getRequestDispatcher("frontStage/landlordOrder.jsp").forward(request, response);
	}

	/**
	 * 通过房屋的状态查询房屋列表
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doHomeByStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accomStatus = request.getParameter("accomStatus");
		int userId = Integer.parseInt(request.getParameter("userId"));
		List<Homestay> allHomeList = hs.getQueryLandlordHomestay(userId, Integer.parseInt(accomStatus));
		request.setAttribute("allHomeList", allHomeList);
		request.setAttribute("accomStatus", accomStatus);
		request.getRequestDispatcher("frontStage/landlordPublish.jsp").forward(request, response);
	}

	/**
	 * 查询当前房东的房屋全部列表
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doQueryAllHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer.parseInt(request.getParameter("userId"));
		int accomStatus=4;
		List<Homestay> allHomeList = hs.getQueryLandlordHomestay(userId);		
		request.setAttribute("allHomeList", allHomeList);
		request.setAttribute("accomStatus", accomStatus);
		request.getRequestDispatcher("frontStage/landlordPublish.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doAddUserRealInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String userId=request.getParameter("userId");
		String realName=request.getParameter("realName");
		String identityCard=request.getParameter("identityCard");
		boolean flag=us.getAddUserRealInfo(realName, identityCard, Integer.parseInt(userId));
		if(flag) {
			out.print("success");
		}else {
			out.print("fail");
		}
		out.close();
	}
	@Override
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
