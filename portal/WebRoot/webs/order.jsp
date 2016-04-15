<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>订单管理-<s:text name="website_name" /></title>
<base target="_blank" />
<meta name="Keywords" content="电子商务,易物网,交易,电子商城,在线购物,网上购物" />
<meta name="Description"
	content="易物网提供电子商城在线购物、商品展示、订单管理、商讯搜索等常见的电子商务功能!" />
<meta name="robots" content="index, follow" />
<meta name="googlebot" content="index, follow" />
<link href="<%=basepath%>/css/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.jj {
	font-weight: bolder !important;
}

.box {
	border-top-color: #c00 !important;
}

.pr {
	color: #060 !important;
}

#tab01 {
	position: relative;
	width: 700px;
	height: 300px;
	overflow: hidden;
}

#tab01 h3 {
	position: relative;
	z-index: 2;
	float: left;
	height: 14px;
	padding: 0 7px 0 8px;
	margin-left: -1px;
	border-left: solid 1px #ccc;
	border-right: solid 1px #fff;
	text-align: center;
	background: #fff;
	cursor: pointer;
}

#tab01 h3.up {
	height: 18px;
	padding: 5px 7px 0 7px;
	margin: -6px 0 0 0;
	border: solid #ccc;
	border-width: 1px 1px 0;
	color: #c00;
}

#tab01 div {
	display: none;
	position: absolute;
	left: 0;
	top: 32px;
	z-index: 1;
	width: 324px;
	height: 54px;
	padding: 5px;
	border: solid 1px #ccc;
	color: #666;
}

#tab01 div.up {
	display: block;
}

#tab {
	width: 730px;
	height: 306px;
}

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
	left: 30%;
	width: 40%;
	height: 50%;
	padding: 8px;
	border: 8px solid #E8E9F7;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

#showAppraise {
	display: none;
	position: absolute;
	top: 30%;
	left: 40%;
	width: 40%;
	height: 40%;
	padding: 8px;
	border: 8px solid #E8E9F7;
	background-color: #D6D3CE;
	z-index: 1002;
	overflow: auto;
}
</style>
<script type='text/javascript' src="<%=basepath%>/js/jquery-1.8.0.js" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/js/fancybox/jquery.fancybox-1.3.4.css" />
<script type="text/javascript"
	src="<%=basepath%>/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript" src="<%=basepath%>/js/util.js"></script>
<script type="text/javascript">
var memdId;
var goodInfoId;
	function showdiv(memId,goodInfo) {
		memdId=memId;
		goodInfoId=goodInfo;
		document.getElementById("bg").style.display = "block";
		document.getElementById("show").style.display = "block";
	}
	function hidediv() {
		document.getElementById("bg").style.display = 'none';
		document.getElementById("show").style.display = 'none';
	}
	/* $(document).ready(function() {
		$('#tabs-setting').tabs();
		}); */
//添加评价
	 function addAppriase(){
			var content =$("#appraiseContent").val();
			$.ajax({
				type : "get",
				url :"http://localhost:8080/portal/webs/addAppraise.action?",
				async : false,
				dataType : "json",
				data : "memId="+memdId+"&goodInfoId="+goodInfoId+"&content="+content,
				success : function(result) {
					//alert(result);
				     if(result="true")
				     {
				          alert("留言成功");
				         // window.location.href="http://localhost:8080/ywyw/showGoodDetail.action?goodId="+goodId;
				         // $("#agree").hide();
				         hidediv();
				         window.location.href="http://localhost:8080/portal/webs/loadAllOrders.action";
				       
				     }
				     else
				     {
				       alert("留言失败");
				       hidediv();
				     }
				}
	       }); 
	} 
		
		//积分图层
		function showIntegralDiv() {
		document.getElementById("showAppraise").style.display = "block";
	}
	function hideIntegralDiv(){
		document.getElementById("showAppraise").style.display = 'none';
	}
		
		//查看评价
		function showAppraise(memId){
			window.location.href="<%=basepath%>/webs/showAppraise.action?memId="+ memId;
	}
	var userIntegralV;
	var myPriceV;
	var priceV;
	function useIntegral(userId, userIntegral, myPrice, price) {
		userIntegralV = userIntegral;
		myPriceV = myPrice;
		priceV = price;
		if ((myPrice - price) <= 0) {
			$("#useId").attr("value", userId);
			
			$("#myIntegral").attr("value", userIntegral);
			$("#useIntegral").attr("value", (price - myPrice))
			showIntegralDiv();
			//alert(userId+"######"+userIntegral+"######"+myPrice+"######"+price);
		} else {
			alert("不需要使用积分");
		}
	}
	function checkForm() {
		var useIdVr=parseInt(document.getElementById('useId').value);
		var useIntegralVr=parseInt(document.getElementById('useIntegral').value);
		var myIntegralVr=parseInt(document.getElementById('myIntegral').value);
		if (document.getElementById('myIntegral').value == ''|| myIntegralVr == 0) {
			alert('对不起,使用积分不能为空!');
		} else if (myIntegralVr > userIntegralV) {
			alert('对不起,没有过多积分!');
		} else if (myIntegralVr >parseInt(priceV - myPriceV)) {
			alert('对不起,不需要过多积分!');
		} else {
			//提交表单
			//alert(useIdVr+"#####"+myIntegralVr);
			window.location.href="<%=basepath%>/webs/changeMemberIntegral.action?useId="+useIdVr+"&myIntegral="+myIntegralVr;
			
			//hideIntegralDiv();
		}
	}
