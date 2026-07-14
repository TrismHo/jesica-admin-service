<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | <spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="뱃지이미지 관리"/></title>

    <style>
        .badge-label {
            display: inline-block;
            min-width: 42px;
            padding: 3px 7px;
            border-radius: 10px;
            font-size: 11px;
            font-weight: 600;
            line-height: 1.2;
            text-align: center;
            white-space: nowrap;
        }

        .badge-common {
            background: #e8f7ff;
            color: #087da7;
        }

        .badge-private {
            background: #f1ecff;
            color: #6847c7;
        }

        .badge-using {
            background: #eaf0ff;
            color: #3554d1;
        }

        .badge-unused {
            background: #f4f4f4;
            color: #777;
        }

        .badge-normal {
            background: #e5f7eb;
            color: #168b4e;
        }

        .badge-stop {
            background: #fff4df;
            color: #a76800;
        }

        .badge-delete {
            background: #efefef;
            color: #777;
        }

        .badge-table-wrap {
            width: 100%;
            overflow-x: auto;
            background: #fff;
        }

        .badge-table {
            width: 100%;
            min-width: 1150px;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .badge-table th,
        .badge-table td {
            padding: 0px 12px;
            border-bottom: 1px solid #d9dee5;
            vertical-align: middle;
            color: #2d353c;
            font-size: 12px;
        }

        .badge-table th {
            padding: 4px 12px;
            background: #fff;
            font-weight: 700;
            text-align: left;
            white-space: nowrap;
        }

        .badge-table tbody tr {
            transition: background-color .15s ease;
        }

        .badge-table tbody tr:hover {
            background: #f8fafc;
        }

        .badge-table tbody tr.is-delete {
            opacity: .5;
        }

        .badge-table input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin: 0;
            cursor: pointer;
        }

        .badge-table-image-cell {
            display: flex;
            align-items: center;
            min-width: 0;
            gap: 14px;
        }

        .badge-table-thumbnail {
            flex: 0 0 58px;
            width: 58px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            background: #fff;
        }

        .badge-table-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            display: block;
        }

        .badge-table-image-name {
            min-width: 0;
            overflow: hidden;
            color: #2d353c;
            font-weight: 600;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .badge-table-code {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .badge-table-file-name {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .badge-table-empty {
            height: 160px;
            text-align: center !important;
            color: #999 !important;
        }

        .badge-table-edit-btn {
            padding: 7px 12px;
            border: 1px solid #cfd5dc;
            border-radius: 4px;
            background: #fff;
            color: #2d353c;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .badge-table-edit-btn:hover {
            background: #f4f6f8;
        }

        html.dark-mode .badge-table-wrap,
        html.dark-mode .badge-table,
        html.dark-mode .badge-table th {
            background: #2d353c;
        }

        html.dark-mode .badge-table th,
        html.dark-mode .badge-table td {
            color: #d7dde4;
            border-color: #3b4650;
        }

        html.dark-mode .badge-table tbody tr:hover {
            background: #262d33;
        }

        html.dark-mode .badge-table-thumbnail {
            background: #20252a;
            border-color: #444f5a;
        }

        html.dark-mode .badge-table-image-name {
            color: #d7dde4;
        }

        html.dark-mode .badge-table-edit-btn {
            background: #20252a;
            border-color: #444f5a;
            color: #d7dde4;
        }

        html.dark-mode .badge-table-edit-btn:hover {
            background: #343a40;
        }

        /* 테이블 하단 정보 및 페이징 */
        .badge-table-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding-top: 20px;
        }

        .badge-paging-info {
            color: #2d353c;
            font-size: 13px;
            white-space: nowrap;
        }

        .badge-table-footer .badge-gallery-pagination-wrap {
            display: flex;
            justify-content: flex-end;
            margin-top: 0;
        }

        .badge-table-footer .pagination {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .badge-table-footer .page-item {
            margin: 0;
        }

        .badge-table-footer .page-link {
            min-width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 12px;
            border: 1px solid #d9dee5;
            border-radius: 5px;
            background: #fff;
            color: #67717b;
            font-size: 13px;
            text-decoration: none;
        }

        .badge-table-footer .page-item.active .page-link {
            background: #348fe2;
            border-color: #348fe2;
            color: #fff;
        }

        .badge-table-footer .page-item.disabled .page-link {
            background: #f1f3f5;
            border-color: #e1e5e9;
            color: #c4cad0;
            cursor: default;
            pointer-events: none;
        }

        .badge-table-footer .page-link:hover {
            background: #f4f6f8;
        }

        .badge-table-footer .page-item.active .page-link:hover {
            background: #348fe2;
        }

        html.dark-mode .badge-paging-info {
            color: #d7dde4;
        }

        html.dark-mode .badge-table-footer .page-link {
            background: #20252a;
            border-color: #444f5a;
            color: #d7dde4;
        }

        html.dark-mode .badge-table-footer .page-item.disabled .page-link {
            background: #262d33;
            border-color: #3b4650;
            color: #68737d;
        }

        @media (max-width: 768px) {
            .badge-table-footer {
                align-items: flex-start;
                flex-direction: column;
            }

            .badge-table-footer .badge-gallery-pagination-wrap {
                width: 100%;
                justify-content: flex-end;
            }
        }

        .badge-table-delete-btn {
            padding: 7px 12px;
            border: 1px solid #ff5b57;
            border-radius: 4px;
            background: #fff;
            color: #ff5b57;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .badge-table-delete-btn:hover {
            background: #ff5b57;
            color: #fff;
        }

        html.dark-mode .badge-table-delete-btn {
            background: #20252a;
            border-color: #ff5b57;
            color: #ff7b78;
        }

        html.dark-mode .badge-table-delete-btn:hover {
            background: #ff5b57;
            color: #fff;
        }


        .badge-gallery-v2-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 12px;
            padding: 10px 12px;
            background: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
        }

        .badge-gallery-v2-filter {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .badge-gallery-v2-tab {
            border: 1px solid #d7dce2;
            background: #fff;
            color: #444;
            font-size: 12px;
            line-height: 1;
            padding: 7px 12px;
            border-radius: 16px;
            cursor: pointer;
            transition: all .15s ease;
        }

        .badge-gallery-v2-tab:hover {
            background: #f4f6f8;
        }

        .badge-gallery-v2-tab.active {
            background: #2d353c;
            color: #fff;
            border-color: #2d353c;
        }

        .badge-gallery-v2-count {
            font-size: 12px;
            color: #666;
            white-space: nowrap;
        }

        .badge-gallery-v2-wrap {
            background: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 7px;
            padding: 12px;
        }

        .badge-gallery-v2-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(92px, 1fr));
            gap: 10px;
        }

        .badge-gallery-v2-item {
            position: relative;
            aspect-ratio: 1 / 1;
            border: 1px solid #e3e7ec;
            background: #f8fafc;
            border-radius: 7px;
            overflow: hidden;
            cursor: pointer;
            transition: all .15s ease;
        }

        .badge-gallery-v2-item:hover {
            transform: translateY(-1px);
            border-color: #bfc8d4;
            box-shadow: 0 5px 14px rgba(0, 0, 0, .09);
        }

        .badge-gallery-v2-img-box {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 14px;
            background: #fff;
        }

        .badge-gallery-v2-img-box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            display: block;
        }

        .badge-st-count-btn {
            min-width: 48px;
            padding: 5px 10px;
            border: 1px solid #348fe2;
            border-radius: 14px;
            background: #eef6ff;
            color: #2376bd;
            font-size: 12px;
            font-weight: 700;
            line-height: 1;
            cursor: pointer;
        }

        .badge-st-count-btn:hover {
            background: #348fe2;
            color: #fff;
        }

        .badge-st-count-empty {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 48px;
            padding: 5px 10px;
            border-radius: 14px;
            background: #f1f3f5;
            color: #8a939d;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-st-code {
            display: inline-block;
            max-width: 125px;
            overflow: hidden;
            color: #2d353c;
            font-weight: 600;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: middle;
        }

        .badge-st-modal-summary {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 12px;
            padding: 12px 15px;
            border: 1px solid #e1e5e9;
            border-radius: 5px;
            background: #f8fafc;
            color: #2d353c;
            font-size: 13px;
        }

        .badge-st-modal-table-wrap {
            width: 100%;
            max-height: 430px;
            overflow: auto;
        }

        .badge-st-modal-table-wrap table {
            min-width: 700px;
        }

        .badge-st-modal-table-wrap th {
            position: sticky;
            top: 0;
            z-index: 1;
            background: #f4f6f8;
            white-space: nowrap;
        }

        .badge-st-modal-table-wrap td {
            vertical-align: middle;
            font-size: 13px;
        }

        html.dark-mode .badge-st-count-btn {
            background: #27394a;
            border-color: #348fe2;
            color: #73b9f4;
        }

        html.dark-mode .badge-st-count-btn:hover {
            background: #348fe2;
            color: #fff;
        }

        html.dark-mode .badge-st-count-empty {
            background: #343a40;
            color: #929ba4;
        }

        html.dark-mode .badge-st-code {
            color: #d7dde4;
        }

        html.dark-mode .badge-st-modal-summary {
            background: #20252a;
            border-color: #444f5a;
            color: #d7dde4;
        }

        html.dark-mode .badge-st-modal-table-wrap th {
            background: #343a40;
            color: #d7dde4;
        }

        html.dark-mode .badge-st-modal-table-wrap td {
            background: #2d353c;
            border-color: #444f5a;
            color: #d7dde4;
        }

        @media (max-width: 768px) {
            .badge-st-modal-summary {
                align-items: flex-start;
                flex-direction: column;
            }
        }

        .modal-content {
             width: 100%;
        }
    </style>
