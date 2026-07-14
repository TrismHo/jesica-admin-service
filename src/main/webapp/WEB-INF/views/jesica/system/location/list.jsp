<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | 서비스 지역관리</title>

    <style>
        .biThumb {
            width: 200px;
            height: 44px;
            object-fit: contain;
            background: #fff;
            border: 1px solid rgba(0,0,0,0.08);
            border-radius: 10px;
            padding: 4px;
        }
        .biEmpty {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 200px;
            height: 44px;
            border: 1px dashed rgba(0,0,0,0.18);
            border-radius: 10px;
            font-size: 11px;
            color: rgba(0,0,0,0.45);
            background: rgba(255,255,255,0.7);
        }
        /* row 클릭형이라 링크/버튼 클릭 시 row 이동 방지용 */
        .noRowNav {
            cursor: pointer;
            color: #4e16ff;
            text-decoration: underline;
            font-size: 13px;
            line-height: 1.45px;
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
                    <li class="breadcrumb-item active">서비스 지역관리</li>
                </ol>
                <h3 class="rix-title">서비스 지역관리</h3>
            </div>

            <!-- 검색 -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
                            <div class="search-field search-date">
                                <div class="search-label">등록기간
                                    <small class="text-muted" style="font-size:10px;">(등록일 기준)</small></div>
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

                            <div class="search-field search-keyword">
                                <div class="search-label">검색어</div>
                                <div class="search-control-group search-keyword-group">
                                    <select class="form-control" name="searchType">
                                        <option value="serviceName"
                                                <c:if test="${searchValue.searchType == 'serviceName' || searchValue.searchType == null}">selected</c:if>>
                                            서비스명
                                        </option>
                                    </select>

                                    <input type="text"
                                           name="keyword"
                                           value="${searchValue.keyword}"
                                           class="form-control width-250"
                                           maxlength="100"
                                           placeholder="검색어 입력">

                                    <a href="${path}/system/location/list"
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

                                <button type="button"
                                        class="btn btn-search-inline ml-1 btn_insert">
                                    <span class="fa fa-plus">&nbsp;등록</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- 리스트 -->
            <div class="panel-body p-15">
                <table id="testTable" class="listTable display table compact-table table-striped">
                    <thead>
                    <tr>
                        <th class="text-center" width="5%;">순번</th>
                        <th class="text-center" width="8%;">BI</th>
                        <th class="text-center" width="18%;">서비스명</th>
                        <th class="text-center" width="15%;">고객센터</th>
                        <th class="text-center" width="26%;">카카오채널 URL</th>
                        <th class="text-center" width="18%;">등록일</th>
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
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {
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
        }
    };

    $(() => {
        dateSetting(2020);

        table = $('#testTable').ajaxDataTable(
            "frmSearch",
            "${path}/api/system/location/list",
            "A2",
            "1",
            true,
            {
                columns: [
                    { data: "listIndex" },

                    // ✅ BI 썸네일 컬럼 (serviceBi)
                    {
                        data: "serviceBi",
                        orderable: false,
                        render: function(data, type, row){
                            if(!data) {
                                return '<span class="biEmpty">등록되지 않음</span>';
                            }
                            // fileLoad 경로에 맞춰 렌더링
                            // data가 "/appservice/123/abc.png" 같은 상대경로라고 가정
                            var src = "${path}/api/img/fileLoad?filePath=" + encodeURIComponent(data);
                            return '<img class="biThumb" src="'+ src +'" alt="BI" onerror="this.style.display=\'none\'; this.insertAdjacentHTML(\'afterend\', \'<span class=\\\'biEmpty\\\'>이미지 경로 오류</span>\');">';
                        }
                    },

                    { data: "serviceName" },
                    { data: "csTel" },

                    // ✅ URL은 클릭 가능하게 (row 클릭 이동 방지)
                    {
                        data: "kakaoUrl",
                        render: function(data){
                            if(!data) return "";
                            return '<a class="noRowNav" href="'+ data +'" target="_blank" rel="noopener noreferrer">'+ data +'</a>';
                        }
                    },

                    { data: "insertDate" }
                ],
                columnDefs: [
                    { targets: "_all", className: "text-center" },
                    {
                        targets: [5],
                        render: function(data){
                            return dateFormat(data);
                        }
                    }
                ],
            }
        );

        // ✅ 링크/이미지 클릭은 row 이동 막기
        $("#testTable").on("click", "a.noRowNav, img.biThumb", function(e){
            e.stopPropagation();
        });

        // row 클릭 -> detail 이동
        $("#testTable").on("click", "tbody tr", function() {
            const row = $("#testTable").DataTable().row(this).data();
            if(!row || !row.serviceNo) return;
            location.href = "${path}/system/location/detail?serviceNo=" + row.serviceNo;
        });

        // 등록 -> insert 이동
        $(".btn_insert").on("click", function(){
            location.href = "${path}/system/location/insert";
        });

        // 엔터 검색
        $("input[name='keyword']").on("keydown", function(e){
            if(e.keyCode === 13){
                e.preventDefault();
                serarchForm();
            }
        });
    });

    function serarchForm(){
        if(table) table.ajax.reload(null, true);
    }
</script>
</body>
</html>
