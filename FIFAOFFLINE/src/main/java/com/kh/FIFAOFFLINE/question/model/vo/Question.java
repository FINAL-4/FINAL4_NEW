package com.kh.FIFAOFFLINE.question.model.vo;

import java.sql.Date;

public class Question {

	private int qId;
	private int userNo;
	private String userId;
	private String userName;
	private String profile;
	private String qTitle;
	private String qContent;
	private String qAnswer;
	private Date qDate;
	private Date aDate;
	private String qStatus;
	private String aYN;
	private String rYN;
	
	public Question() {}

	public Question(int qId, int userNo, String userId, String userName, String profile, String qTitle, String qContent,
			String qAnswer, Date qDate, Date aDate, String qStatus, String aYN, String rYN) {
		super();
		this.qId = qId;
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.profile = profile;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qAnswer = qAnswer;
		this.qDate = qDate;
		this.aDate = aDate;
		this.qStatus = qStatus;
		this.aYN = aYN;
		this.rYN = rYN;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public String getaYN() {
		return aYN;
	}

	public void setaYN(String aYN) {
		this.aYN = aYN;
	}

	public String getrYN() {
		return rYN;
	}

	public void setrYN(String rYN) {
		this.rYN = rYN;
	}

	@Override
	public String toString() {
		return "Question [qId=" + qId + ", userNo=" + userNo + ", userId=" + userId + ", userName=" + userName
				+ ", profile=" + profile + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qAnswer=" + qAnswer
				+ ", qDate=" + qDate + ", aDate=" + aDate + ", qStatus=" + qStatus + ", aYN=" + aYN + ", rYN=" + rYN
				+ "]";
	}

	

	

	
	
	
	
}
