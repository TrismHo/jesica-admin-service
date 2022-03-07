<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.platformnoticeregistration1" text="고객 상세"/></title>

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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="사용자 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="고객 관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration1" text="고객 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration" text="고객 상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
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
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation1" text="보유쿠폰"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation1" text="보유쿠폰"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" name="custNo" value="${tbCust.custNo}">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="회원여부"/></td>
                                        <td>
                                            <c:if test="${tbCust.isMember == 1}">회원</c:if>
                                            <c:if test="${tbCust.isMember == 0}">비회원</c:if>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="회원 여부입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="가입일자"/></td>
                                        <td><javatime:format value="${tbCust.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="가입일자입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification" text="이름"/></td>
                                        <td><input type="text" name="custName" class="form-control" value="${tbCust.custName}"></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="고객 이름을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification" text="휴대폰 번호"/></td>
                                        <td><input type="text" name="custTel" class="form-control" value="${tbCust.custTel}"></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="고객 휴대폰번호를 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification" text="로그인 ID"/></td>
                                        <td>${tbCust.loginId}</td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="로그인 ID 입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification" text="계정 상태"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="0" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 'DELETE'}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="삭제"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="1" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 'OK'}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="정상"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="2" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 'STOP'}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="정지"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="계정 상태를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification" text="캐쉬"/></td>
                                        <td><input type="text" class="form-control" value="${tbCust.cash}" readonly></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="고객 보유 캐쉬입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification" text="마일리지"/></td>
                                        <td><input type="text" class="form-control" value="${tbCust.mileage}" readonly></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="고객 보유 마일리지입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="성별"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="gender" class="gender" value="M" style="margin-right: 5px" <c:if test="${tbCust.gender == 'M'}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="남자"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="gender" class="gender" value="F" style="margin-right: 5px" <c:if test="${tbCust.gender == 'F'}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="여자"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="gender" class="gender" value="N" style="margin-right: 5px" <c:if test="${tbCust.gender == 'N'}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="알수없음"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="성별을 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="SMS 수신여부"/></td>
                                        <td>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="smsYn" class="smsYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.smsYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="smsYn" class="smsYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.smsYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="SMS 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="주문 PUSH 수신여부"/></td>
                                        <td class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushOrderYn" class="pushOrderYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.pushOrderYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushOrderYn" class="pushOrderYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.pushOrderYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="주문 PUSH 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="공지이벤트 PUSH 수신여부"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushNoticeYn" class="pushNoticeYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.pushNoticeYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushNoticeYn" class="pushNoticeYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.pushNoticeYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="공지이벤트 PUSH 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="마케팅 PUSH 수신여부"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushMarketingYn" class="pushMarketingYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.pushMarketingYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushMarketingYn" class="pushMarketingYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.pushMarketingYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="마케팅 PUSH 수신여부를 선택하세요."/>
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
                                <span class="m-l-5"><spring:message code="list.detail.list" text="목록"/></span>
                            </button>
                        </span>
                        <span style="display: flex; align-items: center; margin-left: auto">
                            <button type="button" class="btn btn-primary btn_up m-r-5" style="display: flex; align-items: center">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5"><spring:message code="list.detail.enrollment" text="수정"/></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="panel panel-inverse">
                        <h4 style="padding: 5px">사용쿠폰</h4>
                        <table class="table table-bordered border text-center">
                            <thead>
                                <tr>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.number" text="번호"/></th>
                                    <th class="bg-light" width="15%"><spring:message code="list.detail.id" text="쿠폰명"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.id" text="서비스타입"/></th>
                                    <th class="bg-light" width="10%"><spring:message code="list.detail.id" text="서비스주문구분"/></th>
                                    <th class="bg-light" width="20%"><spring:message code="list.detail.username" text="할인율/할인금액"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.username" text="사용여부"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.userphone" text="발급일자"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.id" text="만료일자"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.id" text="사용일자"/></th>
                                    <th class="bg-light" width="7%"><spring:message code="list.detail.id" text="상세보기"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${tbCustUsedCouponList}" varStatus="status">
                                    <tr class="detailRow">
                                        <td class="text-center">${status.index + 1}</td>
                                        <td class="text-center">
                                            <div style="overflow: hidden;
                      margin: auto;
                      text-overflow: ellipsis;
                      white-space: nowrap;
                      width: 250px;
                      display: block;">${item.title}
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.serviceType == 2}">탁송</c:if>
                                            <c:if test="${item.serviceType == 3}">맛집</c:if>
                                            <c:if test="${item.serviceType == 4}">마트</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.orderTypeCode == '00'}">전체</c:if>
                                            <c:if test="${item.orderTypeCode == '20'}">인수대행</c:if>
                                            <c:if test="${item.orderTypeCode == '21'}">반납대행</c:if>
                                            <c:if test="${item.orderTypeCode == '22'}">마이카탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '23'}">올레길탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '30'}">맛집배달</c:if>
                                            <c:if test="${item.orderTypeCode == '31'}">맛집포장</c:if>
                                            <c:if test="${item.orderTypeCode == '32'}">맛집예약</c:if>
                                            <c:if test="${item.orderTypeCode == '33'}">테이블주문</c:if>
                                            <c:if test="${item.orderTypeCode == '40'}">마트배달</c:if>
                                            <c:if test="${item.orderTypeCode == '41'}">마트포장</c:if>
                                        </td>
                                        <td class="text-center">
                                                ${item.dcAmt}
                                            <c:if test="${item.dcRateType == 1}">원</c:if>
                                            <c:if test="${item.dcRateType == 2}">%</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.useYn == 0}">미사용</c:if>
                                            <c:if test="${item.useYn == 1}">사용</c:if>
                                        </td>
                                        <td class="text-center">${item.insertDate}</td>
                                        <td class="text-center">${item.expireDate}</td>
                                        <td class="text-center">${item.useDate}</td>
                                        <td class="text-center" style="padding-right: 8px !important;">
                                            <button type="button" class="btn btn-primary btn_coupon_detail" couponNo="${item.couponNo}" style="display: flex; align-items: center; padding: 5px; margin: 0 auto">
                                                <i class="fa fa-ticket-alt"></i>
                                                <span class="m-l-5"><spring:message code="list.detail.list" text="쿠폰상세"/></span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-inverse">
                        <h4 style="padding: 5px">미사용쿠폰</h4>
                        <table class="table table-bordered border text-center">
                            <thead>
                                <tr>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.number" text="번호"/></th>
                                    <th class="bg-light" width="15%"><spring:message code="list.detail.id" text="쿠폰명"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.id" text="서비스타입"/></th>
                                    <th class="bg-light" width="10%"><spring:message code="list.detail.id" text="서비스주문구분"/></th>
                                    <th class="bg-light" width="20%"><spring:message code="list.detail.username" text="할인율/할인금액"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.username" text="사용여부"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.userphone" text="발급일자"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.id" text="만료일자"/></th>
                                    <th class="bg-light" width="7%"><spring:message code="list.detail.id" text="상세보기"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${tbCustUnUsedCouponList}" varStatus="status">
                                    <tr class="detailRow">
                                        <td class="text-center">${status.index + 1}</td>
                                        <td class="text-center">
                                            <div style="overflow: hidden;
              margin: auto;
              text-overflow: ellipsis;
              white-space: nowrap;
              width: 250px;
              display: block;">${item.title}
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.serviceType == 2}">탁송</c:if>
                                            <c:if test="${item.serviceType == 3}">맛집</c:if>
                                            <c:if test="${item.serviceType == 4}">마트</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.orderTypeCode == '00'}">전체</c:if>
                                            <c:if test="${item.orderTypeCode == '20'}">인수대행</c:if>
                                            <c:if test="${item.orderTypeCode == '21'}">반납대행</c:if>
                                            <c:if test="${item.orderTypeCode == '22'}">마이카탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '23'}">올레길탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '30'}">맛집배달</c:if>
                                            <c:if test="${item.orderTypeCode == '31'}">맛집포장</c:if>
                                            <c:if test="${item.orderTypeCode == '32'}">맛집예약</c:if>
                                            <c:if test="${item.orderTypeCode == '33'}">테이블주문</c:if>
                                            <c:if test="${item.orderTypeCode == '40'}">마트배달</c:if>
                                            <c:if test="${item.orderTypeCode == '41'}">마트포장</c:if>
                                        </td>
                                        <td class="text-center">
                                                ${item.dcAmt}
                                            <c:if test="${item.dcRateType == 1}">원</c:if>
                                            <c:if test="${item.dcRateType == 2}">%</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.useYn == 0}">미사용</c:if>
                                            <c:if test="${item.useYn == 1}">사용</c:if>
                                        </td>
                                        <td class="text-center">${item.insertDate}</td>
                                        <td class="text-center">${item.expireDate}</td>
                                        <td class="text-center" style="padding-right: 8px !important;">
                                            <button type="button" class="btn btn-primary btn_coupon_detail" couponNo="${item.couponNo}" style="display: flex; align-items: center; padding: 5px; margin: 0 auto">
                                                <i class="fa fa-ticket-alt"></i>
                                                <span class="m-l-5"><spring:message code="list.detail.list" text="쿠폰상세"/></span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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
    $(() => {
        $(".btn_list").click(() => {
            location.href = "${path}/user/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName=";
        });

        $(".btn_up").click(() => {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";

            let url = "${path}/api/user/cust/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);

            if (inputDataCheck(req)) {
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
                            url,
                            data: JSON.stringify(req),
                            contentType: "application/json",
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(updatesussmsg);
                                    location.href="${path}/user/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName="
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

        $(".btn_coupon_detail").click(function() {
            let couponNo = $(this).attr('couponNo');
            location.href = "${path}/coupon/management/detail?couponNo=" + couponNo;
        });
    });

    function inputDataCheck(args) {
        let emptyCustNameMsg = "<spring:message code="list.script.pleaseenterantitle" text="이름을 입력해주세요"/>";
        let emptyCustTelMsg = "<spring:message code="list.script.pleaseenterantitle" text="전화번호를 입력해주세요"/>";
        if (isNull(args.custName)) {
            return alert_focus("custName", emptyCustNameMsg);
        } else if (isNull(args.custTel)) {
            return alert_focus("custTel", emptyCustTelMsg);
        }

        return true;
    }
</script>
</body>
</html>
