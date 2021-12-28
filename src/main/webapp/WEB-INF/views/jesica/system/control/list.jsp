<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div class="container-fluid">
	<div class="row">
		<!-- sidebar(s) -->
		<!-- sidebar(e) -->

		<main role="main" class="col-md-10 px-4">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h3">Vote</h1>
			</div>
			<form action="/vote/list">
				<input type="hidden" name="adminId" value="${sessionScope.sessionKey.roleLevel}" id="adminId">
				<table class="table table-dark">
					<colgroup>
						<col width="100%">
					</colgroup>
					<tbody>
					<tr>
						<td colspan="1">
							<select class="form-control-sm" name="sid" id="seminar" >
								<option value="" <c:if test="${sid == null}">selected</c:if>>세미나 선택</option>
							<c:forEach var="item" items="${seminarList}" varStatus="i" >
								<option value="${item.id}" <c:if test="${sid == item.id}">selected</c:if>>
									[${item.roomName}][${fn:substring(item.programDate, 4,6)}/${fn:substring(item.programDate, 6,8)} ${fn:substring(item.seminarStart, 0,2)}:${fn:substring(item.seminarStart, 2,4)}] ${fn:substring(item.subject, 0, 20)}
								</option>
							</c:forEach>
							</select>
							&nbsp; &nbsp; 상태:
							<select class="select form-control-sm" name="status" id="status">
								<option value="" <c:if test="${status == null}">selected</c:if>>전체</option>
								<option value="1" <c:if test="${status == 1}">selected</c:if>>예정</option>
								<option value="2" <c:if test="${status == 2}">selected</c:if>>진행</option>
								<option value="3" <c:if test="${status == 3}">selected</c:if>>종료</option>
							</select>
							&nbsp;&nbsp;
							<input type="button" id="search" class="btn btn-outline-warning btn-sm" value="조회">
						</td>
					</tr>
					</tbody>
				</table>
			</form>
			<c:forEach var="item" items="${seminarList}" varStatus="i" >
				<c:if test="${sid == item.id}">강연자: ${item.speaker}</c:if>
			</c:forEach>
			<table class="table table-hover">
				<colgroup>
					<col width="5%">
					<col width="3%">
					<col width="45%">
					<col width="5%">
					<col width="11%">
					<col width="11%">
					<col width="11%">
					<col width="9%">
				</colgroup>
				<thead class="thead-light">
					<th>선택</th>
					<th>#</th>
					<th>투표 질문</th>
					<th>상태</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>등록일</th>
					<th></th>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${voteList.size() > 0}">
						<c:forEach var="item" items="${voteList}" varStatus="i" >
							<tr class="vote_row">
								<td><input type="radio" id="voteMove" name="voteMove" value="${item.id}" class="radioChk" onclick="checkeRowColorChange(this)" <c:if test="${voteId == item.id}">checked</c:if>> </td>
								<td>${i.index + 1}</td>
								<c:choose>
									<c:when test="${item.voteStatus == 2}">
										<td style="cursor: pointer" onclick="resumeVote('${item.id}')">${item.subject}</td>
										<td style="cursor: pointer" onclick="resumeVote('${item.id}')">진행중</td>
										<td style="cursor: pointer" onclick="resumeVote('${item.id}')">
											<fmt:parseDate value="${item.startTime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${date}"/>
										</td>
										<td style="cursor: pointer" onclick="resumeVote('${item.id}')">
											<fmt:parseDate value="${item.endTime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${date}"/>
										</td>
										<td style="cursor: pointer" onclick="resumeVote('${item.id}')"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.insertTime}"/></td>
									</c:when>
									<c:otherwise>
										<td style="cursor: pointer" onclick="document.location.href='/vote/${item.id}?sid=${sid}'">${item.subject}</td>
										<td style="cursor: pointer" onclick="document.location.href='/vote/${item.id}?sid=${sid}'">
											<c:if test="${item.voteStatus == 1}" >예정</c:if>
											<c:if test="${item.voteStatus == 3}" >종료</c:if>
										</td>
										<td style="cursor: pointer" onclick="document.location.href='/vote/${item.id}?sid=${sid}'">
											<fmt:parseDate value="${item.startTime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${date}"/>
										</td>
										<td style="cursor: pointer" onclick="document.location.href='/vote/${item.id}?sid=${sid}'">
											<fmt:parseDate value="${item.endTime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${date}"/>
										</td>
										<td style="cursor: pointer" onclick="document.location.href='/vote/${item.id}?sid=${sid}'"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.insertTime}"/></td>
									</c:otherwise>
								</c:choose>
								<td>
								<c:if test="${item.voteStatus == 1}">
									<button type="button" class="btn btn-outline-dark btn-sm" onclick="startVote('${item.id}')">투표 시작</button>
								</c:if>
								<c:if test="${item.voteStatus == 3}">
									<button type="button" class="btn btn-outline-dark btn-sm" onclick="startVote('${item.id}')">투표 재시작</button>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" onclick="document.location.href='/vote_result'">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<div class="justify-content-center">
				<button type="button" class="btn btn-sm btn-outline-dark float-left" onclick="rowMoveEvent('up')">위로</button>
				<button type="button" class="btn btn-sm btn-outline-dark float-left" onclick="rowMoveEvent('down')">아래로</button>
				<button type="button" class="btn btn-sm btn-outline-dark float-left" id="delBtn">선택삭제</button>
				<button type="button" class="btn btn-sm btn-outline-dark btn-block float-right" onclick="location.href='/vote?sid=${sid}'" id="insertBtn">등록</button>
			</div>
			</form>
		</main>
	</div>
