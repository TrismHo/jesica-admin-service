<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | 온동네 신청관리</title>

    <style>
        .detail-page-header {
            padding-bottom: 10px;
        }

        .detail-shell {
            border: 1px solid #d9dee3;
            background: #fff;
        }

        .detail-main {
            display: flex;
            align-items: flex-start;
        }

        .detail-left {
            width: 60%;
            border-right: 1px solid #d9dee3;
            background: #fff;
        }

        .detail-right {
            flex: 1;
            min-width: 0;
            background: #fff;
        }

        .section-head {
            padding: 14px 18px;
            border-bottom: 1px solid #d9dee3;
            background: #f5f6f8;
        }

        .section-title {
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            color: #222;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .section-body {
            padding: 16px;
        }

        .info-card-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 14px;
        }

        .info-card {
            border: 1px solid #d9dee3;
            background: #fff;
            padding: 9px 17px;
            min-height: 96px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .info-card.wide {
            grid-column: 1 / -1;
            min-height: 86px;
        }

        .info-label {
            font-size: 13px;
            font-weight: 700;
            color: #666;
            margin-bottom: 10px;
        }

        .info-value {
            font-size: 12px;
            font-weight: 700;
            color: #222;
            line-height: 1.45;
            word-break: break-all;
        }

        .info-code {
            color: #4b5563;
            font-weight: 600;
        }

        .info-divider {
            color: #9aa3af;
            margin: 0 4px;
        }

        .info-name {
            color: #111;
            font-weight: 700;
        }

        .info-panel {
            margin-top: 16px;
            border: 1px solid #d9dee3;
            background: #fff;
            padding: 16px 18px;
        }

        .info-panel-title {
            font-size: 13px;
            font-weight: 700;
            color: #666;
            margin-bottom: 12px;
        }

        .bottom-actions {
            margin-top: 18px;
            display: flex;
            justify-content: flex-start;
            gap: 8px;
        }

        .bottom-actions .btn {
            min-width: 92px;
            height: 38px;
            border-radius: 0 !important;
            font-weight: 600;
            box-shadow: none !important;
        }

        .file-panel {
            border: 1px solid #d9dee3;
            background: #fff;
            overflow: hidden;
        }

        .file-panel + .file-panel {
            margin-top: 16px;
        }

        .file-panel-head {
            padding: 12px 14px;
            border-bottom: 1px solid #d9dee3;
            background: #f7f8fa;
            font-size: 13px;
            color: #666;
            font-weight: 600;
        }

        .file-table {
            width: 100%;
            margin: 0;
            table-layout: fixed;
        }

        .file-table thead th {
            padding: 14px 12px !important;
            border-bottom: 1px solid #d9dee3 !important;
            background: #f8f9fb;
            font-size: 14px;
            font-weight: 700;
            color: #333;
            text-align: center;
        }

        .file-table thead th:first-child,
        .file-table tbody td:first-child {
            text-align: left;
        }

        .file-table td {
            padding: 14px 12px !important;
            border-top: 1px solid #eef1f4;
            vertical-align: middle !important;
            font-size: 14px;
            color: #222;
            text-align: center;
        }

        .file-row {
            cursor: pointer;
            transition: background-color .12s ease;
        }

        .file-row:hover {
            background: #fafafa;
        }

        .file-name-cell {
            text-align: left !important;
            word-break: break-all;
        }

        .file-empty-cell {
            height: 180px;
            text-align: center !important;
            color: #999;
            font-size: 14px;
        }

        .file-icon {
            margin-right: 8px;
            color: rgba(0, 0, 0, .45);
        }

        .download-link {
            cursor: pointer;
        }

        .view-icon {
            color: #4b5563;
        }

        .app-logo-grid {
            display: flex;
            gap: 14px;
            flex-wrap: wrap;
            align-items: flex-start;
        }

        .app-logo-card {
            width: 108px;
            min-height: 110px;
            border: 1px solid #d9dee3;
            background: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 14px 10px 12px;
            border-radius: 10px;
            text-align: center;
            transition: all .15s ease;
            position: relative;
        }

        .app-logo-card.on {
            border-color: #cfe8d5;
            background: #f4fbf6;
        }

        .app-logo-card.off {
            background: #f3f4f6;
            color: #8a94a6;
            opacity: .7;
        }

        .app-logo-thumb {
            width: 60px;
            height: 60px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .app-logo-name {
            font-size: 13px;
            font-weight: 700;
            line-height: 1.3;
            color: inherit;
        }

        .app-logo-check {
            position: absolute;
            left: 10px;
            top: 10px;
            font-size: 12px;
            color: #1f7a3d;
        }

        .app-info-body {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 18px;
        }

        .app-apps {
            flex: 1;
            min-width: 0;
        }

        .app-account-wrap {
            display: flex;
            gap: 12px;
            align-items: flex-start;
            flex-shrink: 0;
        }

        .app-account-card {
            border: 1px solid #d9dee3;
            background: #fff;
            padding: 32px 20px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .app-account-label {
            font-size: 12px;
            font-weight: 700;
            color: #666;
            margin-bottom: 10px;
        }

        .app-account-value {
            font-size: 13px;
            font-weight: 700;
            color: #222;
            line-height: 1.45;
            word-break: break-all;
        }

        .orangeColor {
            display: inline-flex;
            align-items: center;
            height: 22px;
            padding: 0 10px;
            border-radius: 999px;
            background: #fff4e8;
            color: #f97316;
            font-size: 12px;
            font-weight: 800;
            border: 1px solid #dfdfdf;
        }

        .panel-box {
            background: #fff;
            border: 1px solid #ddd;
        }

        @media (max-width: 1200px) {
            .detail-main {
                flex-direction: column;
            }

            .detail-left,
            .detail-right {
                width: 100%;
                border-right: 0;
            }

            .detail-right {
                border-top: 1px solid #d9dee3;
            }
        }

        @media (max-width: 992px) {
            .app-info-body {
                flex-direction: column;
            }

            .app-account-wrap {
                width: 100%;
                flex-direction: column;
            }

            .app-account-card {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .info-card-grid {
                grid-template-columns: 1fr;
            }

            .info-card.wide {
                grid-column: auto;
            }

            .section-title {
                font-size: 16px;
            }

            .info-value {
                font-size: 15px;
            }

            .file-table thead th,
            .file-table td {
                font-size: 13px;
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
        <div class="detail-page-header">
            <ol class="breadcrumb float-xl-right p-r-10 m-b-10">
                <li class="breadcrumb-item"><a href="javascript:;">가맹점</a></li>
                <li class="breadcrumb-item"><a href="${path}/store/regist/list">온동네 신청관리</a></li>
                <li class="breadcrumb-item active">상세</li>
            </ol>
            <h3 class="rix-title p-b-5">온동네 신청관리 상세</h3>
        </div>

        <div class="detail-shell">
            <div class="detail-main">

                <div class="detail-left">
                    <div class="section-head">
                        <h4 class="section-title">기본정보</h4>
                    </div>

                    <div class="section-body">
                        <div class="info-card-grid">
                            <div class="info-card">
                                <div class="info-label">가맹점정보</div>
                                <div class="info-value">
                                    <span class="orangeColor">
                                        <c:out value="${empty tbMannaStRegist.stCode ? '-' : tbMannaStRegist.stCode}"/>
                                    </span>
                                    &nbsp;
                                    <span class="info-name">
                                        <c:out value="${empty tbMannaStRegist.stName ? '-' : tbMannaStRegist.stName}"/>
                                    </span>
                                </div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">총판정보</div>
                                <div class="info-value">
                                    <span class="orangeColor">
                                        <c:out value="${empty tbMannaStRegist.brCode ? '-' : tbMannaStRegist.brCode}"/>
                                    </span>
                                    &nbsp;
                                    <span class="info-name">
                                        <c:out value="${empty tbMannaStRegist.brName ? '-' : tbMannaStRegist.brName}"/>
                                    </span>
                                </div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">등록일</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${not empty tbMannaStRegist.insertDate}">
                                            <javatime:format value="${tbMannaStRegist.insertDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">크롤링 상품수</div>
                                <div class="info-value">
                                    <c:out value="${empty tbMannaStRegist.crawlingCnt ? '-' : tbMannaStRegist.crawlingCnt}"/> 개
                                </div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">크롤링 타입</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${tbMannaStRegist.crawlingType == '0'}">없음</c:when>
                                        <c:when test="${tbMannaStRegist.crawlingType == '1'}">배민</c:when>
                                        <c:when test="${tbMannaStRegist.crawlingType == '2'}">쿠팡</c:when>
                                        <c:when test="${tbMannaStRegist.crawlingType == '3'}">요기요</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">마지막 크롤링 시간</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${not empty tbMannaStRegist.crawlingDate}">
                                            <javatime:format value="${tbMannaStRegist.crawlingDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                        <div class="info-panel">
                            <div class="info-panel-title">사용앱</div>

                            <div class="app-info-body">
                                <div class="app-apps">
                                    <div class="app-logo-grid">
                                        <div class="app-logo-card ${tbMannaStRegist.baeminYn == 'Y' ? 'on' : 'off'}">
                                            <img src="${path}/assets/img/logo/baemin.png" alt="배민" class="app-logo-thumb">
                                            <div class="app-logo-name">배달의민족</div>
                                            <c:if test="${tbMannaStRegist.baeminYn == 'Y'}">
                                                <div class="app-logo-check">
                                                    <i class="fa fa-check"></i>
                                                </div>
                                            </c:if>
                                        </div>

                                        <div class="app-logo-card ${tbMannaStRegist.coupangYn == 'Y' ? 'on' : 'off'}">
                                            <img src="${path}/assets/img/logo/coupang.png" alt="쿠팡" class="app-logo-thumb">
                                            <div class="app-logo-name">쿠팡이츠</div>
                                            <c:if test="${tbMannaStRegist.coupangYn == 'Y'}">
                                                <div class="app-logo-check">
                                                    <i class="fa fa-check"></i>
                                                </div>
                                            </c:if>
                                        </div>

                                        <div class="app-logo-card ${tbMannaStRegist.yogiyoYn == 'Y' ? 'on' : 'off'}">
                                            <img src="${path}/assets/img/logo/yogiyo.png" alt="요기요" class="app-logo-thumb">
                                            <div class="app-logo-name">요기요</div>
                                            <c:if test="${tbMannaStRegist.yogiyoYn == 'Y'}">
                                                <div class="app-logo-check">
                                                    <i class="fa fa-check"></i>
                                                </div>
                                            </c:if>
                                        </div>

                                        <div class="app-logo-card ${tbMannaStRegist.directsaleYn == 'Y' ? 'on' : 'off'}">
                                            <img src="${path}/assets/img/logo/jig.png" alt="직거래" class="app-logo-thumb">
                                            <div class="app-logo-name">직거래</div>
                                            <c:if test="${tbMannaStRegist.directsaleYn == 'Y'}">
                                                <div class="app-logo-check">
                                                    <i class="fa fa-check"></i>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <c:if test="${tbMannaStRegist.baeminYn == 'Y'}">
                                    <div class="app-account-wrap">
                                        <div class="app-account-card">
                                            <div class="app-account-label">배민 사이트 계정</div>
                                            <div class="app-account-value">
                                                <c:out value="${empty tbMannaStRegist.baeminId ? '-' : tbMannaStRegist.baeminId}"/>
                                            </div>
                                        </div>

                                        <div class="app-account-card">
                                            <div class="app-account-label">배민 사이트 비밀번호</div>
                                            <div class="app-account-value">
                                                <c:out value="${empty tbMannaStRegist.baeminPwd ? '-' : tbMannaStRegist.baeminPwd}"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <div class="bottom-actions">
                            <button type="button" class="btn btn-primary btn_list">
                                <i class="fa fa-list m-r-3"></i> 목록
                            </button>
                        </div>
                    </div>
                </div>

                <div class="detail-right">
                    <div class="section-head">
                        <h4 class="section-title">
                            <i class="fa fa-folder-open"></i>
                            첨부파일
                        </h4>
                    </div>

                    <div class="section-body">
                        <div class="file-panel">
                            <div class="file-panel-head">온동네 신청서</div>

                            <table class="table file-table m-0">
                                <thead>
                                <tr>
                                    <th style="width:55%;">파일명</th>
                                    <th style="width:25%;">등록일</th>
                                    <th style="width:20%;">다운로드</th>
                                </tr>
                                </thead>
                                <tbody id="registFileTbody">
                                <c:choose>
                                    <c:when test="${not empty tbMannaStRegistFile}">
                                        <c:forEach var="item" items="${tbMannaStRegistFile}">
                                            <tr class="file-row" onclick="downloadRegistFile('${item.fileName}', '${item.filePath}')">
                                                <td class="file-name-cell">
                                                    <c:set var="lowerFileName" value="${fn:toLowerCase(item.fileName)}"/>

                                                    <c:choose>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.pdf')}">
                                                            <i class="far fa-file-pdf file-icon text-danger"></i>
                                                        </c:when>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.xls') or fn:endsWith(lowerFileName, '.xlsx')}">
                                                            <i class="far fa-file-excel file-icon text-success"></i>
                                                        </c:when>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.doc') or fn:endsWith(lowerFileName, '.docx')}">
                                                            <i class="far fa-file-word file-icon text-primary"></i>
                                                        </c:when>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.ppt') or fn:endsWith(lowerFileName, '.pptx')}">
                                                            <i class="far fa-file-powerpoint file-icon" style="color:#d24726;"></i>
                                                        </c:when>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.zip') or fn:endsWith(lowerFileName, '.rar') or fn:endsWith(lowerFileName, '.7z')}">
                                                            <i class="far fa-file-archive file-icon text-warning"></i>
                                                        </c:when>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.jpg') or fn:endsWith(lowerFileName, '.jpeg') or fn:endsWith(lowerFileName, '.png') or fn:endsWith(lowerFileName, '.gif') or fn:endsWith(lowerFileName, '.webp')}">
                                                            <i class="far fa-file-image file-icon text-info"></i>
                                                        </c:when>
                                                        <c:when test="${fn:endsWith(lowerFileName, '.txt') or fn:endsWith(lowerFileName, '.log')}">
                                                            <i class="far fa-file-alt file-icon text-secondary"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-file file-icon text-muted"></i>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <c:out value="${item.fileName}"/>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty item.insertDate}">
                                                            ${fn:substring(item.insertDate, 0, 19)}
                                                        </c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a class="download-link"
                                                       onclick="event.stopPropagation(); downloadRegistFile('${item.fileName}', '${item.filePath}')">
                                                        <i class="fas fa-download"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="3" class="file-empty-cell">첨부파일이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>

                        <div class="file-panel">
                            <div class="file-panel-head">사업자등록증</div>
                            <table class="table file-table m-0">
                                <thead>
                                <tr>
                                    <th style="width:80%;">파일명</th>
                                    <th style="width:20%;">다운로드</th>
                                </tr>
                                </thead>
                                <tbody id="businessFileTbody">
                                <tr>
                                    <td colspan="2" class="file-empty-cell">사업자 등록증을 불러오는 중입니다.</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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

<script>
    var businessFileListUrl = '<c:out value="${stPath}" />';
    var businessFileDownloadUrl = '<c:out value="${stDwPath}" />';
    var currentStoreCode = '<c:out value="${tbMannaStRegist.stCode}" />';

    $(function () {
        $(".btn_list").on("click", function () {
            location.href = "${path}/store/regist/list";
        });

        renderBusinessFileList();
    });

    function downloadRegistFile(fileName, filePath) {
        if (!filePath) {
            alert("다운로드 경로가 없습니다.");
            return;
        }

        var baseUrl = "${cwPath}";
        var fullPath = (filePath || "") + "/" + (fileName || "");
        var url = baseUrl + "?path=" + encodeURIComponent(fullPath);

        location.href = url;
    }

    function renderBusinessFileList() {
        var $tbody = $("#businessFileTbody");
        var listUrl = $.trim(businessFileListUrl || "");


        if (!listUrl) {
            console.warn("stPath 값이 없습니다. detail 페이지 재호출을 방지합니다.");

            $tbody.html(
                '<tr>' +
                '   <td colspan="2" class="file-empty-cell">사업자 등록증 목록 API 경로가 없습니다.</td>' +
                '</tr>'
            );
            return;
        }

        $tbody.html(
            '<tr>' +
            '   <td colspan="2" class="file-empty-cell">사업자 등록증을 불러오는 중입니다.</td>' +
            '</tr>'
        );

        $.ajax({
            url: listUrl,
            type: "POST",
            dataType: "json",
            data: {
                grpType: '3',
                grpCode: currentStoreCode,
                fileType: '1'
            },
            success: function (res) {
                var businessFiles = normalizeBusinessFiles(res.data.infoData);

                if (!businessFiles || businessFiles.length === 0) {
                    $tbody.html(
                        '<tr>' +
                        '   <td colspan="2" class="file-empty-cell">사업자 등록증이 없습니다.</td>' +
                        '</tr>'
                    );
                    return;
                }

                var html = "";

                businessFiles.forEach(function (item) {
                    var fileName = getBusinessFileName(item);
                    var displayFileName = getDisplayFileName(fileName);
                    var insertDate = getBusinessInsertDate(item);

                    if (!fileName) return;

                    html += ''
                        + '<tr class="file-row" onclick="openBusinessFile(\'' + escapeJs(fileName) + '\')">'
                        + '    <td class="file-name-cell" title="' + escapeHtml(fileName) + '">'
                        +          getFileIcon(displayFileName)
                        + '        ' + escapeHtml(displayFileName)
                        + '    </td>'
                        + '    <td>'
                        + '        <a class="download-link" title="다운로드"'
                        + '           onclick="event.stopPropagation(); openBusinessFile(\'' + escapeJs(fileName) + '\');">'
                        + '            <i class="fas fa-download"></i>'
                        + '        </a>'
                        + '    </td>'
                        + '</tr>';
                });

                if (!html) {
                    html =
                        '<tr>' +
                        '   <td colspan="2" class="file-empty-cell">사업자 등록증이 없습니다.</td>' +
                        '</tr>';
                }

                $tbody.html(html);
            },
            error: function (xhr) {
                console.error("사업자등록증 목록 조회 실패", xhr.status, xhr.responseText);

                $tbody.html(
                    '<tr>' +
                    '   <td colspan="2" class="file-empty-cell">사업자 등록증을 불러오지 못했습니다.</td>' +
                    '</tr>'
                );
            }
        });
    }

    function normalizeBusinessFiles(res) {
        if (!res) return [];

        if (Array.isArray(res)) {
            return res;
        }

        if (Array.isArray(res.data)) {
            return res.data;
        }

        if (Array.isArray(res.list)) {
            return res.list;
        }

        if (Array.isArray(res.result)) {
            return res.result;
        }

        if (Array.isArray(res.fileList)) {
            return res.fileList;
        }

        if (res.data && Array.isArray(res.data.list)) {
            return res.data.list;
        }

        if (res.result && Array.isArray(res.result.list)) {
            return res.result.list;
        }

        return [];
    }

    function getBusinessFileName(item) {
        if (!item) return "";

        if (typeof item === "string") {
            return item;
        }

        return item.fileName
            || item.filename
            || item.FILE_NAME
            || item.name
            || item.file_nm
            || item.fileNm
            || item.orgFileName
            || item.originalFileName
            || "";
    }

    function getBusinessInsertDate(item) {
        if (!item || typeof item === "string") return "-";

        var value = item.insertDate
            || item.regDate
            || item.createDate
            || item.createdAt
            || item.INSERT_DATE
            || item.regDt
            || item.createDt
            || "";

        if (!value) return "-";

        return String(value).substring(0, 19);
    }

    function openBusinessFile(fileName) {
        if (!fileName) {
            alert("파일명이 없습니다.");
            return;
        }

        var baseUrl = $.trim(businessFileDownloadUrl || "");

        if (!baseUrl) {
            alert("파일 보기 경로가 없습니다.");
            return;
        }

        var url = baseUrl + fileName;

        window.open(
            url,
            "businessFileViewer",
            "width=1100,height=850,scrollbars=yes,resizable=yes"
        );
    }

    function getFileIcon(fileName) {
        var lowerFileName = String(fileName || "").toLowerCase();

        if (lowerFileName.endsWith(".pdf")) {
            return '<i class="far fa-file-pdf file-icon text-danger"></i>';
        }

        if (lowerFileName.endsWith(".xls") || lowerFileName.endsWith(".xlsx")) {
            return '<i class="far fa-file-excel file-icon text-success"></i>';
        }

        if (lowerFileName.endsWith(".doc") || lowerFileName.endsWith(".docx")) {
            return '<i class="far fa-file-word file-icon text-primary"></i>';
        }

        if (lowerFileName.endsWith(".ppt") || lowerFileName.endsWith(".pptx")) {
            return '<i class="far fa-file-powerpoint file-icon" style="color:#d24726;"></i>';
        }

        if (lowerFileName.endsWith(".zip") || lowerFileName.endsWith(".rar") || lowerFileName.endsWith(".7z")) {
            return '<i class="far fa-file-archive file-icon text-warning"></i>';
        }

        if (
            lowerFileName.endsWith(".jpg") ||
            lowerFileName.endsWith(".jpeg") ||
            lowerFileName.endsWith(".png") ||
            lowerFileName.endsWith(".gif") ||
            lowerFileName.endsWith(".webp")
        ) {
            return '<i class="far fa-file-image file-icon text-info"></i>';
        }

        if (lowerFileName.endsWith(".txt") || lowerFileName.endsWith(".log")) {
            return '<i class="far fa-file-alt file-icon text-secondary"></i>';
        }

        return '<i class="far fa-file file-icon text-muted"></i>';
    }

    function escapeHtml(value) {
        return String(value || "")
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function escapeJs(value) {
        return String(value || "")
            .replace(/\\/g, "\\\\")
            .replace(/'/g, "\\'");
    }
    function getDisplayFileName(fileName) {
        if (!fileName) return "";

        var value = String(fileName);

        value = value.split("?")[0];
        value = value.split("#")[0];

        var parts = value.split("/");
        var lastName = parts[parts.length - 1];

        return lastName || value;
    }
</script>
</body>
</html>
