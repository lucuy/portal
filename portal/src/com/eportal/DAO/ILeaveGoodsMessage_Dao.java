package com.eportal.DAO;

import java.util.List;

import com.eportal.ORM.LeaveGoodsMessage;

public interface ILeaveGoodsMessage_Dao {
	
	//添加对对物品的留言
	public boolean addGoodsMessage(LeaveGoodsMessage item);
	
	
	//查询该物品的所有的留言
	@SuppressWarnings("rawtypes")
	public List getAllGoodsMessage(int goodsID);
}
