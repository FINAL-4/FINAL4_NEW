package com.kh.FIFAOFFLINE.match.model.vo;

import java.sql.Date;

public class Match {
	private String mId;
	private int teamNo;
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
	private Date createDate;
	private String mStatus;
	
	
	public Match() {}


	public Match(String mId, int teamNo, String mTitle, String mContent, String mSystem, String dues,
			String mLocationName, String mLocationX, String mLocationY, Date mDay, String sHour, String sMinute,
			String eHour, String eMinute, Date createDate, String mStatus) {
		super();
		this.mId = mId;
		this.teamNo = teamNo;
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
		this.createDate = createDate;
		this.mStatus = mStatus;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public int getTeamNo() {
		return teamNo;
	}


	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
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


	@Override
	public String toString() {
		return "Match [mId=" + mId + ", teamNo=" + teamNo + ", mTitle=" + mTitle + ", mContent=" + mContent
				+ ", mSystem=" + mSystem + ", dues=" + dues + ", mLocationName=" + mLocationName + ", mLocationX="
				+ mLocationX + ", mLocationY=" + mLocationY + ", mDay=" + mDay + ", sHour=" + sHour + ", sMinute="
				+ sMinute + ", eHour=" + eHour + ", eMinute=" + eMinute + ", createDate=" + createDate + ", mStatus="
				+ mStatus + "]";
	}
	
	
	
}
