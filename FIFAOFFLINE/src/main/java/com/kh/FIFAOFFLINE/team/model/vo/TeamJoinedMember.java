package com.kh.FIFAOFFLINE.team.model.vo;

import java.sql.Date;

public class TeamJoinedMember {
	private int userNo;
	private int teamNo;
	private Date reg_Date;
	private String fromInvite;
	private String reg_Status;
	
	public TeamJoinedMember() {
		super();
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
		return "TeamJoinedMember [userNo=" + userNo + ", teamNo=" + teamNo + ", reg_Date=" + reg_Date + ", fromInvite="
				+ fromInvite + ", reg_Status=" + reg_Status + "]";
	}
	
	
}
