<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | 도서지역 관리</title>

    <style>
        .noRowNav { cursor: pointer; }

        .postcode-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 74px;
            height: 28px;
            padding: 0 10px;
            border: 1px solid rgba(0,0,0,0.08);
            background: #fff;
            font-size: 13px;
            font-weight: 600;
            color: #333;
        }

        .postcode-range {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            white-space: nowrap;
        }

        .postcode-range__dash {
            color: rgba(0,0,0,0.35);
            font-weight: 600;
        }

        .addr-name-text {
            display: inline-block;
            max-width: 360px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: middle;
        }
        .form-control {
            font-weight: 700;
        }
        table#testTable td {
            padding: 2px;
        }
    </style>
</head>

<body>
<div id="page-loader" class="fade show"><span class="spinner"></span></div>

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <div id="content" class="content p-0">
        <div class="panel panel-inverse m-t-1">

            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item">시스템</li>
                    <li class="breadcrumb-item active">도서지역 관리</li>
                </ol>
                <h3 class="rix-title">도서지역 관리</h3>
            </div>

            <!-- 검색 + 등록 -->
            <div class="d-flex">
                <!-- 왼쪽 검색 -->
                <form name="frmSearch" id="frmSearch" class="w-50">
                    <div class="search-box search-box-inline">
                        <div class="inner-search-box">
                            <div class="search-inline-bar">

                                <div class="search-field search-keyword">
                                    <div class="search-label">검색어</div>
                                    <div class="search-control-group search-keyword-group">
                                        <select class="form-control" name="keywordType">
                                            <option value="addrName"
                                                    <c:if test="${searchValue.keywordType == 'addrName' || searchValue.keywordType == null}">selected</c:if>>
                                                지역명
                                            </option>
                                        </select>

                                        <input type="text"
                                               name="keyword"
                                               value="${searchValue.keyword}"
                                               class="form-control width-250"
                                               maxlength="100"
                                               placeholder="지역명 입력">

                                        <a href="${path}/system/surcharge/list"
                                           class="btn btn-search-inline"
                                           style="text-decoration:none;">
                                            <i class="fas fa-sync-alt"></i>
                                            검색 초기화
                                        </a>
                                    </div>
                                </div>

                                <div class="search-actions">
                                    <button type="button"
                                            class="btn btn-search-inline searchClick"
                                            onclick="serarchForm()">
                                        <i class="fa fa-search"></i>
                                        검색
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- 오른쪽 등록 -->
                <form name="frmInsert" id="frmInsert" class="w-50">
                    <div class="search-box search-box-inline">
                        <div class="inner-search-box">
                            <div class="search-inline-bar">

                                <div class="search-field search-keyword">
                                    <div class="search-label">추가요금 지역 등록</div>
                                    <div class="search-control-group search-keyword-group">
                                        <input type="text"
                                               name="postcodeS"
                                               id="postcodeS"
                                               class="form-control"
                                               maxlength="5"
                                               placeholder="우편번호 시작"
                                               autocomplete="off">

                                        <input type="text"
                                               name="postcodeE"
                                               id="postcodeE"
                                               class="form-control"
                                               maxlength="5"
                                               placeholder="우편번호 종료"
                                               autocomplete="off">

                                        <input type="text"
                                               name="addrName"
                                               id="addrName"
                                               class="form-control width-250"
                                               maxlength="100"
                                               placeholder="지역명"
                                               autocomplete="off">
                                    </div>
                                </div>

                                <div class="search-actions">
                                    <button type="button"
                                            class="btn btn-search-inline"
                                            onclick="resetInsertForm()">
                                        <i class="fas fa-sync-alt"></i>
                                        초기화
                                    </button>

                                    <button type="button"
                                            class="btn btn-search-inline ml-1"
                                            onclick="insertSurcharge()">
                                        <i class="fa fa-save"></i>
                                        저장
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <!-- 리스트 -->
            <div class="panel-body p-15">
                <table id="testTable" class="listTable display table compact-table table-striped">
                    <thead>
                    <tr>
                        <th class="text-center" width="8%;">순번</th>
                       <%-- <th class="text-center" width="12%;">추가요금 순번</th>--%>
                        <th class="text-center" width="16%;">우편번호 시작</th>
                        <th class="text-center" width="16%;">우편번호 종료</th>
                        <th class="text-center" width="30%;">지역명</th>
                        <th class="text-center" width="18%;"></th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
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

                setTimeout(dt.ajax.reload, 0);
                return false;
            });
        });

        dt.ajax.reload();
    };

    $(() => {
        table = $('#testTable').ajaxDataTable(
            "frmSearch",
            "${path}/api/system/surcharge/list",
            "A7",
            "1",
            true,
            {
                columns: [
                    { data: "listIndex" },
                   /* { data: "surchargeNo" },*/

                    {
                        data: "postcodeS",
                        orderable: false,
                        render: function(data, type, row) {
                            return '<input type="text"'
                                + ' class="form-control w-100 update-postcode-s"'
                                + ' maxlength="5"'
                                + ' value="' + escapeHtml(data || '') + '"'
                                + ' autocomplete="off">';
                        }
                    },

                    {
                        data: "postcodeE",
                        orderable: false,
                        render: function(data, type, row) {
                            return '<input type="text"'
                                + ' class="form-control w-100 update-postcode-e"'
                                + ' maxlength="5"'
                                + ' value="' + escapeHtml(data || '') + '"'
                                + ' autocomplete="off">';
                        }
                    },

                    {
                        data: "addrName",
                        orderable: false,
                        render: function(data, type, row) {
                            return '<input type="text"'
                                + ' class="form-control w-100 update-addr-name"'
                                + ' maxlength="100"'
                                + ' value="' + escapeHtml(data || '') + '"'
                                + ' autocomplete="off">';
                        }
                    },

                    {
                        data: null,
                        orderable: false,
                        render: function(data, type, row) {
                            return ''
                                + '<button type="button"'
                                + ' class="btn btn-search-inline btn_update"'
                                + ' data-surcharge-no="' + escapeHtml(row.surchargeNo || '') + '">'
                                + ' <i class="fa fa-save"></i>'
                                + ' 수정'
                                + '</button>'
                                + '<button type="button"'
                                + ' class="btn btn-danger btn-search-inline ml-1 btn_delete"'
                                + ' data-surcharge-no="' + escapeHtml(row.surchargeNo || '') + '">'
                                + ' <i class="fa fa-trash"></i>'
                                + ' 삭제'
                                + '</button>';
                        }
                    }
                ],
                columnDefs: [
                    { targets: "_all", className: "text-center" }
                ],
            }
        );

        // 검색 엔터
        $("input[name='keyword']").on("keydown", function(e){
            if (e.keyCode === 13) {
                e.preventDefault();
                serarchForm();
            }
        });

        // 등록 폼 엔터 저장
        $("#frmInsert input").on("keydown", function(e){
            if (e.keyCode === 13) {
                e.preventDefault();
                insertSurcharge();
            }
        });

        $("#testTable").on("click", ".btn_delete", function(e){
            e.preventDefault();
            e.stopPropagation();

            deleteSurcharge(this);
        });

        // 등록 우편번호 숫자만 입력
        $("input[name='postcodeS'], input[name='postcodeE']").on("input", function(){
            this.value = this.value.replace(/[^0-9]/g, '').slice(0, 5);
        });

        // 리스트 우편번호 숫자만 입력
        $("#testTable").on("input", ".update-postcode-s, .update-postcode-e", function(){
            this.value = this.value.replace(/[^0-9]/g, '').slice(0, 5);
        });

        // 리스트 input 클릭 시 혹시 모를 row 이벤트 방지
        $("#testTable").on("click", "input, button", function(e){
            e.stopPropagation();
        });

        // 리스트 input 엔터 수정
        $("#testTable").on("keydown", "input", function(e){
            if (e.keyCode === 13) {
                e.preventDefault();
                $(this).closest("tr").find(".btn_update").trigger("click");
            }
        });

        // 수정 버튼
        $("#testTable").on("click", ".btn_update", function(e){
            e.preventDefault();
            e.stopPropagation();

            updateSurcharge(this);
        });
    });

    function serarchForm(){
        if (table) table.ajax.reload(null, true);
    }

    function resetInsertForm() {
        $("#frmInsert")[0].reset();
        $("#postcodeS").focus();
    }

    function insertSurcharge() {
        const postcodeS = $.trim($("#postcodeS").val());
        const postcodeE = $.trim($("#postcodeE").val());
        const addrName = $.trim($("#addrName").val());

        if (!validateSurcharge(postcodeS, postcodeE, addrName)) {
            return;
        }

        if (!confirm("도서지역을 추가하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: "${path}/api/system/surcharge/insert",
            type: "POST",
            data: $("#frmInsert").serialize(),
            success: function(res) {
                alert("추가되었습니다.");
                resetInsertForm();

                if (table) {
                    table.ajax.reload(null, true);
                }
            },
            error: function(xhr) {
                console.log(xhr);
                alert("등록 중 오류가 발생했습니다.");
            }
        });
    }

    function updateSurcharge(button) {
        const $button = $(button);
        const $tr = $button.closest("tr");
        const row = $("#testTable").DataTable().row($tr).data();

        if (!row || !row.surchargeNo) {
            alert("수정할 데이터를 찾을 수 없습니다.");
            return;
        }

        const surchargeNo = row.surchargeNo;
        const postcodeS = $.trim($tr.find(".update-postcode-s").val());
        const postcodeE = $.trim($tr.find(".update-postcode-e").val());
        const addrName = $.trim($tr.find(".update-addr-name").val());

        if (!validateSurcharge(postcodeS, postcodeE, addrName)) {
            return;
        }

        if (!confirm("도서지역을 수정하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: "${path}/api/system/surcharge/update",
            type: "POST",
            data: {
                surchargeNo: surchargeNo,
                postcodeS: postcodeS,
                postcodeE: postcodeE,
                addrName: addrName
            },
            success: function(res) {
                if (res && res.message) {
                    alert(res.message);
                } else {
                    alert("수정되었습니다.");
                }

                if (table) {
                    table.ajax.reload(null, false);
                }
            },
            error: function(xhr) {
                console.log(xhr);
                alert("수정 중 오류가 발생했습니다.");
            }
        });
    }

    function deleteSurcharge(button) {
        const $button = $(button);
        const $tr = $button.closest("tr");
        const row = $("#testTable").DataTable().row($tr).data();

        if (!row || !row.surchargeNo) {
            alert("삭제할 데이터를 찾을 수 없습니다.");
            return;
        }

        if (!confirm("도서지역을 삭제하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: "${path}/api/system/surcharge/delete",
            type: "POST",
            data: {
                surchargeNo: row.surchargeNo
            },
            success: function(res) {
                if (res && res.message) {
                    alert(res.message);
                } else {
                    alert("삭제되었습니다.");
                }

                if (table) {
                    table.ajax.reload(null, false);
                }
            },
            error: function(xhr) {
                console.log(xhr);
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    }

    function validateSurcharge(postcodeS, postcodeE, addrName) {
        if (!postcodeS) {
            alert("우편번호 시작을 입력해주세요.");
            return false;
        }

        if (postcodeS.length !== 5) {
            alert("우편번호 시작은 5자리로 입력해주세요.");
            return false;
        }

        if (!postcodeE) {
            alert("우편번호 종료를 입력해주세요.");
            return false;
        }

        if (postcodeE.length !== 5) {
            alert("우편번호 종료는 5자리로 입력해주세요.");
            return false;
        }

        if (Number(postcodeS) > Number(postcodeE)) {
            alert("우편번호 시작은 우편번호 종료보다 클 수 없습니다.");
            return false;
        }

        if (!addrName) {
            alert("지역명을 입력해주세요.");
            return false;
        }

        return true;
    }

    function escapeHtml(value) {
        if (value === null || value === undefined) {
            return "";
        }

        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }
</script>
</body>
</html>
