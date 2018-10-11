package com.etc.huangchong.entity;

/**
 * 用户实体类 2018年10月11日17:02:59
 * 
 * @author 颜瑞玲
 *
 */
public class Users {
	private int userId;// 用户编号
	private String userName;// 用户名
	private String userPwd;// 用户密码
	private String nickName;// 用户昵称
	private String telNum;// 手机号
	private String realName;// 真实姓名
	private String identityCard;// 身份证
	private String imgUrl;// 头像地址

	/**
	 * 无参构造
	 */
	public Users() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 有参构造
	 * 
	 * @param userId
	 *            用户编号
	 * @param userName
	 *            用户名
	 * @param userPwd
	 *            用户密码
	 * @param nickName
	 *            用户昵称
	 * @param telNum
	 *            手机号
	 * @param realName
	 *            真实姓名
	 * @param identityCard
	 *            身份证
	 * @param imgUrl
	 *            头像地址
	 */
	public Users(int userId, String userName, String userPwd, String nickName, String telNum, String realName,
			String identityCard, String imgUrl) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.telNum = telNum;
		this.realName = realName;
		this.identityCard = identityCard;
		this.imgUrl = imgUrl;
	}

	// 封装属性
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTelNum() {
		return telNum;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", nickName=" + nickName
				+ ", telNum=" + telNum + ", realName=" + realName + ", identityCard=" + identityCard + ", imgUrl="
				+ imgUrl + "]";
	}

}
