<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.workgroupmanagement.deiliverygroup" text="배송그룹"/></title>

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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.deiliverygroup" text="배송그룹"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.workgroupmanagement.deiliverygroup" text="배송그룹"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
                <%--<div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12">
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
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>플랫폼 사용료&lt;%&ndash;<spring:message code="merchandise.search2" text="default text"/>&ndash;%&gt;&lt;%&ndash;성인인증 구분&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    &lt;%&ndash;<option><spring:message code="merchandise.search2.option1" text="default text"/>&lt;%&ndash;전체&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option2" text="default text"/>&lt;%&ndash;필요&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option3" text="default text"/>&lt;%&ndash;불필요&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search2.option4" text="default text"/>&lt;%&ndash;알수없음&ndash;%&gt;</option>&ndash;%&gt;
                                                    <option>차감여부전체</option>
                                                    <option>차감</option>
                                                    <option>미차감</option>
                                                </select>
                                            </label>
                                        </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    &lt;%&ndash;<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>&ndash;%&gt;
                                                    <option>관리총판명칭</option>
                                                    <option>드라이버 그룹명칭</option>
                                                </select>
                                                <input type="text" class="form-control width-150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus">&nbsp;드라이버 그룹등록&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품등록&ndash;%&gt;</span>
                                    </button>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                        <div class="dt-buttons btn-group flex-wrap">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                    <div class="search-box">
                        <div class="inner-search-box p-15">
                            <div class="row">
                                <div class="col-xl-12 col-md-12 ">
                                    <form name="frmSearch" id="frmSearch">
                                        <table class="table table-condensed table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.franchiseselection" text="가맹점 선택"/><%--가맹점선택--%></strong></td>
                                                <td style="width:30%">
                                                  <%--  <label>
                                                        <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                        <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                        <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                        <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                        <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                        <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                    </label>
                                                    <label>
                                                        <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판명"/>" class="form-control background-white branchName width-100" >

                                                    </label>
                                                    <label>
                                                        <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
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
                                                              <c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">
                                                                  <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                              </c:if>
                                                              <c:if test="${searchValue.branchNo == null || searchValue.branchNo ==''}">
                                                                  <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                              </c:if>


                                                              <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
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

                                                    <%--
                                                                                                  <label>
                                                                                                        <input type="text" class="form-control width-250 storeNoText"  name="storeNoText" value="${searchValue.storeNoText}" placeholder="가맹점명을 입력후 엔터키를 입력해주세요" />
                                                                                                    <label>--%>
                                                </td>
                                                <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                                <td style="width:50%">
                                                    <label>
                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                    </label>
                                                    <label>
                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                    </label>
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
                                                        <select class="form-control">
                                                            <option><spring:message code="list.search.merchandisename" text="배달대행이름"/><%--상품명--%></option>
                                                        </select>
                                                        <input type="text" class="form-control width-150" name="dlvyName" value="${searchValue.dlvyName}" maxlength="150">
                                                    </label>
                                                    <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="/workgroup/deliverygrp/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
                                                    </label>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                                <br>
                                <div class="col-xl-12 col-md-12 m-t-15">
                                    <div class="">
                                        <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                            <span class="fa fa-plus">&nbsp;<spring:message code="list.search.deliverygroupregistration1" text="배송그룹등록"/><%--상품등록--%></span>
                                        </button>
                                        <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                        <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/><%--검색--%> </button>
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
                            </div>
                        </div>
                    </div>
            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th class="text-left"><spring:message code="list.word.no" text="순번"/></th>
                        <th><spring:message code="list.word.managementdistributor" text="관리총판"/></th>
                        <th><spring:message code="list.word.managementstore" text="관리가맹점"/></th>
                        <th><spring:message code="list.word.deliveryagentname" text="배달대행이름"/></th>
                        <th><spring:message code="list.word.operatingstatus" text="사용상태"/></th>
                        <th><spring:message code="list.word.operatingstatus" text="운영상태"/></th>
                        <th><spring:message code="list.word.deliveryagencygroup" text="배달대행그룹구분"/></th>
                        <th><spring:message code="list.word.availabilityofoperatinghours" text="운영시간 사용여부"/></th>
                        <th><spring:message code="list.word.operatinghours/endtimes" text="운영시작 / 종료 시간"/></th>
                        <th><spring:message code="list.word.registrationdate" text="등록일시"/></th>
                        <th><spring:message code="list.word.modifieddate" text="수정일시"/></th>
                    </tr>
                    </thead>
                    <tbody>
                  <%--  <c:forEach begin="1" end="20" varStatus="idx">
                        <tr class="detailRow">
                            <td>${idx.index}</td>
                            <td>
                                <span class="orangeColor d-block">111${idx.index}</span>
                                <span>테스트_드라이버 그룹${idx.index}</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">BE1234</span>
                                <span>테스트_관리총판${idx.index}</span>
                            </td>
                            <td class="text-right">0원</td>
                            <td class="text-center orangeColor">미차감</td>
                            <td class="text-center">정산비율</td>
                            <td class="text-right">0원</td>
                            <td class="text-right">0원</td>
                            <td class="text-right">0원</td>
                            <td class="text-right">0원</td>
                            <td class="text-right">0원</td>
                            <td class="text-right">0원</td>
                            <td class="text-center">2021-01-25 12:29:00</td>
                        </tr>
                    </c:forEach>--%>
                 <c:forEach var="item"  items="${tbDelivery}"  varStatus="status">
                      <tr class="detailRow" dlvyNo="${item.dlvyNo}">
                          <td class="text-center" >${status.index + 1}</td>

                          <td>
                              <span class="orangeColor d-block">B${item.branch.branchNo}</span>
                              <span>${item.branch.branchName}</span>
                          </td>
                          <td>
                              <span class="orangeColor d-block">S${item.store.storeNo}</span>
                              <span>${item.store.storeName}</span>
                          </td>
                          <td>${item.dlvyName}</td>
                          <td class="text-center">
                              <c:if test="${item.dataStatus == 'OK'}"><spring:message code="list.detail.inoperation1" text="사용중"/></c:if>
                              <c:if test="${item.dataStatus == 'STOP'}"><span class="text-red"><spring:message code="list.detail.pause1" text="정지"/></span></c:if>
                          </td>
                          <td class="text-center">
                                  <c:if test="${item.openStatus == 1}"><spring:message code="list.detail.inoperation" text="운영중"/></c:if>
                              <c:if test="${item.openStatus == 0}"><span class="text-red"><spring:message code="list.detail.pause" text="일시중지"/></span></c:if>
                          </td>
                          <td class="text-center">
                              <c:if test="${item.dlvyGroupType == 1}"><spring:message code="list.detail.orderonly" text="발주전용"/></c:if>
                              <c:if test="${item.dlvyGroupType == 2}"><spring:message code="list.detail.obtainorderonly" text="수주전용"/></c:if>
                              <c:if test="${item.dlvyGroupType == 3}"><spring:message code="list.detail.orderplusobtainorderonly" text="발주 + 수주"/></c:if>
                          </td>
                          <td class="text-center">
                              <c:if test="${item.openTimeYn == 1}"><spring:message code="list.word.used" text="사용"/></c:if>
                              <c:if test="${item.openTimeYn == 0}"><span class="text-red"><spring:message code="list.word.unused" text="미사용"/></span></c:if>
                          </td>
                          <td class="text-center openTimeStart">
                              <c:if test="${item.openTimeStart.length() == 3}">
                                  <fmt:parseDate value="${item.openTimeStart}" var="date" pattern="mss"/>
                                  <fmt:formatDate value="${date}" pattern="0m:ss"/>
                              </c:if>
                              <c:if test="${item.openTimeStart.length() == 4}">
                                  <fmt:parseDate value="${item.openTimeStart}" var="date" pattern="mmss"/>
                                  <fmt:formatDate value="${date}" pattern="mm:ss"/>
                              </c:if>
                              ~
                              <c:if test="${item.openTimeEnd.length() == 3}">
                                  <fmt:parseDate value="${item.openTimeEnd}" var="date" pattern="mss"/>
                                  <fmt:formatDate value="${date}" pattern="0m:ss"/>
                              </c:if>
                              <c:if test="${item.openTimeEnd.length() == 4}">
                                  <fmt:parseDate value="${item.openTimeEnd}" var="date" pattern="mmss"/>
                                  <fmt:formatDate value="${date}" pattern="mm:ss"/>
                              </c:if>
                          </td>
                      <%--<td class="text-center" ></td>
                          <td>
                              <span class="orangeColor d-block">${item.systemCategory.catCode}</span>
                              <span >${item.dlvyName}</span>
                          </td>
                          <td class="text-center">${item.goodsName}</td>
                          <td class="text-right"><fmt:formatNumber value="${item.goodsPrice}" pattern="#,###" /> 원</td>
                          <td class="text-center">
                              <c:if test="${item.
                               == true}">과세</c:if>
                              <c:if test="${item.taxYn == false}">비과세</c:if></td>
                          <td class="text-center">${item.barcode}</td>--%>
                          <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                          <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
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
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
<%--modal add end--%>
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
    $(document).on("click",".headName",function(){
        $(".searchHeadBtn").click();
    });
    $(() => {
        /*$("#testInput").autocomplete({
            source : function(request, response) {
                $.ajax({
                    url : "${path}/api/get/storeTxt"
                    , type : "GET"
                    ,data: {storeName : $("#testInput").val()}
                    ,contentType: "application/json;"
                    ,dataType: "json"
                    , success : function(data){ // 성공
                        console.log(data.storeTxtList);
                        response(
                            $.map(data.storeTxtList, function(item) {
                                return {
                                    label : item.storeName+"["+item.storeNo+"]"    //목록에 표시되는 값
                                    , value : item.storeName+"["+item.storeNo+"]"        //선택 시 input창에 표시되는 값
                                    , headNo : item.headNo
                                    , headName : item.headName
                                    , branchNo : item.branchNo
                                    , branchName : item.branchName
                                    , storeNo : item.storeNo
                                    , storeName : item.storeName
                                };
                            })
                        );    //response
                    }
                    ,
                    error : function(){ //실패
                        alert("통신에 실패했습니다.");
                    }
                });
            }
            , minLength : 1
            , autoFocus : false
            , select : function(evt, ui) {
                $(".headNo").val(ui.item.headNo)
                $(".headName").val(ui.item.headName+'['+ui.item.headNo+']')
                $(".branchNo").val(ui.item.branchNo)
                $(".branchName").val(ui.item.branchName+'['+ui.item.branchNo+']')
                $(".storeNo").val(ui.item.storeNo)
                $(".storeName").val(ui.item.storeName+'['+ui.item.storeNo+']')
            }
            , focus : function(evt, ui) {
                return false;
            }
            , close : function(evt) {
            }
        });*/

        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });
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

        $(".insert_btn").click(function() {
            location.href = "${path}/workgroup/deliverygrp/insert";
        });

        $(".detailRow").click(function() {
            location.href = "${path}/workgroup/deliverygrp/detail";
        });

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
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


        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_ㄹtext").text());
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
            $("#frmSearch").submit();
        });


        $(document).on("click",".detailRow",function() {
            let dlvyNo = $(this).attr("dlvyNo");
            location.href = "${path}/workgroup/deliverygrp/detail?dlvyNo="+dlvyNo;
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

    function searchFormFunction() {
        $("#frmSearch").submit();
        /*let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
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
