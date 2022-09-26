<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.settlement.paymenthistory" arguments="${title}" text="결제내역"/></title>

</head>
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">

            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="정산"/></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.settlement.paymenthistory" text="결제내역"/></li>
                </ol>
                <h3>
                    <spring:message code="sidemenu.settlement.paymenthistory" arguments="${title}" text="결제내역"/>
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
                                        <%--<td class="bg-light" style="width:10%"><strong><spring:message code="list.search.brand" text="브랜드"/></strong></td>
                                        <td style="width:30%">
                                           &lt;%&ndash; <label>
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
                                            </label>&ndash;%&gt;
                                               <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                                   <label>
                                                       <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                       <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                       <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                       <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                   </label>
                                                   <label>
                                                       <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                   </label>
                                                   <label>
                                                       <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                                   </label>
                                               </c:if>
                                               <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                                   <label>
                                                       <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                       <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                       <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                       <c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">
                                                           <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                       </c:if>
                                                       <c:if test="${searchValue.branchNo == null || searchValue.branchNo ==''}">
                                                           <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                       </c:if>


                                                       <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                   </label>
                                                   <label>
                                                       <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                   </label>
                                                   <label>
                                                       <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                                   </label>
                                               </c:if>
                                               <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                                   <label>
                                                       <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                       <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                       <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                       <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                                       <c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">
                                                           <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                       </c:if>
                                                       <c:if test="${searchValue.storeNo == null || searchValue.storeNo ==''}">
                                                           <input type="hidden" class="storeNo" name="storeNo" value="${sessionScope.sessionKey.storeNo}">
                                                       </c:if>

                                                   </label>
                                                   <label>
                                                       <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                                   </label>
                                                   <label>
                                                       <input type="text"  id="testInput"  data-toggle="modal" data-target="#store_search_modal" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>" name="storeNoText" value="${searchValue.storeNoText}" class="form-control background-white storeName width-100">
                                                   </label>
                                               </c:if>
                                        </td>--%>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                        <td style="width:50%">
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.paymentstatus" text="결제상태"/></strong></td>
                                        <td colspan="3">
                                            <div class="row">
                                            </div>
                                            <label>
                                                <select class="form-control status" name="status">
                                                    <option value="-1" <c:if test="${searchValue.status == '-1'}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                    <option value="00" <c:if test="${searchValue.status == ''  || searchValue.status == null  ||  searchValue.status == '00'}">selected</c:if>><spring:message code="list.search.success" text="성공"/></option>
                                                    <option value="9999" <c:if test="${searchValue.status == '9999'}">selected</c:if>><spring:message code="list.search.fail" text="실패"/></option>
                                                </select>
                                            </label>
                                            <%--<label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="/settlement/paymenthistory/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border searchClick" data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
                                            </label>--%>
                                        </td>
                                        <%--<td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control  ">
                                                    <option><spring:message code="list.search.deliverymanname" text="배송원명"/></option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" name="name" value="${searchValue.name}" class="form-control width-150" maxlength="150">
                                            </label>
                                            <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="/settlement/paymenthistory/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border searchClick" data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
                                            </label>
                                            &lt;%&ndash;  <label>
                                                  <select class="form-control width-150">
                                                      &lt;%&ndash;<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                      <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>&ndash;%&gt;
                                                      <option>제휴본사명칭</option>
                                                      <option>제휴본사코드</option>
                                                      <option>인증단말기번호</option>
                                                      <option>사업자등록번호</option>
                                                      <option>계약자</option>
                                                      <option>담당자</option>
                                                  </select>
                                                  <input type="text" class="form-control w-100">
                                              </label>&ndash;%&gt;

                                        </td>--%>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                          <%--  <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>업무그룹&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;&lt;%&ndash;가맹점선택&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>&lt;%&ndash;총판선택&ndash;%&gt;" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search8" text="default text"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                            ~
                                            <label>
                                                <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>배송원상태&lt;%&ndash;<spring:message code="merchandise.search2" text="default text"/>&ndash;%&gt;&lt;%&ndash;성인인증 구분&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    &lt;%&ndash;<option><spring:message code="merchandise.search2.option1" text="default text"/>&lt;%&ndash;전체&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option2" text="default text"/>&lt;%&ndash;필요&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option3" text="default text"/>&lt;%&ndash;불필요&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option4" text="default text"/>&lt;%&ndash;알수없음&ndash;%&gt;</option>&ndash;%&gt;
                                                    <option>승인상태전체</option>
                                                    <option>승인</option>
                                                    <option>미승인</option>
                                                    <option>승인요청</option>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control">
                                                    &lt;%&ndash;<option><spring:message code="merchandise.search2.option1" text="default text"/>&lt;%&ndash;전체&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option2" text="default text"/>&lt;%&ndash;필요&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option3" text="default text"/>&lt;%&ndash;불필요&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option4" text="default text"/>&lt;%&ndash;알수없음&ndash;%&gt;</option>&ndash;%&gt;
                                                    <option>사용상태전체</option>
                                                    <option>정상</option>
                                                    <option>정지</option>
                                                    <option>페이부족</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    &lt;%&ndash;<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>&ndash;%&gt;
                                                    <option>배송원명</option>
                                                    <option>배송원코드</option>
                                                    <option>인증휴대폰번호</option>
                                                </select>
                                                <input type="text" class="form-control width-150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>--%>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <%--<button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus"><spring:message code="list.search.registereddeliveryman" text="배송원등록"/></span>
                                    </button>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/> </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                        <%--div class="dt-buttons btn-group flex-wrap">
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
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th class="text-center"><spring:message code="list.word.no" text="번호"/></th>
                            <th class="text-center"><spring:message code="list.word.franchiseeheadquarters" text="가맹점명"/></th>
                            <th class="text-center"><spring:message code="list.word.orderno" text="주문번호"/></th>
                         <%--   <th class="text-center"><spring:message code="list.word.stor" text="쿠폰사용여부"/></th>
                            <th class="text-center"><spring:message code="list.word.stor" text="쿠폰사용금액"/></th>--%>
                            <th class="text-center"><spring:message code="list.word.meansofpayment" text="지불수단"/></th>
                            <th class="text-center"><spring:message code="list.word.buyersname" text="결제 구매자명(고객명)"/></th>
                            <th class="text-center"><spring:message code="list.word.transactionamount" text="거래금액"/></th>
                            <th class="text-center"><spring:message code="list.word.resultcode" text="결과코드"/></th>
                            <th class="text-center"><spring:message code="list.word.resultmessage" text="결과 메시지"/></th>
                            <th class="text-center"><spring:message code="list.word.approvaldate" text="승인일자"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${paymentlist}" varStatus="status">
                        <tr class="detailRow"  tid="${item.tid}">
                            <td class="text-center">${status.index + 1}</td>
                            <td>${item.store.storeName}</td>
                            <td>${item.orderNo}</td>
                            <%--<td></td>
                            <td></td>--%>
                            <td>${item.payType}</td>
                            <td>${item.userName}(${item.cust.custName})</td>
                            <td><fmt:formatNumber value="${item.amount}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td>
                                <c:if test="${item.status == '00'}"><spring:message code="list.detail.success" text="성공"/></c:if>
                                <c:if test="${item.status != '00'}"><spring:message code="list.detail.fail" text="실패"/></c:if>
                            </td>
                            <td>${item.rmesg1}</td>
                            <td><javatime:format value="${item.authDtm}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
