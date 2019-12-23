package com.kh.FIFAOFFLINE.notice.model.vo;

import java.sql.Date;

public class Reply {
	private int rId;
	private String rContent;
	private int nId;
	private int userNo;
	private String profile;
	private String rWriter;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rStatus;
	
	public Reply() {
	}

	public Reply(int rId, String rContent, int nId, int userNo, String profile, String rWriter, Date rCreateDate,
			Date rModifyDate, String rStatus) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.nId = nId;
		this.userNo = userNo;
		this.profile = profile;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rStatus = rStatus;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", nId=" + nId + ", userNo=" + userNo + ", profile="
				+ profile + ", rWriter=" + rWriter + ", rCreateDate=" + rCreateDate + ", rModifyDate=" + rModifyDate
				+ ", rStatus=" + rStatus + "]";
	}

	
	

	
	
	
	
	
}
