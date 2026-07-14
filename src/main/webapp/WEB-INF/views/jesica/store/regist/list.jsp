<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>

    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 온동네 신청관리</title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | 온동네 신청관리</title>
    </c:if>
</head>

<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }

    div.dataTables_wrapper div.dataTables_processing {
        border: 1px solid #eee;
        z-index: 1;
    }

    .ellipsis {
        text-overflow: ellipsis;
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
                        <li class="breadcrumb-item"><a href="javascript:;">가맹점</a></li>
                        <li class="breadcrumb-item active">온동네 신청관리</li>
                    </ol>
                    <h3 class="rix-title">온동네 신청관리</h3>
                </div>

                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
                            <div class="search-field search-date">
                                <div class="search-label">접수기간</div>
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
                                <div class="search-label">사용앱</div>
                                <div class="search-control-group">
                                    <select class="form-control directsaleYn" name="directsaleYn">
                                        <option value="" <c:if test="${searchValue.directsaleYn == ''  || searchValue.dataStatus == null}">selected</c:if>>전체</option>
                                        <option value="Y" <c:if test="${searchValue.directsaleYn == 'Y'}">selected</c:if>>직거래</option>
                                        <option value="N" <c:if test="${searchValue.directsaleYn == 'N'}">selected</c:if>>앱사용</option>
                                    </select>
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

                <div class="panel-body">
                    <table id="testTable" class="listTable display table compact-table table-striped">
                        <thead>
                        <tr class="text-center">
                            <th width="5%">순번</th>
                            <th width="12%">총판명</th>
                            <th width="12%">가맹점명</th>
                            <th width="10%">가맹점코드</th>
                            <th width="14%">접수일</th>
                            <th width="16%">사용앱</th>
                            <th width="8%">크롤링 타입</th>
                            <th width="8%">상품수</th>
                            <th width="12%">마지막 크롤링</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </form>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>

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

    $(() => {
        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/manna/regist/list", "A2", "1", true, {
            columns: [
                {data: "listIndex"},
                {data: "brName"},
                {data: "stName"},
                {data: "stCode"},
                {data: "updateDate"},
                {data: null},
                {data: "crawlingType"},
                {data: "crawlingCnt"},
                {data: "crawlingDate"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center ellipsis"},
                {
                    targets: 0,
                    width: "60px"
                },
                {
                    targets: 4,
                    render: function (data) {
                        return data ? dateFormat(data) : "-";
                    }
                },
                {
                    targets: 5,
                    render: function (data, type, row) {
                        let apps = [];

                        if (row.baeminYn === "Y") apps.push("배민");
                        if (row.coupangYn === "Y") apps.push("쿠팡");
                        if (row.yogiyoYn === "Y") apps.push("요기요");
                        if (row.directsaleYn === "Y") apps.push("직거래");

                        return apps.length > 0 ? apps.join(" / ") : "-";
                    }
                },
                {
                    targets: 6,
                    render: function (data) {
                        if (data === "1") return "배민";
                        if (data === "2") return "쿠팡";
                        if (data === "3") return "요기요";

                        return "-";
                    }
                },
                {
                    targets: 7,
                    render: function (data) {
                        return data != null ? data : "-" ;
                    }
                },
                {
                    targets: 8,
                    render: function (data) {
                        return data ? dateFormat(data) : "-";
                    }
                }
            ]
        });

        $("#testTable_filter").text("");
        dateSetting();

        $("#testTable").on('click', 'tbody td', function () {
            let row = $("#testTable").DataTable().row($(this).parents("tr")).data();
            if (row && row.stCode) {
                location.href = "${path}/store/regist/detail?stCode=" + row.stCode;
            }
        });
    });

    function serarchForm() {
        let numCols = table.columns().nodes().length;
        for (let i = 0; i < numCols; i++) {
            table.column(i).search('');
        }
        table.column().draw();
    }
</script>
</body>
</html>
