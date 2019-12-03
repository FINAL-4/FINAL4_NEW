package com.kh.FIFAOFFLINE.match.model.vo;

import java.sql.Date;

public class MatchFilter {
	
	private Date sDate;
	private Date eDate;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;
	private String mSystem;
	private String time1;
	private String time2;
	private String time3;
	private String time4;
	private String time5;
	private String time6;

	public MatchFilter() {}

	public MatchFilter(Date sDate, Date eDate, String mon, String tue, String wed, String thu, String fri, String sat,
			String sun, String mSystem, String time1, String time2, String time3, String time4, String time5,
			String time6) {
		super();
		this.sDate = sDate;
		this.eDate = eDate;
		this.mon = mon;
		this.tue = tue;
		this.wed = wed;
		this.thu = thu;
		this.fri = fri;
		this.sat = sat;
		this.sun = sun;
		this.mSystem = mSystem;
		this.time1 = time1;
		this.time2 = time2;
		this.time3 = time3;
		this.time4 = time4;
		this.time5 = time5;
		this.time6 = time6;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public Date geteDate() {
		return eDate;
	}

	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public String getTue() {
		return tue;
	}

	public void setTue(String tue) {
		this.tue = tue;
	}

	public String getWed() {
		return wed;
	}

	public void setWed(String wed) {
		this.wed = wed;
	}

	public String getThu() {
		return thu;
	}

	public void setThu(String thu) {
		this.thu = thu;
	}

	public String getFri() {
		return fri;
	}

	public void setFri(String fri) {
		this.fri = fri;
	}

	public String getSat() {
		return sat;
	}

	public void setSat(String sat) {
		this.sat = sat;
	}

	public String getSun() {
		return sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}

	public String getmSystem() {
		return mSystem;
	}

	public void setmSystem(String mSystem) {
		this.mSystem = mSystem;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public String getTime3() {
		return time3;
	}

	public void setTime3(String time3) {
		this.time3 = time3;
	}

	public String getTime4() {
		return time4;
	}

	public void setTime4(String time4) {
		this.time4 = time4;
	}

	public String getTime5() {
		return time5;
	}

	public void setTime5(String time5) {
		this.time5 = time5;
	}

	public String getTime6() {
		return time6;
	}

	public void setTime6(String time6) {
		this.time6 = time6;
	}

	@Override
	public String toString() {
		return "MatchFilter [sDate=" + sDate + ", eDate=" + eDate + ", mon=" + mon + ", tue=" + tue + ", wed=" + wed
				+ ", thu=" + thu + ", fri=" + fri + ", sat=" + sat + ", sun=" + sun + ", mSystem=" + mSystem
				+ ", time1=" + time1 + ", time2=" + time2 + ", time3=" + time3 + ", time4=" + time4 + ", time5="
				+ time5 + ", time6=" + time6 + "]";
	}
	
	
	
	
}
