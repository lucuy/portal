package com.eportal.DAO;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.eportal.ORM.ChangeInfo;
import com.eportal.ORM.Member;

public class ChangeInfo_DaoImpl extends HelperDao implements IChangeInfo_Dao {
	

	public boolean addChange(ChangeInfo item) {
		return super.save(item);
	}

	@SuppressWarnings("rawtypes")
	public List getAllChange() {
		String hql = "from ChangeInfo c where 1 = 1 order by c.changeId desc";
		return super.find(hql);
	}

	public boolean updateChange(ChangeInfo item) {
		return super.update(item);
	}

	
	@SuppressWarnings("rawtypes")
	public List getListByChangeUserId(int userID) {
		String hql = "from ChangeInfo c where c.usersInfoByChangeUserId.id = ? ";
		return super.find(hql, userID);
	}
	//查询交换不等于2（交换成功的物品）
		@SuppressWarnings("rawtypes")
		public List getListByUserId(int uid)
		{
			String hql = "from ChangeInfo c where c.usersInfoByUserId.id = ?";
			return super.find(hql,uid);
		}

	@SuppressWarnings("rawtypes")
	public List getUserId(int userID) {
		String hql = "from ChangeInfo c where c.usersInfoByUserId.id = ?";
		return super.find(hql, userID);
	}

	@SuppressWarnings("rawtypes")
	public List getByStatus(int Status) {
		Member u = (Member)ServletActionContext.getRequest().getSession().getAttribute("member");
		String hql = "from ChangeInfo c where c.usersInfoByChangeUserId.id="+u.getId()+" or c.usersInfoByUserId.id="+u.getId()+" and c.changeState=? ";
		return super.find(hql, Status);
	}

	
	//通过发布物品的id，来查看有谁和它进行交换
	@SuppressWarnings("rawtypes")
	public List getListByGoodsId(int gid)
	{
		String hql = "from ChangeInfo c where c.goodsInfoByChangeGoodsId = " + gid;
		return super.find(hql);
	}
	
	
	//发起的交换(我换别人的)收到（别人还我）成功
	@SuppressWarnings("rawtypes")
	public List getSendChange(int changeUserId,int flag)
	{
		String hql ;
		if(flag == 1)
		{
			hql = "from ChangeInfo c where c.usersInfoByUserId ="+changeUserId+"  and c.changeExist = 1 and c.changeState = 1";;
		}
		else if(flag ==2 )
		{
			hql = "from ChangeInfo c where c.usersInfoByChangeUserId ="+changeUserId+"  and c.changeExist = 1 and c.changeState = 1";
		}
		else
		{
			hql = "from ChangeInfo c where ( c.usersInfoByChangeUserId ="+changeUserId+" or c.usersInfoByUserId ="+changeUserId+" ) and c.changeExist = 1 and c.changeState =2 ";
		}
		return super.find(hql);
	}
	
	//同意交换
	public boolean changeSuccess(int cid,int changeGoodsId,int goodsId)
	{
		String hql = "update ChangeInfo c set c.changeState = 2 where c.changeId = " +cid;
		boolean b = super.update(hql);
		if(b)
		{
			String str1 = "update Merchandise m set m.merStatus = 1 where m.id = "+changeGoodsId;
			String str2 ="update Merchandise m set m.merStatus = 1 where m.id = " + goodsId;
			b = super.update(str1);
			b = super.update(str2);
			
		}
		return b;
	}
	
	//拒绝交换
	public boolean changeFalse(int cid)
	{
		String hql = "update ChangeInfo c set c.changeState = 3 where c.changeId = " +cid;
		return super.update(hql);
	}
	
	

	

	

}
