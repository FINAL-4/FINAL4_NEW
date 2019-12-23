package com.kh.FIFAOFFLINE.notice.model.vo;

public class Catagory {
	private int cId;
	private String cName;
	
	public Catagory() {}

	public Catagory(int cId, String cName) {
		super();
		this.cId = cId;
		this.cName = cName;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	@Override
	public String toString() {
		return "Catagory [cId=" + cId + ", cName=" + cName + "]";
	}
	
	
}
