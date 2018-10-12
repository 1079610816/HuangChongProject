package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.CommentDao;
import com.etc.huangchong.entity.Comment;
import com.etc.huangchong.util.BaseDao;

public class CommentDaoImpl implements CommentDao {
/**
 * 显示用户评论
 */
	@Override
	public List<Comment> queryComment() {
		// TODO Auto-generated method stub
		String sql = "select * from comment";
		List<Comment> list = (List<Comment>)BaseDao.select(sql, Comment.class);
		return list;
	}

}
