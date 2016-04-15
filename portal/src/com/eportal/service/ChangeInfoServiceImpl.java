package com.eportal.service;

import java.util.List;

import com.eportal.DAO.BaseDAO;
import com.eportal.DAO.IChangeInfo_Dao;
import com.eportal.ORM.ChangeInfo;

public class ChangeInfoServiceImpl implements IChangeInfoService {
	BaseDAO dao;
	private IChangeInfo_Dao ichangeinfo_dao;
	
	public IChangeInfo_Dao getIchangeinfo_dao() {
		return ichangeinfo_dao;
	}

	public void setIchangeinfo_dao(IChangeInfo_Dao ichangeinfo_dao) {
		this.ichangeinfo_dao = ichangeinfo_dao;
	}

	public boolean addChange(ChangeInfo item) {
		boolean status = false;
		try{
			dao.saveOrUpdate(item);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	public List getAllChange() {
		// TODO Auto-generated method stub
		return ichangeinfo_dao.getAllChange();
	}

	public List getListByChangeUserId(int userID) {
		// TODO Auto-generated method stub
		return ichangeinfo_dao.getListByChangeUserId(userID);
	}

	public boolean updateChange(ChangeInfo item) {
		// TODO Auto-generated method stub
		return ichangeinfo_dao.updateChange(item);
	}
	
	//通过发布物品的id，来查看有谁和它进行交换
	public List getListByGoodsId(int gid)
	{
		return ichangeinfo_dao.getListByGoodsId(gid);
	}
	
	//查询交换不等于2（交换成功的物品）
	public List getListByUserId(int uid)
	{
		return ichangeinfo_dao.getListByUserId(uid);
	}

	public List getSendChange(int changeUserId, int flag) {
		return ichangeinfo_dao.getSendChange(changeUserId, flag);
	}

	public boolean changeFalse(int cid) {
		// TODO Auto-generated method stub
		return ichangeinfo_dao.changeFalse(cid);
	}

	public boolean changeSuccess(int cid, int changeGoodsId, int goodsId) {
		// TODO Auto-generated method stub
		return ichangeinfo_dao.changeSuccess(cid, changeGoodsId, goodsId);
	}

	@Override
	public List getByStatus(int state) {
		// TODO Auto-generated method stub
		return ichangeinfo_dao.getByStatus(state);
	}

	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public List getAllChangeInfo() {
		// TODO Auto-generated method stub
		return dao.listAll("ChangeInfo");
	}

	
	public ChangeInfo getChangeInfoById(Integer id) {
		// TODO Auto-generated method stub
		return (ChangeInfo) dao.loadById(ChangeInfo.class,id);
	}

	@Override
	public boolean delChangeById(ChangeInfo changeInfo) {
		// TODO Auto-generated method stub
		if(changeInfo!=null){
		dao.delBySerId(changeInfo);
		return true;
		}else{
		return false;
		}
	}

}
