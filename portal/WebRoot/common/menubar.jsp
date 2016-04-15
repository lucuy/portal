<%@ page contentType="text/html; charset=gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--Logo��-->
<div class="logo_left">
	<img src="${pageContext.request.contextPath}/images/EBarter.gif" />
</div>
<div class="logo_right">
	<img src="${pageContext.request.contextPath}/images/EBarter.jpg" />
</div>
<!-- �������� -->	
<div class="split"></div>	
<!--�����˵���-->
<div class="menu">
	<ul>	
		<li><a target="_self" href="${pageContext.request.contextPath}/index.jsp">��&nbsp;&nbsp;ҳ</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newmer.jsp">��Ʒ�ϼ�</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/prommer.jsp">��Ʒ�Ƽ�</a></li>
		<%-- <li><a target="_self" href="<%=basepath%>/webs/video.jsp">��Ƶ����</a></li> --%>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/preAdMerchandise.action">������Ʒ</a></li>	
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/mer_browseMyMerchandise.action">��Ʒ����</a></li>
		<s:if test="#session.member!=null">
		<s:if test="#session.messageFlag==null">
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newMessages.action">���Թ���</a></li>
		</s:if>
		<s:else>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newMessages.action"><img src="${pageContext.request.contextPath}/images/hotnews.gif">���Թ���</a></li>
		
		</s:else>
		</s:if>
		<s:else>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/newMessages.action">���Թ���</a></li>
		</s:else>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/loadAllOrders.action">���ﵥ����</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/news.jsp">�̳ǿ�Ѷ</a></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/searchNews.jsp">��������</a></li>	
		<%-- <li><a target="_self" href="<%=basepath%>/html/bbs.html">�̳���̳</a></li>
		<li><a target="_self" href="<%=basepath%>/html/blog.html">�̼Ҳ���</a></li> --%>
		<li><span onclick="editMember()">�޸�ע������</span></li>
		<li><a target="_self" href="${pageContext.request.contextPath}/webs/video.jsp">���ܽ���</a></li>			
	</ul>	
</div>
<script language='javascript'>
	//�޸�ע������
	function editMember(){
		<s:if test="#session.member==null">
			alert('�Բ���,����δ��¼,���¼�����޸�ע������,лл����!');
		</s:if>
		<s:else>
			window.location='${pageContext.request.contextPath}/webs/editReg.jsp?tmp='+(new Date()).getTime();
		</s:else>		
	}
	
	//��Ӧ"����"��ť
	function search(){
		var p1 = document.getElementById("searchtype").value;
		var p2 = document.getElementById("keyword").value;
		if (p2==''){
			alert('�Բ���,��������ؼ���Ȼ��������,лл����!');
		}else{
			if (p1=='newmer' || p1=='prommer'){//����������Ʒ
				window.location='${pageContext.request.contextPath}/webs/searchMer.jsp?searchtype='+p1+'&keyword='+escape(escape(p2));
			}else if (p1=='news'){//�����̳���Ѷ
				window.location='${pageContext.request.contextPath}/webs/searchNews.jsp?keyword='+escape(escape(p2));
			}else if (p1=='info'){//�������
			
			}			
		}
	}
</script>		
<!--������ע���¼��-->	
<div class="search">
	<div class="search_left"></div>
	<div class="search_main">
<!--ע���¼��-->			
		<div class="login">
			<div class="login_left"></div>
			<div class="login_main">			 	
				<s:if test="#session.member==null">
					<!-- ��δ��¼ -->	
					<script language='javascript'>
						//����֤
						function checkForm(){
							if (document.getElementById('loginName').value==''){
								alert('�Բ���,��¼�û�������Ϊ��!');
							}else if (document.getElementById('loginPwd').value==''){
								alert('�Բ���,��¼���벻��Ϊ��!');
							}else{
								//�ύ��
								loginform.submit();
							}
						}
					</script>			
					<s:form action="loginMember" namespace="/webs" name="loginMember" id="loginform" method="post" target="_self">
						�û�����<s:textfield name="loginName" id="loginName" size="16"/>
						���룺<s:password name="loginPwd" id="loginPwd" size="16"/>
						<input type="image" src="${pageContext.request.contextPath}/images/login.jpg" onclick="checkForm(); return false;"/>
						&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/webs/reg.jsp" target="_self">ע���»�Ա</a>
					</s:form>					
				</s:if>				
				<s:else>
					<!-- �ѵ�¼ -->
					<span class="actionMessage">
						<!-- <s:property value="#session.member.memberlevel.levelName"/> --><s:property value="#session.member.loginName"/>,����!
						 ��ӭ���������̳�! ��Ŀǰ�Ļ���Ϊ<s:property value="#session.member.integral"/>��! 
					</span>
					<a href="${pageContext.request.contextPath}/webs/logoutMember.action" target="_self"><span class="blueText">��ȫ�˳�</span></a>
				</s:else>
			</div>
			<div class="login_right"></div>				
		</div>
<!--������-->
		<div class="sou">
			<div class="sou_left"></div>
			<div class="sou_main">
				���ͣ�<select id="searchtype" name="searchtype">
				<s:if test="#session.searchtype!=null && #session.searchtype.equals('newmer')">
					<option value="newmer" selected="true">������Ʒ</option>
				</s:if>
				<s:else>
					<option value="newmer" selected="true">������Ʒ</option>
				</s:else>
				<s:if test="#session.searchtype!=null && #session.searchtype.equals('prommer')">
					<option value="prommer" selected="true">��Ʒ�Ƽ�</option>
				</s:if>
				<s:else>
					<option value="prommer">��Ʒ�Ƽ�</option>
				</s:else>				
				<s:if test="#session.searchtype!=null && #session.searchtype.equals('news')">
					<option value="news" selected="true">�̳���Ѷ</option>
				</s:if>
				<s:else>
					<option value="news">�̳���Ѷ</option>
				</s:else>					
					<option value="info">�������</option>												
				</select>
				&nbsp;�ؼ��֣�<input type="text" id="keyword" name="keyword" size=28 value="${keyword}"/>
			</div>
			<div class="sou_right">
				<input type="image" src="${pageContext.request.contextPath}/images/search_right.jpg" name="submit" onclick="search()"/>
			</div>					
		</div>						
	</div>
	<div class="search_right"></div>
</div>