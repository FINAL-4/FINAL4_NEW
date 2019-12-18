package com.kh.FIFAOFFLINE.tournament.model.vo;

public class TournamentSche {
	private int toNo;
	private String sSlotNum;
	private String toTime;
	
	public TournamentSche() {}

	public TournamentSche(int toNo, String sSlotNum, String toTime) {
		super();
		this.toNo = toNo;
		this.sSlotNum = sSlotNum;
		this.toTime = toTime;
	}

	public int getToNo() {
		return toNo;
	}

	public void setToNo(int toNo) {
		this.toNo = toNo;
	}

	public String getsSlotNum() {
		return sSlotNum;
	}

	public void setsSlotNum(String sSlotNum) {
		this.sSlotNum = sSlotNum;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	@Override
	public String toString() {
		return "TournamentSche [toNo=" + toNo + ", sSlotNum=" + sSlotNum + ", toTime=" + toTime + "]";
	}
	
	
}
