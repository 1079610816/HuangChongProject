package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.ShowComment;

public interface ShowCommentDao {
	List<ShowComment> queryComment(int accomId);

}
