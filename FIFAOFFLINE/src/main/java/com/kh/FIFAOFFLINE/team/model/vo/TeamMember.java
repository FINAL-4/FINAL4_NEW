package com.kh.FIFAOFFLINE.team.model.vo;

public class TeamMember {
	private int userNo;
	private int teamNo;
	private int t_Grade;
	private String profile;
	private String name;
	public TeamMember() {
		super();
	}
	public TeamMember(int userNo, int teamNo, int t_Grade, String profile, String name) {
		super();
		this.userNo = userNo;
		this.teamNo = teamNo;
		this.t_Grade = t_Grade;
		this.profile = profile;
		this.name = name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "TeamMember [userNo=" + userNo + ", teamNo=" + teamNo + ", t_Grade=" + t_Grade + ", profile=" + profile
				+ ", name=" + name + "]";
	}
	
	
	
	
	
	
}
