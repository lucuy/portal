<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>换品管理-<s:text name="website_name" /></title>
<base target="_blank" />
<meta name="Keywords" content="电子商务,易物网,交易,电子商城,在线购物,网上购物" />
<meta name="Description"
	content="易物网提供电子商城在线购物、商品展示、订单管理、商讯搜索等常见的电子商务功能!" />
<meta name="robots" content="index, follow" />
<meta name="googlebot" content="index, follow" />
<s:head theme="ajax" debug="true" />
<%-- <link href="<%=basepath%>/css/admin.css" rel="stylesheet" type="text/css" />  --%>
<script type='text/javascript' src="<%=basepath%>/js/jquery-1.8.0.js"></script>
<style type="text/css">
.redText {
	color: red;
}
</style>
<link href="<%=basepath%>/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basepath%>/css/member.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
#bg {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.7;
	opacity: .70;
	filter: alpha(opacity = 70);
}

#show {
	display: none;
	position: absolute;
	top: 25%;
	left: 22%;
	width: 53%;
	height: 69%;
	padding: 8px;
	border: 8px solid #E8E9F7;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>

<script language="javascript" type="text/javascript">
function showdiv(memberId,messageContent,messageTime,picture,price,news,merName,mesName,myMerName,myPicture,myPrice,mysprice) { 
	//alert(picture);
	 $("#picture").attr("src","http://localhost:8080/portal/"+picture);
	$("#content").html(messageContent);
	$("#price").html(price);
	$("#new").html(news); 
	$("#goodName").html(merName);
	$("#time").html(messageTime);
	$("#mesName").html(mesName);
	$("#mypicture").attr("src","http://localhost:8080/portal/"+myPicture);
	$("#myprice").html(myPrice);
	$("#mygoodsName").html(myMerName);
	$("#mynew").html(mysprice);
	
     document.getElementById("bg").style.display ="block";
     document.getElementById("show").style.display ="block";  
}
function hidediv() {
            document.getElementById("bg").style.display ='none';
            document.getElementById("show").style.display ='none';
        }
        
   function changeStatus(id,merStatus,messageId){
        	//alert(id+merStatus+messageId)
        	 $.ajax({
 				type : "get",
 				url :"http://localhost:8080/portal/webs/changeMerStatus.action?",
 				async : false,
 				dataType : "json",
 				data : "merId="+id+"&merStatus="+merStatus+"&messageId="+messageId,
 				success : function(result) {
 					//alert(result);
 				           if(result=="0"){
 				        	  alert("已拒绝交换！");
 				        	 window.location.href="<%=basepath%>/webs/mer_browseMyMerchandise.action";
 				          }else if(result=="1"){
 				        	 alert("您已经同意交换！");
 				        	 window.location.href="<%=basepath%>/webs/mer_browseMyMerchandise.action";
 				        			}
 				          else {
					alert("处理不成功,请检查登录状态！");
				}
			}
		});
	}
</script>

</head>

