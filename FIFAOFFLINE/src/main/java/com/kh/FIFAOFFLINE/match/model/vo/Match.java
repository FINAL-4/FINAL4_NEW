package com.kh.FIFAOFFLINE.match.model.vo;

import java.sql.Date;

public class Match {
	private int mId;
	private int teamNo;
	private int userNo;
	private String userName;
	private String mTitle;
	private String mContent;
	private String mSystem;
	private String dues;
	private String mLocationName;
	private String mLocationX;
	private String mLocationY;
	private Date mDay;
	private String sHour;
	private String sMinute;
	private String eHour;
	private String eMinute;
	private int mtId;
	private Date createDate;
	private String mStatus;
	private String teamName;
	private String teamImg;
	
	public Match() {}

	public Match(int mId, int teamNo, int userNo, String userName, String mTitle, String mContent, String mSystem,
			String dues, String mLocationName, String mLocationX, String mLocationY, Date mDay, String sHour,
			String sMinute, String eHour, String eMinute, int mtId, Date createDate, String mStatus, String teamName,
			String teamImg) {
		super();
		this.mId = mId;
		this.teamNo = teamNo;
		this.userNo = userNo;
		this.userName = userName;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mSystem = mSystem;
		this.dues = dues;
		this.mLocationName = mLocationName;
		this.mLocationX = mLocationX;
		this.mLocationY = mLocationY;
		this.mDay = mDay;
		this.sHour = sHour;
		this.sMinute = sMinute;
		this.eHour = eHour;
		this.eMinute = eMinute;
		this.mtId = mtId;
		this.createDate = createDate;
		this.mStatus = mStatus;
		this.teamName = teamName;
		this.teamImg = teamImg;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
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

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public String getmSystem() {
		return mSystem;
	}

	public void setmSystem(String mSystem) {
		this.mSystem = mSystem;
	}

	public String getDues() {
		return dues;
	}

	public void setDues(String dues) {
		this.dues = dues;
	}

	public String getmLocationName() {
		return mLocationName;
	}

	public void setmLocationName(String mLocationName) {
		this.mLocationName = mLocationName;
	}

	public String getmLocationX() {
		return mLocationX;
	}

	public void setmLocationX(String mLocationX) {
		this.mLocationX = mLocationX;
	}

	public String getmLocationY() {
		return mLocationY;
	}

	public void setmLocationY(String mLocationY) {
		this.mLocationY = mLocationY;
	}

	public Date getmDay() {
		return mDay;
	}

	public void setmDay(Date mDay) {
		this.mDay = mDay;
	}

	public String getsHour() {
		return sHour;
	}

	public void setsHour(String sHour) {
		this.sHour = sHour;
	}

	public String getsMinute() {
		return sMinute;
	}

	public void setsMinute(String sMinute) {
		this.sMinute = sMinute;
	}

	public String geteHour() {
		return eHour;
	}

	public void seteHour(String eHour) {
		this.eHour = eHour;
	}

	public String geteMinute() {
		return eMinute;
	}

	public void seteMinute(String eMinute) {
		this.eMinute = eMinute;
	}

	public int getMtId() {
		return mtId;
	}

	public void setMtId(int mtId) {
		this.mtId = mtId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
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
		return "Match [mId=" + mId + ", teamNo=" + teamNo + ", userNo=" + userNo + ", userName=" + userName
				+ ", mTitle=" + mTitle + ", mContent=" + mContent + ", mSystem=" + mSystem + ", dues=" + dues
				+ ", mLocationName=" + mLocationName + ", mLocationX=" + mLocationX + ", mLocationY=" + mLocationY
				+ ", mDay=" + mDay + ", sHour=" + sHour + ", sMinute=" + sMinute + ", eHour=" + eHour + ", eMinute="
				+ eMinute + ", mtId=" + mtId + ", createDate=" + createDate + ", mStatus=" + mStatus + ", teamName="
				+ teamName + ", teamImg=" + teamImg + "]";
	}


	
	
	
}
