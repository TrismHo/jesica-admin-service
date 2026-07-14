<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | <spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="사용자 관리"/></title>
</head>
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
                    <li class="breadcrumb-item"><a href="${path}/system/master/list"><spring:message code="sidemenu.workgroupmanagement1" text="시스템 운영"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="사용자 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="사용자 관리"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form class="brand_search_form"></form>
            <form name="frmSearch" id="frmSearch">
                <div class="search-box search-box-inline">
                    <div class="inner-search-box">
                        <div class="search-inline-bar">
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
                                <div class="search-label">사용상태</div>
                                <div class="search-control-group">
                                    <select class="form-control dataStatus" name="dataStatus">
                                        <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>>전체</option>
                                        <option value="1" <c:if test="${searchValue.dataStatus == '1'}">selected</c:if>>정상</option>
                                        <option value="2" <c:if test="${searchValue.dataStatus == '2'}">selected</c:if>>정지</option>
                                    </select>
                                </div>
                            </div>

                            <div class="search-field">
                                <div class="search-label">앱구분</div>
                                <div class="search-control-group">
                                    <c:if test="${empty appCode}">
                                        <select id="appCode" name="appCode" class="form-control">
                                            <option value="" selected>전체</option>
                                            <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                <option value="${appCodeList.sysCode}" <c:if test="${searchValue.appCode == appCodeList.sysCode}">selected</c:if>>
                                                        ${appCodeList.codeName}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${!empty appCode}">
                                        <input type="text" class="form-control" name="appCode" readonly value="${appCode}">
                                    </c:if>
                                </div>
                            </div>



                            <div class="search-field search-keyword">
                                <div class="search-label">검색어</div>
                                <div class="search-control-group search-keyword-group">
                                    <select class="form-control">
                                        <option>사용자이름</option>
                                    </select>
                                    <input type="text"
                                           name="name"
                                           value="${searchValue.name}"
                                           class="form-control width-150"
                                           maxlength="150"
                                           placeholder="사용자이름 입력">
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
                                            class="insert_btn btn btn-search-inline ml-1">
                                        <span>사용자등록</span>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </form>
            <div class="panel-body p-15">
                <table id="testTable" class="display table compact-table table-striped">
                    <thead>
                    <th class="text-center"><spring:message code="list.word.no" text="순번"/></th>
                    <th class="text-center"><spring:message code="list.word.no1" text="앱구분"/></th>
                    <th class="text-center"><spring:message code="list.word.no1" text="권한등급"/></th>
                    <th class="text-center"><spring:message code="list.word.affiliated1" text="로그인ID"/></th>
                    <th class="text-center"><spring:message code="list.word.franchisee1" text="사용자이름"/></th>
                    <th class="text-center"><spring:message code="list.word.statu1" text="사용자전화번호"/></th>
                    <th class="text-center"><spring:message code="list.word.distributor1" text="마지막 로그인시간"/></th>
                    <th class="text-center"><spring:message code="list.word.registrationdate1" text="등록일"/></th>
                    </thead>
                   <%-- <tbody>
                    <c:forEach var="item" items="${tbUserStaffList}" varStatus="status">
                        <tr class="detailRow" userNo="${item.staffNo}" >
                            <td  class="text-center">${status.index + 1}</td>
                            <td  class="text-center">
                                <c:if test="${item.roleType == 0}">
                                    마스터
                                </c:if>
                                <c:if test="${item.roleType == 1}">
                                    통합관리자
                                </c:if>
                                <c:if test="${item.roleType == 2}">
                                    앱관리자
                                </c:if>
                            </td>
                            <td class="text-center"><span class="orangeColor d-block">${item.userId}</span></td>
                            <td class="text-center">${item.name}</td>
                            <td class="text-center">
                                <c:if test="${item.phone.length() == 11}">
                                    ${fn:substring(item.phone, 0, 3)}-${fn:substring(item.phone, 3, 7)}-${fn:substring(item.phone, 7, 12)}
                                </c:if>
                                <c:if test="${item.phone.length() == 10}">
                                    ${fn:substring(item.phone, 0, 2)}-${fn:substring(item.phone, 2, 6)}-${fn:substring(item.phone, 6, 12)}
                                </c:if>
                                <c:if test="${item.phone.length() != 10 && item.phone.length() != 11}">
                                    ${item.phone}
                                </c:if>
                            </td>
                            <td class="text-center"><javatime:format value="${item.lastLoginDtm}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
<!-- end page container -->
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
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
            location.href = '${path}/system/master/insert';
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
            table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/system/master/list","A2","1", true, {
                columns: [
                    {data: "listIndex"},
                    {data: "appName" ,
                        render: function(data){
                            if(data){
                                return data;
                            } else {
                                return "-";
                            }
                        },
                    },
                    {data: "roleType" ,
                            render: function(data){
                                if(data == 0){
                                    return "";
                                } else if(data == 1){
                                    return "통합관리자";
                                } else if(data == 2){
                                    return "앱관리자";
                                }
                            },
                        },
                    {data: "userId",
                            render: function(data){
                                    return "<span class='orangeColor d-block'>"+data+"</span>";
                            }
                        },
                    {data: "name" },
                    {data: "phone",
                    render: function(data){
                        return phoneHyphen(data)
                    }},
                    {data: "lastLoginDtm"},
                    {data: "insertDate" },
                ],
                columnDefs: [
                    {targets: "_all", className: "text-center"},
                    {
                        targets: [5,6],
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
                location.href = "${path}/system/master/detail?userNo=" + row.staffNo;
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
    /*$(() => {
        $(".insert_btn").click(function() {
            location.href = '${path}/board/event/insert';
        });
        $(".detailRow").click(function() {
            let userNo = $(this).attr("userNo")
            location.href = "${path}/board/event/detail?userNo="+userNo;
        });
    });*/

    // DataTables Default

    /*$(() => {
        dateSetting();
        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-140');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownWide").hide();
                $(".detailOptionBtnUpWide").show();
            } else {
                $(".detailOptionBtnDownWide").show();
                $(".detailOptionBtnUpWide").hide();
            }
        });

        $(".detailOptionBtn2").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-140');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
            }
        });


       /!* $(".insert_btn").click(function() {
            location.href = "${path}/system/master/insert";
        });*!/
    });*/
    /*$(document).on("click",".detailRow",function(){
        let userNo = $(this).attr("userNo")
        location.href = "${path}/system/master/detail?userNo="+userNo;
    });
    function searchFormBranchFunction() {
        $("#frmSearch").submit();
    }*/

</script>
</body>
</html>
