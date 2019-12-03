package com.kh.FIFAOFFLINE.player.model.vo;

public class P_LIST {

	private int R_NUM;
	private int USER_NO;
	private String ACCEPT;
	
	public P_LIST() {}

	public P_LIST(int r_NUM, int uSER_NO, String aCCEPT) {
		super();
		R_NUM = r_NUM;
		USER_NO = uSER_NO;
		ACCEPT = aCCEPT;
	}

	public int getR_NUM() {
		return R_NUM;
	}

	public void setR_NUM(int r_NUM) {
		R_NUM = r_NUM;
	}

	public int getUSER_NO() {
		return USER_NO;
	}

	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}

	public String getACCEPT() {
		return ACCEPT;
	}

	public void setACCEPT(String aCCEPT) {
		ACCEPT = aCCEPT;
	}

	@Override
	public String toString() {
		return "P_LIST [R_NUM=" + R_NUM + ", USER_NO=" + USER_NO + ", ACCEPT=" + ACCEPT + "]";
	}
	
	
}
