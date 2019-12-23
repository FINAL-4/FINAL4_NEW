package com.kh.FIFAOFFLINE.team.model.vo;

//	12월 11일 세션 myTeam 변경 ( userName 추가했음 )
//	12월 18일 세션 myTeam 변경 ( 팀장번호 추가 )
public class MyTeam {
	private int userNo;	//	로그인한놈 유저넘버
	private int leaderNo;	//	팀장 번호
	private String userName;	//	팀장 이름
	private int teamNo;	//	로그인한놈이 속한 팀 넘버
	private int t_Grade;	//	속한팀에서 팀장구분 ( 1 = 팀장 / 2 = 팀원 )
	private String teamName;	//	팀 이름
	private String teamImage;	//	팀 로고
	private String teamArea;	//	활동지역
	private String teamIntro;	//	팀 소개
	
	public MyTeam() {
		super();
	}

	public MyTeam(int userNo, int leaderNo, String userName, int teamNo, int t_Grade, String teamName, String teamImage,
			String teamArea, String teamIntro) {
		super();
		this.userNo = userNo;
		this.leaderNo = leaderNo;
		this.userName = userName;
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

	public int getLeaderNo() {
		return leaderNo;
	}

	public void setLeaderNo(int leaderNo) {
		this.leaderNo = leaderNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
		return "MyTeam [userNo=" + userNo + ", leaderNo=" + leaderNo + ", userName=" + userName + ", teamNo=" + teamNo
				+ ", t_Grade=" + t_Grade + ", teamName=" + teamName + ", teamImage=" + teamImage + ", teamArea="
				+ teamArea + ", teamIntro=" + teamIntro + "]";
	}

	
	
	
	
}	