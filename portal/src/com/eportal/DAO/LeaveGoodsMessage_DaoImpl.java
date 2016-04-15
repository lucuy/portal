package com.eportal.DAO;

import java.util.List;

import com.eportal.ORM.LeaveGoodsMessage;

public class LeaveGoodsMessage_DaoImpl extends BaseDAOImpl implements ILeaveGoodsMessage_Dao {

	@Override
	public boolean addGoodsMessage(LeaveGoodsMessage item) {
		// TODO Auto-generated method stub
		return false;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getAllGoodsMessage(int goodsID) {
		// TODO Auto-generated method stub
		return null;
	}

	/*public boolean addGoodsMessage(LeaveGoodsMessage item) {
		return super.saveOrUpdate(item) ;
	}

	public List getAllGoodsMessage(int goodsID) {
		String hql = "from LeaveGoodsMessage l where l.goodsInfo.goodsId = ?";
		return super.loadById(hql, goodsID);
	}*/

}
