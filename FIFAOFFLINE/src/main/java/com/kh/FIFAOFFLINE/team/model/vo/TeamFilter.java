package com.kh.FIFAOFFLINE.team.model.vo;

public class TeamFilter {
	
	private String tArea1;
	private String tArea2;
	private String tArea3;
	private String tArea4;
	private String tArea5;
	private String tArea6;
	private String tArea7;
	private String tArea8;
	public TeamFilter() {
		super();
	}
	public TeamFilter(String tArea1, String tArea2, String tArea3, String tArea4, String tArea5, String tArea6,
			String tArea7, String tArea8) {
		super();
		this.tArea1 = tArea1;
		this.tArea2 = tArea2;
		this.tArea3 = tArea3;
		this.tArea4 = tArea4;
		this.tArea5 = tArea5;
		this.tArea6 = tArea6;
		this.tArea7 = tArea7;
		this.tArea8 = tArea8;
	}
	public String gettArea1() {
		return tArea1;
	}
	public void settArea1(String tArea1) {
		this.tArea1 = tArea1;
	}
	public String gettArea2() {
		return tArea2;
	}
	public void settArea2(String tArea2) {
		this.tArea2 = tArea2;
	}
	public String gettArea3() {
		return tArea3;
	}
	public void settArea3(String tArea3) {
		this.tArea3 = tArea3;
	}
	public String gettArea4() {
		return tArea4;
	}
	public void settArea4(String tArea4) {
		this.tArea4 = tArea4;
	}
	public String gettArea5() {
		return tArea5;
	}
	public void settArea5(String tArea5) {
		this.tArea5 = tArea5;
	}
	public String gettArea6() {
		return tArea6;
	}
	public void settArea6(String tArea6) {
		this.tArea6 = tArea6;
	}
	public String gettArea7() {
		return tArea7;
	}
	public void settArea7(String tArea7) {
		this.tArea7 = tArea7;
	}
	public String gettArea8() {
		return tArea8;
	}
	public void settArea8(String tArea8) {
		this.tArea8 = tArea8;
	}
	@Override
	public String toString() {
		return "TeamFilter [tArea1=" + tArea1 + ", tArea2=" + tArea2 + ", tArea3=" + tArea3 + ", tArea4=" + tArea4
				+ ", tArea5=" + tArea5 + ", tArea6=" + tArea6 + ", tArea7=" + tArea7 + ", tArea8=" + tArea8 + "]";
	}
	
	

	
	

}
