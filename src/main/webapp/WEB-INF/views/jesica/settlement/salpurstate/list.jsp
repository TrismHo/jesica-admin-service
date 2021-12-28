<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 매출매입계산서</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main3" text="default text"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main3.sub1" text="default text"/></li>
                </ol>
                <h3 class="rix-title">매출매입계산서<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>기간</strong></td>
                                            <td>
                                                <label>
                                                    <c:set var="now" value="<%=new java.util.Date()%>" />
                                                    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
                                                    <select class="form-control width-80" id="startYear">
                                                        <c:forEach var="i" begin="${sysYear - 10}" end="${sysYear}" step="1">
                                                            <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}년</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select class="form-control width-80" name="startMonth">
                                                        <c:forEach var="i" begin="1" end="12" step="1" >
                                                            <option value="<fmt:formatNumber value="${i}" minIntegerDigits="2"/>" <c:if test="${i == now.month + 1}">selected</c:if> > ${i} 월</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-download">&nbsp;매출계산서(상세) 엑셀다운<%--<spring:message code="merchandise.registerbutton" text="default text"/>--%></span>
                                    </button>
                                    <button type="button" class="excel_form_btn btn btn-primary float-left m-l-5 m-b-10">
                                        <span class="fa fa-download">&nbsp;매입계산서(상세) 엑셀다운<%--<spring:message code="merchandise.registerbutton" text="default text"/>--%></span>
                                    </button>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="1" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th colspan="12">2021년 1월 매출 계산서 합계</th>
                            <th colspan="2">참고</th>
                        </tr>
                        <tr class="text-center">
                            <th>MCS 플랫폼 사용료</th>
                            <th>만나샵 플랫폼 사용료</th>
                            <th>주문웹 중개 수수료</th>
                            <th>배달대행 플랫폼 사용료</th>
                            <th>설치비</th>
                            <th>리스비</th>
                            <th>배달대행료</th>
                            <th>건당 관리비</th>
                            <th>부르심플랫폼 사용료</th>
                            <th>선결제 수수료</th>
                            <th>기타</th>
                            <th>합계</th>
                            <th>현금영수증(봉사료)</th>
                            <th>현금영수증(수수료)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-center">
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </tbody>
                </table>
                <hr class="m-t-30 m-b-30">
                <table id="2" class="display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th colspan="12">2021년 1월 매입 계산서 합계</th>
                        <th colspan="2">참고</th>
                    </tr>
                    <tr class="text-center">
                        <th>MCS 플랫폼 사용료</th>
                        <th>만나샵 플랫폼 사용료</th>
                        <th>주문웹 중개 수수료</th>
                        <th>배달대행 플랫폼 사용료</th>
                        <th>설치비 수수료</th>
                        <th>리스비 수수료</th>
                        <th>배달대행료 수수료</th>
                        <th>건당 관리비</th>
                        <th>부르심플랫폼 수수료</th>
                        <th>기타</th>
                        <th colspan="2">합계</th>
                        <th>배송원 근로소득</th>
                        <th>선결제 정산합계</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="text-center">
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td colspan="2">0</td>
                        <td>0</td>
                        <td>0</td>
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

<%--modal add start--%>
<%--<div class="modal fade" id="searchOption_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="searchOption.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    $(() => {
        $(".insert_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/insert";
        });

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });

        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
    });
</script>
</body>
</html>
