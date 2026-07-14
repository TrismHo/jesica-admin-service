<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | <spring:message code="list.detail.detailsofpasorders" text="온동네주문내역"/></title>

    <style>
        .order-detail-page {
            color: #222;
            font-size: 12px;
        }

        .order-detail-header {
            padding-bottom: 8px;
        }

        .order-detail-title {
            margin: 0;
            font-size: 20px;
            font-weight: 700;
            color: #222;
        }

        .detail-shell {
            border: 1px solid #d9dee3;
            background: #fff;
        }

        .detail-section {
            border-top: 1px solid #e8ebef;
        }

        .detail-section:first-child {
            border-top: 0;
        }

        .section-head {
            padding: 10px 14px;
            border-bottom: 1px solid #e6e9ed;
            background: #f7f8fa;
        }

        .section-title {
            margin: 0;
            font-size: 13px;
            font-weight: 700;
            color: #222;
        }

        .section-body {
            padding: 12px 14px;
        }

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(6, minmax(0, 1fr));
            gap: 8px;
        }

        .summary-card {
            border: 1px solid #dfe3e8;
            background: #fff;
            min-height: 58px;
            padding: 8px 10px;
        }

        .summary-label {
            font-size: 11px;
            font-weight: 700;
            color: #7b8490;
            margin-bottom: 4px;
        }

        .summary-value {
            font-size: 12px;
            font-weight: 700;
            color: #222;
            line-height: 1.35;
            word-break: break-word;
        }

        .main-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .panel-box {
            border: 1px solid #d9dee3;
            background: #fff;
        }

        .panel-box + .panel-box {
            margin-top: 10px;
        }

        .panel-box-head {
            padding: 9px 12px;
            border-bottom: 1px solid #e8ebef;
            background: #fafbfc;
            font-size: 12px;
            font-weight: 700;
            color: #555;
        }

        .goods-wrap {
            overflow-x: auto;
        }

        .goods-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            min-width: 780px;
            border: 1px solid #e8ebef;
        }

        .goods-table thead th {
            background: #f8f9fb;
            color: #555;
            font-size: 12px;
            font-weight: 700;
            padding: 9px 8px;
            border-bottom: 1px solid #dfe3e8;
            text-align: center;
        }

        .goods-table tbody td {
            padding: 6px 8px;
            border-top: 1px solid #eef1f4;
            font-size: 12px;
            color: #222;
            vertical-align: middle;
            line-height: 1.4;
            word-break: break-word;
            text-align: center;
        }

        .goods-table tbody tr:first-child td {
            border-top: 0;
        }

        .goods-name {
            font-weight: 700;
            color: #111;
        }

        .goods-sub {
            margin-top: 2px;
            font-size: 11px;
            color: #7b8490;
        }

        .status-green { color: #1f7a3d; font-weight: 700; }
        .status-red { color: #d63939; font-weight: 700; }
        .status-orange { color: #f08c00; font-weight: 700; }
        .status-gray { color: #7a828a; font-weight: 700; }

        .muted {
            color: #98a1ab;
        }

        .bottom-actions {
            margin-top: 12px;
            display: flex;
            justify-content: flex-start;
            gap: 8px;
        }

        .bottom-actions .btn {
            min-width: 82px;
            height: 34px;
            border-radius: 0 !important;
            font-size: 12px;
            font-weight: 600;
            box-shadow: none !important;
        }

        .delivery-top-grid {
            display: grid;
            /*  grid-template-columns: 42% minmax(0, 1fr);*/
            gap: 10px;
            align-items: stretch;
        }

        .delivery-top-grid .detail-section {
            border-top: 0;
        }

        #deliveryCurrentStatusInline {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 28px;
            padding: 4px 10px;
            border-radius: 999px;
            background: #eef2f7;
            color: #334155;
            font-weight: 800;
            font-size: 12px;
            line-height: 1;
        }

        #deliveryCurrentStatusInline.is-ready {
            background: #fff8e6;
            color: #9a6700;
        }

        #deliveryCurrentStatusInline.is-moving {
            background: #eef7ff;
            color: #1864ab;
        }

        #deliveryCurrentStatusInline.is-done {
            background: #edf9f0;
            color: #2b8a3e;
        }

        #deliveryCurrentStatusInline.is-cancel {
            background: #fff1f3;
            color: #d63939;
        }

        .compact-table th {
            width: 140px;
            background: #fcfcfd;
            color: #6b7280;
            font-weight: 700;
        }

        .compact-table td {
            color: #222;
            font-weight: 500;
            background: #fff;
        }

        @media (max-width: 1280px) {
            .summary-grid {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }
        }

        @media (max-width: 992px) {
            .main-grid {
                grid-template-columns: 1fr;
            }

            .delivery-top-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .summary-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .compact-table th {
                width: 100px;
            }
        }
    </style>
