<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="가맹점"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement1" text="업무그룹"/></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="가맹점"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="가맹점"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form class="brand_search_form"></form>

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12">
                                <form name="frmSearch" id="frmSearch">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.1" text="업무그룹"/><%--<spring:message code="merchandise.search1" text="default text"/>--%><%--가맹점선택--%></strong></td>
                                        <td style="width:30%">
                                           <%-- <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarterss" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                            </label>--%>
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
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarterss" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
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
                                                    <option><spring:message code="list.search.franchiseeheadquarters" text="가맹점명"/></option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" name="storeName" value="${searchValue.storeName}" class="form-control width-150" maxlength="150">
                                            </label>
                                            <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="/workgroup/affilfranch/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
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
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus"><spring:message code="list.search.franchiseeregistration" text="가맹점등록"/></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick"  onclick="searchFormBranchFunction()" ><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/> </button>
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

            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                    <%--<th><input type="checkbox"></th>
                    <th><spring:message code="merchandise.table.column1" text="default text"/>&lt;%&ndash;이미지&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column2" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column3" text="default text"/>&lt;%&ndash;매장정상판매가&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column4" text="default text"/>&lt;%&ndash;매장할인판매가&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column5" text="default text"/>&lt;%&ndash;온라인정상판매가&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column6" text="default text"/>&lt;%&ndash;온라인할인적용 주문금액&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column7" text="default text"/>&lt;%&ndash;상품상태&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column8" text="default text"/>&lt;%&ndash;온라인판매상태&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column9" text="default text"/>&lt;%&ndash;매장판매상태&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column10" text="default text"/>&lt;%&ndash;성인인증구분&ndash;%&gt;</th>
                    <th><spring:message code="merchandise.table.column11" text="default text"/>&lt;%&ndash;등록일/수정일&ndash;%&gt;</th>--%>
                    <th></th>
                    <th class="text-center"><spring:message code="list.word.no" text="순번"/></th>
                    <th class="text-center"><spring:message code="list.word.affiliated" text="제휴본사"/></th>
                    <th class="text-center"><spring:message code="list.word.distributor" text="총판"/></th>
                    <th class="text-center"><spring:message code="list.word.franchisee" text="가맹점"/></th>
                    <th class="text-center"><spring:message code="list.word.status" text="상태"/></th>
                    <th class="text-center"><spring:message code="list.word.serviceclassification" text="서비스구분"/></th>
                    <%--<th class="text-center"><spring:message code="list.word.storetype" text="매장타입"/></th>--%>
                    <th class="text-center"><spring:message code="list.word.multimerchantstore" text="멀티가맹점"/></th>
                    <th class="text-center"><spring:message code="list.word.deposit" text="예치금"/></th>
                    <th class="text-center"><spring:message code="list.word.cash" text="캐시"/></th>
                    <th class="text-center"><spring:message code="list.word.arrears" text="체납금"/></th>
                    <th class="text-center"><spring:message code="list.word.epresentativenumber" text="대표번호"/></th>
                    <th class="text-center"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${tbStore}" varStatus="status">
                        <tr class="detailRow" storeNo="${item.storeNo}">
                            <td class="select-td checkbox_label" onclick="event.cancelBubble = true">
                                <input type="checkbox" name="chk" id="select${status.index}" class="checkbox d-none">
                                <label for="select${status.index}" class="input-label"> <i class="fa fa-square check_all_i"></i></label>
                            </td>
                            <td>${status.index + 1}</td>
                            <td>
                                <span class="orangeColor d-block">H${item.head.headNo}</span>
                                <span>${item.head.headName}</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">B${item.branch.branchNo}</span>
                                <span>${item.branch.branchName}</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">S${item.storeNo}</span>
                                <span>${item.storeName}</span>
                            </td>
                            <td class="text-center <c:if test="${item.dataStatus == 'STOP'}">text-red</c:if>">
                                <c:if test="${item.dataStatus == 'OK'}">
                                    <spring:message code="list.detail.normal" text="정상"/>
                                </c:if>
                                <c:if test="${item.dataStatus == 'STOP'}">
                                    <spring:message code="list.detail.stop" text="정지"/>
                                </c:if>
                            </td>
                            <td class="text-center <c:if test="${item.serviceYn == 'TEST_OR_CALC'}">text-red</c:if>">
                                <c:if test="${item.serviceYn == 'TEST_OR_CALC'}"><spring:message code="list.word.testorcalc" text="테스트 또는 정산"/></c:if>
                                <c:if test="${item.serviceYn == 'SERVICE'}"> <spring:message code="list.word.service" text="서비스"/></c:if>
                            </td>
                         <%--   <td class="text-center">
                               &lt;%&ndash; <c:if test="${item.storeType.str() == '배달가맹'}">
                                    <spring:message code="list.detail.foodorder" text="배달가맹"/>
                                </c:if>
                                <c:if test="${item.storeType.str() == '음식매장'}">
                                    <spring:message code="list.detail.foodorder" text="음식매장"/>
                                </c:if>
                                <c:if test="${item.storeType.str() == '마트'}">
                                    <spring:message code="list.detail.mart" text="마트"/>
                                </c:if>
                                <c:if test="${item.storeType.str() == '전통시장'}">
                                    <spring:message code="list.detail.traditionalmarket" text="전통시장"/>
                                </c:if>&ndash;%&gt;
                            </td>--%>
                            <td class="text-center">
                                <c:if test="${item.multiType.str() == '사용안함'}">
                                    <spring:message code="list.detail.notused" text="사용안함"/>
                                </c:if>
                                <c:if test="${item.multiType.str() == '종속'}">
                                    <spring:message code="list.detail.subordination" text="종속"/>
                                </c:if>
                                <c:if test="${item.multiType.str() == '마스터'}">
                                    <spring:message code="list.detail.master" text="마스터"/>
                                </c:if>
                            </td>
                            <td class="text-right"><fmt:formatNumber value="${item.deposit}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-right"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-right"><fmt:formatNumber value="${item.cashDefault}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-center">${item.storeTel}</td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    <%--<c:forEach begin="1" end="20" varStatus="idx">
                        <tr class="detailRow">
                            <td>${idx.index}</td>
                            <td>
                                <span class="orangeColor d-block">H0004</span>
                                <span>테스트제휴본사(개발)</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">H0004</span>
                                <span>테스트총판(개발)</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">1000</span>
                                <span>만나기본배송그룹</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">S003475</span>
                                <span>KHLEE_소속가맹점</span>
                            </td>
                            <td>정상</td>
                            <td class="text-blue">인증완료</td>
                            <td class="text-red">미동의</td>
                            <td>2021-01-15 14:53:12</td>
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

<%--modal add start--%>
<%--<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal add start--%>
<%--<div class="modal fade" id="searchOption_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="searchOption.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    // DataTables Default

    $(document).on("click",".headName",function(){
        $(".searchHeadBtn").click();
    });

    $(() => {


        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-140');
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
            $(".searchOptionZone").toggleClass('act-height-140');
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

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/



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
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let headNo = $(".headNo").val();
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
            let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
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
            $(".searchClick").click();
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });

        $(".insert_btn").click(function() {
            location.href = "${path}/workgroup/affilfranch/insert";
        });

        $(document).on("click",".detailRow", function() {
            let storeNo = $(this).attr("storeNo");
            location.href = "${path}/workgroup/affilfranch/detail?storeNo="+storeNo;
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
    });

    function searchFormBranchFunction() {
        $("#frmSearch").submit();

       /* let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";

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
        }*/
    }

</script>
</body>
</html>
