<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.platformno리ticeregistration12" text="회원 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | <spring:message code="list.detail.platformno리ticeregistration12" text="회원 관리"/></title>
    </c:if>
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
    #drawingMap,#drawingMapType , #map {width: 100%;height: 648px;}
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
    .border-bottom-d4 td {
       border:  1px solid #d6d6d6;
    }
    label {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        cursor: pointer;
    }

    [type="checkbox"] {
        appearance: none;
        position: relative;
        border: max(2px, 0.1em) solid gray;
        border-radius: 1.25em;
        width: 2.25em;
        height: 1.25em;
    }

    [type="checkbox"]::before {
        content: "";
        position: absolute;
        left: 0;
        width: 1em;
        height: 1em;
        border-radius: 50%;
        transform: scale(0.8);
        background-color: gray;
        transition: left 250ms linear;
    }

    [type="checkbox"]:checked {
        background-color: tomato;
        border-color: tomato;
    }

    [type="checkbox"]:checked::before {
        background-color: white;
        left: 1em;
    }

    [type="checkbox"]:disabled {
        border-color: lightgray;
        opacity: 0.7;
        cursor: not-allowed;
    }

    [type="checkbox"]:disabled:before {
        background-color: lightgray;
    }

    [type="checkbox"]:disabled + span {
        opacity: 0.7;
        cursor: not-allowed;
    }

    [type="checkbox"]:focus-visible {
        outline-offset: max(2px, 0.1em);
        outline: max(2px, 0.1em) solid tomato;
    }

    [type="checkbox"]:enabled:hover {
        box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    div.dataTables_wrapper div.dataTables_processing {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 200px;
        margin-left: -100px;
        margin-top: -26px;
        text-align: center;
        padding: 1em 0;
        z-index: 5;
        top: 150px;
        border:1px solid #ddd;
    }
    .cust-coupon-list {
        width: 100%;
    }
    #searchCouponCustTab{
        border-bottom: 1px solid #e4e7ea !important;
    }
    .panel-box {
        background: #fff;
        border: 1px solid #ddd;
    }

