<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck"%>
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


<script language="javascript" type="text/javascript">
function showdiv() { 
	alert("picture");
	
     document.getElementById("bg").style.display ="block";
     document.getElementById("show").style.display ="block";  
}
function hidediv() {
            document.getElementById("bg").style.display ='none';
            document.getElementById("show").style.display ='none';
        }
        function jump(url){
        	window.location.href="http://localhost:8080"+url;
        }
        
  </script>
</head>

<body>
<!-- ������ -->


<!--DIVҳ��������-->
<div class="container">
<%@include file="../common/menubar.jsp"%>
<!-- �������� -->	
	<div class="split"></div>
<!--λ�õ�����-->	
	<div class="nav">
		<div class="nav_left"></div>
		<div class="nav_main">
			�����ڵ�λ�ã�<a href="<%=basepath%>/webs/index.jsp">��ҳ</a> >> ������Ʒ</div>
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
			<div class="mer_head_text"><h2>������Ʒ</h2></div>
			<div class="mer_head_main"></div>
			<div class="mer_head_right"></div>
			<div class="cart_body">
			<s:if test="#session.member==null">
					<center>
						<br/><img hspace="5" src="<%=basepath%>/images/sorry.gif" />
						<br/><span class="errorMessage"><s:text name="orders_add_notlogin"/></span>				
					</center>
				</s:if>
				<s:else>
		 <s:form action="mer_addMerchandise" enctype="multipart/form-data" target="_self">
		<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">		
		  <tr>
		    <td width="60"><s:text name="mer_label_cate"/>:</td>
		    <td class="doubselect">
		    	<s:doubleselect list="doubleSelectNodes" listKey="value" listValue="name" doubleList="subNodes"  doubleListKey="value" doubleListValue="name" doubleName="category2" doubleId="category2" name="category1" id="category1" value="category1" doubleValue="category2"/>
		    </td>
		    <td width="60"><s:text name="mer_label_name"/>:</td>
		    <td><s:textfield name="merName" size="30"/>&nbsp;<span class="redText">*</span></td>		    
		  </tr>	
		  <tr> 
	  <td width="60"><s:text name="������"/>:</td>
		    <td class="doubselect">
		    
		    <s:url value="/webs/addCategory.jsp" id="addCategoryUrl">
			<s:param name="tmp"><%=System.currentTimeMillis()%></s:param>
		</s:url>
		<%-- <a href="${addCategoryUrl}"><s:text name="category_add"/></a> --%>
		    
		    <input type="button" name="category" value="���������Ʒ���" onclick="jump('${addCategoryUrl}')"/>
		    </td>
		    <td width="60"><s:text name="mer_label_date"/>:</td>
		    <td><s:datetimepicker name="leaveFactoryDate" toggleType="explode" type="date" displayFormat="yyyy-MM-dd"/></td>
		  </tr>	
		  <tr>
		    <td><s:text name="mer_label_model"/>:</td>
		    <td><s:textfield name="merModel" size="30"/>&nbsp;<span class="redText">*</span></td>
		    <td><s:text name="��������"/>:</td>
		    <td><s:textfield name="price" size="30"/>&nbsp;<span class="redText">*</span></td>
		  </tr>
		  <tr>
		    <td><s:text name="������"/>:</td>
		    <td>
		    <s:select name="sprice" list="#{'0':'������','1':'�����','2':'������','3':'�߳���','4':'�˳���','5':'�ų���','6':'ȫ��'}"></s:select>
		<span id="special" style="display:none;">
				    		<radio name="special" value="0" />
				    	</span>
			</td>
		    <td><s:text name="��������"/>:</td>
		    <td>
			    <s:textfield name="manufacturer" size="24"/>
			   
		    </td>
		  </tr>		  
		  <tr>
		    <td><s:text name="mer_label_picture"/>:</td>
		    <td><s:file name="pic" size="35"/></td>
		    <td><s:text name="mer_label_video"/>:</td>
		    <td colspan="3"><s:file name="vd" size="37"/></td>		    
		  </tr>
		  <tr>
		    <td valign="top"><s:text name="mer_label_desc"/>:</td>
		    <td colspan="3" height="150">
				<s:if test="merDesc!=null">
					<s:set name="contentvalue" value="@com.eportal.util.Tools@unescape(#request.merDesc)"/>
				</s:if>			    
				
				<s:textarea value="" name="merDesc" id="merDesc" cols="50" rows="10" />	 		
			</td>
		  </tr> 
		</table>
		  <div align="center">
			<s:submit key="label_submit"/>&nbsp;
			<s:reset key="label_reset"/>&nbsp;
			<%-- <s:set name="label_return" value="%{getText('label_return')}"/>
		    <input type="button" name="btn_ret" value="${label_return}" onClick="window.location='mer_browseMerchandise.action';"> --%>
		  </div>
		</s:form>
		</s:else>	
		</div>
		<!-- <br/><br/> -->
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
<%-- <s:if test="hasActionMessages()">
	<!-- ʹ���Զ����������ҳ�Ի����ǩ -->
	<e:msgdialog basepath="<%=basepath%>" height="1020" top="140">
		<s:actionmessage/>
	</e:msgdialog>
</s:if>	 --%>

<s:if test="hasFieldErrors()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:fielderror/>
	</e:msgdialog>
</s:if>
<s:if test="hasActionMessages()">
	<e:msgdialog basepath="<%=basepath%>">
		<s:actionmessage/>
	</e:msgdialog>
</s:if>
<script language="javascript">
	function hideShowSprice(v){
		if (v==1){
			document.all.spriceSpan.style.display="inline";
		}else{
			document.all.spriceSpan.style.display="none";
		}
	}
</script>
	
</body>
</html>
