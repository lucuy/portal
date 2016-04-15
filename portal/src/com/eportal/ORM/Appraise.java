package com.eportal.ORM;

@SuppressWarnings("serial")
public class Appraise implements java.io.Serializable{
	private Integer appraiseId;
	private Member memberInfo;
	private Merchandise merchandInfo;
	private String appraiseContent;
	private String appraiseTime;
	private int appraiseStatus;
	private int appraiseExist;
	
	public Appraise(){
		super();
	}
	
	public Appraise(Integer appraiseId, Member memberInfo,
			Merchandise merchandInfo, String appraiseContent,
			String appraiseTime, int appraiseStatus, int appraiseExist) {
		super();
		this.appraiseId = appraiseId;
		this.memberInfo = memberInfo;
		this.merchandInfo = merchandInfo;
		this.appraiseContent = appraiseContent;
		this.appraiseTime = appraiseTime;
		this.appraiseStatus = appraiseStatus;
		this.appraiseExist = appraiseExist;
	}

	public Integer getAppraiseId() {
		return appraiseId;
	}
	public void setAppraiseId(Integer appraiseId) {
		this.appraiseId = appraiseId;
	}
	public Member getMemberInfo() {
		return memberInfo;
	}
	public void setMemberInfo(Member memberInfo) {
		this.memberInfo = memberInfo;
	}
	public Merchandise getMerchandInfo() {
		return merchandInfo;
	}
	public void setMerchandInfo(Merchandise merchandInfo) {
		this.merchandInfo = merchandInfo;
	}
	public String getAppraiseContent() {
		return appraiseContent;
	}
	public void setAppraiseContent(String appraiseContent) {
		this.appraiseContent = appraiseContent;
	}
	public String getAppraiseTime() {
		return appraiseTime;
	}
	public void setAppraiseTime(String appraiseTime) {
		this.appraiseTime = appraiseTime;
	}
	public int getAppraiseExist() {
		return appraiseExist;
	}
	public void setAppraiseExist(int appraiseExist) {
		this.appraiseExist = appraiseExist;
	}
	public int getAppraiseStatus() {
		return appraiseStatus;
	}
	public void setAppraiseStatus(int appraiseStatus) {
		this.appraiseStatus = appraiseStatus;
	}
	
	
}
