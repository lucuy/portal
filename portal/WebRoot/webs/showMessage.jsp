<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��Ʒ����-<s:text name="website_name" /></title>
<base target="_blank" />
<meta name="Keywords" content="��������,������,����,�����̳�,���߹���,���Ϲ���" />
<meta name="Description"
	content="�������ṩ�����̳����߹����Ʒչʾ������������Ѷ�����ȳ����ĵ���������!" />
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
 				        	  alert("�Ѿܾ�������");
 				        	 window.location.href="<%=basepath%>/webs/mer_browseMyMerchandise.action";
 				          }else if(result=="1"){
 				        	 alert("���Ѿ�ͬ�⽻����");
 				        	 window.location.href="<%=basepath%>/webs/mer_browseMyMerchandise.action";
 				        			}
 				          else {
					alert("�����ɹ�,�����¼״̬��");
				}
			}
		});
	}
</script>

</head>

<body>
	<div id="bg" width="200" height="200"></div>
	<div id="show">
		<input id="btnclose" type="button" value="�ر�" onclick="hidediv();"
			align="right" />

		<table width="100%" border="0" cellspacing="1" cellpadding="0"
			class="eventslist" id="listTable">

			<tr height="48%" class="biaoti" width="48%">
				<td width="50%" height="48%" class="biaoti"><img id="picture"
					src="" width="100%" height="48%" />
					<p class="merfield">
						�ҵ���Ʒ����:<span id="goodName"></span>
					</p> <br />
					<p class="merfield">
						�ҵ���Ʒ����:<span id="price"></span>
					</p> <br />
					<p class="merfield">
						�¾ɳ̶�:<span id="new"></span>
					</p> <br />
					<p class="merfield">
						&nbsp;&nbsp;����ʱ��:<span id="time"></span>
					</p>
					<p class="merfield">&nbsp;&nbsp;ʹ�û���:</p></td>
				<td width="50%" height="48%" class="biaoti"><img id="mypicture"
					src="" width="100%" height="48%" />
					<p class="merfield">
						�Է���Ʒ����:<span id="mygoodsName"></span>
					</p> <br />
					<p class="merfield">
						�Է���������:<span id="myprice"></span>
					</p> <br />
					<p class="merfield">
						�¾ɳ̶�:<span id="mynew"></span>
					</p> <br />
					<p class="merfield">
						������:<span id="mesName"></span>
					</p></td>

			</tr>

			<tr height="48%" class="biaoti" width="48%">
				<td width="50%" height="48%"><p class="merfield"
						align="center">�������ݣ�</p>
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
	<!--DIVҳ��������-->
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<!-- �������� -->
		<div class="split"></div>
		<!--λ�õ�����-->
		<div class="nav">
			<div class="nav_left"></div>
			<div class="nav_main">
				�����ڵ�λ�ã�<a href="<%=basepath%>/webs/index.jsp">��ҳ</a> >> ���Բ鿴
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
			<!-- ���ﳵ������ -->
			<div class="cart">
				<div class="mer_head_left"></div>
				<div class="mer_head_text">
					<h2>���Թ���</h2>
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
											<th width="20%" class="biaoti">�û���</th>
											<th width="30%" class="biaoti">��������</th>
											<th width="20%" class="biaoti">����ʱ��</th>
											<th width="15%" class="biaoti">���Իظ�</th>
											<th width="15%" class="biaoti">����</th>
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

				<!-- ������Ʒ�� -->
				<div class="cartmer">
					<div class="mer_head_left"></div>
					<div class="mer_head_text">
						<h2>�����ϼ�</h2>
					</div>
					<div class="mer_head_main"></div>
					<div class="mer_head_right"></div>
					<div class="cartmer_body">
						<!-- ʹ���Զ�����Ʒ�б��ǩ -->
						<e:merlist baseurl="<%=basepath%>" size="10" listtype="1"
							picWidth="94" />
					</div>
				</div>
			</div>
			<!-- �������� -->
			<div class="split"></div>
			<!-- ҳ���� -->
			<%@include file="../common/foot.jsp"%>
		</div>
		<!-- �����ʾ��Ϣ -->
		<%-- <s:if test="hasActionMessages()">
	<!-- ʹ���Զ����������ҳ�Ի����ǩ -->
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
