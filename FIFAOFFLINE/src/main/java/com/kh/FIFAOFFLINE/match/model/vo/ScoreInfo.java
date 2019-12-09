package com.kh.FIFAOFFLINE.match.model.vo;

public class ScoreInfo {
	private int msId;
	private int tId;
	private int otId;
	private String score;
	private String result;

	public ScoreInfo () {}

	public ScoreInfo(int msId, int tId, int otId, String score, String result) {
		super();
		this.msId = msId;
		this.tId = tId;
		this.otId = otId;
		this.score = score;
		this.result = result;
	}

	public int getMsId() {
		return msId;
	}

	public void setMsId(int msId) {
		this.msId = msId;
	}

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public int getOtId() {
		return otId;
	}

	public void setOtId(int otId) {
		this.otId = otId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "ScoreInfo [msId=" + msId + ", tId=" + tId + ", otId=" + otId + ", score=" + score + ", result=" + result
				+ "]";
	}

	
	
	
	
}
