package com.eportal.ORM;


/**
 * Category entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields

	private Integer id;
	private Category category;
	private String cateName;

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(Category category, String cateName) {
		this.category = category;
		this.cateName = cateName;
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

	public String getCateName() {
		return this.cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
}