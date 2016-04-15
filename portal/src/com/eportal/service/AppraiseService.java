package com.eportal.service;

import java.util.List;

import com.eportal.ORM.Appraise;

public interface AppraiseService {
	//查询该物品的所有的评价
			public List getAllAppraiseById(int goodsID);
			/** 装载指定的评价 */	
			public Appraise loadAppraise(Integer id);	
			/** 删除指定的评价*/	
			public boolean delAppraise(Appraise appraise);	
			/** 新增或修改评价 */
			public boolean saveOrUpdateAppraise(Appraise appraise);
			/**查看用户所有未查看评价*/
			public List getAllAppraiseByMemb(int memberId);
			/**查询所有留言评价*/
			public List getAllAppraise();
			public Appraise LoadAppraise(int merId);
}
