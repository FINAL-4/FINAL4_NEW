package com.kh.FIFAOFFLINE.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nId; 
	private String nTitle;
	private String nContent;
	private String nWriter;
	private int nCount;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nStatus;
	private String filePath;
	
	public Notice() {
	}

	public Notice(int nId, String nTitle, String nContent, String nWriter, int nCount, Date nCreateDate,
			Date nModifyDate, String nStatus, String filePath) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nCount = nCount;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
		this.filePath = filePath;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
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

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", nCount=" + nCount + ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus="
				+ nStatus + ", filePath=" + filePath + "]";
	}

	

	
}     