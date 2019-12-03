package com.kh.FIFAOFFLINE.team.model.vo;

import java.util.ArrayList;


//	각 변수는 Team 컬럼과 맞춘것이 아니라 Team Join(+) TeamAD 한 결과를 변수로 적었다.
public class Team {
	private int teamNo;
	private int userNo;
	private String userName;
	private String userId;
	private String teamName;
	private String teamImage;
	private String teamArea;
	private String teamIntro;
	private String teamAdver;
	private String resisterDay;
	private String ad_status;
	
	//	1 : N 관계에서만 콜렉션을 써본다.
	/* private ArrayList<TeamAD> teamAD; */
	private ArrayList<TeamMember> teamMember;
	/* private ArrayList<TeamJoinedMember> t_Joined_Member; */
	
	
	public Team() {
		super();
	}
	public Team(int teamNo, int userNo, String userName, String userId, String teamName, String teamImage,
			String teamArea, String teamIntro, String teamAdver, String resisterDay, String ad_status,
			ArrayList<TeamMember> teamMember) {
		super();
		this.teamNo = teamNo;
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.teamName = teamName;
		this.teamImage = teamImage;
		this.teamArea = teamArea;
		this.teamIntro = teamIntro;
		this.teamAdver = teamAdver;
		this.resisterDay = resisterDay;
		this.ad_status = ad_status;
		this.teamMember = teamMember;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamImage() {
		return teamImage;
	}
	public void setTeamImage(String teamImage) {
		this.teamImage = teamImage;
	}
	public String getTeamArea() {
		return teamArea;
	}
	public void setTeamArea(String teamArea) {
		this.teamArea = teamArea;
	}
	public String getTeamIntro() {
		return teamIntro;
	}
	public void setTeamIntro(String teamIntro) {
		this.teamIntro = teamIntro;
	}
	public String getTeamAdver() {
		return teamAdver;
	}
	public void setTeamAdver(String teamAdver) {
		this.teamAdver = teamAdver;
	}
	public String getResisterDay() {
		return resisterDay;
	}
	public void setResisterDay(String resisterDay) {
		this.resisterDay = resisterDay;
	}
	public String getAd_status() {
		return ad_status;
	}
	public void setAd_status(String ad_status) {
		this.ad_status = ad_status;
	}
	public ArrayList<TeamMember> getTeamMember() {
		return teamMember;
	}
	public void setTeamMember(ArrayList<TeamMember> teamMember) {
		this.teamMember = teamMember;
	}
	@Override
	public String toString() {
		return "Team [teamNo=" + teamNo + ", userNo=" + userNo + ", userName=" + userName + ", userId=" + userId
				+ ", teamName=" + teamName + ", teamImage=" + teamImage + ", teamArea=" + teamArea + ", teamIntro="
				+ teamIntro + ", teamAdver=" + teamAdver + ", resisterDay=" + resisterDay + ", ad_status=" + ad_status
				+ ", teamMember=" + teamMember + "]";
	}
	
	
	
	
	

	
	
	
	
	
}
