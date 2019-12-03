package com.kh.FIFAOFFLINE.team.model.vo;

public class TeamMember {
	private int userNo;
	private int teamNo;
	private int t_Grade;
	public TeamMember() {
		super();
	}
	public TeamMember(int userNo, int teamNo, int t_Grade) {
		super();
		this.userNo = userNo;
		this.teamNo = teamNo;
		this.t_Grade = t_Grade;
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
	public int getT_Grade() {
		return t_Grade;
	}
	public void setT_Grade(int t_Grade) {
		this.t_Grade = t_Grade;
	}
	@Override
	public String toString() {
		return "TeamMember [userNo=" + userNo + ", teamNo=" + teamNo + ", t_Grade=" + t_Grade + "]";
	}
	
	
	
	
}
