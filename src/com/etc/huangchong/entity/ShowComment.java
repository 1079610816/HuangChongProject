package com.etc.huangchong.entity;

public class ShowComment {
	//评论内容
	private String content ; 
	//用户昵称
	private String nickName ; 
	//用户头像路径
	private String imgUrl;
	
	//无参构造
	public ShowComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	//有参构造
	public ShowComment(String content, String nickName, String imgUrl) {
		super();
		this.content = content;
		this.nickName = nickName;
		this.imgUrl = imgUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "ShowComment [content=" + content + ", nickName=" + nickName + ", imgUrl=" + imgUrl + "]";
	}
	
	

}
