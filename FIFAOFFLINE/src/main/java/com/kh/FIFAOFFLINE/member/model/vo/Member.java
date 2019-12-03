package com.kh.FIFAOFFLINE.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String userId;
	private String userEmail;
	private String userPwd;
	private String userName;
	private int birthDay;
	private String gender;
	private	String profile;
	private String address;
	private String phone;
	private String position;
	private String status;
	private int aCount;
	private Date joinDate;
	
	public Member() {
		super();
	}

	public Member(int userNo, String userId, String userEmail, String userPwd, String userName, int birthDay,
			String gender, String profile, String address, String phone, String position, String status, int aCount,
			Date joinDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.profile = profile;
		this.address = address;
		this.phone = phone;
		this.position = position;
		this.status = status;
		this.aCount = aCount;
		this.joinDate = joinDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(int birthDay) {
		this.birthDay = birthDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userEmail=" + userEmail + ", userPwd=" + userPwd
				+ ", userName=" + userName + ", birthDay=" + birthDay + ", gender=" + gender + ", profile=" + profile
				+ ", address=" + address + ", phone=" + phone + ", position=" + position + ", status=" + status
				+ ", aCount=" + aCount + ", joinDate=" + joinDate + "]";
	}

	
	
}