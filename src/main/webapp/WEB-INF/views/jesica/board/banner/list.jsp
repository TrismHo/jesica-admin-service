<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>

    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.delivernotice1" text="메인 배너 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | <spring:message code="sidemenu.boardmanagement.delivernotice1" text="메인 배너 관리"/></title>
    </c:if>

    <style>
        div.dataTables_wrapper div.dataTables_processing { border: 1px solid #eee; z-index: 1; }

        /* ✅ DataTable row를 컴팩트하게 */
        #testTable tbody td { padding: 6px 8px !important; vertical-align: middle; }
        #testTable tbody tr { height: 46px; }

        /* ✅ 리스트 이미지 크기 축소 */
        #testTable img.bannerThumb {
            width: 200px;
            height: 34px;
            object-fit: cover;
            border: 1px solid #eee;
            border-radius: 6px;
            display: block;
            margin: 0 auto;
        }
        /* =========================
    SORT MODAL - CLEAN STYLE
    ========================= */

        /* 모달 기본 정리 */
        #sort_modal .modal-content{
            border-radius: 10px;
            border: 1px solid #e9ecef;
        }

        #sort_modal .panel{
            margin: 0;
            border: 0;
        }

        #sort_modal .panel-heading{
            background: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            padding: 12px 15px;
        }

        #sort_modal .panel-title{
            font-size: 15px;
            font-weight: 700;
            color: #343a40;
        }

        #sort_modal .modal-body{
            background: #ffffff;
            padding: 15px;
        }

        /* 설명 문구 */
        #sort_modal #explain{
            margin-bottom: 10px;
            font-size: 13px;
            color: #6c757d;
        }

        /* 테이블 */
        #sortTable{
            border-collapse: separate !important;
            border-spacing: 0;
        }

        #sortTable thead th{
            background: #f8f9fa !important;
            border: 1px solid #dee2e6 !important;
            font-size: 12px;
            font-weight: 600;
            padding: 8px;
        }

        #sortableTbody tr{
            background: #ffffff;
            border-bottom: 1px solid #f1f3f5;
            transition: background .15s ease;
        }

        #sortableTbody tr:hover{
            background: #f8f9fa;
        }

        #sortableTbody td{
            border-bottom: 1px solid #ddd !important;
            border: none;
            padding: 10px 8px !important;
            vertical-align: middle;
        }

        /* 컬럼별 안정 정렬 */
        #sortableTbody .col-order{
            width: 70px;
            font-weight: 600;
            color: #495057;
        }

        #sortableTbody .col-board{
            width: 120px;
            font-weight: 600;
            color: #495057;
        }

        #sortableTbody .col-date{
            width: 160px;
            font-size: 12px;
            color: #6c757d;
        }

        #sortableTbody .col-title{
            text-align: left;
            font-weight: 600;
            color: #212529;
            max-width: 420px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* 이미지 */
        #sortableTbody .col-thumb{
            width: 220px;
        }

        #sortableTbody .thumbBox{
            width: 190px;
            height: 54px;
            border-radius: 6px;
            overflow: hidden;
            border: 1px solid #dee2e6;
            background: #f8f9fa;

            display: flex;              /* ✅ 핵심 */
            align-items: center;        /* ✅ 수직 중앙 */
            justify-content: center;    /* ✅ 수평 중앙 */

            margin: 0 auto;
            font-size: 12px;
            color: #6c757d;
        }

        #sortableTbody .thumbBox img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        /* 드래그 핸들 */
        #sortableTbody .dragHandle{
            display:inline-flex;
            align-items:center;
            justify-content:center;
            width: 30px;
            height: 30px;
            border-radius: 4px;
            background: #f1f3f5;
            color: #6c757d;
            cursor: grab;
            font-size: 16px;
        }

        #sortableTbody .dragHandle:hover{
            background:#e9ecef;
        }

        #sortableTbody tr.ui-sortable-helper{
            background:#ffffff;
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
        }

        #sortableTbody tr.ui-sortable-placeholder{
            height: 70px;
            background: #f1f3f5;
        }
        .modal-content {
            width: 100%;
        }
        /* =========================
   CENTER TOAST
========================= */

        .center-toast{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.95);
            min-width: 240px;
            max-width: 320px;
            padding: 14px 20px;
            background: #ffffff;
            border: 1px solid #e5e7eb;   /* 옅은 border */
            border-radius: 10px;
            font-size: 14px;
            font-weight: 500;
            color: #333;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            opacity: 0;
            transition: all .25s ease;
            z-index: 9999;
            pointer-events: none;
        }

        .center-toast.show{
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }

        .center-toast.success{
            border-color: #d1e7dd;
        }

        .center-toast.error{
            border-color: #f5c2c7;
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="게시판 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.delivernotice12" text="메인 배너 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.delivernotice12" text="메인 배너 관리"/></h3>
            </div>

            <form name="frmSearch" id="frmSearch">
                <input type="hidden" name="serviceType" value="0">

                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
                            <div class="search-field">
                                <div class="search-label">서비스지역</div>
                                <div class="search-control-group">
                                    <select id="appService" name="serviceNo" class="form-control">
                                        <c:forEach var="s" items="${appServiceList}">
                                            <option value="${s.serviceNo}"
                                                    <c:if test="${searchValue.serviceNo == s.serviceNo}">selected</c:if>>
                                                    ${s.serviceName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="search-actions">
                                <button type="button"
                                        class="btn btn-search-inline"
                                        onclick="searchFormFunction()">
                                    <i class="fa fa-search"></i>
                                    검색
                                </button>

                                <button type="button"
                                        class="insert_btn btn btn-search-inline ml-1">
                                    <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="배너 등록"/></span>
                                </button>

                                <button type="button"
                                        class="update_orders_btn btn btn-search-inline ml-1"
                                        data-toggle="modal"
                                        data-target="#sort_modal">
                                    <span class="fa fa-list">&nbsp;<spring:message code="list.search.noticeregistration1" text="순서 변경"/></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="panel-body">
                <table id="testTable" class="listTable display table compact-table table-striped">
                    <thead>
                    <tr class="text-center">
                        <th width="5%"><spring:message code="list.word.no1" text="번호"/></th>
                        <th width="8%"><spring:message code="list.word.no1" text="앱코드"/></th>
                        <th width="14%"><spring:message code="list.word.merchant/deliverygroupname1" text="배너 이미지"/></th>
                        <th width="10%"><spring:message code="list.word.merchant/deliverygroupname1" text="서비스지역"/></th>
                        <th width="10%"><spring:message code="list.word.serviceclassification" text="플랫폼구분"/></th>
                        <th width="8%"><spring:message code="list.word.serviceclassification11" text="언어"/></th>
                        <th><spring:message code="list.word.contents1" text="서비스 타입"/></th>
                        <th><spring:message code="list.word.division1" text="게시판 종류"/></th>
                        <th width="10%"><spring:message code="list.word.registrationdate1" text="등록일"/></th>
                        <th width="8%"><spring:message code="list.word.status1" text="노출여부"/></th>
                        <th width="6%"><spring:message code="list.word.registrationdate1" text="노출순서"/></th>
                    </tr>
                    </thead>
                </table>
            </div>

        </div>
    </div>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>

<!-- ✅ 순서변경 모달: 테이블 기반 -->
<!-- ✅ 순서변경 모달: 예전 panel 디자인 + 테이블 기반 sortable -->
<div class="modal fade" id="sort_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <!-- ✅ 예전 디자인: panel heading -->
            <div class="panel panel-inverse m-b-0">
                <div class="panel-heading">
                    <h4 class="panel-title" id="sortManageTitle">
                        <spring:message code="sidemenu.boardmanagement.delivernotice1" text="배너 노출 순서 변경"/>
                    </h4>
                    <div class="panel-heading-btn">
                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger"
                           data-dismiss="modal" aria-label="Close">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="modal-body">

                <div class="m-b-10 d-flex align-items-center flex-wrap" style="gap:10px;">
          <span style="font-weight:600; min-width:90px;">
            <spring:message code="list.search.postclassification1" text="서비스지역"/>
          </span>

                    <select id="sortServiceNo" class="form-control" style="width:220px;">
                        <c:forEach var="s" items="${appServiceList}">
                            <option value="${s.serviceNo}">${s.serviceName}</option>
                        </c:forEach>
                    </select>

                    <small class="text-muted">서비스 변경 시 목록이 다시 로드됩니다.</small>
                </div>

                <p id="explain" class="text-muted m-b-10">
                    드래그해서 순서를 바꾸면 자동 저장됩니다.
                </p>

                <div class="table-responsive">
                    <table id="sortTable" class="table table-bordered table-striped m-b-0" style="text-align:center;">
                        <thead class="bg-light">
                        <tr>
                            <th style="width:70px;">순서</th>
                            <th style="width:220px;">이미지</th>
                            <th style="width:120px;">게시판</th>
                            <th>제목</th>
                            <th style="width:160px;">등록일시</th>
                            <th style="width:48px;"></th>
                        </tr>
                        </thead>
                        <tbody id="sortableTbody"></tbody>
                    </table>
                </div>

                <div class="no-sort-item"></div>

                <small class="text-muted d-block m-t-8" style="font-size:13px;">
                    * 드래그로 순서변경이 가능합니다.
                </small>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-grey float-right" data-dismiss="modal">
                    <spring:message code="sidemenu.boardmanagement.delivernotice1" text="닫기"/>
                </button>
            </div>

        </div>
    </div>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    let table = null;
    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            }
            else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    var newExportAction = function (e, dt, button, config) {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {
            var self = this;
            var oldStart = dt.settings()[0]._iDisplayStart;

            dt.one('preXhr', function (e, s, data) {
                // Just this once, load all data from the server...
                data.start = 0;
                data.length = 2147483647;

                dt.one('preDraw', function (e, settings) {
                    // Call the original action function
                    oldExportAction(self, e, dt, button, config);

                    dt.one('preXhr', function (e, s, data) {
                        // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                        // Set the property to what it was before exporting.
                        settings._iDisplayStart = oldStart;
                        data.start = oldStart;
                    });

                    // Reload the grid with the original page. Otherwise,
                    // API functions like table.cell(this) don't work properly.
                    setTimeout(dt.ajax.reload, 0);

                    // Prevent rendering of the full data to the DOM
                    return false;
                });
            });

            // Requery the server with the new one-time export settings
            dt.ajax.reload();
        }
    };
    // ✅ 모달용 sortable init 한번만
    function initSortableOnceForTable() {
        if (window.__bannerSortInited) return;
        window.__bannerSortInited = true;

        $("#sortableTbody").sortable({
            items: "tr",
            handle: ".dragHandle", // ✅ 이거 추가 (핸들로만 드래그)
            helper: function (e, tr) {
                const originals = tr.children();
                const helper = tr.clone();
                helper.children().each(function (index) {
                    $(this).width(originals.eq(index).width());
                });
                return helper;
            },
            update: function () {
                const bannerNos = $("#sortableTbody").sortable("toArray");
                saveBannerOrder(bannerNos);
            }
        });
    }

    function loadBannerSortList() {
        // ✅ 서버 컨트롤러가 serviceType/platformType 요구하니까 그걸로 보냄
        const serviceNo = $("#sortServiceNo").val(); // (현재는 serviceNo지만 이름만 맞춰서 전송)
        const platformType = getPlatformType();

        $.ajax({
            type: "GET",
            url: "${path}/api/banner/sortList",
            data: { serviceNo: serviceNo },
            dataType: "json",
            success: function (res) {
                const list = res.listBannerSort || [];
                drawSortTable(list);
                try { $("#sortableTbody").sortable("refresh"); } catch(e) {}
            },
            error: function () {
                $("#sortableTbody").empty();
                $(".no-sort-item").html("<div class='text-center p-3 text-danger'>목록 조회 실패</div>");
            }
        });
    }

    function drawSortTable(list) {
        $("#sortableTbody").empty();
        $(".no-sort-item").empty();

        if (!list || list.length === 0) {
            $("#explain").hide();
            $(".no-sort-item").html("<div class='text-center p-3'>노출되는 배너가 없습니다.</div>");
            return;
        }
        $("#explain").show();

        list.sort((a,b) => (Number(a.viewOrder)||0) - (Number(b.viewOrder)||0));

        const serviceName = $("#sortServiceNo option:selected").text();
        $("#sortManageTitle").text((serviceName && serviceName !== "전체" ? serviceName + " " : "") + "배너 노출 순서 변경");

        for (const r of list) {
            const title = r.title ? escapeHtml(r.title) : "제목없음";
            const boardText = convertBoardType(r.boardType);
            const insertDate = r.insertDate ? String(r.insertDate).replaceAll("T"," ") : "-";
            const imgPath = r.bannerFile ? ("/api/img/fileLoad?filePath=" + r.bannerFile) : "";

            const thumbHtml = imgPath
                ? ("<div class='thumbBox'><img src='" + imgPath + "' onerror=\"this.src='${path}/assets/img/logo/logo-noimg.gif'\" /></div>")
                : ("<div class='thumbBox'>No Image</div>");

            $("#sortableTbody").append(
                "<tr id='" + r.bannerNo + "'>" +
                "<td class='col-order'>" + (r.viewOrder ?? "") + "</td>" +
                "<td class='col-thumb'>" + thumbHtml + "</td>" +         // ✅ 2번째: 이미지
                "<td class='col-board'>" + boardText + "</td>" +
                "<td class='col-title' title='" + title + "'>" + title + "</td>" +
                "<td class='col-date'>" + insertDate + "</td>" +
                "<td class='col-handle'><span class='dragHandle'>☰</span></td>" +  // ✅ 핸들
                "</tr>"
            );
        }
    }

    function saveBannerOrder(bannerNos) {
        $.ajax({
            type: "POST",
            url: "${path}/api/banner/update/viewOrder",
            contentType: "application/json",
            data: JSON.stringify({ bannerNos: bannerNos }),
            success: function () {
                // ✅ 1) 모달 목록 재조회 (서버 기준으로 viewOrder 다시 그림)
                loadBannerSortList();

                // ✅ 2) 메인 테이블도 갱신 (현재 페이지 유지)
                $("#testTable").DataTable().ajax.reload(null, false);
                showToast("순서가 저장되었습니다.", "success");
                // (선택) a료lert은 너무 자주 뜨면 빡셈 → 토스트/한번만 추천
                // alert("변경 완료");
            },
            error: function () {
                // 폴백: GET
                $.ajax({
                    type: "GET",
                    url: "${path}/api/banner/update/viewOrder?bannerNos=" + bannerNos.join(","),
                    success: function () {
                        loadBannerSortList();
                        $("#testTable").DataTable().ajax.reload(null, false);
                        showCenterToast("순서가 저장되었습니다.", "success");
                    },
                    error: function () {
                        showCenterToast("순서 저장 실패", "error");
                    }
                });
            }
        });
    }
    function showCenterToast(message, type = "success"){
        const toast = document.getElementById("centerToast");
        toast.className = "center-toast " + type;
        toast.innerText = message;

        toast.classList.add("show");

        setTimeout(() => {
            toast.classList.remove("show");
        }, 1500);
    }
    function searchFormFunction() {
        $("#testTable").DataTable().ajax.reload();
    }

    function convertBoardType(boardType) {
        if (boardType == 1) return "이벤트";
        if (boardType == 2) return "공지";
        if (boardType == 3) return "앱화면";
        return "연결없음";
    }

    function escapeHtml(str) {
        return String(str)
            .replaceAll("&", "&amp;")
            .replaceAll("<", "&lt;")
            .replaceAll(">", "&gt;")
            .replaceAll('"', "&quot;")
            .replaceAll("'", "&#039;");
    }

    // ✅ 플랫폼 값이 고정이면 여기만 바꿔
    function getPlatformType() {
        // 예: 회사에 따라
        const company = "${sessionScope.sessionKey.company}";
        if (company === "jesicar") return 1;
        if (company === "yangpa") return 2;
        return 1;
    }

    $(function () {
        $(".insert_btn").on("click", () => location.href = "${path}/board/banner/insert");

        // ✅ DataTable
        table = $("#testTable").ajaxDataTable(
            "frmSearch",
            "${path}/api/banner/main/list",
            "A5",
            "1",
            true,
            {
                columns: [
                    { data: "listIndex" },
                    { data: "appName" },
                    {
                        data: "bannerFile",
                        render: function(data) {
                            if (!data) return "<div style='background-color:#fff;width:200px;height:30px;border:1px dashed #ddd;border-radius:6px;display:flex;align-items:center;justify-content:center;color:#999;'>No Image</div>";
                            return "<img class='bannerThumb' src='/api/img/fileLoad?filePath=" + data + "' onerror=\"this.src='${path}/assets/img/logo/logo-noimg.gif'\" />";
                        }
                    },
                    { data: "serviceName" },
                    {
                        data: "platformType",
                        render: function(data) {
                            if (data == 1) return "제시카";
                            if (data == 2) return "온동네";
                            if (data == 3) return "세날";
                            return "사용안함";
                        }
                    },
                    {
                        data: "langCode",
                        render: function(data) {
                            if (data == "ko") return "한국어";
                            if (data == "en") return "영어";
                            if (data == "zh-CN") return "중국어";
                            if (data == "ms") return "말레이어";
                            return "-";
                        }
                    },
                    {
                        data: "serviceType",
                        render: function(data) {
                            if (data == 0) return "메인";
                            if (data == 2) return "탁송";
                            if (data == 3) return "맛집";
                            if (data == 4) return "마트";
                            if (data == 5) return "맛집예약";
                            return "-";
                        }
                    },
                    {
                        data: "boardType",
                        render: function(data) {
                            if (data == 1) return "이벤트";
                            if (data == 2) return "공지";
                            if (data == 3) return "앱화면";
                            return "연결없음";
                        }
                    },
                    { data: "insertDate", render: function(data){ return dateFormat(data); } },
                    { data: "viewYn", render: function(data){ return (data == 1) ? "노출" : "<span class='text-red'>숨김</span>"; } },
                    { data: "viewOrder" }
                ],
                columnDefs: [{ targets: "_all", className: "text-center" }],
            }
        );

        $("#testTable_filter").hide();

        $("#testTable").on("click", "tbody tr", function () {
            const row = $("#testTable").DataTable().row(this).data();
            if (!row) return;
            location.href = "${path}/board/banner/detail?bannerNo=" + row.bannerNo;
        });

        $("#appService").on("change", () => searchFormFunction());

        // ✅ 모달 열릴 때 1번만
        $("#sort_modal").on("shown.bs.modal", function () {
            const currentService = $("#appService").val() || "";
            $("#sortServiceNo").val(currentService);

            initSortableOnceForTable();
            loadBannerSortList();
        });

        // ✅ 모달 서비스 변경시 재조회
        $(document).on("change", "#sortServiceNo", function () {
            loadBannerSortList();
        });
    });
</script>
<div id="centerToast" class="center-toast"></div>
</body>
</html>
