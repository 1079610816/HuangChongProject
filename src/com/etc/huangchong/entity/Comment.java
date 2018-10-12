package com.etc.huangchong.entity;

public class Comment {
	//评论实体类
	//评论id
	private int commentId;
	private String content;//评论内容
	private int accomId;//民宿I
	private int userId;//用户id
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAccomId() {
		return accomId;
	}
	public void setAccomId(int accomId) {
		this.accomId = accomId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int commentId, String content, int accomId, int userId) {
		super();
		this.commentId = commentId;
		this.content = content;
		this.accomId = accomId;
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", content=" + content + ", accomId=" + accomId + ", userId="
				+ userId + "]";
	}
	

}
