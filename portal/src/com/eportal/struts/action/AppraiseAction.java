package com.eportal.struts.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.eportal.ORM.Appraise;
import com.eportal.ORM.ChangeInfo;
import com.eportal.ORM.LeaveGoodsMessage;
import com.eportal.ORM.Member;
import com.eportal.ORM.Merchandise;
import com.eportal.service.AppraiseService;
import com.eportal.service.AppraiseServiceImpl;
import com.eportal.service.IChangeInfoService;
import com.eportal.service.LeaveGoodsMessageService;
import com.eportal.service.MemberService;
import com.eportal.service.MerchandiseService;
import com.opensymphony.xwork2.ActionSupport;

public class AppraiseAction extends ActionSupport{
	
	LeaveGoodsMessageService leaveService;
	MerchandiseService merService;
	MemberService memberService;
	IChangeInfoService changeinfoService;
	AppraiseService appraiseService;
	int memId;
	int membId;
	String content;
	int myMerId;
	private int messageId;
	private String actionMsg;	//Action间传递的消息参数
	private Integer goodInfoId;//易物单id
	private Merchandise model=new Merchandise();//用于封装商品属性模型
	private List list;
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Merchandise getModel() {
		return model;
	}
	public void setModel(Merchandise model) {
		this.model = model;
	}
	public String addAppraise() {
		
		if(memId!=0)
		{
			Appraise ap = new Appraise();
			//获得物品的id
			Merchandise mermg  = new Merchandise();
			mermg = merService.loadMerchandise(memId);
			ap.setMerchandInfo(mermg);
			
			//获得用户的id
			/*Member u = merService.loadMerchandise(memId).getMember();*/
			Member u = (Member)ServletActionContext.getRequest().getSession().getAttribute("member");
			u.setId(u.getId());
			ap.setMemberInfo(u);
			//把评论内容放入实体类中
			ap.setAppraiseContent(content);
			
			//把留言时间放到实体类中
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			ap.setAppraiseTime(sdf.format(d));
			//默认存在
			
			ap.setAppraiseExist(1);
			ap.setAppraiseStatus(1);
			boolean b=appraiseService.saveOrUpdateAppraise(ap);
			if(b!=false){
				//给商品添加留言对应Id
				//appraiseService.LoadAppraise(memId).getAppraiseId();
				mermg.setAppraiseId(ap.getAppraiseId());
				merService.saveOrUpdateMerchandise(mermg);
				
				ChangeInfo changeInfo=changeinfoService.getChangeInfoById(goodInfoId);
				if(changeInfo.getGoodsInfoByChangeGoodsId().getAppraiseId()!=0&&changeInfo.getGoodsInfoByGoodsId().getAppraiseId()!=0){
				changeInfo.setChangeState(3);
				changeinfoService.updateChange(changeInfo);
				//Math.floor(changeInfo.getGoodsInfoByChangeGoodsId().getPrice()/100.00);
				Member changeMember=changeInfo.getUsersInfoByChangeUserId();
				Member member=changeInfo.getUsersInfoByUserId();
				changeMember.setIntegral(changeMember.getIntegral().intValue()+5*(int)Math.floor(changeInfo.getGoodsInfoByChangeGoodsId().getPrice()/100));
				member.setIntegral(member.getIntegral().intValue()+5*(int)Math.floor(changeInfo.getGoodsInfoByGoodsId().getPrice()/100));
				memberService.saveOrUpdateMember(changeMember);
				memberService.saveOrUpdateMember(member);
				}else{
					
				}
			}else{
				
			}
		try {
			ServletActionContext.getResponse().getWriter().write(b+"");
			ServletActionContext.getResponse().getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
		}
		return null;
	}
	public String showAppraise(){
		//根据商品ID获取评论信息
		if (memId!=0){
			list =appraiseService.getAllAppraiseById(memId);
			return "success";
		}else{
		return null;
		}
	} 
	public String getAllAppriase(){
		list=appraiseService.getAllAppraise();
		return "success";
		
	}
	
	public String changeMessageStatus(){
		
		return "success";
	}
	/**未查看过的信息*/
	public String newMessages(){
		if(actionMsg!=null){
			try {
				actionMsg = new String(actionMsg.getBytes("ISO8859-1"),"gbk");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			addActionMessage(actionMsg);
		}
		Member u = (Member)ServletActionContext.getRequest().getSession().getAttribute("member");
		if (u==null){//当前会员进行订单管理
			addActionMessage(getText("orders_add_notlogin"));
		}else{
			
			list=leaveService.getAllGoodsMessageByMemb(u.getId());
		}
		return SUCCESS;
	}
	
	public String delAppraise(){
		
		boolean b=appraiseService.delAppraise(appraiseService.loadAppraise(id));
		if(b){
		return "success";
		}else{
			return "fail";
		}
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public int getMembId() {
		return membId;
	}

	public void setMembId(int membId) {
		this.membId = membId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LeaveGoodsMessageService getLeaveService() {
		return leaveService;
	}

	public void setLeaveService(LeaveGoodsMessageService leaveService) {
		this.leaveService = leaveService;
	}

	public MerchandiseService getMerService() {
		return merService;
	}

	public void setMerService(MerchandiseService merService) {
		this.merService = merService;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public int getMyMerId() {
		return myMerId;
	}
	public void setMyMerId(int myMerId) {
		this.myMerId = myMerId;
	}
	public IChangeInfoService getChangeinfoService() {
		return changeinfoService;
	}
	public void setChangeinfoService(IChangeInfoService changeinfoService) {
		this.changeinfoService = changeinfoService;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getActionMsg() {
		return actionMsg;
	}
	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}
	public AppraiseService getAppraiseService() {
		return appraiseService;
	}
	public void setAppraiseService(AppraiseService appraiseService) {
		this.appraiseService = appraiseService;
	}
	public Integer getGoodInfoId() {
		return goodInfoId;
	}
	public void setGoodInfoId(Integer goodInfoId) {
		this.goodInfoId = goodInfoId;
	}
	
}