</head>
<body>
<div id="page-loader" class="fade show"><span class="spinner"></span></div>

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <div id="content" class="content p-20">
        <div class="panel panel-inverse m-t-1">
            <div class="notice-detail-page">
                <div class="notice-detail-header">
                    <ol class="breadcrumb float-xl-right p-r-10 m-b-10">
                        <li class="breadcrumb-item"><a href="javascript:;">가맹점</a></li>
                        <li class="breadcrumb-item"><a href="${path}/store/order/list">온동네주문내역</a></li>
                        <li class="breadcrumb-item active">상세</li>
                    </ol>
                    <h3 class="order-detail-title">온동네주문내역 상세</h3>
                </div>

                <div class="detail-shell">
                    <c:if test="${callDetail.ordType == 6 or callDetail.ordType == 7}">
                        <div class="detail-section">
                            <div class="section-head">
                                <h4 class="section-title">택배현황</h4>
                            </div>
                            <div class="section-body" id="deliveryStatusSection">
                                <c:choose>
                                    <c:when test="${not empty logisticsDetail and not empty logisticsDetail.logisticsNo}">
                                        <div class="delivery-loading">택배현황을 조회 중입니다.</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="delivery-loading">송장번호가 없어 택배현황을 조회할 수 없습니다.</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:if>


                    <div class="detail-section">
                        <div class="section-head">
                            <h4 class="section-title">주문 요약</h4>
                        </div>
                        <div class="section-body ">
                            <div class="summary-grid">
                                <div class="summary-card">
                                    <div class="summary-label">주문번호</div>
                                    <div class="summary-value">${callDetail.ordNo}</div>
                                </div>

                                <div class="summary-card">
                                    <div class="summary-label">상품명</div>
                                    <div class="summary-value">${callDetail.goodsName}</div>
                                </div>

                                <div class="summary-card">
                                    <div class="summary-label">가맹점</div>
                                    <div class="summary-value">
                                        <span class="badge-code">${callDetail.ordStCode}</span>
                                        ${callDetail.stName}
                                    </div>
                                </div>

                                <div class="summary-card">
                                    <div class="summary-label">주문구분</div>
                                    <div class="summary-value">
                                        <c:choose>
                                            <c:when test="${callDetail.ordType == 1}">배달</c:when>
                                            <c:when test="${callDetail.ordType == 2}">포장</c:when>
                                            <c:when test="${callDetail.ordType == 3}">대기</c:when>
                                            <c:when test="${callDetail.ordType == 4}">예약</c:when>
                                            <c:when test="${callDetail.ordType == 5}">테이블</c:when>
                                            <c:when test="${callDetail.ordType == 6}">택배배송</c:when>
                                            <c:when test="${callDetail.ordType == 7}">오늘배송</c:when>
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <div class="summary-card">
                                    <div class="summary-label">주문확인</div>
                                    <div class="summary-value">
                                        <c:choose>
                                            <c:when test="${callDetail.ordConfirmType == 0}">미확인</c:when>
                                            <c:when test="${callDetail.ordConfirmType == 1}">확인</c:when>
                                            <c:when test="${callDetail.ordConfirmType == 9}">무관</c:when>
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <div class="summary-card">
                                    <div class="summary-label">주문상태</div>
                                    <div class="summary-value">


                                        <c:choose>
                                            <%-- 택배배송 / 오늘배송 --%>
                                            <c:when test="${callDetail.ordType == 6 or callDetail.ordType == 7}">
                                                <c:choose>
                                                    <c:when test="${callDetail.ordStatus == 1}">접수요청</c:when>
                                                    <c:when test="${callDetail.ordStatus == 2}">접수완료</c:when>
                                                    <c:when test="${callDetail.ordStatus == 3}">가맹점 확인</c:when>
                                                    <c:when test="${callDetail.ordStatus == 4}">
                                                        <c:choose>
                                                            <%-- 주문상태가 배송중이고 택배 배송상태가 6이면 배송완료 --%>
                                                            <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == 6}">
                                                                <span class="status-green">배송완료</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                배송중
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:when test="${callDetail.ordStatus == 5}">
                                                        <span class="status-green">구매확정</span>
                                                    </c:when>

                                                    <c:when test="${callDetail.ordStatus == 13}">
                                                        <span class="status-red">취소</span><br>
                                                        (취소일시 :
                                                        <javatime:format
                                                                value="${callDetail.ordDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        )
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </c:when>

                                            <%-- 일반 주문 --%>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${callDetail.ordStatus == 1}">접수요청</c:when>
                                                    <c:when test="${callDetail.ordStatus == 2}">접수완료</c:when>
                                                    <c:when test="${callDetail.ordStatus == 3}">가맹점 확인</c:when>
                                                    <c:when test="${callDetail.ordStatus == 4}">배달 중</c:when>

                                                    <c:when test="${callDetail.ordStatus == 5}">
                                                        <span class="status-green">완료</span>
                                                    </c:when>

                                                    <c:when test="${callDetail.ordStatus == 6}">조리완료</c:when>
                                                    <c:when test="${callDetail.ordStatus == 7}">테이블 주문접수</c:when>
                                                    <c:when test="${callDetail.ordStatus == 8}">대기</c:when>
                                                    <c:when test="${callDetail.ordStatus == 9}">호출</c:when>
                                                    <c:when test="${callDetail.ordStatus == 10}">입장완료</c:when>
                                                    <c:when test="${callDetail.ordStatus == 11}">예약요청</c:when>
                                                    <c:when test="${callDetail.ordStatus == 12}">예약확정</c:when>

                                                    <c:when test="${callDetail.ordStatus == 13}">
                                                        <span class="status-red">취소</span><br>
                                                        (취소일시 :
                                                        <javatime:format
                                                                value="${callDetail.ordDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        )
                                                    </c:when>

                                                    <c:when test="${callDetail.ordStatus == 14}">노쇼</c:when>
                                                    <c:when test="${callDetail.ordStatus == 15}">배차</c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="detail-section border-top-0">
                        <div class="section-body pt-0">
                            <div class="main-grid">
                                <div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">기본 정보</div>
                                        <table class="compact-table">
                                            <tr>
                                                <th>마스터 가맹점</th>
                                                <td>${callDetail.masterStCode}</td>
                                            </tr>
                                            <tr>
                                                <th>총판코드</th>
                                                <td>${callDetail.brCode}</td>
                                            </tr>
                                            <tr>
                                                <th>가맹점 연락처</th>
                                                <td>
                                                    <c:if test="${callDetail.stTel.length() == 11}">
                                                        ${fn:substring(callDetail.stTel, 0, 3)}-${fn:substring(callDetail.stTel, 3, 7)}-${fn:substring(callDetail.stTel, 7, 12)}
                                                    </c:if>
                                                    <c:if test="${callDetail.stTel.length() == 10}">
                                                        ${fn:substring(callDetail.stTel, 0, 2)}-${fn:substring(callDetail.stTel, 2, 6)}-${fn:substring(callDetail.stTel, 6, 12)}
                                                    </c:if>
                                                    <c:if test="${callDetail.stTel.length() != 10 && callDetail.stTel.length() != 11}">
                                                        ${callDetail.stTel}
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>주문일시</th>
                                                <td><javatime:format value="${callDetail.ordDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            </tr>
                                            <tr>
                                                <th>최종 수정일시</th>
                                                <td><javatime:format value="${callDetail.modDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            </tr>
                                            <tr>
                                                <th>상태 상세</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${callDetail.ordStatus == 2}">
                                                            배차일시 : <javatime:format value="${callDetail.cthDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        </c:when>
                                                        <c:when test="${callDetail.ordStatus == 4}">
                                                            출발일시 : <javatime:format value="${callDetail.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        </c:when>
                                                        <c:when test="${callDetail.ordStatus == 5}">
                                                            완료일시 : <javatime:format value="${callDetail.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        </c:when>
                                                        <c:when test="${callDetail.ordStatus == 13}">
                                                            취소사유 : ${callDetail.cancelMemo}
                                                        </c:when>
                                                        <c:otherwise><span class="muted">-</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="panel-box">
                                        <div class="panel-box-head">
                                            <c:if test="${callDetail.ordType == 6}">수령인 정보</c:if>
                                            <c:if test="${callDetail.ordType != 6}">기타사항</c:if>
                                        </div>
                                        <table class="compact-table">
                                            <c:choose>
                                                <c:when test="${callDetail.ordType == 1 || callDetail.ordType == 6}">
                                                    <tr>
                                                        <th>
                                                            <c:if test="${callDetail.ordType != 6}">
                                                                배달주소
                                                            </c:if>
                                                            <c:if test="${callDetail.ordType == 6}">
                                                                배송지 정보
                                                            </c:if>
                                                        </th>
                                                        <td>${callDetail.eaAddr4} ${callDetail.eaAddr5} ( ${callDetail.eaAddr6} )</td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                           수령인
                                                        </th>
                                                        <td>
                                                            ${callDetail.ordCuName}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                           수령인 연락처
                                                        </th>
                                                        <td>
                                                            <c:if test="${callDetail.ordCuTel.length() == 11}">
                                                                ${fn:substring(callDetail.ordCuTel, 0, 3)}-${fn:substring(callDetail.ordCuTel, 3, 7)}-${fn:substring(callDetail.ordCuTel, 7, 12)}
                                                            </c:if>
                                                            <c:if test="${callDetail.ordCuTel.length() == 10}">
                                                                ${fn:substring(callDetail.ordCuTel, 0, 2)}-${fn:substring(callDetail.ordCuTel, 2, 6)}-${fn:substring(callDetail.ordCuTel, 6, 12)}
                                                            </c:if>
                                                            <c:if test="${callDetail.ordCuTel.length() != 10 && callDetail.ordCuTel.length() != 11}">
                                                                ${callDetail.ordCuTel}
                                                            </c:if>

                                                        </td>
                                                    </tr>
                                                    <c:if test="${callDetail.ordType != 6}">
                                                        <tr>
                                                            <th>배달요청사항</th>
                                                            <td>${callDetail.ordCuWkMemo}</td>
                                                        </tr>

                                                        <tr>
                                                            <th>배송원 이름</th>
                                                            <td>${callDetail.cthWkName}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>배송원 전화번호</th>
                                                            <td>${callDetail.cthWkTel}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>배차일시</th>
                                                            <td><javatime:format value="${callDetail.cthDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                        </tr>

                                                        <tr>
                                                            <th>출발일시</th>
                                                            <td><javatime:format value="${callDetail.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>배달거리</th>
                                                            <td>${callDetail.dvryDistance} M</td>
                                                        </tr>
                                                    </c:if>
                                                </c:when>

                                                <c:when test="${callDetail.ordType == 2}">
                                                    <tr>
                                                        <th>포장예정시간</th>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty callDetail.takeoutDate   and fn:length(callDetail.takeoutDate) >= 12}">
                                                                    ${fn:substring(callDetail.takeoutDate, 0, 4)}-${fn:substring(callDetail.takeoutDate, 4, 6)}-${fn:substring(callDetail.takeoutDate, 6, 8)}
                                                                    ${fn:substring(callDetail.takeoutDate, 8, 10)} : ${fn:substring(callDetail.takeoutDate, 10, 12)}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    -
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>

                                                </c:when>

                                                <c:when test="${callDetail.ordType == 3}">
                                                    <tr>
                                                        <th>대기번호</th>
                                                        <td>${callDetail.ordStWaitNo} 번</td>
                                                    </tr>
                                                    <tr>
                                                        <th>인원</th>
                                                        <td>성인 : ${callDetail.adultCnt} 명 / 유아 : ${callDetail.childCnt} 명</td>
                                                    </tr>
                                                </c:when>

                                                <c:when test="${callDetail.ordType == 4}">
                                                    <tr>
                                                        <th>예약인원</th>
                                                        <td>성인 : ${callDetail.adultCnt} 명 / 유아 : ${callDetail.childCnt} 명</td>
                                                    </tr>
                                                    <tr>
                                                        <th>예약시간</th>
                                                        <td><javatime:format value="${callDetail.resvDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                    </tr>
                                                </c:when>

                                                <c:when test="${callDetail.ordType == 5}">
                                                    <tr>
                                                        <th>테이블 번호</th>
                                                        <td>
                                                            <c:if test="${callDetail.tableNo == 0}">알수없음</c:if>
                                                            <c:if test="${callDetail.tableNo != 0}">${callDetail.tableNo} 번</c:if>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>테이블 타입</th>
                                                        <td>
                                                            <c:if test="${callDetail.tableType == 0}">해당없음</c:if>
                                                            <c:if test="${callDetail.tableType == 1}">테이블</c:if>
                                                            <c:if test="${callDetail.tableType == 2}">KIOSK</c:if>
                                                        </td>
                                                    </tr>
                                                </c:when>

                                                <%--   <c:when test="${callDetail.ordType == 6}">
                                                       <tr>
                                                           <th>택배사</th>
                                                           <td>
                                                               <c:choose>
                                                                   <c:when test="${not empty logisticsDetail and not empty logisticsDetail.courierName}">
                                                                       ${logisticsDetail.courierName}
                                                                   </c:when>
                                                                   <c:otherwise><span class="muted">-</span></c:otherwise>
                                                               </c:choose>
                                                           </td>
                                                       </tr>
                                                       <tr>
                                                           <th>송장번호</th>
                                                           <td>
                                                               <c:choose>
                                                                   <c:when test="${not empty logisticsDetail and not empty logisticsDetail.trackingNum}">
                                                                       ${logisticsDetail.trackingNum}
                                                                   </c:when>
                                                                   <c:otherwise><span class="muted">-</span></c:otherwise>
                                                               </c:choose>
                                                           </td>
                                                       </tr>
                                                       <tr>
                                                           <th>수신자</th>
                                                           <td>
                                                               <c:choose>
                                                                   <c:when test="${not empty logisticsDetail and not empty logisticsDetail.receiverName}">
                                                                       ${logisticsDetail.receiverName}
                                                                   </c:when>
                                                                   <c:otherwise><span class="muted">-</span></c:otherwise>
                                                               </c:choose>
                                                           </td>
                                                       </tr>
                                                       <tr>
                                                           <th>배달상태</th>
                                                           <td>
                                                               <c:choose>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '1'}">배송준비</c:when>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '2'}">집하완료</c:when>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '3'}">배송진행중</c:when>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '4'}">지점도착</c:when>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '5'}">배송출발</c:when>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '6'}">배송완료</c:when>
                                                                   <c:when test="${not empty logisticsDetail and logisticsDetail.statusCode == '9'}">반송/취소</c:when>
                                                                   <c:when test="${not empty logisticsDetail and not empty logisticsDetail.statusCode}">
                                                                       ${logisticsDetail.statusCode}
                                                                   </c:when>
                                                                   <c:otherwise><span class="muted">-</span></c:otherwise>
                                                               </c:choose>
                                                           </td>
                                                       </tr>
                                                   </c:when>--%>

                                                <c:otherwise>
                                                    <tr>
                                                        <th>상세정보</th>
                                                        <td><span class="muted">없음</span></td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </table>
                                    </div>
                                </div>

                                <div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">결제 정보</div>
                                        <table class="compact-table">
                                            <tr>
                                                <th>주문금액</th>
                                                <td><fmt:formatNumber value="${callDetail.ordAmt}" pattern="#,###"/> 원</td>
                                            </tr>
                                            <tr>
                                                <th>지불금액</th>
                                                <td>
                                                    <div class="pay-inline">
                                                        <span class="pay-amount">
                                                            <fmt:formatNumber value="${callDetail.payAmt}" pattern="#,###"/> 원
                                                        </span>

                                                        <div class="inline-tags">
                                                            <c:if test="${callDetail.chargeType == '1'}">
                                                                <span class="mini-tag">후결제</span>
                                                            </c:if>
                                                            <c:if test="${callDetail.chargeType == '2'}">
                                                                <span class="mini-tag">선결제</span>
                                                            </c:if>
                                                            <c:if test="${callDetail.payType == '1'}">
                                                                <span class="mini-tag">현금</span>
                                                            </c:if>
                                                            <c:if test="${callDetail.payType == '2'}">
                                                                <span class="mini-tag">카드</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>배송비 / 택배비</th>
                                                <td><fmt:formatNumber value="${callDetail.srvAmt}" pattern="#,###"/> 원</td>
                                            </tr>
                                            <tr>
                                                <th>쿠폰할인</th>
                                                <td>
                                                    <fmt:formatNumber value="${callDetail.couponAmt}" pattern="#,###"/> 원
                                                    <c:if test="${not empty callDetail.couponTitle}">
                                                        (${callDetail.couponTitle})
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이벤트할인</th>
                                                <td><fmt:formatNumber value="${callDetail.eventAmt}" pattern="#,###"/> 원</td>
                                            </tr>
                                            <tr>
                                                <th>포인트사용</th>
                                                <td><fmt:formatNumber value="${callDetail.pointUseAmt}" pattern="#,###"/> 원</td>
                                            </tr>
                                            <tr>
                                                <th>PG사 승인정보</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty callDetail.pgAuthCode}">
                                                            ${callDetail.pgAuthCode}
                                                        </c:when>
                                                        <c:otherwise><span class="muted">-</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>PG사 결제상태</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${callDetail.pgStatus == 0}"><span class="status-gray">결제준비</span></c:when>
                                                        <c:when test="${callDetail.pgStatus == 1}"><span class="status-green">결제완료</span></c:when>
                                                        <c:when test="${callDetail.pgStatus == 2}"><span class="status-red">결제실패</span></c:when>
                                                        <c:when test="${callDetail.pgStatus == 3}"><span class="status-red">결제취소</span></c:when>
                                                        <c:when test="${callDetail.pgStatus == 4}"><span class="status-orange">취소요청</span></c:when>
                                                        <c:when test="${callDetail.pgStatus == 5}"><span class="status-green">취소완료</span></c:when>
                                                        <c:when test="${callDetail.pgStatus == 6}"><span class="status-red">취소실패</span></c:when>
                                                        <c:otherwise><span class="muted">-</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="panel-box">
                                        <div class="panel-box-head">주문자 정보</div>
                                        <table class="compact-table">
                                            <tr>
                                                <th>주문자명</th>
                                                <td>${callDetail.tbCust.custName}</td>
                                            </tr>
                                            <tr>
                                                <th>연락처</th>
                                                <td>
                                                    <c:if test="${callDetail.tbCust.custTel.length() == 11}">
                                                        ${fn:substring(callDetail.tbCust.custTel, 0, 3)}-${fn:substring(callDetail.tbCust.custTel, 3, 7)}-${fn:substring(callDetail.tbCust.custTel, 7, 12)}
                                                    </c:if>
                                                    <c:if test="${callDetail.tbCust.custTel.length() == 10}">
                                                        ${fn:substring(callDetail.tbCust.custTel, 0, 2)}-${fn:substring(callDetail.tbCust.custTel, 2, 6)}-${fn:substring(callDetail.tbCust.custTel, 6, 12)}
                                                    </c:if>
                                                    <c:if test="${callDetail.tbCust.custTel.length() != 10 && callDetail.ordCuTel.length() != 11}">
                                                        ${callDetail.tbCust.custTel}
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>누적주문횟수</th>
                                                <td>${callDetail.totalUseCount} 회</td>
                                            </tr>
                                            <tr>
                                                <th>추천정보</th>
                                                <td>
                                                    ${callDetail.tbCust.extBrCode} |
                                                    ${callDetail.tbCust.extRecommStCode} |
                                                    ${callDetail.tbCust.extMasterStCode}
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>매장요청사항</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty callDetail.ordCuStMemo}">
                                                            ${callDetail.ordCuStMemo}
                                                        </c:when>
                                                        <c:otherwise><span class="muted">없음</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detail-section border-0">
                        <div class="section-body pt-0">
                            <div class="goods-wrap">
                                <table class="goods-table">
                                    <thead>
                                    <tr>
                                        <th style="width: 60px;">No</th>
                                        <th style="width: 24%;">상품명</th>
                                        <th style="width: 130px;">금액</th>
                                        <th style="width: 130px;">할인가격</th>
                                        <th style="width: 120px;">주문가격구분</th>
                                        <th>옵션</th>
                                        <th>추가상품</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${goodsInfo}" varStatus="status">
                                        <tr>
                                            <td style="text-align:center;">${status.count}</td>
                                            <td>
                                                <div class="goods-name">${item.goodsName}</div>
                                                <div class="goods-sub">${item.ordCnt} 개</div>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${item.ordPrice}" pattern="#,###"/> 원
                                            </td>
                                            <td><fmt:formatNumber value="${item.ordDnPrice}" pattern="#,###"/> 원 </td>
                                            <td>
                                                <c:if test="${item.ordPriceType == '1'}">
                                                    정상가
                                                </c:if>
                                                <c:if test="${item.ordPriceType == '2'}">
                                                    할인가
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${item.option1Name != null}">
                                                    <div>${item.option1Name} (<fmt:formatNumber value="${item.option1Price}" pattern="#,###"/> 원)</div>
                                                </c:if>
                                                <c:if test="${item.option2Name != null}">
                                                    <div>${item.option2Name} (<fmt:formatNumber value="${item.option2Price}" pattern="#,###"/> 원)</div>
                                                </c:if>
                                                <c:if test="${item.option3Name != null}">
                                                    <div>${item.option3Name} (<fmt:formatNumber value="${item.option3Price}" pattern="#,###"/> 원)</div>
                                                </c:if>
                                                <c:if test="${item.option4Name != null}">
                                                    <div>${item.option4Name} (<fmt:formatNumber value="${item.option4Price}" pattern="#,###"/> 원)</div>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:forEach var="item2" items="${goodsInfoDetail}">
                                                    <c:if test="${item2.ordGoodsSeq == item.ordGoodsSeq}">
                                                        <div>
                                                                ${item2.optGoodsName} x ${item2.optGoodsCnt} 개
                                                            ( <fmt:formatNumber value="${item2.optGoodsPrice}" pattern="#,###"/> 원 )
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
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
            <div class="bottom-actions">
                <button type="button" class="btn btn-primary btn_list">
                    <i class="fa fa-list m-r-3"></i> 목록
                </button>
            </div>
        </div>
    </div>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    $(function () {
        $(".btn_list").on("click", function () {
            window.history.back();
        });

        initDeliveryStatusSection();
    });

    function getDeliveryStatusText(statusCode, statusText) {
        return getDeliveryStatusMeta(statusCode, statusText).text;
    }

    function initDeliveryStatusSection() {
        var ordType = String('${callDetail.ordType}');
        var ordNo = '${callDetail.ordNo}';
        var logisticsNo = '${not empty logisticsDetail ? logisticsDetail.logisticsNo : ""}';

        if (ordType !== '6' && ordType !== '7') {
            return;
        }

        if (!logisticsNo) {
            $('#deliveryStatusSection').html("<div class='delivery-loading'>송장번호가 없어 택배현황을 조회할 수 없습니다.</div>");
            return;
        }

        $.ajax({
            url: '${path}/api/order/deliveryStatus',
            type: 'GET',
            data: {
                ordNo: ordNo,
                logisticsNo: logisticsNo
            },
            success: function(res) {
                var payload = res.data || res || {};
                payload.historyList = payload.historyList || payload.list || payload.history || [];
                renderDeliveryStatusSection(payload);
            },
            error: function() {
                $('#deliveryStatusSection').html("<div class='delivery-loading'>택배현황 정보를 불러오지 못했습니다.</div>");
            }
        });
    }

    function formatHistoryDate(value) {
        if (!value) return '-';
        return dateFormat(value);
    }

    function buildHistoryRows(historyList) {
        if (!historyList || historyList.length === 0) {
            return "<tr><td colspan='5' class='history-empty-cell'>진행 이력이 없습니다.</td></tr>";
        }

        var html = '';

        historyList.forEach(function(item, index) {
            const statusText = getHistoryStatusText(item);
            const statusClass = getHistoryStatusClass(item);
            const transDate = formatHistoryDate(item.transDate || item.time || item.regDate || item.date);
            const location = item.location || item.where || item.addr || '-';
            const description = item.description || item.contents || item.detail || item.message || '-';

            html += '' +
                '<tr>' +
                "<td style='text-align:center;'>" + (index + 1) + '</td>' +
                "<td style='text-align:center;'><span class='history-status " + statusClass + "'>" + statusText + '</span></td>' +
                "<td style='text-align:center;'>" + transDate + '</td>' +
                "<td style='text-align:center;'>" + location + '</td>' +
                '<td>' + description + '</td>' +
                '</tr>';
        });

        return html;
    }

    function buildDeliveryProgressHtml(data, currentStep, isCancel, currentCode) {
        currentCode = String(currentCode || '');
        const meta = getDeliveryStatusMeta(
            currentCode,
            data.currentStatusName || data.statusName
        );
        const badgeClass = getDeliveryBadgeClass(
            currentCode,
            data.currentStatusName || data.statusName
        );

        function stepClass(no) {
            // 반송/취소일 때는 모든 단계를 미체크 상태로 표시
            if (isCancel) {
                return 'delivery-progress-step';
            }

            if (no < currentStep) {
                return 'delivery-progress-step is-complete';
            }

            if (no === currentStep) {
                return 'delivery-progress-step is-active';
            }

            return 'delivery-progress-step';
        }

        let progressPercent = 0;
        if (currentStep === 1) progressPercent = 8;
        else if (currentStep === 2) progressPercent = 24;
        else if (currentStep === 3) progressPercent = 42;
        else if (currentStep === 4) progressPercent = 58;
        else if (currentStep === 5) progressPercent = 78;
        else if (currentStep >= 6) progressPercent = 100;

        if (isCancel) {
            /*        if (currentStep === 1) progressPercent = 8;
                    else if (currentStep === 2) progressPercent = 24;
                    else if (currentStep === 3) progressPercent = 42;
                    else if (currentStep === 4) progressPercent = 58;
                    else if (currentStep >= 5) progressPercent = 78;*/
            progressPercent = 0;
        }

        let subTitle = '현재 진행중인 단계만 강조해서 표시합니다.';
        if (isCancel) subTitle = '반송 또는 취소된 상태입니다.';
        else if (currentStep === 1) subTitle = '배송 등록 및 준비가 진행 중입니다.';
        else if (currentStep === 2) subTitle = '상품 집하가 완료되었습니다.';
        else if (currentStep === 3) subTitle = '배송이 진행 중입니다.';
        else if (currentStep === 4) subTitle = '배송 지점에 도착했습니다.';
        else if (currentStep === 5) subTitle = '최종 배송을 위해 출발했습니다.';
        else if (currentStep === 6) subTitle = '배송이 완료되었습니다.';

        return '' +
            '<div class="delivery-progress-panel' + (isCancel ? ' is-cancel' : '') + '">' +
            '<div class="delivery-progress-head">' +
            '<div class="delivery-progress-head-left">' +
            '<div class="delivery-progress-main-title">배송 진행 현황</div>' +
            '<div class="delivery-progress-sub-title">' + subTitle + '</div>' +
            '</div>' +
            '<div class="delivery-progress-status-badge ' + badgeClass + '">' + meta.text + '</div>' +
            '</div>' +
            '<div class="delivery-progress-bar-wrap">' +
            '<div class="delivery-progress-bar-track">' +
            '<div class="delivery-progress-bar-fill" style="width:' + progressPercent + '%;"></div>' +
            '</div>' +
            '</div>' +
            '<div class="delivery-progress-steps">' +

            '<div class="' + stepClass(1) + '">' +
            '<div class="delivery-progress-step-index">1</div>' +
            '<div class="delivery-progress-step-title">배송준비</div>' +
            '<div class="delivery-progress-step-desc">접수 및 등록</div>' +
            '</div>' +

            '<div class="' + stepClass(2) + '">' +
            '<div class="delivery-progress-step-index">2</div>' +
            '<div class="delivery-progress-step-title">집하완료</div>' +
            '<div class="delivery-progress-step-desc">물품 인수 완료</div>' +
            '</div>' +

            '<div class="' + stepClass(3) + '">' +
            '<div class="delivery-progress-step-index">3</div>' +
            '<div class="delivery-progress-step-title">배송진행중</div>' +
            '<div class="delivery-progress-step-desc">이동 중</div>' +
            '</div>' +

            '<div class="' + stepClass(4) + '">' +
            '<div class="delivery-progress-step-index">4</div>' +
            '<div class="delivery-progress-step-title">지점도착</div>' +
            '<div class="delivery-progress-step-desc">배송 지점 도착</div>' +
            '</div>' +

            '<div class="' + stepClass(5) + '">' +
            '<div class="delivery-progress-step-index">5</div>' +
            '<div class="delivery-progress-step-title">배송출발</div>' +
            '<div class="delivery-progress-step-desc">최종 배송 출발</div>' +
            '</div>' +

            '<div class="' + stepClass(6) + '">' +
            '<div class="delivery-progress-step-index">6</div>' +
            '<div class="delivery-progress-step-title">배송완료</div>' +
            '<div class="delivery-progress-step-desc">전달 완료</div>' +
            '</div>' +

            '</div>' +
            '</div>';
    }

    function renderDeliveryStatusSection(data) {
        const historyList = data.historyList || [];
        const wizardState = getCurrentStep(data, historyList);
        // 진행 단계, 상단 상태 배지, 진행률을 모두 동일한 최종 상태코드로 표시
        const displayStatusCode = wizardState.statusCode;

        const currentMeta = getDeliveryStatusMeta(
            displayStatusCode,
            data.currentStatusName || data.statusName
        );
        const currentBadgeClass = getDeliveryBadgeClass(
            displayStatusCode,
            data.currentStatusName || data.statusName
        );

        const html =
            '<div class="detail-shell border-0">' +
            '<div class="delivery-top-grid">' +

            '<div class="detail-section">' +
            '<div class="section-body pl-0 pt-0 pb-0">' +
            buildDeliveryProgressHtml(
                data,
                wizardState.step,
                wizardState.isCancel,
                displayStatusCode
            ) +
            '<div style="height:10px;"></div>' +
            '<div class="delivery-summary-grid">' +
            '<div class="summary-card">' +
            '<div class="summary-label">택배사</div>' +
            '<div class="summary-value">' + (data.courierName || data.deliveryCompanyName || '-') + '</div>' +
            '</div>' +
            '<div class="summary-card">' +
            '<div class="summary-label">송장번호</div>' +
            '<div class="summary-value">' + (data.trackingNum || data.logisticsNo || '-') + '</div>' +
            '</div>' +
            '<div class="summary-card">' +
            '<div class="summary-label">수령인</div>' +
            '<div class="summary-value">' + (data.receiverName || data.recvName || '-') + '</div>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>' +

            '<div class="detail-section border">' +
            '<div class="section-head">' +
            '<h4 class="section-title">진행 이력</h4>' +
            '</div>' +
            '<div class="section-body p-0">' +
            '<div class="goods-wrap">' +
            '<table class="goods-table delivery-history-table border-0">' +
            '<thead>' +
            '<tr>' +
            '<th style="width: 50px;">No</th>' +
            '<th style="width: 250px;">상태</th>' +
            '<th style="width: 160px;">시간</th>' +
            '<th style="width: 140px;">위치</th>' +
            '<th>상세내용</th>' +
            '</tr>' +
            '</thead>' +
            '<tbody>' + buildHistoryRows(historyList) + '</tbody>' +
            '</table>' +
            '</div>' +
            '</div>' +
            '</div>' +

            '</div>' +
            '</div>';

        $('#deliveryStatusSection').html(html);

        if ($('#deliveryCurrentStatusInline').length) {
            $('#deliveryCurrentStatusInline')
                .removeClass('is-ready is-moving is-done is-cancel')
                .addClass(currentBadgeClass)
                .text(currentMeta.text);
        }
    }
</script>
</body>
</html>
