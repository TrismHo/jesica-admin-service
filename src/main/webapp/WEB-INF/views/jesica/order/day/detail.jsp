<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar |  <spring:message code="list.detail.todaysorderdetails" text="금일 주문내역 상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.orderhistory" text="주문내역"/></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/affiliated/list"><spring:message code="sidemenu.orderhistory.todayorderhistory" text="금일 주문내역 상세"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.todaysorderdetails" text="금일 주문내역 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.todaysorderdetails" text="금일 주문내역 상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.franchisee" text="가맹점"/></strong></td>
                        <td style="width:35%"><span class="text-green">[S${orderDetail.storeNo}]</span> ${orderDetail.storeName} </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.orderno" text="주문번호"/> [<spring:message code="list.detail.modifiedserialnumber" text="수정일련번호"/>]</strong></td>
                        <td >${orderDetail.orderNo} <span class="text-green">[${orderDetail.updateScn}]</span></td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.deliveryagentserialnumber" text="배달대행 일련번호"/></strong></td>
                        <td >${orderDetail.dlvyNo}</td>
                    </tr>
                </table>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.orderdeliverytoday" text="주문배달 오늘"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.orderdeliverytoday" text="주문배달 오늘"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.orderdeliverysettlement" text="주문배달 정산"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.orderdeliverysettlement" text="주문배달 정산"/></span>
                    </a>
                </li>
            </ul>


            <div class="tab-content">

                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <div class="row">
                            <div class="col-xl-6">
                                <!-- begin panel -->
                                <div class="panel panel-inverse">
                                    <!-- begin table-responsive -->
                                    <div class="table-responsive">

                                        <table id="user" class="table table-condensed table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="bg-light" rowspan="3"><spring:message code="list.detail.franchisee" text="가맹점"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/></td>
                                                <td rowspan="1">${orderDetail.store.storeName}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.merchantphonenumber" text="가맹점 전화번호"/></td>
                                                <td rowspan="1">${orderDetail.store.storeTel}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light width-120" rowspan="5"><spring:message code="list.detail.orderinformation" text="주문정보"/></td>
                                                <td rowspan="1"><spring:message code="list.detail.arrivaladdress" text="도착주소"/>(<spring:message code="list.detail.arrivaladdress" text="주소명칭"/>)</td>
                                                <td rowspan="1">
                                                    <c:if test="${!empty orderDetail.destAddr3 }">
                                                        ${orderDetail.destAddr3}
                                                    </c:if>
                                                    ( <c:if test="${!empty orderDetail.destPoi}">
                                                    ${orderDetail.destPoi}
                                                </c:if> )
                                                </td>

                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.orderdate" text="주문일시"/></td>
                                                <td rowspan="1"><javatime:format value="${orderDetail.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.orderidentification" text="주문구분"/></td>
                                                <td rowspan="1">
                                                    <c:choose>
                                                        <c:when test="${orderDetail.orderTypeCode == 10}">
                                                            <spring:message code="list.detail.delivery" text="배달"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderTypeCode == 20}">
                                                            <spring:message code="list.detail.packing" text="포장"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderTypeCode == 21}">
                                                            <spring:message code="list.detail.visit" text="방문"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderTypeCode == 22}">
                                                            <spring:message code="list.detail.table" text="테이블"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.orderstatus" text="주문상태"/></td>
                                                <td rowspan="1">
                                                    <c:choose>
                                                        <c:when test="${orderDetail.orderTypeCode == 10}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.orderstatus" text="접수"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 21}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.orderstatus" text="대기"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 12}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.reservation" text="예약"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 20}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.gettingready" text="준비중"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 21}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.packingcomplete" text="포장완료"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 31}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.deliveryrequest" text="배송요청"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 31}">
                                                            <span class="text-info d-block"><spring:message code="list.detail.semidispatch" text="가배차"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 32}">
                                                            <span class="text-info d-block"><spring:message code="list.detail.dispatch" text="배차"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 33}">
                                                            <span class="text-info d-block"><spring:message code="list.detail.start" text="출발"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 40}">
                                                            <span class="text-info d-block"><spring:message code="list.detail.complete" text="완료"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 41}">
                                                            <span class="text-red d-block"><spring:message code="list.detail.cancel" text="취소"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderStatusCode == 42}">
                                                            <span class="text-red d-block"><spring:message code="list.detail.question" text="문의"/></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.orderpath" text="주문경로"/></td>
                                                <td rowspan="1">
                                                    <c:choose>
                                                        <c:when test="${orderDetail.orderPathCode == 10}">
                                                            <spring:message code="list.detail.customerapp" text="고객앱"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderPathCode == 11}">
                                                            <spring:message code="list.detail.smartstore" text="스마트스토어"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderPathCode == 12}">
                                                            <spring:message code="list.detail.merchantapp" text="가맹점앱"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderPathCode == 13}">
                                                            <spring:message code="list.detail.shippingapp" text="배송원앱"/>
                                                        </c:when>
                                                        <c:when test="${orderDetail.orderTypeCode == 20}">
                                                            <spring:message code="list.detail.brusim" text="부르심"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="4" class="bg-light"><spring:message code="list.detail.productinformation" text="상품정보"/></td>
                                                <td rowspan="1" ><spring:message code="list.detail.productname" text="상품명"/></td>
                                                <td rowspan="1">${orderDetail.goodsName}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan=""><spring:message code="list.detail.orderamount" text="주문금액"/></td>
                                                <td rowspan="1" ><fmt:formatNumber value="${orderDetail.orderAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.discountamount" text="할인금액"/></td>
                                                <td rowspan="1" ><fmt:formatNumber value="${orderDetail.discountAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.servicechargeamount" text="봉사료 금액"/></td>
                                                <td rowspan="1" ><fmt:formatNumber value="${orderDetail.serviceAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" class="bg-light"><spring:message code="list.detail.customerinformation" text="고객정보"/></td>
                                                <td rowspan="1"><spring:message code="list.detail.customerserialnumber" text="고객 일련번호"/></td>
                                                <td rowspan="1">${orderDetail.custNo}</td>

                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.customerphonenumber" text="고객 전화번호"/></td>
                                                <td rowspan="1" >${orderDetail.custTel}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="6" class="bg-light"><spring:message code="list.detail.deliveryagencyinformation" text="배달대행정보"/></td>
                                                <td rowspan="1" ><spring:message code="list.detail.deliveryagentamount" text="배달대행금액"/></td>
                                                <td rowspan="1"><fmt:formatNumber value="${orderDetail.dlvyAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.numberofdeliveryagencies" text="배달대행건수"/></td>
                                                <td rowspan="1" >${orderDetail.dlvyCnt} <spring:message code="list.detail.case" text="건"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.deliveryagentsurcharge" text="배달대행 할증요금"/></td>
                                                <td rowspan="1" ><fmt:formatNumber value="${orderDetail.dlvyExtraCharge}" pattern="#,###" /> <spring:message code="list.detail.won" text="원<"/></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.deliverycancellationtime" text="배달대행 취소시간"/></td>
                                                <td rowspan="1" >
                                                    <c:choose>
                                                        <c:when test="${!empty orderDetail.dlvyCancelTime}">
                                                            ${orderDetail.dlvyCancelTime}
                                                        </c:when>
                                                        <c:when test="${empty orderDetail.dlvyCancelTime}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.beforecancellation" text="취소전"/></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><spring:message code="list.detail.deliverydistance" text="배달거리"/></td>
                                                <td><fmt:formatNumber value="${(orderDetail.dlvyDistance/100)}" pattern="#,##0.00" /> Km</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end table-responsive -->
                                </div>
                                <!-- end panel -->
                            </div>
                            <div class="col-xl-6">
                                <!-- begin panel -->
                                <div class="panel panel-inverse">
                                    <!-- begin table-responsive -->
                                    <div class="table-responsive">

                                        <table id="user" class="table table-condensed table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="bg-light width-120" rowspan="5"><spring:message code="list.detail.deliveryinformation" text="배송정보"/></td>
                                                <td rowspan="1"><spring:message code="list.detail.deliverymanname" text="배송원명"/></td>
                                                <td rowspan="1">${orderDetail.workerName}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.shippersphonenumber" text="배송원 전화번호"/></td>
                                                <td rowspan="1">${orderDetail.workerTel}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.deliverydateandtime" text="배송배차일시"/></td>
                                                <td rowspan="1">
                                                    <javatime:format value="${orderDetail.dlvyAccDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1" ><spring:message code="list.detail.deliveryrequestdate" text="배송요청일시"/></td>
                                                <td rowspan="1" > <javatime:format value="${orderDetail.dlvyAccDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.deliveryarrivaldate" text="배송도착일시"/></td>
                                                <td rowspan="1"><javatime:format value="${orderDetail.dlvyArrDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="5" class="bg-light"><spring:message code="list.detail.departurearrivalInformation" text="출발/도착정보"/></td>
                                                <td rowspan="1" ><spring:message code="list.detail.departuredate" text="출발일시"/></td>
                                                <td rowspan="1"><javatime:format value="${orderDetail.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.departurelatitudelongitude" text="출발 위도 / 경도"/></td>
                                                <td rowspan="1">
                                                    ${orderDetail.departLat} / ${orderDetail.departLng}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.arrivallatitudelongitude" text="도착 위도 / 경도"/></td>
                                                <td rowspan="1">${orderDetail.destLat} / ${orderDetail.destLng}</td>
                                            </tr>
                                            <tr>

                                                <td rowspan="1"><spring:message code="list.detail.preparationdate" text="준비일시"/></td>
                                                <td rowspan="1">${orderDetail.readyDate}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1"><spring:message code="list.detail.completiondate" text="완료일시"/></td>
                                                <td rowspan="1"><javatime:format value="${orderDetail.finishDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            </tr>

                                            <tr>
                                                <td rowspan="2" class="bg-light"><spring:message code="list.detail.takeout" text="테이크아웃"/></td>
                                                <td rowspan="1" colspan="1"><spring:message code="list.detail.takeoutornot" text="테이크아웃 여부"/></td>
                                                <td rowspan="1"  >
                                                    <c:if test="${orderDetail.takeoutYn == true}">
                                                        <spring:message code="list.detail.takeout" text="테이크아웃"/>
                                                    </c:if>
                                                    <c:if test="${orderDetail.takeoutYn == false}">
                                                        <spring:message code="list.detail.takeoutornot" text="테이크아웃 여부"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1" ><spring:message code="list.detail.scheduledtakeoutdate" text="테이크아웃 예정일시"/></td>
                                                <td rowspan="1" >
                                                    <c:if test="${orderDetail.takeoutYn == true}">
                                                        <javatime:format value="${orderDetail.takeoutDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                    </c:if>
                                                    <c:if test="${orderDetail.takeoutYn == false}">
                                                        <spring:message code="list.detail.nottakeout" text="테이크아웃 아님"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" class="bg-light"> <spring:message code="list.detail.paymentmethod" text="요금결제방식"/></td>
                                                <td rowspan="1"><spring:message code="list.detail.paymentmethod" text="요금결제방식"/></td>
                                                <td rowspan="1" >
                                                    <c:choose>
                                                        <c:when test="${orderDetail.payMethod.ordinal() == 1}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.payment" text="현금"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.payMethod.ordinal() == 2}">
                                                            <span class="text-info d-block"><spring:message code="list.detail.card" text="카드"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.payMethod.ordinal() == 3}">
                                                            <span class="text-red d-block"><spring:message code="list.detail.prepayment" text="선결제"/></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="1" ><spring:message code="list.detail.deliveryfeepaymentmethod" text="배달대행요금결제방식"/></td>
                                                <td rowspan="1" >
                                                    <c:choose>
                                                        <c:when test="${orderDetail.dlvyPayMethod.ordinal() == 1}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.payment" text="현금"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.dlvyPayMethod.ordinal() == 2}">
                                                            <span class="text-info d-block"><spring:message code="list.detail.card" text="카드"/></span>
                                                        </c:when>
                                                        <c:when test="${orderDetail.dlvyPayMethod.ordinal() == 3}">
                                                            <span class="text-red d-block"><spring:message code="list.detail.prepayment" text="선결제"/></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <%--    <tr>
                                             <td rowspan="1">도착예정시간</td>
                                             <td rowspan="1"></td>
                                         </tr>--%>
                                            <tr>
                                                <td rowspan="1"  class="bg-light"><spring:message code="list.detail.preparationtime" text="준비시간"/></td>
                                                <td rowspan="1" colspan="2"> ${orderDetail.readyTime} <spring:message code="list.detail.minute" text="분"/></td>
                                            </tr>
                                            <%--   <tr>
                                                   <td rowspan="1" class="bg-light">회원여부</td>
                                                   <td rowspan="1" colspan="2"></td>
                                               </tr>--%>
                                            <tr>
                                                <td rowspan="1" class="bg-light"><spring:message code="list.detail.cancellationdate" text="취소일시"/></td>
                                                <td rowspan="1" colspan="2">
                                                    <c:choose>
                                                        <c:when test="${!empty orderDetail.cancelDate}">
                                                            <javatime:format value="${orderDetail.cancelDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                        </c:when>
                                                        <c:when test="${empty orderDetail.cancelDate}">
                                                            <span class="text-green d-block"><spring:message code="list.detail.beforecancellation" text="취소전"/></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.ordercancellationpenaltyamount" text="주문취소 패널티 금액"/></td>
                                                <td colspan="2"><fmt:formatNumber value="${orderDetail.dlvyPenaltyAmt}" pattern="#,##0" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end table-responsive -->
                                </div>
                                <!-- end panel -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade " id="default-tab-2">
                    <div class="table-responsive">
                        <div class="col-xl-12">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">
                                <!-- begin table-responsive -->
                                <div class="table-responsive">
                                    <table id="user" class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light" width="180px;"><spring:message code="list.detail.orderingfranchiseeheadquarters" text="발주 가맹점명"/></td>
                                            <td>${orderCharge.giveStoreName}</td>
                                            <%--<td class="bg-light" width="180px;"><spring:message code="list.detail.orderingdistributorname" text="발주 총판명"/></td>
                                            <td></td>--%>
                                            <td class="bg-light" width="180px;"><spring:message code="list.detail.orderfranchiseeheadquarters" text="수주 가맹점명"/></td>
                                            <td>${orderCharge.acceptStoreName}</td>
                                        </tr>
                                        <tr>

                                            <td class="bg-light" ><spring:message code="list.detail.deliverymanname" text="배송원 이름"/></td>
                                            <td>${orderCharge.workerName}</td>
                                            <td class="bg-light"><spring:message code="list.detail.deliverymanagentsettlementamount" text="배송원 정산금액"/></td>
                                            <td>
                                                <fmt:formatNumber value="${orderCharge.workerIncome}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.servicechargeamount" text="봉사료 금액"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.serviceAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            <td class="bg-light"><spring:message code="list.detail.orderamount" text="주문 금액"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.orderAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.discountamount" text="할인금액"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.discountAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            <td class="bg-light"><spring:message code="list.detail.thetotalamount" text="총금액"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.totalAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.customerpayout" text="고객지불금액"/></td>
                                            <td>
                                                <fmt:formatNumber value="${orderCharge.payAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </td>
                                            <td class="bg-light"><spring:message code="list.detail.customerpaymentmethod" text="고객지불방식"/></td>
                                            <td>
                                                <c:if test="${orderCharge.payMethod ==  1}">
                                                    <spring:message code="list.detail.payment" text="현금"/>
                                                </c:if>
                                                <c:if test="${orderCharge.payMethod ==  2}">
                                                    <spring:message code="list.detail.card" text="카드"/>
                                                </c:if>
                                                <c:if test="${orderCharge.payMethod ==  3}">
                                                    <spring:message code="list.detail.prepayment" text="선결제"/>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.totalamountofdeliveryagent" text="배달대행 총금액"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.dlvyTotalAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/>
                                            </td>
                                            <td class="bg-light"><spring:message code="list.detail.deliverymanagementfee" text="배달관리비"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.mngPrice}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.deliverymanagementfeesettlement" text="배달관리비 정산 구분"/></td>
                                            <td>
                                                <c:if test="${orderCharge.mngRateType ==  1}">
                                                    <spring:message code="list.detail.flatrate" text="정액"/>
                                                </c:if>
                                                <c:if test="${orderCharge.mngRateType ==  2}">
                                                    <spring:message code="list.detail.fixedrate" text="정률"/>
                                                </c:if>
                                            </td>
                                            <td class="bg-light"><spring:message code="list.detail.deliverymanagementfeeplatformcompany" text="배달관리비 플랫폼사"/></td>
                                            <td>${orderCharge.mngRatePlatform} (<spring:message code="list.detail.won" text="원"/> / %)  </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.deliverymanagementfeeorderinggroup" text="배달관리비 발주그룹"/></td>
                                            <td>${orderCharge.mngRateGive} <spring:message code="list.detail.won" text="원"/></td>
                                            <td class="bg-light"><spring:message code="list.detail.deliverymanagementfeeordergroup" text="배달관리비 수주그룹"/></td>
                                            <td>${orderCharge.mngRateAccept} <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.deliverysharing" text="배달공유구분"/></td>
                                            <td>
                                                <c:if test="${orderCharge.dlvyShareType ==  1}">
                                                    <spring:message code="list.detail.unshared" text="미공유"/>
                                                </c:if>
                                                <c:if test="${orderCharge.dlvyShareType ==  2}">
                                                    <spring:message code="list.detail.share" text="공유"/>
                                                </c:if>
                                            </td>
                                            <td class="bg-light"><spring:message code="list.detail.servicefee" text="서비스이용료(합계)"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.svcPrice}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.servicefeeplatformcompany" text="서비스이용료 플랫폼사"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.svcPrice0}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            <td class="bg-light"><spring:message code="list.detail.firstsettlementofservicefee" text="서비스이용료 1차 정산"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.svcPrice1}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.secondsettlementofservicefee" text="서비스이용료 2차 정산"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.svcPrice2}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            <td class="bg-light"><spring:message code="list.detail.3rdsettlementofservicefee" text="서비스이용료 3차 정산"/></td>
                                            <td><fmt:formatNumber value="${orderCharge.svcPrice3}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                            <!-- end panel -->
                        </div>
                    </div>
                </div>
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


