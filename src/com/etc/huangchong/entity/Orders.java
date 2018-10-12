package com.etc.huangchong.entity;

public class Orders {

	private int orderId;
	private String bookTime;
	private String unsubscribeTime;
	private double fee;
	private int orderStatus;
	private int accomId;
	private int userId;
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
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int orderId, String bookTime, String unsubscribeTime, double fee, int orderStatus, int accomId,
			int userId) {
		super();
		this.orderId = orderId;
		this.bookTime = bookTime;
		this.unsubscribeTime = unsubscribeTime;
		this.fee = fee;
		this.orderStatus = orderStatus;
		this.accomId = accomId;
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", bookTime=" + bookTime + ", unsubscribeTime=" + unsubscribeTime
				+ ", fee=" + fee + ", orderStatus=" + orderStatus + ", accomId=" + accomId + ", userId=" + userId + "]";
	}
	
	

}
