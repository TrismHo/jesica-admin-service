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
                                        <option value="${a1.sysCode}">${a1.codeName}</option>
                                    </c:forEach>
                                </select>

                                <select class="form-control width-180 selectArea2">
                                    <option value="0">전체</option>
                                    <c:forEach var="a2" items="${sysCodeList2}">
                                        <option value="${a2.sysCode}">${a2.codeName}</option>
                                    </c:forEach>
                                </select>

                                <button type="button" class="btn btn-primary" id="selectAddr">
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
                                                <c:set var="a1Name" value="" />
                                                <c:forEach var="a1" items="${sysCodeList}">
                                                    <c:if test="${a1.sysCode == loc.addr1}">
                                                        <c:set var="a1Name" value="${a1.codeName}" />
                                                    </c:if>
                                                </c:forEach>

                                                <c:set var="a2Name" value="" />
                                                <c:if test="${loc.addr2 == '0'}">
                                                    <c:set var="a2Name" value="전체" />
                                                </c:if>
                                                <c:if test="${loc.addr2 != '0'}">
                                                    <c:forEach var="a2" items="${sysCodeList2}">
                                                        <c:if test="${a2.sysCode == loc.addr2}">
                                                            <c:set var="a2Name" value="${a2.codeName}" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>

                                                <tr class="loc-row" data-key="${loc.addr1}::${loc.addr2}">
                                                    <td class="ps-10px border-0 text-center">
                                                        <c:choose>
                                                            <c:when test="${loc.addr2 == '0'}">
                                                                <i class="fa fa-map text-warning fa-lg"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fa fa-map-marker-alt text-info fa-lg"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-10px border-0">
                                                            ${a1Name}<c:if test="${loc.addr2 != '0'}"> / ${a2Name}</c:if>
                                                        <input type="hidden" name="addr1" value="${loc.addr1}">
                                                        <input type="hidden" name="addr2" value="${loc.addr2}">
                                                    </td>
                                                    <td class="px-10px">
                                                        <c:choose>
                                                            <c:when test="${loc.addr2 == '0'}">시전체</c:when>
                                                            <c:otherwise>시군구</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-10px">
                                                        <javatime:format value="${loc.insertDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                    <td class="px-10px border-0">
                                                        <button type="button" class="btn btn-danger btn-sm btn_del_location">삭제</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="loc-empty">
                                                <td colspan="5" class="text-center">데이터가 없습니다.</td>
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
                $("#locationTable tbody").append('<tr class="loc-empty"><td colspan="5" class="text-center">데이터가 없습니다.</td></tr>');
            }
        } else {
            $("#locationTable tbody tr.loc-empty").remove();
        }
    }

    function keyOf(a1, a2){
        return String(a1) + "::" + String(a2);
    }

    function existsRow(a1, a2){
        var key = keyOf(a1, a2);
        var found = false;

        $("#locationTable tbody tr.loc-row").each(function(){
            if ($(this).data("key") === key) {
                found = true;
                return false;
            }
        });

        return found;
    }

    function collectLocationList() {
        var arr = [];

        $("#locationTable tbody tr.loc-row").each(function(){
            var addr1 = $(this).find("input[name='addr1']").val();
            var addr2 = $(this).find("input[name='addr2']").val();

            if (!addr1) return;

            arr.push({
                serviceNo: $("input[name='serviceNo']").val(),
                addr1: addr1,
                addr2: addr2
            });
        });

        return arr;
    }

    function fetchA2Options(a1, done) {
        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/area/list",
            data: { sysType: "A2", sysCode: a1 + "%" },
            dataType: "json",
            success: function(data){
                done((data && data.systemCodeList) ? data.systemCodeList : []);
            },
            error: function(){
                done([]);
            }
        });
    }

    function hideAllBiUIs(){
        $("#serviceBiPreview").hide();
        $("#serviceBiEmpty").hide();
        $("#serviceBiErr").hide();
    }

    function showBiNotRegistered(){
        hideAllBiUIs();
        $("#serviceBiEmpty").show();
        $("#btnBiClear").prop("disabled", true);
    }

    function showBiPathError(){
        hideAllBiUIs();
        $("#serviceBiErr").show();
        $("#btnBiClear").prop("disabled", false);
    }

    function showBiImage(){
        hideAllBiUIs();
        $("#serviceBiPreview").show();
        $("#btnBiClear").prop("disabled", false);
    }

    function bindBiImgHandlers(){
        var $img = $("#serviceBiPreview");

        $img.off("load.bi error.bi");

        $img.on("load.bi", function(){
            showBiImage();
        });

        $img.on("error.bi", function(){
            $(this).attr("src", "").hide();
            $("#removeServiceBi").val("0");
            showBiPathError();
        });
    }

    $(function () {

        (function initBi(){
            var src = $.trim($("#serviceBiPreview").attr("src") || "");

            if (!src) {
                showBiNotRegistered();
                return;
            }

            bindBiImgHandlers();

            var imgEl = $("#serviceBiPreview").get(0);
            if (imgEl && imgEl.complete) {
                if (imgEl.naturalWidth > 0) showBiImage();
                else showBiPathError();
            } else {
                hideAllBiUIs();
            }
        })();

        $(document).on("click", "#serviceBiPreview, #serviceBiEmpty, #serviceBiErr", function(){
            $("#serviceBi").trigger("click");
        });

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
            reader.onload = function(e){
                $("#serviceBiPreview").attr("src", e.target.result);
                showBiImage();
            };
            reader.readAsDataURL(file);
        });

        $(document).on("click", "#btnBiClear", function(){
            $("#serviceBi").val("");
            $("#removeServiceBi").val("1");
            showBiNotRegistered();
        });

        $(".btn_list").on("click", function () {
            location.href = "${path}/system/location/list";
        });

        var area2Loading = false;

        $(".selectArea").on("change", function (){
            var a1 = $(this).val();

            area2Loading = true;

            $(".selectArea2").html("<option value=''>불러오는 중...</option>");
            $(".selectArea2").prop("disabled", true);
            $("#selectAddr").prop("disabled", true);

            fetchA2Options(a1, function(list){
                $(".selectArea2").html("");
                $(".selectArea2").append("<option value='0'>전체</option>");

                for (var i = 0; i < list.length; i++) {
                    $(".selectArea2").append(
                        "<option value='" + list[i].sysCode + "'>" + list[i].codeName + "</option>"
                    );
                }

                $(".selectArea2").prop("disabled", false);
                $("#selectAddr").prop("disabled", false);
                area2Loading = false;
            });
        });

        $(document).on("click", "#selectAddr", function () {
            if (area2Loading) {
                alert("주소2 목록을 불러오는 중입니다. 잠시 후 다시 시도해주세요.");
                return;
            }

            var addr1 = $(".selectArea").val();
            var addr2 = $(".selectArea2").val();

            var addr1Name = $(".selectArea option:selected").text();
            var addr2Name = $(".selectArea2 option:selected").text();

            if (!addr1) {
                alert("주소1(A1)을 선택해주세요.");
                return;
            }

            if (addr2 === "") {
                alert("주소2(A2) 목록을 불러오는 중입니다.");
                return;
            }

            if (existsRow(addr1, addr2)) {
                alert("이미 추가된 지역입니다.");
                return;
            }

            var key = keyOf(addr1, addr2);

            var iconHtml = (addr2 === "0")
                ? '<i class="fa fa-map text-warning fa-lg"></i>'
                : '<i class="fa fa-map-marker-alt text-info fa-lg"></i>';

            var nameText = addr1Name + (addr2 === "0" ? "" : " / " + addr2Name);
            var sizeText = (addr2 === "0") ? "시전체" : "시군구";
            var typeText = '<span class="loc-new">신규</span>';
            var permissionText = ''
                + '<button type="button" class="btn btn-danger btn-sm btn_del_location">'
                + '삭제'
                + '</button>';

            var row = ''
                + '<tr class="loc-row unsaved" data-key="' + key + '">'
                + '  <td class="ps-10px border-0 text-center">' + iconHtml + '</td>'
                + '  <td class="px-10px border-0">'
                +        nameText
                + '      <input type="hidden" name="addr1" value="' + addr1 + '">'
                + '      <input type="hidden" name="addr2" value="' + addr2 + '">'
                + '  </td>'
                + '  <td class="px-10px">' + sizeText + '</td>'
                + '  <td class="px-10px">' + typeText + '</td>'
                + '  <td class="px-10px border-0">' + permissionText + '</td>'
                + '</tr>';

            $("#locationTable tbody").append(row);
            renumberLocations();
        });

        $(document).on("click", ".btn_del_location", function () {
            $(this).closest("tr").remove();
            renumberLocations();
        });

        $(".btn_remove").on("click", function () {
            var url = "${path}/api/system/location/delete";
            var serviceNo = $(this).data("service-no");

            swal({
                title: "삭제 하시겠습니까?",
                icon: "warning",
                buttons: ["취소", "삭제"],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (!isConfirm) return;

                $.ajax({
                    type: "POST",
                    url: url,
                    data: { serviceNo: serviceNo },
                    dataType: "json",
                    success: function (data) {
                        if (data.result == 200) {
                            alert("삭제되었습니다.");
                            location.href = "${path}/system/location/list";
                        } else {
                            alert("삭제에 실패하였습니다.");
                        }
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.");
                    }
                });
            });
        });

        $(".btn_up").on("click", function(){
            var url = "${path}/api/system/location/update";
            var req = convertFormToObj($("#update_form"));

            if (isNull(req.serviceName)) {
                return alert_focus("serviceName", "서비스지역을 입력해주세요.");
            }

            if (isNull(req.brandTypeCd)) {
                return alert_focus("brandTypeCd", "브랜드코드를 입력해주세요.");
            }

            var formData = new FormData(document.getElementById("update_form"));
            var biFile = document.getElementById("serviceBi").files[0];

            if (biFile) {
                formData.append("serviceBi", biFile);
            }

            formData.append("tbAppService", new Blob([JSON.stringify(req)], {type:"application/json"}));

            var locationList = collectLocationList();
            formData.append("locationList", new Blob([JSON.stringify(locationList)], {type:"application/json"}));

            swal({
                title: "수정하시겠습니까?",
                icon: "warning",
                buttons: ["취소", "수정"],
                dangerMode: true
            }).then(function(isConfirm){
                if(!isConfirm) return;

                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function(data){
                        if (data.result == 200) {
                            alert("수정되었습니다.");
                            location.reload();
                        } else {
                            alert(data.message || "수정에 실패하였습니다.");
                        }
                    },
                    error: function(){
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
