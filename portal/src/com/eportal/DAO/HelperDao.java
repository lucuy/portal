package com.eportal.DAO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class HelperDao extends HibernateDaoSupport {
	
	@SuppressWarnings("rawtypes")
	public List loadAll(Class entityClass)
	{
		List list = new ArrayList();
		try{
			list = getHibernateTemplate().loadAll(entityClass);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public List find(String hql)
	{
		List list = new ArrayList();
		try{
			list = getHibernateTemplate().find(hql);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public List conditionFind(int districtId, int typeId, String searchValue,
			String degree, double minprice,double maxprice )
	{
//		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
//		// 模糊查找		
//		Criteria criteria = session.createCriteria(GoodsInfo.class);//准则
//		
//		if(districtId != 0)
//		{
////			String hql = "from GoodsInfo g where g.usersInfo.district.districtId="+districtId;
////			return this.find(hql);
//			
//			criteria.add(Restrictions.eq("usersInfo.district", null));
//		}
//		if(typeId != 0)
//		{
//			criteria.add(Restrictions.eq("goodsTypeInfo.typeInfoId", new Integer(typeId)));
//		}
//		if(searchValue != null && !searchValue.equals(""))
//		{
//			criteria.add(Restrictions.like("goodsName", "%"+searchValue+"%"));
//		}
//		if(degree != null && !degree.equals(""))
//		{
//			criteria.add(Restrictions.eq("degree", degree));
//		}
//		if(price != 0)
//		{
//			criteria.add(Restrictions.eq("goodsPrice", price));
//		}
//		
//		List list = criteria.list();
//		
//		
//		return list;
		
		String hql = "from GoodsInfo g where  ";
		
		if(districtId != 0)
		{
			hql += " g.goodsExist = 1 and g.goodsState != 1 and g.usersInfo.district.districtId = "+districtId;
		}
		else
		{
			hql += " g.goodsExist = 1 and g.goodsState != 1 and g.goodsName like "+"'%"+searchValue+"%' ";
		}
		if(typeId != 0)
		{
			hql += " and g.goodsTypeInfo.typeInfoId = "+typeId;
		}
		
		if(degree != null && !degree.equals(""))
		{
			hql += " and g.degree = '"+degree+"'";
		}
		if( maxprice != 0)
		{
			hql += " and g.goodsPrice between " + minprice +" and " +maxprice;
		}
		if(searchValue != null && !searchValue.equals(""))
		{
			hql += " and g.goodsName like "+"'%"+searchValue+"%'  ";
		}
		
		return this.find(hql);
	}
	
	

	@SuppressWarnings("rawtypes")
	public List find(String hql,Object value)
	{
		List list = new ArrayList();
		try{
			list = getHibernateTemplate().find(hql,value);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public List find(String hql,Object[] values)
	{
		List list = new ArrayList();
		try{
			list = getHibernateTemplate().find(hql, values);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public Object get(Class entityClass,int id)
	{
		Object obj = null;
		try {
		    obj = getHibernateTemplate().get(entityClass, id);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;
	}
	
	public boolean save(Object obj)
	{
		boolean b = false;
		try {
			getHibernateTemplate().saveOrUpdate(obj);
			b = true;
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	public boolean update(Object obj)
	{
		boolean b = false;
		try{
			getHibernateTemplate().update(obj);
			b = true;
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return b;
	}
	
	/*public Session getS(){
		return HibernateSessionFactory.getSession();
	}
	
	public boolean update(String hql)
	{
		Transaction tx = null;
		try {
        	tx = getS().beginTransaction();
        	int updatedEntities = getS().createQuery( hql ).executeUpdate();
        	tx.commit();
        	return true;
        } catch (Exception  re) {
            tx.rollback();
        	re.printStackTrace();
        	return false;
        }		
		

	}*/
	
	
}
