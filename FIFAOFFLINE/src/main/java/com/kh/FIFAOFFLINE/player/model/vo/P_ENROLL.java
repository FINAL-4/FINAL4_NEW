package com.kh.FIFAOFFLINE.player.model.vo;

import java.sql.Date;

public class P_ENROLL {

	private int eNum;
	private int userNo;
	private String eTitle;
	private String eManner;
	private String eSkill;
	private String ePlace;
	private String ePlaceX;
	private String ePlaceY;
	private String eDay;
	private String esHour;
	private String efHour;
	private String eContent;
	private Date ecDate;
	private String eStatus;
	private String userName;
	private String position;
	private String phone;
	private String proFile;
	private String gender;
	private String aCount;
	
	public P_ENROLL() {}

	public P_ENROLL(int eNum, int userNo, String eTitle, String eManner, String eSkill, String ePlace, String ePlaceX,
			String ePlaceY, String eDay, String esHour, String efHour, String eContent, Date ecDate, String eStatus,
			String userName, String position, String phone, String proFile, String gender, String aCount) {
		super();
		this.eNum = eNum;
		this.userNo = userNo;
		this.eTitle = eTitle;
		this.eManner = eManner;
		this.eSkill = eSkill;
		this.ePlace = ePlace;
		this.ePlaceX = ePlaceX;
		this.ePlaceY = ePlaceY;
		this.eDay = eDay;
		this.esHour = esHour;
		this.efHour = efHour;
		this.eContent = eContent;
		this.ecDate = ecDate;
		this.eStatus = eStatus;
		this.userName = userName;
		this.position = position;
		this.phone = phone;
		this.proFile = proFile;
		this.gender = gender;
		this.aCount = aCount;
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

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteManner() {
		return eManner;
	}

	public void seteManner(String eManner) {
		this.eManner = eManner;
	}

	public String geteSkill() {
		return eSkill;
	}

	public void seteSkill(String eSkill) {
		this.eSkill = eSkill;
	}

	public String getePlace() {
		return ePlace;
	}

	public void setePlace(String ePlace) {
		this.ePlace = ePlace;
	}

	public String getePlaceX() {
		return ePlaceX;
	}

	public void setePlaceX(String ePlaceX) {
		this.ePlaceX = ePlaceX;
	}

	public String getePlaceY() {
		return ePlaceY;
	}

	public void setePlaceY(String ePlaceY) {
		this.ePlaceY = ePlaceY;
	}

	public String geteDay() {
		return eDay;
	}

	public void seteDay(String eDay) {
		this.eDay = eDay;
	}

	public String getEsHour() {
		return esHour;
	}

	public void setEsHour(String esHour) {
		this.esHour = esHour;
	}

	public String getEfHour() {
		return efHour;
	}

	public void setEfHour(String efHour) {
		this.efHour = efHour;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public Date getEcDate() {
		return ecDate;
	}

	public void setEcDate(Date ecDate) {
		this.ecDate = ecDate;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProFile() {
		return proFile;
	}

	public void setProFile(String proFile) {
		this.proFile = proFile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getaCount() {
		return aCount;
	}

	public void setaCount(String aCount) {
		this.aCount = aCount;
	}

	@Override
	public String toString() {
		return "P_ENROLL [eNum=" + eNum + ", userNo=" + userNo + ", eTitle=" + eTitle + ", eManner=" + eManner
				+ ", eSkill=" + eSkill + ", ePlace=" + ePlace + ", ePlaceX=" + ePlaceX + ", ePlaceY=" + ePlaceY
				+ ", eDay=" + eDay + ", esHour=" + esHour + ", efHour=" + efHour + ", eContent=" + eContent
				+ ", ecDate=" + ecDate + ", eStatus=" + eStatus + ", userName=" + userName + ", position=" + position
				+ ", phone=" + phone + ", proFile=" + proFile + ", gender=" + gender + ", aCount=" + aCount + "]";
	}

	
	
	
	
}
