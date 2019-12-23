package com.kh.FIFAOFFLINE.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nId; 
	private int cId;
	private int userNo;
	private String profile;
	private String cName;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private int nCount;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nStatus;
	private String filePath;
	private int noticeYN;
	private int likeCount;
	
	public Notice() {
	}

	public Notice(int nId, int cId, int userNo, String profile, String cName, String nTitle, String nContent,
			String nWriter, int nCount, Date nCreateDate, Date nModifyDate, String nStatus, String filePath,
			int noticeYN, int likeCount) {
		super();
		this.nId = nId;
		this.cId = cId;
		this.userNo = userNo;
		this.profile = profile;
		this.cName = cName;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nCount = nCount;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
		this.filePath = filePath;
		this.noticeYN = noticeYN;
		this.likeCount = likeCount;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
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

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getNoticeYN() {
		return noticeYN;
	}

	public void setNoticeYN(int noticeYN) {
		this.noticeYN = noticeYN;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", cId=" + cId + ", userNo=" + userNo + ", profile=" + profile + ", cName="
				+ cName + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter + ", nCount="
				+ nCount + ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus=" + nStatus
				+ ", filePath=" + filePath + ", noticeYN=" + noticeYN + ", LikeCount=" + likeCount + "]";
	}

	

	

	

	

	

	
}     