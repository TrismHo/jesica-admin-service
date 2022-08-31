<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.paymentdetails" text="결제내역상세"/></title>

</head>
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
    .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
    .map_wrap {position:relative;width:100%;height:300px;}
    #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
    .bg_white {background:#fff;}
    #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
    #menu_wrap .option{text-align: center;}
    #menu_wrap .option p {margin:10px 0;}
    #menu_wrap .option button {margin-left:5px;}
    #placesList li {list-style: none;}
    #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
    #placesList .item span {display: block;margin-top:4px;}
    #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    #placesList .item .info{padding:10px 0 10px 55px;}
    #placesList .info .gray {color:#8a8a8a;}
    #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
    #placesList .info .tel {color:#009900;}
    #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
    #placesList .item .marker_1 {background-position: 0 -10px;}
    #placesList .item .marker_2 {background-position: 0 -56px;}
    #placesList .item .marker_3 {background-position: 0 -102px}
    #placesList .item .marker_4 {background-position: 0 -148px;}
    #placesList .item .marker_5 {background-position: 0 -194px;}
    #placesList .item .marker_6 {background-position: 0 -240px;}
    #placesList .item .marker_7 {background-position: 0 -286px;}
    #placesList .item .marker_8 {background-position: 0 -332px;}
    #placesList .item .marker_9 {background-position: 0 -378px;}
    #placesList .item .marker_10 {background-position: 0 -423px;}
    #placesList .item .marker_11 {background-position: 0 -470px;}
    #placesList .item .marker_12 {background-position: 0 -516px;}
    #placesList .item .marker_13 {background-position: 0 -562px;}
    #placesList .item .marker_14 {background-position: 0 -608px;}
    #placesList .item .marker_15 {background-position: 0 -654px;}
    #pagination {margin:10px auto;text-align: center;}
    #pagination a {display:inline-block;margin-right:10px;}
    #pagination .on {font-weight: bold; cursor: default;color:#777;}

    .map_wrap {width: 100%;position: relative;}
    .modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
    .getdata{position: absolute;top: 370px;left: 10px;z-index: 1;}
    #drawingMap, #map {width: 100%;height: 648px;}
    #map {margin-top: 10px;}

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
    <%--<input type="hidden" class="orderScn" value="${tbOrder.updateScn}">--%>
        <div id="content" class="content p-0">
            <div class="col-xl-12">
                <div class="p-t-20 p-b-0">
                    <ol class="breadcrumb float-xl-right p-r-10">
                        <li class="breadcrumb-item"><spring:message code="sidemenu.settlement" text="정산"/></li>
                        <li class="breadcrumb-item"><a href="${path}/workgroup/affilfranch/list"><spring:message code="sidemenu.settlement.paymenthistory" text="결제내역"/></a></li>
                        <li class="breadcrumb-item active"><spring:message code="sidemenu.settlement.paymenthistory" text="결제내역"/></li>
                    </ol>
                    <h3 class="rix-title p-b-5"><spring:message code="list.detail.paymentdetails" text="결제내역상세"/></h3>
                </div>
                <div class="m-t-10">
                    <table class="table table-bordered">
                        <tr>
                            <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.orderno" text="주문번호"/></strong></td>
                            <td style="width:35%">
                                <span class="text-green">${tbPayApproval.orderNo}</span>
                            </td>
                            <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.paymentresult" text="결제결과"/></strong></td>
                            <td class="border-right-0">
                                <span class="text-green" style="width:35%; height: auto;">
                                    <c:if test="${tbPayApproval.status == '00'}"><spring:message code="list.detail.success" text="성공"/></c:if>
                                    <c:if test="${tbPayApproval.status != '00'}"><spring:message code="list.detail.fail" text="실패"/></c:if>
                                </span>
                            </td>
                            <td class="border-left-0">
                                <span class="text-green" style="width:35%; height: auto;">
                                   <%-- <input type="button" class="btn btn-primary float-right cancel-pay-action-btn" value="<spring:message code="list.detail.partialcancellation" text="주문취소"/>">
                                    <input type="button" class="btn btn-primary float-right m-l-5 m-r-5 cancel-approval-action-btn" value="<spring:message code="list.detail.cancelapproval" text="승인취소"/>">--%>
                                     <%--<input class="btn btn-primary float-right cancel-pay-btn m-l-5 m-r-5" type="button" value="승인취소">--%>
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
                <ul class="nav nav-tabs m-t-10" id="sel_tab">
                    <li class="nav-item">
                        <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                            <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                        </a>
                    </li>
                    <li class="nav-item">
                          <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="list.detail.approvalinformation" text="승인정보"/></span>
                              <span class="d-sm-block d-none"><spring:message code="list.detail.approvalinformation" text="승인정보"/></span>
                          </a>
                    </li>
                    <li class="nav-item">
                        <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.cancellationinformation" text="취소정보"/><%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.cancellationinformation" text="취소정보"/><%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade active show" id="default-tab-1">
                        <div class="table-responsive">
                            <form class="update_form" id="update_form6" method="post">
                                <div class="table-responsive" style="overflow: hidden;">
                                    <%--<table class="table table-condensed table-bordered">
                                        <c:if test="${tbPayCert != ''}">
                                            <tr>
                                                <td class="bg-light width-250"><spring:message code="list.detail.tid" text="TID"/></td>
                                                <td>${tbPayCert.tid}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.orderid" text="주문 ID"/></td>
                                                <td>${tbPayCert.orderNo}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.result" text="결과"/></td>
                                                <td>
                                                    <c:if test="${tbPayCert.status == '00'}"><spring:message code="list.detail.success" text="성공"/></c:if>
                                                    <c:if test="${tbPayCert.status != '00'}"><spring:message code="list.detail.fail" text="실패"/></c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.custname" text="고객명"/></td>
                                                <td>${tbPayCert.cust.custName}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.paymentrequesturl" text="결제요청 URL"/></td>
                                                <td>${tbPayCert.reqUrl}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.authenticationresultmessage" text="인증결과 메시지"/></td>
                                                <td>${tbPayCert.rmesg1}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.transactionamount" text="거래금액"/></td>
                                                <td><fmt:formatNumber value="${tbPayCert.amount}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.registrationdate" text="등록일"/></td>
                                                <td><javatime:format value="${tbPayCert.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${tbPayCert == ''}">
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.thereisnotransactioninformation" text="거래정보가 없습니다."/></td>
                                            </tr>
                                        </c:if>
                                    </table>
                                    <br>--%>
                                    <spring:message code="list.detail.cardinformation" text="카드정보"/>
                                    <table class="table table-condensed table-bordered">
                                        <c:if test="${tbPayCardData != ''}">
                                            <tr>
                                                <td class="bg-light width-250"><spring:message code="list.detail.paymentconfirmationnumber" text="결제승인번호"/></td>
                                                <td style="width: 30%;">${tbPayCardData.tid}</td>
                                                <td class="bg-light width-250" ><spring:message code="list.detail.issuercode" text="발급사코드"/></td>
                                                <td>${tbPayCardData.issuerCode}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.merchantnumber" text="가맹점번호"/></td>
                                                <td>${tbPayCardData.memberNum}</td>
                                                <td class="bg-light"><spring:message code="list.detail.acquirercode" text="매입사코드"/></td>
                                                <td>${tbPayCardData.purchaseCode}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.partialcancellationpossible" text="부분취소 가능여부"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.prtcCode == 0}">
                                                        <spring:message code="list.detail.impossible" text="불가능"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.prtcCode == 1}">
                                                         <spring:message code="list.detail.possible" text="가능"/>
                                                    </c:if>
                                                </td>
                                                <td class="bg-light"><spring:message code="list.detail.interestfreinstallmenpaymentatthestore" text="상점부담 무이자 할부여부"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.corpFlag == 1}">
                                                         <spring:message code="list.detail.personal" text="상점부담 무이자"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.corpFlag != 1}">
                                                        <spring:message code="list.detail.personal" text="상점부담 무이자 X"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.installmentdivision" text="카드구분"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.corpFlag == 0}">
                                                        <spring:message code="list.detail.personal" text="개인"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.corpFlag == 1}">
                                                        <spring:message code="list.detail.corporation" text="법인"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.corpFlag == 9}">
                                                        <spring:message code="list.detail.indistinguishable" text="구분불가"/>
                                                    </c:if>
                                                </td>
                                                <td class="bg-light"><spring:message code="list.detail.cardtype" text="카드종류"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.checkFlag == 0}">
                                                        <spring:message code="list.detail.credit" text="신용"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.checkFlag == 1}">
                                                        <spring:message code="list.detail.check" text="체크"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.checkFlag == 2}">
                                                        <spring:message code="list.detail.gift" text="기프트"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.creditcardinstallmentmonth" text="신용카드 할부개월"/></td>
                                                <td>${tbPayCardData.rmesg2}</td>
                                                <td class="bg-light"><spring:message code="list.detail.cardcode" text="카드코드"/></td>
                                                <td>${tbPayCardData.fnCd1}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.paymentcardcompanykoreanname" text="결제카드사 한글명"/></td>
                                                <td>${tbPayCardData.fnNm}</td>
                                                <td class="bg-light"><spring:message code="list.detail.cardnumber" text="카드번호"/></td>
                                                <td>${tbPayCardData.cardNum}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.approvalnumber" text="승인번호"/></td>
                                                <td>${tbPayCardData.authNo}</td>
                                                <td class="bg-light"><spring:message code="list.detail.vpcardcode" text="vp 카드 코드"/></td>
                                                <td>${tbPayCardData.ispCardCode}</td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.whethertousecoupons" text="쿠폰사용여부"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.couponFlag == 1}">
                                                        <spring:message code="list.detail.used" text="사용"/>
                                                    </c:if>
                                                    <c:if test="${tbPayCardData.couponFlag != 1}">
                                                        <spring:message code="list.detail.unused" text="미사용"/>
                                                    </c:if>
                                                </td>
                                                <td class="bg-light"><spring:message code="list.detail.couponusageamount" text="쿠폰사용금액"/></td>
                                                <td>${tbPayCardData.couponDiscount} <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.actualcardapprovalamount" text="실제카드 승인금액"/></td>
                                                <td><fmt:formatNumber value="${tbPayCardData.cardApplPrice}" pattern="#,###" /> <spring:message code="list.detail.point" text="POINT"/></td>
                                                <td class="bg-light"><spring:message code="list.detail.simpleapppaymentcode" text="간편앱결제코드"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.srcCode == 'C'}"><spring:message code="list.detail.payco" text="PAYCO"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'B'}"><spring:message code="list.detail.samsungpay" text="삼성페이"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'D'}"><spring:message code="list.detail.samsungpaycheck" text="삼성페이(체크)"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'G'}"><spring:message code="list.detail.ssgpay" text="SSGPAY"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'O'}"><spring:message code="list.detail.kakaopay" text="KAKAOPAY"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'L'}"><spring:message code="list.detail.lpay" text="LPAY"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'K'}"><spring:message code="list.detail.kpay" text="KPAY"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'H'}"><spring:message code="list.detail.tosspay" text="토스페이"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'I'}"><spring:message code="list.detail.naver" text="네이버"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'R'}"><spring:message code="list.detail.chaipay" text="차이페이"/></c:if>
                                                    <c:if test="${tbPayCardData.srcCode == 'U'}"><spring:message code="list.detail.tmoney" text="티머니"/></c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.pointsused" text="포인트사용금액"/></td>
                                                <td>${tbPayCardData.usePoint} <spring:message code="list.detail.point" text="POINT"/></td>
                                                <td class="bg-light"><spring:message code="list.detail.naverpointfreepoint" text="네이버포인트 무상포인트"/></td>
                                                <td><fmt:formatNumber value="${tbPayCardData.naverPointUseFreePoint}" pattern="#,###" /> <spring:message code="list.detail.point" text="POINT"/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.issuanceofnaverpointcashreceipt" text="네이버포인트 현금영수증 발행여부"/></td>
                                                <td>${tbPayCardData.naverPointCshrApplYn}</td>
                                                <td class="bg-light"><spring:message code="list.detail.amountissuedbynaverpointcashreceipt" text="네이버포인트 현금영수증 발행금액"/></td>
                                                <td><fmt:formatNumber value="${tbPayCardData.naverPointCshrApplAmt}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.lottecardemployeeaffiliationclassificationcode" text="롯데카드 임직원 제휴 구분코드"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.cardEmpPrtnCode == 'L'}"><spring:message code="list.detail.executives" text="임직원"/></c:if>
                                                </td>
                                                <td class="bg-light"><spring:message code="list.detail.cardcompanyaffiliateidentificationcode" text="카드사 제휴 구분코드"/></td>
                                                <td>
                                                    <c:if test="${tbPayCardData.cardNomlMobPrtnCode == 'P'}"><spring:message code="list.detail.lottecardnormal" text="롯데카드 일반"/></c:if>
                                                    <c:if test="${tbPayCardData.cardNomlMobPrtnCode == 'M'}"><spring:message code="list.detail.lottecardmobile" text="롯데카드 모바일"/></c:if>
                                                    <c:if test="${tbPayCardData.cardNomlMobPrtnCode == 'H'}"><spring:message code="list.detail.cardcompanyaffiliateidentificationcode" text="현대카드"/></c:if>
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${tbPayCardData == ''}">
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.nocardinformation" text="카드정보가 없습니다."/></td>
                                            </tr>
                                        </c:if>
                                    </table>
                                    <br>

                                </div>
                            </form>
                            <div class="m-t-10">
                                <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                            </div>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-2">
                        <div class="table-responsive">
                            <form class="update_form" id="update_form5" method="post">
                                <table class="table table-condensed table-bordered">
                                    <c:if test="${tbPayApproval != ''}">
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.approvedtransactionnumber" text="승인거래번호"/></td>
                                            <td>${tbPayApproval.tid}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.orderno" text="주문번호"/></td>
                                            <td>${tbPayApproval.orderNo}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.resultcode" text="결과코드"/></td>
                                            <td>
                                                <c:if test="${tbPayApproval.status == '00'}"><spring:message code="list.detail.success" text="성공"/></c:if>
                                                <c:if test="${tbPayApproval.status != '00'}"><spring:message code="list.detail.fail" text="실패"/></c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.storeid" text="상점ID"/></td>
                                            <td>${tbPayApproval.mid}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.resultmessage" text="결과 메시지"/></td>
                                            <td>${tbPayApproval.rmesg1}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.meansofpayment" text="지불수단"/></td>
                                            <td>${tbPayApproval.payType}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.approvaldate" text="승인일자"/></td>
                                            <td><javatime:format value="${tbPayApproval.authDtm}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.transactionamount" text="거래금액"/></td>
                                            <td>
                                                <fmt:formatNumber value="${tbPayApproval.amount}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.buyersname" text="구매자명"/></td>
                                            <td>${tbPayApproval.userName}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/></td>
                                            <td>${tbPayApproval.memberName}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.merchantrandomdata" text="가맹점 임의 데이터"/></td>
                                            <td>${tbPayApproval.noti}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.customernumber" text="고객번호"/></td>
                                            <td>${tbPayApproval.custNo}</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.orderpaymentverificationresulttid" text="주문결제 인증결과 tid"/></td>
                                            <td>${tbPayApproval.certTid}</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${tbPayApproval == ''}">
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.thereisnoauthorizationinformation" text="승인정보가 없습니다."/></td>
                                        </tr>
                                    </c:if>
                                </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="default-tab-5">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <c:if test="${tbPayCancel.size() > 0 }">
                                    <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                                        <thead>
                                        <tr class="text-center">
                                            <th class="text-center"><spring:message code="list.detail.no" text="순번"/></th>
                                            <th class="text-center"><spring:message code="list.detail.cancelno" text="취소No"/></th>
                                            <th class="text-center"><spring:message code="list.detail.ordernumber" text="주문번호"/></th>
                                            <th class="text-center"><spring:message code="list.detail.paymentmethodcode" text="지불수단"/></th>
                                            <th class="text-center"><spring:message code="list.detail.reasonforcancellationrequest" text="취소요청사유"/></th>
                                            <th class="text-center"><spring:message code="list.detail.resultmessage" text="결과메시지"/>
                                            <th class="text-center"><spring:message code="list.detail.requestresult" text="요쳥결과"/></th>
                                            <th class="text-center"><spring:message code="list.detail.cancellationdate" text="취소일자(yyyymmdd)"/></th>
                                            <th class="text-center"><spring:message code="list.detail.cancellationtime" text="취소시간(hhmmss)"/></th>
                                            <th class="text-center"><spring:message code="list.detail.cashreceiptcancellationapprovalnumber" text="현금영수증 취소 승인번호"/></th>
                                            <th class="text-center"><spring:message code="list.detail.cancelamount" text="취소금액"/></th>
                                            <th class="text-center"><spring:message code="list.detail.partialcancellationremainingamount" text="부분취소 남은금액"/></th>
                                            <th class="text-center"><spring:message code="list.detail.numberofpartialcancellations" text="부분취소 횟수"/></th>
                                            <th class="text-center"><spring:message code="list.detail.partialcancellationclassification" text="부분취소 구분"/></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${tbPayCancel}" varStatus="status">
                                            <tr class="detailRow"  tid="${item.tid}">
                                                <td class="text-center">${status.index+1}</td>
                                                <td class="text-center">${item.cancelNo}</td>
                                                <td class="text-center">${item.orderNo}</td>
                                                <td class="text-center">${item.payMethod}</td>
                                                <td class="text-center">${item.msg}</td>
                                                <td class="text-center">${item.resultMsg}</td>
                                                <td class="text-center">
                                                    <c:if test="${item.resultCode == '00'}">
                                                        성공
                                                    </c:if>
                                                    <c:if test="${item.resultCode != '00'}">
                                                        실패
                                                    </c:if>
                                                </td>
                                                <td class="text-center">
                                                    <c:if test="${item.cancelDate != '' && item.cancelDate != null}">
                                                        <fmt:parseDate var="parsedDate" value="${item.cancelDate}" pattern="yyyymmdd"/>
                                                        <fmt:formatDate var="newFormattedDateString" value="${parsedDate}" pattern="yyyy-MM-dd"/>
                                                        ${newFormattedDateString}
                                                    </c:if>
                                                </td>
                                                <td class="text-center">
                                                    <c:if test="${item.cancelTime != '' && item.cancelTime != null}">
                                                        <c:set var="TextValue" value="${item.cancelTime}"/>
                                                        ${fn:substring(TextValue,0,2) }:${fn:substring(TextValue,2,4) }:${fn:substring(TextValue,4,6) }
                                                    </c:if>
                                                </td>
                                                <td class="text-center">${item.cshrCancelNum}</td>
                                                <td class="text-center"><fmt:formatNumber value="${item.price}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                                <td class="text-center"><fmt:formatNumber value="${item.remainPrice}" pattern="#,###" /> <spring:message code="list.detail.won" text="원"/></td>
                                                <td class="text-center">${item.prtcCnt}</td>
                                                <td class="text-center">
                                                    <c:if test="${item.prtcType == 1}">
                                                        <spring:message code="list.detail.partialcancellation" text="부분취소"/>
                                                    </c:if>
                                                    <c:if test="${item.prtcType == 0}">
                                                        <spring:message code="list.detail.reapprovalmethod" text="재승인방식"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${tbPayCancel.size() <= 0 }">
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.nocancellationinformation" text="취소정보가 없습니다."/></td>
                                    </tr>
                                </c:if>
                            </table>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<%--취소정보--%>
