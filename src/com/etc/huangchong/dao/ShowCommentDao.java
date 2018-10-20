package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.FangDong;
import com.etc.huangchong.entity.ShowComment;
import com.etc.huangchong.util.PageData;

public interface ShowCommentDao {
	List<ShowComment> queryComment(int accomId); 
	
	FangDong landlordPhoto(int accomId);
	PageData<ShowComment> queryCommentByPage(int page,int pageSize,int accomId);
}
