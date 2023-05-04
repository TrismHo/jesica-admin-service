<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.detailsofpasorders" text="세차주문내역"/></title>
</head>
<style>
    .modal.modal-message .modal-body, .modal.modal-message .modal-footer, .modal.modal-message .modal-header {
        width: 100%;
        border: none;
        margin: 0 auto;
    }

    .modal .modal-header {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-flex: 0;
        -ms-flex: 0;
        flex: 0;
        -ms-flex-align: center;
        align-items: center;
    }

    @media (max-width: 1350px){
        .modal-content {
            width: 60%;
        }
    }

    @media (max-width: 1920px){
        .modal-content {
            width: 60%;
        }
    }
    .table-responsive {
        display: block;
        width: 100%;
        overflow-x: hidden;
        -webkit-overflow-scrolling: touch;
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

    <div id="content" class="content p-0">

        <div class="col-xl-12" style="height: 1030px;">

            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><spring:message code="sidemenu.orderhistory1" text="차량관리"/></li>
                    <li class="breadcrumb-item"><a href="${path}/restaurant/order/detail"><spring:message code="sidemenu.pastorderhistory1" text="과거 주문내역"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.detailsofpasorders1" text="세차주문내역 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.detailsofpasorders1" text="세차주문내역 상세"/> </h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light" style="width:15%">
                            <strong><spring:message code="list.detail.orderno1" text="주문번호"/> </strong>
                        </td>
                        <td >${callDetail.ordNo} </td>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.franchisee1" text="상품명 "/></strong></td>
                        <td style="width:35%">
                            ${callDetail.goodsName}
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.franchisee1" text="가맹점 "/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[${callDetail.ordStCode}]</span> ${callDetail.stName}
                        </td>
                        <td class="bg-light" style="width:15%">
                            <strong><spring:message code="list.detail.orderno1" text="가맹점 연락처"/> </strong>
                        </td>
                        <td > ${callDetail.stTel} </td>
                    </tr>
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.franchisee11" text="주문구분 "/></strong></td>
                        <td style="width:35%">
                            <c:choose>
                                <c:when test="${callDetail.ordType == 1}">
                                    <spring:message code="list.word.1" text="배달"/>
                                </c:when>
                                <c:when test="${callDetail.ordType == 2}">
                                    <spring:message code="list.word.1" text="포장"/>
                                </c:when>
                                <c:when test="${callDetail.ordType == 3}">
                                    <spring:message code="list.word.1" text="대기"/>
                                </c:when>
                                <c:when test="${callDetail.ordType == 4}">
                                    <spring:message code="list.word.1" text="예약"/>
                                </c:when>
                                <c:when test="${callDetail.ordType == 5}">
                                    <spring:message code="list.word.1" text="테이블"/>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="bg-light" style="width:15%">
                            <strong><spring:message code="list.detail.orderno1" text="주문확인"/> </strong>
                        </td>
                        <td >
                            <c:choose>
                                <c:when test="${callDetail.ordConfirmType == 0}">
                                    <spring:message code="list.word.1" text="미확인"/>
                                </c:when>
                                <c:when test="${callDetail.ordConfirmType == 1}">
                                    <spring:message code="list.word.1" text="확인"/>
                                </c:when>
                                <c:when test="${callDetail.ordConfirmType == 9}">
                                    <spring:message code="list.word.1" text="무관"/>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.franchisee11" text="주문상태 "/></strong></td>
                        <td >
                            <c:choose>
                                <c:when test="${callDetail.ordStatus == 1}">
                                    <span class="text-green"> <spring:message code="list.word.receipt11" text="배달접수"/></span>
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 2}">
                                    <span class="text-green"> <spring:message code="list.word.waiting11" text="배차"/></span>
                                    ( 배차일시 : <javatime:format value="${callDetail.cthDate}" pattern="yyyy-MM-dd HH:mm:ss"/> )
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 3}">
                                    <span class="text-green">  <spring:message code="list.word.reservation1" text="출발"/></span>
                                    ( 출발일시 : <javatime:format value="${callDetail.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 4}">
                                    <span class="text-green"> <spring:message code="list.word.gettingready1" text="완료"/></span>
                                    ( 완료일시 : <javatime:format value="${callDetail.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 5}">
                                    <span class="text-red"><spring:message code="list.word.packingcomplete1" text="취소"/></span>
                                    ( 취소일시 : <javatime:format value="${callDetail.ordDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    / 취소사유 : ${callDetail.cancelMemo} )
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 6}">
                                    <span class="text-green"><spring:message code="list.word.deliveryrequest1" text="대기"/></span>
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 7}">
                                    <span class="text-green"><spring:message code="list.word.semidispatch1" text="대기예약"/></span>
                                    <%--( 예약일시 : <javatime:format value="${callDetail.resvDate}" pattern="yyyy-MM-dd HH:mm:ss"/>)--%>
                                </c:when>
                                <c:when test="${callDetail.ordStatus == 8}">
                                    <spring:message code="list.word.dispatch1" text="입장요청"/>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.franchisee1" text="주문일시 (최종 수정일시)"/></strong></td>
                        <td style="width:35%">
                            <span class="">  <javatime:format value="${callDetail.ordDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                ( <javatime:format value="${callDetail.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/> )
                        </td>
                    </tr>
                    <tr>
                        <td class=" height-40 p-0 bg-light">
                            <table  style="width: 100%" class="border-0">
                                <tr class="border-0 width-100">
                                    <td class="bg-light border-0 border-top-0" rowspan="6"><strong><spring:message code="list.detail.franchisee1" text="주문자 정보 "/></strong></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="주문자명"/></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="연락처"/></td>
                                </tr>
                                <tr class="border-0" >
                                    <td colspan="2" class="border-right-0 border-bottom-0 height-40"><spring:message code="list.detail.completiondate1" text="매장요청사항"/></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-right-0 border-bottom-0 border-top-0 border-right-0 height-40"></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-right-0 border-top-0 border-bottom-0 height-40"></td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:35%" class="p-0">
                            <table  style="width: 100%" class="border-0">
                                <tr class="border-0">
                                    <td class="border-top-0 border-right-0 border-left-0 height-40">
                                        ${callDetail.ordCuName}
                                    </td>
                                </tr>
                                <tr class="border-0 border-left-0">
                                    <td colspan="1" class="border-right-0 border-left-0 height-40">${callDetail.ordCuTel}</td>
                                </tr>
                                <tr class="border-0 border-left-0">
                                    <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">${callDetail.ordCuStMemo}</td>
                                </tr>
                                <tr class="border-0 border-left-0 border-bottom-0">
                                    <td colspan="1" class="border-right-0 border-top-0 border-left-0 border-bottom-0 height-40"></td>
                                </tr>
                                <tr class="border-0 border-left-0 ">
                                    <td colspan="1" class="border-right-0 border-top-0 border-left-0 border-bottom-0 height-40"></td>
                                </tr>
                            </table>
                        </td>
                        <td class=" height-40 p-0 bg-light">
                            <table  style="width: 100%" class="border-0">
                                <tr class="border-0">
                                    <td class="bg-light border-0 border-top-0" rowspan="6"><strong><spring:message code="list.detail.franchisee1" text="결제금액 "/></strong></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="주문금액"/></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="지불금액"/></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="배달팁"/></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="쿠폰할인"/></td>
                                </tr>
                                <tr class="border-0">
                                    <td colspan="1" class="border-right-0 border-bottom-0 height-40"><spring:message code="list.detail.completiondate1" text="이벤트할인"/></td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:35%" class="p-0">
                            <table  style="width: 100%" class="border-0">
                                <tr class="border-0">
                                    <td class="border-top-0 border-right-0 border-left-0 height-40">
                                        <fmt:formatNumber value="${callDetail.ordAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                </tr>
                                <tr class="border-0 border-left-0">
                                    <td colspan="1" class="border-right-0 border-left-0 height-40">
                                        <fmt:formatNumber value="${callDetail.payAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                </tr>
                                <tr class="border-0 border-left-0">
                                    <td colspan="1" class="border-right-0 border-left-0 height-40">
                                        <fmt:formatNumber value="${callDetail.srvAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                </tr>
                                <tr class="border-0 border-left-0">
                                    <td colspan="1" class="border-right-0 border-left-0 height-40">
                                        <fmt:formatNumber value="${callDetail.couponAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                </tr>
                                <tr class="border-0 border-left-0">
                                    <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">
                                        <fmt:formatNumber value="${callDetail.eventAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </div>
            <%--  <ul class="nav nav-tabs m-t-10">
                  <li class="nav-item">
                      <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                          <span class="d-sm-none"><spring:message code="list.detail.orderdeliverytoday1" text="상품정보"/></span>
                          <span class="d-sm-block d-none"><spring:message code="list.detail.orderdeliverytoday1" text="상품정보"/></span>
                      </a>
                  </li>
              </ul>--%>
            <%--            <div class="tab-content">
                            <div class="tab-pane fade active show" id="default-tab-1">--%>
            <%--                    <div class="table-responsive">
                                    <!-- begin panel -->
                                    <div class="panel panel-inverse">
                                        <!-- begin table-responsive -->
                                        <div class="table-responsive">--%>
            <br>
            <div class="row">
                <c:choose>
                    <%--배달--%>
                    <c:when test="${callDetail.ordType == 1}">
                        <div class="col-xl-6">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">
                                <!-- begin table-responsive -->
                                <div class="table-responsive">
                                    <table id="user" class="table table-condensed table-bordered">
                                        <tbody>
                                        <td class=" height-40 p-0 bg-light" style="width:30%">
                                            <table  class="border-0 " style="width: 100%">
                                                <tr class="border-0">
                                                    <td class="bg-light border-0 border-top-0" style="width: 100px" rowspan="8"><strong><spring:message code="list.detail.franchisee1" text="배달정보"/></strong></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 border-top-0 height-40"><spring:message code="list.detail.completiondate1" text="배달주소"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="배달요청사상"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="배차 배송원 이름"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="배차 배송원 전화번호"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="배차일시"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 border-bottom-0 height-40"><spring:message code="list.detail.completiondate1" text="출발일시"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 border-bottom-0 height-40"><spring:message code="list.detail.completiondate1" text="배달거리"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td  class="p-0 ">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0 border-left-0 border-top-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 border-top-0 height-40">
                                                            ${callDetail.eaAddr4} ${callDetail.eaAddr5} ( ${callDetail.eaAddr6} )
                                                    </td>
                                                </tr>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 height-40">
                                                            ${callDetail.ordCuWkMemo}
                                                    </td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-top-0 border-right-0 border-left-0 height-40">
                                                            ${callDetail.cthWkName}
                                                    </td>
                                                </tr>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 height-40">
                                                            ${callDetail.cthWkTel}
                                                    </td>
                                                </tr>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 height-40">
                                                        <javatime:format value="${callDetail.cthDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                </tr>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">
                                                        <javatime:format value="${callDetail.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                </tr>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">
                                                            ${callDetail.dvryDistance}
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                            <!-- end panel -->
                        </div>
                    </c:when>
                    <%--포장--%>
                    <c:when test="${callDetail.ordType == 2}">
                        <div class="col-xl-6">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">
                                <!-- begin table-responsive -->
                                <div class="table-responsive">
                                    <table id="user" class="table table-condensed table-bordered">
                                        <tbody>
                                        <td class=" height-40 p-0 bg-light" style="width: 15%;">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="bg-light border-0 border-top-0" rowspan="5"><strong><spring:message code="list.detail.franchisee1" text="포장정보"/></strong></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="포장예정시간"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width:35%" class="p-0">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="border-top-0 border-right-0 border-left-0 border-bottom-0 height-40">
                                                   <%-- ${fn:substring(callDetail.takeoutDate,0,2) }-${fn:substring(callDetail.takeoutDate,2,4) }-${fn:substring(callDetail.takeoutDate,4,6) }
                                                    ${fn:substring(callDetail.takeoutDate,6,8) }:${fn:substring(callDetail.takeoutDate,8,10) }:${fn:substring(callDetail.takeoutDate,10,12) }--%>
                                                            ${callDetail.takeoutDate}
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                            <!-- end panel -->
                        </div>
                    </c:when>
                    <%--대기--%>
                    <c:when test="${callDetail.ordType == 3}">
                        <div class="col-xl-6">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">
                                <!-- begin table-responsive -->
                                <div class="table-responsive">
                                    <table id="user" class="table table-condensed table-bordered">
                                        <tbody>
                                        <td class=" height-40 p-0 bg-light" style="width: 15%;">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="bg-light border-0 border-top-0" rowspan="5"><strong><spring:message code="list.detail.franchisee1" text="대기정보"/></strong></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="대기번호"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="인원"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width:35%" class="p-0">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="border-top-0 border-right-0 border-left-0 height-40">
                                                            ${callDetail.ordStWaitNo} 번
                                                    </td>
                                                </tr>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">
                                                        성인 : ${callDetail.adultCnt} 명 / 유아 : ${callDetail.childCnt} 명
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                            <!-- end panel -->
                        </div>
                    </c:when>
                    <%--예약--%>
                    <c:when test="${callDetail.ordType == 4}">
                        <div class="col-xl-6">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">
                                <!-- begin table-responsive -->
                                <div class="table-responsive">
                                    <table id="user" class="table table-condensed table-bordered">
                                        <tbody>
                                        <td class=" height-40 p-0 bg-light" style="width: 15%;">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="bg-light border-0 border-top-0" rowspan="6"><strong><spring:message code="list.detail.franchisee1" text="예약정보"/></strong></td>
                                                </tr>
                                                    <%-- <tr class="border-0">
                                                         <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="테이블 타입"/></td>
                                                     </tr>--%>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="예약인원"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="예약시간"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width:35%" class="p-0">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="border-top-0 border-right-0 border-left-0 height-40">
                                                        성인 : ${callDetail.adultCnt} 명 / 유아 : ${callDetail.childCnt} 명
                                                    </td>
                                                </tr>
                                                    <%-- <tr class="border-0 border-left-0">
                                                         <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">
                                                             성인 : ${callDetail.adultCnt} 명 / 유아 : ${callDetail.childCnt} 명
                                                         </td>
                                                     </tr>--%>
                                                <tr class="border-0 border-left-0">
                                                    <td colspan="1" class="border-right-0 border-left-0 border-bottom-0 height-40">
                                                        <javatime:format value="${callDetail.resvDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                            <!-- end panel -->
                        </div>
                    </c:when>
                    <%--테이블--%>
                    <c:when test="${callDetail.ordType == 5}">
                        <div class="col-xl-6">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">
                                <!-- begin table-responsive -->
                                <div class="table-responsive">
                                    <table id="user" class="table table-condensed table-bordered">
                                        <tbody>
                                        <td class=" height-40 p-0 bg-light" style="width: 15%;">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="bg-light border-0 border-top-0" rowspan="5"><strong><spring:message code="list.detail.franchisee1" text="테이블정보"/></strong></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-top-0 border-right-0 height-40"><spring:message code="list.detail.completiondate1" text="테이블 번호"/></td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td colspan="1" class="border-top-0 border-right-0 border-bottom-0 height-40"><spring:message code="list.detail.completiondate1" text="테이블 타입"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width:35%" class="p-0">
                                            <table  style="width: 100%" class="border-0">
                                                <tr class="border-0">
                                                    <td class="border-top-0 border-right-0 border-left-0  height-40">

                                                        <c:if test="${callDetail.tableNo == 0}">
                                                            알수없음
                                                        </c:if>
                                                        <c:if test="${callDetail.tableNo != 0}">
                                                            ${callDetail.tableNo} 번
                                                        </c:if>

                                                    </td>
                                                </tr>
                                                <tr class="border-0">
                                                    <td class="border-top-0 border-right-0 border-left-0 border-bottom-0 height-40">

                                                        <c:if test="${callDetail.tableType == 0}">해당없음</c:if>
                                                        <c:if test="${callDetail.tableType == 1}">테이블</c:if>
                                                        <c:if test="${callDetail.tableType == 2}">KIOSK</c:if>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                            <!-- end panel -->
                        </div>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

                <div class="col-xl-6">
                    <!-- begin panel -->
                    <div class="panel panel-inverse">
                        <!-- begin table-responsive -->
                        <div class="table-responsive">
                            <c:forEach var="item" items="${goodsInfo}" varStatus="status">
                                <table id="user" class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr >
                                        <td class="bg-light" style="width: 14%;" rowspan="8">
                                            <strong>상품 ${status.count}</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" class="bg-light" style="width:15%"><spring:message code="list.detail.completiondate1" text="상품명"/></td>
                                        <td colspan="1">${item.goodsName} x ${item.ordCnt} 개    </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" class="bg-light"><spring:message code="list.detail.completiondate1" text="금액"/></td>
                                        <td colspan="1"><fmt:formatNumber value="${item.ordPrice}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="1" class="bg-light"><spring:message code="list.detail.deliverydateandtime1" text="옵션"/></td>
                                        <td rowspan="1">
                                            <c:if test="${item.option1Name != null}">
                                                ${item.option1Name} (<fmt:formatNumber value="${item.option1Price}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>) <br>
                                            </c:if>
                                            <c:if test="${item.option2Name != null}">
                                                ${item.option2Name} (<fmt:formatNumber value="${item.option2Price}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>)<br>
                                            </c:if>
                                            <c:if test="${item.option3Name != null}">
                                                ${item.option3Name} (<fmt:formatNumber value="${item.option3Price}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>)<br>
                                            </c:if>
                                            <c:if test="${item.option4Name != null}">
                                                ${item.option4Name} (<fmt:formatNumber value="${item.option4Price}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>)<br>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="1" class="bg-light"><spring:message code="list.detail.deliverydateandtime1" text="추가상품"/></td>
                                        <td rowspan="1">
                                            <c:forEach var="item2" items="${goodsInfoDetail}" varStatus="status">
                                                <c:if test="${item2.ordGoodsSeq == item.ordGoodsSeq}">
                                                    ${item2.optGoodsName} x ${item2.optGoodsCnt} 개 ( <fmt:formatNumber value="${item2.optGoodsPrice}" pattern="#,###" /> 원 )<br>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </c:forEach>
                        </div>
                        <!-- end table-responsive -->
                    </div>
                    <!-- end panel -->
                </div>

                <%--                                </div>
                                            </div>
                                            <!-- end table-responsive -->
                                        </div>--%>
                <!-- end panel -->
                <%--                    </div>
                                </div>--%>


            </div>
            <div class="m-l-5 m-t-5">
                <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
            </div>
        </div>
    </div>

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>


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
<%@include file="../../../common/include_number_only_js.jsp" %>

<script>
    $(() => {
        $(".btn_list").click(function() {
            //location.href = "${path}/washing/order/list";
            window.history.back();
        })
        let date = new Date();
        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $(".startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".endDate").datepicker('setDate', date);

        //상세이미지




    });




</script>
</body>
</html>
