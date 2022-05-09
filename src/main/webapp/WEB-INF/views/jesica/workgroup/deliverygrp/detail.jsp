<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.deliverygroupdetail" text="배송그룹 상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/deliverygrp/list"><spring:message code="sidemenu.workgroupmanagement.deiliverygroup" text="배송그룹"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.deliverygroupdetail" text="배송그룹 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.deliverygroupdetail" text="배송그룹 상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroupmanagement" text="업무그룹"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[B${tbDelivery.branch.branchNo}]</span> ${tbDelivery.branch.branchName} |
                            <span class="text-green">[S${tbDelivery.store.storeNo}]</span> ${tbDelivery.store.storeName}
                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.deliveryagentname" text="베달대행명"/></strong></td>
                        <td>
                            <span class="text-green">[${tbDelivery.dlvyNo}]</span> ${tbDelivery.dlvyName}
                        </td>
                    </tr>
                </table>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.operationsetting" text="운영설정"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.operationsetting" text="운영설정"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.settlementsetting" text="정산설정"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.settlementsetting" text="정산설정"/></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form class="update_form" id="update_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbDelivery.insertUserId}">
                            <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="dlvyNo" name="dlvyNo"  value="${tbDelivery.dlvyNo}">
                            <input type="hidden" class="branchNo" name="branchNo"  value="${tbDelivery.branch.branchNo}">
                            <input type="hidden" class="storeNo" name="storeNo" value="${tbDelivery.store.storeNo}">
                            <input type="hidden" class="storeNo" name="storeNo" value="${tbDelivery.store.headNo}">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light height-50" style="width:15%"><spring:message code="list.detail.operatingstatus" text="운영상태"/></td>
                                    <td style="width:60%">
                                        <label class="">
                                            <input type="radio" name="openStatus" class="align-bottom serviceYn" value="0" <c:if test="${tbDelivery.openStatus == 0 }"> checked</c:if>> <spring:message code="list.detail.operatingstatus" text="일시정지"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openStatus" value="1" <c:if test="${tbDelivery.openStatus == 1 }"> checked</c:if>>  <spring:message code="list.detail.inoperation" text="운영중"/>
                                        </label>
                                    <td class="text-danger-darker"><spring:message code="list.description.selecttheoperatingstatus" text="운영상태를 선택하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.status" text="상태"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dataStatus" value="0" class="align-bottom dataStatus" <c:if test="${tbDelivery.dataStatus == 'DELETE'}">checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="1" class="align-bottom dataStatus" <c:if test="${tbDelivery.dataStatus == 'OK'}">checked</c:if>><spring:message code="list.detail.normal" text="정상"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectthedatastate" text="데이터 상태를 선택하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.deliveryagentname" text="배달대행명"/></td>
                                    <td><input type="text" class="form-control width-200" name="dlvyName" value="${tbDelivery.dlvyName}" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.nameofthedeliveryagentmessage" text="배달대행 이름을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.availabilityofoperatinghours" text="운영시간 사용여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="openTimeYn" value="1" class="align-bottom openTimeYn" <c:if test="${tbDelivery.openTimeYn == 1 }"> checked</c:if>> <spring:message code="list.detail.inoperation" text="운영중"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openTimeYn" value="2" class="align-bottom openTimeYn" <c:if test="${tbDelivery.openTimeYn == 2 }"> checked</c:if>> <spring:message code="list.detail.pause" text="일시중지"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeliverygroup" text="배달대행 그룹을 선택하세요."/></td>
                                </tr>
                                <tr class="opentimeTr">
                                    <td class="bg-light"><spring:message code="list.detail.operationstartendtime" text="운영시작/마감시간"/></td>
                                    <td>
                                        <input type="text" name="openTimeStart" class="form-control width-100 openTimeStart"  value="${tbDelivery.openTimeStart}"> ~
                                        <input type="text" name="openTimeEnd" class="form-control width-100 openTimeEnd"  value="${tbDelivery.openTimeEnd}">
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.entertheoperationstartendtime" text="운영시작/마감시간을 입력하세요."/></td>
                                </tr>
                                <input type="hidden" name="dataStatus" value="1">
                                <%--
                                                                    <tr>
                                                                        <td class="bg-light height-50">직영가맹점 여부</td>
                                                                        <td>
                                                                            <label class="">
                                                                                <input type="radio" name="masterYn" value="0" class="align-bottom masterYn" checked> 일반가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                                                            </label>
                                                                            <label class="m-l-10 ">
                                                                                <input type="radio" name="masterYn" value="1" class="align-bottom masterYn"> 직영가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                                                            </label>
                                                                        </td>
                                                                        <td class="text-danger-darker">직영 가맹점인지 선택하세요.</td>
                                                                    </tr>
                                --%>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.operationstartendtime" text="배달대행 그룹 구분"/> </td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyGroupType" value="1" class="align-bottom dlvyGroupType" <c:if test="${tbDelivery.dlvyGroupType == 1 }"> checked</c:if>> <spring:message code="list.detail.orderonly" text="발주전용"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyGroupType" value="2" class="align-bottom dlvyGroupType" <c:if test="${tbDelivery.dlvyGroupType == 2 }"> checked</c:if>> <spring:message code="list.detail.obtainorderonly" text="수주전용"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyGroupType" value="3" class="align-bottom dlvyGroupType" <c:if test="${tbDelivery.dlvyGroupType == 3 }"> checked</c:if>> <spring:message code="list.detail.orderplusobtainorderonly" text="발주+수주"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeliverygroup" text="배달대행 그룹을 선택하세요."/> </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.operationstartendtime" text="배송지연시간"/></td>
                                    <td>
                                        <select class="form-control delayTime width-80 m-l-5" name="delayTime">
                                            <c:forEach begin="5" end="60" var="idx" step="5">operationstartendtime
                                                <option value="${idx}" <c:if test="${tbDelivery.delayTime == idx}">selected</c:if>>${idx}<spring:message code="list.detail.minute" text="분"/> </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeliverydelaytime" text="배송지연시간을 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.rateinformation" text="요금정보"/></td>
                                    <td class="p-0 border-0">
                                        <table class="width-full border-0">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.streetfaresystem" text="거리구간 요금제"/></td>
                                                <td class="border-top-0 border-right-0">
                                                    <select class="form-control width-200" name="priceChargeNo">
                                                        <c:choose>
                                                            <c:when test="${tbDlvyPriceChargeList.size() > 0}">
                                                                <c:forEach items="${tbDlvyPriceChargeList}" var="item" varStatus="status">
                                                                    <option value="${item.priceChargeNo}" <c:if test="${tbDelivery.priceChargeNo == item.priceChargeNo}">selected</c:if> >${item.priceChargeName}</option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value=""><spring:message code="list.description.thereisnoregisteredplan" text="등록된 요금제가 없습니다"/></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0"><spring:message code="list.description.thereisnoregisteredplan" text="눈비할증여부"/></td></td>
                                                <td class="border-right-0 height-50">
                                                    <label class="">
                                                        <input type="radio" name="weatherChargeYn" value="0" class="align-bottom weatherChargeYn" <c:if test="${tbDelivery.weatherChargeYn == 0}"> checked</c:if>> <spring:message code="list.detail.unused" text="미사용"/>
                                                    </label>
                                                    <label class="m-l-10 ">
                                                        <input type="radio" name="weatherChargeYn" value="1" class="align-bottom weatherChargeYn" <c:if test="${tbDelivery.weatherChargeYn == 1}"> checked</c:if>> <spring:message code="list.detail.used" text="사용"/>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0"><spring:message code="list.detail.snowandrainsurcharge" text="눈비할증금액"/></td>
                                                <td class="border-right-0"><input type="text" class="form-control width-200 weatherCharge" name="weatherCharge" value="${tbDelivery.weatherCharge}" numberOnly><spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseregisteryourrateinformation" text="요금정보를 등록해주세요."/></td>
                                </tr>
                            </table>
                        </form>
                        <div class="m-l-5 m-t-5">
                            <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                            <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive">
                        <form class="update_form2">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%"><spring:message code="list.detail.managementfeeperdelivery" text="배달건당 관리비"/></td>
                                    <td style="width:60%">
                                        <input type="text" class="form-control width-200 mngPrice" name="mngPrice" value="${tbDelivery.mngPrice}" numberOnly> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.registerthemanagementfee" text="배달건당 관리비를 등록해주세요."/></td>
                                </tr> <tr>
                                <td class="bg-light"> <spring:message code="list.detail.deliverymanagementfeesettlement" text="배달관리비 정산 구분"/></td>
                                <td>
                                    <select class="form-control m-r-10 mngRateType" name="mngRateType">
                                        <option value="0" <c:if test="${tbDelivery.mngRateType == 0}"> selected </c:if>><spring:message code="list.detail.flatrate" text="정액"/></option>
                                        <option value="1" <c:if test="${tbDelivery.mngRateType == 1}"> selected </c:if>><spring:message code="list.detail.fixedrate" text="정률"/></option>
                                    </select>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.selectthedeliverymanagersettlement" text="배달관리지 정산 구분을 선택해주세요 (건당 관리비 기준)"/></td>
                            </tr>
                                <tr>
                                    <td class="bg-light"> <spring:message code="list.detail.deliverymanagementfeeplatformcompany" text="플랫폼사 배달관리비"/> </td>
                                    <td>
                                        <input type="text" class="form-control width-200 platForm1 mngRatePlatform" name="mngRatePlatform" value="${tbDelivery.mngRatePlatform}" style="display:  <c:if test="${tbDelivery.mngRateType != 0}">none</c:if>" <c:if test="${tbDelivery.mngRateType != 0}">disabled</c:if> numberOnly>
                                        <select class="form-control platForm2 mngRatePlatform m-r-10 " name="mngRatePlatform" style="display:  <c:if test="${tbDelivery.mngRateType != 1}">none</c:if>" <c:if test="${tbDelivery.mngRateType != 1}">disabled</c:if>>
                                            <c:forEach begin="0" end="100" var="idx"  >
                                            <option value="${idx}" <c:if test="${tbDelivery.mngRatePlatform == idx}"> selected</c:if> > ${idx}%</option>
                                            </c:forEach>
                                        </select>
                                        (<spring:message code="list.detail.price" text="금액"/> : <spring:message code="list.detail.won" text="원"/> /<spring:message code="list.detail.rate" text="비율"/> : %)
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.registertheplatformfeemessage" text="플랫폼사 배달관리비를 등록해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.deliverymanagementfeeorderinggroup" text="배달관리비 발주그룹"/>  </td>
                                    <td>
                                        <%--<input type="text" name="mngRateGive" class="form-control width-200 mngRateGive" value="${tbDelivery.mngRateGive}" numberOnly> 원--%>
                                        <input type="text" class="form-control width-200 platForm1 mngRateGive" name="mngRateGive" value="${tbDelivery.mngRateGive}" style="display:  <c:if test="${tbDelivery.mngRateType != 0}">none</c:if>" <c:if test="${tbDelivery.mngRateType != 0}">disabled</c:if> numberOnly>
                                        <select class="form-control platForm2 mngRateGive m-r-10 " name="mngRateGive" style="display:  <c:if test="${tbDelivery.mngRateType != 1}">none</c:if>" <c:if test="${tbDelivery.mngRateType != 1}">disabled</c:if>>
                                            <c:forEach begin="0" end="100" var="idx"  >
                                                <option value="${idx}" <c:if test="${tbDelivery.mngRateGive == idx}"> selected</c:if> > ${idx}%</option>
                                            </c:forEach>
                                        </select>
                                            (<spring:message code="list.detail.price" text="금액"/> : <spring:message code="list.detail.won" text="원"/> /<spring:message code="list.detail.rate" text="비율"/> : %)
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.registerthedeliverymanagementfeemessage" text="발주그룹 배달관리비를 등록해주세요"/> </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"> <spring:message code="list.detail.deliverymanagementfeeordergroup" text="수주그룹 배달관리비"/></td>
                                    <td>
                                        <%--<input type="text" name="mngRateAccept" class="form-control width-200 mngRateAccept" value="${tbDelivery.mngRateAccept}" numberOnly> 원--%>
                                        <input type="text" class="form-control width-200 platForm1 mngRateAccept" name="mngRateAccept" value="${tbDelivery.mngRateAccept}" style="display:  <c:if test="${tbDelivery.mngRateType != 0}">none</c:if>" <c:if test="${tbDelivery.mngRateType != 0}">disabled</c:if> numberOnly>
                                        <select class="form-control platForm2 mngRateAccept m-r-10 " name="mngRateAccept" style="display:  <c:if test="${tbDelivery.mngRateType != 1}">none</c:if>" <c:if test="${tbDelivery.mngRateType != 1}">disabled</c:if>>
                                            <c:forEach begin="0" end="100" var="idx"  >
                                                <option value="${idx}" <c:if test="${tbDelivery.mngRateAccept == idx}"> selected</c:if> > ${idx}%</option>
                                            </c:forEach>
                                        </select>
                                            (<spring:message code="list.detail.price" text="금액"/> : <spring:message code="list.detail.won" text="원"/> /<spring:message code="list.detail.rate" text="비율"/> : %)
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.registertheeliverymanagementfeeordergroup" text="수주그룹 배달관리비를 등록해주세요"/></td>
                                </tr>
                            </table>
                        </form>
                        <div class="m-l-5 m-t-5">
                            <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.insert.list" text="목록"/></button>
                            <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.insert.update" text="수정"/></button>
                        </div>
                    </div>
                </div>
            </div>
            <%--            <div class="tab-content">--%>
            <!-- begin tab-pane -->
            <%--                <div class="tab-pane fade active show" id="default-tab-1">--%>
          <%--  <div class="row width-full p-5">
                <!-- begin col-8 -->
                <!-- begin panel -->
                <div class="panel panel-inverse width-full">
                    <!-- begin table-responsive -->
                    <div class="table-responsive m-l-5">
                        <div class="timeline-header m-t-10 m-b-10">
                            <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                            <span><strong>기본 정보</strong></span>
                        </div>
                        <form class="update_form" id="update_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbDelivery.insertUserId}">
                            <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="dlvyNo" name="dlvyNo"  value="${tbDelivery.dlvyNo}">
                            <input type="hidden" class="branchNo" name="branchNo"  value="${tbDelivery.branch.branchNo}">
                            <input type="hidden" class="storeNo" name="storeNo" value="${tbDelivery.store.storeNo}">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light height-50" style="width:15%">운영 상태</td>
                                    <td style="width:60%">
                                        <label class="">
                                            <input type="radio" name="openStatus" class="align-bottom serviceYn" value="0" <c:if test="${tbDelivery.openStatus == 0 }"> checked</c:if>> 일시정지&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openStatus" value="1" <c:if test="${tbDelivery.openStatus == 1 }"> checked</c:if>> 운영중
                                        </label>
                                    <td class="text-danger-darker">운영상태를 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50">상태</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dataStatus" value="0" class="align-bottom dataStatus" <c:if test="${tbDelivery.dataStatus == 'DELETE'}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="삭제"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="1" class="align-bottom dataStatus" <c:if test="${tbDelivery.dataStatus == 'OK'}">checked</c:if>><spring:message code="merchandise.search1.option4" text="정상"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">데이터 상태를 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배달대행이름</td>
                                    <td><input type="text" class="form-control width-200" name="dlvyName" value="${tbDelivery.dlvyName}"></td>
                                    <td class="text-danger-darker">배달대행 이름을 입력하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50">운영시간 사용여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="openTimeYn" value="1" class="align-bottom openTimeYn" <c:if test="${tbDelivery.openTimeYn == 1 }"> checked</c:if>> 운영중&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openTimeYn" value="2" class="align-bottom openTimeYn" <c:if test="${tbDelivery.openTimeYn == 2 }"> checked</c:if>> 일시중지&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">배달대행 그룹을 선택하세요.</td>
                                </tr>
                                <tr class="opentimeTr">
                                    <td class="bg-light">운영시작/마감시간</td>
                                    <td>
                                        <input type="text" name="openTimeStart" class="form-control width-100 openTimeStart"  value="${tbDelivery.openTimeStart}"> ~
                                        <input type="text" name="openTimeEnd" class="form-control width-100 openTimeEnd"  value="${tbDelivery.openTimeEnd}">
                                    </td>
                                    <td class="text-danger-darker">운영시작/마감시간을 입력하세요.</td>
                                </tr>
                                <input type="hidden" name="dataStatus" value="1">
                                &lt;%&ndash;
                                                                    <tr>
                                                                        <td class="bg-light height-50">직영가맹점 여부</td>
                                                                        <td>
                                                                            <label class="">
                                                                                <input type="radio" name="masterYn" value="0" class="align-bottom masterYn" checked> 일반가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                                                            </label>
                                                                            <label class="m-l-10 ">
                                                                                <input type="radio" name="masterYn" value="1" class="align-bottom masterYn"> 직영가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                                                            </label>
                                                                        </td>
                                                                        <td class="text-danger-darker">직영 가맹점인지 선택하세요.</td>
                                                                    </tr>
                                &ndash;%&gt;
                                <tr>
                                    <td class="bg-light height-50">배달대행 그룹 그분</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyGroupType" value="1" class="align-bottom dlvyGroupType" <c:if test="${tbDelivery.dlvyGroupType == 1}"> checked</c:if>> 발주전용&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyGroupType" value="2" class="align-bottom dlvyGroupType" <c:if test="${tbDelivery.dlvyGroupType == 2}"> checked</c:if>> 수주전용&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyGroupType" value="3" class="align-bottom dlvyGroupType" <c:if test="${tbDelivery.dlvyGroupType == 3}"> checked</c:if>> 발주+수주&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">배달대행 그룹을 선택하세요.</td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <!-- end table-responsive -->
                    <div class="m-l-5 m-t-5">
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                        <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> 수정&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                    </div>
                </div>
                <!-- end panel -->
                <!-- end col-8 -->
            </div>--%>

        </div>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
