<%@ page contentType="text/html; charset=gbk"%>
<%@include file="../common/web_head.jsp"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>换品管理-<s:text name="website_name"/></title>
<base target="_blank" />
<meta name="Keywords" content="电子商务,易物网,交易,电子商城,在线购物,网上购物" />
<meta name="Description" content="易物网提供电子商城在线购物、商品展示、订单管理、商讯搜索等常见的电子商务功能!" />
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
    		alert('对不起,您尚未登录,请先登录,谢谢合作!');
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
    				          alert("添加留言成功");
    				          showdiv();
    				          /* window.location.href="http://localhost:8080/portal/webs/viewMerchandise.action?id="+memId; */
    				     }
    				     else
    				     {
    				       alert("添加留言不成功");
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
<!--DIV页面主容器-->
<div class="container">
<%@include file="../common/menubar.jsp"%>
<!-- 栏间留空 -->	
	<div class="split"></div>
<!--位置导航区-->	
	<div class="nav">
		<div class="nav_left"></div>
		<div class="nav_main">
			您现在的位置：<a href="<%=basepath%>/webs/index.jsp">首页</a> >> 换品修改</div>
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
<!-- 购物车管理区 -->	
		<div class="cart">
			<div class="mer_head_left"></div>
			<div class="mer_head_text"><h2>换品修改</h2></div>
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
	<div class="titleText"><s:text name="mer_edit"/></div>
	<div class="formDiv">
	  <s:form action="updateMerchandise" enctype="multipart/form-data">
		<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">		
		  <tr>
		    <td width="60"><s:text name="mer_label_cate"/>:</td>
		    <td  class="doubselect">
		    	<s:doubleselect list="doubleSelectNodes" listKey="value" listValue="name" doubleList="subNodes"  doubleListKey="value" doubleListValue="name" doubleName="category2" doubleId="category2" name="category1" id="category1" value="category1" doubleValue="category2"/>
		    </td>
		    <td width="60"><s:text name="mer_label_name"/>:</td>
		    <td><s:textfield name="merName" size="44"/>&nbsp;<span class="redText">*</span></td>		    
		  </tr>		
		  <tr>
		    <td><s:text name="mer_label_model"/>:</td>
		    <td><s:textfield name="merModel" size="44"/>&nbsp;<span class="redText">*</span></td>
		    <td><s:text name="mer_label_price"/>:</td>
		    <td><s:textfield name="price" size="44"/>&nbsp;<span class="redText">*</span></td>
		  </tr>
		  <tr>
		    <td><s:text name="mer_label_special"/>:</td>
		    <td>
		    	<s:if test="special!=null">
		    		<s:radio name="special" list="#{'0':'否','1':'是'}" listKey="key" listValue="value" onclick="hideShowSprice(this.value)"/>
			    	<s:if test="special==1">
				    	<span id="spriceSpan" style="display:inline;">
			    			<s:text name="mer_label_sprice"/>:				    		
				    		<s:textfield name="sprice" size="23"/>
				    	</span>
			    	</s:if>
			    	<s:else>
				    	<span id="spriceSpan" style="display:none;">
				    		<s:text name="mer_label_sprice"/>:
				    		<s:textfield name="sprice" size="23"/>
				    	</span>		    	
			    	</s:else>		    		
		    	</s:if>
		    	<s:else>
		    		<s:radio name="special" list="#{'0':'否','1':'是'}" listKey="key" listValue="value" value="0" onclick="hideShowSprice(this.value)"/>
			    	<span id="spriceSpan" style="display:none;">
			    		<s:text name="mer_label_sprice"/>:
			    		<s:textfield name="sprice" size="23"/>
			    	</span>			    	
		    	</s:else>	
			</td>
		    <td><s:text name="mer_label_manufacturer"/>:</td>
		    <td>
			    <s:textfield name="manufacturer" size="24"/>
			    <s:text name="mer_label_date"/>:
			    <s:datetimepicker name="leaveFactoryDate" toggleType="explode" type="date" displayFormat="yyyy-MM-dd"/>
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
					<textarea value="" name="merDesc" id="merDesc" cols="50" rows="10">${contentvalue}</textarea>
				</td>
		  </tr>
		</table>
		  <div align="center">
			<s:submit key="label_submit"/>&nbsp;
			<s:reset key="label_reset"/>&nbsp;
			<%-- <s:set name="label_return" value="%{getText('label_return')}"/> --%>
		   <%--  <input type="button" name="btn_ret" value="${label_return}" onClick="window.location='mer_browseMerchandise.action';"> --%>
		  	<s:hidden name="id"/>
		  </div>
		</s:form>	
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

<!-- 最新商品区 -->	
		<div class="cartmer">
			<div class="mer_head_left"></div>
			<div class="mer_head_text"><h2>最新上架</h2></div>
			<div class="mer_head_main"></div>
			<div class="mer_head_right"></div>
			<div class="cartmer_body">
				<!-- 使用自定义商品列表标签 -->
				<e:merlist baseurl="<%=basepath%>" size="10" listtype="1" picWidth="94"/>
			</div>
		</div>		
	</div>		
<!-- 栏间留空 -->	
	<div class="split"></div>	
<!-- 页脚区 -->			
	<%@include file="../common/foot.jsp"%>						
</div>
<!-- 输出提示信息 -->
<s:if test="hasActionMessages()">
	<!-- 使用自定义带遮罩网页对话框标签 -->
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
</div>
</body>
</html>
