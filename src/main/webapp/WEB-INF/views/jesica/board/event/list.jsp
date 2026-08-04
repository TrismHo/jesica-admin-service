<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네  | <spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/></title>
    </c:if>
</head>
<style>
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
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">
            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="앱 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <input type="hidden" name="platformType" value="2">
                        <input type="hidden" name="dateStatus" value="OK">

                        <div class="search-inline-bar">
                            <div class="search-field">
                                <div class="search-label">서비스지역</div>
                                <div class="search-control-group">
                                    <select id="appService" name="serviceNo" class="form-control">
                                        <option value="">전체</option>
                                        <c:forEach var="s" items="${appServiceList}">
                                            <option value="${s.serviceNo}"
                                                    <c:if test="${searchValue.serviceNo == s.serviceNo}">selected</c:if>>
                                                    ${s.serviceName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="search-field">
                                <div class="search-label">앱구분</div>
                                <div class="search-control-group">
                                    <c:if test="${empty appCode}">
                                        <select id="appCode" name="appCode" class="form-control">
                                            <option value="">전체</option>
                                            <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                <option value="${appCodeList.sysCode}"
                                                        <c:if test="${tbNoticePlatform.appCode == appCodeList.sysCode}">selected</c:if>>
                                                        ${appCodeList.codeName}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${!empty appCode}">
                                        <input type="text" class="form-control" readonly value="${sessionScope.sessionKey.appCodeName}">
                                        <input type="hidden" class="form-control appCode" name="appCode" readonly value="${appCode}">
                                    </c:if>
                                </div>
                            </div>

                            <div class="search-field">
                                <div class="search-label">사용상태</div>
                                <div class="search-control-group">
                                    <select class="form-control viewYn" name="viewYn">
                                        <option value="" <c:if test="${searchValue.viewYn == ''  || searchValue.dataStatus == null}">selected</c:if>>전체</option>
                                        <option value="1" <c:if test="${searchValue.viewYn == '1'}">selected</c:if>>노출</option>
                                        <option value="0" <c:if test="${searchValue.viewYn == '0'}">selected</c:if>>숨김</option>
                                    </select>
                                </div>
                            </div>

                            <div class="search-field search-date">
                                <div class="search-label">등록기간</div>
                                <div class="search-control-group">
                                    <div class="date-input-wrap">
                                        <input type="text" class="form-control startDate background-white" name="startDate" value="${searchValue.startDate}" readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <span class="date-separator">~</span>
                                    <div class="date-input-wrap">
                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="search-field search-keyword">
                                <div class="search-label">검색어</div>
                                <div class="search-control-group search-keyword-group">
                                    <select class="form-control">
                                        <option>제목</option>
                                    </select>
                                    <input type="text" class="form-control width-250" name="title" value="${searchValue.title}" maxlength="150" placeholder="검색어 입력">
                                </div>
                            </div>

                            <div class="search-actions">
                                <button type="button" class="btn btn-search-inline searchClick" onClick="serarchForm()">
                                    <i class="fa fa-search"></i>
                                    검색
                                </button>

                                <c:if test="${permission == 2}">
                                    <button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-search-inline ml-1">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration" text="공지등록"/></span>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- begin row -->
            <div class="panel-body">
                <table id="testTable" class="listTable display table compact-table table-striped">
                    <thead>
                    <tr class="text-center">
                        <th width="5%"><spring:message code="list.word.no" text="번호"/></th>
                        <th width="5%"><spring:message code="list.word.no11" text="앱구분"/></th>
                        <th width="20%"><spring:message code="list.detail.title" text="제목"/></th>
                        <th width="5%"><spring:message code="list.detail.title" text="서비스지역"/></th>
                       <%-- <th width="10%"><spring:message code="list.word.serviceclassification" text="플랫폼구분"/></th>--%>
                        <th width="5%"><spring:message code="list.word.status" text="상태"/></th>
                        <th width="15%"><spring:message code="list.word.contents1" text="시작일/종료일"/></th>
                        <th width="10%"><spring:message code="list.word.status" text="등록 사용자"/></th>
                        <th width="10%"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                    </tr>
                    </thead>
                   <%-- <tbody>
                    <c:forEach var="item"  items="${tbEventList}"  varStatus="status">
                        <tr class="detailRow" eventNo="${item.eventNo}">
                            <td class="text-center">${status.index + 1}</td>
                                &lt;%&ndash; <td>
                                     <c:url var="url" value=""><c:param name="output" value="${item.imgFileSmall}" /></c:url>
                                     <c:set var="url" value="${fn:substringAfter(url, '=')}" />
                                     <img style="width: 80px;" class="storeImg" src="/api/img/fileLoad?filePath=${url}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'" ></td>&ndash;%&gt;
                            <td class="text-center">${item.title}</td>
                            <td class="text-center" style="">
                                <c:if test="${item.platformType == 0}"><spring:message code="list.word.franchisee1" text="사용안함"/></c:if>
                                <c:if test="${item.platformType == 1}"><spring:message code="list.word.deliverygroup1" text="제시카"/></c:if>
                                <c:if test="${item.platformType == 2}"><spring:message code="list.word.deliverygroup1" text="직배"/></c:if>
                                <c:if test="${item.platformType == 3}"><spring:message code="list.word.deliverygroup1" text="세날"/></c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.viewYn == 0}"><span class="text-red"><spring:message code="list.word.hide" text="숨김"/></span></c:if>
                                <c:if test="${item.viewYn == 1}"><spring:message code="list.word.exposure" text="노출"/></c:if>
                            </td>
                            <td class="text-center">
                                <javatime:format value="${item.startDate}" pattern="yyyy-MM-dd " />
                                ~ <javatime:format value="${item.endDate}" pattern="yyyy-MM-dd " />
                            </td>

                            <td class="text-center">
                                <div style="overflow: hidden;
                                          margin: auto;
                                          text-overflow: ellipsis;
                                          white-space: nowrap;
                                          width: 250px;
                                          font-weight: 200;
                                          display: block;">  ${item.insertUserId}
                                </div>
                            </td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>


                    </tbody>--%>
                </table>
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end #content -->
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
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
        /* $("#testTable").DataTable({
             language : lang_set, //or lang_eng
         });*/

        $(".insert_btn").click(function() {
            location.href = '${path}/board/platform/insert';
        });
        $(() => {
            let downloadAble = `${downloadAble}`;
            let roleType = `${sessionScope.sessionKey.roleType}`;
            let downloadChk = "1";
            if(roleType != 0){
                if(downloadAble == 1){
                    downloadChk = "";
                }
            } else {
                downloadChk = ""
            }
            table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/event/list","A5","1", true,{
                columns: [
                    {data: "listIndex"},
                    {data: "appName"},
                    {data: "title"},
                    {data: "service.serviceName"},
                    {data: "viewYn" ,
                        render: function(data){
                            if (data) {
                                return "노출";
                            } else {
                                return "<span class='text-red'>숨김</span>";
                            }
                        }},
                    {data: "startEnd"},
                    {data: "insertUserId"},
                    {data: "insertDate" },


                ],
                columnDefs: [
                    {targets: "_all", className: "text-center"},
                    {
                        targets: [7],
                        render: function(data){
                            return dateFormat(data);
                        },
                    },
                ],
            });

            $("#testTable_filter").text("");
            //$("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');
            dateSetting();
            /*getToday();*/

            //상세
            $("#testTable").on('click','tbody td', function() {
                var row = $("#testTable").DataTable().row($(this).parents("tr")).data();
                location.href = "${path}/board/event/detail?eventNo=" + row.eventNo;
            });
        });


        dateSetting();

    });
    function serarchForm() {
        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) {table.column(i).search(''); }
        /*  var searchType = $("#searchType").val();
          var searchValue = $("#searchValue").val();*/

        table.column().draw();
        /*let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {

        }*/
    }
    $(() => {
        $(".insert_btn").click(function() {
            location.href = '${path}/board/event/insert';
        });
        $(".detailRow").click(function() {
            let eventNo = $(this).attr("eventNo")
            location.href = "${path}/board/event/detail?eventNo="+eventNo;
        });
    });
</script>
</body>
</html>