<!-- #modal-message -->
<%--
<form id="user_modal" class="user_modal">
    <div class="modal modal-message fade" id="modal-message">
        <input type="hidden" name="headNo" value="${tbHead.headNo}">
        <input type="hidden" name="branchNo" value="">
        <input type="hidden" name="storeNo" value="">
        <input type="hidden" name="userType" value="UT_HEAD">
                            <div class="modal-dialog" style="
                    height: 50%;
                ">
                                <div class="modal-content" style="
                    margin: auto;
                    margin-top: 200px;
                ">
                                    <div class="modal-header height-30 m-t-40" >
                                        <h4 class="modal-title"><spring:message code="list.detail.userregistration" text="사용자 등록"/></h4>
                                        <button type="button" class="insert_close" data-dismiss="modal" aria-hidden="true">×</button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table table-condensed table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="bg-light">아이디</td>
                                                <td><input type="text" class="form-control width-full userId" name="userId" value="" placeholder="아이디를 입력해주세요"></td>
                                                <td class="text-danger-darker">아이디를 입력해주세요</td>
                                            </tr>
                                            <tr>
                            <td class="bg-light">패스워드</td>
                            <td><input type="text" class="form-control width-full userPwd" name="userPwd" value="" placeholder="패스워드를 입력해주세요"></td>
                            <td class="text-danger-darker">패스워드를 입력해주세요 </td>
                        </tr>
                        <tr>
                            <td class="bg-light">사용자 이름</td>
                            <td><input type="text" class="form-control width-full name" name="name" value="" placeholder="사용자 이름을 입력해주세요"></td>
                            <td class="text-danger-darker">사용자 이름을 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="bg-light">사용자 전화번호</td>
                            <td><input type="text" class="form-control width-full phone" name="phone" value="" placeholder="사용자 전화번호를 입력해주세요"></td>
                            <td class="text-danger-darker">사용자 전화번호를 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="bg-light">메모</td>
                            <td><input type="text" class="form-control width-full memo" name="memo" value="" placeholder="기타 메모를 입력해주세요"></td>
                            <td class="text-danger-darker">기타 메모를 입력해주세요</td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" class="btn btn-white" data-dismiss="modal">취소</a>
                    <a href="javascript:;" class="btn btn-primary modalUserSave">저장</a>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- #modal-message -->
