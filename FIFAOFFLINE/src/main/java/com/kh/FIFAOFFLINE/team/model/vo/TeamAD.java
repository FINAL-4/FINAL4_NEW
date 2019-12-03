package com.kh.FIFAOFFLINE.team.model.vo;

import java.sql.Date;

public class TeamAD {
	private int userNo;
	private int teamNo;
	private String teamAdver;
	private Date resisterDay;
	private String ad_status;
	public TeamAD() {
		super();
	}
	public TeamAD(int userNo, int teamNo, String teamAdver, Date resisterDay, String ad_status) {
		super();
		this.userNo = userNo;
		this.teamNo = teamNo;
		this.teamAdver = teamAdver;
		this.resisterDay = resisterDay;
		this.ad_status = ad_status;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public String getTeamAdver() {
		return teamAdver;
	}
	public void setTeamAdver(String teamAdver) {
		this.teamAdver = teamAdver;
	}
	public Date getResisterDay() {
		return resisterDay;
	}
	public void setResisterDay(Date resisterDay) {
		this.resisterDay = resisterDay;
	}
	public String getAd_status() {
		return ad_status;
	}
	public void setAd_status(String ad_status) {
		this.ad_status = ad_status;
	}
	@Override
	public String toString() {
		return "TeamAD [userNo=" + userNo + ", teamNo=" + teamNo + ", teamAdver=" + teamAdver + ", resisterDay="
				+ resisterDay + ", ad_status=" + ad_status + "]";
	}
	
	
}
