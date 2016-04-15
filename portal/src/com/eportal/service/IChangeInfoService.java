package com.eportal.service;

import java.util.List;

import com.eportal.ORM.ChangeInfo;

public interface IChangeInfoService {
	//添加换品交换纪录
	public boolean addChange(ChangeInfo item);
	//察看成功换品交换纪录
	public List getAllChange();

	//根据发起交换用户的ID，察看换品交换纪录
	public List getListByChangeUserId(int userID);
	//根据收到交换用户的ID，察看换品交换纪录
	public List getByStatus(int state);	
	//更新换品交换纪录
	public boolean updateChange(ChangeInfo item);
	
	//通过发布物品的id，来查看有谁和它进行交换
	public List getListByGoodsId(int gid);
	//查询交换不等于2（交换成功的物品）
	public List getListByUserId(int uid);
	//发起的交换(我换别人的)收到（别人还我）成功
	public List getSendChange(int changeUserId,int flag);
	//同意交换
	public boolean changeSuccess(int cid,int changeGoodsId,int goodsId);
	//拒绝交换
	public boolean changeFalse(int cid);
	//查询所有订单
	 public List getAllChangeInfo();
	 public ChangeInfo getChangeInfoById(Integer id);
	 public boolean delChangeById(ChangeInfo changeInfo);
}
