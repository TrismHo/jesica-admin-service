<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | 서비스 지역관리</title>

    <style>
        html, body {
            height: 100%;
        }

        .location-manager-page {
            height: calc(100vh - 150px);
            min-height: 760px;
        }

        .location-manager {
            display: flex;
            width: 100%;
            height: unset;
            overflow: hidden;
            border: 1px solid rgba(0,0,0,.08);
            border-radius: 12px;
            background: #fff;
        }

        .location-sidebar {
            width: 550px;
            min-width: 460px;
            display: flex;
            flex-direction: column;
            border-right: 1px solid rgba(0,0,0,.08);
            background: #f8f9fb;
        }

        .location-content {
            flex: 1;
            min-width: 0;
            display: flex;
            flex-direction: column;
            background: #fff;
        }

        .manager-toolbar {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
            padding: 14px 16px;
            background: #fff;
            border-bottom: 1px solid rgba(0,0,0,.08);
        }

        .manager-toolbar .title {
            font-size: 15px;
            font-weight: 700;
            color: #222;
            margin-right: 6px;
        }

        .sidebar-header,
        .content-header {
            padding: 11px;
            background: #fff;
            border-bottom: 1px solid rgba(0,0,0,.08);
        }

        .sidebar-title,
        .content-title {
            margin: 0;
            font-size: 15px;
            font-weight: 700;
            color: #222;
        }

        .sidebar-sub,
        .content-sub {
            margin-top: 4px;
            font-size: 12px;
            color: rgba(0,0,0,.5);
        }

        .sidebar-body {
            flex: 1;
            overflow: auto;
            padding: 16px;
        }

        .content-body {
            flex: 1;
            min-height: 0;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        /* ===== 왼쪽 기본정보 테이블 ===== */
        .info-table-wrap {
            border: 1px solid rgba(0,0,0,.08);
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
        }

        .info-table {
            width: 100%;
            margin: 0;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .info-table col.label-col { width: 110px; }
        .info-table col.input-col { width: auto; }
        .info-table col.guide-col { width: 130px; }

        .info-table td {
            border-bottom: 1px solid rgba(0,0,0,.08);
            border-right: 1px solid rgba(0,0,0,.08);
            padding: 10px 12px;
            vertical-align: middle;
            word-break: break-word;
        }

        .info-table tr:last-child td {
            border-bottom: 0;
        }

        .info-table td:last-child {
            border-right: 0;
        }

        .info-table .label {
            background: #f8f9fa;
            font-weight: 600;
            color: #333;
        }

        .info-table .guide {
            color: #d9534f;
            font-size: 12px;
            line-height: 1.35;
        }

        .info-table input[type="text"],
        .info-table input[type="url"],
        .info-table input[type="tel"],
        .info-table select,
        .info-table textarea,
        .info-table .form-control {
            width: 100% !important;
            max-width: 100%;
            box-sizing: border-box;
            min-width: 0;
        }

        .info-table .bi-cell {
            padding-top: 14px;
            padding-bottom: 14px;
        }

        /* ===== BI ===== */
        .biRow {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
        }

        .biLeft {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
        }

        .biPick {
            cursor: pointer;
            user-select: none;
        }

        .biThumb {
            max-height: 120px;
            max-width: 200px;
            border: 1px solid rgba(0,0,0,.08);
            border-radius: 10px;
            padding: 15px;
            background: #fff;
            object-fit: contain;
            display: none;
        }

        .biEmpty {
            width: 200px;
            height: 64px;
            border: 1px dashed rgba(0,0,0,0.25);
            border-radius: 10px;
            background: rgba(255,255,255,0.7);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            line-height: 1.1;
        }

        .biEmptyTitle {
            font-weight: 700;
            font-size: 12px;
            color: rgba(0,0,0,0.65);
        }

        .biEmptySub {
            font-size: 11px;
            color: rgba(0,0,0,0.45);
            margin-top: 3px;
        }

        .biHint {
            margin-top: 8px;
            font-size: 12px;
            color: rgba(0,0,0,0.45);
        }

        #btnBiClear {
            min-width: 68px;
        }

        #btnBiClear:disabled {
            opacity: .45;
            cursor: not-allowed;
        }

        /* ===== 오른쪽 지역추가 영역 ===== */
        .location-addbar {
            padding: 7px 16px;
            border-bottom: 1px solid rgba(0,0,0,.08);
            background: #fff;
        }

        .location-addbar .row-inline {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        /* ===== 오른쪽 목록(file manager 스타일) ===== */
        .location-list-wrap {
            flex: 1;
            min-height: 0;
            overflow: hidden;
            background: #fff;
        }

        .location-scroll-area {
            height: 100%;
            overflow-y: auto;
            overflow-x: auto;
        }

        .location-list-table {
            width: 100%;
            min-width: 860px;
        }



        .location-list-table td,
        .location-list-table th {
            padding-top: 5px !important;
            padding-bottom: 5px !important;
            vertical-align: middle !important;
        }

        .location-list-table tbody tr.loc-row.unsaved {
            background: #fffdf5;
        }

        .location-list-table tbody tr.loc-empty td {
            padding: 28px 10px !important;
            color: rgba(0,0,0,.45);
        }

        .loc-new {
            background: #ffe9a8;
            color: #8a5b00;
            font-weight: 600;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            display: inline-block;
            line-height: 1;
        }

        .loc-icon {
            width: 28px;
            text-align: center;
        }

        .btn-soft {
            border: 1px solid rgba(0,0,0,.08);
            background: #fff;
            color: #333;
        }

        @media (max-width: 1200px) {
            .location-manager {
                flex-direction: column;
                height: auto;
            }

            .location-sidebar {
                width: 100%;
                min-width: 100%;
                border-right: 0;
                border-bottom: 1px solid rgba(0,0,0,.08);
            }

            .location-manager-page {
                height: auto;
                min-height: auto;
            }

            .location-list-wrap {
                min-height: 420px;
            }
        }
        .table td, .table th {
            padding-left: 10px;
            vertical-align: middle;
            border: 0px;
            border-top: 1px solid #e4e7ea;
        }
        .table {
            border : 0px;
        }
        .panel-box {
            background: #fff;
            border: 1px solid #ddd;
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
        <div class="d-flex align-items-center justify-content-between flex-wrap m-b-15">
            <div>
                <h3 class="rix-title m-b-5">서비스 지역관리 상세</h3>
            </div>

            <ol class="breadcrumb m-b-0">
                <li class="breadcrumb-item"><a href="javascript:;">시스템 운영</a></li>
                <li class="breadcrumb-item"><a href="${path}/system/location/list">서비스 지역관리</a></li>
                <li class="breadcrumb-item active">서비스 지역관리 상세</li>
            </ol>
        </div>

        <div class="location-manager-page">
            <div class="location-manager">

                <!-- LEFT -->
                <div class="location-sidebar">
                    <div class="sidebar-header" style="padding:11px; border-bottom:0;">
                        <h4 class="sidebar-title">서비스 기본정보</h4>
                    </div>

                    <div class="table-responsive">
                        <form id="update_form" class="update_form">
                            <input type="hidden" name="serviceNo" value="${service.serviceNo}">
                            <input type="hidden" name="dataStatus" value="${service.dataStatus}">
                            <input type="hidden" name="removeServiceBi" id="removeServiceBi" value="0">

                            <table class="table table-condensed table-bordered table-compact m-b-0">
                                <tr>
                                    <td class="bg-light width-150">서비스번호</td>
                                    <td>
                                        <input type="text" class="form-control width-full" value="${service.serviceNo}" disabled>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="bg-light">서비스지역</td>
                                    <td>
                                        <input type="text"
                                               class="form-control width-full serviceName"
                                               name="serviceName"
                                               value="${service.serviceName}"
                                               maxlength="100">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">브랜드코드</td>
                                    <td>
                                        <input type="text"
                                               class="form-control width-full brandTypeCd"
                                               name="brandTypeCd"
                                               value="${service.brandTypeCd}"
                                               maxlength="10">
                                    </td>
                                </tr>

                                <tr>
                                    <td class="bg-light">고객센터</td>
                                    <td>
                                        <input type="text"
                                               class="form-control width-full csTel"
                                               name="csTel"
                                               value="${service.csTel}"
                                               maxlength="40">
                                    </td>
                                </tr>

                                <tr>
                                    <td class="bg-light">카카오채널 URL</td>
                                    <td>
                                        <input type="text"
                                               class="form-control width-full kakaoUrl"
                                               name="kakaoUrl"
                                               value="${service.kakaoUrl}"
                                               maxlength="100">
                                    </td>
                                </tr>

                                <tr>
                                    <td class="bg-light">서비스 BI</td>
                                    <td>
                                        <input type="file" id="serviceBi" name="serviceBi" accept="image/*" style="display:none;">

                                        <div class="biRow">
                                            <div class="biLeft">
                                                <img
                                                        id="serviceBiPreview"
                                                        class="biThumb biPick"
                                                        alt="서비스 BI"
                                                        style="display:none;"
                                                        src="<c:if test='${not empty service.serviceBi}'>${path}/api/img/fileLoad?filePath=${fn:escapeXml(service.serviceBi)}</c:if>"
                                                />

                                                <div id="serviceBiErr" class="biEmpty biPick" style="display:none;">
                                                    <div class="biEmptyTitle">이미지 경로 오류</div>
                                                    <div class="biEmptySub">클릭해서 이미지 선택</div>
                                                </div>

                                                <div id="serviceBiEmpty" class="biEmpty biPick">
                                                    <div class="biEmptyTitle">BI 없음</div>
                                                    <div class="biEmptySub">클릭해서 이미지 선택</div>
                                                </div>
                                            </div>

                                            <button type="button" class="btn btn-outline-danger btn-sm" id="btnBiClear">제거</button>
                                        </div>

                                        <div class="biHint">권장: PNG / 투명 배경</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="bg-light">등록일</td>
                                    <td>
                                        <input type="text"
                                               class="form-control width-full"
                                               value="<javatime:format value='${service.insertDate}' pattern='yyyy-MM-dd HH:mm:ss'/>"
                                               disabled>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="m-t-10">
                            <button type="button" class="btn btn-primary btn_list float-left m-r-5">
                                <i class="fa fa-list m-r-3"></i> 목록
                            </button>
                            <button type="button" class="btn btn-primary btn_up float-left m-r-5">
                                <i class="fa fa-check m-r-3"></i> 수정
                            </button>
                            <button type="button"
                                    class="btn btn-danger btn_remove float-left m-r-5"
                                    data-service-no="${service.serviceNo}">
                                <i class="fa fa-trash-alt m-r-3"></i> 삭제
                            </button>
                        </div>
                    </div>
                </div>

                <!-- RIGHT -->
                <div class="location-content">
                    <div class="content-header">
                        <h4 class="content-title">서비스 지역 목록</h4>
                    </div>

                    <div class="content-body">
                        <div class="location-addbar">
                            <div class="row-inline">
                                <select class="form-control width-140 selectArea">
                                    <c:forEach var="a1" items="${sysCodeList}">
                                        <option
                                                value="${a1.sysCode}"
                                                <c:if test="${a1.codeName eq '서울' or a1.codeName eq '서울특별시'}">
                                                    selected
                                                </c:if>
                                        >
                                                ${a1.codeName}
                                        </option>
                                    </c:forEach>
                                </select>

                                <select class="form-control width-180 selectArea2" disabled>
                                    <option value="">불러오는 중...</option>
                                </select>

                                <button
                                        type="button"
                                        class="btn btn-primary"
                                        id="selectAddr"
                                        disabled
                                >
                                    <i class="fa fa-plus"></i> 지역추가
                                </button>
                            </div>
                        </div>

                        <div class="location-list-wrap">
                            <div data-scrollbar="true" data-skip-mobile="true" data-height="100%" class="p-0 ps ps--active-y location-scroll-area" style="height: 100%;">
                                <table id="locationTable" class="table table-striped table-borderless table-sm m-0 text-nowrap location-list-table">
                                    <thead>
                                    <tr class="border-bottom">
                                        <th class="w-10px ps-10px"></th>
                                        <th class="px-10px">지역명</th>
                                        <th class="px-10px w-100px">구분</th>
                                        <th class="px-10px w-200px">등록일</th>
                                        <th class="px-10px w-100px">삭제</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty locationList}">

                                            <c:forEach var="loc" items="${locationList}">

                                                <%-- 현재 등록된 주소 코드 문자열 정규화 --%>
                                                <c:set
                                                        var="currentAddr1"
                                                        value="${fn:trim(fn:escapeXml(loc.addr1))}"
                                                />

                                                <c:set
                                                        var="currentAddr2"
                                                        value="${fn:trim(fn:escapeXml(loc.addr2))}"
                                                />

                                                <%-- A1 지역명 초기화 --%>
                                                <c:set var="a1Name" value="" />
                                                <c:set var="a1Matched" value="false" />

                                                <%-- A1 코드와 지역명 매칭 --%>
                                                <c:forEach var="a1" items="${sysCodeList}">
                                                    <c:set
                                                            var="currentA1Code"
                                                            value="${fn:trim(fn:escapeXml(a1.sysCode))}"
                                                    />

                                                    <c:if test="${not a1Matched and currentA1Code eq currentAddr1}">
                                                        <c:set var="a1Name" value="${a1.codeName}" />
                                                        <c:set var="a1Matched" value="true" />
                                                    </c:if>
                                                </c:forEach>

                                                <%-- A1 매칭 실패 시 코드 자체를 표시 --%>
                                                <c:if test="${empty a1Name}">
                                                    <c:set var="a1Name" value="${currentAddr1}" />
                                                </c:if>


                                                <%-- A2 지역명 초기화 --%>
                                                <c:set var="a2Name" value="" />
                                                <c:set var="a2Matched" value="false" />

                                                <c:choose>
                                                    <%-- addr2가 0이면 해당 시도 전체 --%>
                                                    <c:when test="${empty currentAddr2 or currentAddr2 eq '0'}">
                                                        <c:set var="currentAddr2" value="0" />
                                                        <c:set var="a2Name" value="전체" />
                                                        <c:set var="a2Matched" value="true" />
                                                    </c:when>

                                                    <%-- addr2가 존재하면 A2 목록과 매칭 --%>
                                                    <c:otherwise>
                                                        <c:forEach var="a2" items="${sysCodeList2}">
                                                            <c:set
                                                                    var="currentA2Code"
                                                                    value="${fn:trim(fn:escapeXml(a2.sysCode))}"
                                                            />

                                                            <c:if test="${not a2Matched and currentA2Code eq currentAddr2}">
                                                                <c:set var="a2Name" value="${a2.codeName}" />
                                                                <c:set var="a2Matched" value="true" />
                                                            </c:if>
                                                        </c:forEach>

                                                        <%-- A2 매칭 실패 시 빈칸 대신 코드 표시 --%>
                                                        <c:if test="${empty a2Name}">
                                                            <c:set var="a2Name" value="${currentAddr2}" />
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>


                                                <tr
                                                        class="loc-row"
                                                        data-key="${fn:escapeXml(currentAddr1)}::${fn:escapeXml(currentAddr2)}"
                                                >
                                                    <td class="ps-10px border-0 text-center">
                                                        <c:choose>
                                                            <c:when test="${currentAddr2 eq '0'}">
                                                                <i class="fa fa-map text-warning fa-lg"></i>
                                                            </c:when>

                                                            <c:otherwise>
                                                                <i class="fa fa-map-marker-alt text-info fa-lg"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td class="px-10px border-0">
                    <span>
                        <c:out value="${a1Name}" />

                        <c:if test="${currentAddr2 ne '0'}">
                            / <c:out value="${a2Name}" />
                        </c:if>
                    </span>

                                                        <input
                                                                type="hidden"
                                                                name="addr1"
                                                                value="<c:out value='${currentAddr1}' />"
                                                        >

                                                        <input
                                                                type="hidden"
                                                                name="addr2"
                                                                value="<c:out value='${currentAddr2}' />"
                                                        >
                                                    </td>

                                                    <td class="px-10px">
                                                        <c:choose>
                                                            <c:when test="${currentAddr2 eq '0'}">
                                                                시전체
                                                            </c:when>

                                                            <c:otherwise>
                                                                시군구
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td class="px-10px">
                                                        <c:choose>
                                                            <c:when test="${not empty loc.insertDate}">
                                                                <javatime:format
                                                                        value="${loc.insertDate}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"
                                                                />
                                                            </c:when>

                                                            <c:otherwise>
                                                                -
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td class="px-10px border-0">
                                                        <button
                                                                type="button"
                                                                class="btn btn-danger btn-sm btn_del_location"
                                                        >
                                                            삭제
                                                        </button>
                                                    </td>
                                                </tr>

                                            </c:forEach>
                                        </c:when>

                                        <c:otherwise>
                                            <tr class="loc-empty">
                                                <td colspan="5" class="text-center">
                                                    데이터가 없습니다.
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
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
    function renumberLocations() {
        if ($("#locationTable tbody tr.loc-row").length === 0) {
            if ($("#locationTable tbody tr.loc-empty").length === 0) {
                $("#locationTable tbody").append(
                    '<tr class="loc-empty">' +
                    '   <td colspan="5" class="text-center">데이터가 없습니다.</td>' +
                    '</tr>'
                );
            }
        } else {
            $("#locationTable tbody tr.loc-empty").remove();
        }
    }

    function keyOf(a1, a2) {
        return String(a1) + "::" + String(a2);
    }

    function existsRow(a1, a2) {
        var key = keyOf(a1, a2);
        var found = false;

        $("#locationTable tbody tr.loc-row").each(function () {
            var rowKey = String($(this).attr("data-key") || "");

            if (rowKey === key) {
                found = true;
                return false;
            }
        });

        return found;
    }

    function collectLocationList() {
        var arr = [];

        $("#locationTable tbody tr.loc-row").each(function () {
            var addr1 = $(this).find("input[name='addr1']").val();
            var addr2 = $(this).find("input[name='addr2']").val();

            if (!addr1) {
                return;
            }

            arr.push({
                serviceNo: $("input[name='serviceNo']").val(),
                addr1: String(addr1),
                addr2: String(addr2 || "0")
            });
        });

        return arr;
    }

    /**
     * A1에 해당하는 A2 지역 목록 조회
     */
    function fetchA2Options(a1, done) {
        if (!a1) {
            done([]);
            return;
        }

        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/area/list",
            data: {
                sysType: "A2",
                sysCode: String(a1) + "%"
            },
            dataType: "json",
            success: function (data) {
                var list = [];

                if (data && Array.isArray(data.systemCodeList)) {
                    list = data.systemCodeList;
                }

                done(list);
            },
            error: function (xhr) {
                console.error("A2 지역 조회 실패", xhr);
                done([]);
            }
        });
    }

    var area2Loading = false;

    /**
     * A2 셀렉트 박스 구성
     */
    function loadA2Options(a1, selectedA2) {
        var $area2 = $(".selectArea2");
        var $selectAddr = $("#selectAddr");

        if (!a1) {
            $area2
                .empty()
                .append(
                    $("<option>", {
                        value: "",
                        text: "주소1을 선택해주세요."
                    })
                )
                .prop("disabled", true);

            $selectAddr.prop("disabled", true);
            area2Loading = false;

            return;
        }

        area2Loading = true;

        $area2
            .empty()
            .append(
                $("<option>", {
                    value: "",
                    text: "불러오는 중..."
                })
            )
            .prop("disabled", true);

        $selectAddr.prop("disabled", true);

        fetchA2Options(a1, function (list) {
            var addedCodes = {};

            $area2.empty();

            $area2.append(
                $("<option>", {
                    value: "0",
                    text: "전체"
                })
            );

            for (var i = 0; i < list.length; i++) {
                var item = list[i];

                if (!item || item.sysCode === undefined || item.sysCode === null) {
                    continue;
                }

                var sysCode = $.trim(String(item.sysCode));
                var codeName = $.trim(String(item.codeName || ""));

                if (!sysCode || !codeName) {
                    continue;
                }

                if (addedCodes[sysCode]) {
                    continue;
                }

                addedCodes[sysCode] = true;

                $area2.append(
                    $("<option>", {
                        value: sysCode,
                        text: codeName
                    })
                );
            }

            var targetA2 = selectedA2 === undefined ||
            selectedA2 === null ||
            selectedA2 === ""
                ? "0"
                : String(selectedA2);

            var targetExists = false;

            $area2.find("option").each(function () {
                if (String($(this).val()) === targetA2) {
                    targetExists = true;
                    return false;
                }
            });

            if (targetExists) {
                $area2.val(targetA2);
            } else {
                $area2.val("0");
            }

            $area2.prop("disabled", false);
            $selectAddr.prop("disabled", false);

            area2Loading = false;
        });
    }

    /**
     * 서울 A1 옵션을 찾아 선택
     */
    function selectInitialSeoulArea() {
        var $area1 = $(".selectArea");
        var seoulValue = "";

        $area1.find("option").each(function () {
            var value = $.trim(String($(this).val() || ""));
            var text = $.trim($(this).text());

            /*
             * 프로젝트 코드가 11이면 코드로 먼저 찾고,
             * 그렇지 않으면 서울 또는 서울특별시라는 이름으로 찾습니다.
             */
            if (
                value === "11" ||
                text === "서울" ||
                text === "서울특별시" ||
                text.indexOf("서울") === 0
            ) {
                seoulValue = value;
                return false;
            }
        });

        if (seoulValue) {
            $area1.val(seoulValue);
        }

        return $area1.val();
    }

    function hideAllBiUIs() {
        $("#serviceBiPreview").hide();
        $("#serviceBiEmpty").hide();
        $("#serviceBiErr").hide();
    }

    function showBiNotRegistered() {
        hideAllBiUIs();
        $("#serviceBiEmpty").show();
        $("#btnBiClear").prop("disabled", true);
    }

    function showBiPathError() {
        hideAllBiUIs();
        $("#serviceBiErr").show();
        $("#btnBiClear").prop("disabled", false);
    }

    function showBiImage() {
        hideAllBiUIs();
        $("#serviceBiPreview").show();
        $("#btnBiClear").prop("disabled", false);
    }

    function bindBiImgHandlers() {
        var $img = $("#serviceBiPreview");

        $img.off("load.bi error.bi");

        $img.on("load.bi", function () {
            showBiImage();
        });

        $img.on("error.bi", function () {
            $(this).attr("src", "").hide();
            $("#removeServiceBi").val("0");
            showBiPathError();
        });
    }

    $(function () {
        /*
         * BI 초기화
         */
        (function initBi() {
            var src = $.trim($("#serviceBiPreview").attr("src") || "");

            if (!src) {
                showBiNotRegistered();
                return;
            }

            bindBiImgHandlers();

            var imgEl = $("#serviceBiPreview").get(0);

            if (imgEl && imgEl.complete) {
                if (imgEl.naturalWidth > 0) {
                    showBiImage();
                } else {
                    showBiPathError();
                }
            } else {
                hideAllBiUIs();
            }
        })();

        /*
         * 최초 진입 시 서울 선택 후 서울 A2 조회
         */
        var initialA1 = selectInitialSeoulArea();

        if (initialA1) {
            loadA2Options(initialA1, "0");
        } else {
            $(".selectArea2")
                .empty()
                .append(
                    $("<option>", {
                        value: "",
                        text: "주소1을 선택해주세요."
                    })
                )
                .prop("disabled", true);

            $("#selectAddr").prop("disabled", true);
        }

        /*
         * A1 변경 시 해당 지역의 A2 재조회
         */
        $(".selectArea").on("change", function () {
            var a1 = $(this).val();

            loadA2Options(a1, "0");
        });

        /*
         * BI 클릭
         */
        $(document).on(
            "click",
            "#serviceBiPreview, #serviceBiEmpty, #serviceBiErr",
            function () {
                $("#serviceBi").trigger("click");
            }
        );

        /*
         * BI 파일 선택
         */
        $(document).on("change", "#serviceBi", function () {
            var file = this.files && this.files[0];

            $("#removeServiceBi").val("0");

            if (!file) {
                return;
            }

            if (file.type && file.type.indexOf("image/") !== 0) {
                alert("이미지 파일만 업로드 가능합니다.");
                $(this).val("");
                return;
            }

            var reader = new FileReader();

            reader.onload = function (e) {
                $("#serviceBiPreview").attr("src", e.target.result);
                showBiImage();
            };

            reader.readAsDataURL(file);
        });

        /*
         * BI 제거
         */
        $(document).on("click", "#btnBiClear", function () {
            $("#serviceBi").val("");
            $("#removeServiceBi").val("1");
            showBiNotRegistered();
        });

        /*
         * 목록 이동
         */
        $(".btn_list").on("click", function () {
            location.href = "${path}/system/location/list";
        });

        /*
         * 지역 추가
         */
        $(document).on("click", "#selectAddr", function () {
            if (area2Loading) {
                alert("주소2 목록을 불러오는 중입니다.");
                return;
            }

            var addr1 = $(".selectArea").val();
            var addr2 = $(".selectArea2").val();

            var addr1Name = $.trim(
                $(".selectArea option:selected").text()
            );

            var addr2Name = $.trim(
                $(".selectArea2 option:selected").text()
            );

            if (!addr1) {
                alert("주소1(A1)을 선택해주세요.");
                return;
            }

            if (
                addr2 === undefined ||
                addr2 === null ||
                addr2 === ""
            ) {
                alert("주소2(A2)를 선택해주세요.");
                return;
            }

            addr1 = String(addr1);
            addr2 = String(addr2);

            if (existsRow(addr1, addr2)) {
                alert("이미 추가된 지역입니다.");
                return;
            }

            var key = keyOf(addr1, addr2);

            var iconHtml = addr2 === "0"
                ? '<i class="fa fa-map text-warning fa-lg"></i>'
                : '<i class="fa fa-map-marker-alt text-info fa-lg"></i>';

            var nameText = addr1Name;

            if (addr2 !== "0") {
                nameText += " / " + addr2Name;
            }

            var sizeText = addr2 === "0"
                ? "시전체"
                : "시군구";

            var typeText =
                '<span class="loc-new">신규</span>';

            var permissionText =
                '<button type="button" ' +
                'class="btn btn-danger btn-sm btn_del_location">' +
                '삭제' +
                '</button>';

            var row =
                '<tr class="loc-row unsaved" data-key="' + key + '">' +
                '   <td class="ps-10px border-0 text-center">' +
                iconHtml +
                '   </td>' +
                '   <td class="px-10px border-0">' +
                nameText +
                '       <input type="hidden" name="addr1" value="' + addr1 + '">' +
                '       <input type="hidden" name="addr2" value="' + addr2 + '">' +
                '   </td>' +
                '   <td class="px-10px">' +
                sizeText +
                '   </td>' +
                '   <td class="px-10px">' +
                typeText +
                '   </td>' +
                '   <td class="px-10px border-0">' +
                permissionText +
                '   </td>' +
                '</tr>';

            $("#locationTable tbody").append(row);

            renumberLocations();
        });

        /*
         * 지역 행 삭제
         */
        $(document).on("click", ".btn_del_location", function () {
            $(this).closest("tr").remove();
            renumberLocations();
        });

        /*
         * 서비스 삭제
         */
        $(".btn_remove").on("click", function () {
            var url = "${path}/api/system/location/delete";
            var serviceNo = $(this).data("service-no");

            swal({
                title: "삭제 하시겠습니까?",
                icon: "warning",
                buttons: ["취소", "삭제"],
                dangerMode: true
            }).then(function (isConfirm) {
                if (!isConfirm) {
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        serviceNo: serviceNo
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.result == 200) {
                            alert("삭제되었습니다.");
                            location.href = "${path}/system/location/list";
                        } else {
                            alert(
                                data.message ||
                                "삭제에 실패하였습니다."
                            );
                        }
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.");
                    }
                });
            });
        });

        /*
         * 서비스 수정
         */
        $(".btn_up").on("click", function () {
            var url = "${path}/api/system/location/update";
            var req = convertFormToObj($("#update_form"));

            if (isNull(req.serviceName)) {
                return alert_focus(
                    "serviceName",
                    "서비스지역을 입력해주세요."
                );
            }

            if (isNull(req.brandTypeCd)) {
                return alert_focus(
                    "brandTypeCd",
                    "브랜드코드를 입력해주세요."
                );
            }

            var updateForm = document.getElementById("update_form");
            var formData = new FormData(updateForm);

            var biInput = document.getElementById("serviceBi");
            var biFile = biInput && biInput.files
                ? biInput.files[0]
                : null;

            if (biFile) {
                formData.set("serviceBi", biFile);
            } else {
                formData.delete("serviceBi");
            }

            formData.append(
                "tbAppService",
                new Blob(
                    [JSON.stringify(req)],
                    {
                        type: "application/json"
                    }
                )
            );

            var locationList = collectLocationList();

            formData.append(
                "locationList",
                new Blob(
                    [JSON.stringify(locationList)],
                    {
                        type: "application/json"
                    }
                )
            );

            swal({
                title: "수정하시겠습니까?",
                icon: "warning",
                buttons: ["취소", "수정"],
                dangerMode: true
            }).then(function (isConfirm) {
                if (!isConfirm) {
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.result == 200) {
                            alert("수정되었습니다.");
                            location.reload();
                        } else {
                            alert(
                                data.message ||
                                "수정에 실패하였습니다."
                            );
                        }
                    },
                    error: function (xhr) {
                        console.error("서비스 지역 수정 실패", xhr);
                        alert("수정에 실패하였습니다.");
                    }
                });
            });
        });

        renumberLocations();
    });
</script>
</body>
</html>