<input type="hidden" class="calcelOrderNo" value="${tbPayApproval.orderNo}">
<c:if test='${tbOrder != ""}'>
<input type="hidden" class="orderStatusCode" value="${tbOrder.orderStatusCode}">
</c:if>
<c:if test='${tbOrder == ""}'>
<input type="hidden" class="orderStatusCode" value="">
</c:if>
<input type="hidden" value="${sessionScope.sessionKey.userRole}" class="userType" name="userType">
<input type="hidden" value="${sessionScope.sessionKey.userStaffNo}" class="userNo" name="userNo">
<c:if test='${tbOrder == ""}'><input type="hidden" value="0" class="scn" name="scn"></c:if>
<c:if test='${tbOrder != ""}'><input type="hidden" value="${tbOrder.updateScn}" class="scn" name="scn"></c:if>

<%--<div class="modal fade" id="order_cancel_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="orderCancel.jsp" %>
</div>
<div class="modal fade" id="approvel_cancel_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="approvalCancel.jsp" %>
</div>--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
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
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet"/>
<%@include file="../../../common/include_kakao_map_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    $(".list_btn").click(function () {
        location.href = "${path}/settlement/paymenthistory/list";
    });
    $(".cancel-pay-btn").click(function () {
        location.href = "${path}/settlement/paymenthistory/list";
    });



    $(() => {
        //주문취소
        $(document).on("click",".cancel-pay-action-btn",function() {

            let orderNo = $(".calcelOrderNo").val();
            let orderStatusCode = $(".orderStatusCode").val();

            let confirmmsg = "<spring:message code="list.script.areyousureyouwanttocanceltheorder" text="주문취소 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.ordercancellation" text="주문취소"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let noneOrder = "<spring:message code="list.script.thereisnoorderinformation" text="오더정보가 없습니다."/>";
            let cancelOrder = "<spring:message code="list.script.thisorderhasalreadybeencanceled" text="이미 취소된 오더입니다."/>";
            let adminCancel = "<spring:message code="list.script.admincancel" text="관리자 취소"/>";

            if(orderStatusCode == "" || orderNo == 0) {
                alert(noneOrder);
                return;
            } else if (orderStatusCode == 41) {
                alert(cancelOrder);
                return;
            }
            let scn = $(".orderScn").val();

            let data=
                {
                    "orderStatus":"CANCEL",
                    "userType": Number($(".userType").val()),
                    "userNo": Number($(".userNo").val()),
                    "scn": Number(scn),
                    "cancelMemo": adminCancel,
                    "isBatch": false
                }

            swal({
                title: confirmmsg,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "delete",
                        headers: {"Token" : "gsSDAoF1qqIJHhRBRR83pgQ9Wy2rE0bYAsUFeEKvJPI=" , "TokenUser" : "AdminAuth"},
                        url: "http://101.55.126.138:11000/api/v1/orders/"+orderNo,
                        contentType: "application/json;",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function(datas) {
                            console.log(datas);
                        },
                        error: function(xhr, status, error){
                            console.error(error);
                        }
                    });
                }
            });
        });



        //승인취소
       /* $(".cancel-pay-action-btn11").on("click",function(){
            let orderNo = $(".calcelOrderNo").val();
            let data=
                {
                    "cancelType": "REFUND",
                    "reqCancelPrice": 0,
                    "cancelMemo": "관리자 취소"
                }
            $.ajax({
                type: "get",
                headers: {"Token" : "gsSDAoF1qqIJHhRBRR83pgQ9Wy2rE0bYAsUFeEKvJPI=" , "TokenUser" : "AdminAuth"},
                url: "http://101.55.126.138:11800/api/v1/pays/orders/"+orderNo,
                data: data,
                dataType: "json",
                success: function(data) {
                    console.log(data);
                },
                error: function(xhr, status, error){
                    console.error(error);
                }
            });
        });*/

        $(document).on("click",".cancel-approval-action-btn",function() {

            let confirmmsg = "<spring:message code="list.script.doyouwanttocancelapproval" text="승인취소 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.cancelapproval" text="승인취소"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let noneOrder = "<spring:message code="list.script.thereisnoorderinformation" text="오더정보가 없습니다."/>";
            let cancelOrder = "<spring:message code="list.script.thisorderhasalreadybeencanceled" text="이미 취소된 오더입니다."/>";
            let adminCancel = "<spring:message code="list.script.admincancel" text="관리자 취소"/>";

            let orderNo = $(".calcelOrderNo").val();
            let orderStatusCode = $(".orderStatusCode").val();

            if(orderNo == 0) {
                alert(noneOrder);
                return;
            } else if (orderStatusCode == 41) {
                alert(cancelOrder);
                return;
            }
            let data=
                {
                    "cancelType": "REFUND",
                    "reqCancelPrice": 0,
                    "cancelMemo": adminCancel
                }

            swal({
                title: confirmmsg,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "get",
                        headers: {"Token" : "gsSDAoF1qqIJHhRBRR83pgQ9Wy2rE0bYAsUFeEKvJPI=" , "TokenUser" : "AdminAuth"},
                        url: "http://101.55.126.138:11800/api/v1/pays/orders/"+orderNo,
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function(datas) {
                            console.log(datas);
                        },
                        error: function(xhr, status, error){
                            console.error(error);
                        }
                    });
                }
            });
        });

    });

</script>
</html>
