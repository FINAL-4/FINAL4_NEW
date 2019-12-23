package  com.kh.FIFAOFFLINE.notice.model.vo;

public class SearchCondition {
	private int catagory;
	private String sCondition;
	private String sContent;
	
	public SearchCondition() {}
	
	public SearchCondition(int catagory, String sCondition, String sContent) {
		super();
		this.catagory = catagory;
		this.sCondition = sCondition;
		this.sContent = sContent;
	}
	public int getCatagory() {
		return catagory;
	}
	public void setCatagory(int catagory) {
		this.catagory = catagory;
	}
	public String getsCondition() {
		return sCondition;
	}
	public void setsCondition(String sCondition) {
		this.sCondition = sCondition;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	@Override
	public String toString() {
		return "SearchCondition [catagory=" + catagory + ", sCondition=" + sCondition + ", sContent=" + sContent + "]";
	}
	
	
	
}
