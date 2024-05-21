<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.platformannouncement1" text="세차주문내역"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | <spring:message code="sidemenu.boardmanagement.platformannouncement1" text="세차주문내역"/></title>
    </c:if>

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
일
    .overflow-x-auto .table {
        width: auto !important;
        table-layout: fixed;
        white-space: nowrap;
    }

    .overflow-x-auto .table td {
        min-width: 80px;
    }

    ​
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="차량배달"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="세차주문내역"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement1" text="세차주문내역"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr >
                                            <td class="bg-light" style="width:10%"><strong><spring:message
                                                    code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong>
                                            </td>
                                            <td style="width:50%">
                                                <label>
                                                    <input type="text" class="form-control startDate background-white"
                                                           name="startDate" value="${searchValue.startDate}" readonly> <i
                                                        class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                               <%-- <label>
                                                    <input type="text" class="form-control endDate background-white"
                                                           name="endDate" value="${searchValue.endDate}" readonly> <i
                                                        class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>--%>
                                                <input type="hidden" id="ordType" name="ordType" value="4">
                                            </td>
                                           <%-- <td class="bg-light"><strong><spring:message code="list.search.orderstatus"
                                                                                         text="주문구분"/></strong></td>
                                            <td colspan="3">
                                                <input type="hidden" id="ordType" name="ordType" value="4">--%>
                                              <%--  <label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="ordType" id="ex_chk10"
                                                               value="4"
                                                        <c:forEach items="${fn:split(searchValue.ordType, ',') }"
                                                                   var="itemChk">
                                                        <c:choose>
                                                        <c:when test="${itemChk.trim() == 4}">
                                                               checked
                                                        </c:when>
                                                        <c:when test="${itemChk == '' || itemChk == null }">
                                                        </c:when>
                                                        </c:choose>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk10"><spring:message code="list.search.cancel"
                                                                                              text="예약"/></label>
                                                    </div>
                                                </label>--%>
                                                <%--<label class=" m-r-5">
                                                    <div class="checks small m-l-10">
                                                        <input type="checkbox" class="orderStatusCode" id="ex_chk11"
                                                               value="42"
                                                        <c:forEach items="${fn:split(searchValue.orderStatusCode, ',') }"
                                                               <c:if test="${itemChk.trim() == 42}">checked</c:if>
                                                        </c:forEach>
                                                        >
                                                        <label for="ex_chk11"><spring:message code="list.search.question"
                                                                                              text="문의"/></label>
                                                    </div>
                                                </label>--%>
                                            <%--</td>--%>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                            <td colspan="3">
                                                <label>
                                                    <select class="form-control searchOp" name="keywordType" style="width: 110px">
                                                        <option value="ordCuTel" <c:if test="${searchValue.keywordType == 'ordCuTel'}">selected</c:if>><spring:message code="list.search.title1" text="고객연락처"/></option>
                                                        <option value="stName" <c:if test="${searchValue.keywordType == 'stName'}">selected</c:if>><spring:message code="list.search.title2" text="가맹점명"/></option>
                                                    </select>
                                                    <input type="text" class="form-control width-150" name="keyword" value="${searchValue.keyword}" maxlength="150">
                                                </label>
                                                <%--<select class="form-control selectOption"  >
                                                    <option value="ordCuTel" <c:if test="${searchValue.ordCuTel != null}">selected</c:if>><spring:message code="list.search.1" text="고객연락처"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option value="stName" <c:if test="${searchValue.stName != null}">selected</c:if>><spring:message code="list.search.1" text="가맹점명"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                </select>
                                                <c:if test="${searchValue.ordCuTel == null && searchValue.stName == null}">
                                                    <input type="text" class="form-control width-150 inputValue" name="carNum" value="${searchValue.carNum}" maxlength="150">
                                                </c:if>
                                                <c:if test="${searchValue.ordCuTel != null}">
                                                    <input type="text" class="form-control width-150 inputValue" name="ordCuTel" value="${searchValue.ordCuTel}" maxlength="150">
                                                </c:if>
                                                <c:if test="${searchValue.stName != null}">
                                                    <input type="text" class="form-control width-150 inputValue" name="stName" value="${searchValue.stName}" maxlength="150">
                                                </c:if>--%>
                                               <%-- <label>
                                                    <input type="text" name="ordCuTel" value="${searchValue.ordCuTel}"
                                                           class="form-control width-150">
                                                </label>--%>
                                                <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="${path}/washing/order/list?ordType=4&startDate=${now}"
                                                           class="btn btn-sm btn-white btn-white-without-border searchClick"
                                                           data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message
                                                                code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
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
                         <%--<th class="align-middle "><spring:message code="list.word.orderno1" text="주문경로"/></th>--%>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="가맹점이름"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="지불금액"/></th>
                        <th class="align-middle "><spring:message code="list.word.orderno1" text="봉사료"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="주문상태"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="고객연락처"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="배달서비스"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="가맹점 전화번호"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="주문확인"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="취소사유"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="주문구분"/></th>
                        <%-- <th class="align-middle "><spring:message code="list.word.orderno1" text="배차일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="출발일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="완료일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="취소일시"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="배차 배송원이름"/></th>
                         <th class="align-middle "><spring:message code="list.word.orderno1" text="배차 배송원 전화번호"/></th>--%>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${orderList}" varStatus="status">
                        <tr class="detailRow" ordNo="${item.ordNo}">
                            <td class="text-center">${status.index+1}</td>
                            <td class="text-center">${item.ordNo}</td>
                            <td class="text-center"><javatime:format value="${item.ordDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                           <%-- <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.ordPathCd == '1063'}">
                                        <spring:message code="list.word.receipt11" text="제시카"/>
                                    </c:when>
                                    <c:when test="${item.ordPathCd == '1069'}">
                                        <spring:message code="list.word.receipt11" text="양파오더"/>
                                    </c:when>
                                    <c:when test="${item.ordPathCd == '1070'}">
                                        <spring:message code="list.word.receipt11" text="세날"/>
                                    </c:when>

                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>--%>
                            <td class="text-center">${item.stName}</td>
                            <td><fmt:formatNumber value="${item.payAmt}" pattern="#,###"/><spring:message code="list.word.won" text="원"/></td>
                            <td><fmt:formatNumber value="${item.srvAmt}" pattern="#,###"/><spring:message code="list.word.won" text="원"/></td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.ordStatus == 10}">
                                        <spring:message code="list.word.receipt11" text="입장완료"/>
                                    </c:when>
                                    <c:when test="${item.ordStatus == 11}">
                                        <spring:message code="list.word.waiting11" text="예약요청"/>
                                    </c:when>
                                    <c:when test="${item.ordStatus == 12}">
                                        <spring:message code="list.word.reservation1" text="예약확정"/>
                                    </c:when>
                                    <c:when test="${item.ordStatus == 13}">
                                        <spring:message code="list.word.gettingready1" text="취소"/>
                                    </c:when>
                                    <c:when test="${item.ordStatus == 14}">
                                        <spring:message code="list.word.packingcomplete1" text="노쇼"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">${item.ordCuTel}</td>
                            <td  class="text-center">
                                    <c:choose>
                                        <c:when test="${item.dvryServiceType == 1}">
                                            <spring:message code="list.word.1" text="일반배달"/>
                                        </c:when>
                                        <c:when test="${item.dvryServiceType == 2}">
                                            <spring:message code="list.word.1" text="빠른배달"/>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                            </td>
                            <td class="text-center">${item.stTel}</td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${item.ordConfirmType == 0}">
                                        <spring:message code="list.word.1" text="미확인"/>
                                    </c:when>
                                    <c:when test="${item.ordConfirmType == 1}">
                                        <spring:message code="list.word.1" text="확인"/>
                                    </c:when>
                                    <c:when test="${item.ordConfirmType == 9}">
                                        <spring:message code="list.word.1" text="무관"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">${item.cancelMemo}</td>
                            <td  class="text-center">
                                <c:choose>
                                    <c:when test="${item.ordType == 1}">
                                        <spring:message code="list.word.1" text="배달"/>
                                    </c:when>
                                    <c:when test="${item.ordType == 2}">
                                        <spring:message code="list.word.1" text="포장"/>
                                    </c:when>
                                    <c:when test="${item.ordType == 3}">
                                        <spring:message code="list.word.1" text="대기"/>
                                    </c:when>
                                    <c:when test="${item.ordType == 4}">
                                        <spring:message code="list.word.1" text="예약"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <%--<td class="text-center"><img style="width: 100px; height: 54px" class="storeImg" src="${item.stImage}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'" >--%>
                          <%--  <td class="text-center">${item.takeoutDate}</td>
                            <td  class="text-center"><javatime:format value="${item.pickupDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td  class="text-center"><javatime:format value="${item.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td  class="text-center"><javatime:format value="${item.cancelDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="text-center">${item.cthWkName}</td>
                            <td class="text-center">${item.cthWkTel}</td>--%>

                        </tr>
                    </c:forEach>
                    </tbody>
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
    $(() => {

        let allChkStatus ="${searchValue.ordType}";

        if(allChkStatus == "" )  {
            $("#ex_chk_all_status").click();
        }

        $("#ex_chk_all_status").click(function () {
            $(".ordType").prop('checked', this.checked);
        });
셀
        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
            responsive: true,
            dom: '<"row"<"col-sm-5"l B><"col-sm-7"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                /*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*/
                /*   { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
                { extend: 'excel',text: '&nbsp; 엑셀 다운로드', className: 'btn-sm fa fa-file-excel' },
                /*    { extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
            ],
        });

        $("#testTable_filter").text("");
        $("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');

        $(document).on("click", ".detailRow", function () {
            let ordNo = $(this).attr("ordNo");
            location.href = "${path}/washing/order/detail?ordNo=" + ordNo;
        });


        let date = new Date();
        let date2 = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";
        var yesterday = new Date(date2.setDate(date2.getDate() - 1));

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', yesterday);
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

        /*date.setMonth(date.getMonth() + 1, 1);*/
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"

        });
        if(endDate == ""){
            $(".endDate").datepicker('setDate', date);
        } else {
            $(".endDate").datepicker('setDate', endDate);
        }


    });

    function searchFormFunction() {
        var ordTypeValues = "";
        $(".ordType:checked").each(function () {
            if (ordTypeValues == "") {
                ordTypeValues = $(this).val();
            } else {
                ordTypeValues = ordTypeValues + "," + $(this).val();
            }
        });
        $("input[name=ordType]").val(ordTypeValues);


        let pleaseselectastore = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("날짜범위는 최대 31일까지 가능합니다.")
            e.preventDefault();
            e.stopPropagation();
        } else {
            $("#frmSearch").submit();
        }
    }
</script>
</body>
</html>
