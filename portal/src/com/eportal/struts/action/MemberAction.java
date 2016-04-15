package com.eportal.struts.action;

import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;

import com.eportal.ORM.*;
import com.eportal.service.*;
import com.eportal.util.DoubleSelectNode;
import com.eportal.util.MD5;
import com.eportal.util.SearchResult;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/** 注册会员处理控制器 */
@SuppressWarnings("serial")
public class MemberAction extends ActionSupport implements ModelDriven<Member>{
	/** 通过依赖注入MemberService与MemberLevelService组件实例 */
	MemberService service;
	MemberLevelService memberLevelService;
	CategoryService cateService;
	private List<DoubleSelectNode> doubleSelectNodes;//级联商品分类列表
	private LeaveGoodsMessageService leaveService;
	private boolean messageFlag;
	private List<Member> list;
	private String memberNameList;
	private String timesList;
	
	public List<Member> getList() {
		return list;
	}

	public void setList(List<Member> list) {
		this.list = list;
	}

	public CategoryService getCateService() {
		return cateService;
	}

	public void setCateService(CategoryService cateService) {
		this.cateService = cateService;
	}

	public List<DoubleSelectNode> getDoubleSelectNodes() {
		return doubleSelectNodes;
	}

	public void setDoubleSelectNodes(List<DoubleSelectNode> doubleSelectNodes) {
		this.doubleSelectNodes = doubleSelectNodes;
	}

	/** 注册会员管理所有请求中常用的参数值 */
	private String actionMsg;	//Action间传递的消息参数
	private List<Member> memberList;//注册会员列表
	private List<Memberlevel> memberLevelList;//会员级别列表 
	private String memeberLevel;	//所属会员级别
	private List leaveMessageList;  //未查看留言
	private int useId;//使用积分给useId
	private int myIntegral;//使用积分值
	
	//采用模型驱动
	private Member model=new Member();//用于封装会员属性模型
	public Member getModel() {
		return model;
	}
	
	/** 处理登录请求 */
	public String login(){
		messageFlag=false;
		HttpServletRequest request=ServletActionContext.getRequest();
		model.setLoginName(request.getParameter("loginName"));
		model.setLoginPwd(request.getParameter("loginPwd"));
		//调用业务逻辑组件进行会员登录验证
		Member tempMember = service.memberLogin(model.getLoginName(), MD5.MD5Encode(model.getLoginPwd()));
		if(tempMember!=null){
			//在session中保存当前会员实例
			ServletActionContext.getRequest().getSession().setAttribute("member",tempMember);
			//更新最登录时间及登录次数
			tempMember.setLastDate((new Date())+"");
			tempMember.setLoginTimes(tempMember.getLoginTimes().intValue()+1);
			service.saveOrUpdateMember(tempMember);//调用业务逻辑组件更新会员资料
			leaveMessageList=leaveService.getAllGoodsMessageByMemb(tempMember.getId());
			if(leaveMessageList.size()!=0){
				messageFlag=true;
			ServletActionContext.getRequest().getSession().setAttribute("messageFlag",messageFlag);
			}
			return INPUT;
		}else{
			addActionError(getText("login_fail"));
			return INPUT;				
		}
	}
	
	/** 处理安全退出请求 */
	public String logout(){
		//从session中移除当前会员实例
		ServletActionContext.getRequest().getSession().removeAttribute("member");
		return INPUT;
	}
	
