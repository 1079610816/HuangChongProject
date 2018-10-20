package com.etc.huangchong.entity;

public class FangDong {
	private String headImage ;

	public FangDong() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FangDong(String headImage) {
		super();
		this.headImage = headImage;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	@Override
	public String toString() {
		return "FangDong [headImage=" + headImage + "]";
	}
	
}