</head>
<body>
<div id="page-loader" class="fade show"><span class="spinner"></span></div>

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <div id="content" class="content p-0">
        <div class="panel panel-inverse m-t-1">

            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item">
                        <a href="${path}/system/badge/list">
                            <spring:message code="sidemenu.workgroupmanagement1" text="시스템 운영"/>
                        </a>
                    </li>
                    <li class="breadcrumb-item active">
                        <spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="뱃지이미지 관리"/>
                    </li>
                </ol>
                <h3 class="rix-title">
                    <spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="뱃지이미지 관리"/>
                </h3>
            </div>

            <form class="brand_search_form"></form>

            <form name="frmSearch" id="frmSearch">
                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
                            <div class="search-field search-date">
                                <div class="search-label">등록기간</div>
                                <div class="search-control-group">
                                    <div class="date-input-wrap">
                                        <input type="text"
                                               class="form-control startDate background-white"
                                               name="startDate"
                                               value="${searchValue.startDate}"
                                               readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>

                                    <span class="date-separator">~</span>

                                    <div class="date-input-wrap">
                                        <input type="text"
                                               class="form-control endDate background-white"
                                               name="endDate"
                                               value="${searchValue.endDate}"
                                               readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="search-field">
                                <div class="search-label">사용상태</div>
                                <div class="search-control-group">
                                    <select class="form-control dataStatus" name="dataStatus">
                                        <option value="" <c:if test="${searchValue.dataStatus == '' || searchValue.dataStatus == null}">selected</c:if>>전체</option>
                                        <option value="1" <c:if test="${searchValue.dataStatus == '1'}">selected</c:if>>정상</option>
                                        <option value="2" <c:if test="${searchValue.dataStatus == '2'}">selected</c:if>>정지</option>
                                    </select>
                                </div>
                            </div>

                            <%-- <div class="search-field">
                                 <div class="search-label">뱃지타입</div>
                                 <div class="search-control-group">
                                     <select class="form-control badgeType" name="badgeType">
                                         <option value="" <c:if test="${searchValue.badgeType == '' || searchValue.badgeType == null}">selected</c:if>>전체</option>
                                         <option value="1" <c:if test="${searchValue.badgeType == '1'}">selected</c:if>>공통 뱃지</option>
                                         <option value="2" <c:if test="${searchValue.badgeType == '2'}">selected</c:if>>개별 뱃지</option>
                                     </select>
                                 </div>
                             </div>지--%>

                            <div class="search-field">
                                <div class="search-label">사용여부</div>
                                <div class="search-control-group">
                                    <select class="form-control usingYn" name="usingYn">
                                        <option value="" <c:if test="${searchValue.usingYn == '' || searchValue.usingYn == null}">selected</c:if>>전체</option>
                                        <option value="Y" <c:if test="${searchValue.usingYn == 'Y'}">selected</c:if>>사용중</option>
                                        <option value="N" <c:if test="${searchValue.usingYn == 'N'}">selected</c:if>>미사용</option>
                                    </select>
                                </div>
                            </div>

                            <div class="search-field search-keyword">
                                <div class="search-label">검색어</div>
                                <div class="search-control-group search-keyword-group">
                                    <select id="searchType" class="form-control">
                                        <option value="originalFileName">파일명</option>
                                        <option value="stCode">가맹점코드</option>
                                    </select>

                                    <input type="text"
                                           id="searchKeyword"
                                           class="form-control width-150"
                                           maxlength="150"
                                           placeholder="검색어 입력">

                                    <input type="hidden"
                                           id="originalFileName"
                                           name="originalFileName"
                                           value="${searchValue.originalFileName}">

                                    <input type="hidden"
                                           id="stCode"
                                           name="stCode"
                                           value="${searchValue.stCode}">
                                </div>
                            </div>

                            <div class="search-actions">
                                <button type="button"
                                        class="btn btn-search-inline searchClick"
                                        onClick="serarchForm()">
                                    <i class="fa fa-search"></i>
                                    검색
                                </button>

                                <button type="button"
                                        data-toggle="modal"
                                        data-target="#give_coupon_all"
                                        class="insert_btn btn btn-search-inline ml-1">
                                    <span class="fa fa-plus">&nbsp;뱃지등록</span>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </form>

            <div class="panel-body p-15">

                <div class="badge-gallery-v2-toolbar">
                    <div class="badge-gallery-v2-filter">
                        <button type="button" class="badge-gallery-v2-tab active" data-filter="">전체</button>
                        <button type="button" class="badge-gallery-v2-tab" data-filter="1">공통</button>
                        <button type="button" class="badge-gallery-v2-tab" data-filter="2">개별</button>
                    </div>

                    <div class="badge-gallery-v2-count">
                        총 <strong id="badgeTotalCount">0</strong>건
                    </div>
                </div>

                <div class="badge-table-wrap">
                    <table class="badge-table">
                        <colgroup>
                         <%--   <col style="width: 55px;">--%>
                            <col style="width: 270px;">
                            <col style="width: 100px;">
                            <col style="width: 140px;">
                            <col style="width: 110px;">
                            <col style="width: 110px;">
                            <col>
                            <col style="width: 150px;">
                            <col style="width: 100px;">
                        </colgroup>

                        <thead>
                        <tr>
                            <%--<th>
                                <input type="checkbox" id="badgeCheckAll">
                            </th>--%>
                            <th class="p-25px">이미지</th>
                            <th>뱃지유형</th>
                            <th>사용 가맹점</th>
                            <th>사용여부</th>
                            <th>상태</th>
                            <th>파일명</th>
                            <th>등록일시</th>
                            <th>관리</th>
                        </tr>
                        </thead>

                        <tbody id="badgeGalleryList">
                        <tr>
                            <td colspan="9" class="badge-table-empty">
                                데이터를 불러오는 중입니다.
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="badge-table-footer">
                    <div id="badgePagingInfo" class="badge-paging-info">
                        Showing 0 to 0 of 0 entries
                    </div>

                    <div class="badge-gallery-pagination-wrap">
                        <ul id="badgeGalleryPagination"
                            class="pagination pagination-sm m-0"></ul>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>

