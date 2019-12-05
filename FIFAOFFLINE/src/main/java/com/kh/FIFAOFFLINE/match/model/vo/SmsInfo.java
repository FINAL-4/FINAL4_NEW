package com.kh.FIFAOFFLINE.match.model.vo;

public class SmsInfo {
	private String userName;
	private String phone;
	private String tGrade;
	
	public SmsInfo() {}
	
	public SmsInfo(String userName, String phone, String tGrade) {
		super();
		this.userName = userName;
		this.phone = phone;
		this.tGrade = tGrade;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String gettGrade() {
		return tGrade;
	}

	public void settGrade(String tGrade) {
		this.tGrade = tGrade;
	}

	@Override
	public String toString() {
		return "SmsInfo [userName=" + userName + ", phone=" + phone + ", tGrade=" + tGrade + "]";
	}
	
	
	
}
