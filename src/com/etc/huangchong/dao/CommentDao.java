package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Comment;

public interface CommentDao {
	//显示评论
	List<Comment> queryComment();
	//修改评论
	boolean commentUpdate(Comment cm);
	//根据commentId删除评论
	boolean commentDelete(int commentId);

}
