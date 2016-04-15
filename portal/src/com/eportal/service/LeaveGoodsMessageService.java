package com.eportal.service;

import java.util.List;

import com.eportal.ORM.LeaveGoodsMessage;
import com.eportal.ORM.Merchandise;

public interface LeaveGoodsMessageService {
	
	
	//查询该物品的所有的留言
	public List getAllGoodsMessage(int goodsID);
	/** 装载指定的留言 */	
	public LeaveGoodsMessage loadGoodsMessage(Integer id);	
	/** 删除指定的留言 */	
	public boolean delGoodsMessage(LeaveGoodsMessage leaveMessage);	
	/** 新增或修改留言 */
	public boolean saveOrUpdateLeaveMessage(LeaveGoodsMessage message);
	/**查看用户所有未查看信息*/
	public List getAllGoodsMessageByMemb(int memberId);
	/**查询所有留言信息*/
	public List getAllMessages();
}
