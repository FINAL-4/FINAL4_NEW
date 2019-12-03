package com.kh.FIFAOFFLINE.player.model.vo;

public class P_LIST {

	private int rNum;
	private int userNo;
	private String accept;
	
	public P_LIST() {}

	public P_LIST(int rNum, int userNo, String accept) {
		super();
		this.rNum = rNum;
		this.userNo = userNo;
		this.accept = accept;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	@Override
	public String toString() {
		return "P_LIST [rNum=" + rNum + ", userNo=" + userNo + ", accept=" + accept + "]";
	}

	
}