	/** 处理浏览注册会员请求 */
	public String browseMember(){
		if(actionMsg!=null){
			try {
				actionMsg = new String(actionMsg.getBytes("ISO8859-1"),"gbk");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			addActionMessage(actionMsg);
		}
		memberList = service.browseMember();//调用业务逻辑组件取得注册会员列表
		return SUCCESS;
	}
	
	/** 处理新增注册会员请求 */
	public String addMember(){
		//设置以下几个字段的初始值
		model.setRegDate((new Date())+"");
		model.setLoginTimes(0);
		
		//对登录密码进行MD5加密
		model.setLoginPwd(MD5.MD5Encode(model.getLoginPwd().trim()));		
		//与会员级别进行关联
		if(memeberLevel!=null){
			//调用业务逻辑组件装载指定的会员级别
			Memberlevel tempMemberLevel = memberLevelService.loadMemberlevel(Integer.valueOf(memeberLevel));
			model.setMemberlevel(tempMemberLevel);
			//赠送该级别的等额积分
			model.setIntegral(tempMemberLevel.getIntegral());
		}		
		if (service.saveOrUpdateMember(model)){//调用业务逻辑组件保存新增的注册会员
			addActionMessage(getText("member_add_succ"));
		}else{
			addActionMessage(getText("member_add_fail"));
		}
		//为后台会员管理构造会员级别下拉列表数据
		memberLevelList = memberLevelService.browseMemberlevel();		
		return SUCCESS;
	}
	
	/** 处理会员注册请求 */
	public String regMember(){
		//设置以下几个字段的初始值
		model.setRegDate((new Date())+"");
		model.setLoginTimes(0);
		
		//对登录密码进行MD5加密
		model.setLoginPwd(MD5.MD5Encode(model.getLoginPwd().trim()));
		//设置初始会员级别
		Memberlevel tempMemberLevel = memberLevelService.getInitMemberlevel();
		if(tempMemberLevel!=null){
			model.setMemberlevel(tempMemberLevel);
			//赠送该级别的等额积分
			model.setIntegral(tempMemberLevel.getIntegral());
		}
		if (service.saveOrUpdateMember(model)){//调用业务逻辑组件保存新增的注册会员
			addActionMessage(getText("member_add_succ"));
		}else{
			addActionMessage(getText("member_add_fail"));
		}		
		return INPUT;
	}
	
	/** 处理删除注册会员请求 */
	public String delMember(){
		if (model.getId()!=null){
			if (service.delMember(model.getId())){//调用业务逻辑组件删除指定的注册会员
				actionMsg = getText("member_del_succ");
			}else{
				actionMsg = getText("member_del_fail");
			}			
		}else{
			actionMsg = getText("member_del_fail");
		}
		return "toBrowseMember";
	}
	
	/** 处理查看注册会员请求 */
	public String viewMember(){
		if (model.getId()!=null){
			//调用业务逻辑组件装载指定的注册会员
			Member tempMember = service.loadMember(model.getId());
			if (tempMember!=null){
				try {
					//快速复制源对象中的所有属性到目标对象中
					BeanUtils.copyProperties(model, tempMember);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//取得会员级别列表
				memberLevelList = memberLevelService.browseMemberlevel();
				//取得当前会员的级别ID
				memeberLevel = tempMember.getMemberlevel().getId().toString();
				return SUCCESS;
			}else{
				actionMsg = getText("member_view_fail");
				return "toBrowseMember";
			}	
		}else{
			actionMsg = getText("member_view_fail");
			return "toBrowseMember";
		}		
	}
	
	/** 处理装载注册会员请求 */
	public String editMember(){
		if (model.getId()!=null){
			//调用业务逻辑组件装载指定的注册会员			
			Member tempMember = service.loadMember(model.getId());
			if (tempMember!=null){
				try {
					//快速复制源对象中的所有属性到目标对象中
					BeanUtils.copyProperties(model, tempMember);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//取得会员级别列表
				memberLevelList = memberLevelService.browseMemberlevel();
				//取得当前会员的级别ID
				memeberLevel = tempMember.getMemberlevel().getId().toString();			
				return SUCCESS;
			}else{
				actionMsg = getText("member_edit_fail");
				return "toBrowseMember";
			}	
		}else{
			actionMsg = getText("member_edit_fail");
			return "toBrowseMember";
		}		
	}
	
	/** 处理更新注册会员请求 */
	public String updateMember(){
		//调用业务逻辑组件装载指定的注册会员
		Member tempMember = service.loadMember(model.getId());
		//修改会员注册信息
		if (model.getAddress()!=null)tempMember.setAddress(model.getAddress());		
		if (model.getEmail()!=null)tempMember.setEmail(model.getEmail());		
		if (model.getLoginName()!=null)tempMember.setLoginName(model.getLoginName());		
		if (model.getMemberName()!=null)tempMember.setMemberName(model.getMemberName());		
		if (model.getPhone()!=null)tempMember.setPhone(model.getPhone());		
		if (model.getZip()!=null)tempMember.setZip(model.getZip());		
		if (model.getIntegral()!=null)tempMember.setIntegral(model.getIntegral());		
		if (model.getLoginPwd()!=null && model.getLoginPwd().trim().length()>0){//更新密码
			tempMember.setLoginPwd(MD5.MD5Encode(model.getLoginPwd().trim()));

		}
		//与会员级别进行关联
		if (memeberLevel!=null){
			//调用业务逻辑组件装载指定的会员级别
			Memberlevel tempMemberLevel = memberLevelService.loadMemberlevel(Integer.valueOf(memeberLevel));
			tempMember.setMemberlevel(tempMemberLevel);			
		}
		if (service.saveOrUpdateMember(tempMember)){//调用业务逻辑组件更新指定的注册会员
			addActionMessage(getText("member_edit_succ"));
		}else{
			addActionMessage(getText("member_edit_fail"));
		}
		//为后台会员管理构造会员级别下拉列表数据
		memberLevelList = memberLevelService.browseMemberlevel();		
		//如果该会员已经登录,同步修改session中的会员信息
		if (ServletActionContext.getRequest().getSession().getAttribute("member")!=null){
			ServletActionContext.getRequest().getSession().setAttribute("member",tempMember);
		}		
		return INPUT;		
	}
	
	/** 处理会员级别下拉列表请求 */
	public String preAddMember(){
		//为后台会员管理构造会员级别下拉列表数据
		memberLevelList = memberLevelService.browseMemberlevel();
		return SUCCESS;		
	}
	
	/** 手动进行新增注册会员的表单验证 */
	public void validateAddMember(){
		//登录账号必填
		if (model.getLoginName()==null||model.getLoginName().trim().length()<1){
			addFieldError("loginname",getText("member_validation_loginName"));
		}else{//登录账号是否已被占用
			if (!service.isEnable(model.getLoginName().trim())){
				addFieldError("loginname",getText("member_validation_exist"));
			}
		}		
		//登录密码必填
		if (model.getLoginPwd()==null||model.getLoginPwd().trim().length()<1){
			addFieldError("loginpwd",getText("member_validation_loginPwd"));
		}else{
			//核对两次输入的密码是否一致
			String againPwd = ServletActionContext.getRequest().getParameter("againPwd");
			if (againPwd==null || againPwd.trim().length()<1 || !againPwd.trim().equals(model.getLoginPwd())){
				addFieldError("loginpwd",getText("member_validation_checkerr"));
			}				
		}	
		//联系电话为固定电话或手机格式,使用正则表达式进行验证
		if (model.getPhone()!=null && model.getPhone().trim().length()>0 && !Pattern.matches("((\\d{3,4})?(\\-)?(\\d{7,8}))|(0?1\\d{10})", model.getPhone().trim())){
			addFieldError("phone",getText("member_validation_phone"));
		}
		//使用正则表达式验证邮政编码
		if (model.getZip()!=null && model.getZip().trim().length()>0 && !Pattern.matches("\\d{6}", model.getZip().trim())){
			addFieldError("zip",getText("member_validation_zip"));
		}
		//Email合法性验证
		if (model.getEmail()!=null && model.getEmail().trim().length()>0 && !Pattern.matches("\\w+(\\.\\w+)*@\\w+(\\.\\w+)+", model.getEmail().trim())){
			addFieldError("email",getText("member_validation_email"));
		}
		//表单验证失败
		if (hasFieldErrors()){
			//为后台会员管理构造会员级别下拉列表数据
			memberLevelList = memberLevelService.browseMemberlevel();
		}		
	}
	
	/** 手动进行修改注册会员的表单验证 */
	public void validateUpdateMember(){
		//登录账号必填
		if (model.getLoginName()==null||model.getLoginName().trim().length()<1){
			addFieldError("loginname",getText("member_validation_loginName"));
		}else{
			Member tempMember = (Member)ServletActionContext.getRequest().getSession().getAttribute("member");
			if (tempMember==null){//后台的会员修改请求
				tempMember = service.loadMember(model.getId());//装载该会员原始资料
			}
			if (!tempMember.getLoginName().equals(model.getLoginName())){//不是原登录名
				//登录账号是否已被占用
				if (!service.isEnable(model.getLoginName().trim())){
					addFieldError("loginname",getText("member_validation_exist"));
				}					
			}
		}
		//核对两次输入的密码是否一致
		String againPwd = ServletActionContext.getRequest().getParameter("againPwd");
		if (model.getLoginPwd()!=null && !model.getLoginPwd().equals(againPwd)){
			addFieldError("loginpwd",getText("member_validation_checkerr"));
		}		
		//联系电话为固定电话或手机格式,使用正则表达式进行验证
		if (model.getPhone()!=null && model.getPhone().trim().length()>0 && !Pattern.matches("((\\d{3,4})?(\\-)?(\\d{7,8}))|(0?1\\d{10})", model.getPhone().trim())){
			addFieldError("phone",getText("member_validation_phone"));
		}
		//使用正则表达式验证邮政编码
		if (model.getZip()!=null && model.getZip().trim().length()>0 && !Pattern.matches("\\d{6}", model.getZip().trim())){
			addFieldError("zip",getText("member_validation_zip"));
		}
		//Email合法性验证
		if (model.getEmail()!=null && model.getEmail().trim().length()>0 && !Pattern.matches("\\w+(\\.\\w+)*@\\w+(\\.\\w+)+", model.getEmail().trim())){
			addFieldError("email",getText("member_validation_email"));
		}
		//表单验证失败
		if (hasFieldErrors()){
			//为后台会员管理构造会员级别下拉列表数据
			memberLevelList = memberLevelService.browseMemberlevel();
		}
	}	

	/** 手动进行会员注册的表单验证 */
	public void validateRegMember(){
		//调用新增注册会员表单的验证方法实现修改注册会员表单的验证
		validateAddMember();
	}	
	
	/** 处理商品分类级联下拉列表请求 */
	public String preAdMerchandise(){
		//构造商品分类级联数据
		createDoubleSelect();
		return SUCCESS;		
	}
	/** 构造商品分类级联数据 */
	private void createDoubleSelect(){
		doubleSelectNodes=new ArrayList<DoubleSelectNode>();
		DoubleSelectNode node = null;
		DoubleSelectNode tempnode = null;
		List<DoubleSelectNode> nodes = null;
		List<Category> cateList = cateService.listCategory();
		List<Category> childCateList = null;
		Category cate = null;
		Category child_cate = null;
		Iterator<Category> it = cateList.iterator();
		Iterator<Category> it1 = null;
		while(it.hasNext()){
			cate = it.next();
			node = new DoubleSelectNode();
			node.setName(cate.getCateName().trim());
			node.setValue(cate.getId().toString());
			childCateList = cateService.listChildCategory(cate);
			it1 = childCateList.iterator();
			nodes = new ArrayList<DoubleSelectNode>();
			while(it1.hasNext()){
				child_cate = it1.next();
				tempnode = new DoubleSelectNode();
				tempnode.setName(child_cate.getCateName().trim());
				tempnode.setValue(child_cate.getId().toString());
				nodes.add(tempnode);
			}
			node.setSubNodes(nodes);
			doubleSelectNodes.add(node);
		}		
	}
	/**修改会员积分*/
	public String updateIntegral(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		Member tempMember = service.loadMember(useId);
		tempMember.setIntegral((tempMember.getIntegral()+myIntegral));
		service.saveOrUpdateMember(tempMember);
		Member u = (Member)ServletActionContext.getRequest().getSession().getAttribute("member");
		u.setIntegral((u.getIntegral()-myIntegral));
		service.saveOrUpdateMember(u);
		actionMsg = "使用财富值成功";
		return "success";
	}
	
	/**查看活跃会员*/
	public String SelectTopMember(){
		list=service.selectTopTen();
		//SearchResult<Member> sr=new SearchResult<Member>();
		//sr.setList(list);
		
		if(list!=null){
			StringBuffer sbf = new StringBuffer();
			StringBuffer sb=new StringBuffer();
			//看监控对象是否可用
			for(Member mwt:list){
				//mwt.getLoginName();
				sbf.append("'"+mwt.getLoginName()+"'"+",");
				sb.append(mwt.getLoginTimes()+",");
			}
			memberNameList=sbf.toString().substring(0, sbf.toString().length()-1);
			timesList=sb.toString().substring(0,sb.toString().length()-1);
		}
		return "success";
	}
	
	public MemberService getService() {
		return service;
	}
	public void setService(MemberService service) {
		this.service = service;
	}
	public String getActionMsg() {
		return actionMsg;
	}

	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}
	
	public List<Member> getMemberList() {
		return memberList;
	}
	
	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}

	public String getMemeberLevel() {
		return memeberLevel;
	}

	public void setMemeberLevel(String memeberLevel) {
		this.memeberLevel = memeberLevel;
	}

	public MemberLevelService getMemberLevelService() {
		return memberLevelService;
	}

	public void setMemberLevelService(MemberLevelService memberLevelService) {
		this.memberLevelService = memberLevelService;
	}

	public List<Memberlevel> getMemberLevelList() {
		return memberLevelList;
	}

	public void setMemberLevelList(List<Memberlevel> memberLevelList) {
		this.memberLevelList = memberLevelList;
	}

	public LeaveGoodsMessageService getLeaveService() {
		return leaveService;
	}

	public void setLeaveService(LeaveGoodsMessageService leaveService) {
		this.leaveService = leaveService;
	}

	public List getLeaveMessageList() {
		return leaveMessageList;
	}

	public void setLeaveMessageList(List leaveMessageList) {
		this.leaveMessageList = leaveMessageList;
	}

	public boolean isMessageFlag() {
		return messageFlag;
	}

	public void setMessageFlag(boolean messageFlag) {
		this.messageFlag = messageFlag;
	}

	public int getUseId() {
		return useId;
	}

	public void setUseId(int useId) {
		this.useId = useId;
	}

	public int getMyIntegral() {
		return myIntegral;
	}

	public void setMyIntegral(int myIntegral) {
		this.myIntegral = myIntegral;
	}

	public String getMemberNameList() {
		return memberNameList;
	}

	public void setMemberNameList(String memberNameList) {
		this.memberNameList = memberNameList;
	}

	public String getTimesList() {
		return timesList;
	}

	public void setTimesList(String timesList) {
		this.timesList = timesList;
	}

	
	
}
