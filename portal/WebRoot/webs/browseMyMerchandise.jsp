<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��Ʒ����-<s:text name="website_name"/></title>
<base target="_blank" />
<meta name="Keywords" content="��������,������,����,�����̳�,���߹���,���Ϲ���" />
<meta name="Description" content="�������ṩ�����̳����߹����Ʒչʾ������������Ѷ�����ȳ����ĵ���������!" />
<meta name="robots" content="index, follow" />
<meta name="googlebot" content="index, follow" />
<s:head theme="ajax" debug="true"/>
 <%-- <link href="<%=basepath%>/css/admin.css" rel="stylesheet" type="text/css" />  --%> 
 <style type="text/css">
 .redText{color:red;}
 </style> 
<link href="<%=basepath%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basepath%>/css/member.css" rel="stylesheet" type="text/css" />
<style type="text/css">
        #bg{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: black;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
        #show{display: none;  position: absolute;  top: 25%;  left: 22%;  width: 53%;  height: 49%;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
</style>
<script language="javascript" type="text/javascript">
function showdiv() {            
           // document.getElementById("bg").style.display ="block";
            document.getElementById("show").style.display ="block";
        }
function hidediv() {
           // document.getElementById("bg").style.display ='none';
            document.getElementById("show").style.display ='none';
        }
        function getMessage(id){
        	<s:if test="#session.member==null">
    		alert('�Բ���,����δ��¼,���ȵ�¼,лл����!');
    	    </s:if>
    	    <s:else>
    		
    		  $.ajax({
    				type : "get",
    				url :"http://localhost:8080/portal/webs/showMessage.action?",
    				async : false,
    				dataType : "json",
    				data : "id="+id,
    				success : function(result) {
    					alert(result);
    				     if(result="true")
    				     {
    				          alert("������Գɹ�");
    				          showdiv();
    				          /* window.location.href="http://localhost:8080/portal/webs/viewMerchandise.action?id="+memId; */
    				     }
    				     else
    				     {
    				       alert("������Բ��ɹ�");
    				     }
    				}
               });  

    		 </s:else>
        }
</script>

</head>

<body>
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
			�����ڵ�λ�ã�<a href="<%=basepath%>/webs/index.jsp">��ҳ</a> >> ��Ʒ����</div>
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
			<div class="cate_head_text"><h2>��Ʒ����</h2></div>
			<div class="cate_head_main"></div>
			<div class="cate_head_right"></div>
			<div class="cate_body">
				<!-- ʹ���Զ�����Ʒ����б��ǩ -->
				<e:category/> 	 				
			</div>
		</div>
<!-- �������� -->	
		<div class="split"></div>		
<!-- ���������� -->	
		<div class="prom">
			<div class="prom_head_left"></div>
			<div class="prom_head_text"><h2>��Ʒ�Ƽ�</h2></div>
			<div class="prom_head_main"></div>
			<div class="prom_head_right"></div>
			<div class="prom_body">
				<!-- ʹ���Զ�����Ʒ�б��ǩ -->
				<e:merlist baseurl="<%=basepath%>" size="4" listtype="2"/> 			
			</div>
		</div>			
	</div>
<!-- ҳ�������Ҳ� -->	
	<div class="main_right">
