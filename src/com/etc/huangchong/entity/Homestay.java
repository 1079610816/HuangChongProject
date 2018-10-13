package com.etc.huangchong.entity;

public class Homestay {
	private int accomId;
	private String accomTitle;
	private String accomIntro;
	private String accomArea;
	private String accomAddress;
	private int accomStatus;
	private int peopleSum;
	private String userName;
	public Homestay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Homestay(int accomId, String accomTitle, String accomIntro, String accomArea, String accomAddress,
			int accomStatus, int peopleSum, String userName) {
		super();
		this.accomId = accomId;
		this.accomTitle = accomTitle;
		this.accomIntro = accomIntro;
		this.accomArea = accomArea;
		this.accomAddress = accomAddress;
		this.accomStatus = accomStatus;
		this.peopleSum = peopleSum;
		this.userName = userName;
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
	public int getPeopleSum() {
		return peopleSum;
	}
	public void setPeopleSum(int peopleSum) {
		this.peopleSum = peopleSum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Homestay [accomId=" + accomId + ", accomTitle=" + accomTitle + ", accomIntro=" + accomIntro
				+ ", accomArea=" + accomArea + ", accomAddress=" + accomAddress + ", accomStatus=" + accomStatus
				+ ", peopleSum=" + peopleSum + ", userName=" + userName + "]";
	}
	
	
	
	
	
}
