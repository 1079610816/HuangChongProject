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
		String sql = "SELECT comment.commentId,comment.content,accommodation.accomTitle,users.userName FROM comment,accommodation,users where comment.userId = users.userId and comment.accomId = accommodation.accomId";
		List<Comment> list = (List<Comment>) BaseDao.select(sql, Comment.class);
		return list;
	}
	/**
	 * 修改评论
	 */
	@Override
	public boolean commentUpdate(Comment cm) {
		// TODO Auto-generated method stub
		String sql = "update comment set content = ? where commentId = ?";

		return BaseDao.execute(sql, cm.getContent(), cm.getCommentId()) > 0;
	}
/**
 * 删除评论
 */
	@Override
	public boolean commentDelete(int commentId) {
		// TODO Auto-generated method stub
		String sql = "delete from comment where commentId = ?";
		return BaseDao.execute(sql, commentId) > 0;
	}
	/**
	 * 批量删除
	 */
	@Override
	public boolean commentBatchDelete(String sql) {
		// TODO Auto-generated method stub
		return BaseDao.execute(sql)>0;
	}

}