</script>
</head>

<body>
	<!-- 查看评论弹出层 -->
	<div id="showAppraise" width="200" height="200">
		
			 <input name="useId" id="useId" type="hidden" /> 
			
						可使用财富值：<s:textfield name="myIntegral" id="myIntegral" size="16" />
						需支付财富值：<s:textfield name="useIntegral" id="useIntegral" size="16"
				readonly="true" />
			<input type="button" value="提交"
				onclick="checkForm();" />
		<input id="btnclose" type="button" value="关闭"
			onclick="hideIntegralDiv();" align="right" />
		
	</div>
	<!-- 留言弹出层 -->
	<div id="bg" width="200" height="200"></div>
	<div id="show">
		<s:textarea id="appraiseContent" cols="60" rows="20">
		</s:textarea>
		<input type="button" value="确定" onclick="addAppriase()" /> <input
			id="btnclose" type="button" value="关闭" onclick="hidediv();"
			align="right" />
	</div>
	<!--DIV页面主容器-->
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<!-- 栏间留空 -->
		<div class="split"></div>
		<!--位置导航区-->
		<div class="nav">
			<div class="nav_left"></div>
			<div class="nav_main">
				您现在的位置：<a href="<%=basepath%>/webs/index.jsp">首页</a> >> 易物单管理
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
			<!-- 订单管理区 -->
			<div class="cart">
				<div class="mer_head_left"></div>
				<div class="mer_head_text">
					<h2>易物单管理</h2>
				</div>
				<div class="mer_head_main"></div>
				<div class="mer_head_right"></div>
				<div class="order_body">
					<s:if test="#session.member==null">
						<center>
							<br /> <img hspace="5" src="<%=basepath%>/images/sorry.gif" />
							<br /> <span class="errorMessage"><s:text
									name="orders_add_notlogin" /></span>
						</center>
					</s:if>
					<s:else>
						<div id="tab01"
							style=" margin:0; padding:0; font-size:12px; font-weight:normal;">
							<h3>发起的交换</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="15%" class="biaoti" align="center">对方名称</th>
											<th width="20%" class="biaoti" align="center">对方商品</th>
											<th width="20%" class="biaoti" align="center">我的商品</th>
											<th width="15%" class="biaoti" align="center">订单状态</th>
											<th width="15%" class="biaoti" align="center">评价</th>
											<th width="15%" class="biaoti" align="center">财富值</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<s:iterator value="myChangeOrderList" status="stat">
												<td valign="middle" class="td_list_data" align="center">${usersInfoByUserId.loginName}</td>

												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByGoodsId.picture}"
													title="${goodsInfoByGoodsId.merName}" width="40"
													height="40" /></td>

												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByChangeGoodsId.picture}"
													title="${goodsInfoByChangeGoodsId.merName}" width="40"
													height="40" /></td>
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==0}">被拒绝</c:if> <c:if
														test="${changeState==1}">待交换</c:if> <c:if
														test="${changeState==2}">已同意</c:if> <c:if
														test="${changeState==3}">交易完成</c:if>
												</td>


												<td valign="middle" class="td_list_data" align="center">
													<c:if
														test="${changeState==2&&goodsInfoByGoodsId.appraiseId==0}">
														<input type="button" value="评价"
															onclick="showdiv(${goodsInfoByGoodsId.id},${changeId})" />
													</c:if> <c:if test="${changeState==0}">..</c:if> <c:if
														test="${changeState==1}">..</c:if>
														<c:if
													test="${changeState==3&&goodsInfoByGoodsId.appraiseId!=0}">
													<input type="button" value="看评论"
														onclick="showAppraise(${goodsInfoByChangeGoodsId.id})" />
												</c:if>
												
												</td>
												
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==2}">
														<input type="button" value="用积分"
															onclick="useIntegral(${usersInfoByUserId.id},${usersInfoByChangeUserId.integral},${goodsInfoByChangeGoodsId.price},${goodsInfoByGoodsId.price})" />
													</c:if>
													<c:if test="${changeState!=2}">..</c:if>
												</td>
										</tr>

										</s:iterator>
									
									</tbody>
								</table>
							</div>
							<h3 class="pr">收到的交换</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="15%" class="biaoti" align="center">对方名称</th>
											<th width="20%" class="biaoti" align="center">对方商品</th>
											<th width="20%" class="biaoti" align="center">我的商品</th>
											<th width="15%" class="biaoti" align="center">订单状态</th>
											<th width="15%" class="biaoti" align="center">评价</th>
											<th width="15%" class="biaoti" align="center">财富值</th>
										</tr>
									</thead>

									<tbody>
										<s:iterator value="changeOrderList" status="stat">
											<tr>
												<td valign="middle" class="td_list_data" align="center">${usersInfoByChangeUserId.loginName}</td>
												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByChangeGoodsId.picture}"
													title="${goodsInfoByChangeGoodsId.merName}" width="40"
													height="40" /></td>
												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByGoodsId.picture}"
													title="${goodsInfoByGoodsId.merName}" width="40"
													height="40" /></td>
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==0}">被拒绝</c:if> <c:if
														test="${changeState==1}">待交换</c:if> <c:if
														test="${changeState==2}">已同意</c:if> <c:if
														test="${changeState==3}">交易完成</c:if>
												</td>

												<td valign="middle" class="td_list_data" align="center">
													<c:if
														test="${changeState==2&&goodsInfoByChangeGoodsId.appraiseId==0}">
														<input type="button" value="评价"
															onclick="showdiv(${goodsInfoByChangeGoodsId.id},${changeId})" />
													</c:if> <c:if test="${changeState==0}">..</c:if> <c:if
														test="${changeState==1}">..</c:if> <c:if
														test="${changeState==3&&goodsInfoByChangeGoodsId.appraiseId!=0}">
														<input type="button" value="看评论"
															onclick="showAppraise(${goodsInfoByGoodsId.id})" />
													</c:if>
												</td>
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==2}">
														<input type="button" value="用积分"
															onclick="useIntegral(${usersInfoByChangeUserId.id},${usersInfoByUserId.integral},${goodsInfoByGoodsId.price},${goodsInfoByChangeGoodsId.price})" />
													</c:if> <c:if test="${changeState!=2}">..</c:if>
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
							<h3>未完成订单</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="20%" class="biaoti" align="center">对方名称</th>
											<th width="30%" class="biaoti" align="center">对方商品</th>
											<th width="30%" class="biaoti" align="center">我的商品</th>
											<th width="20%" class="biaoti" align="center">订单状态</th>
											<!-- <th width="15%" class="biaoti" align="center">评价</th> -->
										</tr>
									</thead>

									<tbody>
										<s:iterator value="unCompleteOrderList" status="stat">
											<tr>
												<td valign="middle" class="td_list_data" align="center">${usersInfoByUserId.loginName}</td>

												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByGoodsId.picture}"
													title="${goodsInfoByGoodsId.merName}" width="40"
													height="40" /></td>

												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByChangeGoodsId.picture}"
													title="${goodsInfoByChangeGoodsId.merName}" width="40"
													height="40" /></td>
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==0}">被拒绝</c:if> <c:if
														test="${changeState==1}">待交换</c:if> <c:if
														test="${changeState==2}">已同意</c:if> <c:if
														test="${changeState==3}">交易完成</c:if>
												</td>
												<%-- <c:if test="${changeState==2}">
													<td valign="middle" id="appriase" class="td_list_data"
														align="center"><input type="button" value="评价"
														onclick="showdiv(${goodsInfoByGoodsId.id},${changeId})" /></td>
												</c:if>
												<c:if test="${changeState!=2}">
													<td valign="middle" class="td_list_data" align="center">..</td>
												</c:if> --%>


											</tr>

										</s:iterator>
									</tbody>
								</table>
							</div>
							<h3 class="box">已完成订单</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="20%" class="biaoti" align="center">对方名称</th>
											<th width="30%" class="biaoti" align="center">对方商品</th>
											<th width="30%" class="biaoti" align="center">我的商品</th>
											<th width="20%" class="biaoti" align="center">订单状态</th>
											<!-- <th width="15%" class="biaoti" align="center">评价</th> -->
										</tr>
									</thead>

									<tbody>

										<s:iterator value="completeOrderList" status="stat">
											<tr>
												<td valign="middle" class="td_list_data" align="center">${usersInfoByUserId.loginName}</td>

												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByGoodsId.picture}"
													title="${goodsInfoByGoodsId.merName}" width="40"
													height="40" /></td>

												<td valign="middle" class="td_list_data" align="center"><img
													src="..${goodsInfoByChangeGoodsId.picture}"
													title="${goodsInfoByChangeGoodsId.merName}" width="40"
													height="40" /></td>
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==0}">被拒绝</c:if> <c:if
														test="${changeState==1}">待交换</c:if> <c:if
														test="${changeState==2}">已同意</c:if> <c:if
														test="${changeState==3}">交易完成</c:if>
												</td>
												<%-- <c:if test="${changeState==2}">
													<td valign="middle" class="td_list_data" align="center"><input
														type="button" value="评价"
														onclick="showdiv(${goodsInfoByGoodsId.id},${changeId})" /></td>
												</c:if>
												<c:if test="${changeState!=2}">
													<td valign="middle" class="td_list_data" align="center">..</td>
												</c:if> --%>


											</tr>

										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>


					</s:else>
				</div>
			</div>
			<!-- 最新商品区 -->
			<div class="mer">
				<div class="mer_head_left"></div>
				<div class="mer_head_text">
					<h2>最新上架</h2>
				</div>
				<div class="mer_head_main"></div>
				<div class="mer_head_right"></div>
				<div class="mer_body">
					<!-- 使用自定义商品列表标签 -->
					<e:merlist baseurl="<%=basepath%>" size="10" listtype="1"
						picWidth="120" />
				</div>
			</div>
		</div>
		<!-- 栏间留空 -->
		<div class="split"></div>
		<!-- 页脚区 -->
		<%@include file="../common/foot.jsp"%>
	</div>
	<!-- 输出提示信息 -->
	<s:if test="hasFieldErrors()">
			<e:msgdialog basepath="<%=basepath%>">
				<s:fielderror />
			</e:msgdialog>
		</s:if>
	<s:if test="hasActionMessages()">
		<!-- 使用自定义带遮罩网页对话框标签 -->
		<e:msgdialog basepath="<%=basepath%>" height="1020" top="140">
			<s:actionmessage />
		</e:msgdialog>
	</s:if>

	<script type="text/javascript">
		function Pid(id, tag) {
			if (!tag) {
				return document.getElementById(id);
			} else {
				return document.getElementById(id).getElementsByTagName(tag);
			}
		}
		function tab(id, hx, box, iClass, s, pr) {
			var hxs = Pid(id, hx);
			var boxs = Pid(id, box);
			if (!iClass) { // 如果不指定class，则：
				boxsClass = boxs; // 直接使用box作为容器
			} else { // 如果指定class，则：
				var boxsClass = [];
				for (i = 0; i < boxs.length; i++) {
					if (boxs[i].className.match(/\btab\b/)) {// 判断容器的class匹配
						boxsClass.push(boxs[i]);
					}
				}
			}
			if (!pr) { // 如果不指定预展开容器，则：
				go_to(0); // 默认展开序列
				yy();
			} else {
				go_to(pr);
				yy();
			}
			function yy() {
				for (var i = 0; i < hxs.length; i++) {
					hxs[i].temp = i;
					if (!s) {// 如果不指定事件，则：
						s = "onmouseover"; // 使用默认事件
						hxs[i][s] = function() {
							go_to(this.temp);
						}
					} else {
						hxs[i][s] = function() {
							go_to(this.temp);
						}
					}
				}
			}
			function go_to(pr) {
				for (var i = 0; i < hxs.length; i++) {
					if (!hxs[i].tmpClass) {
						hxs[i].tmpClass = hxs[i].className += " ";
						boxsClass[i].tmpClass = boxsClass[i].className += " ";
					}
					if (pr == i) {
						hxs[i].className += " up"; // 展开状态：标题
						boxsClass[i].className += " up"; // 展开状态：容器
					} else {
						hxs[i].className = hxs[i].tmpClass;
						boxsClass[i].className = boxsClass[i].tmpClass;
					}
				}
			}
		}
		tab("tab01", "h3", "div", "", "onclick", 2);
	</script>
</body>
</html>
