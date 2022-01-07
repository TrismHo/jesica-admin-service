<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.settlement.orderplatformsettlementgroup" arguments="${title}" text="주문플랫폼정산 그룹"/></title>
</head>
<style>
    @media (max-width: 1920px){
        .modal-content {
            width: 120%;
        }
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">

            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.settlement" text="정산"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.settlement.orderplatformsettlementgroup" arguments="${title}" text="주문플랫폼 정산그룹"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.settlement.orderplatformsettlementgroup" arguments="${title}" text="주문플랫폼 정산그룹"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12">
                                <form name="frmSearch" id="frmSearch">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.brand" text="브랜드"/><%--<spring:message code="merchandise.search1" text="default text"/>--%><%--가맹점선택--%></strong></td>
                                        <td style="width:30%">
                                            <%--  <label>
                                                  <input type="text" data-toggle="modal" data-target="#head_search_modal" name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-150" readonly>
                                                  <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                              </label>
                                              <label>
                                                  <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-150" readonly>
                                                  <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                              </label>--%>
                                            <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                            </label>
                                            </c:if>
                                            <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                            </label>
                                            </c:if>
                                            <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                            </label>
                                            </c:if>
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
                                        <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/></strong></td>
                                        <td>
                                            <div class="row">
                                            </div>
                                            <label>
                                                <select class="form-control dataStatus" name="dataStatus">
                                                    <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                    <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>><spring:message code="list.search.normal" text="정상"/></option>
                                                    <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>><spring:message code="list.search.stop" text="정지"/></option>
                                                </select>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control  ">
                                                    <option><spring:message code="list.search.groupname" text="그룹명"/></option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" name="storeName" value="${searchValue.storeName}" class="form-control width-150" maxlength="150">
                                            </label>
                                            <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="/settlement/servicechargegrp/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
                                            </label>
                                            <%--  <label>
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
                                              </label>--%>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                            <%--   <i class="fa fa-angle-single-down detailOptionBtnUpNarrow detailOptionBtn2"></i>
                               <i class="fa fa-angle-single-up detailOptionBtnDownNarrow detailOptionBtn2"></i>--%>
                            <%--<span class="arrow-down-narrow detailOptionBtn2">
                            </span>
                            <span class="arrow-up-narrow detailOptionBtn2">
                            </span>--%>
                            <%--<i id="detailOptionBtn" class=" fas fa-lg fa-fw m-r-10 fa-plus"></i>--%>

                            <br>
                            <div class="col-xl-12 col-md-12  m-t-10">
                                <div class="">
                                    <button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus"><spring:message code="list.search.groupregistration" text="그룹등록"/></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick"  onclick="searchFormBranchFunction()" ><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/>  </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                        <%--<div class="dt-buttons btn-group flex-wrap">
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

            <div class="panel-body">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th width="5%" rowspan="2" class="align-middle"><spring:message code="list.word.no" text="번호"/></th>
                            <th width="15%" rowspan="2" class="align-middle"><spring:message code="list.word.affiliated" text="제휴본사"/></th>
                            <th width="15%" rowspan="2" class="align-middle"><spring:message code="list.word.managementdistributor" text="관리총판"/></th>
                            <th rowspan="2" class="align-middle"><spring:message code="list.word.settlementgroupname" text="정산 그룹명"/></th>
                            <th colspan="4"><spring:message code="list.word.orderappfeesettlementratio" text="제휴주문앱 수수료 정산비율 (플랫폼사/1차/2차/3차/4차)"/></th>
                            <th colspan="4"><spring:message code="list.word.eatsudafeesettlementratio" text="잇수다 사용료 정산비율 (플랫폼사/1차/2차/3차/4차)"/></th>
                        </tr>
                        <tr class="text-center">
                            <th><spring:message code="list.word.fooddelivery" text="음식배달"/></th>
                            <th><spring:message code="list.word.mart" text="마트"/></th>
                            <th><spring:message code="list.word.managementdistributor" text="전통시장"/></th>
                            <th><spring:message code="list.word.etc" text="기타"/></th>
                            <th><spring:message code="list.word.managementdistributor" text="음식배달"/></th>
                            <th><spring:message code="list.word.mart" text="마트"/></th>
                            <th><spring:message code="list.word.managementdistributor" text="전통시장"/></th>
                            <th><spring:message code="list.word.etc" text="기타"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item"  items="${tbServiceChargeGroup}"  varStatus="status">
                            <tr class="detailRow" chargeNo="${item.tbServiceChargeGroup.chargeNo}">
                                <td class="text-center">${status.index + 1}</td>
                                <td>
                                    <span class="orangeColor d-block">H${item.tbServiceChargeGroup.head.headNo}</span>
                                    <span>${item.tbServiceChargeGroup.head.headName}</span>
                                </td>
                                <td >
                                    <span class="orangeColor d-block">B${item.tbServiceChargeGroup.branch.branchNo}</span>
                                    <span>${item.tbServiceChargeGroup.branch.branchName}</span>
                                </td>
                                <td class="text-center">
                                    <span>${item.tbServiceChargeGroup.chargeName}</span>
                                </td>
                                <c:forEach var="items"  items="${item.tbServiceCharge}"  varStatus="status">
                                    <c:choose>
                                        <c:when test="${items.platformType == 1}">
                                            <c:if test="${items.serviceType == 1}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                            <c:if test="${items.serviceType == 2}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                            <c:if test="${items.serviceType == 3}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                            <c:if test="${items.serviceType == 0}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                        </c:when>
                                        <c:when test="${items.platformType == 0}">
                                            <c:if test="${items.serviceType == 1}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                            <c:if test="${items.serviceType == 2}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                            <c:if test="${items.serviceType == 3}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                            <c:if test="${items.serviceType == 0}">
                                                <td class="text-center">
                                                        ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                                </td>
                                            </c:if>
                                        </c:when>
                                    </c:choose>
                                 <%--   <c:if test="${items.platformType == 1}">
                                        <c:if test="${items.serviceType == 1}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                        <c:if test="${items.serviceType == 2}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                        <c:if test="${items.serviceType == 3}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                        <c:if test="${items.serviceType == 0}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${items.platformType == 0}">
                                        <c:if test="${items.serviceType == 1}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                        <c:if test="${items.serviceType == 2}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                        <c:if test="${items.serviceType == 3}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                        <c:if test="${items.serviceType == 0}">
                                            <td class="text-center">
                                                    ${items.svcRate0}/${items.svcRate1}/${items.svcRate2}/${items.svcRate3}
                                            </td>
                                        </c:if>
                                    </c:if>
--%>
                                 </c:forEach>
                          </tr>
                        </c:forEach>
                    <%--    <c:forEach begin="1" end="2" varStatus="idx">
                            <tr class="detailRow">
                                <td>${idx.index}</td>
                                <td>
                                    <span class="orangeColor d-block">H0004</span>
                                    <span>테스트제휴본사(개발)</span>
                                </td>
                                <td>
                                    <span  class="orangeColor d-block">BC176</span>
                                    <span>테스트관리총판</span>
                                </td>
                                <td>
                                    <span class="orangeColor d-block">M00007</span>
                                    <span>테스트그룹</span>
                                </td>
                                <td class="text-center">70/10/20/0/0</td>
                                <td class="text-center">100/0/0/0/0</td>
                                <td class="text-center">100/0/0/0/0</td>
                                <td class="text-center">70/10/20/0/0</td>
                                <td class="text-center">100/0/0/0/0</td>
                                <td class="text-center">100/0/0/0/0</td>
                                <td class="text-center">70/10/20/0/0</td>
                                <td class="text-center">100/0/0/0/0</td>
                                <td class="text-center">100/0/0/0/0</td>
                            </tr>
                        </c:forEach>--%>
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

<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>


<script>

    $(document).on("click",".detailRow", function() {
        let chargeNo = $(this).attr("chargeNo");
        location.href = "${path}/settlement/servicechargegrp/detail?chargeNo="+chargeNo;
    });
    $(() => {
        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            let req = convertFormToObj($('form.head_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    if(data.searchHeadList.length == 0 || data.searchHeadList == null){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregisteredaffiliateheadquarters+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            $(".searchHeadList").append(
                                " <li >" +
                                "     <label class=\"head_text\">\n" +
                                ""+data.searchHeadList[i].headName+""+
                                "<small style=\"color: green;\">["+data.searchHeadList[i].headNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='"+apply+"'></div>\n" +
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

     /*   $(document).on("click",".storeName",function(){
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();

            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let pleaseenterthestorename = "<spring:message code="list.script.pleaseenterthestorename" text="가맹점명을 입력해주세요."/>";

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
                        title: pleaseenterthestorename,
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
        });*/

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
/*            $(".storeName").attr("data-toggle","modal");
            $(".storeName").val("");*/
            $(".searchStoreList").html("");
            $(".searchClick").click();
            $(".branchModalCloseBtn").click();
        });

 /*       $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });*/


        //등록시
        //제휴본사 검색
        $(document).ready(function(){
            let headReq = convertFormToObj($('form.head_sel_search_form'));
            let headNo = "${searchValue.headNo}";
            let role = "${sessionScope.sessionKey.userRole}";
            let sessionHead = "${sessionScope.sessionKey.headNo}";
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(headReq),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".selSearchHeadList").html("");
                    if(role == 0) {
                        $(".selSearchHeadList").append(
                            "<option value=\"\" selected>"+pleaseselectanaffiliatedheadoffice+"</option>"
                        )
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            if(headNo == data.searchHeadList[i].headNo) {
                                $(".selSearchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+">"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            } else {
                                $(".selSearchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+">"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            }
                        }
                    } else if (role == 1) {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            if(sessionHead == data.searchHeadList[i].headNo) {
                                $(".searchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            }
                        }
                    } else if (role == 2) {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            if(sessionHead == data.searchHeadList[i].headNo) {
                                $(".searchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            }
                        }
                    }
                  /*  searchBranch();*/

                }
            });
        });

        $(".selSearchHeadList").on("change", function(){
            searchBranch();
        });

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        let date = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', '2020-01-01');
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

        $(".save_btn").on("click",function(){
            let url ="${path}/api/settlement/servicechargegrp/insert";
            let registermsg = "<spring:message code="list.detail.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let enrollment = "<spring:message code="list.detail.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.detail.cancel" text="취소"/>";
            let registersussmsg = "<spring:message code="list.detail.registrationwassuccessful" text="등록에 성공하였습니다."/>";
            let registerfailmsg = "<spring:message code="list.detail.registrationfailed" text="등록에 실패하였습니다."/>";
            let _forms = $('.head_sel_search_form');
            let req = convertFormToObj(_forms);
            if (inputDataCheck(req)) {
                swal({
                    title: registermsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        enrollment
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if(isConfirm){
                        var formData = new FormData(document.getElementById('head_sel_search_form'));
                        formData.append("tbServiceChargeGroupData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(registersussmsg);
                                    location.reload();
                                } else {
                                    alert(registerfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });
    });

    function searchFormBranchFunction() {
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
        let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";

        if($(".branchNo").val() == "" || $(".branchNo").val() == null) {
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
            $("#frmSearch").submit();
        }
    }

    function searchBranch() {
        let noregistereddistributors = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
        let branchReq = convertFormToObj($('form.head_sel_search_form'));
        let role = "${sessionScope.sessionKey.userRole}";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/branch/list",
            data: JSON.stringify(branchReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                $(".selSearchBranchList").html("");

                if(data.searchBranchList.length == 0 || data.searchBranchList == null){
                    $(".selSearchBranchList").append(
                        "<option>"+noregistereddistributors+"</option>"
                    )
                }else {
                    if(role == 0) {
                        for(var i = 0 ; i < data.searchBranchList.length ; i++){
                            $(".selSearchBranchList").append(
                                "<option value="+data.searchBranchList[i].branchNo+" selected>"+data.searchBranchList[i].branchName+"["+data.searchBranchList[i].headNo+"]</option>"
                            )
                        }
                    }
                }
            }
        });
    }

    function inputDataCheck(args) {
        let pleasenteagroupname = "<spring:message code="list.script.noregistereddistributors" text="그룹명을 입력해주세요."/>";
        let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
        let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요"/>";

        console.log(args);
        if (isNull(args.chargeName)) {
            return alert_focus("chargeName", pleasenteagroupname);
        } else if (isNull(args.headNo) ) {
            return alert_focus("headNo", pleaseselectanaffiliatedheadoffice);
        } else if (isNull(args.branchNo) ) {
            return alert_focus("branchNo", pleaseselectadistributor);
        }
        return true;
    }
</script>
</body>
</html>
