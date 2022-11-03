<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 상세"/></title>

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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="쿠폰 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="쿠폰 관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation1" text="기본정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation1" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation1" text="발급 현황"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation1" text="발급 현황"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation1" text="사용 현황"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation1" text="사용 현황"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" name="couponNo" value="${tbCoupon.couponNo}">
                            <input type="hidden" name="dataStatus" value="${tbCoupon.dataStatus}">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="서비스"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="serviceType" class="serviceType" value="2" style="margin-right: 5px" <c:if test="${tbCoupon.serviceType == 2}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="탁송"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="serviceType" class="serviceType" value="3" style="margin-right: 5px" <c:if test="${tbCoupon.serviceType == 3}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="맛집"/></span>
                                        </label>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="serviceType" class="serviceType" value="4" style="margin-right: 5px" <c:if test="${tbCoupon.serviceType == 4}">checked</c:if>>
                                            <span><spring:message code="list.detail.deliveryman12" text="마트"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 서비스타입을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="서비스 주문 구분"/></td>
                                    <%--<td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="orderTypeCode" value="10" style="margin-right: 5px" checked>
                                            <span><spring:message code="list.detail.tothewhole" text="렌터카 예약"/></span>
                                        </label>
                                    </td>--%>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="orderTypeCode" value="00" id="00" style="margin-right: 5px" checked>
                                            <span><spring:message code="list.detail.tothewhole1" text="전체"/></span>
                                        </label>
                                        <span id="2" style="display: none">
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="20" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.tothewhole1" text="인수대행"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="21" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="반납대행"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="22" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.deliveryman12" text="마이카탁송"/></span>
                                            </label>
                                            <label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="23" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.deliveryman12" text="올레길탁송"/></span>
                                            </label>
                                        </span>
                                        <span id="3" style="display: none">
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="30" id="30" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.tothewhole1" text="맛집배달"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="31" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="맛집포장"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="32" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.deliveryman12" text="맛집예약"/></span>
                                            </label>
                                            <label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="33" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.deliveryman12" text="테이블주문"/></span>
                                            </label>
                                        </span>
                                        <span id="4" style="display: none">
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="40" id="40" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.tothewhole1" text="마트배달"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="orderTypeCode" value="41" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="마트포장"/></span>
                                            </label>
                                        </span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="서비스 주문 구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="유효기간 방식"/></td>
                                    <td>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="validityType" class="validityType" value="1" style="margin-right: 5px" <c:if test="${tbCoupon.validityType == 1}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="만료일자"/></span>
                                        </label>
                                        <label style="display: inline-flex; align-items: center">
                                            <input type="radio" name="validityType" class="validityType" value="2" style="margin-right: 5px" <c:if test="${tbCoupon.validityType == 2}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="발급일 기준"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="유효기간 방식을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="expireDate-form" <c:if test="${tbCoupon.validityType == 2}">style="display: none"</c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="만료일자"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control expireDate background-white"  name="expireDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 만료일자를 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="validDay-form" <c:if test="${tbCoupon.validityType == 1}">style="display: none"</c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="유효일수"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control validDay background-white"  name="validDay" value="${tbCoupon.validDay}">
                                            <span>일 후 만료</span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 유효일수를 작성하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="발급가능 기간"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control publishStartDate background-white" name="publishStartDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                        </label>
                                        <label>
                                            <input type="text" class="form-control publishEndDate background-white" name="publishEndDate" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 발급가능기간을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="할인방식"/></td>
                                    <td>
                                        <div style="display: flex; align-items: center">
                                            <span class="m-r-20">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="dcRateType" class="dcRateType" value="1" style="margin-right: 5px" <c:if test="${tbCoupon.dcRateType == 1}">checked</c:if>>
                                                    <span><spring:message code="list.detail.tothewhole1" text="할인금액"/></span>
                                                </label>
                                                <label style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="dcRateType" class="dcRateType" value="2" style="margin-right: 5px" <c:if test="${tbCoupon.dcRateType == 2}">checked</c:if>>
                                                    <span><spring:message code="list.detail.affiliate1" text="할인율"/></span>
                                                </label>
                                            </span>
                                            <span>
                                                <input type="text" class="form-control dcAmt" name="dcAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${tbCoupon.dcAmt}">
                                                <span id="amt-form" <c:if test="${tbCoupon.dcRateType == 2}">style="display: none"</c:if>>원</span>
                                                <span id="rate-form" <c:if test="${tbCoupon.dcRateType == 1}">style="display: none"</c:if>>%</span>
                                            </span>
                                        </div>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 할인방식을 선택 후 값 또는 비율을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="최대할인금액"/></td>
                                    <td>
                                        <input type="text" name="maxDcAmt" class="form-control maxDcAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${tbCoupon.maxDcAmt}">
                                        <span>원</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="할인 가능한 최대금액을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="최소결제금액"/></td>
                                    <td>
                                        <input type="text" name="minPayAmt" class="form-control minPayAmt"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${tbCoupon.minPayAmt}">
                                        <span>원</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용에 필요한 최소결제금액을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="최대발급개수"/></td>
                                    <td>
                                        <input type="text" name="maxPublishCount" class="form-control maxPublishCount"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${tbCoupon.maxPublishCount}">
                                        <span>개</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 최대발급 가능 개수를 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="동일고객 중복발급가능개수"/></td>
                                    <td>
                                        <input type="text" name="multiPublishCount" class="form-control multiPublishCount"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${tbCoupon.multiPublishCount}">
                                        <span>개</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="한 고객당 발급 가능한 최대 개수를 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰코드"/></td>
                                    <td><input type="text" name="couponCode" class="form-control width-full couponCode" maxlength="150" value="${tbCoupon.couponCode}"></td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰코드를 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰명"/></td>
                                    <td><input type="text" name="title" class="form-control width-full title" maxlength="150" value="${tbCoupon.title}"></td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰명을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contents1" text="내용"/></td>
                                    <td>
                                        <textarea name="body" class="form-control width-full body" rows="10">${tbCoupon.body}</textarea>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 설명을 입력하세요."/>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div style="display: flex; align-content: center">
                        <span>
                            <button type="button" class="btn btn-primary btn_list m-t-5" style="display: flex; align-items: center">
                                <i class="fa fa-list"></i>
                                <span class="m-l-5"><spring:message code="list.detail.list1" text="목록"/></span>
                            </button>
                        </span>
                        <span style="display: flex; align-items: center; margin-left: auto">
                            <button type="button" class="btn btn-primary btn_up m-r-5" style="display: flex; align-items: center">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5"><spring:message code="list.detail.enrollment1" text="수정"/></span>
                            </button>
                            <button type="button" class="btn btn-danger btn_remove m-t-5 m-b-5" style="display: flex; align-items: center">
                                <i class="fa fa-trash-alt"></i>
                                <span class="m-l-5"><spring:message code="list.detail.delete1" text="삭제"/></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                    <form class="update_form" id="update_form2" method="post">
                        <div class="table-responsive" style="overflow: hidden;">
