<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네  | <spring:message code="sidemenu.boardmanagement.platformannouncement1" text="온동네주문내역"/></title>
</head>

<style>
    .dvryServiceTd {
        display: none;
    }

    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    div.dataTables_wrapper div.dataTables_processing {
        position: absolute;
        z-index: 2;
        margin-top: 100px;
        padding: 2em 0;
        text-align: center;
    }

    #testTable th:nth-child(6),
    #testTable td:nth-child(6),
    #testTable th:nth-child(11),
    #testTable td:nth-child(11),
    #testTable th:nth-child(18),
    #testTable td:nth-child(18) {
        min-width: 260px !important;
    }

    table#testTable td,
    table#testTable th {
        padding: 9px;
        vertical-align: middle;
        border-top: 1px solid #e4e7ea;
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

    .goods-wrap {
        overflow-x: auto;
    }

    .goods-table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        min-width: 780px;
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
        padding: 9px 8px;
        border-top: 1px solid #eef1f4;
        font-size: 12px;
        color: #222;
        vertical-align: top;
        line-height: 1.4;
        word-break: break-word;
        text-align: center;
    }

    .goods-table tbody tr:first-child td {
        border-top: 0;
        text-align: center;
    }

    .muted {
        color: #98a1ab;
    }

    #deliveryStatusModal .summary-grid {
        grid-template-columns: repeat(5, minmax(0, 1fr));
    }

    #deliveryCurrentStatus {
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

    #deliveryCurrentStatus.is-ready {
        background: #fff8e6;
        color: #9a6700;
    }

    #deliveryCurrentStatus.is-moving {
        background: #eef7ff;
        color: #1864ab;
    }

    #deliveryCurrentStatus.is-done {
        background: #edf9f0;
        color: #2b8a3e;
    }

    #deliveryCurrentStatus.is-cancel {
        background: #fff1f3;
        color: #d63939;
    }

    @media (max-width: 1280px) {
        .summary-grid {
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }
    }

    @media (max-width: 768px) {
        .summary-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
</style>

<body>
<div id="page-loader" class="fade show"><span class="spinner"></span></div>

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <form name="frmSearch" id="frmSearch">
        <div id="content" class="content p-0">
            <div class="panel panel-inverse m-t-1">
                <div class="col-xs-auto p-t-20 p-b-0">
                    <ol class="breadcrumb float-xl-right">
                        <li class="breadcrumb-item"><a href="${path}/store/order/list"><spring:message code="sidemenu.boardmanagement1" text="가맹점"/></a></li>
                        <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="온동네주문내역"/></li>
                    </ol>
                    <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="온동네주문내역"/></h3>
                </div>

                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
                            <div class="search-field search-date">
                                <div class="search-label">등록기간 (최대 31일)</div>
                                <div class="search-control-group">
                                    <div class="date-input-wrap">
                                        <input type="text" class="form-control startDate background-white" name="startDate" value="${searchValue.startDate}" readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <span class="date-separator">~</span>
                                    <div class="date-input-wrap">
                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="search-field">
                                <span class="search-label">앱구분</span>
                                <div class="search-control-group">
                                    <c:if test="${empty appCode}">
                                        <select id="brandTypeCd" name="brandTypeCd" class="form-control">
                                            <option value="" selected>전체</option>
                                            <c:forEach var="appCodeList" items="${appVersionList}">
                                                <option value="${appCodeList.codeValue}" <c:if test="${searchValue.appCode == appCodeList.sysCode}">selected</c:if>>
                                                        ${appCodeList.codeName}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${!empty appCode}">
                                        <c:forEach var="appCodeList" items="${appVersionList}">
                                            <c:if test="${appCode == appCodeList.sysCode}">
                                                <input type="hidden" name="brandTypeCd" value="${appCodeList.codeValue}">
                                                <input type="text" class="form-control" value="${appCodeList.codeName}" disabled>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>

                            <div class="search-field">
                                <span class="search-label">주문상태</span>
                                <div class="search-control-group">
                                    <select class="form-control" name="ordStatus">
                                        <option value="" <c:if test="${searchValue.ordStatus == ''}">selected</c:if>>전체</option>
                                        <option value="1" <c:if test="${searchValue.ordStatus == '1'}">selected</c:if>>접수요청</option>
                                        <option value="2" <c:if test="${searchValue.ordStatus == '2'}">selected</c:if>>접수완료</option>
                                        <option value="3" <c:if test="${searchValue.ordStatus == '3'}">selected</c:if>>가맹점 확인</option>
                                        <option value="4" <c:if test="${searchValue.ordStatus == '4'}">selected</c:if>>배달중</option>
                                        <option value="5" <c:if test="${searchValue.ordStatus == '5'}">selected</c:if>>완료</option>
                                        <option value="6" <c:if test="${searchValue.ordStatus == '6'}">selected</c:if>>조리완료</option>
                                        <option value="7" <c:if test="${searchValue.ordStatus == '7'}">selected</c:if>>테이블주문접수</option>
                                        <option value="8" <c:if test="${searchValue.ordStatus == '8'}">selected</c:if>>대기</option>
                                        <option value="9" <c:if test="${searchValue.ordStatus == '9'}">selected</c:if>>호출</option>
                                        <option value="10" <c:if test="${searchValue.ordStatus == '10'}">selected</c:if>>입장완료</option>
                                        <option value="11" <c:if test="${searchValue.ordStatus == '11'}">selected</c:if>>예약요청</option>
                                        <option value="12" <c:if test="${searchValue.ordStatus == '12'}">selected</c:if>>예약확정</option>
                                        <option value="13" <c:if test="${searchValue.ordStatus == '13'}">selected</c:if>>취소</option>
                                        <option value="14" <c:if test="${searchValue.ordStatus == '14'}">selected</c:if>>노쇼</option>
                                        <option value="15" <c:if test="${searchValue.ordStatus == '15'}">selected</c:if>>배차</option>
                                    </select>
                                </div>
                            </div>

                            <div class="search-field">
                                <span class="search-label">주문구분</span>
                                <div class="search-control-group">
                                    <select class="form-control ordTypeSelect" name="ordType">
                                        <option value="" <c:if test="${searchValue.ordType == ''}">selected</c:if>>전체</option>
                                        <option value="1" <c:if test="${searchValue.ordType == '1'}">selected</c:if>>배달</option>
                                        <option value="2" <c:if test="${searchValue.ordType == '2'}">selected</c:if>>포장</option>
                                        <option value="3" <c:if test="${searchValue.ordType == '3'}">selected</c:if>>대기</option>
                                        <option value="4" <c:if test="${searchValue.ordType == '4'}">selected</c:if>>예약</option>
                                        <option value="5" <c:if test="${searchValue.ordType == '5'}">selected</c:if>>테이블</option>
                                        <option value="6" <c:if test="${searchValue.ordType == '6'}">selected</c:if>>택배배송</option>
                                        <option value="7" <c:if test="${searchValue.ordType == '7'}">selected</c:if>>오늘배송</option>
                                    </select>
                                </div>
                            </div>

                            <%--  <div class="search-field dvryServiceTd" <c:if test="${searchValue.ordType == 1}">style="display:flex;"</c:if>>
                                  <span class="search-label">배달서비스</span>
                                  <div class="search-control-group">
                                      <select class="form-control" name="dvryServiceType">
                                          <option value="" <c:if test="${searchValue.dvryServiceType == ''}">selected</c:if>>전체</option>
                                          <option value="1" <c:if test="${searchValue.dvryServiceType == '1'}">selected</c:if>>0원배달</option>
                                          <option value="2" <c:if test="${searchValue.dvryServiceType == '2'}">selected</c:if>>0순위배달</option>
                                      </select>
                                  </div>
                              </div>--%>

                            <div class="search-field search-keyword">
                                <span class="search-label">검색어</span>
                                <div class="search-control-group search-keyword-group">
                                    <select class="form-control searchOp" name="keywordType">
                                        <option value="ordCuTel" <c:if test="${searchValue.keywordType == 'ordCuTel'}">selected</c:if>>고객연락처</option>
                                        <option value="stName" <c:if test="${searchValue.keywordType == 'stName'}">selected</c:if>>가맹점명</option>
                                        <option value="ordNo" <c:if test="${searchValue.keywordType == 'ordNo'}">selected</c:if>>주문번호</option>
                                    </select>
                                    <input type="text" class="form-control" name="keyword" value="${searchValue.keyword}" maxlength="150" placeholder="검색어 입력">
                                </div>
                            </div>

                            <div class="search-actions">
                                <button type="button" class="btn btn-search-inline searchClick" onclick="searchFormFunction()">
                                    <i class="fa fa-search"></i> 검색
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-body">
                    <div class="panel-box table-panel-box">
                        <div class="table-scroll-wrap">
                            <table id="testTable" class="table compact-table table-striped">
                                <thead>
                                <tr class="text-center">
                                    <th class="align-middle">번호</th>
                                    <th class="align-middle">주문번호</th>
                                    <th class="align-middle">주문날짜</th>
                                    <th class="align-middle">주문구분</th>
                                    <%-- <th class="align-middle">배달서비스</th>--%>
                                    <th class="align-middle">주문상태</th>
                                    <th class="align-middle">가맹점이름</th>
                                    <th class="align-middle">총판</th>
                                    <th class="align-middle">마스터가맹점</th>
                                    <th class="align-middle">가맹점</th>
                                    <th class="align-middle">가맹점 전화번호</th>
                                    <th class="align-middle">매장 요청사항</th>
                                    <th class="align-middle">지불금액</th>
                                    <th class="align-middle">쿠폰 지불금액</th>
                                    <th class="align-middle">포인트 지불금액</th>
                                    <th class="align-middle">배달/택배비</th>
                                    <th class="align-middle">추천총판</th>
                                    <th class="align-middle">추천마스터가맹</th>
                                    <th class="align-middle">추천가맹</th>
                                    <th class="align-middle">추천배송원</th>
                                    <th class="align-middle">고객연락처</th>
                                    <th class="align-middle">배달주소</th>
                                    <th class="align-middle">이용횟수</th>
                                    <th class="align-middle">취소사유</th>
                                    <th class="align-middle">택배현황</th>
                                    <th class="align-middle">구매확정일자</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>

<div class="modal fade" id="deliveryStatusModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div>
                    <h5 class="modal-title mb-1">택배현황 상세</h5>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-0">
                <div class="detail-shell">
                    <div class="detail-section">
                        <div class="section-head">
                            <h4 class="section-title">택배 요약</h4>
                        </div>
                        <div class="section-body">
                            <div class="summary-grid">
                                <div class="summary-card">
                                    <div class="summary-label">주문번호</div>
                                    <div class="summary-value" id="deliveryOrdNo">-</div>
                                </div>
                                <div class="summary-card">
                                    <div class="summary-label">현재 상태</div>
                                    <div class="summary-value" id="deliveryCurrentStatus">-</div>
                                </div>
                                <div class="summary-card">
                                    <div class="summary-label">택배사</div>
                                    <div class="summary-value" id="deliveryDriverName">-</div>
                                </div>
                                <div class="summary-card">
                                    <div class="summary-label">송장번호</div>
                                    <div class="summary-value" id="deliveryDriverTel">-</div>
                                </div>
                                <div class="summary-card">
                                    <div class="summary-label">수령인</div>
                                    <div class="summary-value" id="deliveryAddress">-</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="detail-section">
                        <div class="section-head">
                            <h4 class="section-title">진행 상태</h4>
                        </div>
                        <div class="section-body">
                            <div class="delivery-progress-panel" id="deliveryProgressPanel">
                                <div class="delivery-progress-head">
                                    <div class="delivery-progress-head-left">
                                        <div class="delivery-progress-main-title">배송 진행 현황</div>
                                        <div class="delivery-progress-sub-title" id="deliveryProgressSubTitle">
                                            현재 진행중인 단계만 강조해서 표시합니다.
                                        </div>
                                    </div>
                                    <div class="delivery-progress-status-badge" id="deliveryProgressStatusBadge">진행중</div>
                                </div>

                                <div class="delivery-progress-bar-wrap">
                                    <div class="delivery-progress-bar-track">
                                        <div class="delivery-progress-bar-fill" id="deliveryProgressBarFill"></div>
                                    </div>
                                </div>

                                <div class="delivery-progress-steps" id="deliveryProgressSteps">
                                    <div class="delivery-progress-step" data-step="1">
                                        <div class="delivery-progress-step-index">1</div>
                                        <div class="delivery-progress-step-title">배송준비</div>
                                        <div class="delivery-progress-step-desc">접수 및 등록</div>
                                    </div>

                                    <div class="delivery-progress-step" data-step="2">
                                        <div class="delivery-progress-step-index">2</div>
                                        <div class="delivery-progress-step-title">집하완료</div>
                                        <div class="delivery-progress-step-desc">물품 인수 완료</div>
                                    </div>

                                    <div class="delivery-progress-step" data-step="3">
                                        <div class="delivery-progress-step-index">3</div>
                                        <div class="delivery-progress-step-title">배송진행중</div>
                                        <div class="delivery-progress-step-desc">이동 중</div>
                                    </div>

                                    <div class="delivery-progress-step" data-step="4">
                                        <div class="delivery-progress-step-index">4</div>
                                        <div class="delivery-progress-step-title">지점도착</div>
                                        <div class="delivery-progress-step-desc">배송 지점 도착</div>
                                    </div>

                                    <div class="delivery-progress-step" data-step="5">
                                        <div class="delivery-progress-step-index">5</div>
                                        <div class="delivery-progress-step-title">배송출발</div>
                                        <div class="delivery-progress-step-desc">최종 배송 출발</div>
                                    </div>

                                    <div class="delivery-progress-step" data-step="6">
                                        <div class="delivery-progress-step-index">6</div>
                                        <div class="delivery-progress-step-title">배송완료</div>
                                        <div class="delivery-progress-step-desc">전달 완료</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="detail-section">
                        <div class="section-body p-0">
                            <div class="goods-wrap">
                                <table class="goods-table">
                                    <thead>
                                    <tr>
                                        <th style="width: 60px;">No</th>
                                        <th style="width: 200px;">상태</th>
                                        <th style="width: 180px;">시간</th>
                                        <th style="width: 180px;">위치</th>
                                        <th>상세내용</th>
                                    </tr>
                                    </thead>
                                    <tbody id="deliveryHistoryTableBody">
                                    <tr>
                                        <td colspan="5" class="text-center muted">진행 이력이 없습니다.</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>

    var table;

    $(() => {
        let allChkStatus = "${searchValue.ordType}";
        if (allChkStatus == "") {
            $("#ex_chk_all_status").click();
        }

        $("#ex_chk_all_status").click(function () {
            $(".ordType").prop('checked', this.checked);
        });

        let downloadAble = `${downloadAble}`;
        let roleType = `${sessionScope.sessionKey.roleType}`;
        let downloadChk = "1";

        if (roleType != 0) {
            if (downloadAble == 1) {
                downloadChk = "";
            }
        } else {
            downloadChk = "";
        }

        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/order/list", "A2", downloadChk, true, {
            responsive: false,
            sScrollX: "100%",
            sScrollXInner: "100%",
            bScrollCollapse: true,
            autoWidth: false,
            fnInitComplete: function () {
                $(window).resize();
            },
            fnDrawCallback: function () {
                $(window).trigger('resize');
            },
            columns: [
                {data: "listIndex"},
                {data: "ordNo"},
                {data: "ordDate"},
                {data: "ordType"},
                /*{data: "dvryServiceType"},*/
                {data: "ordStatus"},
                {data: "stName"},
                {data: "brCode"},
                {data: "masterStCode"},
                {data: "ordStCode"},
                {data: "stTel"},
                {data: "ordCuStMemo"},
                {data: "payAmt"},
                {data: "couponAmt"},
                {data: "pointUseAmt"},
                {data: "srvAmt"},
                {data: "extBrCode"},
                {data: "extMasterStCode"},
                {data: "extRecommStCode"},
                {data: "extRecommWkCode", defaultContent: "-"},
                {data: "ordCuTel"},
                {data: "eaAddr4"},
                {data: "totalUseCount"},
                {data: "cancelMemo"},
                {data: "deliveryTrackingStatus"},
                {data: "endDate"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {
                    targets: 2,
                    render: function (data) {
                        return dateFormat(data);
                    }
                },
                {
                    targets: 3,
                    render: function (data) {
                        const text = orderType(data);
                        if (String(data) === '1') return "<span class='text-primary'>" + text + "</span>";
                        if (String(data) === '4') return "<span class='text-warning'>" + text + "</span>";
                        return "<span class='text-strong'>" + text + "</span>";
                    }
                },
                /*  {
                      targets: 4,
                      render: function (data) {
                          if (data == 1) return "<span class='text-primary'>0원배달</span>";
                          if (data == 2) return "<span class='text-warning'>0순위배달</span>";
                          return "<span class='text-subtle'>-</span>";
                      }
                  },*/
                {
                    targets: 4,
                    render: function (data, type, row) {
                        if(row.ordType === '6' || row.ordType === '7') {
                            if (!data) return "";
                            const text = orderStatus(data);
                            if (String(data) === '5') return "<span class='text-success'> 구매확정 </span>";
                            if (String(data) === '3') return "<span class='text-success'> 가맹점 확인 </span>";
                            if (String(data) === "4") {
                                if (row.deliveryTrackingStatus === "6") {
                                    return "<span class='text-success'>배송완료</span>";
                                }

                                return "<span class='text-primary'>배송중</span>";
                            }
                            if (String(data) === '13') return "<span class='text-danger'>" + text + "</span>";
                            return "<span class='text-strong'>" + text + "</span>";

                        } else {
                            if (!data) return "";
                            const text = orderStatus(data);
                            if (String(data) === '5') return "<span class='text-success'>" + text + "</span>";
                            if (String(data) === '13') return "<span class='text-danger'>" + text + "</span>";
                            if (String(data) === '4' || String(data) === '15') return "<span class='text-primary'>" + text + "</span>";
                            return "<span class='text-strong'>" + text + "</span>";
                        }
                    }
                },
                {
                    targets: 5,
                    width: "250px",
                    render: function (data, type, row) {
                        const name = row.stName || '-';
                        return "<div class='cell-inline' style='text-align:left;'><div class='text-strong text-center'>" + name + "</div></div>";
                    }
                },
                {
                    targets: 8,
                    visible: true,
                    render: function (data, type, row) {
                        const code = row.ordStCode || '-';
                        return "<div class='cell-inline'><div class='text-subtle'><span class='text-code'>" + code + "</span></div></div>";
                    }
                },
                {
                    targets: [11, 12, 13, 14],
                    render: function (data) {
                        return $.fn.dataTable.render.number(',').display(data || 0) + " 원";
                    }
                },
                {
                    targets: [9, 18],
                    render: function (data) {
                        return phoneHyphen(data);
                    }
                },
                {
                    targets: 21,
                    render: function (data) {
                        return countString(data, "회");
                    }
                },
                {
                    targets: 23,
                    orderable: false,
                    searchable: false,
                    render: function (data, type, row) {
                        var ordType = String(row.ordType || '');

                        if (ordType !== '6') {
                            return "<span class='text-subtle'>-</span>";
                        }

                        if (!row.logisticsNo) {
                            return "<span class='text-subtle'>-</span>";
                        }

                        const meta = getDeliveryStatusMeta(
                            row.deliveryTrackingStatus || row.statusCode,
                            row.deliveryTrackingStatusName || row.statusName
                        );

                        var statusClass = "text-strong";
                        if (meta.tone === 'ready') statusClass = "text-warning";
                        else if (meta.tone === 'moving') statusClass = "text-primary";
                        else if (meta.tone === 'done') statusClass = "text-success";
                        else if (meta.tone === 'cancel') statusClass = "text-danger";

                        return "<span class='open-delivery-status " + statusClass + "' " +
                            "data-ord-no='" + row.ordNo + "' " +
                            "data-logistics-no='" + row.logisticsNo + "' " +
                            "style='cursor:pointer; text-decoration:underline;'>" +
                            meta.text +
                            "</span>";
                    }
                },
                {
                    targets: 24,
                    render: function (data, type, row) {
                        var ordType = String(row.ordType || '');

                        if (ordType === '6') {
                            return dateFormat(data);
                        } else {
                            return '-';
                        }

                    }
                },
            ]
        });

        $("#testTable").on('click', 'tbody td', function () {
            var row = $("#testTable").DataTable().row($(this).parents("tr")).data();

            if(row){
                var colIdx = $(this)[0]._DT_CellIndex.column;

                if (colIdx === 22) {
                    return;
                }
                location.href = "${path}/store/order/detail?ordNo=" + row.ordNo;
            }
        });

        $(document).on('click', '.open-delivery-status', function () {
            const ordNo = $(this).data('ord-no');
            const logisticsNo = $(this).data('logistics-no');

            $.ajax({
                url: '${path}/api/order/deliveryStatus',
                type: 'GET',
                data: {
                    ordNo: ordNo,
                    logisticsNo: logisticsNo
                },
                success: function (res) {
                    const payload = res.data || res || {};
                    payload.historyList = payload.historyList || payload.list || payload.history || [];
                    openDeliveryStatusModal(payload);
                },
                error: function () {
                    alert('택배현황 정보를 불러오지 못했습니다.');
                }
            });
        });

        $(document).on("change", ".ordTypeSelect", function () {
            let thisVal = $(this).val();
            if (thisVal == 1) $(".dvryServiceTd").css("display", "flex");
            else $(".dvryServiceTd").css("display", "none");
        });

        dateSetting();
    });

    function normalizeDateOnly(value) {
        if (!value) return "";
        const match = String(value).match(/\d{4}-\d{2}-\d{2}/);
        return match ? match[0] : "";
    }

    function formatDateToYmd(date) {
        const year1 = date.getFullYear();
        const month1 = String(date.getMonth() + 1).padStart(2, '0');
        const day1 = String(date.getDate()).padStart(2, '0');
        return year1 + "-" + month1 + "-" + day1;
    }

    function addDays(dateString, days) {
        const normalized = normalizeDateOnly(dateString);
        if (!normalized) return null;
        const parts = normalized.split('-').map(Number);
        const date = new Date(parts[0], parts[1] - 1, parts[2]);
        date.setDate(date.getDate() + days);
        return date;
    }

    function searchFormFunction() {
        let startDate = normalizeDateOnly($(".startDate").val());
        let endDate = normalizeDateOnly($(".endDate").val());

        $(".startDate").val(startDate);
        $(".endDate").val(endDate);

        if (startDate && endDate && getDateDiff(startDate, endDate) > 31) {
            const adjustedEndDateObj = addDays(startDate, 31);
            const adjustedEndDate = formatDateToYmd(adjustedEndDateObj);

            $(".endDate").datepicker('setDate', adjustedEndDateObj);
            $(".endDate").val(adjustedEndDate);
        }

        var numCols = table.columns().nodes().length;
        for (var i = 0; i < numCols; i++) {
            table.column(i).search('');
        }

        table.column().draw();
    }

    function formatHistoryDate(value) {
        if (!value) return '-';
        return dateFormat(value);
    }

    function setDeliveryWizard(data, historyList) {
        const wizardState = getCurrentStep(data, historyList);

        // 진행 단계와 상태 배지가 같은 최신 상태코드를 사용하도록 통일
        const currentCode = String(wizardState.statusCode || '');

        const meta = getDeliveryStatusMeta(
            currentCode,
            data.currentStatusName || data.statusName
        );

        const badgeClass = getDeliveryBadgeClass(
            currentCode,
            data.currentStatusName || data.statusName
        );

        const currentStep = Number(wizardState.step || 1);
        const isCancel = wizardState.isCancel;

        const $panel = $('#deliveryProgressPanel');
        const $steps = $('#deliveryProgressSteps .delivery-progress-step');
        const $fill = $('#deliveryProgressBarFill');
        const $badge = $('#deliveryProgressStatusBadge');
        const $subTitle = $('#deliveryProgressSubTitle');

        $panel.removeClass('is-cancel');
        $steps.removeClass('is-complete is-active');

        $badge
            .removeClass('is-ready is-moving is-done is-cancel')
            .addClass(badgeClass)
            .text(meta.text);

        /*
         * 반송/취소 상태
         * 모든 단계를 미체크 상태로 유지
         */
        if (isCancel) {
            $panel.addClass('is-cancel');
            $fill.css('width', '0%');
            $subTitle.text('반송 또는 취소된 상태입니다.');
            return;
        }

        /*
         * 정상 배송 상태일 때만
         * 완료/현재 단계를 표시
         */
        $steps.each(function () {
            const stepNo = Number($(this).data('step'));

            if (stepNo < currentStep) {
                $(this).addClass('is-complete');
            } else if (stepNo === currentStep) {
                $(this).addClass('is-active');
            }
        });

        let progressPercent = 0;

        if (currentStep === 1) progressPercent = 8;
        else if (currentStep === 2) progressPercent = 24;
        else if (currentStep === 3) progressPercent = 42;
        else if (currentStep === 4) progressPercent = 58;
        else if (currentStep === 5) progressPercent = 78;
        else if (currentStep >= 6) progressPercent = 100;

        $fill.css('width', progressPercent + '%');

        if (currentStep === 1) {
            $subTitle.text('배송 등록 및 준비가 진행 중입니다.');
        } else if (currentStep === 2) {
            $subTitle.text('상품 집하가 완료되었습니다.');
        } else if (currentStep === 3) {
            $subTitle.text('배송이 진행 중입니다.');
        } else if (currentStep === 4) {
            $subTitle.text('배송 지점에 도착했습니다.');
        } else if (currentStep === 5) {
            $subTitle.text('최종 배송을 위해 출발했습니다.');
        } else if (currentStep === 6) {
            $subTitle.text('배송이 완료되었습니다.');
        } else {
            $subTitle.text('현재 진행중인 단계만 강조해서 표시합니다.');
        }
    }

    function renderDeliveryHistoryTable(historyList) {
        const $tbody = $('#deliveryHistoryTableBody');
        $tbody.empty();

        if (!historyList || historyList.length === 0) {
            $tbody.append("<tr><td colspan='5' class='history-empty-cell'>진행 이력이 없습니다.</td></tr>");
            return;
        }

        historyList.forEach(function (item, index) {
            const statusText = getHistoryStatusText(item);
            const statusClass = getHistoryStatusClass(item);
            const transDate = formatHistoryDate(item.transDate || item.time || item.regDate || item.date);
            const location = item.location || item.where || item.addr || '-';
            const description = item.description || item.contents || item.detail || item.message || '-';

            const rowHtml =
                "<tr>" +
                "<td style='text-align:center;'>" + (index + 1) + "</td>" +
                "<td style='text-align:center;'><span class='history-status " + statusClass + "'>" + statusText + "</span></td>" +
                "<td style='text-align:center;'>" + transDate + "</td>" +
                "<td style='text-align:center;'>" + location + "</td>" +
                "<td>" + description + "</td>" +
                "</tr>";

            $tbody.append(rowHtml);
        });
    }

    function openDeliveryStatusModal(data) {
        const historyList = data.historyList || [];
        const wizardState = getCurrentStep(data, historyList);

        // 모달 요약 상태도 진행 단계와 동일한 최신 상태코드를 사용
        const currentCode = String(wizardState.statusCode || '');
        const meta = getDeliveryStatusMeta(
            currentCode,
            data.currentStatusName || data.statusName
        );

        $('#deliveryOrdNo').text(data.ordNo || '-');
        $('#deliveryCurrentStatus').text(meta.text);
        $('#deliveryDriverName').text(data.courierName || data.deliveryCompanyName || '-');
        $('#deliveryDriverTel').text(data.trackingNum || data.logisticsNo || '-');
        $('#deliveryAddress').text(data.receiverName || data.recvName || '-');

        setDeliveryWizard(data, historyList);
        renderDeliveryHistoryTable(historyList);

        $('#deliveryStatusModal').modal('show');
    }
</script>
</body>
</html>
