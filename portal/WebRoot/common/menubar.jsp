<%@ page contentType="text/html; charset=gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--Logo区-->
<div class="logo_left">
	<img src="${pageContext.request.contextPath}/images/EBarter.gif" />
</div>
<div class="logo_right">
	<img src="${pageContext.request.contextPath}/images/EBarter.jpg" />
</div>
<!-- 栏间留空 -->	
<div class="split"></div>	
<!--导航菜单区-->
<div class="menu">
	<ul>	
		<li><a target="_self" href="${pageContext.request.contextPath}/index.jsp">首&nbsp;&nbsp;页</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newmer.jsp">新品上架</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/prommer.jsp">精品推荐</a></li>
		<%-- <li><a target="_self" href="<%=basepath%>/webs/video.jsp">视频购物</a></li> --%>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/preAdMerchandise.action">发布换品</a></li>	
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/mer_browseMyMerchandise.action">换品管理</a></li>
		<s:if test="#session.member!=null">
		<s:if test="#session.messageFlag==null">
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newMessages.action">留言管理</a></li>
		</s:if>
		<s:else>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newMessages.action"><img src="${pageContext.request.contextPath}/images/hotnews.gif">留言管理</a></li>
		
		</s:else>
		</s:if>
		<s:else>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newMessages.action">留言管理</a></li>
		</s:else>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/loadAllOrders.action">易物单管理</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/news.jsp">商城快讯</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/searchNews.jsp">商情搜索</a></li>	
		<%-- <li><a target="_self" href="<%=basepath%>/html/bbs.html">商城论坛</a></li>
		<li><a target="_self" href="<%=basepath%>/html/blog.html">商家博客</a></li> --%>
		<li><span onclick="editMember()">修改注册资料</span></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/video.jsp">技能交换</a></li>			
	</ul>	
</div>
<script language='javascript'>
	//修改注册资料
	function editMember(){
		<s:if test="#session.member==null">
			alert('对不起,您尚未登录,请登录后再修改注册资料,谢谢合作!');
		</s:if>
		<s:else>
			window.location='${pageContext.request.contextPath}/webs/editReg.jsp?tmp='+(new Date()).getTime();
		</s:else>		
	}
	
	//响应"搜索"按钮
	function search(){
		var p1 = document.getElementById("searchtype").value;
		var p2 = document.getElementById("keyword").value;
		if (p2==''){
			alert('对不起,请先输入关键字然后再搜索,谢谢合作!');
		}else{
			if (p1=='newmer' || p1=='prommer'){//搜索所有商品
				window.location='${pageContext.request.contextPath}/webs/searchMer.jsp?searchtype='+p1+'&keyword='+escape(escape(p2));
			}else if (p1=='news'){//搜索商城资讯
				window.location='${pageContext.request.contextPath}/webs/searchNews.jsp?keyword='+escape(escape(p2));
			}else if (p1=='info'){//商情检索
			
			}			
		}
	}
</script>		
<!--搜索与注册登录区-->	
<div class="search">
	<div class="search_left"></div>
	<div class="search_main">
<!--注册登录区-->			
		<div class="login">
			<div class="login_left"></div>
			<div class="login_main">			 	
				<s:if test="#session.member==null">
					<!-- 尚未登录 -->	
					<script language='javascript'>
						//表单验证
						function checkForm(){
							if (document.getElementById('loginName').value==''){
								alert('对不起,登录用户名不能为空!');
							}else if (document.getElementById('loginPwd').value==''){
								alert('对不起,登录密码不能为空!');
							}else{
								//提交表单
								loginform.submit();
							}
						}
					</script>			
					<s:form action="loginMember" namespace="/webs" name="loginMember" id="loginform" method="post" target="_self">
						用户名：<s:textfield name="loginName" id="loginName" size="16"/>
						密码：<s:password name="loginPwd" id="loginPwd" size="16"/>
						<input type="image" src="${pageContext.request.contextPath}/images/login.jpg" onclick="checkForm(); return false;"/>
						&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/webs/reg.jsp" target="_self">注册新会员</a>
					</s:form>					
				</s:if>				
				<s:else>
					<!-- 已登录 -->
					<span class="actionMessage">
						<!-- <s:property value="#session.member.memberlevel.levelName"/> --><s:property value="#session.member.loginName"/>,您好!
						 欢迎光临易物商城! 您目前的积分为<s:property value="#session.member.integral"/>分! 
					</span>
					<a href="${pageContext.request.contextPath}/webs/logoutMember.action" target="_self"><span class="blueText">安全退出</span></a>
				</s:else>
			</div>
			<div class="login_right"></div>				
		</div>
<!--搜索区-->
		<div class="sou">
			<div class="sou_left"></div>
			<div class="sou_main">
				类型：<select id="searchtype" name="searchtype">
				<s:if test="#session.searchtype!=null && #session.searchtype.equals('newmer')">
					<option value="newmer" selected="true">所有商品</option>
				</s:if>
				<s:else>
					<option value="newmer" selected="true">所有商品</option>
				</s:else>
				<s:if test="#session.searchtype!=null && #session.searchtype.equals('prommer')">
					<option value="prommer" selected="true">精品推荐</option>
				</s:if>
				<s:else>
					<option value="prommer">精品推荐</option>
				</s:else>				
				<s:if test="#session.searchtype!=null && #session.searchtype.equals('news')">
					<option value="news" selected="true">商城资讯</option>
				</s:if>
				<s:else>
					<option value="news">商城资讯</option>
				</s:else>					
					<option value="info">商情检索</option>												
				</select>
				&nbsp;关键字：<input type="text" id="keyword" name="keyword" size=28 value="${keyword}"/>
			</div>
			<div class="sou_right">
				<input type="image" src="${pageContext.request.contextPath}/images/search_right.jpg" name="submit" onclick="search()"/>
			</div>					
		</div>						
	</div>
	<div class="search_right"></div>
</div>