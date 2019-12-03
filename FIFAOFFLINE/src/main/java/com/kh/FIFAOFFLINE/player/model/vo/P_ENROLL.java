package com.kh.FIFAOFFLINE.player.model.vo;

public class P_ENROLL {

	private int eNum;
	private int userNo;
	private String ePlace;
	private String eDay;
	private String eContent;
	private String eStatus;
	
	public P_ENROLL() {}

	public P_ENROLL(int eNum, int userNo, String ePlace, String eDay, String eContent, String eStatus) {
		super();
		this.eNum = eNum;
		this.userNo = userNo;
		this.ePlace = ePlace;
		this.eDay = eDay;
		this.eContent = eContent;
		this.eStatus = eStatus;
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

	public String getePlace() {
		return ePlace;
	}

	public void setePlace(String ePlace) {
		this.ePlace = ePlace;
	}

	public String geteDay() {
		return eDay;
	}

	public void seteDay(String eDay) {
		this.eDay = eDay;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	@Override
	public String toString() {
		return "P_ENROLL [eNum=" + eNum + ", userNo=" + userNo + ", ePlace=" + ePlace + ", eDay=" + eDay + ", eContent="
				+ eContent + ", eStatus=" + eStatus + "]";
	}

	
}