<%--<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>--%>
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
            language : lang_set //or lang_eng
        });

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
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
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName=" + data.searchHeadList[i].headName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo=" + data.searchHeadList[i].headNo + " value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click",function(){
            let noregistereddistributors = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            let headNo = $(".headNo").val();
            $(".selHeadNo").val(headNo);
            let req = convertFormToObj($('form.branch_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/branch/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchBranchList").html("");
                    if(data.searchBranchList.length == 0 || data.searchBranchList == null){
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregistereddistributors+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {
                        for (var i = 0; i < data.searchBranchList.length; i++) {
                            $(".searchBranchList").append(
                                " <li >" +
                                "     <label class=\"branch_text\">\n" +
                                "" + data.searchBranchList[i].branchName + "" +
                                "<small style=\"color: green;\">[" + data.searchBranchList[i].branchNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName=" + data.searchBranchList[i].branchName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo=" + data.searchBranchList[i].branchNo + " value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        //가맹점 선택
        $(".searchStoreBtn").on("click",function(){
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
                success: function(data) {
                    $(".searchStoreList").html("");
                    if(data.searchStoreList.length == 0 || data.searchStoreList == null){
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            therearenoregisteredmerchants+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {

                        for(var i = 0 ; i < data.searchStoreList.length ; i++){
                            $(".searchStoreList").append(
                                " <li >" +
                                "     <label class=\"store_text\">\n" +
                                ""+data.searchStoreList[i].storeName+""+
                                "<small style=\"color: green;\">["+data.searchStoreList[i].storeNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName="+data.searchStoreList[i].storeName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo="+data.searchStoreList[i].storeNo+" value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            if(headNo == null || headNo =='') {
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

        $(document).on("click",".storeName",function(){
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();

            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요"/>";

            if(headNo == null || headNo =='') {
                swal({
                    title: pleaseselectanaffiliatedheadoffice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            }  else {
                if(branchNo == null || branchNo =='') {
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

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".storeName").val("");
            $(".searchBranchList").html("");
            $(".searchStoreList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".storeName").attr("data-toggle","modal");
            $(".storeName").val("");
            $(".searchStoreList").html("");
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });



        $("#testTable").dataTable();
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownWide").hide();
                $(".detailOptionBtnUpWide").show();
                /*$(".arrow-down-wide").show();
                $(".arrow-up-wide").hide();*/
            } else {
                $(".detailOptionBtnDownWide").show();
                $(".detailOptionBtnUpWide").hide();
                /*$(".arrow-down-wide").hide();
                $(".arrow-up-wide").show();*/
            }
        });

        $(".detailOptionBtn2").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
                /*$(".arrow-down-narrow").show();
                $(".arrow-up-narrow").hide();*/
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
                /*$(".arrow-down-narrow").hide();
                $(".arrow-up-narrow").show();*/
            }
        });


        $(document).on("click",".detailRow", function() {
            let tid = $(this).attr("tid");
            location.href = "${path}/settlement/paymenthistory/detail?tid="+tid;
        });

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });



        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        var date = new Date();
        var yesterDay = new Date();
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth - 30);
        yesterDay.setDate(yesterDay - 1);
        var startDate = "${searchValue.startDate}";
        var endDate = "${searchValue.endDate}";

        if(startDate == ""){
            $(".startDate").datepicker('setDate', d);
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
       /* if($(".storeNo").val() == "" || $(".storeNo").val() == null) {
            swal({
                title: "가맹점을 선택해주세요.",
                icon: "warning",
                buttons: [
                    '취소',
                    '확인'
                ],
                dangerMode: true,
            });
        } else {
            $("#frmSearch").submit();
        }*/
        $("#frmSearch").submit();
    }
</script>
</body>
</html>
