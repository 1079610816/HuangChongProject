package com.etc.huangchong.entity;

public class Homestay {
	private int accomId;
	private String accomTitle;
	private String accomIntro;
	private String accomArea;
	private String accomAddress;
	private int accomStatus;
	private int houseType;
	private String userName;
	private double price;



	private int commentsum;
	private int userId;
	public Homestay() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	/**
	 * 没有单价的构造
	 * @param accomId
	 * @param accomTitle
	 * @param accomIntro
	 * @param accomArea
	 * @param accomAddress
	 * @param accomStatus
	 * @param houseType
	 * @param userName
	 */
	public Homestay(int accomId, String accomTitle, String accomIntro, String accomArea, String accomAddress,
			int accomStatus, int houseType, String userName) {
		super();
		this.accomId = accomId;
		this.accomTitle = accomTitle;
		this.accomIntro = accomIntro;
		this.accomArea = accomArea;
		this.accomAddress = accomAddress;
		this.accomStatus = accomStatus;
		this.houseType = houseType;
		this.userName = userName;
	}
	/**
	 * 不带评论条数commentsum参数的构造
	 * @param accomId
	 * @param accomTitle
	 * @param accomIntro
	 * @param accomArea
	 * @param accomAddress
	 * @param accomStatus
	 * @param houseType
	 * @param userName
	 * @param price
	 */
	public Homestay(int accomId, String accomTitle, String accomIntro, String accomArea, String accomAddress,
			int accomStatus, int houseType, String userName, double price) {
		super();
		this.accomId = accomId;
		this.accomTitle = accomTitle;
		this.accomIntro = accomIntro;
		this.accomArea = accomArea;
		this.accomAddress = accomAddress;
		this.accomStatus = accomStatus;
		this.houseType = houseType;
		this.userName = userName;
		this.price = price;
	}


/**
 * 不含userId参数的构造
 * @param accomId
 * @param accomTitle
 * @param accomIntro
 * @param accomArea
 * @param accomAddress
 * @param accomStatus
 * @param houseType
 * @param userName
 * @param price
 * @param commentsum
 */
	public Homestay(int accomId, String accomTitle, String accomIntro, String accomArea, String accomAddress,
			int accomStatus, int houseType, String userName, double price, int commentsum) {
		super();
		this.accomId = accomId;
		this.accomTitle = accomTitle;
		this.accomIntro = accomIntro;
		this.accomArea = accomArea;
		this.accomAddress = accomAddress;
		this.accomStatus = accomStatus;
		this.houseType = houseType;
		this.userName = userName;
		this.price = price;
		this.commentsum = commentsum;
	}
	
/**
 * 带全部参数构造
 * @param accomId
 * @param accomTitle
 * @param accomIntro
 * @param accomArea
 * @param accomAddress
 * @param accomStatus
 * @param houseType
 * @param userName
 * @param price
 * @param commentsum
 * @param userId
 */

	public Homestay(int accomId, String accomTitle, String accomIntro, String accomArea, String accomAddress,
		int accomStatus, int houseType, String userName, double price, int commentsum, int userId) {
	super();
	this.accomId = accomId;
	this.accomTitle = accomTitle;
	this.accomIntro = accomIntro;
	this.accomArea = accomArea;
	this.accomAddress = accomAddress;
	this.accomStatus = accomStatus;
	this.houseType = houseType;
	this.userName = userName;
	this.price = price;
	this.commentsum = commentsum;
	this.userId = userId;
}


	
	public Homestay(String accomTitle, String accomIntro, String accomArea, String accomAddress, int accomStatus,
		double price, int userId) {
	super();
	this.accomTitle = accomTitle;
	this.accomIntro = accomIntro;
	this.accomArea = accomArea;
	this.accomAddress = accomAddress;
	this.accomStatus = accomStatus;
	this.price = price;
	this.userId = userId;
}


	public int getCommentsum() {
		return commentsum;
	}


	public void setCommentsum(int commentsum) {
		this.commentsum = commentsum;
	}


	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	public int getAccomId() {
		return accomId;
	}
	public void setAccomId(int accomId) {
		this.accomId = accomId;
	}
	public String getAccomTitle() {
		return accomTitle;
	}
	public void setAccomTitle(String accomTitle) {
		this.accomTitle = accomTitle;
	}
	public String getAccomIntro() {
		return accomIntro;
	}
	public void setAccomIntro(String accomIntro) {
		this.accomIntro = accomIntro;
	}
	public String getAccomArea() {
		return accomArea;
	}
	public void setAccomArea(String accomArea) {
		this.accomArea = accomArea;
	}
	public String getAccomAddress() {
		return accomAddress;
	}
	public void setAccomAddress(String accomAddress) {
		this.accomAddress = accomAddress;
	}
	public int getAccomStatus() {
		return accomStatus;
	}
	public void setAccomStatus(int accomStatus) {
		this.accomStatus = accomStatus;
	}
	public int getHouseType() {
		return houseType;
	}
	public void setHouseType(int houseType) {
		this.houseType = houseType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Homestay [accomId=" + accomId + ", accomTitle=" + accomTitle + ", accomIntro=" + accomIntro
				+ ", accomArea=" + accomArea + ", accomAddress=" + accomAddress + ", accomStatus=" + accomStatus
				+ ", houseType=" + houseType + ", userName=" + userName + ", price=" + price + ", commentsum="
				+ commentsum + ", userId=" + userId + "]";
	}



	

	
	
	
	
	
	
}