<div class="modal fade" id="give_coupon_all" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/BadgeInput.jsp" %>
</div>


<div class="modal fade"
     id="badgeStListModal"
     tabindex="-1"
     role="dialog"
     aria-labelledby="badgeStListModalLabel"
     aria-hidden="true">

    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="badgeStListModalLabel">
                    뱃지 사용 가맹점 목록
                </h5>

                <button type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="닫기">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">

                <div class="badge-st-modal-summary">
                    <div>
                        뱃지 파일 번호:
                        <strong id="badgeStModalFileNo">-</strong>
                    </div>

                    <div>
                        총
                        <strong id="badgeStModalTotalCount">0</strong>개 가맹점
                    </div>
                </div>

                <div class="badge-st-modal-table-wrap">
                    <table class="table table-bordered table-hover mb-0">
                        <colgroup>
                            <col style="width: 80px;">
                            <col style="width: 190px;">
                            <col>
                            <col style="width: 170px;">
                            <col style="width: 140px;">
                        </colgroup>

                        <thead>
                        <tr>
                            <th class="text-center">번호</th>
                            <th>가맹점 코드</th>
                            <th>등록자</th>
                            <th>등록일시</th>
                            <th>수정자</th>
                        </tr>
                        </thead>

                        <tbody id="badgeStModalList">
                        <tr>
                            <td colspan="5"
                                class="text-center p-30">
                                가맹점 정보를 불러오는 중입니다.
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal">
                    닫기
                </button>
            </div>

        </div>
    </div>
