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
</head>

<body>
	<!--DIV页面主容器-->
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<!-- 栏间留空 -->
		<div class="split"></div>
		<!--位置导航区-->
		<div class="nav">
			<div class="nav_left"></div>
			<div class="nav_main">
				您现在的位置：<a href="<%=basepath%>/webs/index.jsp">首页</a> >> 评论查看
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
					<h2>查看评论</h2>
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
											<th width="40%" class="biaoti">评论内容</th>
											<th width="20%" class="biaoti">评论时间</th>
											
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
