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
</head>

<body>
	<!--DIVҳ��������-->
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<!-- �������� -->
		<div class="split"></div>
		<!--λ�õ�����-->
		<div class="nav">
			<div class="nav_left"></div>
			<div class="nav_main">
				�����ڵ�λ�ã�<a href="<%=basepath%>/webs/index.jsp">��ҳ</a> >> ���۲鿴
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
					<h2>�鿴����</h2>
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
											<th width="40%" class="biaoti">��������</th>
											<th width="20%" class="biaoti">����ʱ��</th>
											
										</tr>
									</thead>

									<tbody>
										<s:iterator value="list" status="stat">
											<tr>
												<td valign="middle" class="td_list_data" align="center">${memberInfo.loginName}</td>

												<td valign="middle" class="td_list_data" align="center">${appraiseContent}</td>

												<td valign="middle" class="td_list_data" align="center">${appraiseTime}</td>

											</tr>

										</s:iterator>
									</tbody>
								</table>
							</div>
						</center>
				
					</s:else>
				</div>
				

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
