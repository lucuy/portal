package com.eportal.ORM;

/**
 * ChangeInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ChangeInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer changeId;
	private Merchandise goodsInfoByChangeGoodsId;
	private Member usersInfoByUserId;
	private Member usersInfoByChangeUserId;
	private Merchandise goodsInfoByGoodsId;
	private Integer changeState;//1.等待交换 2.同意交换3.已交换  0.拒绝交换
	private String changeTime;
	private Byte changeExist;

	// Constructors

	/** default constructor */
	public ChangeInfo() {
	}

	/** full constructor */
	public ChangeInfo(Merchandise goodsInfoByChangeGoodsId,
			Member usersInfoByUserId, Member usersInfoByChangeUserId,
			Merchandise goodsInfoByGoodsId, Integer changeState, String changeTime,
			Byte changeExist) {
		this.goodsInfoByChangeGoodsId = goodsInfoByChangeGoodsId;
		this.usersInfoByUserId = usersInfoByUserId;
		this.usersInfoByChangeUserId = usersInfoByChangeUserId;
		this.goodsInfoByGoodsId = goodsInfoByGoodsId;
		this.changeState = changeState;
		this.changeTime = changeTime;
		this.changeExist = changeExist;
	}

	// Property accessors

	public Integer getChangeId() {
		return this.changeId;
	}

	public void setChangeId(Integer changeId) {
		this.changeId = changeId;
	}


	public Merchandise getGoodsInfoByChangeGoodsId() {
		return goodsInfoByChangeGoodsId;
	}

	public void setGoodsInfoByChangeGoodsId(Merchandise goodsInfoByChangeGoodsId) {
		this.goodsInfoByChangeGoodsId = goodsInfoByChangeGoodsId;
	}

	public Member getUsersInfoByUserId() {
		return usersInfoByUserId;
	}

	public void setUsersInfoByUserId(Member usersInfoByUserId) {
		this.usersInfoByUserId = usersInfoByUserId;
	}

	public Member getUsersInfoByChangeUserId() {
		return usersInfoByChangeUserId;
	}

	public void setUsersInfoByChangeUserId(Member usersInfoByChangeUserId) {
		this.usersInfoByChangeUserId = usersInfoByChangeUserId;
	}

	public Merchandise getGoodsInfoByGoodsId() {
		return goodsInfoByGoodsId;
	}

	public void setGoodsInfoByGoodsId(Merchandise goodsInfoByGoodsId) {
		this.goodsInfoByGoodsId = goodsInfoByGoodsId;
	}

	public Integer getChangeState() {
		return this.changeState;
	}

	public void setChangeState(Integer changeState) {
		this.changeState = changeState;
	}

	public String getChangeTime() {
		return this.changeTime;
	}

	public void setChangeTime(String changeTime) {
		this.changeTime = changeTime;
	}

	public Byte getChangeExist() {
		return this.changeExist;
	}

	public void setChangeExist(Byte changeExist) {
		this.changeExist = changeExist;
	}

}