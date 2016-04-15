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
				allowDecimals : false, //是否允许刻度有小数
				min : 0
			},
			legend : {
				enabled : false
			},
			tooltip : {
				formatter : function() { //当鼠标悬置数据点时的格式化提示
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
					pointPadding : 0.2, //图表柱形的
					borderWidth : 0
				//图表柱形的粗细 
				},
				bar : {
					dataLabels : {
						enabled : false
					}
				}
			},
			series : [ {
				name : '查看次数',
				data : [ ${clicksList} ]
			} ]
		});
	});
   </script>
</head>
	
<body style="background-color: #D6D3CE">
<fieldset style="width:800px;padding:10px 10px 5px 10px;">
			<legend>
				<b>头条新闻</b>
			</legend>
   <div id="container" style="min-width:800px;height:400px;"></div>
</body>
</html> 