package com.kh.FIFAOFFLINE.team.model.vo;

public class TeamMember {
	private int userNo;
	private int teamNo;
	private int t_Grade;
	private String profile;
	private String userName;
	private String position;
	public TeamMember() {
		super();
	}
	public TeamMember(int userNo, int teamNo, int t_Grade, String profile, String userName, String position) {
		super();
		this.userNo = userNo;
		this.teamNo = teamNo;
		this.t_Grade = t_Grade;
		this.profile = profile;
		this.userName = userName;
		this.position = position;
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
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "TeamMember [userNo=" + userNo + ", teamNo=" + teamNo + ", t_Grade=" + t_Grade + ", profile=" + profile
				+ ", userName=" + userName + ", position=" + position + "]";
	}
	
	
	
}
