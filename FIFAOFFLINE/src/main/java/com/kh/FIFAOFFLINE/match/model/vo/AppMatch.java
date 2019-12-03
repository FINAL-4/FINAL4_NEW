package com.kh.FIFAOFFLINE.match.model.vo;

import java.sql.Date;

public class AppMatch {
	private int amId;
	private int teamNo;
	private int mId;
	private Date appDate;
	private String amStatus;
	
	public AppMatch() {}

	public AppMatch(int amId, int teamNo, int mId, Date appDate, String amStatus) {
		super();
		this.amId = amId;
		this.teamNo = teamNo;
		this.mId = mId;
		this.appDate = appDate;
		this.amStatus = amStatus;
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

	@Override
	public String toString() {
		return "AppMatch [amId=" + amId + ", teamNo=" + teamNo + ", mId=" + mId + ", appDate=" + appDate + ", amStatus="
				+ amStatus + "]";
	}
	
	
	
	
}
