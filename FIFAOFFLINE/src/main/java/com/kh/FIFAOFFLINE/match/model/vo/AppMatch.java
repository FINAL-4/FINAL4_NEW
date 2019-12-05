package com.kh.FIFAOFFLINE.match.model.vo;

import java.sql.Date;

public class AppMatch {
	private int amId;
	private int teamNo;
	private int userNo;
	private String userName;
	private int mId;
	private Date appDate;
	private String amStatus;
	private String teamName;
	private String teamImg;
	
	public AppMatch() {}

	public AppMatch(int amId, int teamNo, int userNo, String userName, int mId, Date appDate, String amStatus,
			String teamName, String teamImg) {
		super();
		this.amId = amId;
		this.teamNo = teamNo;
		this.userNo = userNo;
		this.userName = userName;
		this.mId = mId;
		this.appDate = appDate;
		this.amStatus = amStatus;
		this.teamName = teamName;
		this.teamImg = teamImg;
	}

	public int getAmId() {
		return amId;
	}

	public void setAmId(int amId) {
		this.amId = amId;
	}

	public int getTeamNo() {
		return teamNo;
	}

	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public String getAmStatus() {
		return amStatus;
	}

	public void setAmStatus(String amStatus) {
		this.amStatus = amStatus;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamImg() {
		return teamImg;
	}

	public void setTeamImg(String teamImg) {
		this.teamImg = teamImg;
	}

	@Override
	public String toString() {
		return "AppMatch [amId=" + amId + ", teamNo=" + teamNo + ", userNo=" + userNo + ", userName=" + userName
				+ ", mId=" + mId + ", appDate=" + appDate + ", amStatus=" + amStatus + ", teamName=" + teamName
				+ ", teamImg=" + teamImg + "]";
	}

	

	

	
	
	
	
	
}
