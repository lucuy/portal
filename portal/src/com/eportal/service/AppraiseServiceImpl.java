package com.eportal.service;

import java.util.List;

import com.eportal.DAO.BaseDAO;
import com.eportal.ORM.Appraise;

public class AppraiseServiceImpl implements AppraiseService {

	/** 通过依赖注入DAO组件实例 */
	BaseDAO dao;
	@Override
	public List getAllAppraiseById(int goodsID) {
		// TODO Auto-generated method stub
		String hql="from Appraise a where a.merchandInfo.id="+goodsID;
		return dao.query(hql);
	}

	@Override
	public Appraise loadAppraise(Integer id) {
		// TODO Auto-generated method stub
		return (Appraise) dao.loadById(Appraise.class,id);
	}

	@Override
	public boolean delAppraise(Appraise appraise) {
		// TODO Auto-generated method stub
		if(appraise!=null){
		 dao.delBySerId(appraise);
		 return true;
		 }else{
			 return false;
		 }
	}

	@Override
	public boolean saveOrUpdateAppraise(Appraise appraise) {
		boolean status = false;
		try{
			dao.saveOrUpdate(appraise);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	@Override
	public List getAllAppraiseByMemb(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getAllAppraise() {
		// TODO Auto-generated method stub
		return dao.listAll("Appraise");
	}

	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public Appraise LoadAppraise(int merId) {
		// TODO Auto-generated method stub
		return (Appraise) dao.loadObject("from Appraise as a where a.merchandInfo.id="+merId);
			}
}
