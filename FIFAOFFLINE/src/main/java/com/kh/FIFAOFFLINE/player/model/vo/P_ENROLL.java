package com.kh.FIFAOFFLINE.player.model.vo;

public class P_ENROLL {

	private int E_NUM;
	private int USER_NO;
	private String E_PLACE;
	private String E_DAY;
	private String E_CONTENT;
	private String E_STATUS;
	
	public P_ENROLL() {}

	public P_ENROLL(int e_NUM, int uSER_NO, String e_PLACE, String e_DAY, String e_CONTENT, String e_STATUS) {
		super();
		E_NUM = e_NUM;
		USER_NO = uSER_NO;
		E_PLACE = e_PLACE;
		E_DAY = e_DAY;
		E_CONTENT = e_CONTENT;
		E_STATUS = e_STATUS;
	}

	public int getE_NUM() {
		return E_NUM;
	}

	public void setE_NUM(int e_NUM) {
		E_NUM = e_NUM;
	}

	public int getUSER_NO() {
		return USER_NO;
	}

	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}

	public String getE_PLACE() {
		return E_PLACE;
	}

	public void setE_PLACE(String e_PLACE) {
		E_PLACE = e_PLACE;
	}

	public String getE_DAY() {
		return E_DAY;
	}

	public void setE_DAY(String e_DAY) {
		E_DAY = e_DAY;
	}

	public String getE_CONTENT() {
		return E_CONTENT;
	}

	public void setE_CONTENT(String e_CONTENT) {
		E_CONTENT = e_CONTENT;
	}

	public String getE_STATUS() {
		return E_STATUS;
	}

	public void setE_STATUS(String e_STATUS) {
		E_STATUS = e_STATUS;
	}

	@Override
	public String toString() {
		return "P_ENROLL [E_NUM=" + E_NUM + ", USER_NO=" + USER_NO + ", E_PLACE=" + E_PLACE + ", E_DAY=" + E_DAY
				+ ", E_CONTENT=" + E_CONTENT + ", E_STATUS=" + E_STATUS + "]";
	}
	
	
}
