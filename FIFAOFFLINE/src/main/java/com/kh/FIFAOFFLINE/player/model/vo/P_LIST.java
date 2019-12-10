package com.kh.FIFAOFFLINE.player.model.vo;

public class P_LIST {

	private int rNum;
	private int userNo;
	private String accept;
	private String userName;
	private String manner;
	private String skill;
	private String position;
	private String phone;
	private String proFile;
	
	public P_LIST() {}

	public P_LIST(int rNum, int userNo, String accept, String userName, String manner, String skill, String position,
			String phone, String proFile) {
		super();
		this.rNum = rNum;
		this.userNo = userNo;
		this.accept = accept;
		this.userName = userName;
		this.manner = manner;
		this.skill = skill;
		this.position = position;
		this.phone = phone;
		this.proFile = proFile;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getManner() {
		return manner;
	}

	public void setManner(String manner) {
		this.manner = manner;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProFile() {
		return proFile;
	}

	public void setProFile(String proFile) {
		this.proFile = proFile;
	}

	@Override
	public String toString() {
		return "P_LIST [rNum=" + rNum + ", userNo=" + userNo + ", accept=" + accept + ", userName=" + userName
				+ ", manner=" + manner + ", skill=" + skill + ", position=" + position + ", phone=" + phone
				+ ", proFile=" + proFile + "]";
	}

	
	
	
}