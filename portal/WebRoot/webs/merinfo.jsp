<%@page import="com.eportal.ORM.Member"%>
<%@ page contentType="text/html; charset=gbk"%>
<%@page import="com.eportal.ORM.Merchandise"%>
<%@page import="com.eportal.util.Tools"%>
<%@page import="com.eportal.service.*"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@include file="../common/web_head.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><s:property value="merName"/>-<s:text name="website_name"/></title>
<base target="_blank" />
<meta name="Keywords" content='<s:property value="merName"/>' />
<meta name="Description" content='<s:property value="merName"/>,<s:property value="merModel"/>' />
<meta name="robots" content="index, follow" />
<meta name="googlebot" content="index, follow" />
<link href="<%=basepath%>/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
        #bg{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: black;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
        #show{display: none;  position: absolute;  top: 25%;  left: 22%;  width: 53%;  height: 49%;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
</style>
<script type='text/javascript' src="<%=basepath%>/js/jquery-1.8.0.js"></script>
<script language='javascript'>

/* function showdiv() {  
	
	<s:if test="#session.member==null">
	alert('对不起,您尚未登录,请先登录,谢谢合作!');
    </s:if>
    <s:else>
	var content=$("#content").val();
	  $.ajax({
			type : "get",
			url :"http://localhost:8080/portal/webs/addLeaveMessage.action?",
			async : false,
			dataType : "json",
			data : "memId=" + memId+"&content="+content,
			success : function(result) {
				alert(result);
			     if(result="true")
			     {
			          alert("添加留言成功");
			          window.location.href="http://localhost:8080/portal/webs/viewMerchandise.action?id="+memId;
			     }
			     else
			     {
			       alert("添加留言不成功");
			     }
			}
       });  

	 </s:else>
	
     document.getElementById("bg").style.display ="block";
     document.getElementById("show").style.display ="block";
 }
function hidediv() {
     document.getElementById("bg").style.display ='none';
     document.getElementById("show").style.display ='none';
 } */

	//选购商品
	function buy(id){
		alert(id);
		<s:if test="#session.member==null">
			alert('对不起,您尚未登录,请先登录,谢谢合作!');
		</s:if>
		<s:else>
		$("#otherinfo").hide(fast);
		$("#leaveMessage").show(fast);
		
			/* window.location='addToCart.action?merId='+merid; */
		</s:else>			
	} 
	function publishMessage(memId){
		<s:if test="#session.member==null">
		alert('对不起,您尚未登录,请先登录,谢谢合作!');
	    </s:if>
	    <s:else>
		var content=$("#content").val();
		if(myMeId==0){
			alert('请选择要交换的物品');
		}else{
		$.ajax({
				type : "get",
				url :"http://localhost:8080/portal/webs/addLeaveMessage.action?",
				async : false,
				dataType : "json",
				data : "memId=" + memId+"&content="+content+"&myMerId="+myMeId,
				success : function(result) {
					//alert(result);
				     if(result="true")
				     {
				          alert("添加留言成功");
				          window.location.href="http://localhost:8080/portal/webs/viewMerchandise.action?id="+memId;
				     }
				     else
				     {
				       alert("添加留言不成功");
				     }
				}
           }); } 

		 </s:else>	}
	function selectMyMer(){
		alert("tttt");
	}
	
	
	var bV=parseInt(navigator.appVersion);
	var IE4=((document.all)&&(bV>=4))?true:false;
	var NS4=(document.layers)?true:false;
	var z=0;
	function LayerV(LayerName,V){
	   /*  var E=eval('document.'+LayerName);
	    if(IE4) E=eval('document.all.'+LayerName+'.style');
	    E.visibility=(V?'visible':'hidden'); */
		if(IE4) E=eval('document.all.'+LayerName+'.style');
	    document.getElementById(LayerName).style.visibility=(V?'visible':'hidden');
	}
	var myMeId=0;
	//下面这个函数实现了当点击图片时，把图片选上
	function select(image1,id){
	var html,url1
	url1=image1.src
    myMeId=id;
	
	html="<img src="+url1+" width=100 height=100 onclick='javascript:select(this,"+id+")'>"
	html=html+"<a href=javascript:LayerV('Zhong',z=1-z)><font style='font-family: Webdings;'>6</font>选择换品</a>"
	pic.innerHTML=html
	LayerV('Zhong',z=1-z)

	var url2 = url1;

	var index = url2.indexOf("bgImage/");
	var url3 = url2.substring(index+8);
	//alert(url3);
	$("#photoName").val(url3);
	//var vvv = $("#deviceCategoryPhotoPath").val();
	//alert(vvv);
	//var a = $('#defultImage').attr("src");

	//getPhotoName();

	}
