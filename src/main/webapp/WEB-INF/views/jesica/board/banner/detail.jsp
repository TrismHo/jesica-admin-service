<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>

    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.1" text="메인 배너 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | <spring:message code="list.detail.1" text="메인 배너 관리"/></title>
    </c:if>
</head>
<style>
    .panel-box {
        background: #fff;
        border: 1px solid #ddd;
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
    <div id="content" class="content p-20">
        <div class="notice-detail-page">
            <div class="notice-detail-header">
                <ol class="breadcrumb float-xl-right p-r-10 m-b-10">
                    <li class="breadcrumb-item"><spring:message code="sidemenu.1" text="게시판 관리"/></li>
                    <li class="breadcrumb-item">
                        <a href="${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=&platformType=1">
                            <spring:message code="sidemenu.workgroupmanagement.1" text="메인 배너 관리"/>
                        </a>
                    </li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.1" text="메인 배너 상세"/></li>
                </ol>
                <h3 class="notice-detail-title"><spring:message code="list.detail.1" text="메인 배너 상세"/></h3>
            </div>

            <div class="detail-shell">
                <div class="detail-section">
                    <div class="section-head">
                        <h4 class="section-title">배너 기본 정보</h4>
                    </div>

                    <div class="section-body">
                        <form name="update_form" id="update_form">
                            <input type="hidden" name="bannerNo" id="bannerNo" value="${tbAppBanner.bannerNo}">
                            <input type="hidden" name="dataStatus" value="1">
                            <input type="hidden" name="platformType" value="2">
                            <input type="hidden" name="bannerType" value="${tbAppBanner.bannerType}">
                            <input type="hidden" name="serviceType" value="0">
                            <input type="hidden" name="viewOrder" class="form-control viewOrder" value="${tbAppBanner.viewOrder}" readonly>

                            <div class="main-grid">
                                <div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">노출 및 서비스 설정</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>노출여부</th>
                                                <td>
                                                    <div class="radio-group">
                                                        <label>
                                                            <input type="radio" name="viewYn" value="0" <c:if test="${tbAppBanner.viewYn == 0}">checked</c:if>>
                                                            <span>숨김</span>
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="viewYn" value="1" <c:if test="${tbAppBanner.viewYn == 1}">checked</c:if>>
                                                            <span>노출</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>언어선택</th>
                                                <td>
                                                    <select name="langCode" class="form-control" style="max-width: 240px;">
                                                        <c:forEach var="item2" items="${sysLangCode}">
                                                            <option value="${item2.sysCode}" <c:if test="${tbAppBanner.langCode == item2.sysCode}">selected</c:if>>
                                                                    ${item2.codeName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <th>앱코드</th>
                                                <td>
                                                    <c:if test="${empty appCode}">
                                                        <select name="appCode" class="form-control" style="max-width: 240px;">
                                                            <c:forEach var="appCodeList" items="${appVersionList}">
                                                                <option value="${appCodeList.sysCode}" <c:if test="${tbAppBanner.appCode == appCodeList.sysCode}">selected</c:if>>
                                                                        ${appCodeList.codeName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${!empty appCode}">
                                                        <input type="text" class="form-control" name="appCode" readonly value="${appCode}" style="max-width: 240px;">
                                                    </c:if>
                                                </td>
                                            </tr>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">연결 설정</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>게시판 종류</th>
                                                <td>
                                                    <div class="radio-group">
                                                        <label>
                                                            <input type="radio" name="boardType" class="boardType" value="0" <c:if test="${tbAppBanner.boardType == 0}">checked</c:if>>
                                                            <span>연결안함</span>
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="boardType" class="boardType" value="1" <c:if test="${tbAppBanner.boardType == 1}">checked</c:if>>
                                                            <span>이벤트</span>
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="boardType" class="boardType" value="2" <c:if test="${tbAppBanner.boardType == 2}">checked</c:if>>
                                                            <span>공지</span>
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="boardType" class="boardType" value="3" <c:if test="${tbAppBanner.boardType == 3}">checked</c:if>>
                                                            <span>앱화면</span>
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="boardType" class="boardType" value="4" <c:if test="${tbAppBanner.boardType == 4}">checked</c:if>>
                                                            <span>외부링크</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr class="boardSelect" <c:if test="${tbAppBanner.boardType == 3 || tbAppBanner.boardType == 4 || tbAppBanner.boardType == 0}">style="display:none"</c:if>>
                                                <th>게시글 선택</th>
                                                <td>
                                                    <input type="hidden" name="boardNo" class="selBoardNo" id="boardNo" value="${tbAppBanner.boardNo}">
                                                    <div style="display:flex; align-items:center; gap:8px; flex-wrap:wrap;">
                                                        <button type="button" data-toggle="modal" data-target="#board_search_modal" class="btn btn-primary board-search-btn">
                                                            <span class="fa fa-search m-r-3"></span> 게시글 검색
                                                        </button>
                                                        <span id="board_title" class="meta-text"></span>
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- 앱화면 선택 -->
                                            <tr class="appScreenSelect"
                                                <c:if test="${tbAppBanner.boardType != 3}">style="display:none"</c:if>>
                                                <th>앱화면</th>
                                                <td>
                                                    <select id="appScreenSchemeUrl"
                                                            class="form-control"
                                                            style="max-width: 420px;">
                                                        <option value="">앱화면을 선택해주세요.</option>

                                                        <option value="specialty?stCode=S09090"
                                                                <c:if test="${tbAppBanner.boardType == 3 && tbAppBanner.schemeUrl == 'specialty?stCode=S09090'}">
                                                                    selected
                                                                </c:if>>
                                                            특산물 메인
                                                        </option>

                                                        <%--
                                                        추후 앱화면이 추가되면 option만 확장하면 됩니다.

                                                        <option value="special02"
                                                                <c:if test="${tbAppBanner.boardType == 3 && tbAppBanner.schemeUrl == 'special02'}">
                                                                    selected
                                                                </c:if>>
                                                            스페셜 화면 2
                                                        </option>
                                                        --%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <!-- 외부링크 입력 -->
                                            <tr class="externalLinkInput"
                                                <c:if test="${tbAppBanner.boardType != 4}">style="display:none"</c:if>>
                                                <th>외부링크 URL</th>
                                                <td>
                                                    <input type="text"
                                                           id="externalSchemeUrl"
                                                           class="form-control w-100"
                                                           value="<c:if test="${tbAppBanner.boardType == 4}">${tbAppBanner.schemeUrl}</c:if>"
                                                           placeholder="https://example.com"
                                                           autocomplete="off"
                                                           style="max-width: 420px;">
                                                </td>
                                            </tr>

                                            <!-- 백엔드로 실제 전송되는 공통값 -->
                                            <input type="hidden"
                                                   id="schemeUrl"
                                                   name="schemeUrl"
                                                   value="${tbAppBanner.schemeUrl}">

                                            <tr>
                                                <th>서비스지역</th>
                                                <td>
                                                    <select name="serviceNo" class="form-control" style="max-width: 240px;">
                                                        <c:forEach var="serviceList" items="${appServiceList}">
                                                            <option value="${serviceList.serviceNo}" <c:if test="${tbAppBanner.serviceNo == serviceList.serviceNo}">selected</c:if>>
                                                                    ${serviceList.serviceName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-box" style="margin-top: 10px;">
                                <div class="panel-box-head">배너 이미지</div>
                                <table class="compact-table">
                                    <tbody>
                                    <tr>
                                        <th>이미지</th>
                                        <td>
                                            <div style="display:flex; gap:16px; align-items:flex-start; flex-wrap:wrap;">
                                                <div class="sort_body1" id="sort_body1" style="width: 360px; max-width: 100%;">
                                                    <c:choose>
                                                        <c:when test="${not empty imgFile}">
                                                            <img class="width-full" style="max-height:300px; object-fit:contain;"
                                                                 src="${path}/api/img/fileLoad?filePath=${imgFile}"
                                                                 onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="width-full" style="max-height:300px; object-fit:contain;"
                                                                 src="${path}/assets/img/logo/logo-noimg.gif">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <div style="min-width: 220px;">
                                                    <div class="muted" style="margin-bottom:10px;">권장 이미지 비율 : 32:9</div>
                                                    <div class="deliverymanFileName1" style="margin-bottom:6px;"></div>
                                                    <div class="deliverymanFileSize1" style="margin-bottom:12px;"></div>

                                                    <label for="imgFile" style="margin:0;">
                                                        <div class="btn btn-primary">
                                                            <div>파일선택</div>
                                                        </div>
                                                    </label>
                                                    <input type="file" id="imgFile" name="imgFile" class="fileBtn d-none" accept="image/*">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>

                        <div class="bottom-actions">
                            <div>
                                <button type="button" class="btn btn-primary btn_list">
                                    <i class="fa fa-list m-r-3"></i> 목록
                                </button>
                            </div>

                            <div class="action-right">
                                <c:if test="${permission == 2}">
                                    <button type="button" class="btn btn-primary btn_update">
                                        <i class="fa fa-check m-r-3"></i> 수정
                                    </button>

                                    <button type="button" class="btn btn-danger btn_remove">
                                        <i class="fa fa-trash-alt m-r-3"></i> 삭제
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!-- end scroll to top btn -->
</div>
<style >
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
</style>

<div class="modal fade" id="board_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/boardSearch.jsp" %>
</div>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->

<!-- ================== CUSTOM JS ================== -->
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    // =========================================================
    // ✅ Pending/Stalled 방지: jqXHR 전역 추적 + 페이지 이동 시 abort
    // =========================================================
    const __pendingXhrs = new Set();

    function trackXhr(xhr) {
        if (!xhr) return xhr;
        __pendingXhrs.add(xhr);
        xhr.always(() => __pendingXhrs.delete(xhr));
        return xhr;
    }

    function abortAllPending() {
        __pendingXhrs.forEach((xhr) => {
            try {
                if (xhr && xhr.readyState !== 4) xhr.abort();
            } catch (e) {}
        });
        __pendingXhrs.clear();
    }

    $(window).on("beforeunload", function () {
        abortAllPending();
    });

    $(() => {

        // bannerType 변경시 영역 노출
        $(document).on("change","[name='bannerType']", function(){
            let bannerType = $("input[type='radio'][name='bannerType']:checked").val();
            if(bannerType == 1){
                $("#selectAddr").attr("disabled",false);
                $(".location_tr").css("display","");
            } else {
                $("#selectAddr").attr("disabled",true);
                $(".location_tr").css("display","none");
            }
        });

        // boardType 변경시 입력 UI 토글
        // boardType에 맞는 연결 입력 영역 표시
        function toggleBoardTypeFields(boardTypeValue, resetValue) {
            const selectedBoardType = String(boardTypeValue);

            $(".boardSelect").hide();
            $(".appScreenSelect").hide();
            $(".externalLinkInput").hide();

            if (selectedBoardType === "0") {
                // 연결안함
                if (resetValue) {
                    $("#boardNo").val("");
                    $("#board_title").text("");
                    $("#appScreenSchemeUrl").val("");
                    $("#externalSchemeUrl").val("");
                    $("#schemeUrl").val("");
                }

                return;
            }

            if (selectedBoardType === "1" || selectedBoardType === "2") {
                // 이벤트 / 공지
                $(".boardSelect").show();

                if (resetValue) {
                    $("#appScreenSchemeUrl").val("");
                    $("#externalSchemeUrl").val("");
                    $("#schemeUrl").val("");
                }

                return;
            }

            if (selectedBoardType === "3") {
                // 앱화면
                $(".appScreenSelect").show();

                if (resetValue) {
                    $("#boardNo").val("");
                    $("#board_title").text("");
                    $("#externalSchemeUrl").val("");
                    $("#schemeUrl").val(
                        $("#appScreenSchemeUrl").val() || ""
                    );
                }

                return;
            }

            if (selectedBoardType === "4") {
                // 외부링크
                $(".externalLinkInput").show();

                if (resetValue) {
                    $("#boardNo").val("");
                    $("#board_title").text("");
                    $("#appScreenSchemeUrl").val("");
                    $("#schemeUrl").val(
                        $.trim($("#externalSchemeUrl").val())
                    );
                }
            }
        }

        $(document).on("change", "input[name='boardType']", function() {
            toggleBoardTypeFields($(this).val(), true);
        });

        // =========================
        // 지역 삭제
        // =========================
        $(document).on("click", ".deleteLocation", function() {
            let bnrLocNo = $(this).attr("bnrLocNo");

            trackXhr($.ajax({
                type: "POST",
                url: "${path}/api/banner/location/delete",
                data: { bnrLocNo : bnrLocNo, bannerNo : ${tbAppBanner.bannerNo} },
                dataType: "json",
                timeout: 15000,
                success: function(data) {
                    let list = data.bannerList || [];
                    $(".areaTbody").html("");

                    if (list.length === 0) {
                        $(".areaTbody").append("<tr><td colspan='3' class='text-center'>데이터가 없습니다.</td></tr>");
                        return;
                    }

                    for (let i = 0 ; i < list.length ; i++){
                        if(!list[i].codeName2) list[i].codeName2 = "";
                        $(".areaTbody").append(
                            "<tr>" +
                            "  <td style='width:84px'>" + (list[i].codeName1 || "") + "</td>" +
                            "  <td style='width:98px'>" + (list[i].codeName2 || "") + "</td>" +
                            "  <td style='width:98px'>" +
                            "    <input type='button' bnrLocNo='"+ list[i].bnrLocNo +"' class='btn-sm btn-danger btn-companion deleteLocation' value='삭제'>" +
                            "  </td>" +
                            "</tr>"
                        );
                    }
                }
            }));
        });

        // =========================
        // 지역 추가
        // =========================
        $("#selectAddr").click(function() {
            let code1 = $(".selectArea").val();
            let code2 = $(".selectArea2").val();

            trackXhr($.ajax({
                type: "POST",
                url: "${path}/api/banner/location/add",
                data: { addr1 : code1, addr2 : code2 , bannerNo : ${tbAppBanner.bannerNo} },
                dataType: "json",
                timeout: 15000,
                success: function(data) {
                    let list = data.bannerList || [];
                    $(".areaTbody").html("");

                    if (list.length === 0) {
                        $(".areaTbody").append("<tr><td colspan='3' class='text-center'>데이터가 없습니다.</td></tr>");
                        return;
                    }

                    for (let i = 0 ; i < list.length ; i++){
                        if(!list[i].codeName2) list[i].codeName2 = "";
                        $(".areaTbody").append(
                            "<tr>" +
                            "  <td style='width:84px'>" + (list[i].codeName1 || "") + "</td>" +
                            "  <td style='width:98px'>" + (list[i].codeName2 || "") + "</td>" +
                            "  <td style='width:98px'>" +
                            "    <input type='button' bnrLocNo='"+ list[i].bnrLocNo +"' class='btn-sm btn-danger btn-companion deleteLocation' value='삭제'>" +
                            "  </td>" +
                            "</tr>"
                        );
                    }
                }
            }));
        });

        // =========================
        // 시/도 변경 시 군/구 리스트
        // =========================
        $(".selectArea").on("change", function (){
            trackXhr($.ajax({
                type: "POST",
                url: "${path}/api/system/code/area/list",
                data: { sysType : "A2", sysCode : $(this).val()+"%" },
                dataType: "json",
                timeout: 15000,
                success: function(data) {
                    let list = data.systemCodeList || [];
                    $(".selectArea2").html("").append("<option value='0'>전체</option>");
                    for (let i = 0 ; i < list.length ; i++){
                        $(".selectArea2").append("<option value='"+ list[i].sysCode +"'>"+ list[i].codeName +"</option>");
                    }
                }
            }));
        });

        // =========================
        // 초기 게시글 타이틀 표시 (중복/대기 방지)
        // =========================
        let platformType = 2;
        let boardType = $("input[type='radio'][name='boardType']:checked").val();
        let boardNo = $("#boardNo").val();
        let originBoardTitle = '';

        let boardSearchXhr = null;

        const loadBoardTitle = () => {
            if (
                String(boardType) === "0" ||
                String(boardType) === "3" ||
                String(boardType) === "4"
            ) {
                $(".selBoardNo").val("");
                $("#board_title").text("");
                originBoardTitle = "";
                return;
            }
            if (!boardNo) {
                $('.selBoardNo').val('');
                $('#board_title').text('');
                originBoardTitle = '';
                return;
            }

            if (boardSearchXhr && boardSearchXhr.readyState !== 4) {
                try { boardSearchXhr.abort(); } catch (e) {}
            }

            boardSearchXhr = trackXhr($.ajax({
                type: "GET",
                url: "${path}/api/board/search",
                data: { platformType, boardType, boardNo },
                dataType: "json",
                cache: false,
                timeout: 15000,
                success: function (data) {
                    const list = data && Array.isArray(data.boardList) ? data.boardList : [];
                    if (list.length === 0) {
                        $('.selBoardNo').val('');
                        $('#board_title').text('');
                        originBoardTitle = '';
                        return;
                    }

                    const item = list[0];
                    const title = item.title ?? "";
                    const insertDate = item.insertDate ? convertInsertDate(item.insertDate) : "";
                    const boardTitle = title + "[" + insertDate + "]";

                    let selectedBoardNo = '';
                    if (boardType == 1) selectedBoardNo = item.eventNo ?? '';
                    else if (boardType == 2) selectedBoardNo = item.noticeNo ?? '';

                    $('.selBoardNo').val(selectedBoardNo);
                    $('#board_title').text(boardTitle);
                    originBoardTitle = boardTitle;
                },
                error: function (xhr, status) {
                    if (status === 'abort') return;
                    console.warn("board search failed", status, xhr && xhr.status);
                    $('.selBoardNo').val('');
                    $('#board_title').text('');
                    originBoardTitle = '';
                }
            }));
        };

        loadBoardTitle();

        // =========================
        // 파일 선택(미리보기)
        // =========================
        $(document).on("change", "#imgFile", function(e) {
            e.preventDefault();

            if (chk_file_type(this) === false) return false;

            const file = $("#imgFile")[0]?.files?.[0];
            if (!file) return false;

            const reader = new FileReader();
            reader.onload = function (event) {
                let img = new Image();
                img.src = event.target.result;

                reader.onloadend = function () {
                    if (img.width > 200) img.width = 200;
                    const sortBody = document.getElementById("sort_body1");
                    if (sortBody) {
                        sortBody.innerHTML = '';
                        sortBody.appendChild(img);
                    }
                };
            };
            reader.readAsDataURL(file);

            $('.deliverymanFileName1').text("변경할 이미지 : " + file.name);
            $('.deliverymanFileSize1').text("용량 : " + file.size + " Byte");

            return false;
        });

        // =========================
        // 목록 이동
        // =========================
        $(".btn_list").click(function() {
            abortAllPending();
            location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=&platformType=1";
        });

        // =========================
        // boardType 클릭 시 boardNo 상태 정리
        // =========================
        $(".boardType").on("change", function(e) {
            const value = String(e.target.value);
            const originalBoardType = String("${tbAppBanner.boardType}");

            boardType = value;

            // 연결안함 / 앱화면 / 외부링크는 게시글 번호를 사용하지 않음
            if (
                value === "0" ||
                value === "3" ||
                value === "4"
            ) {
                $("#boardNo").val("");
                boardNo = "";
                $("#board_title").text("");
                originBoardTitle = "";
                return;
            }

            // 기존 이벤트 또는 공지 유형을 다시 선택한 경우 원래 게시글 복구
            if (value === originalBoardType) {
                $("#boardNo").val("${tbAppBanner.boardNo}");
                boardNo = "${tbAppBanner.boardNo}";
                loadBoardTitle();
                return;
            }

            // 다른 게시판 유형으로 변경한 경우 새 게시글 선택 필요
            $("#boardNo").val("");
            boardNo = "";
            $("#board_title").text("");
            originBoardTitle = "";
        });

        // 모달에서 게시글 선택 적용
        $(document).on("click", "#selBoardNoBtn", function() {
            $('#board_title').text('');
            let boardTypeNow = $("input[type='radio'][name='boardType']:checked").val();
            let boardTitle = $(this).closest("li").find(".board_text").text();

            let pickedNo = (boardTypeNow == 1) ? $(this).attr('eventNo') : $(this).attr('noticeNo');

            $('.selBoardNo').val(pickedNo);
            $('#board_title').text(boardTitle);
            $('.boardModalCloseBtn').click();
        });

        // =========================
        // ✅ 게시글 검색 (debounce + abort)
        // =========================
        let searchXhr = null;
        let searchTimer = null;

        function resetSearchResult() {
            $(".searchBoardList").html("");
        }

        function runBoardSearch() {
            if (searchXhr && searchXhr.readyState !== 4) {
                try { searchXhr.abort(); } catch (e) {}
            }

            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters1" text="검색된 게시글이 존재하지 않습니다."/>";
            let apply = "<spring:message code="list.script.apply1" text="적용"/>";

            let platformType = 2;
            let boardTypeNow = $("input[type='radio'][name='boardType']:checked").val();
            let keyword = $('#keyword').val();

            searchXhr = trackXhr($.ajax({
                type: "GET",
                url: "${path}/api/board/search",
                data: { platformType, boardType: boardTypeNow, keyword },
                dataType: "json",
                timeout: 15000,
                success: (data) => {
                    resetSearchResult();

                    const list = data && Array.isArray(data.boardList) ? data.boardList : [];
                    if (list.length === 0) {
                        $(".searchBoardList").append(
                            "<li>" +
                            "  <label class='b_text'>" + noregisteredaffiliateheadquarters + "</label>" +
                            "  <div class='float-right'></div>" +
                            "</li>"
                        );
                        return;
                    }

                    for (let i = 0; i < list.length; i++) {
                        let insertDate = list[i].insertDate ? convertInsertDate(list[i].insertDate) : "";
                        let title = (list[i].title || "");
                        let dateHtml = "<small style='color: green;'>[" + insertDate + "]</small>";

                        if (boardTypeNow == 1) {
                            $(".searchBoardList").append(
                                "<li>" +
                                "  <label class='board_text'>" + title + dateHtml + "</label>" +
                                "  <div class='float-right'>" +
                                "    <input type='button' class='btn btn-primary' id='selBoardNoBtn' " +
                                "      style='height:25px;line-height:0;margin-top:-5px;' " +
                                "      eventNo='"+ (list[i].eventNo || "") +"' value='"+ apply +"'>" +
                                "  </div>" +
                                "</li>"
                            );
                        } else {
                            $(".searchBoardList").append(
                                "<li>" +
                                "  <label class='board_text'>" + title + dateHtml + "</label>" +
                                "  <div class='float-right'>" +
                                "    <input type='button' class='btn btn-primary' id='selBoardNoBtn' " +
                                "      style='height:25px;line-height:0;margin-top:-5px;' " +
                                "      noticeNo='"+ (list[i].noticeNo || "") +"' value='"+ apply +"'>" +
                                "  </div>" +
                                "</li>"
                            );
                        }
                    }
                },
                error: (xhr, status) => {
                    if (status === 'abort') return;
                    console.warn("board search failed", status, xhr && xhr.status);
                }
            }));
        }

        $(".searchBoardBtn").on("click", () => {
            clearTimeout(searchTimer);
            searchTimer = setTimeout(runBoardSearch, 150);
        });

        $('#keyword').on('keydown', (e) => {
            if (e.keyCode === 13) {
                e.preventDefault();
                $('.searchBoardBtn').click();
            }
        });

        $("#board_search_modal").on('show.bs.modal', () => {
            clearTimeout(searchTimer);
            searchTimer = setTimeout(runBoardSearch, 50);
        });

        // =========================
        // ✅ 수정: FormData imgFile 중복/undefined 제거 + reload 금지
        // =========================
        $(document).on("click", ".btn_update", function() {
            const selectedBoardType =
                String($("input[name='boardType']:checked").val());

            if (selectedBoardType === "3") {
                $("#schemeUrl").val(
                    $("#appScreenSchemeUrl").val() || ""
                );
            } else if (selectedBoardType === "4") {
                $("#schemeUrl").val(
                    $.trim($("#externalSchemeUrl").val())
                );
            } else {
                $("#schemeUrl").val("");
            }

            let url = "${path}/api/banner/update";
            let _forms = $("#update_form");
            let req = convertFormToObj(_forms);
            let bannerNo = req.bannerNo;


            let confirmfailmsg = "<spring:message code="list.script.registrationfailed1" text="수정에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister1" text="수정 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment1" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";

            if (inputDataCheck(req)) {
                swal({
                    title: confirmmsg,
                    icon: "warning",
                    buttons: [ cancel, confirm ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (!isConfirm) return;

                    let formData = new FormData(document.getElementById('update_form'));
                    formData.append("tbAppBannerData", new Blob([JSON.stringify(req)], {type:"application/json"}));

                    // ✅ 중복/undefined 방지: 기존 imgFile 제거 후, 실제 파일만 추가
                    formData.delete("imgFile");
                    const file = $("#imgFile")[0]?.files?.[0];
                    if (file) formData.append("imgFile", file);

                    trackXhr($.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        timeout: 30000,
                        success: function (data) {
                            if (data && data.result == 200) {
                                alert("수정에 성공하였습니다.");
                                // ✅ 남은 pending 요청 정리 후 명시 이동 (reload 금지)
                                abortAllPending();
                                location.href = "${path}/board/banner/detail?bannerNo=" + bannerNo + "&_=" + Date.now();
                            } else {
                                alert(confirmfailmsg);
                            }
                        },
                        error: function(xhr, status) {
                            if (status === 'abort') return;
                            console.warn("update failed", status, xhr && xhr.status, xhr && xhr.responseText);
                            alert(confirmfailmsg);
                        }
                    }));
                });
            }
        });

        // =========================
        // 삭제
        // =========================
        $(".btn_remove").click(() => {
            let bannerNo = $("#bannerNo").val();
            let url = '${path}/api/banner/delete';
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete1" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg1" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed1" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted1" text="삭제되었습니다."/>";

            swal({
                title: doyouwanttodelete,
                icon: 'warning',
                buttons: [ cancel, deletemsg ],
                dangerMode: true,
            }).then((isConfirm) => {
                if (!isConfirm) return;

                trackXhr($.ajax({
                    type: 'DELETE',
                    url: url,
                    data: { bannerNo },
                    dataType: 'json',
                    timeout: 15000,
                    success: (data) => {
                        if (data && data.result == 200) {
                            alert(deleted);
                            abortAllPending();
                            location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=";
                        } else {
                            alert(deletionfailed);
                        }
                    },
                    error: (xhr, status) => {
                        if (status === 'abort') return;
                        console.warn("delete failed", status);
                        alert(deletionfailed);
                    }
                }));
            });
        });

        // 앱화면 select 변경
        $(document).on("change", "#appScreenSchemeUrl", function() {
            const boardTypeValue =
                $("input[name='boardType']:checked").val();

            if (String(boardTypeValue) !== "3") {
                return;
            }

            $("#schemeUrl").val($(this).val() || "");
        });

        // 외부링크 입력
        $(document).on("input", "#externalSchemeUrl", function() {
            const boardTypeValue =
                $("input[name='boardType']:checked").val();

            if (String(boardTypeValue) !== "4") {
                return;
            }

            $("#schemeUrl").val(
                $.trim($(this).val())
            );
        });
        toggleBoardTypeFields(
            $("input[name='boardType']:checked").val(),
            false
        );
    });

    // =========================
    // Validation helpers (원본 유지)
    // =========================
    function inputDataCheck(args) {
        const boardTypeValue = String(args.boardType);
        const schemeUrl = $.trim(args.schemeUrl || "");

        // 이벤트 / 공지는 게시글 선택 필수
        if (
            (boardTypeValue === "1" ||
                boardTypeValue === "2") &&
            isNull(args.boardNo)
        ) {
            return alert_focus(
                "board-search-btn",
                "게시글을 검색 후 선택해주세요."
            );
        }

        // 앱화면은 select 선택 필수
        if (
            boardTypeValue === "3" &&
            schemeUrl === ""
        ) {
            return alert_focus(
                "appScreenSchemeUrl",
                "연결할 앱화면을 선택해주세요."
            );
        }

        // 외부링크는 URL 입력 필수
        if (
            boardTypeValue === "4" &&
            schemeUrl === ""
        ) {
            return alert_focus(
                "externalSchemeUrl",
                "외부링크 URL을 입력해주세요."
            );
        }

        // 외부링크 URL 형식 검사
        if (
            boardTypeValue === "4" &&
            !/^https?:\/\/.+/i.test(schemeUrl)
        ) {
            return alert_focus(
                "externalSchemeUrl",
                "외부링크는 http:// 또는 https://로 입력해주세요."
            );
        }

        return true;
    }

    function chk_file_type(obj) {
        let imgmsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded1" text="취소"/>";
        let file_kind = obj.value.lastIndexOf('.');
        let file_name = obj.value.substring(file_kind + 1, obj.length);
        let file_type = file_name.toLowerCase();
        let check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp', 'tif'];

        if(check_file_type.indexOf(file_type) == -1) {
            alert(imgmsg);
            let parent_Obj=obj.parentNode;
            parent_Obj.replaceChild(obj.cloneNode(true),obj);
            document.getElementById("imgFile").value = "";
            return false;
        }
    }

    function convertInsertDate(date) {
        return (date || "").replace("T", " ");
    }
</script>
</body>
</html>
