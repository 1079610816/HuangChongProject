package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Comment;

public interface CommentService {
	//显示评论列表
	List<Comment> getQueryComment();
	//修改评论
	boolean getCommentUpdate(Comment cm);
	//删除评论
	boolean getCommentDelete(int commentId);
	//批量删除
	boolean getCommentBatchDelete(String sql);

}
