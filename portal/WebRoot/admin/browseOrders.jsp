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
<s:set name="label1" value="���ﵥ��" />
<%-- <s:set name="label2" value="%{getText('orders_orderno')}" /> --%>
<s:set name="label3" value="���ܽ�����" />
<s:set name="label4" value="��������" />
<s:set name="label5" value="����ʱ��" />
<s:set name="label6" value="����״̬" />
<s:set name="label7" value="ɾ��" />
<center>
	<div class="titleText"><s:text name="orders_manage_title"/></div>
	<div class="displayTable">
		<display:table name="orderList" id="row" pagesize="15" export="true" class="displaytag" requestURI="orders_browseOrders.action" >
			<display:column title="���ﵥ��" sortable="true" headerClass="sortable" style="text-align:center;"> 
				${row_rowNum} 
			</display:column>
			<%-- <display:column property="orderNo" title="${label2}" sortable="true" headerClass="sortable" style="text-align:center;"/>	 --%>		
			<display:column title="���ܽ�����" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.usersInfoByUserId.loginName"/>
			</display:column>
			<display:column title="��������" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.usersInfoByChangeUserId.loginName"/>
			</display:column>
			<%-- <display:column property="member.memberName" title="${label4}" headerClass="sortable" style="text-align:center;"/> --%>
			<display:column title="����ʱ��" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:property value="#attr.row.changeTime"/>
			</display:column>
			<display:column title="����״̬" headerClass="sortable" style="text-align:center;">
				<s:select name="orderStatus" list="#{'1':'�ȴ�����','2':'ͬ�⽻��','3':'��ɽ���','0':'�Ѿܾ�'}" listKey="key" listValue="value" value="#attr.row.changeState" onchange="window.location='updateOrdersStatus.action?id=%{#attr.row.id}&orderStatus='+this.value;"/>
			</display:column>	
										
			<display:column title="ɾ��" media="html" style="text-align:center;">
				<%-- <s:url action="orders_viewOrders" id="viewOrders">
					<s:param name="id" value="%{#attr.row.id}" />
				</s:url>
				<a href="${viewOrders}"><s:text name="label_view"/></a>&nbsp; --%>									
				<s:url action="delChanges" id="delChanges">
					<s:param name="id" value="%{#attr.row.changeId}" />
				</s:url>
				<a href="${delChanges}"><s:text name="ɾ��"/></a>
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