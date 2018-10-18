package com.etc.huangchong.entity;

public class Orders {
	
	private int orderId;
	private String bookTime;
	private String unsubscribeTime;
	private double fee;
	private int orderStatus;
	private int accomId;
	private String accomTitle;
	private String accomAddress;
	private String userName;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getBookTime() {
		return bookTime;
	}
	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}
	public String getUnsubscribeTime() {
		return unsubscribeTime;
	}
	public void setUnsubscribeTime(String unsubscribeTime) {
		this.unsubscribeTime = unsubscribeTime;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
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
	public String getAccomAddress() {
		return accomAddress;
	}
	public void setAccomAddress(String accomAddress) {
		this.accomAddress = accomAddress;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * 无参构造
	 */
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int orderId, String bookTime, String unsubscribeTime, double fee, int orderStatus, String accomTitle,
			String userName) {
		super();
		this.orderId = orderId;
		this.bookTime = bookTime;
		this.unsubscribeTime = unsubscribeTime;
		this.fee = fee;
		this.orderStatus = orderStatus;
		this.accomTitle = accomTitle;
		this.userName = userName;
	}
	/**
	 * 不带accomTitle和userName的构造方法
	 * @param orderId
	 * @param bookTime
	 * @param unsubscribeTime
	 * @param fee
	 * @param orderStatus
	 */
	public Orders(int orderId, String bookTime, String unsubscribeTime, double fee, int orderStatus) {
		super();
		this.orderId = orderId;
		this.bookTime = bookTime;
		this.unsubscribeTime = unsubscribeTime;
		this.fee = fee;
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", bookTime=" + bookTime + ", unsubscribeTime=" + unsubscribeTime
				+ ", fee=" + fee + ", orderStatus=" + orderStatus + ", accomTitle=" + accomTitle + ", userName="
				+ userName + "]";
	}
	

}
