<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 입출금 로그 </title>
</head>
<style>
    .modal_img {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 10000; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content_img {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
    }
    @media (max-width:1920px) {
        .modal-content {
            width: 100%;
        }
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
    table#testTable td, table#testTable th {
        cursor: auto;
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
                    <li class="breadcrumb-item">정산</li>
                    <li class="breadcrumb-item active">입출금 로그</li>
                </ol>
                <h3 class="rix-title">
                    입출금 로그
                </h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <style>
                                .form-control-test {
                                    width: 100%;
                                    height: 30px;
                                    font-size: 11px;
                                    display: inline;
                                    border-radius: 0px;
                                    border: 1px solid #d5dbe0;;
                                }
                            </style>
                            <div class="col-xl-12 col-md-12">
                                <form class="brand_search_form"></form>
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light" width="10%;" ><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                        <td colspan="1" width="40%;">
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        <td class="bg-light" width="10%;"><strong>사용자타입</strong></td>
                                        <td colspan="3" width="40%;">
                                                <label>
                                                    <select class="form-control groupType" name="groupType">
                                                        <%--<option value="" <c:if test="${searchValue.groupType == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>--%>
                                                        <option value="1" <c:if test="${searchValue.groupType == '1'}">selected</c:if>><spring:message code="list.search.all" text="제휴본사"/></option>
                                                        <option value="2" <c:if test="${searchValue.groupType == '2'}">selected</c:if>><spring:message code="list.search.1" text="총판"/></option>
                                                        <option value="3" <c:if test="${searchValue.groupType == '3'}">selected</c:if>><spring:message code="list.search.1" text="가맹점"/></option>
                                                        <option value="4" <c:if test="${searchValue.groupType == '4'}">selected</c:if>><spring:message code="list.search.1" text="배송원"/></option>
                                                    </select>
                                                </label>
                                                <input name="headNo" class="headNo" type="hidden" value="${searchValue.headNo}">
                                                <input name="branchNo" class="branchNo" type="hidden" value="${searchValue.branchNo}">
                                                <input name="storeNo" class="storeNo" type="hidden" value="${searchValue.storeNo}">
                                                <input name="workerNo" class="workerNo"  type="hidden" value="${searchValue.workerNo}">
                                                <input name="groupName" class="groupName"  type="hidden" value="${searchValue.groupName}">
                                                <a class="btn btn-info m-l-5 searchCashLogGroupType" type="button" href=""  >대상선택</a>
                                                <b class="settleName" style="bottom: 0px;" >${searchValue.groupName}</b>
                                            </td>
                                       <%-- <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>고객명/핸드폰번호</option>
                                                </select>
                                            </label>
                                            <label>
                                                <div id="testTable_filter" class="dataTables_filter"><label>검색 : <input type="search" class="" placeholder="" aria-controls="testTable"></label></div>
                                                <input type="text" name="custTel" value="${searchValue.custTel}" class="form-control width-150" maxlength="50">
                                            </label>
                                            <label>
                                                <span class="btn-group  bg-black-transparent-2 rounded">
                                                    <a href="/settlement/cashlog/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                        <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                    </a>
                                                </span>
                                            </label>
                                        </td>--%>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                    <thead>
                    <%--  <th class="text-center" width="3%;">
                          <input type="checkbox" name="checked_all" id="select0" class="d-none">
                          <label for="select0" class="input-label "> <i class="fa fa-square check_all_i"></i></label>
                      </th>--%>
                    <th class="text-center" width="3%;"><spring:message code="list.word.no" text="순번"/></th>

                    <th class="text-center" width="5%;">그룹명</th>
                    <th class="text-center" width="5%;">번호</th>
                    <th class="text-center" width="5%;">입출금액</th>
                    <th class="text-center" width="5%;">잔액</th>
                    <th class="text-center" width="5%;">이체그룹</th>
                    <th class="text-center" width="5%;">주문번호</th>
                    <th class="text-center" width="8%;">메모</th>
                    <th class="text-center" width="5%;">등록자</th>
                    <th class="text-center" width="6%;">등록일</th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${tbCustCashLog}" varStatus="status">
                        <c:choose>
                            <c:when test="${searchValue.groupType == '1'}">
                                <tr>
                                    <td class="text-center">${status.index + 1}</td>
                                    <td class="text-center">${item.head.headName}</td>
                                    <td class="text-center">
                                        <c:if test="${fn:length(item.head.headTel) > 10}">
                                            ${fn:substring(item.head.headTel,0,3)}-${fn:substring(item.head.headTel,3,7)}-${fn:substring(item.head.headTel,7,13)}
                                        </c:if>
                                    </td>
                                    <td class="text-center"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center"><fmt:formatNumber value="${item.balance}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center">
                                        [${item.tranGroupNo}]${item.tranGroupName}
                                    </td>
                                    <td class="text-center">${item.referInfo}</td>
                                    <td class="text-center">${item.memo}</td>
                                    <td class="text-center">${item.insertUserId}</td>
                                    <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:when>
                            <c:when test="${searchValue.groupType == '2'}">
                                <tr>
                                    <td class="text-center">${status.index + 1}</td>
                                    <td class="text-center">${item.branch.branchName}</td>
                                    <td class="text-center">
                                        <c:if test="${fn:length(item.branch.branchTel) > 10}">
                                            ${fn:substring(item.branch.branchTel,0,3)}-${fn:substring(item.branch.branchTel,3,7)}-${fn:substring(item.branch.branchTel,7,13)}
                                        </c:if>
                                    </td>
                                    <td class="text-center"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center"><fmt:formatNumber value="${item.balance}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center">
                                        [${item.tranGroupNo}]${item.tranGroupName}
                                    </td>
                                    <td class="text-center">${item.referInfo}</td>
                                    <td class="text-center">${item.memo}</td>
                                    <td class="text-center">${item.insertUserId}</td>
                                    <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:when>
                            <c:when test="${searchValue.groupType == '3'}">
                                <tr>
                                    <td class="text-center">${status.index + 1}</td>
                                    <td class="text-center">${item.store.storeName}</td>
                                    <td class="text-center">
                                        <c:if test="${fn:length(item.store.storeTel) > 10}">
                                            ${fn:substring(item.store.storeTel,0,3)}-${fn:substring(item.store.storeTel,3,7)}-${fn:substring(item.store.storeTel,7,13)}
                                        </c:if>
                                    </td>
                                    <td class="text-center"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center"><fmt:formatNumber value="${item.balance}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center">
                                        [${item.tranGroupNo}]${item.tranGroupName}
                                    </td>
                                    <td class="text-center">${item.referInfo}</td>
                                    <td class="text-center">${item.memo}</td>
                                    <td class="text-center">${item.insertUserId}</td>
                                    <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:when>
                            <c:when test="${searchValue.groupType == '4'}">
                                <tr>
                                    <td class="text-center">${status.index + 1}</td>
                                    <td class="text-center">${item.worker.name}</td>
                                    <td class="text-center">
                                        <c:if test="${fn:length(item.worker.phone) > 10}">
                                            ${fn:substring(item.worker.phone,0,3)}-${fn:substring(item.worker.phone,3,7)}-${fn:substring(item.worker.phone,7,13)}
                                        </c:if>
                                    </td>
                                    <td class="text-center"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center"><fmt:formatNumber value="${item.balance}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                    <td class="text-center">
                                        [${item.tranGroupNo}]${item.tranGroupName}
                                    </td>
                                    <td class="text-center">${item.referInfo}</td>
                                    <td class="text-center">${item.memo}</td>
                                    <td class="text-center">${item.insertUserId}</td>
                                    <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:when>
                        </c:choose>



                       <%-- <tr class=""
                            logNo="${item.logNo}"
                            data-target="#attach_list">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-center">${item.cust.custName}</td>
                            <td class="text-center" style="mso-number-format:'\@'">
                                <c:if test="${fn:length(item.cust.custTel) > 10}">
                                    ${fn:substring(item.cust.custTel,0,3)}-${fn:substring(item.cust.custTel,3,7)}-${fn:substring(item.cust.custTel,7,13)}
                                </c:if>
                            </td>
                            <td class="text-center"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-center"><fmt:formatNumber value="${item.balance}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-center">${item.referInfo}</td>
                            <td class="text-center">${item.memo}</td>
                            <td class="text-center">${item.insertUserId}</td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>--%>
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

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%--modal add end--%>
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
</div>
<div class="modal fade" id="search_user_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/searchUserLog.jsp" %>
</div>

<%-- Custom JS End--%>
<script>
    $(() => {
        //기사가입신청 리스트
        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
            responsive: true,
            dom: '<"row"<"col-sm-12"l B><"col-sm-7"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                /*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*/
                /*   { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
              { extend: 'excel',text: '&nbsp; 엑셀 다운로드', className: 'btn-sm fa fa-file-excel' },
                /*    { extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
              ],
          });

          $("#testTable_filter").text("");
          $("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchEvent" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');
/*
        $(document).on("click",".detailRow",function(){
            let withdrawNo = $(this).attr("withdrawNo");
            location.href="${path}/settlement/cashwithdraw/detail?withdrawNo="+withdrawNo;
        });*/
        /*$(document).on("change",".groupType",function(){
            $("#frmSearch").submit();
        });*/




      /*  $(document).on("change",".searchSelect",function(){
            var searchVal = $(this).val();
            $(".custName").val("");
            $(".custTel").val("");
            if(searchVal == 1){
                $(".custName").css("display","block");
                $(".custTel").css("display","none");
            } else {
                $(".custName").css("display","none");
                $(".custTel").css("display","block");
            }
        });*/


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
        $(".searchCashLogGroupType").on("click",function(){
            var groupType = $(".groupType option:selected").val();
            window.open("/settlement/cashlog/search/"+groupType, '_blank', 'width=600, height=570'); return false;
        });
       /* $(".searchEvent").on("click",function(){
            let startDate = $(".startDate").val()
            let endDate = $(".endDate").val()
            if(getDateDiff(startDate, endDate) > 31) {
                alert("날짜범위는 최대 31일까지 가능합니다.")
                return false;
            }
        });*/
    });


    function setName(no,selectName) {
        $(".settleName").html(selectName);
        var groupType = $(".groupType option:selected").val();
        $(".groupName").val(selectName);

        switch (groupType) {
            case "1":
                $(".headNo").val(no);
                $(".branchNo").val("");
                $(".storeNo").val("");
                $(".workerNo").val("");
                break;
            case "2":
                $(".headNo").val("");
                $(".branchNo").val(no);
                $(".storeNo").val("");
                $(".workerNo").val("");
                break;
            case "3":
                $(".headNo").val("");
                $(".branchNo").val("");
                $(".storeNo").val(no);
                $(".workerNo").val("");
                break;
            case "4":
                $(".headNo").val("");
                $(".branchNo").val("");
                $(".storeNo").val("");
                $(".workerNo").val(no);
                break;
            default:
        }

    }
    function searchFormFunction() {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if (getDateDiff(startDate, endDate) > 31) {
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