</div>
<%--modal search end--%>

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
<script src="${path}/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src=""></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" />

<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    let map;
    let marker;
    $(() => {
        $(".weatherCharge, .mngRatePlatform, .mngPrice, .mngRateGive, .mngRateAccept").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });

        $(".mngRateType").on("change",function(){
            if($(this).val() == 0) {
                $(".platForm1").show();
                $(".platForm1").attr("disabled",false);
                $(".platForm2").hide();
                $(".platForm2").attr("disabled",true);
            } else {
                $(".platForm1").hide();
                $(".platForm1").attr("disabled",true);
                $(".platForm2").show();
                $(".platForm2").attr("disabled",false);
            }
        });
        $(".openTimeStart").timepicker({
            minuteStep: 1,
            maxHours:24,
            showMeridian:false,
        });
        $(".openTimeEnd").timepicker({
            minuteStep: 1,
            maxHours:24,
            showMeridian:false,
        });

        $(".openTimeYn").on("click",function(){
            if($(this).val() == 1) {
                $(".opentimeTr").css("display","");
            } else {
                $(".opentimeTr").css("display","none");
            }
        });

        $('.pin-div i').on('click',function(){
            $('input').toggleClass('active');
            if($('input').hasClass('active')){
                $(this).attr('class',"fa fa-eye-slash fa-lg")
                    .prev('input').attr('type',"text");
            }else{
                $(this).attr('class',"fa fa-eye fa-lg")
                    .prev('input').attr('type','password');
            }
        });

        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "BT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".cybankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".cybankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });
        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "CBT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".bankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".bankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });

        /*initMap();*/

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
        $.ajax({
            type: "POST",
            url: "${path}/api/search/dlvy/list",
            data: JSON.stringify(dlvyReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                console.log(data);
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/
                for(var i = 0 ; i < data.searchDlvyList.length ; i++){
                    $(".searchDlvyList").append(
                        "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                    )
                }
            }
        });

        //제휴본사 검색
      /*  $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    for(var i = 0 ; i < data.searchHeadList.length ; i++){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"head_text\">\n" +
                            ""+data.searchHeadList[i].headName+""+
                            "<small style=\"color: green;\">["+data.searchHeadList[i].headNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click",function(){
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
                    for(var i = 0 ; i < data.searchBranchList.length ; i++){
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"branch_text\">\n" +
                            ""+data.searchBranchList[i].branchName+""+
                            "<small style=\"color: green;\">["+data.searchBranchList[i].branchNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName="+data.searchBranchList[i].branchName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo="+data.searchBranchList[i].branchNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });

        //가맹점 선택
        $(".searchStoreBtn").on("click",function(){
            let branchNo = $(".branchNo").val();
            $(".selBranchNo").val(branchNo);
            let req = convertFormToObj($('form.store_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/store/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchStoreList").html("");
                    for(var i = 0 ; i < data.searchStoreList.length ; i++){
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            ""+data.searchStoreList[i].storeName+""+
                            "<small style=\"color: green;\">["+data.searchStoreList[i].storeNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName="+data.searchStoreList[i].storeName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo="+data.searchStoreList[i].storeNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            if(headNo == null || headNo =='') {
                swal({
                    title: "제휴본사를 선택해주세요.",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '확인'
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

            if(headNo == null || headNo =='') {
                swal({
                    title: "제휴본사를 선택해주세요.",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '확인'
                    ],
                    dangerMode: true,
                });
            }  else {
                if(branchNo == null || branchNo =='') {
                    swal({
                        title: "총판을 선택해주세요.",
                        icon: "warning",
                        buttons: [
                            '취소',
                            '확인'
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
        });*/

        $(".btn_list").click(function() {
            location.href = "/workgroup/deliverygrp/list";
        });

        $(document).on("click",".btn_add",function() {

            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";

            let url = "${path}/api/deliverygrp/update/action";
            $(".openTimeStart").val( $(".openTimeStart").val().replaceAll(":",""));
            $(".openTimeEnd").val( $(".openTimeEnd").val().replaceAll(":",""));
            if($(".openTimeStart").val().trim().length < 4){
                $(".openTimeStart").val("0"+$(".openTimeStart").val())
            }
            if($(".openTimeEnd").val().trim().length < 4){
                $(".openTimeEnd").val("0"+$(".openTimeEnd").val())
            }
            let weatherCharge = $(".weatherCharge").val();
            if(weatherCharge == "" || weatherCharge == null) {
                $(".weatherCharge").val(0);
            }

            let mngRatePlatform = $(".mngRatePlatform").val();
            if(weatherCharge == "" || weatherCharge == null) {
                $(".mngRatePlatform").val(0);
            }

            let mngPrice = $(".mngPrice").val();
            if(weatherCharge == "" || weatherCharge == null) {
                $(".mngPrice").val(0);
            }

            let mngRateGive = $(".mngRateGive").val();
            if(weatherCharge == "" || weatherCharge == null) {
                $(".mngRateGive").val(0);
            }

            let mngRateAccept = $(".mngRateAccept").val();
            if(weatherCharge == "" || weatherCharge == null) {
                $(".mngRateAccept").val(0);
            }


            let _forms = $('.update_form, .update_form2');
            let req = convertFormToObj(_forms);



            if (inputDataCheck(req)) {
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



                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbDelivery",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            /*dataType: "json",*/
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(updatesussmsg);
                                    location.href = "${path}/workgroup/deliverygrp/list";
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




    function inputDataCheck(args) {
        let deliveryagentname = "<spring:message code="list.script.selectadeliveryagentname" text="배달대행이름을 선택해주세요"/>";
        if (isNull(args.dlvyName)) {
            return alert_focus("dlvyName", deliveryagentname);
        }
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

</script>
</body>
</html>

