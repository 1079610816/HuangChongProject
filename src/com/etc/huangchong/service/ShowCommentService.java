package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.ShowComment;

public interface ShowCommentService {
	List<ShowComment> getQueryShowComment(int userId);
}
