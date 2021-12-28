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
	<link type="text/css" href="/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="/css/dev.css" rel="stylesheet">
</head>
<body>

<!-- top (s) -->
<%@include file="/WEB-INF/jsp/top.jsp"%>
<!-- top (e) -->
<%@include file="/WEB-INF/jsp/left.jsp"%>

<!-- Button trigger modal -->
<button type="button" class="btn btn-sm btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	Launch demo modal
</button>

<!-- Modal -->
<div class="container-fluid">
	<div class="row">
		<!-- sidebar(s) -->
		<!-- sidebar(e) -->

		<main role="main" class="col-md-10 px-4">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h3">Vote > 등록</h1>
			</div>
			<form action="/vote" method="post">
				<input type="hidden" name="voteStatus" value="1">
				<input type="hidden" name="enabledYn" value="Y">
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="15%">
						<col width="">
					</colgroup>
					<tbody>
						<tr>
							<td>세미나</td>
							<td>
								<select class="form-control-sm" name="seminarId" id="seminar" >
									<option value="">세미나 선택</option>
								<c:forEach var="item" items="${seminarList}" varStatus="i" >
									<option value="${item.id}" <c:if test="${sid == item.id}">selected</c:if>>[${item.roomName}][${fn:substring(item.programDate, 4,6)}/${fn:substring(item.programDate, 6,8)} ${fn:substring(item.seminarStart, 0,2)}:${fn:substring(item.seminarStart, 2,4)}] ${fn:substring(item.subject, 0, 20)}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>설문 진행 시간(단위: 초)</td>
							<td><input type="text" class="form-control" name="votePeriod" value=""></td>
						</tr>
					</tbody>
				</table>
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<th>투표질문</th>
							<td><input type="text" class="form-control-xxl" name="subject"></td>
						</tr>
						<tr>
							<th>1.</th>
							<td><input type="text" class="form-control-xl" name="item1"></td>
						</tr>
						<tr>
							<th>2.</th>
							<td><input type="text" class="form-control-xl" name="item2"></td>
						</tr>
						<tr>
							<th>3.</th>
							<td><input type="text" class="form-control-xl" name="item3"></td>
						</tr>
						<tr>
							<th>4.</th>
							<td><input type="text" class="form-control-xl" name="item4"></td>
						</tr>
						<tr>
							<th>5.</th>
							<td><input type="text" class="form-control-xl" name="item5"></td>
						</tr>
						<tr>
							<th>6.</th>
							<td><input type="text" class="form-control-xl"name="item6"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-sm btn-outline-dark" value="등록"/>
			</form>
		</main>
	</div>
</div>
<!-- //container-fluid -->

</body>
<script type="text/javascript">
</script>
</html>