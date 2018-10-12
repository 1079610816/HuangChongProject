package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Comment;

public interface CommentDao {
	//显示评论
	List<Comment> queryComment();
	boolean commentUpdate(Comment cm);

}
