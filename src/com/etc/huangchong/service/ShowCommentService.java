package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.FangDong;
import com.etc.huangchong.entity.ShowComment;
import com.etc.huangchong.util.PageData;

public interface ShowCommentService {
	List<ShowComment> getQueryShowComment(int userId);
	
	FangDong getLandlordPhoto(int accomId);
	//评论分页
	PageData<ShowComment> getQueryShowCommentByPage(int page,int pageSize,int accomId);
} 
