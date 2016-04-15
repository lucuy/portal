<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��������-<s:text name="website_name" /></title>
<base target="_blank" />
<meta name="Keywords" content="��������,������,����,�����̳�,���߹���,���Ϲ���" />
<meta name="Description"
	content="�������ṩ�����̳����߹����Ʒչʾ������������Ѷ�����ȳ����ĵ���������!" />
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
//�������
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
				          alert("���Գɹ�");
				         // window.location.href="http://localhost:8080/ywyw/showGoodDetail.action?goodId="+goodId;
				         // $("#agree").hide();
				         hidediv();
				         window.location.href="http://localhost:8080/portal/webs/loadAllOrders.action";
				       
				     }
				     else
				     {
				       alert("����ʧ��");
				       hidediv();
				     }
				}
	       }); 
	} 
		
		//����ͼ��
		function showIntegralDiv() {
		document.getElementById("showAppraise").style.display = "block";
	}
	function hideIntegralDiv(){
		document.getElementById("showAppraise").style.display = 'none';
	}
		
		//�鿴����
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
			alert("����Ҫʹ�û���");
		}
	}
	function checkForm() {
		var useIdVr=parseInt(document.getElementById('useId').value);
		var useIntegralVr=parseInt(document.getElementById('useIntegral').value);
		var myIntegralVr=parseInt(document.getElementById('myIntegral').value);
		if (document.getElementById('myIntegral').value == ''|| myIntegralVr == 0) {
			alert('�Բ���,ʹ�û��ֲ���Ϊ��!');
		} else if (myIntegralVr > userIntegralV) {
			alert('�Բ���,û�й������!');
		} else if (myIntegralVr >parseInt(priceV - myPriceV)) {
			alert('�Բ���,����Ҫ�������!');
		} else {
			//�ύ��
			//alert(useIdVr+"#####"+myIntegralVr);
			window.location.href="<%=basepath%>/webs/changeMemberIntegral.action?useId="+useIdVr+"&myIntegral="+myIntegralVr;
			
			//hideIntegralDiv();
		}
	}
</script>
</head>

