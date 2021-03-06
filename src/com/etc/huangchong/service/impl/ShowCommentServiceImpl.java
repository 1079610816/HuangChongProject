package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.ShowCommentDao;
import com.etc.huangchong.dao.impl.ShowCommentDaoImpl;
import com.etc.huangchong.entity.FangDong;
import com.etc.huangchong.entity.ShowComment;
import com.etc.huangchong.service.ShowCommentService;
import com.etc.huangchong.util.PageData;

public class ShowCommentServiceImpl implements ShowCommentService {
	ShowCommentDao scd=new ShowCommentDaoImpl();
	@Override
	public List<ShowComment> getQueryShowComment(int userId) {
		List<ShowComment> list = scd.queryComment(userId);
		return list;
	}
	@Override
	public FangDong getLandlordPhoto(int accomId) {
		// TODO Auto-generated method stub
		return scd.landlordPhoto(accomId);
	}
	@Override
	public PageData<ShowComment> getQueryShowCommentByPage(int page, int pageSize, int accomId) {
		// TODO Auto-generated method stub
		return scd.queryCommentByPage(page, pageSize, accomId);
	}
	

}