<body>
	<div id="bg" width="200" height="200"></div>
	<div id="show">
		<input id="btnclose" type="button" value="关闭" onclick="hidediv();"
			align="right" />

		<table width="100%" border="0" cellspacing="1" cellpadding="0"
			class="eventslist" id="listTable">

			<tr height="48%" class="biaoti" width="48%">
				<td width="50%" height="48%" class="biaoti"><img id="picture"
					src="" width="100%" height="48%" />
					<p class="merfield">
						我的商品名称:<span id="goodName"></span>
					</p> <br />
					<p class="merfield">
						我的商品估价:<span id="price"></span>
					</p> <br />
					<p class="merfield">
						新旧程度:<span id="new"></span>
					</p> <br />
					<p class="merfield">
						&nbsp;&nbsp;留言时间:<span id="time"></span>
					</p>
					<p class="merfield">&nbsp;&nbsp;使用积分:</p></td>
				<td width="50%" height="48%" class="biaoti"><img id="mypicture"
					src="" width="100%" height="48%" />
					<p class="merfield">
						对方商品名称:<span id="mygoodsName"></span>
					</p> <br />
					<p class="merfield">
						对方物主估价:<span id="myprice"></span>
					</p> <br />
					<p class="merfield">
						新旧程度:<span id="mynew"></span>
					</p> <br />
					<p class="merfield">
						留言人:<span id="mesName"></span>
					</p></td>

			</tr>

			<tr height="48%" class="biaoti" width="48%">
				<td width="50%" height="48%"><p class="merfield"
						align="center">留言内容：</p>
					<textarea id="content" cols="40" rows="9">${memberInfo.memberName}</textarea></td>

				<td width="50%" height="48%"><s:textarea cols="40" rows="9" />
					<p align="right">
						<s:submit key="label_submit" />
						&nbsp;
					</p></td>
			</tr>
		</table>
	</div>
	<s:set name="label1" value="%{getText('label_rownum')}" />
	<s:set name="label2" value="%{getText('mer_label_cate')}" />
	<s:set name="label3" value="%{getText('mer_label_name')}" />
	<s:set name="label4" value="%{getText('mer_label_model')}" />
	<s:set name="label5" value="%{getText('mer_label_price')}" />
	<s:set name="label6" value="%{getText('mer_label_sprice')}" />
	<s:set name="label7" value="%{getText('label_status')}" />
	<s:set name="label8" value="%{getText('label_edit')}" />
	<!--DIV页面主容器-->
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<!-- 栏间留空 -->
		<div class="split"></div>
		<!--位置导航区-->
		<div class="nav">
			<div class="nav_left"></div>
			<div class="nav_main">
				您现在的位置：<a href="<%=basepath%>/webs/index.jsp">首页</a> >> 留言查看
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
				<div class="cate_head_text">
					<h2>商品分类</h2>
				</div>
				<div class="cate_head_main"></div>
				<div class="cate_head_right"></div>
				<div class="cate_body">
					<!-- 使用自定义商品类别列表标签 -->
					<e:category />
				</div>
			</div>
			<!-- 栏间留空 -->
			<div class="split"></div>
			<!-- 促销打折区 -->
			<div class="prom">
				<div class="prom_head_left"></div>
				<div class="prom_head_text">
					<h2>精品推荐</h2>
				</div>
				<div class="prom_head_main"></div>
				<div class="prom_head_right"></div>
				<div class="prom_body">
					<!-- 使用自定义商品列表标签 -->
					<e:merlist baseurl="<%=basepath%>" size="4" listtype="2" />
				</div>
			</div>
		</div>
		<!-- 页面主体右侧 -->
		<div class="main_right">
			<!-- 购物车管理区 -->
			<div class="cart">
				<div class="mer_head_left"></div>
				<div class="mer_head_text">
					<h2>留言管理</h2>
				</div>
				<div class="mer_head_main"></div>
				<div class="mer_head_right"></div>
				<div class="cart_body">
					<s:if test="#session.member==null">
						<center>
							<br />
							<img hspace="5" src="<%=basepath%>/images/sorry.gif" /> <br /> <span
								class="errorMessage"><s:text name="orders_add_notlogin" /></span>
						</center>
					</s:if>
					<s:else>
						<center>
							<div class="displayTable">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="20%" class="biaoti">用户名</th>
											<th width="30%" class="biaoti">留言内容</th>
											<th width="20%" class="biaoti">留言时间</th>
											<th width="15%" class="biaoti">留言回复</th>
											<th width="15%" class="biaoti">交换</th>
										</tr>
									</thead>

									<tbody>
										<s:iterator value="list" status="stat">
											<tr>
												<td valign="middle" class="td_list_data">${memberInfo.loginName}</td>

												<td valign="middle" class="td_list_data">${messageContent}</td>

												<td valign="middle" class="td_list_data">${messageTime}</td>
												<td width="15%" class="biaoti" align="center"><img
													src="<%=basepath%>/images/icon_viewMessage.jpg"
													onclick='showdiv("${memberInfo.id}","${messageContent}","${messageTime}","${merchandInfo.picture}","${merchandInfo.price}","${merchandInfo.sprice}","${merchandInfo.merName}","${memberInfo.loginName}","${myMerchandInfo.merName}","${myMerchandInfo.picture}","${myMerchandInfo.price}","${myMerchandInfo.sprice}")' /></td>
												<td width="15%" class="biaoti" align="center"
													cursor="pointer"><c:if test="${messageExist==1}">
														<img id="reject"
															src="<%=basepath%>/images/icon_reject.jpg"
															onclick='changeStatus(${merchandInfo.id},"0",${messageId})' />&nbsp;&nbsp;
												<img id="recive" src="<%=basepath%>/images/icon_recive.jpg"
															onclick='changeStatus(${merchandInfo.id},"1",${messageId})' />
													</c:if> <c:if test="${messageExist==2}">
														<img id="agree" src="<%=basepath%>/images/Car_icon_10.jpg" />
													</c:if> <c:if test="${messageExist==0}">
														<img id="agree" src="<%=basepath%>/images/delete_02.gif" />
													</c:if></td>

											</tr>

										</s:iterator>
									</tbody>
								</table>
							</div>
						</center>
						<%-- <s:if test="hasActionMessages()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:actionmessage/>
	</e:msgdialog>
</s:if> --%>
					</s:else>
				</div>
				<br />
				<br />

				<!-- 最新商品区 -->
				<div class="cartmer">
					<div class="mer_head_left"></div>
					<div class="mer_head_text">
						<h2>最新上架</h2>
					</div>
					<div class="mer_head_main"></div>
					<div class="mer_head_right"></div>
					<div class="cartmer_body">
						<!-- 使用自定义商品列表标签 -->
						<e:merlist baseurl="<%=basepath%>" size="10" listtype="1"
							picWidth="94" />
					</div>
				</div>
			</div>
			<!-- 栏间留空 -->
			<div class="split"></div>
			<!-- 页脚区 -->
			<%@include file="../common/foot.jsp"%>
		</div>
		<!-- 输出提示信息 -->
		<%-- <s:if test="hasActionMessages()">
	<!-- 使用自定义带遮罩网页对话框标签 -->
	<e:msgdialog basepath="<%=basepath%>" height="1020" top="140">
		<s:actionmessage/>
	</e:msgdialog>
</s:if>	 --%>

		<s:if test="hasFieldErrors()">
			<e:msgdialog basepath="<%=basepath%>">
				<s:fielderror />
			</e:msgdialog>
		</s:if>
		<s:if test="hasActionMessages()">
			<e:msgdialog basepath="<%=basepath%>">
				<s:actionmessage />
			</e:msgdialog>
		</s:if>
		<script language="javascript">
			function hideShowSprice(v) {
				if (v == 1) {
					document.all.spriceSpan.style.display = "inline";
				} else {
					document.all.spriceSpan.style.display = "none";
				}
			}
		</script>
</body>
</html>
