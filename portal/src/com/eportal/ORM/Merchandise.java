package com.eportal.ORM;

import java.util.Date;

/**
 * Merchandise entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Merchandise implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Category category;
	private String merName;
	private Double price;
	private String sprice;
	private String merModel;
	private String picture;
	private String video;
	private String merDesc;
	private String manufacturer;
	private Date leaveFactoryDate;
	private Integer special;
	private String htmlPath;
	private Integer status;	
	private Member member;
	private int merStatus;
	private int appraiseId;
	/*private Appraise appraise;*/

	// Constructors

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	/** default constructor */
	public Merchandise() {
	}

	/** full constructor */
	public Merchandise(Category category, String merName, Double price,
			String sprice, String merModel, String picture, String video,
			String merDesc, String manufacturer, Date leaveFactoryDate,
			Integer special, String htmlPath,Integer appraiseId) {
		this.category = category;
		this.merName = merName;
		this.price = price;
		this.sprice = sprice;
		this.merModel = merModel;
		this.picture = picture;
		this.video = video;
		this.merDesc = merDesc;
		this.manufacturer = manufacturer;
		this.leaveFactoryDate = leaveFactoryDate;
		this.special = special;
		this.htmlPath = htmlPath;
		this.appraiseId = appraiseId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getMerName() {
		return this.merName;
	}

	public void setMerName(String merName) {
		this.merName = merName;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSprice() {
		return this.sprice;
	}

	public void setSprice(String sprice) {
		//String sp="";
		if(sprice.equals("0")){
			sprice="三成新";
			this.sprice = sprice;
		}else
		if(sprice.equals("1")){
			sprice="五成新";
			this.sprice = sprice;
		}else
		if(sprice.equals("2")){
			sprice="六成新";
			this.sprice = sprice;
		}else
		if(sprice.equals("3")){
			sprice="七成新";
			this.sprice = sprice;
		}else
		if(sprice.equals("4")){
			sprice="八成新";
			this.sprice = sprice;
		}else
		if(sprice.equals("5")){
			sprice="九成新";
			this.sprice = sprice;
		}else
		if(sprice.equals("6")){
			sprice="全新";
			this.sprice = sprice;
		}else{
		this.sprice = sprice;}
	}

	public String getMerModel() {
		return this.merModel;
	}

	public void setMerModel(String merModel) {
		this.merModel = merModel;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getVideo() {
		return this.video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getMerDesc() {
		return this.merDesc;
	}

	public void setMerDesc(String merDesc) {
		this.merDesc = merDesc;
	}

	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Date getLeaveFactoryDate() {
		return this.leaveFactoryDate;
	}

	public void setLeaveFactoryDate(Date leaveFactoryDate) {
		this.leaveFactoryDate = leaveFactoryDate;
	}

	public Integer getSpecial() {
		return this.special;
	}

	public void setSpecial(Integer special) {
		this.special = special;
	}

	public String getHtmlPath() {
		return this.htmlPath;
	}

	public void setHtmlPath(String htmlPath) {
		this.htmlPath = htmlPath;
	}

	public int getMerStatus() {
		return merStatus;
	}

	public void setMerStatus(int merStatus) {
		this.merStatus = merStatus;
	}

	public int getAppraiseId() {
		return appraiseId;
	}

	public void setAppraiseId(int appraiseId) {
		this.appraiseId = appraiseId;
	}

	/*public Appraise getAppraise() {
		return appraise;
	}

	public void setAppraise(Appraise appraise) {
		this.appraise = appraise;
	}*/
	
}