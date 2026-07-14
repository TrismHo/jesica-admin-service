<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>

    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.platformno리ticeregistration12" text="이벤트 발송내역"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | <spring:message code="list.detail.platformno리ticeregistration12" text="이벤트 발송내역"/></title>
    </c:if>

    <style>
        .event-detail-page {
            color: #222;
            font-size: 12px;
        }

        .event-detail-header {
            padding-bottom: 8px;
        }

        .event-detail-title {
            margin: 0;
            font-size: 20px;
            font-weight: 700;
            color: #222;
            letter-spacing: -.03em;
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


        .section-title {
            margin: 0;
            font-size: 13px;
            font-weight: 700;
            color: #222;
        }

        .section-desc {
            font-size: 11px;
            color: #8b95a1;
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
            min-height: 62px;
            padding: 9px 10px;
        }

        .summary-label {
            font-size: 11px;
            font-weight: 700;
            color: #7b8490;
            margin-bottom: 5px;
        }

        .summary-value {
            font-size: 12px;
            font-weight: 700;
            color: #222;
            line-height: 1.4;
            word-break: break-word;
        }

        .summary-value-lg {
            font-size: 14px;
            color: #111;
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
            margin-top: 0px;
        }

        .panel-box-head {
            padding: 9px 12px;
            border-bottom: 1px solid #e8ebef;
            background: #fafbfc;
            font-size: 12px;
            font-weight: 700;
            color: #555;
        }

        .compact-table {
            width: 100%;
            margin: 0;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .compact-table tr {
            border-top: 1px solid #eef1f4;
        }

        .compact-table tr:first-child {
            border-top: 0;
        }

        .compact-table th,
        .compact-table td {
            padding: 10px 12px;
            vertical-align: middle;
            line-height: 1.45;
            word-break: break-word;
            border: 0;
        }

        .compact-table th {
            width: 150px;
            background: #fcfcfd;
            color: #6b7280;
            font-size: 12px;
            font-weight: 700;
        }

        .compact-table td {
            color: #222;
            font-size: 12px;
            font-weight: 500;
            background: #fff;
        }

        .badge-code {
            display: inline-flex;
            align-items: center;
            min-height: 22px;
            padding: 2px 8px;
            border: 1px solid #d6dce3;
            background: #f7f8fa;
            color: #4b5563;
            font-size: 11px;
            font-weight: 700;
            vertical-align: middle;
        }

        .badge-green {
            border-color: #b7d7c8;
            background: #f3fbf7;
            color: #16824a;
        }

        .badge-blue {
            border-color: #bfd4f5;
            background: #f3f7ff;
            color: #2563a8;
        }

        .badge-orange {
            border-color: #f3d19e;
            background: #fff8ec;
            color: #9a6700;
        }

        .muted {
            color: #98a1ab;
        }

        .money-value {
            font-weight: 800;
            color: #222;
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

        @media (max-width: 1280px) {
            .summary-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 992px) {
            .main-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .summary-grid {
                grid-template-columns: 1fr;
            }

            .compact-table th {
                width: 120px;
            }

            .section-head {
                align-items: flex-start;
                flex-direction: column;
            }
        }
        .shared-store-list {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            align-items: center;
        }

        .shared-store-tag {
            display: inline-flex;
            align-items: center;
            max-width: 240px;
            min-height: 24px;
            padding: 3px 9px;
            border: 1px solid #d6dce3;
            background: #f7f8fa;
            color: #374151;
            font-size: 11px;
            font-weight: 700;
            line-height: 1.3;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .shared-store-empty {
            color: #98a1ab;
        }

        .event-info-table {
            width: 100%;
            margin: 0;
            border-collapse: collapse;
            table-layout: fixed;
            border: 1px solid #d9dee3;
            background: #fff;
        }

        .event-info-table tr {
            border-top: 1px solid #eef1f4;
        }

        .event-info-table tr:first-child {
            border-top: 0;
        }

        .event-info-table th,
        .event-info-table td {
            padding: 10px 12px;
            vertical-align: middle;
            line-height: 1.45;
            word-break: break-word;
            border: 0;
        }

        .event-info-table th {
            width: 150px;
            background: #fcfcfd;
            color: #6b7280;
            font-size: 12px;
            font-weight: 700;
        }

        .event-info-table td {
            background: #fff;
            color: #222;
            font-size: 12px;
            font-weight: 500;
        }

        .event-info-table .empty-cell {
            background: #fff;
            color: transparent;
        }

        .shared-store-list {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            align-items: center;
        }

        .shared-store-tag {
            display: inline-flex;
            align-items: center;
            max-width: 240px;
            min-height: 24px;
            padding: 3px 9px;
            border: 1px solid #d6dce3;
            background: #f7f8fa;
            color: #374151;
            font-size: 11px;
            font-weight: 700;
            line-height: 1.3;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        @media (max-width: 992px) {
            .event-info-table,
            .event-info-table tbody,
            .event-info-table tr,
            .event-info-table th,
            .event-info-table td {
                display: block;
                width: 100% !important;
            }

            .event-info-table th {
                border-top: 1px solid #eef1f4;
            }

            .event-info-table tr:first-child th:first-child {
                border-top: 0;
            }

            .event-info-table .empty-cell {
                display: none;
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
            <div class="event-detail-page">

                <div class="event-detail-header">
                    <ol class="breadcrumb float-xl-right p-r-10 m-b-10">
                        <li class="breadcrumb-item">
                            <a href="javascript:;">
                                <spring:message code="sidemenu.boardmanagement12" text="가맹점"/>
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="javascript:;">
                                <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="이벤트 발송내역"/>
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="상세"/>
                        </li>
                    </ol>

                    <h3 class="event-detail-title">
                        <spring:message code="list.detail.platformnoticeregistration1" text="이벤트 발송현황 상세"/>
                    </h3>
                </div>

                <form name="update_form" id="update_form" class="update_form">
                    <input type="hidden" name="logNo" value="${tbMannaEventPush.logNo}">

                    <div class="detail-shell">
                        <div class="detail-section">
                            <div class="section-head">
                                <h4 class="section-title">이벤트 요약</h4>
                                <div class="section-desc">발송 이벤트의 핵심 정보를 확인합니다.</div>
                            </div>

                            <div class="section-body">
                                <div class="summary-grid">
                                    <div class="summary-card">
                                        <div class="summary-label">이벤트 일련번호</div>
                                        <div class="summary-value summary-value-lg">
                                            ${tbMannaEventPush.evntSeqNo}
                                        </div>
                                    </div>

                                    <div class="summary-card">
                                        <div class="summary-label">이벤트 제목</div>
                                        <div class="summary-value summary-value-lg">
                                            ${tbMannaEventPush.evTitle}
                                        </div>
                                    </div>

                                    <div class="summary-card">
                                        <div class="summary-label">입력일시</div>
                                        <div class="summary-value">
                                            <javatime:format value="${tbMannaEventPush.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        </div>
                                    </div>

                                    <div class="summary-card">
                                        <div class="summary-label">발송건수</div>
                                        <div class="summary-value">
                                            <span class="badge-code badge-blue">${tbMannaEventPush.sendCnt} 건</span>
                                        </div>
                                    </div>
                                    <div class="summary-card">
                                        <div class="summary-label">그룹 코드(ext)</div>
                                        <div class="summary-value">
                                               <c:choose>
                                                   <c:when test="${not empty tbMannaEventPush.grCode}">
                                                       <span class="badge-code">${tbMannaEventPush.grCode}</span>
                                                   </c:when>
                                                   <c:otherwise>
                                                       <span class="muted">-</span>
                                                   </c:otherwise>
                                               </c:choose>
                                        </div>
                                    </div>
                                    <div class="summary-card">
                                        <div class="summary-label">그룹명</div>
                                        <div class="summary-value">
                                            <span class="badge-code badge-blue">
                                                <c:choose>
                                                    <c:when test="${not empty tbMannaEventPush.grName}">
                                                        ${tbMannaEventPush.grName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="muted">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="detail-section">
                            <div class="section-head">
                                <h4 class="section-title">발송 정보</h4>
                            </div>

                            <div class="section-body">
                                <div class="main-grid">
                                    <div class="panel-box">
                                        <div class="panel-box-head">할인 정보</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>이벤트 할인금액(원/%)</th>
                                                <td>
                                                    <span class="money-value">${tbMannaEventPush.evPrice}</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이벤트 할인금액 최대</th>
                                                <td>
                                                    <span class="money-value">${tbMannaEventPush.evPriceMax} 원</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이벤트 할인</th>
                                                <td>
                                                    <span class="money-value">${tbMannaEventPush.evPrice}</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="panel-box">
                                        <div class="panel-box-head">이벤트 기간 및 공유가게</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>이벤트 시작일</th>
                                                <td>
                                                    <javatime:format value="${tbMannaEventPush.evStartDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>이벤트 종료일</th>
                                                <td>
                                                    <javatime:format value="${tbMannaEventPush.evEndDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>공유가게리스트</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty tbMannaEventPush.param3}">
                                                            <div class="shared-store-list">
                                                                <c:forEach var="storeName" items="${fn:split(tbMannaEventPush.param3, ',')}">
                                                                    <c:if test="${not empty fn:trim(storeName)}">
                                                                        <span class="shared-store-tag" title="${fn:trim(storeName)}">
                                                                                ${fn:trim(storeName)}
                                                                        </span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="shared-store-empty">-</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="detail-section">
                            <div class="section-head">
                                <h4 class="section-title">이벤트 조건</h4>
                            </div>

                            <div class="section-body">
                                <div class="main-grid">
                                    <div class="panel-box">
                                        <div class="panel-box-head">대상 그룹</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>발송대상</th>
                                                <td>
                                                    <span class="badge-code badge-green">${tbMannaEventPush.param1} 명</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>발송대상 주문건수</th>
                                                <td>
                                                    <span class="badge-code badge-orange">${tbMannaEventPush.param2} 건</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">주문 / 배달 구분</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>이벤트 배달 구분</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${tbMannaEventPush.evDvryType == 1}">
                                                            <span class="badge-code badge-blue">배달</span>
                                                        </c:when>
                                                        <c:when test="${tbMannaEventPush.evDvryType == 2}">
                                                            <span class="badge-code badge-green">포장</span>
                                                        </c:when>
                                                        <c:when test="${tbMannaEventPush.evDvryType == 3}">
                                                            <span class="badge-code">대기</span>
                                                        </c:when>
                                                        <c:when test="${tbMannaEventPush.evDvryType == 4}">
                                                            <span class="badge-code badge-orange">예약</span>
                                                        </c:when>
                                                        <c:when test="${tbMannaEventPush.evDvryType == 5}">
                                                            <span class="badge-code">테이블</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="muted">-</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>이벤트 주문 구분</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${tbMannaEventPush.evOrdType == 1}">
                                                            <span class="badge-code badge-green">0원배달</span>
                                                        </c:when>
                                                        <c:when test="${tbMannaEventPush.evOrdType == 2}">
                                                            <span class="badge-code badge-blue">0순위배달</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="muted">-</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="bottom-actions">
                    <button type="button" class="btn btn-primary btn_list">
                        <i class="fa fa-list m-r-3"></i>
                        <spring:message code="list.detail.list1" text="목록"/>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_kakao_map_js.jsp" %>

<script>
    $(() => {
        $(".btn_list").click(() => {
            location.href = "${path}/board/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName=&custTel=";
        });

        $(".btn_up").click(() => {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="수정에 실패하였습니다."/>";

            let url = "${path}/api/user/cust/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);

            req.smsYn = (req.smsYn == "on") ? "1" : "0";
            req.pushMarketingYn = (req.pushMarketingYn == "on") ? "1" : "0";
            req.pushNoticeYn = (req.pushNoticeYn == "on") ? "1" : "0";
            req.pushOrderYn = (req.pushOrderYn == "on") ? "1" : "0";

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
                                    location.href = "${path}/board/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName=";
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
        let emptyCustNameMsg = "<spring:message code="list.script.pleaseenterantitle1" text="이름을 입력해주세요"/>";
        let emptyCustTelMsg = "<spring:message code="list.script.pleaseenterantitle1" text="전화번호를 입력해주세요"/>";

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
