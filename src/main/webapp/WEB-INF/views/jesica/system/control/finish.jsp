<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<title>Vote</title>
	<script src="/js/jquery-1.9.1.min.js"></script>
	<script src="/js/jquery-ui.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<link type="text/css" href="/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="/css/dev.css" rel="stylesheet">

</head>
<style>
	b{
		font-size: 30px;
	}
</style>
<body>

<!-- Modal -->
<div class="container-fluid">
	<div class="row">
		<main role="main" class="col-md-12 px-4">
			<div id="container" style="min-width: 700px; max-width: 1800px; height: 800px; margin: 0 auto"></div>
			참여 인원: <b><c:out value="${data.totalVoting}"/>명</b> </br></br>
			<button type="button" class="btn btn-sm btn-outline-dark btn-block" id="closeBtn">닫기</button>
		</main>
	</div>
</div>
<!-- //container-fluid -->

</body>
<script type="text/javascript">
	Highcharts.chart('container', {
		chart: {
			type: 'bar',
			height: 800

		},
		title: {
			text: '${data.subject}',
			y:50,
			style: {
				fontWeight: 'bold',
				fontSize:'50px'
			}
		},
		xAxis: {
			categories: [
			<c:forEach var="item" items="${data.itemList}" varStatus="i" >
				<c:if test="${i.index > 0}"><c:out value=","/></c:if>
				'<c:out value="${item}"/>'
			</c:forEach>
			],
			labels: {
				style: {
					fontSize:'35px'
				}
			}
		},
		yAxis: {
			min: 0,
			title: {
				text: ''
			},
			//labels: {
			//	format: '{value}%'
			//},
		},

		plotOptions: {
			series: {
				dataLabels: {
					enabled: true,
					inside: true
				}
			}
		},
		legend: {
			layout: 'vertical',
			align: 'right',
			verticalAlign: 'top',
			x: -40,
			y: 80,
			floating: true,
			borderWidth: 1,
			shadow: true
		},
		series: [{
			type: 'column',
			name : '응답',
			colorByPoint: true,
			dataLabels: [{
				align: 'left',
				format: '<p style="font-size:20px;">{point.r}%</p>'
			}, {
				align: 'right',
				format: '<p style="font-size:20px;">({y}명)</p>'
			}],
			data: [
			<c:forEach var="item" items="${data.itemList}" varStatus="i" >
				<c:if test="${i.index > 0}"><c:out value=","/></c:if>
				{y:<c:out value="${data.votingList[i.index]}"/>, r:<c:out value="${data.ratingList[i.index]}"/>, name:'<c:out value="${item}"/>'}
			</c:forEach>
			],
			showInLegend: false
		}]
	});

$(document).on("click","#closeBtn",function(){
	opener.location.reload();
	window.close();
})
window.onbeforeunload = function() {
	opener.location.reload();
	window.close();
}
</script>
</html>