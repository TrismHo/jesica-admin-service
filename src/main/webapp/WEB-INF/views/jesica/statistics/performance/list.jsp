<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 실적</title>
    <%@include file="../../../common/include_head.jsp" %>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main4" text="default text"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main4.sub6" text="default text"/></li>
                </ol>
                <h3 class="rix-title">실적<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 wide">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>기간선택<%--<spring:message code="merchandise.search8" text="default text"/>--%><%--등록기간--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>기간전체</option>
                                                    <option>일별</option>
                                                    <option>월별</option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                            ~
                                            <label>
                                                <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong>관리자아이디<%--<spring:message code="merchandise.search9" text="default text"/>--%><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>admin1</option>
                                                    <option>admin2</option>
                                                    <option>admin3</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>기간선택<%--<spring:message code="merchandise.search8" text="default text"/>--%><%--등록기간--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>기간전체</option>
                                                    <option>일별</option>
                                                    <option>월별</option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                            ~
                                            <label>
                                                <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>관리자아이디<%--<spring:message code="merchandise.search9" text="default text"/>--%><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>admin1</option>
                                                    <option>admin2</option>
                                                    <option>admin3</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button class="btn-box-r bgGray float-right width-100 p-5">
                                        <i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th>순번</th>
                            <th>기간</th>
                            <th>등록자ID</th>
                            <th>사용자명</th>
                            <th>밴등록갯수(준비중)</th>
                            <th>가맹점실명인증건수</th>
                            <th>배송원실명인증건수</th>
                            <th>가맹점등록건수</th>
                            <th>CS문의접수건수</th>
                            <th>제휴본사등록갯수</th>
                            <th>총판등록갯수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-center">
                            <td>1</td>
                            <td>2020-12-05 ~ 2021-01-05</td>
                            <td>admin1</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
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
        $("#testTable").DataTable();

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });
    });
</script>
</body>
</html>
