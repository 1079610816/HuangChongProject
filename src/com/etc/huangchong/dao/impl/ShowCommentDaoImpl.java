package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.ShowCommentDao;
import com.etc.huangchong.entity.FangDong;
import com.etc.huangchong.entity.ShowComment;
import com.etc.huangchong.util.BaseDao;

public class ShowCommentDaoImpl implements ShowCommentDao {

	@Override
	public List<ShowComment> queryComment(int accomId) { 
		// TODO Auto-generated method stub
		String sql="SELECT comment.content,users.nickName,users.imgUrl FROM comment LEFT JOIN users on comment.userId = users.userId WHERE comment.accomId=?";
		List<ShowComment> list=(List<ShowComment>)BaseDao.select(sql, ShowComment.class, accomId);
		return list;
	}

	@Override
	public FangDong landlordPhoto(int accomId) {
		String sql="select users.imgUrl as headImage from accommodation inner join users on accommodation.userId = users.userId where accommodation.accomId = ?";
		List<FangDong> list=(List<FangDong>)BaseDao.select(sql, FangDong.class, accomId);
		return list.get(0);
	}

}
