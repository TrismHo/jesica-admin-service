<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.orderplatformsettlementdetails" text="주문플랫폼정산 상세"/></title>
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
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.settlement" text="정산"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.settlement.orderplatformsettlementgroup" text="주문플랫폼 정산그룹"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.orderplatformsettlementdetails" text="주문플랫폼 정산상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.orderplatformsettlementdetails" text="주문플랫폼 정산상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td><spring:message code="list.detail.orderplatformsettlementgroupname" text="주문플랫폼정산 그룹명"/></td>
                        <td><span class="text-green">[G${tbServiceChargeGroup.chargeNo}]</span> <input type="text" class="form-control m-l-10 chargeName" value="${tbServiceChargeGroup.chargeName}"><button type="button" class="btn-box-r m-l-10 align-middle update_charge_name"><i class="fa fa-pencil-alt"></i> <spring:message code="list.detail.update" text="수정"/></button></td>
                        <td><spring:message code="list.detail.managementdistributor" text="관리총판"/></td>
                        <td>
                            <span class="text-green">[H${tbServiceChargeGroup.head.headNo}]</span> ${tbServiceChargeGroup.head.headName} / <span class="orangeColor">[B${tbServiceChargeGroup.branch.branchNo}]</span> ${tbServiceChargeGroup.branch.branchName}
                        </td>
                    </tr>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.settlementofusefee" text="잇수다 사용료 정산"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.settlementofusefee" text="잇수다 사용료 정산"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.externalplatformfeesettlement" text="외부플랫폼 수수료 정산"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.externalplatformfeesettlement" text="외부플랫폼 수수료 정산"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="" data-scrollbar="true">
                        <div class="p-b-20">
                                <table class="table table-condensed table-bordered"  id="serviceChargeTbl1_${items.serviceType}">
                                <c:forEach var="items"  items="${tbServiceCharge}"  varStatus="status">
                                    <c:if test="${items.platformType == 1}">
                                    <tr>
                                        <td class="" rowspan="5">
                                            <input type="hidden" class="platformType${items.serviceType}_${items.platformType}" name="platformType" value="1">
                                            <c:choose>
                                                <c:when test="${items.serviceType == 1}">
                                                    <spring:message code="list.detail.fooddelivery" text="음식배달"/>
                                                    <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="1">
                                                </c:when>
                                                <c:when test="${items.serviceType == 2}">
                                                     <spring:message code="list.detail.mart" text="마트"/>
                                                    <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="2">
                                                </c:when>
                                                <c:when test="${items.serviceType == 3}">
                                                    <spring:message code="list.detail.traditionalmarket" text="전통시장"/>
                                                    <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}"  name="serviceType" value="3">
                                                </c:when>
                                                <c:when test="${items.serviceType == 0}">
                                                     <spring:message code="list.detail.etc" text="기타"/>
                                                    <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="0">
                                                </c:when>
                                                <c:otherwise>
                                                    <spring:message code="list.detail.unregistered" text="미등록"/>
                                                    <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="">
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="list.detail.settlementrate" text="정산 비율"/></td>
                                        <td class="rate">
                                            <label class="m-r-10"><spring:message code="list.detail.platformcompany" text="플랫폼사"/>&nbsp;&nbsp;<input type="text" name="svcRate0" value="${items.svcRate0}" class="form-control svcRate0${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                            <label class="m-r-10"><spring:message code="list.detail.primary" text="1차"/>&nbsp;&nbsp;<input type="text" name="svcRate1" value="${items.svcRate1}" class="form-control svcRate1${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                            <label class="m-r-10"><spring:message code="list.detail.secondary" text="2차"/>&nbsp;&nbsp;<input type="text" name="svcRate2" value="${items.svcRate2}"  class="form-control svcRate2${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                            <label class="m-r-10"><spring:message code="list.detail.tertiary" text="3차"/>&nbsp;&nbsp;<input type="text" name="svcRate3" value="${items.svcRate3}" class="form-control svcRate3${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="list.detail.1stmanager" text="1차 매니저"/></td>
                                        <td>
                                            <input type="text" serviceType="${items.serviceType}"  data-toggle="modal" manager="1" platformType="1"  data-target="#head_search_modal" class="form-control selHead width-150"  placeholder="<spring:message code="list.detail.selectaffiliateheadquarters" text="제휴본사 선택"/>" value="<c:forEach var="items2"  items="${tbHead}"  varStatus="status"><c:if test="${items2.headNo == items.headNo1}">${items2.headName}[${items2.headNo}]</c:if></c:forEach>" readonly>
                                            <input type="text"  serviceType="${items.serviceType}" data-toggle="<c:if test="${items.headNo1 != null}">modal</c:if>" manager="1" platformType="1" data-target="#branch_search_modal" class="form-control selBranch width-150" placeholder="<spring:message code="list.detail.distributorselection" text="총판 선택"/>" value="<c:forEach var="items2"  items="${tbBranch}"  varStatus="status"><c:if test="${items2.branchNo == items.branchNo1}">${items2.branchName}[${items2.branchNo}]</c:if></c:forEach>" readonly>
                                            <input type="hidden" class="head${items.platformType}_1_${items.serviceType} headNo1${items.serviceType}_${items.platformType}" name="headNo1" value="${items.headNo1}">
                                            <input type="hidden" class="branch${items.platformType}_1_${items.serviceType} branchNo1${items.serviceType}_${items.platformType}" name="branchNo1" value="${items.branchNo1}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="list.detail.2ndmanager" text="2차 매니저"/></td>
                                        <td>
                                            <input type="text"  serviceType="${items.serviceType}" data-toggle="modal" manager="2" platformType="1"  data-target="#head_search_modal" class="form-control selHead width-150" placeholder="<spring:message code="list.detail.selectaffiliateheadquarters" text="제휴본사 선택"/>" value="<c:forEach var="items2"  items="${tbHead}"  varStatus="status"><c:if test="${items2.headNo == items.headNo2}">${items2.headName}[${items2.headNo}]</c:if></c:forEach>" readonly>
                                            <input type="text"  serviceType="${items.serviceType}" data-toggle="<c:if test="${items.headNo2 != null}">modal</c:if>" manager="2" platformType="1"  data-target="#branch_search_modal" class="form-control selBranch width-150" placeholder="<spring:message code="list.detail.distributorselection" text="총판 선택"/>" value="<c:forEach var="items2"  items="${tbBranch}"  varStatus="status"><c:if test="${items2.branchNo == items.branchNo2}">${items2.branchName}[${items2.branchNo}]</c:if></c:forEach>" readonly>
                                            <input type="hidden" class="head${items.platformType}_2_${items.serviceType} headNo2${items.serviceType}_${items.platformType}" name="headNo2" value="${items.headNo2}">
                                            <input type="hidden" class="branch${items.platformType}_2_${items.serviceType} branchNo2${items.serviceType}_${items.platformType}" name="branchNo2" value="${items.branchNo2}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><spring:message code="list.detail.3rdmanager" text="3차 매니저"/></td>
                                        <td >
                                            <input type="text" serviceType="${items.serviceType}" data-toggle="modal" manager="3" platformType="1"  data-target="#head_search_modal" class="form-control selHead width-150"  placeholder="<spring:message code="list.detail.selectaffiliateheadquarters" text="제휴본사 선택"/>" value="<c:forEach var="items2"  items="${tbHead}"  varStatus="status"><c:if test="${items2.headNo == items.headNo3}">${items2.headName}[${items2.headNo}]</c:if></c:forEach>" readonly>
                                            <input type="text" serviceType="${items.serviceType}" data-toggle="<c:if test="${items.headNo3 != null}">modal</c:if>" manager="3" platformType="1"  data-target="#branch_search_modal" class="form-control selBranch width-150" placeholder="<spring:message code="list.detail.distributorselection" text="총판 선택"/>" value="<c:forEach var="items2"  items="${tbBranch}"  varStatus="status"><c:if test="${items2.branchNo == items.branchNo3}">${items2.branchName}[${items2.branchNo}]</c:if></c:forEach>" readonly>
                                            <input type="hidden" class="head${items.platformType}_3_${items.serviceType} headNo3${items.serviceType}_${items.platformType}" name="headNo3" value="${items.headNo3}">
                                            <input type="hidden" class="branch${items.platformType}_3_${items.serviceType} branchNo3${items.serviceType}_${items.platformType}" name="branchNo3" value="${items.branchNo3}">
                                        </td>
                                    </tr>
                                    </c:if>
                                </c:forEach>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="" >
                        <div class="p-b-20">
                            <table class="table table-condensed table-bordered serviceChargeTbl">
                                <c:forEach var="items"  items="${tbServiceCharge}"  varStatus="status">
                                    <c:if test="${items.platformType == 0}">
                                        <tr>
                                            <td class="" rowspan="5">
                                                <input type="hidden" class="platformType${items.serviceType}_${items.platformType}" name="platformType" value="0">
                                                <c:choose>
                                                    <c:when test="${items.serviceType == 1}">
                                                        <spring:message code="list.detail.fooddelivery" text="음식배달"/>
                                                        <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="1">
                                                    </c:when>
                                                    <c:when test="${items.serviceType == 2}">
                                                        <spring:message code="list.detail.mart" text="마트"/>
                                                        <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="2">
                                                    </c:when>
                                                    <c:when test="${items.serviceType == 3}">
                                                        <spring:message code="list.detail.traditionalmarket" text="전통시장"/>
                                                        <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="3">
                                                    </c:when>
                                                    <c:when test="${items.serviceType == 0}">
                                                        <spring:message code="list.detail.etc" text="기타"/>
                                                        <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="0">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <spring:message code="list.detail.unregistered" text="미등록"/>
                                                        <input type="hidden" class="serviceType${items.serviceType}_${items.platformType}" name="serviceType" value="">
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td><spring:message code="list.detail.settlementrate" text="정산 비율"/></td>
                                            <td class="rate">
                                                <label class="m-r-10"><spring:message code="list.detail.platformcompany" text="플랫폼사"/>&nbsp;&nbsp;<input type="text" name="svcRate0" value="${items.svcRate0}" class="form-control svcRate0${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                                <label class="m-r-10"><spring:message code="list.detail.primary" text="1차"/>&nbsp;&nbsp;<input type="text" name="svcRate1" value="${items.svcRate1}" class="form-control svcRate1${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                                <label class="m-r-10"><spring:message code="list.detail.secondary" text="2차"/>&nbsp;&nbsp;<input type="text" name="svcRate2" value="${items.svcRate2}"  class="form-control svcRate2${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                                <label class="m-r-10"><spring:message code="list.detail.tertiary" text="3차"/>&nbsp;&nbsp;<input type="text" name="svcRate3" value="${items.svcRate3}" class="form-control svcRate3${items.serviceType}_${items.platformType}" numberOnly="ture" maxlength="3">%</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><spring:message code="list.detail.1stmanager" text="1차 매니저"/></td>
                                            <td>
                                                <input type="text" serviceType="${items.serviceType}"  data-toggle="modal" manager="1" platformType="0"  data-target="#head_search_modal" class="form-control selHead width-150"  placeholder="<spring:message code="list.detail.selectaffiliateheadquarters" text="제휴본사 선택"/>" value="<c:forEach var="items2"  items="${tbHead}"  varStatus="status"><c:if test="${items2.headNo == items.headNo1}">${items2.headName}[${items2.headNo}]</c:if></c:forEach>" readonly>
                                                <input type="text"  serviceType="${items.serviceType}" data-toggle="<c:if test="${items.headNo1 != null}">modal</c:if>" manager="1" platformType="0" data-target="#branch_search_modal" class="form-control selBranch width-150" placeholder="<spring:message code="list.detail.distributorselection" text="총판 선택"/>" value="<c:forEach var="items2"  items="${tbBranch}"  varStatus="status"><c:if test="${items2.branchNo == items.branchNo1}">${items2.branchName}[${items2.branchNo}]</c:if></c:forEach>" readonly>
                                                <input type="hidden" class="head${items.platformType}_1_${items.serviceType} headNo1${items.serviceType}_${items.platformType}" name="headNo1" value="${items.headNo1}">
                                                <input type="hidden" class="branch${items.platformType}_1_${items.serviceType} branchNo1${items.serviceType}_${items.platformType}" name="branchNo1" value="${items.branchNo1}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><spring:message code="list.detail.2ndmanager" text="2차 매니저"/></td>
                                            <td>
                                                <input type="text"  serviceType="${items.serviceType}" data-toggle="modal" manager="2" platformType="0"  data-target="#head_search_modal" class="form-control selHead width-150" placeholder="<spring:message code="list.detail.selectaffiliateheadquarters" text="제휴본사 선택"/>" value="<c:forEach var="items2"  items="${tbHead}"  varStatus="status"><c:if test="${items2.headNo == items.headNo2}">${items2.headName}[${items2.headNo}]</c:if></c:forEach>" readonly>
                                                <input type="text"  serviceType="${items.serviceType}" data-toggle="<c:if test="${items.headNo2 != null}">modal</c:if>" manager="2" platformType="0"  data-target="#branch_search_modal" class="form-control selBranch width-150" placeholder="<spring:message code="list.detail.distributorselection" text="총판 선택"/>" value="<c:forEach var="items2"  items="${tbBranch}"  varStatus="status"><c:if test="${items2.branchNo == items.branchNo2}">${items2.branchName}[${items2.branchNo}]</c:if></c:forEach>" readonly>
                                                <input type="hidden" class="head${items.platformType}_2_${items.serviceType} headNo2${items.serviceType}_${items.platformType}" name="headNo2" value="${items.headNo2}">
                                                <input type="hidden" class="branch${items.platformType}_2_${items.serviceType} branchNo2${items.serviceType}_${items.platformType}" name="branchNo2" value="${items.branchNo2}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><spring:message code="list.detail.3rdmanager" text="3차 매니저"/></td>
                                            <td >
                                                <input type="text" serviceType="${items.serviceType}" data-toggle="modal" manager="3" platformType="0"  data-target="#head_search_modal" class="form-control selHead width-150"  placeholder="<spring:message code="list.detail.selectaffiliateheadquarters" text="제휴본사 선택"/>" value="<c:forEach var="items2"  items="${tbHead}"  varStatus="status"><c:if test="${items2.headNo == items.headNo3}">${items2.headName}[${items2.headNo}]</c:if></c:forEach>" readonly>
                                                <input type="text" serviceType="${items.serviceType}" data-toggle="<c:if test="${items.headNo3 != null}">modal</c:if>" manager="3" platformType="0"  data-target="#branch_search_modal" class="form-control selBranch width-150" placeholder="<spring:message code="list.detail.distributorselection" text="총판 선택"/>" value="<c:forEach var="items2"  items="${tbBranch}"  varStatus="status"><c:if test="${items2.branchNo == items.branchNo3}">${items2.branchName}[${items2.branchNo}]</c:if></c:forEach>" readonly>
                                                <input type="hidden" class="head${items.platformType}_3_${items.serviceType} headNo3${items.serviceType}_${items.platformType}" name="headNo3" value="${items.headNo3}">
                                                <input type="hidden" class="branch${items.platformType}_3_${items.serviceType} branchNo3${items.serviceType}_${items.platformType}" name="branchNo3" value="${items.branchNo3}">
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
               <%-- <div class="tab-pane fade" id="default-tab-3">
                    <div class="" data-scrollbar="true">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="border-right-0">맛집</td>
                                    <td class="p-0 border-0">
                                        <table class="width-full border-bottom-0">
                                            <tr>
                                                <td>정산 비율</td>
                                                <td>
                                                    <label class="m-r-10">플랫폼사&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">1차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">2차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">3차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">4차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                </td>
                                            </tr>
                                            <c:forEach begin="1" end="4" varStatus="idx">
                                                <tr class="border-bottom-0">
                                                    <td class="border-bottom-0">${idx.index}차 매니저</td>
                                                    <td class="border-bottom-0">
                                                        <input type="text" data-toggle="modal" data-target="#search_modal" class="form-control" placeholder="제휴본사 선택" readonly>
                                                        <input type="text" class="form-control" placeholder="총판 선택" readonly>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="border-right-0">기타</td>
                                    <td class="p-0 border-0">
                                        <table class="width-full">
                                            <tr>
                                                <td>정산 비율</td>
                                                <td>
                                                    <label class="m-r-10">플랫폼사&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">1차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">2차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">3차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                    <label class="m-r-10">4차&nbsp;&nbsp;<input type="text" class="form-control">%</label>
                                                </td>
                                            </tr>
                                            <c:forEach begin="1" end="4" varStatus="idx">
                                                <tr>
                                                    <td>${idx.index}차 매니저</td>
                                                    <td>
                                                        <input type="text" data-toggle="modal" data-target="#search_modal" class="form-control" placeholder="제휴본사 선택" readonly>
                                                        <input type="text" class="form-control" placeholder="총판 선택" readonly>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>--%>
                <!-- end tab-pane -->
                <p class="text-right m-b-0">
                    <a href="javascript:;" class="btn btn-white list_btn"><spring:message code="list.detail.list" text="목록"/><%--목록--%></a>
                    <a href="javascript:;" class="btn btn-primary update_btn"><spring:message code="list.detail.update" text="수정"/><%--수정--%></a>
                </p>
            </div>
            <!-- end tab-content -->
            <!-- begin nav-pills -->
            <!-- end nav-pills -->
            <!-- begin tab-content -->
            <!-- end tab-content -->
        </div>
        <!-- end row -->
    </div>
    <!-- end #content -->

    <form class="service_update_form" id="service_update_form">
        <input type="hidden" name="chargeNo" class="submitChargeNo" value="">
        <input type="hidden" name="platformType" class="submitPlatformType" value="">
        <input type="hidden" name="serviceType" class="submitServiceType" value="">
        <input type="hidden" name="svcRate0" class="submitSvcRate0" value="">
        <input type="hidden" name="svcRate1" class="submitSvcRate1" value="">
        <input type="hidden" name="svcRate2" class="submitSvcRate2" value="">
        <input type="hidden" name="svcRate3" class="submitSvcRate3" value="">
        <input type="hidden" name="headNo1" class="submitHeadNo1" value="">
        <input type="hidden" name="headNo2" class="submitHeadNo2" value="">
        <input type="hidden" name="headNo3" class="submitHeadNo3" value="">
        <input type="hidden" name="branchNo1" class="submitBranchNo1" value="">
        <input type="hidden" name="branchNo2" class="submitBranchNo2" value="">
        <input type="hidden" name="branchNo3" class="submitBranchNo3" value="">
    </form>
    <!-- begin scroll to top btn -->
  <%--  <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>--%>
    <!-- end scroll to top btn -->

</div>

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<%--
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>--%>

<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="./branchSearch.jsp" %>
</div>

<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<%--<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>--%>
<script src="${path}/assets/plugins/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${path}/assets/plugins/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${path}/assets/plugins/blueimp-gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-audio.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-video.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-validate.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-ui.js"></script>
<script src="${path}/assets/plugins/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />

<script>

    let thisEle = null;
    $(() => {

        $("input[name=svcRate0],input[name=svcRate1],input[name=svcRate2],input[name=svcRate3]").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });
        $(".list_btn").click(function () {
            location.href = "${path}/settlement/servicechargegrp/list";
        });

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
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



        $(document).on("click",".selBranch",function(){
            let serviceType = $(this).attr("serviceType");
            let manager = $(this).attr("manager");
            let platformType = $(this).attr("platformType");
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let headNo = $(".head"+platformType+"_"+manager+"_"+serviceType).val();
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
                serarchBranch(headNo)
            }

        });

        $(".selHead,.selBranch").on("click",function(e){
            thisEle = $(event.target);
        });
        $(document).on("click","#selHeadNoBtn",function(){
            thisEle.val($(this).closest("li").find(".head_text").text())
            let serviceType = thisEle.attr("serviceType");
            let manager = thisEle.attr("manager");
            let platformType = thisEle.attr("platformType");

            $(".head"+platformType+"_"+manager+"_"+serviceType).val($(this).attr("headNo"));
            $(".branch"+manager+"_"+serviceType).val("");
            $(".head"+platformType+"_"+manager+"_"+serviceType).parent("td").find(".selBranch").val("");
            $(".head"+platformType+"_"+manager+"_"+serviceType).parent("td").find(".selBranch").attr("data-toggle","modal");
            /*$(".headNo").val($(this).attr("headNo"));*/
            /*$(".headName").val($(this).closest("li").find(".head_text").text());*/
            $(".searchBranchList").html("");
            thisEle = null;
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            thisEle.val($(this).closest("li").find(".branch_text").text());

            let serviceType = thisEle.attr("serviceType");
            let manager = thisEle.attr("manager");
            let platformType = thisEle.attr("platformType");

            $(".branch"+platformType+"_"+manager+"_"+serviceType).val($(this).attr("branchNo"));

                /* $(".branchNo").val($(this).attr("branchNo"));
                 $(".branchName").val($(this).closest("li").find(".branch_text").text());*/
                 $(".storeName").attr("data-toggle","modal");
                 $(".storeName").val("");

            thisEle = null;
            $(".branchModalCloseBtn").click();
        });

        $(".update_charge_name").on("click",function(){
            let chargeName = $(".chargeName").val();
            let chargeNo = Number("${tbServiceChargeGroup.chargeNo}");

            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            swal({
                title: updatemsg,
                icon: "warning",
                buttons: [
                    cancel,
                    update
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: "${path}/api/settlement/servicechargegrp/groupName/update",
                        data:{
                            chargeName : chargeName,
                            chargeNo : chargeNo
                        },
                        dataType: "json",
                        success: function(data) {
                            if (data.result == 200) {
                                alert(updatesussmsg);
                                location.reload();
                            } else {
                                alert(editfailed);
                                return;
                            }
                        }
                    });
                }
            })
        })

        $(".update_btn").on("click",function(){
            let tbServiceChargeGroupDataList = new Array();
            let url = "${path}/api/settlement/servicechargegrp/update";
            /*       let joinDate = replaceAll($(".mngChargeStart").val(),"-","");
                   $(".mngChargeStart").val(joinDate);*/
            /*        let joinDate2 = replaceAll($(".plfStartDate").val(),"-","");
                    $(".plfStartDate").val(joinDate2);*/
            let chargeNo = Number("${tbServiceChargeGroup.chargeNo}");

            for(var i = 0 ; i < 4 ; i++) {
                for(var j = 0 ; j < 2 ; j++) {
                    $(".submitChargeNo").val(Number(chargeNo));
                    $(".submitPlatformType").val(Number($(".platformType"+i+"_"+j).val()));
                    $(".submitServiceType").val(Number($(".serviceType"+i+"_"+j).val()));
                    $(".submitSvcRate0").val(Number($(".svcRate0"+i+"_"+j).val()));
                    $(".submitSvcRate1").val(Number($(".svcRate1"+i+"_"+j).val()));
                    $(".submitSvcRate2").val(Number($(".svcRate2"+i+"_"+j).val()));
                    $(".submitSvcRate3").val(Number($(".svcRate3"+i+"_"+j).val()));
                    $(".submitHeadNo1").val(Number($(".headNo1"+i+"_"+j).val()));
                    $(".submitHeadNo2").val(Number($(".headNo2"+i+"_"+j).val()));
                    $(".submitHeadNo3").val(Number($(".headNo3"+i+"_"+j).val()));
                    $(".submitBranchNo1").val(Number($(".branchNo1"+i+"_"+j).val()));
                    $(".submitBranchNo2").val(Number($(".branchNo2"+i+"_"+j).val()));
                    $(".submitBranchNo3").val(Number($(".branchNo3"+i+"_"+j).val()));
                    let _forms = $('#service_update_form');
                    let req = convertFormToObj(_forms);
                    tbServiceChargeGroupDataList.push(req);
                }
            }

            let _forms1 = $('#service_update_form');

            let req1 = convertFormToObj(_forms1);

            var jsonData = JSON.stringify(tbServiceChargeGroupDataList);

            /*let req2 = convertFormToObj(_forms2);*/

            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            if (inputDataCheck(req1)) {
                swal({
                    title: updatemsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        update
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {

                        $.ajax({
                            type: "POST",
                            url: url,
                            data:  {
                                "tbServiceChargeDataList" : jsonData
                            },
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    /*location.href = "${path}/workgroup/deliveryman/list"*/
                                    alert(updatesussmsg);
                                    location.reload();
                                } else {
                                    alert(editfailed);
                                    return;
                                }
                            }
                        });
                    }
                });
            }

        });
    });

    function serarchBranch(headNo) {
        let noregistereddistributors = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
        let apply = "<spring:message code="list.script.apply" text="적용"/>";
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
    }
    function serarchBranch2() {
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
    }

    function inputDataCheck(args) {
        console.log(args);
        /*if (isNull(args.dlvyName)) {
            return alert_focus("dlvyName", "배달대행이름을 선택해주세요");
        }*/
        return true;
    }
</script>
</body>
</html>
