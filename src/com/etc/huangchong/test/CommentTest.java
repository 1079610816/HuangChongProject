package com.etc.huangchong.test;

import java.util.List;

import com.etc.huangchong.entity.Comment;
import com.etc.huangchong.service.CommentService;
import com.etc.huangchong.service.impl.CommentServiceImpl;

public class CommentTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CommentService cs = new CommentServiceImpl();
		List<Comment> list = cs.getQueryComment();
		list.forEach(System.out::println);

	}

}
