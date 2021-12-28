<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.orderhistory.pastorderhistory" text="과거 주문내역"/></title>
</head>
<style>
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
        width: 3000px;
    }

    .dataTables_wrapper .row .col-sm-12 {
        overflow: auto;
    }
</style>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->가
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="../../../common/include_sidebar.jsp" %>
    <!-- end #sidebar -->

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">

            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><spring:message code="sidemenu.orderhistory" text="주문내역"/></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.orderhistory.pastorderhistory"
                                                                       text="과거 주문내역"/></li>
                </ol>
                <h3 class="rix-title">
                    <spring:message code="sidemenu.orderhistory.pastorderhistory" arguments="${title}" text="과거 주문내역"/>
                </h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.orderpath"
                                                                                     text="주문경로"/><%--검색어 입력--%></strong>
                                        </td>
                                        <td style="width: 40%;">
                                            <input type="hidden" name="orderPathCode" value="">
                                            <label class=" m-r-5">
                                                <div class="checks small m-l-10">
                                                    <input type="checkbox" class="orderPathCode" id="ex_chk_All"
                                                           value="9990"
                                                    <c:forEach items="${fn:split(searchValue.orderPathCode, ',') }"
                                                               var="itemChk1">
                                                           <c:if test="${itemChk1.trim() == 9990}">checked</c:if>
                                                    </c:forEach>
                                                    >
                                                    <label for="ex_chk_All"><spring:message code="list.search.all"
                                                                                            text="전체"/></label>
                                                </div>
                                            </label>
                                            <c:forEach var="item" items="${tbSystemCode}" varStatus="status1">

                                                <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderPathCode"
                                                               id="ex_chk_${status1.index}"
                                                               sysCode="${item.sysCode}" value="${item.sysCode}"
                                                        <c:forEach items="${fn:split(searchValue.orderPathCode, ',') }"
                                                                   var="itemChk">
                                                               <c:if test="${itemChk.trim() == item.sysCode}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk_${status1.index}"> ${item.codeName}</label>
                                                    </div>
                                                </label>
                                            </c:forEach>

                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.orderstatus"
                                                                                     text="주문상태"/></strong></td>
                                        <td>
                                            <input type="hidden" id="orderStatusCode" name="orderStatusCode">
                                            <label class=" m-r-5">
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
                                            </label>
                                            <label class=" m-r-5">
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
                                            </label>
                                            <label class=" m-r-5">
                                                <div class="checks small m-l-10">
                                                    <input type="checkbox" class="orderStatusCode" id="ex_chk1"
                                                           value="11"
                                                    <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                               var="itemChk">
                                                           <c:if test="${itemChk.trim() == 11}">checked</c:if>
                                                    </c:forEach>
                                                    >
                                                    <label for="ex_chk1"> <spring:message code="list.search.waiting"
                                                                                          text="대기"/></label>
                                                </div>
                                            </label>
                                            <label class=" m-r-5">
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
                                            </label>
                                            <label class=" m-r-5">
                                                <div class="checks small m-l-10">
                                                    <input type="checkbox" class="orderStatusCode" id="ex_chk9"
                                                           value="40"
                                                    <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                               var="itemChk">
                                                           <c:if test="${itemChk.trim() == 40}">checked</c:if>
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
                                                           <c:if test="${itemChk.trim() == 41}">checked</c:if>
                                                    </c:forEach>
                                                    >
                                                    <label for="ex_chk10"><spring:message code="list.search.cancel"
                                                                                          text="취소"/></label>
                                                </div>
                                            </label>
                                            <label class=" m-r-5">
                                                <div class="checks small m-l-10">
                                                    <input type="checkbox" class="orderStatusCode" id="ex_chk11"
                                                           value="42"
                                                    <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                               var="itemChk">
                                                           <c:if test="${itemChk.trim() == 42}">checked</c:if>
                                                    </c:forEach>
                                                    >
                                                    <label for="ex_chk11"><spring:message code="list.search.question"
                                                                                          text="문의"/></label>
                                                </div>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" style="width:10%"><strong><spring:message
                                                code="list.search.franchisee"
                                                text="가맹점"/><%--<spring:message code="merchandise.search1" text="default text"/>--%><%--가맹점선택--%></strong>
                                        </td>
                                        <td style="width:30%">
                                            <%-- <label>
                                                 <input type="text" data-toggle="modal" data-target="#head_search_modal" name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-100" readonly>
                                                 <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                             </label>
                                             <label>
                                                 <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-100" readonly>
                                                 <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                             </label>
                                             <label>
                                                 <input type="text" data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-100" readonly>
                                                 <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                             </label>--%>
                                            <%--<c:if test="${sessionScope.sessionKey.userRole == 0}">--%>
                                                <label>
                                                    <input type="text" data-toggle="modal"
                                                           data-target="#head_search_modal" name="headNoText"
                                                           value="${searchValue.headNoText}"
                                                           placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>"
                                                           class="form-control background-white headName width-100 ">
                                                    <input type="hidden" class="headNo" name="headNo"
                                                           value="${searchValue.headNo}">
                                                    <input type="hidden" class="headName" name="headNoText"
                                                           value="${searchValue.headNoText}">
                                                    <input type="hidden" class="branchNo" name="branchNo"
                                                           value="${searchValue.branchNo}">
                                                    <input type="hidden" class="branchName" name="branchNoText"
                                                           value="${searchValue.branchNoText}">
                                                    <input type="hidden" class="storeNo" name="storeNo"
                                                           value="${searchValue.storeNo}">
                                                </label>
                                                <label>
                                                    <input type="text"
                                                           data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>"
                                                           data-target="#branch_search_modal" name="branchNoText"
                                                           value="${searchValue.branchNoText}"
                                                           placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>"
                                                           class="form-control background-white branchName width-100">
                                                </label>
                                                <label>
                                                    <input type="text" id="testInput"
                                                           data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>"
                                                           data-target="#store_search_modal" name="storeNoText"
                                                           value="${searchValue.storeNoText}"
                                                           placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>"
                                                           class="form-control background-white storeName width-100">
                                                </label>
                                            <%--</c:if>--%>
                                            <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                                <label>
                                                    <input type="text" data-toggle="modal"
                                                           data-target="#head_search_modal" name="headNoText"
                                                           value="${sessionScope.headName}"
                                                           placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>"
                                                           class="form-control background-white headName width-100 "
                                                           disabled>
                                                    <input type="hidden" class="headNo" name="headNo"
                                                           value="${sessionScope.sessionKey.headNo}">
                                                    <input type="hidden" class="headName" name="headNoText"
                                                           value="${sessionScope.headName}">
                                                    <c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">
                                                        <input type="hidden" class="branchNo" name="branchNo"
                                                               value="${searchValue.branchNo}">
                                                    </c:if>
                                                    <c:if test="${searchValue.branchNo == null || searchValue.branchNo ==''}">
                                                        <input type="hidden" class="branchNo" name="branchNo"
                                                               value="${sessionScope.sessionKey.branchNo}">
                                                    </c:if>


                                                    <input type="hidden" class="branchName" name="branchNoText"
                                                           value="${searchValue.branchNoText}">
                                                    <input type="hidden" class="storeNo" name="storeNo"
                                                           value="${searchValue.storeNo}">
                                                </label>
                                                <label>
                                                    <input type="text"
                                                           data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>"
                                                           data-target="#branch_search_modal" name="branchNoText"
                                                           value="${searchValue.branchNoText}"
                                                           placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>"
                                                           class="form-control background-white branchName width-100">
                                                </label>
                                                <label>
                                                    <input type="text" id="testInput"
                                                           data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>"
                                                           data-target="#store_search_modal" name="storeNoText"
                                                           value="${searchValue.storeNoText}"
                                                           placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>"
                                                           class="form-control background-white storeName width-100">
                                                </label>
                                            </c:if>
                                            <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                                <label>
                                                    <input type="text" data-toggle="modal"
                                                           data-target="#head_search_modal" name="headNoText"
                                                           value="${sessionScope.headName}"
                                                           placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>"
                                                           class="form-control background-white headName width-100 "
                                                           disabled>
                                                    <input type="hidden" class="headNo" name="headNo"
                                                           value="${sessionScope.sessionKey.headNo}">
                                                    <input type="hidden" class="headName" name="headNoText"
                                                           value="${sessionScope.headName}">
                                                    <input type="hidden" class="branchNo" name="branchNo"
                                                           value="${sessionScope.sessionKey.branchNo}">
                                                    <input type="hidden" class="branchName" name="branchNoText"
                                                           value="${sessionScope.branchName}">
                                                    <c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">
                                                        <input type="hidden" class="storeNo" name="storeNo"
                                                               value="${searchValue.storeNo}">
                                                    </c:if>
                                                    <c:if test="${searchValue.storeNo == null || searchValue.storeNo ==''}">
                                                        <input type="hidden" class="storeNo" name="storeNo"
                                                               value="${sessionScope.sessionKey.storeNo}">
                                                    </c:if>

                                                </label>
                                                <label>
                                                    <input type="text"
                                                           data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>"
                                                           data-target="#branch_search_modal" name="branchNoText"
                                                           value="${sessionScope.branchName}"
                                                           placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>"
                                                           class="form-control background-white branchName width-100"
                                                           disabled>
                                                </label>
                                                <label>
                                                    <input type="text" id="testInput" data-toggle="modal"
                                                           data-target="#store_search_modal"
                                                           placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>"
                                                           name="storeNoText" value="${searchValue.storeNoText}"
                                                           class="form-control background-white storeName width-100">
                                                </label>
                                            </c:if>
                                        </td>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.searchword"
                                                                                     text="검색어"/><%--검색어 입력--%></strong>
                                        </td>
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
                                                        <a href="/order/old/list?dataStatus=&startDate=2021-01-01&endDate=${now}"
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
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="col-xl-12 col-md-12 m-t-15">
                <div class="">
                    <%--  <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                          <span class="fa fa-plus">배송요금등록</span>
                      </button>--%>
                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick"
                            onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message
                            code="list.search.search" text="검색"/><%--검색--%> </button>
                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                        <%--   <div class="dt-buttons btn-group flex-wrap">
                               <button class="btn btn-secondary buttons-copy buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                   <span><i class="fas fa-lg fa-fw m-r-10 fa-copy"></i>Copy</span>
                               </button>
                               <button class="btn btn-secondary buttons-excel buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                   <span><i class="fas fa-lg fa-fw m-r-10 fa-file-excel"></i>Excel</span>
                               </button>
                               <button class="btn btn-secondary buttons-pdf buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                   <span><i class="fas fa-lg fa-fw m-r-10 fa-file-pdf"></i>PDF</span>
                               </button>
                               <button class="btn btn-secondary buttons-print btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                   <span><i class="fas fa-lg fa-fw m-r-10 fa-print"></i>Print</span>
                               </button>
                           </div>--%>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div>
                    <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                        <thead>
                        <tr class="text-center">
                            <th class="align-middle width-50"><spring:message code="list.word.no" text="번호"/></th>
                            <th class="align-middle width-80"><spring:message code="list.word.orderno"
                                                                              text="주문번호"/></th>
                            <th class="align-middle"><spring:message code="list.word.distributor" text="총판"/></th>
                            <th class="align-middle"><spring:message code="list.word.franchisee" text="가맹점"/></th>
                            <th class="align-middle width-100"><spring:message code="list.word.merchantcontact"
                                                                               text="가맹점연락처"/></th>
                            <th class="align-middle"><spring:message code="list.word.orderinggroup" text="발주그룹"/></th>
                            <th class="align-middle width-100"><spring:message code="list.word.orderpath"
                                                                               text="주문경로"/></th>
                            <th class="align-middle width-100"><spring:message code="list.word.orderstatus"
                                                                               text="주문상태"/></th>
                            <th class="align-middle "><spring:message code="list.word.orderdate" text="주문일시"/></th>
                            <th class="align-middle"><spring:message code="list.word.departuredate" text="출발일시"/></th>
                            <th class="align-middle"><spring:message code="list.word.completiondate" text="완료일시"/></th>
                            <th class="align-middle width-80"><spring:message
                                    code="list.word.customercontactinformation" text="주문고객연락처"/></th>
                            <th class="align-middle"><spring:message code="list.word.orderamount" text="주문금액"/></th>
                            <th class="align-middle"><spring:message code="list.word.discountamount" text="할인금액"/></th>
                            <th class="align-middle"><spring:message code="list.word.servicecharge" text="봉사료"/></th>
                            <th class="align-middle"><spring:message code="list.word.deliverydistance"
                                                                     text="배달거리"/></th>
                            <th class="align-middle"><spring:message code="list.word.proxyamount" text="대행금액"/></th>
                            <th class="align-middle"><spring:message code="list.word.paymentclassification"
                                                                     text="결제구분"/></th>
                            <th class="align-middle"><spring:message code="list.word.paymentcategory" text="지불구분"/></th>
                            <th class="align-middle"><spring:message code="list.word.orderdeliverygroup"
                                                                     text="수주배송그룹"/></th>
                            <th class="align-middle"><spring:message code="list.word.shippername" text="배송원이름"/></th>
                            <th class="align-middle"><spring:message code="list.word.shippercontact"
                                                                     text="배송원연락처"/></th>
                            <th class="align-middle"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${oldList}" varStatus="status">
                            <tr class="detailRow" orderNo="${item.orderNo}">
                                <td class="text-center">${status.index+1}</td>
                                <td class="text-center">${item.orderNo}</td>
                                <td class="text-left">
                                    <span class="orangeColor d-block">[H${item.store.head.headNo}]</span>
                                        ${item.store.head.headName}</td>
                                <td class="text-left">
                                    <span class="text-green d-block">[S${item.store.storeNo}]</span>
                                        ${item.storeName}</td>
                                    <%--<td></td>
                                    <td></td>--%>
                                <td class="text-center">
                                        ${item.storeTel}
                                </td>
                                <td class="text-center">${item.orderExtra.giveBranch.branchName}</td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${item.orderPathCode == 10}">
                                            <spring:message code="list.word.customerapp" text="고객앱"/>
                                        </c:when>
                                        <c:when test="${item.orderPathCode == 11}">
                                            <spring:message code="list.word.smartstore" text="스마트스토어"/>
                                        </c:when>
                                        <c:when test="${item.orderPathCode == 12}">
                                            <spring:message code="list.word.merchantapp" text="가맹점앱"/>
                                        </c:when>
                                        <c:when test="${item.orderPathCode == 13}">
                                            <spring:message code="list.word.shippingapp" text="배송원앱"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 20}">
                                            <spring:message code="list.word.brusim" text="부르심"/>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${item.orderTypeCode == 10}">
                                            <spring:message code="list.word.receipt" text="접수"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 21}">
                                            <spring:message code="list.word.waiting" text="대기"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 12}">
                                            <spring:message code="list.word.reservation" text="예약"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 20}">
                                            <spring:message code="list.word.gettingready" text="준비중"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 21}">
                                            <spring:message code="list.word.packingcomplete" text="포장완료"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 31}">
                                            <spring:message code="list.word.deliveryrequest" text="배송요청"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 31}">
                                            <spring:message code="list.word.semidispatch" text="가배차"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 32}">
                                            <spring:message code="list.word.dispatch" text="배차"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 33}">
                                            <spring:message code="list.word.start" text="출발"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 40}">
                                            <spring:message code="list.word.complete" text="완료"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 41}">
                                            <spring:message code="list.word.cancel" text="취소"/>
                                        </c:when>
                                        <c:when test="${item.orderTypeCode == 42}">
                                            <spring:message code="list.word.question" text="문의"/>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center"><javatime:format value="${item.orderDate}"
                                                                         pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td class="text-center"><javatime:format value="${item.pickupDate}"
                                                                         pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td class="text-center"><javatime:format value="${item.finishDate}"
                                                                         pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${item.custTel}</td>
                                <td class="text-right"><fmt:formatNumber value="${item.orderAmt}" pattern="#,###"/>
                                    <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-right"><fmt:formatNumber value="${item.discountAmt}" pattern="#,###"/>
                                    <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-right"><fmt:formatNumber value="${item.serviceAmt}" pattern="#,###"/>
                                    <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-right"><fmt:formatNumber value="${(item.dlvyDistance/100)}"
                                                                         pattern="#,###.00"/> <spring:message
                                        code="list.word.km" text="Km"/></td>
                                <td class="text-right"><fmt:formatNumber value="${item.dlvyAmt}" pattern="#,###"/>
                                    <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-center">
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
                                </td>
                                    <%--<td></td>
                                    <td></td>--%>
                                <td class="text-center">${item.orderExtra.acceptStore.storeName}</td>
                                <td class="text-center">${item.workerName}</td>
                                <td class="text-center">${item.workerTel}</td>
                                <td class="text-center"><javatime:format value="${item.insertDate}"
                                                                         pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end #content -->
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<%--modal add end--%>
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
</div>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    $(() => {
        $("#testTable").DataTable({
            language: lang_set, //or lang_eng
            "scrollX": true
        });

        $(document).on("click", ".detailRow", function () {
            let orderNo = $(this).attr("orderNo")
            location.href = "${path}/order/old/detail?orderNo=" + orderNo;
        });

        //제휴본사 검색
        $(".searchHeadBtn").on("click", function () {
            let req = convertFormToObj($('form.head_search_form'));
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function (data) {
                    $(".searchHeadList").html("");
                    if (data.searchHeadList.length == 0 || data.searchHeadList == null) {
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregisteredaffiliateheadquarters +
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {
                        for (var i = 0; i < data.searchHeadList.length; i++) {
                            $(".searchHeadList").append(
                                " <li >" +
                                "     <label class=\"head_text\">\n" +
                                "" + data.searchHeadList[i].headName + "" +
                                "<small style=\"color: green;\">[" + data.searchHeadList[i].headNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName=" + data.searchHeadList[i].headName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo=" + data.searchHeadList[i].headNo + " value='" + apply + "'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click", function () {
            let headNo = $(".headNo").val();
            $(".selHeadNo").val(headNo);
            let req = convertFormToObj($('form.branch_search_form'));
            let noregistereddistributors = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/branch/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function (data) {
                    $(".searchBranchList").html("");
                    if (data.searchBranchList.length == 0 || data.searchBranchList == null) {
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregistereddistributors +
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {
                        for (var i = 0; i < data.searchBranchList.length; i++) {
                            $(".searchBranchList").append(
                                " <li >" +
                                "     <label class=\"branch_text\">\n" +
                                "" + data.searchBranchList[i].branchName + "" +
                                "<small style=\"color: green;\">[" + data.searchBranchList[i].branchNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName=" + data.searchBranchList[i].branchName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo=" + data.searchBranchList[i].branchNo + " value='" + apply + "'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        //가맹점 선택
        $(".searchStoreBtn").on("click", function () {
            let branchNo = $(".branchNo").val();
            $(".selBranchNo").val(branchNo);
            let req = convertFormToObj($('form.store_search_form'));
            let therearenoregisteredmerchants = "<spring:message code="list.script.therearenoregisteredmerchants" text="등록된 가맹점이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/store/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function (data) {
                    $(".searchStoreList").html("");
                    if (data.searchStoreList.length == 0 || data.searchStoreList == null) {
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            therearenoregisteredmerchants +
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {

                        for (var i = 0; i < data.searchStoreList.length; i++) {
                            $(".searchStoreList").append(
                                " <li >" +
                                "     <label class=\"store_text\">\n" +
                                "" + data.searchStoreList[i].storeName + "" +
                                "<small style=\"color: green;\">[" + data.searchStoreList[i].storeNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName=" + data.searchStoreList[i].storeName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo=" + data.searchStoreList[i].storeNo + " value='" + apply + "'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        $(document).on("click", ".branchName", function () {
            let headNo = $(".headNo").val();
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            if (headNo == null || headNo == '') {
                swal({
                    title: pleaseselectanaffiliatedheadoffice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            } else {
                $(".searchBranchBtn").click();
            }

        });

        $(document).on("click", ".storeName", function () {
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요"/>";

            if (headNo == null || headNo == '') {
                swal({
                    title: pleaseselectanaffiliatedheadoffice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            } else {
                if (branchNo == null || branchNo == '') {
                    swal({
                        title: pleaseselectadistributor,
                        icon: "warning",
                        buttons: [
                            cancel,
                            confirm
                        ],
                        dangerMode: true,
                    });
                } else {
                    $(".searchStoreBtn").click();
                }
            }
        });

        $(document).on("click", "#selHeadNoBtn", function () {
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle", "modal");
            $(".branchName").val("");
            $(".storeName").val("");
            $(".searchBranchList").html("");
            $(".searchStoreList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click", "#selBranchNoBtn", function () {
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".storeName").attr("data-toggle", "modal");
            $(".storeName").val("");
            $(".searchStoreList").html("");
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click", "#selStoreNoBtn", function () {
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });


        $("#testTable").dataTable();



        $("#ex_chk_All").click(function () {
            $(".orderPathCode").prop('checked', this.checked);
        });
        $("#ex_chk_all_status").click(function () {
            $(".orderStatusCode").prop('checked', this.checked);
        });



        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".excel_form_btn").click(function () {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });

        let date = new Date();
        let yester = new Date();;
        let dateYester = date.getTime() - (1 * 24 * 60 * 60 * 1000);
        yester.setTime(dateYester);
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";



        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        /*date.setMonth(date.getMonth() + 1, 1);*/
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if (startDate == "") {
            $(".startDate").datepicker('setDate', yester);
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }


        if (endDate == "") {
            $(".endDate").datepicker('setDate', yester);
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

    $(document).ready(function(){
        let allChkStatus ="${searchValue.orderStatusCode}";
        let allChk ="${searchValue.orderPathCode}";

        if(allChkStatus == "" )  {
            $("#ex_chk_all_status").click();
        }

        if(allChk == "" )  {
            $("#ex_chk_All").click();
        }

    });

</script>
</body>
</html>