</style>
<style>
    /* =========================
       고객 상세 개선 디자인
       ========================= */

    .cust-detail-page {
        color: #222;
        font-size: 12px;
    }

    .cust-detail-header {
        padding: 20px 15px 8px 15px;
    }

    .cust-detail-title {
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
        grid-template-columns: repeat(3, minmax(0, 1fr));
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
        border: 1px solid #e8ebef;
        background: #fafbfc;
        font-size: 12px;
        font-weight: 700;
        color: #555;
    }



    .compact-table .form-control {
        height: 32px;
        font-size: 12px;
        border-radius: 0;
    }

    .field-help {
        display: none;
        margin-top: 4px;
        font-size: 11px;
        color: #9aa3ad;
        font-weight: 500;
    }

    .inline-radio-group,
    .inline-check-group {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        align-items: center;
    }

    .radio-chip {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        min-height: 28px;
        padding: 5px 9px;
        border: 1px solid #dfe3e8;
        background: #fff;
        cursor: pointer;
    }

    .radio-chip input[type="radio"] {
        width: auto;
        height: auto;
        appearance: auto;
        margin: 0;
    }
    .compact-table th {
        min-width: 10px;
    }
    .switch-card {
        display: inline-flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        min-width: 170px;
        padding: 5px 10px;
        border: 1px solid #dfe3e8;
        background: #fff;
    }

    .badge-code {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 20px;
        padding: 2px 7px;
        margin-right: 4px;
        background: #eef2f7;
        color: #334155;
        font-weight: 800;
        font-size: 11px;
    }

    .status-green {
        color: #1f7a3d;
        font-weight: 700;
    }

    .status-red {
        color: #d63939;
        font-weight: 700;
    }

    .status-orange {
        color: #f08c00;
        font-weight: 700;
    }

    .status-gray {
        color: #7a828a;
        font-weight: 700;
    }

    .muted {
        color: #98a1ab;
    }

    .simple-table-wrap {
        overflow-x: auto;
        border: 1px solid #e8ebef;
    }

    .simple-table {
        width: 100%;
        min-width: 520px;
        margin-bottom: 0;
        border-collapse: collapse;
        table-layout: fixed;
    }

    .simple-table thead th {
        background: #f8f9fb;
        color: #555;
        font-size: 12px;
        font-weight: 700;
        padding: 9px 8px;
        border-bottom: 1px solid #dfe3e8;
        text-align: center;
    }

    .simple-table tbody td {
        padding: 8px;
        border-top: 1px solid #eef1f4;
        font-size: 12px;
        color: #222;
        vertical-align: middle;
        line-height: 1.4;
        word-break: break-word;
        text-align: center;
    }

    .scroll-y-box {
        max-height: 190px;
        overflow-y: auto;
    }

    .bottom-actions {
        margin-top: 12px;
        display: flex;
        justify-content: space-between;
        gap: 8px;
    }

    .bottom-actions .btn {
        min-width: 82px;
        height: 34px;
        border-radius: 0 !important;
        font-size: 12px;
        font-weight: 600;
        box-shadow: none !important;
        display: inline-flex;
        align-items: center;
        justify-content: center;
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
    }

    @media (max-width: 768px) {
        .summary-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }

        .compact-table th {
            width: 100px;
        }

        .switch-card {
            min-width: 100%;
        }
    }
    /* 기존 main-grid 대신 사용 */
    .info-grid {
        display: grid;
        grid-template-columns: minmax(0, 0.7fr) minmax(0, 1.3fr);
        gap: 10px;
        align-items: start;
    }

    .info-grid .panel-box {
        margin-top: 0;
        border: 0px;
    }

    .panel-box {
        border: 1px solid #d9dee3;
        background: #fff;
    }


    .panel-box-body {
        padding: 0;
    }








    .simple-table {
        width: 100%;
        min-width: 520px;
        margin-bottom: 0;
        border-collapse: collapse;
        table-layout: fixed;
    }


    .scroll-y-box {
        max-height: 190px;
        overflow-y: auto;
    }

    .status-green {
        color: #1f7a3d;
        font-weight: 700;
    }

    .status-red {
        color: #d63939;
        font-weight: 700;
    }

    .status-orange {
        color: #f08c00;
        font-weight: 700;
    }

    .status-gray {
        color: #7a828a;
        font-weight: 700;
    }

    .muted {
        color: #98a1ab;
    }

    @media (max-width: 992px) {
        .info-grid {
            grid-template-columns: 1fr;
        }

        .switch-row {
            grid-template-columns: 1fr;
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement12" text="사용자 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="회원 관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration12" text="고객 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration1" text="고객 상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation12" text="기본정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation12" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation12" text="보유쿠폰"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation12" text="보유쿠폰"/></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <form name="update_form" id="update_form" class="update_form">
                        <input class="custNo" type="hidden" name="custNo" value="${tbCust.custNo}">

                        <div class="detail-shell">

                            <!-- 고객 요약 -->
                            <div class="detail-section">
                                <div class="section-head">
                                    <h4 class="section-title">고객 요약</h4>
                                </div>

                                <div class="section-body">
                                    <div class="summary-grid">
                                        <div class="summary-card">
                                            <div class="summary-label">로그인 ID</div>
                                            <div class="summary-value">${tbCust.loginId}</div>
                                        </div>

                                        <div class="summary-card">
                                            <div class="summary-label">회원여부</div>
                                            <div class="summary-value">
                                                <c:choose>
                                                    <c:when test="${tbCust.isMember == 1}">
                                                        <span class="status-green">회원</span>
                                                    </c:when>
                                                    <c:when test="${tbCust.isMember == 0}">
                                                        <span class="status-gray">비회원</span>
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="summary-card">
                                            <div class="summary-label">계정 상태</div>
                                            <div class="summary-value">
                                                ${tbCust.insertDate}
                                            </div>
                                        </div>

                                        <div class="summary-card">
                                            <div class="summary-label">누적주문횟수</div>
                                            <div class="summary-value">${tbCust.useCount} 회</div>
                                        </div>
                                        <div class="summary-card">
                                            <div class="summary-label">추천가맹점명</div>
                                            <div class="summary-value">
                                                <c:if test="${tbCust.extRecommStCode}">
                                                    <span class="badge-code">${tbCust.extRecommStCode}</span>
                                                </c:if>
                                                ${tbCust.extRecommStName}
                                            </div>
                                        </div>
                                        <div class="summary-card">
                                            <div class="summary-label">추천인</div>
                                            <div class="summary-value">
                                                <c:choose>
                                                    <c:when test="${tbCust.recommCustName != null}">
                                                        ${tbCust.recommCustName} (${tbCust.recommCustTel})
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="muted">추천인 없음</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 상세 정보 -->
                            <div class="detail-section">
                                <div class="section-body">
                                    <div class="info-grid">

                                        <!-- 기본 정보 -->
                                        <div class="panel-box">
                                            <div class="panel-box-body">
                                                <table class="compact-table">
                                                    <tbody>
                                                    <tr>
                                                        <th>플랫폼 구분</th>
                                                        <td>
                                                            <div class="inline-radio-group">
                                                                <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                                    <label class="radio-chip">
                                                                        <input type="radio" name="platformType" value="2" checked>
                                                                        <span>온동네</span>
                                                                    </label>
                                                                </c:if>

                                                                <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                                    <label class="radio-chip">
                                                                        <input type="radio" name="platformType" value="1" checked>
                                                                        <span>제시카</span>
                                                                    </label>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>이름 </th>
                                                        <td>
                                                            <input type="text" name="custName" class="form-control" value="${tbCust.custName}">
                                                            <span class="field-help">고객 이름을 입력하세요.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>휴대폰 번호</th>
                                                        <td>
                                                            <input type="text" name="custTel" class="form-control" value="${tbCust.custTel}">
                                                            <span class="field-help">고객 이름을 입력하세요.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>성별</th>
                                                        <td>
                                                            <div class="inline-radio-group">
                                                                <label class="radio-chip">
                                                                    <input type="radio" name="gender" class="gender" value="M" <c:if test="${tbCust.gender == 'M'}">checked</c:if>>
                                                                    <span>남자</span>
                                                                </label>

                                                                <label class="radio-chip">
                                                                    <input type="radio" name="gender" class="gender" value="F" <c:if test="${tbCust.gender == 'F'}">checked</c:if>>
                                                                    <span>여자</span>
                                                                </label>

                                                                <label class="radio-chip">
                                                                    <input type="radio" name="gender" class="gender" value="N" <c:if test="${tbCust.gender == 'N'}">checked</c:if>>
                                                                    <span>알수없음</span>
                                                                </label>
                                                            </div>
                                                            <span class="field-help">성별을 선택하세요.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>계정 상태</th>
                                                        <td>
                                                            <div class="inline-radio-group">
                                                                <label class="radio-chip">
                                                                    <input type="radio" name="dataStatus" class="dataStatus" value="0" <c:if test="${tbCust.dataStatus == 0}">checked</c:if>>
                                                                    <span>삭제</span>
                                                                </label>

                                                                <label class="radio-chip">
                                                                    <input type="radio" name="dataStatus" class="dataStatus" value="1" <c:if test="${tbCust.dataStatus == 1}">checked</c:if>>
                                                                    <span>정상</span>
                                                                </label>

                                                                <label class="radio-chip">
                                                                    <input type="radio" name="dataStatus" class="dataStatus" value="2" <c:if test="${tbCust.dataStatus == 2}">checked</c:if>>
                                                                    <span>정지</span>
                                                                </label>
                                                            </div>
                                                            <span class="field-help">계정 상태를 선택하세요.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>수신 여부</th>
                                                        <td>
                                                            <div class="switch-row">
                                                                <label class="switch-card">
                                                                    <span>주문 PUSH 수신</span>
                                                                    <input role="switch" type="checkbox" name="pushOrderYn" class="pushOrderYn" <c:if test="${tbCust.pushOrderYn == 1}">checked</c:if>>
                                                                </label>
                                                                <br>
                                                                <label class="switch-card mt-1">
                                                                    <span>마케팅 PUSH 수신</span>
                                                                    <input role="switch" type="checkbox" name="pushMarketingYn" class="pushMarketingYn" <c:if test="${tbCust.pushMarketingYn == 1}">checked</c:if>>
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- 계정 / 추천 정보 -->
                                        <div class="panel-box">
                                            <div class="panel-box-body">
                                                <table class="compact-table">
                                                    <tbody>
                                                    <tr>
                                                        <th>친구수 (${tbCust.recommCount} 명)</th>
                                                        <td>
                                                            <div class="panel-body">
                                                                <table id="testTable" class="display table table-bordered w-100 table-striped  ">
                                                                    <thead>
                                                                    <tr><th class="text-center" style="width: 46px">순번</th>
                                                                        <th class="text-center" style="width: 84px;">이름</th>
                                                                        <th class="text-center" style="width: 98px;">전화번호</th>
                                                                        <th class="text-center" style="width: 98px;">이용횟수</th>
                                                                        <th class="text-center" style="width: 98px;">가입일</th>
                                                                    </tr></thead>
                                                                </table>
                                                            </div>
                                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e; overflow: auto; height: 89px;">
                                                                <ul class="attachList p-0" style="margin-bottom:0px;">
                                                                    <li>
                                                                        <div class="panel-body">
                                                                            <table id="areaTable" class="display table table-bordered w-100 table-striped border-bottom-d4">
                                                                                <tbody>



                                                                                <c:choose>
                                                                                    <c:when test="${friends.size() > 0}">
                                                                                        <c:forEach items="${friends}" var="item" varStatus="status" step="1">
                                                                                            <tr>
                                                                                                <td>${status.index + 1}</td>
                                                                                                <td>${item.custName}</td>
                                                                                                <td class="formatPhone">${item.custTel}</td>
                                                                                                <td>${item.useCount} 회</td>
                                                                                                <td>${item.insertdate}</td>
                                                                                            </tr>
                                                                                        </c:forEach>
                                                                                    </c:when>

                                                                                    <c:otherwise>
                                                                                        <tr>
                                                                                            <td colspan="5" class="text-center">데이터가 없습니다.</td>
                                                                                        </tr>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th><spring:message code="list.detail.map" text="지역"/></th>
                                                        <td>
                                                            <div class="panel-body">
                                                                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                                                                    <thead>
                                                                    <th class="text-center" style="width:46px;"><spring:message code="list.word.no" text="순번"/></th>
                                                                    <th class="text-center" style="width:54px" >시/도</th>
                                                                    <th class="text-center" style="width:58px;">시/군/구</th>
                                                                    </thead>
                                                                </table>
                                                            </div>
                                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e; height: 89px;">
                                                                <ul class="attachList p-0" style="margin-bottom:0px;" >
                                                                    <li >
                                                                        <div class="panel-body">
                                                                            <table id="areaTable" class="display table table-bordered w-100 table-striped ">
                                                                                <tbody>
                                                                                <c:choose>
                                                                                    <c:when test="${tbCustLocation.size() > 0}">
                                                                                        <c:forEach items="${tbCustLocation}" var="item" varStatus="status" step="1">
                                                                                            <tr class="" >
                                                                                                <td style="width:46px;" class="text-center">${status.index + 1}</td>
                                                                                                <td style="width:54px" class="text-center">${item.codeName1}</td>
                                                                                                <td style="width:58px;" class="text-center">${item.codeName2}</td>
                                                                                            </tr>
                                                                                        </c:forEach>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <tr class="" >
                                                                                            <td colspan="3" class="text-center"> 데이터가 없습니다. </td>
                                                                                        </tr>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>지역상세</th>
                                                        <td>
                                                            <input type="text" class="form-control w-100" name="addr5" value="${tbStore.addr5}" maxlength="200">
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 주소 / 지역 -->
                                        <div class="panel-box">
                                            <div class="panel-box-body d-flex">
                                                <div class="p-12">

                                                    <span class="field-help">등록되어있는 시/도 시/군/구입니다. 변경불가</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="bottom-actions">
                        <button type="button" class="btn btn-primary btn_list">
                            <i class="fa fa-list"></i>
                            <span class="m-l-5">목록</span>
                        </button>

                        <c:if test="${permission == 2}">
                            <button type="button" class="btn btn-primary btn_up">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5">수정</span>
                            </button>
                        </c:if>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                   <%-- <div style="width: 100%;">
                        <form class="form-provide-search" id="form-provide-search">
                            <div class="search-box">
                                <div class="inner-search-box">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 ">
                                            <input class="cpnNo" type="hidden" name="custNo" value="${tbCust.custNo}">
                                            <table  class="table table-condensed table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td class="bg-light"><strong><spring:message code="list.search.registrationperiod1" text="생성일"/></strong></td>
                                                    <td>
                                                        <label>
                                                            <input type="text" class="form-control periodS background-white"  name="periodS" value="" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                        </label>
                                                        <label>
                                                            <input type="text" class="form-control periodE background-white" name="periodE" value="" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                        </label>
                                                    </td>
                                                    <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="쿠폰 사용 여부"/></strong></td>
                                                    <td style="border-right: none">
                                                        <select class="form-control" name="useYn">
                                                            <option value="" value=""/>전체</option>
                                                            <option value="Y"/>사용</option>
                                                            <option value="N"/>미사용</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="검색어 입력"/></strong></td>
                                                    <td style="border-right: none" colspan="3">
                                                        <label>
                                                            <select class="form-control keywordType" name="keywordType" style="width: 110px">
                                                                <option value="cpnCode" ><spring:message code="list.search.title1" text="쿠폰코드"/></option>
                                                            </select>
                                                            <input type="text" class="form-control width-150" name="cpnCode" value="" maxlength="150">
                                                            <input type="button" class="btn btn-primary searchCouponProvide" style="margin-bottom: 3px;" value="검색">
                                                        </label>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>--%>
                    <div class="list m-t-10">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xl-12 ui-sortable">
                                    <div class="card_">
                                        <div class="card-bod">
                                            <div class="panel-body">
                                                <%--/<table id="searchCouponCustTab" class="display table table-bordered w-100 table-striped cust-list " style="width:100%">--%>
                                                <table id="searchCouponCustTab" class="display table table-bordered  table-striped cust-coupon-list">
                                                    <thead>
                                                        <th class="text-center" style="width: 50px;" >번호</th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰일련번호"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰명"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰코드"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="할인금액(할인율)"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용가능 주문금액"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="최대 할인금액"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용가능일"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용만료일"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용여부"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용일"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="주문번호"/></th>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
<%@include file="../../../common/include_kakao_map_js.jsp" %>
<script>

    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            } else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    var newExportAction = function (e, dt, button, config) {
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;

        dt.one('preXhr', function (e, s, data) {
            data.start = 0;
            data.length = 2147483647;

            dt.one('preDraw', function (e, settings) {
                oldExportAction(self, e, dt, button, config);

                dt.one('preXhr', function (e, s, data) {
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });

                setTimeout(function () {
                    dt.ajax.reload(null, false);
                }, 0);

                return false;
            });
        });

        dt.ajax.reload();
    };

    let table = null;

    $(() => {
        table = $("#searchCouponCustTab").DataTable({
            language: {
                lang_set,
                "processing": "데이터 불러오는 중...",
                "info": "총 _TOTAL_ 건",
                "infoEmpty": "총 0 건",
                "emptyTable": "데이터가 없습니다.",
                "zeroRecords": "검색 결과가 없습니다."
            },

            serverSide: false,
            processing: true,
            paging: false,
            searching: true,
            ordering: true,
            responsive: false,
            bAutoWidth: false,
            scrollCollapse: true,
            scrollY: '50vh',

            columns: [
                { data: "listIndex", defaultContent: "" },
                { data: "cuCpnNo", defaultContent: "" },
                { data: "cpnTitle", defaultContent: "" },
                {
                    data: "cpnCode",
                    defaultContent: "",
                    render: function (data) {
                        return data ? data : "";
                    }
                },
                {
                    data: "disTypeText",
                    defaultContent: "",
                    render: function (data) {
                        if (!data) {
                            return "-";
                        }

                        if (data.disType == "1") {
                            return countString(data.discountAmt, "원");
                        }

                        if (data.disType == "2") {
                            return countString(data.discountAmt, "%");
                        }

                        return "-";
                    }
                },
                {
                    data: "cpnUseLimit",
                    defaultContent: "",
                    render: function (data) {
                        if (data === null || data === undefined || data === "") {
                            return "-";
                        }

                        return countString(data, "원");
                    }
                },
                {
                    data: "maxDisAmt",
                    defaultContent: "",
                    render: function (data) {
                        if (data === null || data === undefined || data === "") {
                            return "-";
                        }

                        return countString(data, "원");
                    }
                },
                {
                    data: "validateFrom",
                    defaultContent: "",
                    render: function (data) {
                        if (!data) {
                            return "";
                        }

                        return dateFormatYYYYMMDD(data);
                    }
                },
                {
                    data: "validateTo",
                    defaultContent: "",
                    render: function (data) {
                        if (!data) {
                            return "";
                        }

                        return dateFormatYYYYMMDD(data);
                    }
                },
                {
                    data: "useYnCustom",
                    defaultContent: "",
                    render: function (data) {
                        if (!data) {
                            return "";
                        }

                        return useYnLimit(data);
                    }
                },
                {
                    data: "useDate",
                    defaultContent: "",
                    render: function (data) {
                        if (!data) {
                            return "";
                        }

                        return dateFormatYYYYMMDD(data);
                    }
                },
                {
                    data: "ordNo",
                    defaultContent: "",
                    render: function (data) {
                        return data ? data : "";
                    }
                }
            ],

            columnDefs: [
                {
                    targets: "_all",
                    className: "text-center"
                }
            ],

            /*
             * 중요:
             * ajax 객체 방식이 아니라 함수 방식으로 사용.
             * 이렇게 하면 DataTables가 ?_=1779781777573 같은 cache busting 파라미터를 붙이지 못함.
             */
            ajax: function (data, callback, settings) {
                $.ajax({
                    url: "<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon/list/${tbCust.custNo}?ordPathCd=<spring:eval expression="@environment.getProperty('file.ordPathCd.pickOrder')" />",
                    type: "GET",
                    dataType: "json",
                    cache: true,

                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                    },

                    success: function (res) {
                        var list = [];

                        if (res && res.data && Array.isArray(res.data)) {
                            list = res.data;

                            for (let i = 0; i < list.length; i++) {
                                list[i].listIndex = i + 1;
                                list[i].number = i;

                                list[i].disTypeText = {
                                    disType: list[i].disType,
                                    discountAmt: list[i].discountAmt
                                };

                                list[i].useYnCustom = {
                                    useYn: list[i].useYn,
                                    validateTo: list[i].validateTo
                                };
                            }
                        }

                        callback({
                            data: list
                        });
                    },

                    error: function (xhr, status, error) {
                        console.error("쿠폰 목록 조회 실패");
                        console.error("status:", status);
                        console.error("error:", error);
                        console.error("response:", xhr.responseText);

                        alert("쿠폰 목록 조회 중 오류가 발생했습니다.");

                        callback({
                            data: []
                        });
                    }
                });
            },

            dom: '<"row"<"col-sm-12" f><"col-sm-12"B>>t<"row"<"col-sm-12"><"col-sm-12"p>>',

            buttons: [
                {
                    extend: 'excel',
                    text: '&nbsp; 엑셀 다운로드',
                    className: 'btn-sm fa fa-file-excel',
                    filename: '엑셀출력_' + moment().format('YYYYMMDDHHmm'),
                    title: ''
                }
            ],

            initComplete: function (settings, json) {
                if (!$("#searchCouponCustTab").parent().hasClass("coupon-table-scroll-wrap")) {
                    $("#searchCouponCustTab").wrap(
                        "<div class='coupon-table-scroll-wrap' style='overflow:auto; width:100%; position:relative;'></div>"
                    );
                }
            }
        });

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

            req.pushMarketingYn = (req.pushMarketingYn == "on") ? "1" : "0";
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
                            url: url,
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
                            },
                            error: function (xhr, status, error) {
                                console.error("고객 수정 실패");
                                console.error("status:", status);
                                console.error("error:", error);
                                console.error("response:", xhr.responseText);

                                alert(editfailed);
                            }
                        });
                    }
                });
            }
        });

        $(".btn_coupon_detail").click(function () {
            let couponNo = $(this).attr('couponNo');
            location.href = "${path}/coupon/management/detail?couponNo=" + couponNo;
        });

        $("#selectAddr").click(function () {
            let word = $(".selectArea2 option:checked").text();
            let code = $(".selectArea2").val();

            $("#areaTable").append(
                " <tr>" +
                "     <td class=\"store_text\">" + word + "</td>" +
                "     <td class=\"store_text\">" + word + "</td>" +
                "     <td class=\"store_text\">" + word + "</td>" +
                " </tr>"
            );
        });

        $(".selectArea").on("change", function () {
            $.ajax({
                type: "POST",
                url: "${path}/api/system/code/area/list",
                data: {
                    sysType: "A2",
                    sysCode: $(this).val() + "%"
                },
                dataType: "json",
                success: function (data) {
                    let list = data.systemCodeList;
                    $(".selectArea2").html("");

                    for (var i = 0; i < list.length; i++) {
                        $(".selectArea2").append(
                            "<option value='" + list[i].sysCode + "'>" + list[i].codeName + "</option>"
                        );
                    }
                },
                error: function (xhr, status, error) {
                    console.error("지역 코드 조회 실패");
                    console.error("status:", status);
                    console.error("error:", error);
                    console.error("response:", xhr.responseText);
                }
            });
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

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
    });

    function formatPhone(phone) {
        if (phone == null || phone === "") {
            return "";
        }

        let _phone = String(phone).trim().replaceAll("-", "");

        switch (_phone.length) {
            case 10:
                return _phone.substring(0, 3) + "-" + _phone.substring(3, 6) + "-" + _phone.substring(6);
            case 11:
                return _phone.substring(0, 3) + "-" + _phone.substring(3, 7) + "-" + _phone.substring(7);
            default:
                return _phone;
        }
    }

</script>
</body>
</html>
