<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Pick-Order | <spring:message code="sidemenu.boardmanagement.platformannouncement1" text="맛집주문내역"/></title>
</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
         display: block;
    }
    .dataTables_wrapper .row .col-sm-12 {
        overflow: auto;
    }
    .testTable_wrapper .row {
        width: 3000px;
    }

    .overflow-x-auto .table {
        width: auto !important;
        table-layout: fixed;
        white-space: nowrap;
    }

    .overflow-x-auto .table td {
        min-width: 80px;
    }

    .dataTables_wrapper.dt-bootstrap .dataTables_scroll, .dataTables_wrapper.dt-bootstrap4 .dataTables_scroll {
        margin: 0 0 15px !important;
        width: 2000px;
    }

    .dataTables_wrapper .row .col-sm-12 {
        overflow: auto;
    }
    .detailRow {
        border: 1px solid #ddd;
    }

    .buttons-csv {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-csv:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-copy {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-copy:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
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
    .buttons-print {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-print:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter label .form-control {
        /* display: block; */
        /* margin-left: 8px; */
        /* width: 260px; */
        /* height: 34px; */
        width: 150px;
        height: 23px;
        border: 1px solid #ddd;
    }
    .dvryServiceTd {
        display: none;
    }

    div.dataTables_wrapper div.dataTables_processing {
        position: absolute;
        top: 264%;
        left: 10%;
        width: 200px;
        /* margin-left: -397px; */
        /* margin-top: -26px; */
        text-align: center;
        padding: 1em 0;
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
                    <li class="breadcrumb-item"><a href="${path}/restaurant/order/list"><spring:message code="sidemenu.boardmanagement1" text="맛집"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="맛집주문내역"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="맛집주문내역"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr >
                                            <td class="bg-light" style="width:10%"><strong><spring:message
                                                    code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong>
                                            </td>
                                            <td style="width: 30%">
                                                <label>
                                                    <input type="text" class="form-control startDate background-white"
                                                           name="startDate" value="${searchValue.startDate}" readonly> <i
                                                        class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                                <label>
                                                    <input type="text" class="form-control endDate background-white"
                                                           name="endDate" value="${searchValue.endDate}" readonly> <i
                                                        class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>

                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="주문상태"/></strong></td>
                                            <td style="width: 207px" colspan="3">
                                                <label>
                                                    <select class="form-control" name="ordStatus">
                                                        <option value="" <c:if test="${searchValue.ordStatus == ''}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="전체"/></option>
                                                        <option value="1" <c:if test="${searchValue.ordStatus == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="접수요청"/></option>
                                                        <option value="2" <c:if test="${searchValue.ordStatus == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="접수완료"/></option>
                                                        <option value="3" <c:if test="${searchValue.ordStatus == '3'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="조리중"/></option>
                                                        <option value="4" <c:if test="${searchValue.ordStatus == '4'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="배달중"/></option>
                                                        <option value="5" <c:if test="${searchValue.ordStatus == '5'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="완료"/></option>
                                                        <option value="6" <c:if test="${searchValue.ordStatus == '6'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="조리완료"/></option>
                                                        <option value="7" <c:if test="${searchValue.ordStatus == '7'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="테이블주문접수"/></option>
                                                        <option value="8" <c:if test="${searchValue.ordStatus == '8'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="대기"/></option>
                                                        <option value="9" <c:if test="${searchValue.ordStatus == '9'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="호출"/></option>
                                                        <option value="10" <c:if test="${searchValue.ordStatus == '10'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="입장완료"/></option>
                                                        <option value="11" <c:if test="${searchValue.ordStatus == '11'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="예약요청"/></option>
                                                        <option value="12" <c:if test="${searchValue.ordStatus == '12'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="예약확정"/></option>
                                                        <option value="13" <c:if test="${searchValue.ordStatus == '13'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="취소"/></option>
                                                        <option value="14" <c:if test="${searchValue.ordStatus == '14'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="노쇼"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.orderstatus1"
                                                                                         text="총판코드"/></strong></td>
                                            <td >
                                                <select class="form-control" name="brCode" style="margin-right: 30px;" >
                                                    <option value="">전체</option>
                                                    <c:forEach var="item" items="${brCodeList}" varStatus="status">
                                                        <option <c:if test="${item.brCode == searchValue.brCode}">selected</c:if> value="${item.brCode}">${item.brName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.orderstatus1"
                                                                                         text="주문구분"/></strong></td>
                                            <td style="padding: 0px">
                                                <table>
                                                    <tr>
                                                        <td style="border: none; width: 310px;">
                                                            <label>
                                                                <select class="form-control ordTypeSelect" name="ordType">
                                                                    <option value="" <c:if test="${searchValue.ordType == ''}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="전체"/></option>
                                                                    <option value="1" <c:if test="${searchValue.ordType == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="배달"/></option>
                                                                    <option value="2" <c:if test="${searchValue.ordType == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="포장"/></option>
                                                                    <option value="2" <c:if test="${searchValue.ordType == '3'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="대기"/></option>
                                                                    <option value="2" <c:if test="${searchValue.ordType == '4'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="예약"/></option>
                                                                    <option value="2" <c:if test="${searchValue.ordType == '5'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="테이블"/></option>
                                                                </select>
                                                            </label>
                                                        </td>
                                                        <td class="bg-light border-top-0 border-bottom-0 dvryServiceTd" <c:if test="${searchValue.ordType == 1}"> style="display:table-cell;" </c:if>  ><strong><spring:message code="list.search.postclassification" text="배달서비스 구분"/></strong></td>
                                                        <td class="dvryServiceTd border-top-0 border-bottom-0 border-right-0" <c:if test="${searchValue.ordType == 1}"> style="display:table-cell;" </c:if> style="width: 180px">
                                                            <label>
                                                                <select class="form-control" name="dvryServiceType">
                                                                    <option value="" <c:if test="${searchValue.dvryServiceType == ''}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="전체"/></option>
                                                                    <option value="1" <c:if test="${searchValue.dvryServiceType == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="0원배달"/></option>
                                                                    <option value="2" <c:if test="${searchValue.dvryServiceType == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="0순위배달"/></option>
                                                                </select>
                                                            </label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                            <td style="border-right:none;" >
                                                <label>
                                                    <select class="form-control searchOp" name="keywordType" style="width: 110px">
                                                        <option value="ordCuTel" <c:if test="${searchValue.keywordType == 'ordCuTel'}">selected</c:if>><spring:message code="list.search.title1" text="고객연락처"/></option>
                                                        <option value="stName" <c:if test="${searchValue.keywordType == 'stName'}">selected</c:if>><spring:message code="list.search.title2" text="가맹점명"/></option>
                                                    </select>
                                                    <input type="text" class="form-control width-150" name="keyword" value="${searchValue.keyword}" maxlength="150">
                                                </label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped" >
                    <thead>
                    <tr class="text-center">

                        <th class="align-middle width-40"><spring:message code="list.word.no" text="번호"/>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="주문번호"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="주문날짜"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="주문구분"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="배달서비스"/></th>
                        <%--<th class="align-middle "><spring:message code="list.word.orderno1" text="주문확인"/></th>--%>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="주문상태"/></th>
                        <%--<th class="align-middle "><spring:message code="list.word.orderno1" text="주문경로"/></th>--%>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="가맹점이름"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="총판"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="마스터가맹점"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="가맹점"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="가맹점 전화번호"/></th>
                        <th class="align-middle width-150"><spring:message code="list.word.orderno1" text="매장 요청사항"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="지불금액"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="봉사료"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="추천총판"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="추천마스터가맹"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="추천가맹"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="고객연락처"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="배달주소"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="이용횟수"/></th>

                        <th class="align-middle "><spring:message code="list.word.orderno1" text="취소사유"/></th>
                        <%-- <th class="align-middle "><spring:message code="list.word.orderno1" text="배차일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="출발일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="완료일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="취소일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="배차 배송원이름"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="배차 배송원 전화번호"/></th>--%>

                    </tr>
                    </thead>
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
           /* lengthMenu : [ [ 10, 20, 30 ,40], [ 10, 20, 30, 40] ],*/
            responsive: true,
            processing:true,
            bAutoWidth: false,
            ordering: true,
            serverSide: true,
            columns : [
                {data: "listIndex"},
                {data: "ordNo"},
                {data: "ordDate"},
                {data: "ordType"},
                {data: "dvryServiceType"},
                {data: "ordStatus"},
                {data: "stName"},
                {data: "brCode"},
                {data: "masterStCode"},
                {data: "ordStCode"},
                {data: "stTel"},
                {data: "ordCuStMemo"},
                {data: "payAmt"},
                {data: "srvAmt"},
                {data: "extBrCode"},
                {data: "extMasterStCode"},
                {data: "extRecommStCode"},
                {data: "ordCuTel"},
                {data: "eaAddr4"},
                {data: "totalUseCount"},
                {data: "cancelMemo"},
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {
                    targets: 2,
                    render: function(data){
                    return dateFormat(data);
                    },
                },
                {
                    targets: 3,
                    render: function(data){
                        return orderType(data);
                    }
                },
                {
                    targets: 4,
                    render: function(data){
                        if(data) {
                            if(data == 1) {
                                return "0원배달";
                            } else if(data == 2) {
                                return "0순위배달";
                            } else {
                                return "";
                            }
                        } else {
                            return "";
                        }
                    }
                },
                {
                    targets: 5,
                    render: function(data){
                        if(data) {
                            return orderStatus(data);
                        } else {
                            return "";
                        }
                    }
                },
                {targets : [12,13] , render : $.fn.dataTable.render.number(',')},
                {
                    targets: [10,17],
                    render: function(data){
                        return phoneHyphen(data);
                    }
                },
                {
                    targets: 19,
                    render:function(data){
                        return countString(data, "회");
                    }
                },
            ],
            ajax : {
                url: "${path}/api/order/list",
                type: "POST",
                data: function (res) {
                    var formData = objectifyForm($("#frmSearch").serializeArray());
                    var param = formData;

                    param["draw"] = res.draw;
                    param["length"] = res.length;
                    param["start"] = res.start;
                    return param;
                },
                dataSrc: function(res) {
                    var data= res.data;
                    // 리스트번호
                    for (let i = 0; i < data.length; i++) {
                        data[i].listIndex = i + 1
                        data[i]["number"] = i;
                    }

                    return data;
                },
                statusCode: {
                    200: (response) => {
                        // TODO
                    },
                    400: (response) => {
                        // TODO
                    },
                    500: (response) => {
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
            dom: '<"row"<"col-sm-5"l B><"col-sm-7"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
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


        //상세
        $("#testTable").on('click','tbody tr', function() {
            var row = $("#testTable").DataTable().row($(this)).data();
            location.href = "${path}/restaurant/order/detail?ordNo=" + row.ordNo;
        });

        $("#testTable_filter").text("");
        $("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');

        $(document).on("click", ".detailRow", function () {
            let ordNo = $(this).attr("ordNo");
            location.href = "${path}/restaurant/order/detail?ordNo=" + ordNo;
        });
        $(document).on("change", ".ordTypeSelect", function () {
          let thisVal = $(this).val();
          if(thisVal == 1){
              $(".dvryServiceTd").css("display","table-cell");
          } else {
              $(".dvryServiceTd").css("display","none");
          }
        });

        dateSetting();
    });

    /*var previous;
    $(".startDate, .endDate").on("focus",function(){
        previous = this.value;
    }).change(function() {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
      /!*      var date = $(this)[0].name == "startDate" ? new Date(endDate) : new Date(startDate);

            let daySet = date.getDate().toString().padStart(2, '0');

            let setDate = $(this)[0].name == "startDate" ?  new Date(new Date().setDate(daySet - 31)) : new Date(new Date().setDate(date.getDate() + 31));


            console.log(setDate)
            let year = setDate.getFullYear();
            let month = (setDate.getMonth() + 1).toString().padStart(2, '0');
            let day = setDate.getDate().toString().padStart(2, '0');

            let yyyymmdd = year+"-"+month+"-"+day;*!/

            alert("날짜범위는 최대 31일까지 가능합니다.")
            $(this).datepicker('setDate', previous);
            $(this).val(previous);
        }
    });*/
    function serarchForm() {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {

            alert("날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else{
            var numCols = table.columns().nodes().length;
            for(var i=0; i<numCols; i++) {table.column(i).search(''); }
            /*  var searchType = $("#searchType").val();
              var searchValue = $("#searchValue").val();*/

            table.column().draw();
        }

    }





    /*function searchFormFunction() {
        var ordTypeValues = "";
        $(".ordType:checked").each(function () {
            if (ordTypeValues == "") {
                ordTypeValues = $(this).val();
            } else {
                ordTypeValues = ordTypeValues + "," + $(this).val();
            }
        });
        $("input[name=ordType]").val(ordTypeValues);

        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("날짜범위는 최대 31일까지 가능합니다.")
            e.preventDefault();
            e.stopPropagation();
        } else {
            $("#frmSearch").submit();
        }
      /!*  let pleaseselectastore = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
        if ($(".storeNo").val() == "" || $(".storeNo").val() == null) {
            swal({
                title: pleaseselectastore,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            });
        } else {

        }*!/
        /!*   $("#frmSearch").submit();*!/
    }*/
</script>
</body>
</html>
