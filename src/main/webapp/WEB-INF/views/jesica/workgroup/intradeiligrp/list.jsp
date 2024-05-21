<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 배송그룹 내그룹</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1" text="default text"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main1.sub8" text="default text"/></li>
                </ol>
                <h3 class="rix-title">배송그룹 내그룹<%--<spring:message code="merchandise.title" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 wide">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>업무그룹<%--<spring:message code="merchandise.search1" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <button class="btn-box-r bgGray p-5 width-100 line-height-25" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>업무그룹<%--<spring:message code="merchandise.search1" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <button class="btn-box-r bgGray p-5 width-100 line-height-25" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xl-4 col-lg-6">
                        <div class="panel panel-inverse border">
                            <div class="panel-heading">
                                <h4 class="panel-title text-center">수주그룹<%--<spring:message code="multifr.listaffiliates" text="default text"/>--%></h4>
                            </div>
                            <div class="list-group panel-body p-0">
                                <div class="list-group-item  d-flex border-top-0">
                                    <div class="flex-fill">
                                        <div class="f-s-13 f-w-600 text-inverse">
                                            <select class="form-control col-sm-4 height-30">
                                                <%--<option><spring:message code="multifr.listaffiliates.option1" text="default text"/></option>
                                                <option><spring:message code="multifr.listaffiliates.option2" text="default text"/></option>--%>
                                                <option>그룹명칭</option>
                                                <option>관리총판명칭</option>
                                            </select>
                                            <input type="text" class="form-control col-sm-8 align-top width-200 height-30">
                                        </div>
                                    </div>
                                </div>
                                <div class="height-250 overflow-auto">
                                    <form>
                                        <c:forEach begin="1" end="10" varStatus="idx">
                                            <label class="d-block">
                                                <div class="list-group-item list-group-item-action d-flex">
                                                    <span>
                                                        <input type="radio" class="align-middle m-r-5" name="test1">
                                                    </span>
                                                    <label>[112${idx.index}] / 테스트_배송그룹</label>
                                                </div>
                                            </label>
                                        </c:forEach>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6">
                        <div class="panel panel-inverse border">
                            <div class="panel-heading">
                                <h4 class="panel-title text-center">공유적용한 발주 그룹<%--<spring:message code="multifr.listaffiliates" text="default text"/>--%></h4>
                            </div>
                            <div class="list-group panel-body p-0">
                                <div class="list-group-item height-50">
                                    <label class="font-size-10 m-r-5 m-t-5">
                                        <input type="checkbox" class="align-bottom"><spring:message code="multifr.selectall" text="default text"/>
                                    </label>
                                    <label class="float-right">
                                        내그룹<br>보이기
                                    </label>
                                </div>
                                <div class="height-250 overflow-auto">
                                    <form>
                                        <c:forEach begin="1" end="10" varStatus="idx">
                                            <label class="d-block">
                                                <div class="list-group-item list-group-item-action">
                                                    <label>
                                                        <input type="checkbox" class="align-middle m-r-5" name="test2">[112${idx.index}] / 테스트_수주그룹
                                                    </label>
                                                    <input type="checkbox" class="align-middle float-right m-r-5" name="test3">
                                                </div>
                                            </label>
                                        </c:forEach>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <button class="btn btn-primary float-right"><i class="fa fa-check m-r-5"></i>수정</button>
                </div>
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
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
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
            location.href = "${path}/merchant/merchandise/insert";
        });

        $(".detailRow").click(function() {
            location.href = "${path}/merchant/merchandise/detail";
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
