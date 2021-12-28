<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 안심번호관리 </title>
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
                    <li class="breadcrumb-item">안신번호관리</li>
                    <li class="breadcrumb-item active">안심번호관리</li>
                </ol>
                <h3 class="rix-title">
                    안심번호관리
                </h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <input type="hidden" name="insertDate" value="insertDate">
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
                                               <%-- <td class="bg-light" style="width:10%">
                                                    <strong><spring:message code="list.search.brand" text="브랜드"/>&lt;%&ndash;가맹점선택&ndash;%&gt;</strong>
                                                </td>
                                                <td style="width:30%">

                                                </td>--%>
                                                <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                                <td style="width:90%;" colspan="3">
                                                    <label>
                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                    </label>
                                                    <label>
                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light" style="width:20%;"><strong>사용여부</strong></td>
                                                <td style="width:30%;">
                                                    <div class="row">
                                                    </div>
                                                    <label>
                                                        <select class="form-control dataStatus" name="dataStatus">
                                                            <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                            <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>><spring:message code="list.search.111" text="사용중"/></option>
                                                            <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>><spring:message code="list.search.111" text="미사용"/></option>
                                                        </select>
                                                    </label>
                                                </td>
                                                <td class="bg-light" ><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                                <td>
                                                    <label>
                                                        <select class="form-control">
                                                            <option>안심번호</option>
                                                        </select>
                                                    </label>
                                                    <label>
                                                        <input type="text" name="safenNum" value="${searchValue.safenNum}" class="form-control width-150" maxlength="50">
                                                    </label>
                                                    <label>
                                                        <span class="btn-group  bg-black-transparent-2 rounded">
                                                            <a href="${path}/system/number/list?dataStatus=&safenNum=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                                <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                            </a>
                                                        </span>
                                                    </label>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div class="col-xl-12 col-md-12 m-t-10">
                                        <div class="">
                                            <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                    <thead>
                      <%--  <th class="text-center" width="3%;">
                            <input type="checkbox" name="checked_all" id="select0" class="d-none">
                            <label for="select0" class="input-label "> <i class="fa fa-square check_all_i"></i></label>
                        </th>--%>
                        <th class="text-center" width="3%;"><spring:message code="list.word.no" text="순번"/></th>
                        <th class="text-center" width="6%;">안심번호</th>
                        <th class="text-center" width="5%;">상태</th>
                        <th class="text-center" width="5%;">렌터카일련번호</th>
                        <th class="text-center" width="8%;">매핑여부</th>
                        <th class="text-center" width="10%;">매핑전화번호</th>
                        <th class="text-center" width="10%;">매핑 시작일</th>
                        <th class="text-center" width="10%;">매핑 종료일</th>
                        <th class="text-center" width="8%;">등록일</th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${tbSafenMapping}" varStatus="status">
                        <tr class="detailRow"
                            safenNum="${item.safenNum}"
                            data-target="#attach_list">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-center">${item.safenNum}</td>
                            <td class="text-center">
                                <c:if test="${item.dataStatus == 'OK'}"><spring:message code="list.word.3" text="정상"/></c:if>
                                <c:if test="${item.dataStatus == 'STOP'}"><spring:message code="list.word.3" text="정지"/></c:if>
                                <c:if test="${item.dataStatus == 'DELETE'}"><spring:message code="list.word.3" text="삭제"/></c:if>
                            </td>
                            <td class="text-center">${item.rentalCarNo}</td>
                            <td class="text-center">${item.mappingYn}</td>
                            <td class="text-center">${item.mappingNum}</td>
                            <td class="text-center"><javatime:format value="${item.startDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.endDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
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

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    $(() => {
        //기사가입신청 리스트
        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });

       $(document).on("click",".detailRow",function(){
          let safenNum = $(this).attr("safenNum");
            location.href="${path}/system/number/detail?safenNum="+safenNum;
        });

        let date = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', '2020-01-01');
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



</script>
</body>
</html>
