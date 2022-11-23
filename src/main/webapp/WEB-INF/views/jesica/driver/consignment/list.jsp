<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.boardmanagement.platformannouncement1" text="과거주문내역"/></title>
</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
         display: block;
    }
    .dataTables_wrapper .row .col-sm-12 {
        overflow: auto;
    }
    .testTable_wrapper .row {
        width: 3000px;
    }

    .overflow-x-auto .table {
        width: auto !important;
        table-layout: fixed;
        white-space: nowrap;
    }

    .overflow-x-auto .table td {
        min-width: 80px;
    }

    ​
    .dataTables_wrapper.dt-bootstrap .dataTables_scroll, .dataTables_wrapper.dt-bootstrap4 .dataTables_scroll {
        margin: 0 0 15px !important;
        width: 2000px;
    }

    .dataTables_wrapper .row .col-sm-12 {
        overflow: auto;
    }
    .detailRow {
        border: 1px solid #ddd;
    }

    .buttons-csv {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-csv:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-copy {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-copy:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-excel:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-print {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-print:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter label .form-control {
        /* display: block; */
        /* margin-left: 8px; */
        /* width: 260px; */
        /* height: 34px; */
        width: 150px;
        height: 23px;
        border: 1px solid #ddd;
    }
</style>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="../../../common/include_sidebar.jsp" %>
    <!-- end #sidebar -->
    <form name="frmSearch" id="frmSearch">
    <!-- begin #content -->
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">
            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="차량배달"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="과거주문내역"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="과거주문내역"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <input type="hidden" class="form-control ml-2 selHeadNo" name="headNo" value="1000}">
                                    <input type="hidden" class="form-control ml-2 selBranchNo" name="branchNo" value="10000">
                                    <input type="hidden" class="headNo" name="headNo" value="1000">
                                    <input type="hidden" class="headName" name="headNoText" value="${searchValue.headNoText}">
                                    <input type="hidden" class="branchNo" name="branchNo" value="10000">
                                    <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                    <input type="hidden" class="storeNo" name="storeNo" value="100000">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr >
                                            <td class="bg-light" style="width:10%"><strong><spring:message
                                                    code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong>
                                            </td>
                                            <td style="width:50%">
                                                <label>
                                                    <input type="text" class="form-control startDate background-white"
                                                           name="startDate" value="${searchValue.startDate}" readonly> <i
                                                        class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                </label>
                                                <label>
                                                    <input type="text" class="form-control endDate background-white"
                                                           name="endDate" value="${searchValue.endDate}" readonly> <i
                                                        class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.orderstatus"
                                                                                         text="주문상태"/></strong></td>
                                            <td colspan="3">
                                                <input type="hidden" id="orderStatusCode" name="orderStatusCode">
                                                <%--  <label class=" m-r-5">
                                                      <div class="checks small m-l-10">
                                                          <input type="checkbox" class="orderStatusCode"
                                                                 id="ex_chk_all_status" value="9999"
                                                          <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                     var="itemChk">
                                                                 <c:if test="${itemChk.trim() == 9999}">checked</c:if>
                                                          </c:forEach>
                                                          >
                                                          <label for="ex_chk_all_status"> <spring:message
                                                                  code="list.search.all" text="전체"/></label>
                                                      </div>
                                                  </label>--%>
                                                <%-- <label class=" m-r-5">
                                                     <div class="checks small m-l-10">
                                                         <input type="checkbox" class="orderStatusCode" id="ex_chk0"
                                                                value="10"
                                                         <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                    var="itemChk">
                                                                <c:if test="${itemChk.trim() == 10}">checked</c:if>
                                                         </c:forEach>
                                                         >
                                                         <label for="ex_chk0"> <spring:message code="list.search.receipt"
                                                                                               text="접수"/></label>
                                                     </div>
                                                 </label>--%>
                                                <%--<label class=" m-r-5">--%>
                                                <%--<div class="checks small m-l-10">--%>
                                                <%--<input type="checkbox" class="orderStatusCode" id="ex_chk1"--%>
                                                <%--value="11"--%>
                                                <%--<c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"--%>
                                                <%--var="itemChk">--%>
                                                <%--<c:if test="${itemChk.trim() == 11}">checked</c:if>--%>
                                                <%--</c:forEach>--%>
                                                <%-->--%>
                                                <%--<label for="ex_chk1"> <spring:message code="list.search.waiting"--%>
                                                <%--text="대기"/></label>--%>
                                                <%--</div>--%>
                                                <%--</label>--%>
                                                <%--<label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk2"
                                                               value="12"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 12}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk2"> <spring:message code="list.search.reservation"
                                                                                              text="예약"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk3"
                                                               value="20"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 20}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk3"> <spring:message
                                                                code="list.search.gettingready" text="준비중"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk4"
                                                               value="21"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 21}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk4"> <spring:message
                                                                code="list.search.packingcomplete" text="포장완료"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk5"
                                                               value="30"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 30}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk5"> <spring:message
                                                                code="list.search.packingcomplete" text="배송요청"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk6"
                                                               value="31"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 31}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk6"> <spring:message
                                                                code="list.search.semidispatch" text="가배차"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk7"
                                                               value="32"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 32}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk7"><spring:message
                                                                code="list.search.packingcomplete" text="배차"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk8"
                                                               value="33"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == 33}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk8"><spring:message code="list.search.start"
                                                                                             text="출발"/></label>
                                                    </div>
                                                </label>--%>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk9"
                                                               value="40"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                        <c:choose>
                                                        <c:when test="${itemChk.trim() == 40}">
                                                               checked
                                                        </c:when>
                                                        <c:when test="${itemChk == '' || itemChk == null }">
                                                               checked
                                                        </c:when>
                                                        </c:choose>

                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk9"><spring:message code="list.search.complete"
                                                                                             text="완료"/></label>
                                                    </div>
                                                </label>
                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk10"
                                                               value="41"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                                   var="itemChk">
                                                        <c:choose>
                                                        <c:when test="${itemChk.trim() == 41}">
                                                               checked
                                                        </c:when>
                                                        <c:when test="${itemChk == '' || itemChk == null }">
                                                        </c:when>
                                                        </c:choose>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk10"><spring:message code="list.search.cancel"
                                                                                              text="취소"/></label>
                                                    </div>
                                                </label>
                                                <%--<label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk11"
                                                               value="42"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                               <c:if test="${itemChk.trim() == 42}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk11"><spring:message code="list.search.question"
                                                                                              text="문의"/></label>
                                                    </div>
                                                </label>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                            <td colspan="3">
                                                <label>
                                                    <select class="form-control searchOption ">
                                                        <option value="custTel"><spring:message
                                                                code="list.search.custtel"
                                                                text="고객연락처"/></option>
                                                        <%-- <option value="destAddr3"><spring:message code="merchandise.search9.option1" text="도착지"/></option>
                                                         <option value="custTel"><spring:message code="merchandise.search9.option1" text="고객전화번호"/></option>
                                                         <option value="workerName"><spring:message code="merchandise.search9.option1" text="배송자명"/></option>--%>
                                                    </select>
                                                </label>
                                                <label>
                                                    <input type="text" name="custTel" value="${searchValue.custTel}"
                                                           class="form-control width-150">
                                                </label>
                                                <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="${path}/driver/consignment/list?headNo=1000%7D&branchNo=10000&headNo=1000&headNoText=&branchNo=10000&branchNoText=&storeNo=100000&orderStatusCode=40&startDate=2021-01-01&endDate=${now}"
                                                           class="btn btn-sm btn-white btn-white-without-border searchClick"
                                                           data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message
                                                                code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
                                                </label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped" >
                    <thead>
                    <tr class="text-center">
                     <%--   <th class="align-middle width-40"><spring:message code="list.word.no" text="번호"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno" text="주문번호"/></th>
                        <th class="align-middle"><spring:message code="list.word.distributor" text="총판"/></th>
                        <th class="align-middle "><spring:message code="list.word.franchisee" text="가맹점"/></th>
                        <th class="align-middle "><spring:message code="list.word.merchantcontact" text="가맹점연락처"/></th>
                        <th class="align-middle "><spring:message code="list.word.1" text="결제상태"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderstatus1" text="주문구분"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderstatus1" text="주문상태"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderdate" text="주문일시"/></th>
                        <th class="align-middle "><spring:message code="list.word.departuredate" text="출발일시"/></th>
                        <th class="align-middle "><spring:message code="list.word.completiondate" text="완료일시"/></th>
                        <th class="align-middle "><spring:message code="list.word.completiondate" text="취소일시"/></th>
                        <th class="align-middle "><spring:message code="list.word.customercontactinformation" text="주문고객연락처"/></th>
                        <th class="align-middle"><spring:message code="list.word.orderamount" text="주문금액"/></th>
                        <th class="align-middle "><spring:message code="list.word.discountamount" text="할인금액"/></th>
                        <th class="align-middle "><spring:message code="list.word.servicecharge" text="봉사료"/></th>
                        <th class="align-middle "><spring:message code="list.word.shippername" text="배송원이름"/></th>
                        <th class="align-middle "><spring:message code="list.word.shippercontact" text="배송원연락처"/></th>
                        <th class="align-middle "><spring:message code="list.word.registrationdate" text="등록일"/></th>--%>

                         <th class="align-middle width-40"><spring:message code="list.word.no" text="번호"/>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="등록일"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="수정일"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="주문구분"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="아웃확인"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="체크인"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="주유량"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="미납금"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="인수/반납일"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="주문상태"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="만남희망일"/></th>
                         <%--<th class="align-middle "><spring:message code="list.word.orderno" text="경과시간"/></th>--%>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="고객번호"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="주문메모"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="드라이버"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="드라이버번호"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="출발지"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="경유지"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="목적지"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="차량번호"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="차량모델"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="가맹점"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno" text="결제금액"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${consignmentList}" varStatus="status">
                        <tr class="detailRow" orderNo="${item.orderNo}">
                            <td class="text-center">${status.index+1}</td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.orderTypeCode == 10}">
                                        <spring:message code="list.word.receipt" text="렌터카예약"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 20}">
                                        <spring:message code="list.word.waiting" text="인수대행"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 21}">
                                        <spring:message code="list.word.reservation" text="반납대행"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 22}">
                                        <spring:message code="list.word.gettingready" text="일반탁송"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 30}">
                                        <spring:message code="list.word.packingcomplete" text="맛집배달"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 32}">
                                        <spring:message code="list.word.deliveryrequest" text="맛집예약"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 33}">
                                        <spring:message code="list.word.semidispatch" text="테이블주문"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 40}">
                                        <spring:message code="list.word.dispatch" text="마트배달"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 41}">
                                        <spring:message code="list.word.start" text="마트포장"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                    <c:choose>
                                        <c:when test="${item.outboundFlag == 'N'}">
                                            <spring:message code="list.word.1" text="사용안함"/>
                                        </c:when>
                                        <c:when test="${item.outboundFlag == 'T'}">
                                            <spring:message code="list.word.1" text="완료"/>
                                        </c:when>
                                        <c:when test="${item.outboundFlag == 'F'}">
                                            <spring:message code="list.word.1" text="대기"/>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.preCheckIn == 0}">
                                        <spring:message code="list.word.1" text="알수없음"/>
                                    </c:when>
                                    <c:when test="${item.preCheckIn == 1}">
                                        <spring:message code="list.word.1" text="완료"/>
                                    </c:when>
                                    <c:when test="${item.preCheckIn == 2}">
                                        <spring:message code="list.word.1" text="미완료"/>
                                    </c:when>

                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${item.defaultFuel}</td>
                            <td><fmt:formatNumber value="${item.rentalCarUnpaid}" pattern="#,###"/><spring:message code="list.word.won" text="원"/></td>
                            <td><javatime:format value="${item.carUseDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.orderStatusCode == 10}">
                                        <span class="text-green d-block"><spring:message code="list.detail.orderstatus" text="접수"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 21}">
                                        <span class="text-green d-block"><spring:message code="list.detail.orderstatus" text="대기"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 12}">
                                        <span class="text-green d-block"><spring:message code="list.detail.reservation" text="예약"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 20}">
                                        <span class="text-green d-block"><spring:message code="list.detail.gettingready" text="준비중"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 21}">
                                        <span class="text-green d-block"><spring:message code="list.detail.packingcomplete" text="포장완료"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 31}">
                                        <span class="text-green d-block"><spring:message code="list.detail.deliveryrequest" text="배송요청"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 31}">
                                        <span class="text-info d-block"><spring:message code="list.detail.semidispatch" text="가배차"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 32}">
                                        <span class="text-info d-block"><spring:message code="list.detail.dispatch" text="배차"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 33}">
                                        <span class="text-info d-block"><spring:message code="list.detail.start" text="출발"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 40}">
                                        <span class="text-info d-block"><spring:message code="list.detail.complete" text="완료"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 41}">
                                        <span class="text-red d-block"><spring:message code="list.detail.cancel" text="취소"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 42}">
                                        <span class="text-red d-block"><spring:message code="list.detail.question" text="문의"/></span>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center"><javatime:format value="${item.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                         <%--   <td class="text-center">
                                elapsedtime
                            </td>--%>
                            <td class="text-center">${item.custTel}</td>
                            <td class="text-center">${item.orderMemo}</td>
                            <td class="text-center">${item.workerName}</td>
                            <td class="text-center">${item.workerTel}</td>
                            <td class="text-center">
                                <c:if test="${item.callAllRelay.size() == 2}">
                                        ${item.callAllRelay[1].departPoi}
                                </c:if>
                                <c:if test="${item.callAllRelay.size() == 1}">
                                        ${item.callAllRelay[0].departPoi}
                                </c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.callAllRelay.size() == 2}">
                                    ${item.callAllRelay[1].viaPoi}
                                </c:if>
                                <c:if test="${item.callAllRelay.size() == 1}">
                                    ${item.callAllRelay[0].viaPoi}
                                </c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.callAllRelay.size() == 2}">
                                    ${item.callAllRelay[1].destPoi}
                                </c:if>
                                <c:if test="${item.callAllRelay.size() == 1}">
                                    ${item.callAllRelay[0].destPoi}
                                </c:if>
                            </td>
                            <td class="text-center">${item.carNum}</td>
                            <td class="text-center">${item.carModel}</td>
                            <td class="text-center">${item.storeName}</td>
                            <td class="text-right"><fmt:formatNumber value="${item.totalAmt}" pattern="#,###"/><spring:message code="list.word.won" text="원"/></td>

                            <%--<td class="text-center">${item.orderNo}</td>
                            <td class="text-left">
                                <span class="orangeColor d-block">[H${item.head.headNo}]</span>
                                    ${item.head.headName}</td>
                            <td class="text-left">
                                <span class="text-green d-block">[S${item.storeNo}]</span>
                                    ${item.storeName}</td>
                            <td class="text-center">
                                    ${item.storeTel}
                            </td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.orderPayStatus == 1}">
                                        <spring:message code="list.word.1" text="결제완료"/>
                                    </c:when>
                                    <c:when test="${item.orderPayStatus == 2}">
                                        <spring:message code="list.word.2" text="부분결제"/>
                                    </c:when>
                                    <c:when test="${item.orderPayStatus == 3}">
                                        <spring:message code="list.word.3" text="미결제"/>
                                    </c:when>
                                    <c:when test="${item.orderPayStatus == 4}">
                                        <spring:message code="list.word.4" text="결제대기"/>
                                    </c:when>
                                    <c:when test="${item.orderPayStatus == 5}">
                                        <spring:message code="list.word.5" text="결제취소"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.orderTypeCode == 10}">
                                        <spring:message code="list.word.receipt" text="렌터카예약"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 20}">
                                        <spring:message code="list.word.waiting" text="인수대행"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 21}">
                                        <spring:message code="list.word.reservation" text="반납대행"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 22}">
                                        <spring:message code="list.word.gettingready" text="일반탁송"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 30}">
                                        <spring:message code="list.word.packingcomplete" text="맛집배달"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 32}">
                                        <spring:message code="list.word.deliveryrequest" text="맛집예약"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 33}">
                                        <spring:message code="list.word.semidispatch" text="테이블주문"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 40}">
                                        <spring:message code="list.word.dispatch" text="마트배달"/>
                                    </c:when>
                                    <c:when test="${item.orderTypeCode == 41}">
                                        <spring:message code="list.word.start" text="마트포장"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.orderStatusCode == 10}">
                                        <span class="text-green d-block"><spring:message code="list.detail.orderstatus" text="접수"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 21}">
                                        <span class="text-green d-block"><spring:message code="list.detail.orderstatus" text="대기"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 12}">
                                        <span class="text-green d-block"><spring:message code="list.detail.reservation" text="예약"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 20}">
                                        <span class="text-green d-block"><spring:message code="list.detail.gettingready" text="준비중"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 21}">
                                        <span class="text-green d-block"><spring:message code="list.detail.packingcomplete" text="포장완료"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 31}">
                                        <span class="text-green d-block"><spring:message code="list.detail.deliveryrequest" text="배송요청"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 31}">
                                        <span class="text-info d-block"><spring:message code="list.detail.semidispatch" text="가배차"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 32}">
                                        <span class="text-info d-block"><spring:message code="list.detail.dispatch" text="배차"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 33}">
                                        <span class="text-info d-block"><spring:message code="list.detail.start" text="출발"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 40}">
                                        <span class="text-info d-block"><spring:message code="list.detail.complete" text="완료"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 41}">
                                        <span class="text-red d-block"><spring:message code="list.detail.cancel" text="취소"/></span>
                                    </c:when>
                                    <c:when test="${item.orderStatusCode == 42}">
                                        <span class="text-red d-block"><spring:message code="list.detail.question" text="문의"/></span>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center"><javatime:format value="${item.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="text-center"><javatime:format value="${item.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="text-center"><javatime:format value="${item.finishDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="text-center"><javatime:format value="${item.cancelDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${item.custTel}</td>
                            <td class="text-right"><fmt:formatNumber value="${item.orderAmt}" pattern="#,###"/>
                                <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-right"><fmt:formatNumber value="${item.discountAmt}" pattern="#,###"/>
                                <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-right"><fmt:formatNumber value="${item.serviceAmt}" pattern="#,###"/>
                                <spring:message code="list.word.won" text="원"/></td>
                           &lt;%&ndash; <td class="text-right"><fmt:formatNumber value="${(item.dlvyDistance/100)}"
                                                                     pattern="#,###.00"/> <spring:message
                                    code="list.word.km" text="Km"/></td>&ndash;%&gt;
                          &lt;%&ndash;  <td class="text-right"><fmt:formatNumber value="${item.dlvyAmt}" pattern="#,###"/>
                                <spring:message code="list.word.won" text="원"/></td>&ndash;%&gt;
                                &lt;%&ndash;  <td class="text-center">
                                      <c:choose>
                                          <c:when test="${item.payMethod.ordinal() == 1}">
                                              <span class="text-green d-block"> <spring:message code="list.word.payment"
                                                                                                text="현금"/></span>
                                          </c:when>
                                          <c:when test="${item.payMethod.ordinal() == 2}">
                                              <span class="text-info d-block"><spring:message code="list.word.card"
                                                                                              text="카드"/></span>
                                          </c:when>
                                          <c:when test="${item.payMethod.ordinal() == 3}">
                                              <span class="text-red d-block"><spring:message code="list.word.prepayment"
                                                                                             text="선결제"/></span>
                                          </c:when>
                                          <c:otherwise>
                                          </c:otherwise>
                                      </c:choose>
                                  </td>
                                  <td class="text-center">
                                      <c:choose>
                                          <c:when test="${item.payMethod.ordinal() == 1}">
                                              <span class="text-green d-block"><spring:message code="list.word.payment"
                                                                                               text="현금"/></span>
                                          </c:when>
                                          <c:when test="${item.payMethod.ordinal() == 2}">
                                              <span class="text-info d-block"><spring:message code="list.word.card"
                                                                                              text="카드"/></span>
                                          </c:when>
                                          <c:when test="${item.payMethod.ordinal() == 3}">
                                              <span class="text-red d-block"><spring:message code="list.word.cash"
                                                                                              text="캐쉬"/></span>
                                          </c:when>
                                          <c:otherwise>
                                          </c:otherwise>
                                      </c:choose>
                                  </td>&ndash;%&gt;
                                &lt;%&ndash;<td></td>
                                <td></td>&ndash;%&gt;
                            &lt;%&ndash;<td class="text-center">${item.call.acceptStore.storeName}</td>&ndash;%&gt;
                            <td class="text-center">${item.workerName}</td>
                            <td class="text-center">${item.workerTel}</td>--%>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- end panel -->
    </div>
    </form>
    <!-- end #content -->
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    $(() => {

        let allChkStatus ="${searchValue.orderStatusCode}";
        let allChk ="${searchValue.orderPathCode}";

        if(allChkStatus == "" )  {
            $("#ex_chk_all_status").click();
        }

        if(allChk == "" )  {
            $("#ex_chk_All").click();
        }

        $("#ex_chk_All").click(function () {
            $(".orderPathCode").prop('checked', this.checked);
        });
        $("#ex_chk_all_status").click(function () {
            $(".orderStatusCode").prop('checked', this.checked);
        });

        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
            responsive: true,
            dom: '<"row"<"col-sm-5"l B><"col-sm-7"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                /*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*/
                /*   { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
                { extend: 'excel',text: '&nbsp; 엑셀 다운로드', className: 'btn-sm fa fa-file-excel' },
                /*    { extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
            ],
        });

        $("#testTable_filter").text("");
        $("#testTable_filter").append('<button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');

        $(document).on("click", ".detailRow", function () {
            let orderNo = $(this).attr("orderNo");
            location.href = "${path}/driver/consignment/detail?orderNo=" + orderNo;
        });


        let date = new Date();
        let date2 = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";
        var yesterday = new Date(date2.setDate(date2.getDate() - 1));

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', yesterday);
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

        /*date.setMonth(date.getMonth() + 1, 1);*/
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        if(endDate == ""){
            $(".endDate").datepicker('setDate', date);
        } else {
            $(".endDate").datepicker('setDate', endDate);
        }
    });

    function searchFormFunction() {
        var orderStatusValues = "";
        $(".orderStatusCode:checked").each(function () {
            if (orderStatusValues == "") {
                orderStatusValues = $(this).val();
            } else {
                orderStatusValues = orderStatusValues + "," + $(this).val();
            }
        });
        $("input[name=orderStatusCode]").val(orderStatusValues);


        var orderPathValues = "";
        $(".orderPathCode:checked").each(function () {
            if (orderPathValues == "") {
                orderPathValues = $(this).val();
            } else {
                orderPathValues = orderPathValues + "," + $(this).val();
            }
        });
        $("input[name=orderPathCode]").val(orderPathValues);
        let pleaseselectastore = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
        if ($(".storeNo").val() == "" || $(".storeNo").val() == null) {
            swal({
                title: pleaseselectastore,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            });
        } else {
            $("#frmSearch").submit();
        }
        /*   $("#frmSearch").submit();*/
    }
</script>
</body>
</html>
