<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jig-Bae  | <spring:message code="sidemenu.boardmanagement.platformannouncement1" text="온동네주문내역"/></title>
</head>
<style>

    .dvryServiceTd {
        display: none;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    div.dataTables_wrapper div.dataTables_processing {
        position: absolute;
        z-index: 2;
        /* top: 264%; */
        margin-top: 100px;
        /* left: 10%; */
        /* width: 200px; */
        /* margin-left: -397px; */
        /* margin-top: -26px; */
        text-align: center;
        padding: 2em 0;
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
                    <li class="breadcrumb-item"><a href="${path}/store/order/list"><spring:message code="sidemenu.boardmanagement1" text="가맹점"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="온동네주문내역"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="온동네주문내역"/></h3>
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
                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification1" text="앱구분"/></strong></td>
                                            <td>
                                                <c:if test="${empty appCode}">
                                                    <select id="brandTypeCd" name="brandTypeCd" class="form-control" >
                                                        <option value="" selected>전체</option>
                                                        <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                            <option value="${appCodeList.codeValue}" <c:if test="${searchValue.appCode == appCodeList.sysCode}">selected</c:if>>${appCodeList.sysCode} (${appCodeList.codeName})</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${!empty appCode}">
                                                    <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                        <c:if test="${appCode == appCodeList.sysCode}">
                                                            <input type="hidden" name="brandTypeCd" value="${appCodeList.codeValue}">
                                                            <input type="text" class="form-control" value="${appCodeList.codeName}" disabled>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="주문상태"/></strong></td>
                                            <td style="" colspan="1">
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
                                                        <option value="14" <c:if test="${searchValue.ordStatus == '15'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="배차"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--<td class="bg-light"><strong><spring:message code="list.search.orderstatus1"
                                                                                         text="총판코드"/></strong></td>
                                            <td >
                                                <select class="form-control" name="brCode" style="margin-right: 30px;" >
                                                    <option value="">전체</option>
                                                    <c:forEach var="item" items="${brCodeList}" varStatus="status">
                                                        <option <c:if test="${item.brCode == searchValue.brCode}">selected</c:if> value="${item.brCode}">${item.brName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>--%>
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
                                            <td style="border-right:none;" colspan="3">
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
                                <div class="col-xl-12 col-md-12 m-t-10">
                                    <div class="">
                                        <%--<button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                            <span class="fa fa-plus"><spring:message code="list.word.eventregistration" text="이벤트 등록"/>&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;</span>
                                        </button>--%>
                                        <button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> 검색 </button>
                                    </div>
                                </div>
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

        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/order/list", "A2",downloadChk, true,{
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
        });
        $("#testTable").on('click','tbody td', function() {
            var row = $("#testTable").DataTable().row($(this).parents("tr")).data();
            location.href = "${path}/store/order/detail?ordNo=" + row.ordNo;
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
    function searchFormFunction() {
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


</script>
</body>
</html>