</div>


<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>


<script>
    let badgePageNo = 1;
    let badgePageSize = 10;
    let badgeTotalCount = 0;
    let currentBadgeTypeFilter = "";
    let isBadgeSubmitting = false;

    function getBadgeImageSrc(row) {
        let filePath = "";

        if (row.fileUrl) {
            filePath = row.fileUrl;
        } else if (row.badgeFilePath) {
            filePath = row.badgeFilePath;
        } else if (row.saveFilePath) {
            filePath = row.saveFilePath;
        } else if (row.filePath) {
            filePath = row.filePath;
        }

        if (!filePath) {
            return "";
        }

        return "${path}/api/img/fileLoad?filePath=" + encodeURIComponent(filePath);
    }

    function escapeHtml(value) {
        if (value == null) {
            return "";
        }

        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function formatBadgeFileSize(bytes) {
        let size = Number(bytes || 0);

        if (size < 1024) {
            return size + " B";
        }

        if (size < 1024 * 1024) {
            return (size / 1024).toFixed(1) + " KB";
        }

        return (size / (1024 * 1024)).toFixed(1) + " MB";
    }

    function setKeywordForSearch() {
        let searchType = $("#searchType").val();
        let searchKeyword = $("#searchKeyword").val();

        $("#originalFileName").val("");
        $("#stCode").val("");

        if (searchType === "originalFileName") {
            $("#originalFileName").val(searchKeyword);
        }

        if (searchType === "stCode") {
            $("#stCode").val(searchKeyword);
        }
    }

    function initKeywordValue() {
        let originalFileName = $("#originalFileName").val();
        let stCode = $("#stCode").val();

        if (originalFileName) {
            $("#searchType").val("originalFileName");
            $("#searchKeyword").val(originalFileName);
            return;
        }

        if (stCode) {
            $("#searchType").val("stCode");
            $("#searchKeyword").val(stCode);
        }
    }

    function syncTopFilterBySelect() {
        let badgeType = $(".badgeType").val();

        currentBadgeTypeFilter = badgeType || "";

        $(".badge-gallery-v2-tab").removeClass("active");

        if (currentBadgeTypeFilter === "") {
            $(".badge-gallery-v2-tab[data-filter='']").addClass("active");
        } else {
            $(".badge-gallery-v2-tab[data-filter='" + currentBadgeTypeFilter + "']").addClass("active");
        }
    }

    function getBadgeSearchParams() {
        setKeywordForSearch();

        let params = $("#frmSearch").serializeArray();
        let data = {};

        $.each(params, function(index, item) {
            data[item.name] = item.value;
        });

        if (currentBadgeTypeFilter !== "") {
            data.badgeType = Number(currentBadgeTypeFilter);
        } else {
            data.badgeType = "";
        }

        data.draw = 1;
        data.start = (badgePageNo - 1) * badgePageSize;
        data.length = badgePageSize;

        data.pageNo = badgePageNo;
        data.pageSize = badgePageSize;

        return data;
    }

    function loadBadgeGallery() {
        $("#badgeGalleryList").html(
            "<tr>"
            + "    <td colspan='9' class='badge-table-empty'>"
            + "        데이터를 불러오는 중입니다."
            + "    </td>"
            + "</tr>"
        );

        $("#badgeCheckAll").prop("checked", false);

        $.ajax({
            url: "${path}/api/system/badge/list",
            type: "POST",
            data: getBadgeSearchParams(),
            success: function(res) {
                let list = [];
                let total = 0;

                if (res && res.data && Array.isArray(res.data)) {
                    list = res.data;
                    total = res.recordsFiltered || res.recordsTotal || res.totalCount || res.data.length;
                } else if (res && res.data && Array.isArray(res.data.list)) {
                    list = res.data.list;
                    total = res.data.totalCount || res.data.total || list.length;
                } else if (res && Array.isArray(res.badgeFileList)) {
                    list = res.badgeFileList;
                    total = res.totalElement || res.totalCount || res.total || list.length;
                } else if (res && Array.isArray(res.list)) {
                    list = res.list;
                    total = res.totalCount || res.total || list.length;
                } else if (Array.isArray(res)) {
                    list = res;
                    total = res.length;
                }

                badgeTotalCount = Number(total) || 0;

                $("#badgeTotalCount").text(badgeTotalCount);

                renderBadgeGallery(list);
                renderBadgePagination();
            },
            error: function(xhr) {
                console.error(xhr);

                $("#badgeGalleryList").html(
                    "<tr>"
                    + "    <td colspan='9' class='badge-table-empty'>"
                    + "        목록을 불러오는 중 오류가 발생했습니다."
                    + "    </td>"
                    + "</tr>"
                );
                $("#badgeTotalCount").text("0");
                $("#badgePagingInfo").text("Showing 0 to 0 of 0 entries");
                $("#badgeGalleryPagination").html("");
            }
        });
    }

    function renderBadgeGallery(list) {
        if (!list || list.length === 0) {
            $("#badgeGalleryList").html(
                "<tr>"
                + "    <td colspan='8' class='badge-table-empty'>"
                + "        조회된 뱃지 이미지가 없습니다."
                + "    </td>"
                + "</tr>"
            );

            return;
        }

        let html = "";

        $.each(list, function(index, row) {
            let badgeFileNo = row.badgeFileNo || "";
            let src = getBadgeImageSrc(row);
            let originalFileName = row.originalFileName || "-";
            let stCode = row.stCode || "-";
            let badgeStCount = Number(row.badgeStCount || 0);

            let insertDate =
                row.insertDate ||
                row.regDate ||
                row.createdDate ||
                "-";

            insertDate = formatBadgeDate(insertDate);

            let badgeType = String(row.badgeType || "");
            let usingYn = String(row.usingYn || "N");

            let dataStatus = String(
                row.dataStatus == null ? "1" : row.dataStatus
            );

            let badgeTypeHtml = "";
            let usingYnHtml = "";
            let dataStatusHtml = "";
            let badgeStHtml = "";
            let rowClass = "";

            /*
             * 뱃지 유형
             */
            if (badgeType === "1") {
                badgeTypeHtml =
                    "<span class='badge-label badge-common'>공통</span>";

                /*
                 * 공통 뱃지는 기존 사용여부를 표시하지 않음
                 */
                usingYnHtml = "-";

            } else if (badgeType === "2") {
                badgeTypeHtml =
                    "<span class='badge-label badge-private'>개별</span>";

                if (usingYn === "Y") {
                    usingYnHtml =
                        "<span class='badge-label badge-using'>사용중</span>";
                } else {
                    usingYnHtml =
                        "<span class='badge-label badge-unused'>미사용</span>";
                }

            } else {
                badgeTypeHtml = "-";
                usingYnHtml = "-";
            }

            /*
             * 개별 뱃지는 기존 stCode 출력
             * 개별이 아닌 뱃지는 연결된 가맹점 개수 출력
             */
            if (badgeType === "2") {
                badgeStHtml = ""
                    + "<span class='badge-st-code' "
                    + "      title='" + escapeHtml(stCode) + "'>"
                    +        escapeHtml(stCode)
                    + "</span>";

            } else if (badgeStCount > 0) {
                badgeStHtml = ""
                    + "<button type='button' "
                    + "        class='badge-st-count-btn' "
                    + "        data-badge-file-no='" + escapeHtml(badgeFileNo) + "' "
                    + "        data-badge-file-name='" + escapeHtml(originalFileName) + "'>"
                    +          badgeStCount + "개"
                    + "</button>";

            } else {
                badgeStHtml =
                    "<span class='badge-st-count-empty'>0개</span>";
            }

            /*
             * 데이터 상태
             */
            if (dataStatus === "1") {
                dataStatusHtml =
                    "<span class='badge-label badge-normal'>정상</span>";

            } else if (dataStatus === "2") {
                dataStatusHtml =
                    "<span class='badge-label badge-stop'>정지</span>";

            } else {
                dataStatusHtml =
                    "<span class='badge-label badge-delete'>삭제</span>";

                rowClass = "is-delete";
            }

            let imageHtml = "";

            if (src) {
                imageHtml = ""
                    + "<img src='" + escapeHtml(src) + "' "
                    + "     alt='badge image' "
                    + "     onerror=\"this.src='${path}/assets/img/logo/logo-noimg.gif';\">";
            } else {
                imageHtml =
                    "<span class='badge-gallery-v2-no-img'>NO IMG</span>";
            }

            html += ""
                + "<tr class='" + rowClass + "'>"

                + "    <td>"
                + "        <div class='badge-table-image-cell'>"
                + "            <div class='badge-table-thumbnail'>"
                +                  imageHtml
                + "            </div>"
                + "            <div class='badge-table-image-name' "
                + "                 title='" + escapeHtml(originalFileName) + "'>"
                +                  escapeHtml(originalFileName)
                + "            </div>"
                + "        </div>"
                + "    </td>"

                + "    <td>"
                +          badgeTypeHtml
                + "    </td>"

                + "    <td class='badge-table-code'>"
                +          badgeStHtml
                + "    </td>"

                + "    <td>"
                +          usingYnHtml
                + "    </td>"

                + "    <td>"
                +          dataStatusHtml
                + "    </td>"

                + "    <td class='badge-table-file-name' "
                + "        title='" + escapeHtml(originalFileName) + "'>"
                +          escapeHtml(originalFileName)
                + "    </td>"

                + "    <td>"
                +          escapeHtml(insertDate)
                + "    </td>"

                + "    <td>"
                + "        <button type='button' "
                + "                class='badge-table-delete-btn' "
                + "                data-badge-file-no='" + escapeHtml(badgeFileNo) + "'>"
                + "            삭제"
                + "        </button>"
                + "    </td>"

                + "</tr>";
        });

        $("#badgeGalleryList").html(html);
        $("#badgeCheckAll").prop("checked", false);
    }
    function renderBadgeStModalList(list) {
        if (!list || list.length === 0) {
            $("#badgeStModalList").html(
                "<tr>"
                + "    <td colspan='5' class='text-center p-30'>"
                + "        연결된 가맹점이 없습니다."
                + "    </td>"
                + "</tr>"
            );

            $("#badgeStModalTotalCount").text("0");
            return;
        }

        let html = "";

        $.each(list, function(index, row) {
            let stCode = row.stCode || "-";
            let insertUserId = row.insertUserId || "-";
            let updateUserId = row.updateUserId || "-";
            let insertDate = formatBadgeDate(row.insertDate);

            html += ""
                + "<tr>"
                + "    <td class='text-center'>"
                +          (index + 1)
                + "    </td>"

                + "    <td>"
                + "        <strong>"
                +              escapeHtml(stCode)
                + "        </strong>"
                + "    </td>"

                + "    <td>"
                +          escapeHtml(insertUserId)
                + "    </td>"

                + "    <td>"
                +          escapeHtml(insertDate)
                + "    </td>"

                + "    <td>"
                +          escapeHtml(updateUserId)
                + "    </td>"
                + "</tr>";
        });

        $("#badgeStModalList").html(html);
        $("#badgeStModalTotalCount").text(list.length);
    }
    let isBadgeStLoading = false;

    function loadBadgeStList(badgeFileNo, badgeFileName) {
        if (isBadgeStLoading) {
            return;
        }

        if (!badgeFileNo) {
            alert("뱃지 파일 번호가 없습니다.");
            return;
        }

        isBadgeStLoading = true;

        $("#badgeStModalFileNo").text(badgeFileNo);
        $("#badgeStModalTotalCount").text("0");

        if (badgeFileName) {
            $("#badgeStListModalLabel").text(
                "뱃지 사용 가맹점 목록 - " + badgeFileName
            );
        } else {
            $("#badgeStListModalLabel").text(
                "뱃지 사용 가맹점 목록"
            );
        }

        $("#badgeStModalList").html(
            "<tr>"
            + "    <td colspan='5' class='text-center p-30'>"
            + "        가맹점 정보를 불러오는 중입니다."
            + "    </td>"
            + "</tr>"
        );

        $("#badgeStListModal").modal("show");

        $.ajax({
            url: "${path}/api/system/badge/st/list",
            type: "GET",
            data: {
                badgeFileNo: badgeFileNo
            },
            success: function(res) {
                let list = [];

                if (res && Array.isArray(res.badgeStList)) {
                    list = res.badgeStList;

                } else if (
                    res &&
                    res.data &&
                    Array.isArray(res.data.badgeStList)
                ) {
                    list = res.data.badgeStList;

                } else if (
                    res &&
                    res.data &&
                    Array.isArray(res.data)
                ) {
                    list = res.data;

                } else if (Array.isArray(res)) {
                    list = res;
                }

                renderBadgeStModalList(list);
            },
            error: function(xhr) {
                console.error(xhr);

                let message =
                    "가맹점 목록을 불러오는 중 오류가 발생했습니다.";

                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.message
                ) {
                    message = xhr.responseJSON.message;
                }

                $("#badgeStModalList").html(
                    "<tr>"
                    + "    <td colspan='5' class='text-center text-danger p-30'>"
                    +          escapeHtml(message)
                    + "    </td>"
                    + "</tr>"
                );

                $("#badgeStModalTotalCount").text("0");
            },
            complete: function() {
                isBadgeStLoading = false;
            }
        });
    }

    function renderBadgePagination() {
        let totalPage = Math.ceil(badgeTotalCount / badgePageSize);
        let startEntry = 0;
        let endEntry = 0;

        if (badgeTotalCount > 0) {
            startEntry = ((badgePageNo - 1) * badgePageSize) + 1;
            endEntry = Math.min(badgePageNo * badgePageSize, badgeTotalCount);
        }

        $("#badgePagingInfo").text(
            "Showing "
            + startEntry
            + " to "
            + endEntry
            + " of "
            + badgeTotalCount
            + " entries"
        );

        if (badgeTotalCount === 0 || totalPage === 0) {
            $("#badgeGalleryPagination").html("");
            return;
        }

        if (badgePageNo > totalPage) {
            badgePageNo = totalPage;
        }

        let pageBlockSize = 5;
        let startPage = Math.floor((badgePageNo - 1) / pageBlockSize) * pageBlockSize + 1;
        let endPage = Math.min(startPage + pageBlockSize - 1, totalPage);
        let html = "";

        html += ""
            + "<li class='page-item " + (badgePageNo <= 1 ? "disabled" : "") + "'>"
            + "    <a class='page-link badge-page-link' href='javascript:;' data-page='1' aria-label='첫 페이지'>&laquo;</a>"
            + "</li>";

        html += ""
            + "<li class='page-item " + (badgePageNo <= 1 ? "disabled" : "") + "'>"
            + "    <a class='page-link badge-page-link' href='javascript:;' data-page='" + (badgePageNo - 1) + "' aria-label='이전 페이지'><</a>"
            + "</li>";

        for (let i = startPage; i <= endPage; i++) {
            html += ""
                + "<li class='page-item " + (badgePageNo === i ? "active" : "") + "'>"
                + "    <a class='page-link badge-page-link' href='javascript:;' data-page='" + i + "'>" + i + "</a>"
                + "</li>";
        }

        html += ""
            + "<li class='page-item " + (badgePageNo >= totalPage ? "disabled" : "") + "'>"
            + "    <a class='page-link badge-page-link' href='javascript:;' data-page='" + (badgePageNo + 1) + "' aria-label='다음 페이지'>></a>"
            + "</li>";

        html += ""
            + "<li class='page-item " + (badgePageNo >= totalPage ? "disabled" : "") + "'>"
            + "    <a class='page-link badge-page-link' href='javascript:;' data-page='" + totalPage + "' aria-label='마지막 페이지'>&raquo;</a>"
            + "</li>";

        $("#badgeGalleryPagination").html(html);
    }

    function serarchForm() {
        syncTopFilterBySelect();

        badgePageNo = 1;
        loadBadgeGallery();
    }

    function resetBadgeForm() {
        if ($("#badgeInsertForm").length > 0) {
            $("#badgeInsertForm")[0].reset();
        }

        $("#insertBadgeType").val("1");

        /*
         * 공통 뱃지는 무조건 미사용
         */
        $("#insertUsingYn").val("N");
        $("#insertUsingYnRow").hide();

        $("#insertDataStatus").val("1");
        $("#insertStCode").val("");
        $("#insertBadgeFile").val("");

        /*
         * 기본값 공통 뱃지이므로 stCode 숨김
         */
        $("#stCodeRow").hide();

        $("#badgePreviewBox").html("<span class='badge-preview-empty'>NO IMG</span>");
        $("#badgePreviewFileName").text("선택된 이미지가 없습니다.");
        $("#badgePreviewFileSize").text("");

        isBadgeSubmitting = false;
        $(".insertBadge").prop("disabled", false);
    }

    function insertBadgeFile() {
        if (isBadgeSubmitting) {
            return;
        }

        let badgeType = $("#insertBadgeType").val();
        let stCode = $.trim($("#insertStCode").val() || "");
        let usingYn = $("#insertUsingYn").val();
        let dataStatus = $("#insertDataStatus").val();
        let userId = $("#badgeUserId").val() || $("input[name='userId']").val() || "";
        let fileInput = $("#insertBadgeFile")[0];
        let file = null;

        /*
         * 공통 뱃지는 무조건 미사용
         * stCode도 사용하지 않음
         */
        if (badgeType !== "2") {
            stCode = "";
            usingYn = "N";
            $("#insertUsingYn").val("N");
        }

        if (fileInput && fileInput.files && fileInput.files.length > 0) {
            file = fileInput.files[0];
        }

        if (!userId) {
            alert("사용자 정보가 없습니다. 다시 로그인 후 시도해주세요.");
            return;
        }

        if (!badgeType) {
            alert("뱃지 타입을 선택해주세요.");
            return;
        }

        /*
         * 개별 + 사용중일 때만 stCode 필수
         */
        if (badgeType === "2" && usingYn === "Y" && !stCode) {
            alert("개별 뱃지를 사용중으로 등록하려면 사용중인 가맹점 코드를 입력해주세요.");
            $("#insertStCode").focus();
            return;
        }

        if (!usingYn) {
            alert("사용 여부를 선택해주세요.");
            return;
        }

        if (!dataStatus) {
            alert("데이터 상태를 선택해주세요.");
            return;
        }

        if (!file) {
            alert("뱃지 이미지를 선택해주세요.");
            return;
        }

        if (!file.type || !file.type.startsWith("image/")) {
            alert("이미지 파일만 등록할 수 있습니다.");
            return;
        }

        if (file.name && file.name.length > 100) {
            alert("파일명은 최대 100자까지 등록 가능합니다.");
            return;
        }

        if (file.size > (10 * 1024 * 1024)) {
            alert("뱃지 이미지는 최대 10MB까지 등록 가능합니다.");
            return;
        }

        if (!confirm("등록하시겠습니까?")) {
            return;
        }

        let formData = new FormData();

        formData.append("badgeType", badgeType);
        formData.append("stCode", stCode);
        formData.append("userId", userId);
        formData.append("usingYn", usingYn);
        formData.append("dataStatus", dataStatus);
        formData.append("badgeFile", file);

        isBadgeSubmitting = true;
        $(".insertBadge").prop("disabled", true);

        $.ajax({
            url: "${path}/api/system/badge/insert",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            timeout: 30000,
            cache: false,
            success: function(res) {
                alert((res && res.message) ? res.message : "등록되었습니다.");

                $("#give_coupon_all").modal("hide");

                badgePageNo = 1;
                loadBadgeGallery();
            },
            error: function(xhr) {
                console.error(xhr);

                let message = "등록 중 오류가 발생했습니다.";

                if (xhr.responseJSON && xhr.responseJSON.message) {
                    message = xhr.responseJSON.message;
                } else if (xhr.responseText) {
                    message = xhr.responseText;
                }

                alert(message);
            },
            complete: function() {
                isBadgeSubmitting = false;
                $(".insertBadge").prop("disabled", false);
            }
        });
    }



    let isBadgeDeleting = false;

    function deleteBadgeFile(badgeFileNo) {
        if (isBadgeDeleting) {
            return;
        }

        if (!badgeFileNo) {
            alert("뱃지 번호가 없습니다.");
            return;
        }

        if (!confirm("해당 뱃지 이미지를 삭제하시겠습니까?")) {
            return;
        }

        isBadgeDeleting = true;
        $(".badge-table-delete-btn").prop("disabled", true);

        $.ajax({
            url: "${path}/api/system/badge/delete",
            type: "POST",
            data: {
                badgeFileNo: badgeFileNo
            },
            success: function(res) {
                alert(
                    res && res.message
                        ? res.message
                        : "삭제되었습니다."
                );

                /*
                 * 현재 페이지에 마지막 데이터만 있었다면
                 * 이전 페이지로 이동
                 */
                let currentPageItemCount = $("#badgeGalleryList tr").length;

                if (currentPageItemCount <= 1 && badgePageNo > 1) {
                    badgePageNo--;
                }

                loadBadgeGallery();
            },
            error: function(xhr) {
                console.error(xhr);

                let message = "삭제 중 오류가 발생했습니다.";

                if (xhr.responseJSON && xhr.responseJSON.message) {
                    message = xhr.responseJSON.message;
                } else if (xhr.responseText) {
                    message = xhr.responseText;
                }

                alert(message);
            },
            complete: function() {
                isBadgeDeleting = false;
                $(".badge-table-delete-btn").prop("disabled", false);
            }
        });
    }
    $(() => {
        initKeywordValue();
        syncTopFilterBySelect();
        dateSetting();
        loadBadgeGallery();

        $(document).on("click", ".badge-gallery-v2-tab", function() {
            $(".badge-gallery-v2-tab").removeClass("active");
            $(this).addClass("active");

            currentBadgeTypeFilter = $(this).data("filter");

            if (currentBadgeTypeFilter == null || currentBadgeTypeFilter === "") {
                currentBadgeTypeFilter = "";
            } else {
                currentBadgeTypeFilter = Number(currentBadgeTypeFilter);
            }

            $(".badgeType").val(currentBadgeTypeFilter);

            badgePageNo = 1;
            loadBadgeGallery();
        });

        $(document).on("change", ".badgeType", function() {
            syncTopFilterBySelect();
        });

        $(document).on("click", ".badge-st-count-btn", function(e) {
            e.preventDefault();
            e.stopPropagation();

            let badgeFileNo =
                $(this).attr("data-badge-file-no");

            let badgeFileName =
                $(this).attr("data-badge-file-name");

            loadBadgeStList(
                badgeFileNo,
                badgeFileName
            );
        });
        $(document).on(
            "hidden.bs.modal",
            "#badgeStListModal",
            function() {
                $("#badgeStListModalLabel").text(
                    "뱃지 사용 가맹점 목록"
                );

                $("#badgeStModalFileNo").text("-");
                $("#badgeStModalTotalCount").text("0");

                $("#badgeStModalList").html(
                    "<tr>"
                    + "    <td colspan='5' class='text-center p-30'>"
                    + "        가맹점 정보를 불러오는 중입니다."
                    + "    </td>"
                    + "</tr>"
                );

                isBadgeStLoading = false;
            }
        );

        $(document).on("click", ".badge-page-link", function() {
            let page = Number($(this).data("page"));

            if (!page || page < 1) {
                return;
            }

            let totalPage = Math.ceil(badgeTotalCount / badgePageSize);

            if (page > totalPage) {
                return;
            }

            badgePageNo = page;
            loadBadgeGallery();

            if ($("#badgeGalleryList").length > 0) {
                $("html, body").animate({
                    scrollTop: $("#badgeGalleryList").offset().top - 120
                }, 150);
            }
        });
        $(document).on("click", ".badge-table-delete-btn", function(e) {
            e.preventDefault();
            e.stopPropagation();

            let badgeFileNo = $(this).attr("data-badge-file-no");

            deleteBadgeFile(badgeFileNo);
        });
        /*
         * 이미지 클릭 시 수정 팝업
         */
        $(document).on("click", ".insert_btn", function() {
            resetBadgeForm();
        });

        $(document).on("hidden.bs.modal", "#give_coupon_all", function() {
            resetBadgeForm();
        });

        $(document).on("click", ".insertBadge", function() {
            insertBadgeFile();
        });

        $(document).on("change", "#insertBadgeType", function() {
            let badgeType = $(this).val();

            if (badgeType === "2") {
                /*
                 * 개별 뱃지
                 * stCode, 사용 여부 노출
                 */
                $("#stCodeRow").show();
                $("#insertUsingYnRow").show();
                $("#insertUsingYn").val("N");
            } else {
                /*
                 * 공통 뱃지
                 * stCode 숨김, 사용 여부 숨김, usingYn은 무조건 N
                 */
                $("#stCodeRow").hide();
                $("#insertStCode").val("");

                $("#insertUsingYnRow").hide();
                $("#insertUsingYn").val("N");
            }
        });

        $(document).on("change", "#insertBadgeFile", function(e) {
            let file = e.target.files[0];

            if (!file) {
                $("#badgePreviewBox").html("<span class='badge-preview-empty'>NO IMG</span>");
                $("#badgePreviewFileName").text("선택된 이미지가 없습니다.");
                $("#badgePreviewFileSize").text("");
                return;
            }

            if (!file.type || !file.type.startsWith("image/")) {
                alert("이미지 파일만 등록할 수 있습니다.");
                $(this).val("");

                $("#badgePreviewBox").html("<span class='badge-preview-empty'>NO IMG</span>");
                $("#badgePreviewFileName").text("선택된 이미지가 없습니다.");
                $("#badgePreviewFileSize").text("");
                return;
            }

            let reader = new FileReader();

            reader.onload = function(event) {
                $("#badgePreviewBox").html("<img src='" + event.target.result + "'>");
                $("#badgePreviewFileName").text(file.name);
                $("#badgePreviewFileSize").text(formatBadgeFileSize(file.size));
            };

            reader.readAsDataURL(file);
        });



    });

    $(document).on("change", "#badgeCheckAll", function() {
        $(".badge-row-check").prop("checked", $(this).is(":checked"));
    });

    $(document).on("change", ".badge-row-check", function() {
        let totalCount = $(".badge-row-check").length;
        let checkedCount = $(".badge-row-check:checked").length;

        $("#badgeCheckAll").prop(
            "checked",
            totalCount > 0 && totalCount === checkedCount
        );
    });

    function formatBadgeDate(value) {
        if (!value) {
            return "-";
        }

        let dateText = String(value).replace("T", " ");

        /*
         * 2026-06-18 19:02:51.000 형태라면 밀리초 제거
         */
        if (dateText.indexOf(".") > -1) {
            dateText = dateText.substring(0, dateText.indexOf("."));
        }

        /*
         * 초까지만 노출
         */
        if (dateText.length > 19) {
            dateText = dateText.substring(0, 19);
        }

        return dateText;
    }
</script>
</body>
</html>
