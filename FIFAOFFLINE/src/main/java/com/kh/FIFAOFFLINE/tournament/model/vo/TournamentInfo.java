package com.kh.FIFAOFFLINE.tournament.model.vo;

import java.sql.Date;

public class TournamentInfo {
	private int toNo;
	private String toName;
	private String toContent;
	private String toStatus;
	private String toReward;
	private String toLocation;
	private Date createDate;
	
	public TournamentInfo() {}

	public TournamentInfo(int toNo, String toName, String toContent, String toStatus, String toReward,
			String toLocation, Date createDate) {
		super();
		this.toNo = toNo;
		this.toName = toName;
		this.toContent = toContent;
		this.toStatus = toStatus;
		this.toReward = toReward;
		this.toLocation = toLocation;
		this.createDate = createDate;
	}

	public int getToNo() {
		return toNo;
	}

	public void setToNo(int toNo) {
		this.toNo = toNo;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getToContent() {
		return toContent;
	}

	public void setToContent(String toContent) {
		this.toContent = toContent;
	}

	public String getToStatus() {
		return toStatus;
	}

	public void setToStatus(String toStatus) {
		this.toStatus = toStatus;
	}

	public String getToReward() {
		return toReward;
	}

	public void setToReward(String toReward) {
		this.toReward = toReward;
	}

	public String getToLocation() {
		return toLocation;
	}

	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "TournamentInfo [toNo=" + toNo + ", toName=" + toName + ", toContent=" + toContent + ", toStatus="
				+ toStatus + ", toReward=" + toReward + ", toLocation=" + toLocation + ", createDate=" + createDate
				+ "]";
	}
	
	
	
	
	
}
