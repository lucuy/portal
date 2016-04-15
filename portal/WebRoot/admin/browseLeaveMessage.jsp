<%@ page contentType="text/html; charset=gbk"%>
<%@ taglib prefix="e" uri="/eportal"%> 
<%@include file="../common/admin_head.jsp"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><s:text name="admin_title"/></title>
<link href="<%=basepath%>/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body style="padding-top:10px;">
<center>
	<div class="titleText"><s:text name="���Թ���"/></div>
	<div class="displayTable">
		<display:table name="list" id="row" pagesize="15" export="true" class="displaytag" requestURI="orders_browseOrders.action" >
			<display:column title="���" sortable="true" headerClass="sortable" style="text-align:center;"> 
				${row_rowNum} 
			</display:column>
			<display:column title="������"  headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.memberInfo.loginName"/>
			</display:column>
			<display:column title="������Ʒ"  headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.merchandInfo.merName"/>
			</display:column>
			<display:column title="����" headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.merchandInfo.member.loginName"/>
			</display:column>	
			<display:column title="��������"  headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.messageContent"/>
			</display:column>
			<display:column title="ʱ��ʱ��" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.messageTime"/>
			</display:column>
								
			<display:column title="ɾ��" media="html" style="text-align:center;">
				<%-- <s:url action="orders_viewOrders" id="viewOrders">
					<s:param name="id" value="%{#attr.row.id}" />
				</s:url>
				<a href="${viewOrders}"><s:text name="label_view"/></a>&nbsp; --%>									
				<s:url action="delMessage" id="delMessage">
					<s:param name="id" value="%{#attr.row.messageId}" />
				</s:url>
				<a href="${delMessage}"><s:text name="ɾ��"/></a>
			</display:column>
			<display:setProperty name="export.csv.filename" value="Orders.csv"/>
			<display:setProperty name="export.excel.filename" value="Orders.xls"/>
		</display:table>  		
	</div>
</center>
<s:if test="hasActionMessages()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:actionmessage/>
	</e:msgdialog>
</s:if>
  </body>
</html>