<%--                            <a href="#modal-message" class="btn btn-sm btn-primary m-b-10" data-toggle="modal"><spring:message code="list.detail.userregistration" text="사용자 등록"/></a>--%>
                            <table class="table table-condensed table-bordered">
                                <tr id="basicOptionYnView" class="border-0" >
                                    <td colspan="2" class="p-0" style="border: 0;">
                                        <div class="tab-pane fade active show" >

                                            <form id="update_form2" style="width: 100%;" class="p-0">
                                                <div class="panel panel-inverse">
                                                    <div class="border">
                                                        <input type="hidden"  class="viewOrder" value="">
                                                        <table class="table table-bordered border-bottom text-center border-0">
                                                            <thead>
                                                            <tr>
                                                                <th class="bg-light" style="width:5%"><spring:message code="list.detail.number1" text="번호"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="아이디"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.username1" text="사용자 이름"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.userphone1" text="사용자 전화번호"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="발급일자"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="만료일자"/></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="tbUserStaffBody">
                                                                <c:forEach var="item" items="${unUsedUsers}" varStatus="status">
                                                                    <tr class="detailRow">
                                                                        <td class="text-center">${status.index + 1}</td>
                                                                        <td class="text-center">
                                                                            <div style="overflow: hidden;
                                              margin: auto;
                                              text-overflow: ellipsis;
                                              white-space: nowrap;
                                              width: 250px;
                                              display: block;">${item.loginId}
                                                                            </div>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <div style="overflow: hidden;
                                              margin: auto;
                                              text-overflow: ellipsis;
                                              white-space: nowrap;
                                              width: 250px;
                                              display: block;"> ${item.custName}
                                                                            </div>
                                                                        </td>
                                                                        <td class="text-center" style="">
                                                                            ${item.custTel}
                                                                        </td>
                                                                        <td class="text-center">
                                                                            ${item.insertDate}
                                                                        </td>
                                                                        <td class="text-center">
                                                                            ${item.expireDate}
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="default-tab-3">
                    <form class="update_form" id="update_form3" method="post">
                        <div class="table-responsive" style="overflow: hidden;">
                            <%--                            <a href="#modal-message" class="btn btn-sm btn-primary m-b-10" data-toggle="modal"><spring:message code="list.detail.userregistration" text="사용자 등록"/></a>--%>
                            <table class="table table-condensed table-bordered">
                                <tr class="border-0" >
                                    <td colspan="2" class="p-0" style="border: 0;">
                                        <div class="tab-pane fade active show" >
                                            <form id="update_form3" style="width: 100%;" class="p-0">
                                                <div class="panel panel-inverse">
                                                    <div class="border">
                                                        <input type="hidden"  class="viewOrder" value="">
                                                        <table class="table table-bordered border-bottom text-center border-0">
                                                            <thead>
                                                            <tr>
                                                                <th class="bg-light" style="width:5%"><spring:message code="list.detail.number1" text="번호"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="아이디"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.username1" text="사용자 이름"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.userphone1" text="사용자 전화번호"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="발급일자"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="만료일자"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id1" text="사용일자"/></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="item" items="${usedUsers}"  varStatus="status">
                                                                    <tr class="detailRow">
                                                                        <td class="text-center">${status.index + 1}</td>
                                                                        <td class="text-center">
                                                                            <div style="overflow: hidden;
                                                  margin: auto;
                                                  text-overflow: ellipsis;
                                                  white-space: nowrap;
                                                  width: 250px;
                                                  display: block;">${item.loginId}</div>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <div style="overflow: hidden;
                                                  margin: auto;
                                                  text-overflow: ellipsis;
                                                  white-space: nowrap;
                                                  width: 250px;
                                                  display: block;"> ${item.custName}</div>
                                                                        </td>
                                                                        <td class="text-center" style="">
                                                                            ${item.custTel}
                                                                        </td>
                                                                        <td class="text-center">
                                                                            ${item.insertDate}
                                                                        </td>
                                                                        <td class="text-center">
                                                                            ${item.expireDate}
                                                                        </td>
                                                                        <td class="text-center">
                                                                            ${item.useDate}
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
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

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    const date = new Date(); //각 날짜 초기 세팅 date객체
    const dateClasses = ['.expireDate', '.publishStartDate', '.publishEndDate'];
    const couponNo = document.getElementsByName('couponNo')[0].value;
    const orderTypeCode = ${tbCoupon.orderTypeCode};
    const originServiceType = ${tbCoupon.serviceType};

    $(() => {
        /**
         * author june
         */

        //각 일자 초기 세팅
        dateClasses.forEach((dateClass) => {
            let date;
            $(dateClass).datepicker({
                calendarWeeks: false,
                todayHighlight: true,
                autoclose: true,
                format: "yyyy-mm-dd",
                language: "kr"
            });
            if (dateClass.includes('expireDate')) {
                date = '${tbCoupon.expireDate}';
            } else if (dateClass.includes('publishStartDate')) {
                date = '${tbCoupon.publishStartDate}';
            } else {
                date = '${tbCoupon.publishEndDate}';
            }
            date = date.substring(0, 11);
            $(dateClass).datepicker('setDate', date);
        });

        //서비스 타입 초기 세팅
        let strServiceType = originServiceType + '';
        document.getElementById(strServiceType).style.display = 'inline';
        $('input:radio[name="orderTypeCode"]:radio[value=${tbCoupon.orderTypeCode}]').prop('checked', true);

        //서비스 타입에 따른 form 노출 선택
        $(".serviceType").change((e) => {
            let value = e.target.value;
            let serviceType = ['2', '3', '4'];

            serviceType.forEach((type) => {
                let el = document.getElementById(type);
                if (type === value) {
                    el.style.display = 'inline';
                    if (value == originServiceType) {
                        $('input:radio[name="orderTypeCode"]:radio[value=${tbCoupon.orderTypeCode}]').prop('checked', true);
                    } else {
                        $('input:radio[name="orderTypeCode"]:radio[value="00"]').prop('checked', true);
                    }
                } else {
                    el.style.display = 'none';
                }
            });
        });

        //유효기간 타입에 따른 form(만료일자, 유효일수) 노출 선택
        $(".validityType").click((e) => {
            let value = parseInt(e.target.value);
            let expireForm = document.getElementById('expireDate-form');
            let validForm = document.getElementById('validDay-form');

            switch (value) {
                case 1:
                    expireForm.style.display = 'table-row'
                    validForm.style.display = 'none';
                    break;
                case 2:
                    expireForm.style.display = 'none'
                    validForm.style.display = 'table-row';
                    break;
            }
        });

        //할인방식에 따른 form(원, %) 노출 선택
        $(".dcRateType").click((e) => {
            let value = parseInt(e.target.value);
            let amtForm = document.getElementById('amt-form');
            let rateForm = document.getElementById('rate-form');

            switch (value) {
                case 1:
                    amtForm.style.display = 'inline'
                    rateForm.style.display = 'none';
                    break;
                case 2:
                    amtForm.style.display = 'none'
                    rateForm.style.display = 'inline';
                    break;
            }
        });

        $(".btn_list").click(() => {
            location.href = "${path}/board/management/list?dataStatus=&startDate=2020-01-01&endDate=${now}&title=";
        });

        $(".btn_up").click(() => {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="수정에 실패하였습니다."/>";

            let url = "${path}/api/coupon/management/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);

            if (inputDataCheck(req)) {
                req.publishStartDate += 'T00:00:00';
                req.publishEndDate += 'T23:59:59';
                if (req.validityType == 2) {
                    //유효기간 방식이 발급일 기준이면 만료일자 null로 입력
                    req.expireDate = null;
                } else {
                    //만료일자 기준이면
                    req.expireDate += 'T23:59:59';
                }
                swal({
                    title: wouldyouliketoupdate,
                    icon: "warning",
                    buttons: [
                        cancel,
                        update
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "PUT",
                            url: url,
                            data: JSON.stringify(req),
                            contentType: "application/json",
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(updatesussmsg);
                                    location.href="${path}/board/management/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&title="
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

        $(".btn_remove").click(() => {
            let url = '${path}/api/coupon/management/delete';
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete1" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg1" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed1" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted1" text="삭제되었습니다."/>";

            swal({
                title: doyouwanttodelete,
                icon: 'warning',
                buttons: [
                    cancel,
                    deletemsg,
                ],
                dangerMode: true,
            }).then((isConfirm) => {
                if (isConfirm) {
                    $.ajax({
                        type: 'DELETE',
                        url: url,
                        data: {
                            couponNo
                        },
                        dataType: 'json',
                        success: (data) => {
                            if (data.result == 200) {
                                alert(deleted);
                                location.href = "${path}/board/management/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&title=";
                            } else {
                                alert(deletionfailed);
                                return;
                            }
                        }
                    })
                }
            })
        });
    });

    function inputDataCheck(args) {
        let emptyValidDayMsg = "<spring:message code="list.script.pleaseenterantitle1" text="유효일수를 입력해주세요"/>";
        let emptyDcAmtMsg = "<spring:message code="list.script.pleaseenterantitle1" text="할인금액 또는 할인율을 입력해주세요"/>";
        let emptyMaxDcAmtMsg = "<spring:message code="list.script.pleaseenteransubject1" text="최대할인금액을 입력해주세요"/>";
        let emptyMinPayAmtMsg = "<spring:message code="list.script.pleaseenteransubject1" text="최소결제금액을 입력해주세요"/>";
        let emptyMaxPublishCountMsg = "<spring:message code="list.script.pleaseenteransubject1" text="최대발급개수 입력해주세요"/>";
        let emptyMultiPublishCountMsg = "<spring:message code="list.script.pleaseenteransubject1" text="동일고객 중복발급가능개수 입력해주세요"/>";
        let emptyCouponCodeMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰코드를 입력해주세요"/>";
        let emptyTitleMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰명을 입력해주세요"/>";
        let emptyBodyMsg = "<spring:message code="list.script.pleaseenteransubject1" text="내용을 입력해주세요"/>";
        if (isNull(args.validDay) && args.validityType == 2) {
            return alert_focus("validDay", emptyValidDayMsg);
        } else if (isNull(args.dcAmt)) {
            return alert_focus("dcAmt", emptyDcAmtMsg);
        } else if (isNull(args.maxDcAmt)) {
            return alert_focus("maxDcAmt", emptyMaxDcAmtMsg);
        } else if (isNull(args.minPayAmt)) {
            return alert_focus("minPayAmt", emptyMinPayAmtMsg);
        } else if (isNull(args.maxPublishCount)) {
            return alert_focus("maxPublishCount", emptyMaxPublishCountMsg);
        } else if (isNull(args.multiPublishCount)) {
            return alert_focus("multiPublishCount", emptyMultiPublishCountMsg);
        } else if (isNull(args.couponCode)) {
            return alert_focus("couponCode", emptyCouponCodeMsg);
        } else if (isNull(args.title)) {
            return alert_focus("title", emptyTitleMsg);
        } else if (isNull(args.body)) {
            return alert_focus("body", emptyBodyMsg);
        }

        return true;
    }
</script>
</body>
</html>
