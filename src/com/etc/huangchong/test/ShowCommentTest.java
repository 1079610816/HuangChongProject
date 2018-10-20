package com.etc.huangchong.test;

import com.etc.huangchong.dao.ShowCommentDao;
import com.etc.huangchong.dao.impl.ShowCommentDaoImpl;
import com.etc.huangchong.entity.ShowComment;
import com.etc.huangchong.service.ShowCommentService;
import com.etc.huangchong.service.impl.ShowCommentServiceImpl;

public class ShowCommentTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShowCommentDao scd=new ShowCommentDaoImpl();
		/*System.out.println(scd.queryComment(1));
		System.out.println(scd.queryComment(1).size());
		ShowCommentService ss=new ShowCommentServiceImpl();
		System.out.println(ss.getQueryShowComment(1));
		System.out.println(ss.getQueryShowComment(1).size());*/
		System.out.println(scd.landlordPhoto(1));
	}

}
