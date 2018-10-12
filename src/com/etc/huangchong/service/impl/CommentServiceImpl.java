package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.CommentDao;
import com.etc.huangchong.dao.impl.CommentDaoImpl;
import com.etc.huangchong.entity.Comment;
import com.etc.huangchong.service.CommentService;

public class CommentServiceImpl implements CommentService {
	private CommentDao cd = new CommentDaoImpl();

	@Override
	public List<Comment> getQueryComment() {
		// TODO Auto-generated method stub
		return cd.queryComment();
	}

}
