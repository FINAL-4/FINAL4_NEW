package com.kh.FIFAOFFLINE.player.model.vo;

public class P_EN_LIST {
	private int eNum;
	private int userNo;
	private String eAccept;
	
	public P_EN_LIST() {}

	public P_EN_LIST(int eNum, int userNo, String eAccept) {
		super();
		this.eNum = eNum;
		this.userNo = userNo;
		this.eAccept = eAccept;
	}

	public int geteNum() {
		return eNum;
	}

	public void seteNum(int eNum) {
		this.eNum = eNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String geteAccept() {
		return eAccept;
	}

	public void seteAccept(String eAccept) {
		this.eAccept = eAccept;
	}

	@Override
	public String toString() {
		return "P_EN_LIST [eNum=" + eNum + ", userNo=" + userNo + ", eAccept=" + eAccept + "]";
	}
	
	
}
