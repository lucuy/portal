package com.eportal.ORM;

import java.util.List;

/**
 * LeaveGoodsMessage entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class LeaveGoodsMessage implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer messageId;
	private Member memberInfo;
	
	private Merchandise merchandInfo;
	private String messageContent;
	private String messageTime;
	private Merchandise myMerchandInfo;
	private Byte messageExist;//1 代表留言未查看  2代表同意 0代表拒绝
	@SuppressWarnings("rawtypes")
	private List list;
	private ChangeInfo changeInfo;
	
	public Merchandise getMyMerchandInfo() {
		return myMerchandInfo;
	}

	public void setMyMerchandInfo(Merchandise myMerchandInfo) {
		this.myMerchandInfo = myMerchandInfo;
	}

	public Merchandise getMerchandInfo() {
		return merchandInfo;
	}

	public void setMerchandInfo(Merchandise merchandInfo) {
		this.merchandInfo = merchandInfo;
	}

	
	
	@SuppressWarnings("rawtypes")
	public List getList() {
		return list;
	}

	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		this.list = list;
	}

	public Member getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(Member memberInfo) {
		this.memberInfo = memberInfo;
	}

	

	
	
	// Constructors

	/** default constructor */
	public LeaveGoodsMessage() {
	}

	/** full constructor */
	public LeaveGoodsMessage(Member memberInfo, Merchandise MerchandInfo,
			String messageContent,String messageTime, Byte messageExist) {
		this.memberInfo = memberInfo;
		this.merchandInfo = MerchandInfo;
		this.messageContent = messageContent;
		this.messageTime = messageTime;
		this.messageExist = messageExist;
	}

	// Property accessors

	public String getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public String getMessageContent() {
		return this.messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Byte getMessageExist() {
		return this.messageExist;
	}

	public void setMessageExist(Byte messageExist) {
		this.messageExist = messageExist;
	}

	public ChangeInfo getChangeInfo() {
		return changeInfo;
	}

	public void setChangeInfo(ChangeInfo changeInfo) {
		this.changeInfo = changeInfo;
	}

}