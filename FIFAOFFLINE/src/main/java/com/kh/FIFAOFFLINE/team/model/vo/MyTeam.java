package com.kh.FIFAOFFLINE.team.model.vo;

public class MyTeam {
	private int userNo;	//	로그인한놈 유저넘버
	private int teamNo;	//	로그인한놈이 속한 팀 넘버
	private int t_Grade;	//	속한팀에서 팀장구분 ( 1 = 팀장 / 2 = 팀원 )
	private String teamName;	//	팀 이름
	private String teamImage;	//	팀 로고
	private String teamArea;	//	활동지역
	private String teamIntro;	//	팀 소개
	
	public MyTeam() {
		super();
	}
	public MyTeam(int userNo, int teamNo, int t_Grade, String teamName, String teamImage, String teamArea,
			String teamIntro) {
		super();
		this.userNo = userNo;
		this.teamNo = teamNo;
		this.t_Grade = t_Grade;
		this.teamName = teamName;
		this.teamImage = teamImage;
		this.teamArea = teamArea;
		this.teamIntro = teamIntro;
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
	@Override
	public String toString() {
		return "MyTeam [userNo=" + userNo + ", teamNo=" + teamNo + ", t_Grade=" + t_Grade + ", teamName=" + teamName
				+ ", teamImage=" + teamImage + ", teamArea=" + teamArea + ", teamIntro=" + teamIntro + "]";
	}
	
	
}	