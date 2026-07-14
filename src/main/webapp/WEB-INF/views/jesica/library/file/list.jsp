<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="자료실"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="자료실"/></title>
    </c:if>

</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-excel:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    div.dataTables_wrapper div.dataTables_processing {
        border: 1px solid #eee;
        z-index: 1;
        /* position: absolute;
         top: 264%;
         left: 10%;
         width: 200px;
         !* margin-left: -397px; *!
         !* margin-top: -26px; *!
         text-align: center;
         padding: 1em 0;*/

    }
    .active-on {
        opacity: 1;
    }
    .active-off {
        opacity: 0.5;
    }

    input[type="checkbox"]{
        display: none;
    }
    input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
    }
    input[id="check1"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
    }
    .ellipsis {
        text-overflow: ellipsis;
    }
    .table-ellipsis {
        display: inline-block;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        vertical-align: middle;
        font-weight: 100;
    }

    .title-ellipsis {
        width: 260px;
    }

    .body-ellipsis {
        width: 420px;
    }

    #testTable {
        table-layout: fixed;
        width: 100% !important;
    }

    #testTable th,
    #testTable td {
        vertical-align: middle;
    }

    #testTable td {
        overflow: hidden;
    }

    .file-name-cell {
        max-width: 260px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .file-empty {
        padding: 40px 12px;
        text-align: center;
        color: rgba(0,0,0,.45);
        font-size: 13px;
    }

    .delete-file {
        cursor: pointer;
        color: #dc3545;
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
    <form name="frmSearch" id="frmSearch">
        <!-- begin #content -->
        <div id="content" class="content p-0">
            <!-- begin panel -->
            <div class="panel panel-inverse m-t-1">
                <!-- begin page-header -->
                <div class="col-xs-auto p-t-20 p-b-0">
                    <ol class="breadcrumb float-xl-right">
                        <li class="breadcrumb-item"><a href="${path}/board/cust/list"><spring:message code="sidemenu.boardmanagement12" text="자료실"/></a></li>
                        <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="자료실"/></li>
                    </ol>
                    <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="자료실"/></h3>
                </div>
                <!-- end page-header -->
                <!-- begin row -->

                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
                            <input type="hidden" name="platformType" value="2">

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
                                <div class="search-label">문서타입</div>
                                <div class="search-control-group">
                                    <select id="fileType" name="fileType" class="form-control">
                                        <option value="">전체</option>
                                        <option value="1">공통</option>
                                        <option value="2">총판</option>
                                        <option value="3">사용자</option>
                                    </select>
                                </div>
                            </div>
                            <div class="search-field">
                                <div class="search-label">업종</div>
                                <div class="search-control-group">
                                    <select id="shopType" name="shopType" class="form-control">
                                        <option value="">전체</option>
                                        <option value="1">모두</option>
                                        <option value="2">음식업</option>
                                        <option value="3">특산물</option>
                                    </select>
                                </div>
                            </div>
                            <div class="search-field search-keyword">
                                <div class="search-label">검색어</div>
                                <div class="search-control-group search-keyword-group">
                                    <select class="form-control searchOp" name="keywordType">
                                        <option value="fileTitle">문서명</option>
                                    </select>

                                    <input type="text"
                                           class="form-control width-150"
                                           name="keyword"
                                           value="${searchValue.keyword}"
                                           maxlength="150"
                                           placeholder="검색어 입력">
                                </div>
                            </div>

                            <div class="search-actions">
                                <button type="button"
                                        class="btn btn-search-inline searchClick"
                                        onClick="serarchForm()">
                                    <i class="fa fa-search"></i>
                                    검색
                                </button>

                                <c:if test="${permission == 2}">
                                    <button type="button"
                                            data-toggle="modal"
                                            data-target="#give_coupon_all"
                                            class="btn btn-search-inline ml-1 add-library-btn">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="자료등록"/></span>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table id="testTable" class="listTable display table compact-table table-striped">
                        <thead>
                        <tr class="text-center">
                            <th width="3%"><spring:message code="list.word.no1" text="번호"/></th>
                            <th width="%"><spring:message code="list.detail.title1" text="문서명"/></th>
                            <th width="%"><spring:message code="list.detail.title1" text="문서내용"/></th>
                            <th width="15%"><spring:message code="list.word.contents1" text="문서타입"/></th>
                            <th width="15%"><spring:message code="list.word.contents1" text="업종"/></th>
                            <th width="15%"><spring:message code="list.word.status12" text="등록자"/></th>
                            <th width="%"><spring:message code="list.word.contents1" text="등록일"/></th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <!-- end panel -->
        </div>
        <!-- end #content -->
    </form>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<%--<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/searchStore.jsp" %>
</div>--%>
<div class="modal fade" id="give_coupon_all" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/FileInput.jsp" %>
</div>
<%--modal add end--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<%-- Custom JS End--%>
<script>
    let couponAddList = [];
    let searchCustList = [];
    let tablePop = null;
    let table = null;

    var selectedFiles = [];
    var MAX_LIBRARY_TITLE_LENGTH = 100;
    var MAX_LIBRARY_BODY_LENGTH = 1000;
    var isLibrarySubmitting = false;

    var newExportAction = function (e, dt, button, config) {
        let startDate = $(".startDate").val();
        let endDate = $(".endDate").val();

        if (getDateDiff(startDate, endDate) > 31) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        }

        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;

        dt.one("preXhr", function (e, s, data) {
            data.start = 0;
            data.length = 2147483647;

            dt.one("preDraw", function (e, settings) {
                oldExportAction(self, e, dt, button, config);

                dt.one("preXhr", function (e, s, data) {
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });

                setTimeout(dt.ajax.reload, 0);
                return false;
            });
        });

        dt.ajax.reload();
    };

    $(function () {
        initLibraryTable();
        initLibraryEvents();

        $("#testTable_filter").text("");

        dateSetting();
    });

    function initLibraryTable() {
        table = $("#testTable").ajaxDataTable("frmSearch", "${path}/api/library/file/list", "A2", "1", true, {
            columns: [
                {data: "listIndex"},
                {
                    data: "fileTitle",
                    render: function (data) {
                        return makeEllipsisText(data, "title-ellipsis");
                    }
                },
                {
                    data: "fileBody",
                    render: function (data) {
                        return makeEllipsisText(data, "body-ellipsis");
                    }
                },
                {data: "fileType"},
                {data: "shopType"},
                {data: "insertUserName"},
                {data: "insertDate"}
            ],
            columnDefs: [
                {
                    targets: "_all",
                    className: "text-center"
                },
                {
                    targets: 0,
                    width: "40px"
                },
                {
                    targets: 1,
                    width: "280px"
                },
                {
                    targets: 2,
                    width: "550px"
                },
                {
                    targets: 3,
                    width: "80px",
                    render: function (data) {
                        if (data == 1) {
                            return "공통";
                        } else if (data == 2) {
                            return "총판";
                        } else if (data == 3) {
                            return "사용자";
                        }

                        return "-";
                    }
                },
                {
                    targets: 4,
                    width: "80px",
                    render: function (data) {
                        if (data == 1) {
                            return "모두";
                        } else if (data == 2) {
                            return "음식업";
                        } else if (data == 3) {
                            return "특산물";
                        }

                        return "-";
                    }
                },
                {
                    targets: 6,
                    width: "200px",
                    render: function (data) {
                        if (data) {
                            return dateFormat(data);
                        }

                        return "-";
                    }
                }
            ]
        });
    }

    function initLibraryEvents() {
        $(".searchOp").off("change").on("change", function (e) {
            let option = e.target.value;
            let nameForm = document.getElementById("custName");
            let telForm = document.getElementById("custTel");

            if (!nameForm || !telForm) {
                return;
            }

            nameForm.value = "";
            telForm.value = "";

            switch (option) {
                case "custName":
                    nameForm.style.display = "inline";
                    telForm.style.display = "none";
                    break;
                case "custTel":
                    nameForm.style.display = "none";
                    telForm.style.display = "inline";
                    break;
            }
        });

        $("#testTable").off("click", "tbody td").on("click", "tbody td", function () {
            var row = $("#testTable").DataTable().row($(this).parents("tr")).data();

            if (!row || !row.libNo) {
                return;
            }

            location.href = "${path}/library/file/detail?libNo=" + row.libNo;
        });

        $(document).off("click", ".insertLibrary").on("click", ".insertLibrary", function () {
            insertLibrary(this);
        });

        $(document).off("hidden.bs.modal", "#give_coupon_all").on("hidden.bs.modal", "#give_coupon_all", function () {
            resetLibraryModal();
        });

        // 여기 추가
        $(document)
            .off("input.libraryCount keyup.libraryCount change.libraryCount", "#fileTitle, #fileBody")
            .on("input.libraryCount keyup.libraryCount change.libraryCount", "#fileTitle, #fileBody", function () {
                if (this.id === "fileTitle") {
                    updateLengthCount("#fileTitle", "#fileTitleCount", MAX_LIBRARY_TITLE_LENGTH);
                }

                if (this.id === "fileBody") {
                    updateLengthCount("#fileBody", "#fileBodyCount", MAX_LIBRARY_BODY_LENGTH);
                }
            });

        $("#give_coupon_all")
            .off("shown.bs.modal.libraryCount")
            .on("shown.bs.modal.libraryCount", function () {
                updateLengthCount("#fileTitle", "#fileTitleCount", MAX_LIBRARY_TITLE_LENGTH);
                updateLengthCount("#fileBody", "#fileBodyCount", MAX_LIBRARY_BODY_LENGTH);
            });
    }

    function serarchForm() {
        if (!table) {
            return;
        }

        var numCols = table.columns().nodes().length;

        for (var i = 0; i < numCols; i++) {
            table.column(i).search("");
        }

        table.column().draw();
    }

    function inputDataCheck(args) {
        if (isNull(args.fileName)) {
            return alert_focus("userId", "변경할 비밀번호를 입력해주세요.");
        }

        return true;
    }

    function insertLibrary(button) {
        if (isLibrarySubmitting) {
            return;
        }

        var title = $.trim($("#fileTitle").val() || $("input[name=fileTitle]").val() || "");
        var body = $.trim($("#fileBody").val() || "");

        if (!title) {
            return alert_focus("fileTitle", "문서명을 입력해주세요.");
        }

        if (title.length > MAX_LIBRARY_TITLE_LENGTH) {
            return alert_focus("fileTitle", "문서명은 최대 100자까지 입력 가능합니다.");
        }

        if (!body) {
            return alert_focus("fileBody", "문서내용을 입력해주세요.");
        }

        if (body.length > MAX_LIBRARY_BODY_LENGTH) {
            return alert_focus("fileBody", "문서내용은 최대 1000자까지 입력 가능합니다.");
        }

        isLibrarySubmitting = true;

        var $button = $(button);
        $button.prop("disabled", true);

        var formData = new FormData();

        var $form = $("#libraryForm");

        var libraryInfo = {
            fileTitle: $.trim($form.find("input[name='fileTitle']").val() || ""),
            fileBody: $.trim($form.find("textarea[name='fileBody']").val() || ""),
            fileType: Number($form.find("select[name='fileType']").val() || 1),
            shopType: Number($form.find("select[name='shopType']").val() || 1),
            appCode: $form.find("input[name='appCode']").val(),
            insertUserId: $form.find("input[name='insertUserId']").val(),
            insertUserName: $form.find("input[name='insertUserName']").val()
        };

        formData.append("libraryInfo", new Blob([JSON.stringify(libraryInfo)], {
            type: "application/json"
        }));

        for (var i = 0; i < selectedFiles.length; i++) {
            formData.append("attachFile", selectedFiles[i]);
        }
        console.log(libraryInfo)
        $.ajax({
            method: "POST",
            url: "${path}/api/library/file/insert",
            dataType: "json",
            data: formData,
            async: true,
            contentType: false,
            processData: false,
            timeout: 30000,
            cache: false,
            headers: {
                "cache-control": "no-cache",
                "pragma": "no-cache"
            },
            success: function (res) {
                alert((res && res.message) ? res.message : "등록에 성공하였습니다.");

                $(".libModalCloseBtn").trigger("click");

                resetLibraryModal();

                if (table && table.ajax) {
                    table.ajax.reload(null, false);
                } else {
                    serarchForm();
                }
            },
            error: function () {
                alert("에러가 발생 하였습니다.");
            },
            complete: function () {
                isLibrarySubmitting = false;
                $button.prop("disabled", false);
            }
        });
    }

    function addFile(input) {
        var files = input.files;

        if (!files || files.length === 0) {
            return;
        }

        var maxFileCnt = 5;
        var remainFileCnt = maxFileCnt - selectedFiles.length;
        var curFileCnt = files.length;

        if (remainFileCnt <= 0) {
            alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
            $("#libFile").val("");
            return;
        }

        if (curFileCnt > remainFileCnt) {
            alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
        }

        for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
            var file = files[i];

            if (validation(file)) {
                appendSelectedFile(file);
            }
        }

        $("#libFile").val("");
    }

    function appendSelectedFile(file) {
        var key = getFileKey(file);

        for (var i = 0; i < selectedFiles.length; i++) {
            if (getFileKey(selectedFiles[i]) === key) {
                return;
            }
        }

        selectedFiles.push(file);
        renderFileList();
    }

    function removeFile(index) {
        selectedFiles.splice(index, 1);
        renderFileList();
    }

    function renderFileList() {
        var $tbody = $("#file-list");

        if ($tbody.length === 0) {
            return;
        }

        $tbody.empty();

        if (!selectedFiles || selectedFiles.length === 0) {
            $tbody.append(
                '<tr class="none-file">' +
                '   <td colspan="4" class="file-empty">파일이 존재하지 않습니다.</td>' +
                '</tr>'
            );
            return;
        }

        for (var i = 0; i < selectedFiles.length; i++) {
            var file = selectedFiles[i];

            var rowHtml = ""
                + '<tr class="file-row">'
                + '  <td class="ps-10px border-0 text-center">' + getFileIcon(file) + '</td>'
                + '  <td class="px-10px border-0 file-name-cell" title="' + escapeAttr(file.name) + '">' + escapeHtml(file.name) + '</td>'
                + '  <td class="px-10px text-center">' + fmtBytes(file.size) + '</td>'
                + '  <td class="delete-col text-center">'
                + '    <a class="delete-file" onclick="removeFile(' + i + ');">'
                + '      <i class="far fa-minus-square"></i>'
                + '    </a>'
                + '  </td>'
                + '</tr>';

            $tbody.append(rowHtml);
        }
    }

    function validation(file) {
        if (!file) {
            return false;
        }

        if (file.name.length > 100) {
            alert("파일명이 100자 이상인 파일은 제외되었습니다.");
            return false;
        }

        if (file.size > (100 * 1024 * 1024)) {
            alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
            return false;
        }

        if (file.name.lastIndexOf(".") === -1) {
            alert("확장자가 없는 파일은 제외되었습니다.");
            return false;
        }

        var fileName = file.name.toLowerCase();
        var fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
        var fileType = (file.type || "").toLowerCase();

        var allowExts = [
            "pdf",
            "gif",
            "jpg",
            "jpeg",
            "png",
            "bmp",
            "tif",
            "tiff",
            "hwp",
            "zip",
            "7z"
        ];

        var allowMimeTypes = [
            "application/pdf",
            "image/gif",
            "image/jpeg",
            "image/png",
            "image/bmp",
            "image/tif",
            "image/tiff",

            "application/haansofthwp",
            "application/x-hwp",

            "application/zip",
            "application/x-zip",
            "application/x-zip-compressed",
            "multipart/x-zip",
            "application/octet-stream",

            "application/x-7z-compressed",
            "application/7z",
            "application/x-compressed"
        ];

        var isAllowedExt = allowExts.includes(fileExt);
        var isAllowedMime = !fileType || allowMimeTypes.includes(fileType);

        if (!isAllowedExt || !isAllowedMime) {
            alert("첨부가 불가능한 파일은 제외되었습니다.");
            return false;
        }

        return true;
    }

    function resetLibraryModal() {
        selectedFiles = [];
        isLibrarySubmitting = false;

        $("#fileTitle").val("");
        $("input[name=fileTitle]").val("");
        $("#fileBody").val("");
        $("#fileType").val("1");
        $("#libFile").val("");

        renderFileList();

        updateLengthCount("#fileTitle", "#fileTitleCount", MAX_LIBRARY_TITLE_LENGTH);
        updateLengthCount("#fileBody", "#fileBodyCount", MAX_LIBRARY_BODY_LENGTH);

        $(".insertLibrary").prop("disabled", false);
    }

    function bindLibraryLengthCounter(inputSelector, countSelector, maxLength) {
        var $input = $(inputSelector);

        $input.off("input.libraryCount keyup.libraryCount change.libraryCount");
        $input.on("input.libraryCount keyup.libraryCount change.libraryCount", function () {
            updateLengthCount(inputSelector, countSelector, maxLength);
        });

        updateLengthCount(inputSelector, countSelector, maxLength);
    }

    function updateLengthCount(inputSelector, countSelector, maxLength) {
        var $input = $(inputSelector);
        var $count = $(countSelector);

        if ($input.length === 0 || $count.length === 0) {
            return;
        }

        var value = $input.val() || "";

        if (value.length > maxLength) {
            value = value.substring(0, maxLength);
            $input.val(value);
        }

        var len = value.length;
        $count.text(len + " / " + maxLength);
        $count.toggleClass("is-over", len > maxLength);
    }

    function makeEllipsisText(data, className) {
        var text = data || "-";

        return ""
            + '<span class="table-ellipsis ' + className + '" title="' + escapeAttr(text) + '">'
            + escapeHtml(text)
            + '</span>';
    }

    function getFileKey(file) {
        return file.name + "__" + file.size + "__" + file.lastModified;
    }

    function getFileIcon(file) {
        var type = (file.type || "").toLowerCase();

        if (type.indexOf("pdf") > -1) {
            return '<i class="far fa-file-pdf text-body text-opacity-50 fa-lg"></i>';
        }

        if (type.indexOf("image/") === 0) {
            return '<i class="far fa-image text-body text-opacity-50 fa-lg"></i>';
        }

        if (type.indexOf("zip") > -1 || type.indexOf("compressed") > -1) {
            return '<i class="far fa-file-archive text-body text-opacity-50 fa-lg"></i>';
        }

        return '<i class="far fa-file-alt text-body text-opacity-50 fa-lg"></i>';
    }

    function fmtBytes(bytes) {
        var units = ["B", "KB", "MB", "GB"];
        var size = Number(bytes || 0);
        var unitIndex = 0;

        while (size >= 1024 && unitIndex < units.length - 1) {
            size = size / 1024;
            unitIndex++;
        }

        return (unitIndex === 0 ? size : size.toFixed(1)) + " " + units[unitIndex];
    }

    function escapeHtml(str) {
        return String(str || "")
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");
    }

    function escapeAttr(str) {
        return String(str || "")
            .replace(/&/g, "&amp;")
            .replace(/"/g, "&quot;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;");
    }
</script>
</body>
</html>
