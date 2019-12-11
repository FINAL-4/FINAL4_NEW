package com.kh.FIFAOFFLINE.tournament.model.vo;

public class TournamentInfo {
	private int toNo;
	private String toName;
	private String toContent;
	private String toStatus;
	
	public TournamentInfo() {}

	public TournamentInfo(int toNo, String toName, String toContent, String toStatus) {
		super();
		this.toNo = toNo;
		this.toName = toName;
		this.toContent = toContent;
		this.toStatus = toStatus;
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

	@Override
	public String toString() {
		return "TournamentInfo [toNo=" + toNo + ", toName=" + toName + ", toContent=" + toContent + ", toStatus="
				+ toStatus + "]";
	}

	
	
	
}
