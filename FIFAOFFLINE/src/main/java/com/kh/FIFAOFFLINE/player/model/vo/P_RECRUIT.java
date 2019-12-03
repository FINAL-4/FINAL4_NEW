package com.kh.FIFAOFFLINE.player.model.vo;

import java.sql.Date;

public class P_RECRUIT {

	private int rNum;
	private int teamNo;
	private String rTitle;
	private String rPlace;
	private String rPlaceX;
	private String rPlaceY;
	private String rDay;
	private String rsHour;
	private String rsMin;
	private String rfHour;
	private String rfMin;
	private String deadline;
	private String rMoney;
	private String rContent;
	private Date rcDate;
	private Date rmDate;
	private String rStatus;
	
	public P_RECRUIT() {}

	public P_RECRUIT(int rNum, int teamNo, String rTitle, String rPlace, String rPlaceX, String rPlaceY, String rDay,
			String rsHour, String rsMin, String rfHour, String rfMin, String deadline, String rMoney, String rContent,
			Date rcDate, Date rmDate, String rStatus) {
		super();
		this.rNum = rNum;
		this.teamNo = teamNo;
		this.rTitle = rTitle;
		this.rPlace = rPlace;
		this.rPlaceX = rPlaceX;
		this.rPlaceY = rPlaceY;
		this.rDay = rDay;
		this.rsHour = rsHour;
		this.rsMin = rsMin;
		this.rfHour = rfHour;
		this.rfMin = rfMin;
		this.deadline = deadline;
		this.rMoney = rMoney;
		this.rContent = rContent;
		this.rcDate = rcDate;
		this.rmDate = rmDate;
		this.rStatus = rStatus;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getTeamNo() {
		return teamNo;
	}

	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrPlace() {
		return rPlace;
	}

	public void setrPlace(String rPlace) {
		this.rPlace = rPlace;
	}

	public String getrPlaceX() {
		return rPlaceX;
	}

	public void setrPlaceX(String rPlaceX) {
		this.rPlaceX = rPlaceX;
	}

	public String getrPlaceY() {
		return rPlaceY;
	}

	public void setrPlaceY(String rPlaceY) {
		this.rPlaceY = rPlaceY;
	}

	public String getrDay() {
		return rDay;
	}

	public void setrDay(String rDay) {
		this.rDay = rDay;
	}

	public String getRsHour() {
		return rsHour;
	}

	public void setRsHour(String rsHour) {
		this.rsHour = rsHour;
	}

	public String getRsMin() {
		return rsMin;
	}

	public void setRsMin(String rsMin) {
		this.rsMin = rsMin;
	}

	public String getRfHour() {
		return rfHour;
	}

	public void setRfHour(String rfHour) {
		this.rfHour = rfHour;
	}

	public String getRfMin() {
		return rfMin;
	}

	public void setRfMin(String rfMin) {
		this.rfMin = rfMin;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getrMoney() {
		return rMoney;
	}

	public void setrMoney(String rMoney) {
		this.rMoney = rMoney;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getRcDate() {
		return rcDate;
	}

	public void setRcDate(Date rcDate) {
		this.rcDate = rcDate;
	}

	public Date getRmDate() {
		return rmDate;
	}

	public void setRmDate(Date rmDate) {
		this.rmDate = rmDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "P_RECRUIT [rNum=" + rNum + ", teamNo=" + teamNo + ", rTitle=" + rTitle + ", rPlace=" + rPlace
				+ ", rPlaceX=" + rPlaceX + ", rPlaceY=" + rPlaceY + ", rDay=" + rDay + ", rsHour=" + rsHour + ", rsMin="
				+ rsMin + ", rfHour=" + rfHour + ", rfMin=" + rfMin + ", deadline=" + deadline + ", rMoney=" + rMoney
				+ ", rContent=" + rContent + ", rcDate=" + rcDate + ", rmDate=" + rmDate + ", rStatus=" + rStatus + "]";
	}

		
}