</script>
</head>

<body>
<!--DIV页面主容器-->
<div class="container">
<%@include file="../common/menubar.jsp"%>
<!-- 栏间留空 -->	
	<div class="split"></div>
<!--位置导航区-->	
	<div class="nav">
		<div class="nav_left"></div>
		<div class="nav_main">
			您现在的位置：<a href="<%=basepath%>/webs/index.jsp">首页</a> >> 商品详情
		</div>
		<div class="nav_now">
			<%@include file="../common/jsdate.jsp"%>	
		</div>
		<div class="nav_right"></div>
	</div>
<!-- 栏间留空 -->	
	<div class="split"></div>
<!-- 页面主体左侧 -->	
	<div class="main_left">
<!-- 商品分类区 -->	
		<div class="cate">
			<div class="cate_head_left"></div>
			<div class="cate_head_text"><h2>商品分类</h2></div>
			<div class="cate_head_main"></div>
			<div class="cate_head_right"></div>
			<div class="cate_body">
				<!-- 使用自定义商品类别列表标签 -->
				<e:category/> 				
			</div>
		</div>
<!-- 栏间留空 -->	
		<div class="split"></div>		
<!-- 促销打折区 -->	
		<div class="prom">
			<div class="prom_head_left"></div>
			<div class="prom_head_text"><h2>精品推荐</h2></div>
			<div class="prom_head_main"></div>
			<div class="prom_head_right"></div>
			<div class="prom_body">
				<!-- 使用自定义商品列表标签 -->
				<e:merlist baseurl="<%=basepath%>" size="4" listtype="2"/> 			
			</div>
		</div>			
	</div>
