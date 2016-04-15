package com.eportal.service;

import java.util.List;

import com.eportal.DAO.BaseDAO;
import com.eportal.ORM.LeaveGoodsMessage;
import com.eportal.ORM.Merchandise;

public class LeaveGoodsMessageServiceImpl implements LeaveGoodsMessageService {
	
	/** 通过依赖注入DAO组件实例 */
	BaseDAO dao;
	/** 新增或修改留言 */	
	public boolean saveOrUpdateLeaveMessage(LeaveGoodsMessage message){
		boolean status = false;
		try{
			dao.saveOrUpdate(message);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}
	/** 浏览商品 */
	@SuppressWarnings("unchecked")
	public List<Merchandise> browseMerchandise(){
		return dao.listAll("goodsMessage");
	}

	/** 装载指定的留言*/
	@Override
	public LeaveGoodsMessage loadGoodsMessage(Integer id) {
		// TODO Auto-generated method stub
		return (LeaveGoodsMessage)dao.loadById(LeaveGoodsMessage.class, id);
	}

	/** 删除指定的商品 */
	@Override
	public boolean delGoodsMessage(LeaveGoodsMessage leaveMessage) {
		// TODO Auto-generated method stub
		boolean status = false;
		try{
			dao.delBySerId(leaveMessage);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}
	@Override
	public List getAllGoodsMessage(int goodsID) {
		// TODO Auto-generated method stub
		String hql = "from LeaveGoodsMessage l where l.merchandInfo.id = ?";
		return dao.find(hql, goodsID);
	}
	
	public List getAllGoodsMessageByMemb(int memberId) {
		// TODO Auto-generated method stub
		String hql = "from LeaveGoodsMessage l where messageExist=1 and l.merchandInfo.member.id = ?";
		return dao.find(hql, memberId);
	}
	@Override
	public List getAllMessages() {
		// TODO Auto-generated method stub
		return dao.listAll("LeaveGoodsMessage");
	}

}
