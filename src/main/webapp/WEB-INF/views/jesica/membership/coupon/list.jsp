<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="../../../common/include_head.jsp" %>
    <meta charset="utf-8"/>
    <%--운영일때만 붙이기--%>
    <c:if test="${pageContext.request.scheme == 'https'}">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    </c:if>
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <title>Pick-Order | <spring:message code="sidemenu.couponmanagement.couponmanagement1" text="쿠폰 관리"/></title>
</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter label .form-control {
        /* display: block; */
        /* margin-left: 8px; */
        /* width: 260px; */
        /* height: 34px; */
        width: 150px;
        height: 23px;
        border: 1px solid #ddd;
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
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
   /* .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }*/
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement12" text="쿠폰 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="쿠폰 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="쿠폰 관리"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                    <input type="hidden" name="ordPathCd" value="<spring:eval expression="@environment.getProperty('file.ordPathCd.pickOrder')" />">
                                    <input type="hidden" name="authKey" value="<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />">
                                    <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr >
                                        <td class="bg-light width-170">
                                            <strong>상태</strong>
                                        </td>
                                        <td colspan="3">
                                            <div class="row">
                                            </div>
                                            <label>
                                                <select class="form-control dataStatus" name="cpnStatus">
                                                    <option value="A" ><spring:message code="list.search.all1" text="전체"/></option>
                                                    <option value="Y" selected>정상</option>
                                                    <option value="N" >정지</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">
                                            <label>
                                                <select class="form-control" name="searchType">
                                                    <option value="R" <c:if test="${searchValue.serviceType == '3'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="등록기간"/></option>
                                                    <option value="U" <c:if test="${searchValue.serviceType == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="사용기간"/></option>
                                                </select>
                                            </label>
                                        </td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control periodS background-white"  name="periodS" value="" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control periodE background-white" name="periodE" value="" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="검색어 입력"/></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option><spring:message code="list.search.title1" text="쿠폰명"/></option>
                                                </select>
                                                <input type="text" class="form-control width-150" name="cpnTitle" value="" maxlength="150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                        <button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                            <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="쿠폰생성"/></span>
                                        </button>
                                    </c:if>
                                    <button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchForm()"><i class="fa fa-search grayicon"></i> 검색 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th><spring:message code="list.word.no1" text="번호"/></th>
                            <th><spring:message code="list.detail.title1" text="쿠폰명"/></th>
                            <th><spring:message code="list.detail.title1" text="쿠폰 발급기준"/></th>
                            <th><spring:message code="list.detail.title1" text="쿠폰 발급조건"/></th>
                            <th><spring:message code="list.word.contents1" text="쿠폰상태"/></th>
                            <th><spring:message code="list.word.contents1" text="할인금액(률)"/></th>
                            <th><spring:message code="list.word.serviceclassification1" text="등록일"/></th>
                            <th><spring:message code="list.word.serviceclassification1" text="등록자"/></th>
                            <th><spring:message code="list.word.status1" text="사용기간"/></th>
                        </tr>
                    </thead>
                    <%--<tbody>
                    <c:forEach var="item"  items="${tbCouponList}"  varStatus="status">
                        <tr class="detailRow" couponNo="${item.couponNo}">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-center">${item.title}</td>
                            <td class="text-center">${item.couponCode}</td>
                            <td class="text-center">${item.maxPublishCount}개</td>
                            <td class="text-center">${item.publishCount}개</td>
                            <td class="text-center">
                                ${item.dcAmt}
                                <c:if test="${item.dcRateType == 1}">원</c:if>
                                <c:if test="${item.dcRateType == 2}">%</c:if>
                            </td>
                            <td class="text-center" style="">
                                <c:if test="${item.serviceType == 2}">
                                    <spring:message code="list.search.all1" text="탁송"/>
                                </c:if>
                                <c:if test="${item.serviceType == 3}">
                                    <spring:message code="list.word.franchisee1" text="맛집"/>
                                </c:if>
                                <c:if test="${item.serviceType == 4}">
                                    <spring:message code="list.word.franchisee1" text="마트"/>
                                </c:if>
                                <c:if test="${item.serviceType == 5}">
                                    <spring:message code="list.word.franchisee1" text="맛집예약"/>
                                </c:if>
                            </td>
                            <td class="text-center"><javatime:format value="${item.publishperiodS}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center"><javatime:format value="${item.publishEndDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center">
                                <c:if test="${item.dataStatus == 0}"><span class="text-red"><spring:message code="list.word.hide1" text="삭제"/></span></c:if>
                                <c:if test="${item.dataStatus == 1}"><spring:message code="list.word.exposure1" text="정상"/></c:if>
                                <c:if test="${item.dataStatus == 2}"><spring:message code="list.word.exposure1" text="정지"/></c:if>
                            </td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>--%>
                </table>
            </div>
        </div>
        <!-- end panel -->
    </div>
    </form>
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
    };
    var table;
    $(() => {

        $(".insert_btn").click(function() {
            location.href = '${path}/membership/coupon/insert';
        });


        let date = new Date();
        let date2 = new Date();
        let periodS = "${searchValue.periodS}";
        let periodE = "${searchValue.periodE}";
        var month30 = new Date(date2.setDate(date2.getDate() - 30));

        $(".periodS").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(periodS == ""){
            $(".periodS").datepicker('setDate', month30 );
        } else {
            $(".periodS").datepicker('setDate', periodS);
        }

        $(".periodE").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        if(periodE == ""){
            $(".periodE").datepicker('setDate', date);
        } else {
            $(".periodE").datepicker('setDate', periodE);
        }

        let allChkStatus ="${searchValue.ordType}";

        if(allChkStatus == "" )  {
            $("#ex_chk_all_status").click();
        }

        $("#ex_chk_all_status").click(function () {
            $(".ordType").prop('checked', this.checked);
        });


        table = $("#testTable").DataTable({
            language :  {
                lang_set,
                "processing": "데이터 불러오는 중...",
                "info": " _PAGE_ - _PAGES_ (총 _MAX_ 건)",
            }, //or lang_eng
            /*   pagingType: "full_numbers",*/
            /*   pagingType : "full_numbers",*/
            lengthMenu : [ [ 10, 20, 30 ,40], [ 10, 20, 30, 40] ],
            responsive: true,
            processing:true,
            bAutoWidth: false,
            ordering: true,
            serverSide: true,
            columns : [
                {data: "listIndex"},
                {data: "cpnTitle"},
                {data: "issuedType"},
                {data: "issuedCondition"},
                {data: "dataStatus"},
                {data: "discountAmt"},
                {data: "putDate"},
                {data: "putUserId"},
                {data: "usePeriod"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {
                    targets: 2, className: "text-center",
                    render: function (data) {
                        if (data) {
                            if (data == 'D') {
                                return "조건충족시";
                            } else if (data == 'T') {
                                return "지정한 시점";
                            } else if (data == 'B') {
                                return "일괄지급";
                            } else if (data == 'S') {
                                return "스탬프지급";
                            } else {
                                return "-";
                            }
                        } else {
                            return "";
                        }
                    }
                },
                {targets: 3, className: "text-center",
                    render: function (data) {
                        if (data) {
                            if (data == 'D') {
                                return '조건횟수충족';
                            } else if (data == 'R') {
                                return "회원가입완료";
                            } else if (data == 'F') {
                                return "친구초대";
                            } else if (data == 'B') {
                                return "일괄지급";
                            } else {
                                return "-";
                            }
                        } else {
                            return "";
                        }
                    }
                }
            ],
            ajax : {
                //url: "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/list", // 테스트
                //url: "https://frapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/list",  //운영
                url:"<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon-manage/list",
                type: "GET",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                },
                data: function (res) {

                    var formData = objectifyForm($("#frmSearch").serializeArray());
                    var param = formData;

                    param["periodS"] = param["periodS"].replaceAll("-","").replaceAll("-","");
                    param["periodE"] = param["periodE"].replaceAll("-","").replaceAll("-","");

                    param["draw"] = res.draw;
                    param["length"] = res.length;
                    param["start"] = res.start;

                    param.pageSize = param.testTable_length;
                    param.pageNo = res.start/res.length + 1;
                    return param;
                },
                dataSrc: function(res) {
                    // 리스트번호
                    if(res.data.infoData){
                        var data = res.data.infoData;
                        for (let i = 0; i < data.length; i++) {
                            data[i].listIndex = i + 1
                            data[i]["number"] = i;
                        }
                        res.recordsTotal = res.data.totalCount
                        res.recordsFiltered = res.data.totalCount
                        return data;
                    } else {
                        var data = {};
                        res.recordsTotal = 0;
                        res.recordsFiltered = 0;
                        return data;
                    }
                },
                statusCode: {
                    200: (response) => {
                        console.log(response)
                        // TODO
                    },
                    400: (response) => {
                        console.log(response)
                        // TODO
                    },
                    500: (response) => {
                        console.log(response)
                        // TODO
                    }
                }
            },
            layout: {
                top1: {
                    searchBuilder: {
                        liveSearch: true
                    }
                }
            },
            paging: true,
            responsive: true,
            dom: '<"row"<"col-sm-12"l B><"col-sm-12"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                /*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*/
                /*   { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
                { extend: 'excel',
                    text: '&nbsp; 엑셀 다운로드',
                    className: 'btn-sm fa fa-file-excel'
                    ,filename: '엑셀출력_'+moment().format('YYYYMMDDhhmm')
                    ,title: ''
                    ,action: newExportAction
                },
                /*    { extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
            ],
        });

        /*$("#testTable_filter").text("");
        $("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=searchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');*/

        //상세
        $("#testTable").on('click','tbody tr', function() {
            var row = $("#testTable").DataTable().row($(this)).data();
            location.href = "${path}/membership/coupon/detail?cpnNo=" + row.cpnNo;
        });
    });




    function searchForm() {
        let periodS = $(".periodS").val()
        let periodE = $(".periodE").val()
        /*if(getDateDiff(periodS, periodE) > 31) {

            alert("날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else{

        }*/
        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) {table.column(i).search(''); }
        /*  var searchType = $("#searchType").val();
          var searchValue = $("#searchValue").val();*/

        table.column().draw();
       // $('#frmSearch').submit();
    }
</script>
</body>
</html>