</div>
<!-- //container-fluid -->


</body>
<script type="text/javascript">
	$(document).ready(function(){
		var aid = $("#adminId").val();
		
		if(aid == 1){
			$("#delBtn").hide();
			$("#insertBtn").hide();
		}
	});
	
	$(document).on("change","#seminar",function(){
		var sid = $(this).val();
		var status = $("#status option:selected").val();
		location.href='/vote/list?sid='+sid+"&status="+status;
	});

	$(document).on("change","#status",function(){
		var sid = $("#seminar option:selected").val();
		var status = $(this).val();
		location.href='/vote/list?sid='+sid+"&status="+status;
	});
	
	$(document).on("click","#search",function(){
		var sid = $("#seminar option:selected").val();
		var status = $("#status option:selected").val();
		location.href='/vote/list?sid='+sid+"&status="+status;
	});
	
	function startVote(voteId) {
		if (confirm('지금 투표를 시작하시겠습니까?') == true) {
			var popup = window.open('/vote/start/'+voteId, 'Vote', 'height='+(screen.height+100)+', width='+(screen.width+100));
			if (popup == null) {
				alert('설정에서 팝업을 허용해 주십시오.');
			} else {
				popup.moveTo(0, 0);
				popup.resizeTo(screen.width, screen.height);
			}
		}
	}	
	
	function resumeVote(voteId) {
		var popup = window.open('/vote/start/'+voteId, 'Vote', 'height='+(screen.height+100)+', width='+(screen.width+100));
		if (popup == null) {
			alert('설정에서 팝업을 허용해 주십시오.');
		} else {
			popup.moveTo(0, 0);
			popup.resizeTo(screen.width, screen.height);
		}
	}

	function rowMoveEvent(direction) {

		// 체크된 행(row)의 존재 여부를 파악한다.
		if(jQuery(".radioChk:checked").val()) {
		
			var voteId = jQuery(".radioChk:checked").val();

			// 체크된 라디오 박스의 행(row)을 변수에 담는다.
			var row = jQuery(".radioChk:checked").parent().parent();

			// 체크된 행(row)의 이동 한계점을 파악하기 위해 인덱스를 파악한다.
			var num = row.index();

			// 전체 행의 개수를 구한다.
			var max = (jQuery(".radioChk").length - 1);	   // index는 0부터 시작하기에 -1을 해준다.
			if(direction == "up") {
				if(num == 0) {

					// 체크된 행(row)의 위치가 최상단에 위치해 있을경우 더이상 올라갈 수 없게 막는다.
					alert("첫번째로 지정되어 있습니다.\n더이상 순서를 변경할 수 없습니다.");
					return false;

				} else {
					// 체크된 행(row)을 한칸 위로 올린다.
					//row.prev().before(row);
					location.href='/vote/up/'+voteId+"?sid=${sid}&status=${status}";
				}
			} else if(direction == "down") {
				if(num >= max) {
					// 체크된 행(row)의 위치가 최하단에 위치해 있을경우 더이상 내려갈 수 없게 막는다.
					alert("마지막으로 지정되어 있습니다.\n더이상 순서를 변경할 수 없습니다.");
					return false;
				} else {
					// 체크된 행(row)을 한칸 아래로 내린다.
					//row.next().after(row);
					location.href='/vote/down/'+voteId+"?sid=${sid}&status=${status}";
				}
			}
		} else {
			alert("선택된 행이 존재하지 않습니다\n위치를 이동시킬 행을 하나 선택해 주세요.");
		}
	}
	
	$(document).on("click","#delBtn",function(){
		// 체크된 행(row)의 존재 여부를 파악한다.
		if(jQuery(".radioChk:checked").val()) {
			if (confirm('선택한 내용을 삭제하시겠습니까?') == true) {
				var voteId = jQuery(".radioChk:checked").val();
				location.href='/vote/delete/'+voteId+"?sid=${sid}&status=${status}";
			}

		} else {
			alert('삭제할 내용을 선택해 주십시오.');
			return;
		}
	});
</script>
</html>