<form id="user_update_modal" class="user_update_modal">
    <div class="modal modal-message-up fade" id="modal-message-up">
        <input type="hidden" name="headNo" value="${tbHead.headNo}">
        <input type="hidden" name="branchNo" value="">
        <input type="hidden" name="storeNo" value="">
        <input type="hidden" class="userNo upUserNo" name="userNo" value="">
        <input type="hidden" name="userType" value="UT_HEAD">
        <div class="modal-dialog" style="
                    height: 50%;
                ">
            <div class="modal-content" style="
                    margin-top: 200px;
                    width: 120%;
                ">
                <div class="modal-header height-30 m-t-40" >
                    <h4 class="modal-title">사용자 수정</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-condensed table-bordered">
                        <tbody>
                        <tr>
                            <td class="bg-light">아이디</td>
                            <td><input type="text" class="form-control width-full userId upUserId" name="" value="" placeholder="아이디를 입력해주세요" disabled></td>
                            <td class="text-danger-darker">아이디를 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="bg-light">새 패스워드</td>
                            <td><input type="text" class="form-control width-full userPwd upUserPwd" name="userPwd" value="" placeholder="새로운 패스워드를 입력해주세요"></td>
                            <td class="text-danger-darker">새로운 패스워드를 입력해주세요 </td>
                        </tr>
                        <tr>
                            <td class="bg-light">사용자 이름</td>
                            <td><input type="text" class="form-control width-full name upName" name="name" value="" placeholder="사용자 이름을 입력해주세요"></td>
                            <td class="text-danger-darker">사용자 이름을 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="bg-light">사용자 전화번호</td>
                            <td><input type="text" class="form-control width-full phone upPhone" name="phone" value="" placeholder="사용자 전화번호를 입력해주세요"></td>
                            <td class="text-danger-darker">사용자 전화번호를 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="bg-light">상태</td>
                            <td>
                                <select class="form-control upDataStatus" name="dataStatus">
                                    <option value="1">정상</option>
                                    <option value="2">정지</option>
                                </select>
                            </td>
                            <td class="text-danger-darker">사용자 전화번호를 입력해주세요</td>
                        </tr>
                        <tr>
                            <td class="bg-light">메모</td>
                            <td><input type="text" class="form-control width-full memo upMemo" name="memo" value="" placeholder="기타 메모를 입력해주세요"></td>
                            <td class="text-danger-darker">기타 메모를 입력해주세요</td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" class="btn btn-white" data-dismiss="modal">취소</a>
                    <a href="javascript:;" class="btn btn-primary modalUserUp">수정</a>
                </div>
            </div>
        </div>
    </div>
