package com.kh.FIFAOFFLINE.tournament.model.vo;

public class Tournament {
	private int toNo;
	private int teamNo;
	private String teamName;
	private int score;
	private int slotNum;
	private int userNo;
	private String teamLogo;
	
	public Tournament() {}

	public Tournament(int toNo, int teamNo, String teamName, int score, int slotNum, int userNo, String teamLogo) {
		super();
		this.toNo = toNo;
		this.teamNo = teamNo;
		this.teamName = teamName;
		this.score = score;
		this.slotNum = slotNum;
		this.userNo = userNo;
		this.teamLogo = teamLogo;
	}

	public int getToNo() {
		return toNo;
	}

	public void setToNo(int toNo) {
		this.toNo = toNo;
	}

	public int getTeamNo() {
		return teamNo;
	}

	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getSlotNum() {
		return slotNum;
	}

	public void setSlotNum(int slotNum) {
		this.slotNum = slotNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTeamLogo() {
		return teamLogo;
	}

	public void setTeamLogo(String teamLogo) {
		this.teamLogo = teamLogo;
	}

	@Override
	public String toString() {
		return "Tournament [toNo=" + toNo + ", teamNo=" + teamNo + ", teamName=" + teamName + ", score=" + score
				+ ", slotNum=" + slotNum + ", userNo=" + userNo + ", teamLogo=" + teamLogo + "]";
	}

	

	
	
	
	
}
