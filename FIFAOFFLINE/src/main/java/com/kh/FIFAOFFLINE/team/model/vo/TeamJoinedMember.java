package com.kh.FIFAOFFLINE.team.model.vo;

import java.sql.Date;

public class TeamJoinedMember {
	private int userNo;
	private int teamNo;
	private String profile;
	private String name;
	private Date reg_Date;
	private String fromInvite;
	private String reg_Status;
	public TeamJoinedMember() {
		super();
	}
	public TeamJoinedMember(int userNo, int teamNo, String profile, String name, Date reg_Date, String fromInvite,
			String reg_Status) {
		super();
		this.userNo = userNo;
		this.teamNo = teamNo;
		this.profile = profile;
		this.name = name;
		this.reg_Date = reg_Date;
		this.fromInvite = fromInvite;
		this.reg_Status = reg_Status;
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
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(Date reg_Date) {
		this.reg_Date = reg_Date;
	}
	public String getFromInvite() {
		return fromInvite;
	}
	public void setFromInvite(String fromInvite) {
		this.fromInvite = fromInvite;
	}
	public String getReg_Status() {
		return reg_Status;
	}
	public void setReg_Status(String reg_Status) {
		this.reg_Status = reg_Status;
	}
	@Override
	public String toString() {
		return "TeamJoinedMember [userNo=" + userNo + ", teamNo=" + teamNo + ", profile=" + profile + ", name=" + name
				+ ", reg_Date=" + reg_Date + ", fromInvite=" + fromInvite + ", reg_Status=" + reg_Status + "]";
	}
	
	
	
	
}
