package com.eportal.DAO;

import java.util.List;

import com.eportal.ORM.ChangeInfo;

public interface IChangeInfo_Dao {
	
	//添加换品交换纪录
	public boolean addChange(ChangeInfo item);
	//察看成功换品交换纪录
	@SuppressWarnings("rawtypes")
	public List getAllChange();

	//根据发起交换用户的ID，察看换品交换纪录
	@SuppressWarnings("rawtypes")
	public List getListByChangeUserId(int userID);
	//根据收到交换用户的ID，察看换品交换纪录
	@SuppressWarnings("rawtypes")
	public List getByStatus(int Status);	
	//更新换品交换纪录
	public boolean updateChange(ChangeInfo item);
	//查看我收到的交换记录
	@SuppressWarnings("rawtypes")
	public List getListByUserId(int uid);
	//通过发布物品的id，来查看有谁和它进行交换
	@SuppressWarnings("rawtypes")
	public List getListByGoodsId(int gid);
	//发起的交换(我换别人的)收到（别人还我）成功
	@SuppressWarnings("rawtypes")
	public List getSendChange(int changeUserId,int flag);
	//同意交换
	public boolean changeSuccess(int cid,int changeGoodsId,int goodsId);
	//拒绝交换
	public boolean changeFalse(int cid);
}