<body>
	<!-- �鿴���۵����� -->
	<div id="showAppraise" width="200" height="200">
		
			 <input name="useId" id="useId" type="hidden" /> 
			
						��ʹ�òƸ�ֵ��<s:textfield name="myIntegral" id="myIntegral" size="16" />
						��֧���Ƹ�ֵ��<s:textfield name="useIntegral" id="useIntegral" size="16"
				readonly="true" />
			<input type="button" value="�ύ"
				onclick="checkForm();" />
		<input id="btnclose" type="button" value="�ر�"
			onclick="hideIntegralDiv();" align="right" />
		
	</div>
	<!-- ���Ե����� -->
	<div id="bg" width="200" height="200"></div>
	<div id="show">
		<s:textarea id="appraiseContent" cols="60" rows="20">
		</s:textarea>
		<input type="button" value="ȷ��" onclick="addAppriase()" /> <input
			id="btnclose" type="button" value="�ر�" onclick="hidediv();"
			align="right" />
	</div>
	<!--DIVҳ��������-->
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<!-- �������� -->
		<div class="split"></div>
		<!--λ�õ�����-->
		<div class="nav">
			<div class="nav_left"></div>
			<div class="nav_main">
				�����ڵ�λ�ã�<a href="<%=basepath%>/webs/index.jsp">��ҳ</a> >> ���ﵥ����
			</div>
			<div class="nav_now">
				<%@include file="../common/jsdate.jsp"%>
			</div>
			<div class="nav_right"></div>
		</div>
		<!-- �������� -->
		<div class="split"></div>
		<!-- ҳ��������� -->
		<div class="main_left">
			<!-- ��Ʒ������ -->
			<div class="cate">
				<div class="cate_head_left"></div>
				<div class="cate_head_text">
					<h2>��Ʒ����</h2>
				</div>
				<div class="cate_head_main"></div>
				<div class="cate_head_right"></div>
				<div class="cate_body">
					<!-- ʹ���Զ�����Ʒ����б��ǩ -->
					<e:category />
				</div>
			</div>
			<!-- �������� -->
			<div class="split"></div>
			<!-- ���������� -->
			<div class="prom">
				<div class="prom_head_left"></div>
				<div class="prom_head_text">
					<h2>��Ʒ�Ƽ�</h2>
				</div>
				<div class="prom_head_main"></div>
				<div class="prom_head_right"></div>
				<div class="prom_body">
					<!-- ʹ���Զ�����Ʒ�б��ǩ -->
					<e:merlist baseurl="<%=basepath%>" size="4" listtype="2" />
				</div>
			</div>
		</div>
		<!-- ҳ�������Ҳ� -->
		<div class="main_right">
			<!-- ���������� -->
			<div class="cart">
				<div class="mer_head_left"></div>
				<div class="mer_head_text">
					<h2>���ﵥ����</h2>
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
							<h3>����Ľ���</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="15%" class="biaoti" align="center">�Է�����</th>
											<th width="20%" class="biaoti" align="center">�Է���Ʒ</th>
											<th width="20%" class="biaoti" align="center">�ҵ���Ʒ</th>
											<th width="15%" class="biaoti" align="center">����״̬</th>
											<th width="15%" class="biaoti" align="center">����</th>
											<th width="15%" class="biaoti" align="center">�Ƹ�ֵ</th>
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
													<c:if test="${changeState==0}">���ܾ�</c:if> <c:if
														test="${changeState==1}">������</c:if> <c:if
														test="${changeState==2}">��ͬ��</c:if> <c:if
														test="${changeState==3}">�������</c:if>
												</td>


												<td valign="middle" class="td_list_data" align="center">
													<c:if
														test="${changeState==2&&goodsInfoByGoodsId.appraiseId==0}">
														<input type="button" value="����"
															onclick="showdiv(${goodsInfoByGoodsId.id},${changeId})" />
													</c:if> <c:if test="${changeState==0}">..</c:if> <c:if
														test="${changeState==1}">..</c:if>
														<c:if
													test="${changeState==3&&goodsInfoByGoodsId.appraiseId!=0}">
													<input type="button" value="������"
														onclick="showAppraise(${goodsInfoByChangeGoodsId.id})" />
												</c:if>
												
												</td>
												
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==2}">
														<input type="button" value="�û���"
															onclick="useIntegral(${usersInfoByUserId.id},${usersInfoByChangeUserId.integral},${goodsInfoByChangeGoodsId.price},${goodsInfoByGoodsId.price})" />
													</c:if>
													<c:if test="${changeState!=2}">..</c:if>
												</td>
										</tr>

										</s:iterator>
									
									</tbody>
								</table>
							</div>
							<h3 class="pr">�յ��Ľ���</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="15%" class="biaoti" align="center">�Է�����</th>
											<th width="20%" class="biaoti" align="center">�Է���Ʒ</th>
											<th width="20%" class="biaoti" align="center">�ҵ���Ʒ</th>
											<th width="15%" class="biaoti" align="center">����״̬</th>
											<th width="15%" class="biaoti" align="center">����</th>
											<th width="15%" class="biaoti" align="center">�Ƹ�ֵ</th>
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
													<c:if test="${changeState==0}">���ܾ�</c:if> <c:if
														test="${changeState==1}">������</c:if> <c:if
														test="${changeState==2}">��ͬ��</c:if> <c:if
														test="${changeState==3}">�������</c:if>
												</td>

												<td valign="middle" class="td_list_data" align="center">
													<c:if
														test="${changeState==2&&goodsInfoByChangeGoodsId.appraiseId==0}">
														<input type="button" value="����"
															onclick="showdiv(${goodsInfoByChangeGoodsId.id},${changeId})" />
													</c:if> <c:if test="${changeState==0}">..</c:if> <c:if
														test="${changeState==1}">..</c:if> <c:if
														test="${changeState==3&&goodsInfoByChangeGoodsId.appraiseId!=0}">
														<input type="button" value="������"
															onclick="showAppraise(${goodsInfoByGoodsId.id})" />
													</c:if>
												</td>
												<td valign="middle" class="td_list_data" align="center">
													<c:if test="${changeState==2}">
														<input type="button" value="�û���"
															onclick="useIntegral(${usersInfoByChangeUserId.id},${usersInfoByUserId.integral},${goodsInfoByGoodsId.price},${goodsInfoByChangeGoodsId.price})" />
													</c:if> <c:if test="${changeState!=2}">..</c:if>
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
							<h3>δ��ɶ���</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="20%" class="biaoti" align="center">�Է�����</th>
											<th width="30%" class="biaoti" align="center">�Է���Ʒ</th>
											<th width="30%" class="biaoti" align="center">�ҵ���Ʒ</th>
											<th width="20%" class="biaoti" align="center">����״̬</th>
											<!-- <th width="15%" class="biaoti" align="center">����</th> -->
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
													<c:if test="${changeState==0}">���ܾ�</c:if> <c:if
														test="${changeState==1}">������</c:if> <c:if
														test="${changeState==2}">��ͬ��</c:if> <c:if
														test="${changeState==3}">�������</c:if>
												</td>
												<%-- <c:if test="${changeState==2}">
													<td valign="middle" id="appriase" class="td_list_data"
														align="center"><input type="button" value="����"
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
							<h3 class="box">����ɶ���</h3>
							<div id="tab" style="width:730px;height:306px;">
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="eventslist" id="listTable">
									<thead>
										<tr height="28" class="biaoti">
											<th width="20%" class="biaoti" align="center">�Է�����</th>
											<th width="30%" class="biaoti" align="center">�Է���Ʒ</th>
											<th width="30%" class="biaoti" align="center">�ҵ���Ʒ</th>
											<th width="20%" class="biaoti" align="center">����״̬</th>
											<!-- <th width="15%" class="biaoti" align="center">����</th> -->
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
													<c:if test="${changeState==0}">���ܾ�</c:if> <c:if
														test="${changeState==1}">������</c:if> <c:if
														test="${changeState==2}">��ͬ��</c:if> <c:if
														test="${changeState==3}">�������</c:if>
												</td>
												<%-- <c:if test="${changeState==2}">
													<td valign="middle" class="td_list_data" align="center"><input
														type="button" value="����"
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
			<!-- ������Ʒ�� -->
			<div class="mer">
				<div class="mer_head_left"></div>
				<div class="mer_head_text">
					<h2>�����ϼ�</h2>
				</div>
				<div class="mer_head_main"></div>
				<div class="mer_head_right"></div>
				<div class="mer_body">
					<!-- ʹ���Զ�����Ʒ�б��ǩ -->
					<e:merlist baseurl="<%=basepath%>" size="10" listtype="1"
						picWidth="120" />
				</div>
			</div>
		</div>
		<!-- �������� -->
		<div class="split"></div>
		<!-- ҳ���� -->
		<%@include file="../common/foot.jsp"%>
	</div>
	<!-- �����ʾ��Ϣ -->
	<s:if test="hasFieldErrors()">
			<e:msgdialog basepath="<%=basepath%>">
				<s:fielderror />
			</e:msgdialog>
		</s:if>
	<s:if test="hasActionMessages()">
		<!-- ʹ���Զ����������ҳ�Ի����ǩ -->
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
			if (!iClass) { // �����ָ��class����
				boxsClass = boxs; // ֱ��ʹ��box��Ϊ����
			} else { // ���ָ��class����
				var boxsClass = [];
				for (i = 0; i < boxs.length; i++) {
					if (boxs[i].className.match(/\btab\b/)) {// �ж�������classƥ��
						boxsClass.push(boxs[i]);
					}
				}
			}
			if (!pr) { // �����ָ��Ԥչ����������
				go_to(0); // Ĭ��չ������
				yy();
			} else {
				go_to(pr);
				yy();
			}
			function yy() {
				for (var i = 0; i < hxs.length; i++) {
					hxs[i].temp = i;
					if (!s) {// �����ָ���¼�����
						s = "onmouseover"; // ʹ��Ĭ���¼�
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
						hxs[i].className += " up"; // չ��״̬������
						boxsClass[i].className += " up"; // չ��״̬������
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