</form>
--%>


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
        staffList();
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
        $(document).on("click",".btn_update",function() {
            let url = "${path}/api/affiliated/update/action";
            let _forms = $('.update_form');
            let _forms2 = $('.update_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            if (inputDataCheck(req)) {
                swal({
                    title: "수정 하시겠습니까",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '수정'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbHeadData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbBusinessInfoData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
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
                                    //location.href = "${path}/workgroup/affiliated/list"
                                    // ;
                                    alert("수정에 성공하였습니다.");
                                    location.reload();
                                } else {
                                    alert("수정에 실패하였습니다.");
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });
        $(".btn_list").click(function() {
            location.href = "${path}/order/day/list";
        })
        /*$("#dataTable").dataTable({
            "paging" : true,
            "ordering" : true,
            "info" : true,
            "filter" : true,
            "lengthChange" : true,
            "order" : [[0, "desc"]]
        });*/
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
        $(document).on("change", "#saupja", function (e) {
            e.preventDefault();

            let file = $("#saupja")[0].files[0],
                reader = new FileReader();
            reader.readAsDataURL(file);
            let filename;
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                filename = file.name;
            } else {
                // old IE
                filename = $("#saupja").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName').text(filename);

            return false;
        });

        $(document).on("click",".modalUserSave",function(){

            let modalReq = convertFormToObj($('form.user_modal'));
            if (inputDataCheck3(modalReq)) {
                swal({
                    title: "등록 하시겠습니까",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '등록'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('user_modal'));
                        formData.append("tbUserStaffData",  new Blob([JSON.stringify(modalReq)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/userStaff/insert/action",
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert("등록에 성공하였습니다.");
                                    staffList();
                                    $(".insert_close").click();
                                } else if (data.result == 500) {
                                    alert("계정이 중복되었습니다.");
                                } else  {
                                    alert("등록에 실패하였습니다.");
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });


        $(document).on("click",".modalUserUp",function(){

            let modalReq = convertFormToObj($('form.user_update_modal'));
            if (inputDataCheck2(modalReq)) {
                swal({
                    title: "수정 하시겠습니까",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '수정'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('user_update_modal'));
                        formData.append("tbUserStaffData",  new Blob([JSON.stringify(modalReq)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/userStaff/update/action",
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert("수정에 성공하였습니다.");
                                    staffList();
                                    $(".close").click();
                                } else {
                                    alert("수정에 실패하였습니다.");
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });


        $(document).on("click",".update_staff",function(){

            let userId = $(this).attr("userId");
            let name = $(this).attr("name");
            let phone = $(this).attr("phone");
            let memo = $(this).attr("memo");
            let userNo = $(this).attr("staffNo");
            let dataStatus = $(this).attr("dataStatus");


            $(".upUserId").val(userId);
            $(".upName").val(name);
            $(".upPhone").val(phone);
            $(".upMemo").val(memo);
            $(".upUserNo").val(userNo);
            $(".upDataStatus").val(dataStatus).attr("selected","selected");
        });
    });
    function inputDataCheck(args) {
        if (isNull(args.headName)) {
            return alert_focus("headName", "제휴본사명을 입력해주세요");
        } else if (isNull(args.headTel)) {
            return alert_focus("headTel", "제휴본사 대표번호를 입력해주세요");
        }
        return true;
    }

    function inputDataCheck2(args) {
        if (isNull(args.name)) {
            return alert_focus("name", "이름을 입력해주세요");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "전화번호를 입력해주세요");
        }
        return true;
    }

    function inputDataCheck3(args) {
        if (isNull(args.userId)) {
            return alert_focus("userId", "아이디을 입력해주세요");
        } else if (isNull(args.name)) {
            return alert_focus("name", "이름을 입력해주세요");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "전화번호를 입력해주세요");
        }
        return true;
    }

    function staffList() {
        let headNo = "${tbHead.headNo}";
        let branchNo = "";
        let storeNo =  "";
        let userType = 1;

        $.ajax({
            type: "GET",
            url: "${path}/api/userStaff/list",
            data: {
                headNo : headNo,
                branchNo : branchNo,
                storeNo : storeNo,
                userType : userType
            },
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                $("#tbUserStaffBody").html("");
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/

                if(data.userStaffList.length == 0) {
                    $("#tbUserStaffBody").append(
                        "<tr><td colspan='7'>등록된 아이디가 없습니다</td></tr>"
                    )
                } else {
                    for(var i = 0 ; i < data.userStaffList.length ; i++){
                        let dataStatus = "";
                        if(data.userStaffList[i].dataStatus == 1) {
                            dataStatus = "정상";
                        } else if(data.userStaffList[i].dataStatus == 2){
                            dataStatus = "정지";
                        }

                        $("#tbUserStaffBody").append(
                            "<tr staffNo="+data.userStaffList[i].staffNo+" >" +
                            "   <td class=\"p-0\">"+(i+1)+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].userId+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].name+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].phone+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].memo+"</td>" +
                            "   <td class=\"p-0\">"+dataStatus+"</td>" +
                            "   <td class=\"p-0\"><a href=\"#modal-message-up\" class=\"btn btn-sm btn-primary update_staff\" " +
                            "data-toggle=\"modal\" userId="+data.userStaffList[i].userId+" name="+data.userStaffList[i].name+" phone="+data.userStaffList[i].phone+" dataStatus="+data.userStaffList[i].dataStatus+" memo="+data.userStaffList[i].memo+" staffNo="+data.userStaffList[i].staffNo+"" +
                            " >사용자 수정</a></td>" +
                            "</tr>"
                        )
                    }
                }
            }
        });
    }

</script>
</body>
</html>
