<%@ page contentType="text/html; charset=gbk"%>
<%@ taglib prefix="e" uri="/eportal"%> 
<%@include file="../common/admin_head.jsp"%>
<s:if test="@com.eportal.util.Tools@isDisable(#session.admin,10)">
	<jsp:forward page="/admin/error.htm" />
</s:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>Highcharts Examples</title>

   <script src="http://localhost:8080/portal/js/highcharts/jquery.min.js"></script>
<script src="http://localhost:8080/portal/js/highcharts/highcharts.js"></script>
   <script>
	 $(
	function creaChart() {
		var chart = new Highcharts.Chart({
			chart : {
				renderTo : 'container',
				//backgroundColor: '#CFCFCF',
				//borderColor:'red',  
				type : 'column'
			//marginRight: 10,
			},
			title : {
				text : '',
				style : {}
			},
			xAxis : {
				//categories: [${winDetail.diskName}] 
				categories : [ ${NewsNameList} ]
			},
			yAxis : {
				title : '',
				allowDecimals : false, //�Ƿ�����̶���С��
				min : 0
			},
			legend : {
				enabled : false
			},
			tooltip : {
				formatter : function() { //������������ݵ�ʱ�ĸ�ʽ����ʾ
					return '' + this.series.name + ': ' + this.y + '<br>';
				}
			},
			credits : {
				enabled : false
			},
			exporting : {
				enabled : false
			},
			plotOptions : {
				column : {
					pointPadding : 0.2, //ͼ�����ε�
					borderWidth : 0
				//ͼ�����εĴ�ϸ 
				},
				bar : {
					dataLabels : {
						enabled : false
					}
				}
			},
			series : [ {
				name : '�鿴����',
				data : [ ${clicksList} ]
			} ]
		});
	});
   </script>
</head>
	
<body style="background-color: #D6D3CE">
<fieldset style="width:800px;padding:10px 10px 5px 10px;">
			<legend>
				<b>ͷ������</b>
			</legend>
   <div id="container" style="min-width:800px;height:400px;"></div>
</body>
</html> 