<!-- 页面主体右侧 -->	
	<div class="main_right">
		<div class="merinfo">
			<div class="baseinfo">
				<s:if test="picture!=null">
					<%
					//HttpServletRequest request=ServletActionContext.getRequest();
						//对商品图片的宽度与高度进行范围控制,以免撑破整个页面
						String filename=request.getRealPath(((Merchandise)request.getAttribute("model")).getPicture()).replaceAll("\\\\","/");
						Map map = Tools.getPicWidthHeight(filename); 
						String height_width ="height='240'";
						if (map!=null){
							int width = Integer.valueOf(map.get("width").toString());
							int height = Integer.valueOf(map.get("height").toString());
							if (width>=height){//横向图片,控制宽度即可
								height_width ="width='240'";
							}else{//竖向图片,控制高度即可
								height_width ="height='240'";
							}
						}						
					%>
					<img src="<%=basepath%>/<s:property value="picture"/>" <%=height_width%> style="float:left;margin:10px;"/>									
				</s:if>
				<s:else>
					<img src="<%=basepath%>/images/noimages.gif" height="240" style="float:left;margin:10px;"/>
				</s:else>							
				<span class="merfield">商品名称:</span> <s:property value="merName"/><br/>
				<span class="merfield">商品型号:</span> <s:property value="merModel"/><br/>
				<span class="merfield">物主估价:</span> <s:property value="@com.eportal.util.Tools@formatCcurrency(#request.price)"/>元<br/>
				<span class="merfield">新旧程度:</span> <s:property value="sprice"/><br/>
				
				<%-- 
					<%
		        		//计算会员价,会员价为最低优惠会员价
		        		double tmpprice = 0;
		        		Merchandise mer = (Merchandise)request.getAttribute("model");
		        		//int id=mer.getId();
		        		/* if(mer==null){
		        		System.out.println("**********"+mer.getCategory()+mer.getMerName());
		        		}else{
		        			System.out.println("**********");
		        		} */
		        		MemberLevelService memberLevelService = (MemberLevelServiceImpl)WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext()).getBean("memberLevelService");
						//tmpprice = mer.getPrice()*(100-memberLevelService.getInitMemberlevel().getFavourable().intValue())/100;
						tmpprice = mer.getPrice();
					Member memb=(Member)session.getAttribute("member");
					%>
					<%=Tools.formatCcurrency(tmpprice)%>元<br/> 
					 --%>
				<%-- <span class="merfield">精品推荐:</span> <s:property value="%{#special==1?'有':'无'}"/><br/> --%>
				<span class="merfield">店家姓名：${member.loginName}</span> <br/>
				<span class="merfield">联系方式：${member.phone}</span> <br/>
				<span class="merfield">交换意向:</span> <s:property value="manufacturer"/><br/>
				<span class="merfield">出厂日期:</span> <s:property value="leaveFactoryDate"/><br/>	
				<!-- <span class="merfield">商品视频:</span>  
				<s:if test="video!=null">
					<img src="<%=basepath%>/images/play.gif" style="vertical-align:middle;cursor:pointer;" onclick="playflv()"/><br/>
				</s:if>
				<s:else>无<br/></s:else>-->
				
				<div id=pic style="border: 1">
				<font style="font-size:12px">
				<s:if test="#session.member==null"><font size="12" color="red">请先登录在交换!</font></s:if>
				<s:else> 
				<% 
				Merchandise mer = (Merchandise)request.getAttribute("model");
				Member memb=(Member)session.getAttribute("member");
				if(mer.getMember().getId().equals(memb.getId())){
					//System.out.println("######"+mer.getMember().getId()+"#####"+memb.getId());
				}else{
				%>
				<img src="<%=basepath%>/images/view.gif"  id="bgImage" name="bgImage" width=30 height=20 onclick="javascript:LayerV('Zhong',z=1-z)" >
                         <a href="javascript:LayerV('Zhong',z=1-z)">
                         <font style="font-family: Webdings;">6</font>选择换品
                         </a>
                    <%} %>     
                 </s:else>
                
                 
                    </font>
                    </div>
				
				    </div>
			<div class="otherinfo" id="otherinfo" style="display:false; float:left;width:300px;height:300px;margin-right:20px;padding:8px 0;line-height:20px;">
				<span class="merfield">商品描述:</span><br/>
				<s:property escape="false" value="@com.eportal.util.Tools@unescape(#request.merDesc)"/>		
			</div>	
			<div id="leaveMessage" style="float:left;width:300px;height:300px;margin-right:20px;padding:8px 0;line-height:20px;">
			<s:textarea id="content" cols="60" rows="23"></s:textarea>
			 <input type="submit" name="messages" value="发布留言" onclick="publishMessage(${model.id})"/> 
			</div>	
			
		</div>
	</div>		
<!-- 栏间留空 -->	
	<div class="split"></div>	
<%@include file="../common/foot.jsp"%>
</div>
<!-- 放置带遮罩的FLV在线播放器 -->
<%-- <span id="flvspan" style="display:none">
	<e:msgdialog basepath="<%=basepath%>" title="在线视频播放" height="1020" top="140" boxwidth="460" tmpid="flv">
		<!-- FLV在线播放器 -->
		<e:flvplayer red5FullUrl="http://localhost:8080/red5" red5ServerIp="localhost" flvFilename="${video}" picFilename="${picture}"/>
	</e:msgdialog>
</span> --%>
<script language='javascript'>
	//播放flv视频
	function playflv(){
		document.getElementById('flvspan').style.display='inline';
		document.getElementById('maskflv').style.display='inline';
		document.getElementById('msgpromptflv').style.display='inline';
	}	
	//关闭带遮罩的网页对话框
	closemaskflv();
</script>
 <div id="Zhong" style=" background-color:#fff; visibility:hidden ;width:220px ;height:300px ;overflow:scroll; position:absolute; z-index:4; left:50%; top:50%;"> 
       <s:if test="#session.member==null">请先登录在交换</s:if>
					<s:else>
					<s:iterator value="merList" status="stat">
					<img src="<%=basepath%>${picture}" width=100%  onclick="javascript:select(this,${id})"/>${merName}<br>
						</s:iterator>
					</s:else> 
					</div>

</body>
</html>