<!-- ���ﳵ������ -->	
		<div class="cart">
			<div class="mer_head_left"></div>
			<div class="mer_head_text"><h2>��Ʒ����</h2></div>
			<div class="mer_head_main"></div>
			<div class="mer_head_right"></div>
			<div class="cart_body">
			<s:if test="#session.member==null">
					<center>
						<br/><img hspace="5" src="<%=basepath%>/images/sorry.gif" />
						<br/> <span class="errorMessage"><s:text name="orders_add_notlogin"/></span>				
					</center>
				</s:if>
				<s:else>
		 <center>
	<div class="displayTable">
		<display:table name="merList" id="row" pagesize="15" export="true" class="displaytag" requestURI="mer_browseMerchandise.action" >
			<display:column title="${label1}" sortable="true" headerClass="sortable" style="text-align:center;"> 
				${row_rowNum} 
			</display:column>
			<display:column property="category.cateName" title="${label2}" sortable="true" headerClass="sortable" style="text-align:center;"/>			
			<display:column property="merName" title="${label3}" sortable="true" headerClass="sortable" style="text-align:center;"/>
			<display:column property="merModel" title="${label4}" sortable="true" headerClass="sortable" style="text-align:center;"/>
			<display:column property="price" title="${label5}" sortable="true" headerClass="sortable" style="text-align:center;"/>
			<display:column title="��Ʒ�Ƽ�" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:if test="#attr.row.special==1">
					<s:property value="#attr.row.sprice"/>
				</s:if>
			</display:column>						
			<display:column title="${label7}" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:if test="#attr.row.status==1">
					<img src="<%=basepath%>/images/published.gif" alt="�ѷ���"/>
				</s:if>
			</display:column>
			<display:column title="��Ʒ״̬" sortable="true" headerClass="sortable" style="text-align:center;">
				<s:if test="#attr.row.merStatus==1">
					�ѻ���
				</s:if><s:else>δ����</s:else>
			</display:column>			
			<display:column title="${label8}" media="html" style="text-align:center;">
				<a href="/webs/preAdMerchandise.action"><s:text name="label_add"/></a>&nbsp;
				<s:url action="mer_editMerchandise" id="modifyMerchandise">
					<s:param name="id" value="%{#attr.row.id}" />
				</s:url>
				<a href="${modifyMerchandise}"><s:text name="label_modify"/></a>&nbsp;				
				<s:url action="mer_delMerchandise" id="delMerchandise">
					<s:param name="id" value="%{#attr.row.id}" />
				</s:url>
				<a href="${delMerchandise}" target="_self"><s:text name="label_delete"/></a>&nbsp;
				<s:url action="viewMerchandise" id="viewMerchandise">
					<s:param name="id" value="%{#attr.row.id}" />
				</s:url>
				<a href="${viewMerchandise}" target="_blank"><s:text name="label_preview"/></a>&nbsp;					
				 <s:url action="showMessage" id="showMessage">
					<s:param name="id" value="%{#attr.row.id}" />
				</s:url>
				<a href="${showMessage}" target="_self" > <s:text name="����" /> </a>  			
			</display:column>
			<display:setProperty name="export.csv.filename" value="Merchandise.csv"/>
			<display:setProperty name="export.excel.filename" value="Merchandise.xls"/>
		</display:table>  		
	</div>
</center>
<%-- <s:if test="hasActionMessages()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:actionmessage/>
	</e:msgdialog>
</s:if> --%>
		</s:else>	
		</div>
		<br/><br/>

<!-- ������Ʒ�� -->	
		<div class="cartmer">
			<div class="mer_head_left"></div>
			<div class="mer_head_text"><h2>�����ϼ�</h2></div>
			<div class="mer_head_main"></div>
			<div class="mer_head_right"></div>
			<div class="cartmer_body">
				<!-- ʹ���Զ�����Ʒ�б��ǩ -->
				<e:merlist baseurl="<%=basepath%>" size="10" listtype="1" picWidth="94"/>
			</div>
		</div>		
	</div>		
<!-- �������� -->	
	<div class="split"></div>	
<!-- ҳ���� -->			
	<%@include file="../common/foot.jsp"%>						
</div>
<!-- �����ʾ��Ϣ -->
<s:if test="hasActionMessages()">
	<!-- ʹ���Զ����������ҳ�Ի����ǩ -->
	<e:msgdialog basepath="<%=basepath%>" height="1020" top="140">
		<s:actionmessage/>
	</e:msgdialog>
</s:if>	 

<s:if test="hasFieldErrors()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:fielderror/>
	</e:msgdialog>
</s:if>
<%-- <s:if test="hasActionMessages()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:actionmessage/>
	</e:msgdialog>
</s:if> --%>
<script language="javascript">
	function hideShowSprice(v){
		if (v==1){
			document.all.spriceSpan.style.display="inline";
		}else{
			document.all.spriceSpan.style.display="none";
		}
	}
</script>
	<!-- <input id="btnshow" type="button" value="Show" onclick="showdiv();"/> -->
<!-- <div id="bg" width="200" height="200"></div> -->
<%-- <div id="show">����
<input id="btnclose" type="button" value="Close" onclick="hidediv();"/>

<table width="100%" border="0" cellspacing="1" cellpadding="0"
										class="eventslist" id="listTable">
										<thead>
											<tr height="28" class="biaoti">
												<th width="28%" class="biaoti">�û���</th>
												<th width="30%" class="biaoti">��������</th>
												<th width="20%" class="biaoti">����ʱ��</th>
											</tr>
                                        </thead>

                                        <tbody>
										<s:iterator value="list" status="stat">
												<td valign="middle" class="td_list_data">${memberInfo.memberName}</td>
												
                                                <td valign="middle" class="td_list_data">${messageContent}</td>

												<td valign="middle" class="td_list_data">${messageTime}</td>
                                                
                                             
                                       	</tr>

										</s:iterator>
                                        </tbody>
                                        </table>
</div> --%>
</body>
</html>
