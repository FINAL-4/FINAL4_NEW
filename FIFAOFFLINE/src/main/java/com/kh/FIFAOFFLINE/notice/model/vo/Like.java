package com.kh.FIFAOFFLINE.notice.model.vo;

public class Like {
	private int userNo;
	private int nId;
	
	public Like() {}

	public Like(int userNo, int nId) {
		super();
		this.userNo = userNo;
		this.nId = nId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	@Override
	public String toString() {
		return "Like [userNo=" + userNo + ", nId=" + nId + "]";
	}
	
	
}
