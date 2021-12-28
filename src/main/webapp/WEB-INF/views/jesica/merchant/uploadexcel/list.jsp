<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 상품엑셀업로드</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2" text="default text"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main2.sub5" text="default text"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="side.main2.sub5" text="default text"/></h3>
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
                                            <td class="bg-light"><strong>등록자 소속 선택</strong></td>
                                            <td>
                                                <label>
                                                    <label class="font-size-10 m-r-5">
                                                        <input type="radio" name="status1" class="align-middle" checked><%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>만나관리자
                                                    </label>
                                                    <label class="font-size-10 m-r-5">
                                                        <input type="radio" name="status1" class="align-middle"><%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>소속 선택
                                                    </label>
                                                </label>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><%--<spring:message code="merchandise.search8" text="default text"/>--%>엑셀종류</strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control width-150">
                                                        <%--<option><spring:message code="merchandise.search9.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search9.option2" text="default text"/></option>--%>
                                                        <option>일괄등록(배민양식)</option>
                                                        <option>샹품그룹</option>
                                                        <option>상품</option>
                                                        <option>상품옵션</option>
                                                        <option>추가상품그룹</option>
                                                        <option>추가상품</option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option>등록자ID<%--<spring:message code="merchandise.search9.option1" text="default text"/>--%></option>
                                                        <option>가맹점코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    </select>
                                                    <input type="text" class="form-control" <%--style="width: 200px;"--%>> <%--<i style="padding: 9px;" class="fas fa-lg fa-fw m-r-15 fa-plus-circle detailOptionBtn"></i>--%>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--<i class="fa fa-angle-double-down detailOptionBtnUpWide detailOptionBtn1"></i>
                            <i class="fa fa-angle-double-up detailOptionBtnDownWide detailOptionBtn1"></i>--%>
                            <%--<span class="arrow-down-wide detailOptionBtn1">
                            </span>
                            <span class="arrow-up-wide detailOptionBtn1">
                            </span>--%>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/></strong></td>
                                        <td>
                                            <label>
                                                <label class="font-size-10 m-r-5">
                                                    <input type="radio" name="status2" class="align-middle" checked>만나관리자
                                                </label>
                                                <label class="font-size-10 m-r-5">
                                                    <input type="radio" name="status2" class="align-middle">소속선택
                                                </label>
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>엑셀종류<%--<spring:message code="merchandise.search8" text="default text"/>--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control width-150">
                                                    <%--<option><spring:message code="merchandise.search9.option1" text="default text"/></option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/></option>--%>
                                                    <option>일괄등록(배민양식)</option>
                                                    <option>샹품그룹</option>
                                                    <option>상품</option>
                                                    <option>상품옵션</option>
                                                    <option>추가상품그룹</option>
                                                    <option>추가상품</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <%--<option><spring:message code="merchandise.search9.option1" text="default text"/></option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/></option>--%>
                                                    <option>등록자ID</option>
                                                    <option>가맹점코드</option>
                                                </select>
                                                <input type="text" class="form-control" <%--style="width: 200px;"--%>> <%--<i  class="fas fa-lg fa-fw m-r-15 fa-plus-circle detailOptionBtn"></i>--%>
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button type="button" class="insert_btn btn-box-r bgGray float-left m-b-10 line-height-25 width-100 p-5">
                                        <span class="fa fa-plus">&nbsp;엑셀등록<%--<spring:message code="merchandise.registerbutton" text="default text"/>--%></span>
                                    </button>
                                    <button type="button" class="excel_form_btn btn-box-r bgGray float-left m-l-5 m-b-10 line-height-25 width-100 p-5">
                                        <span class="fa fa-list">&nbsp;엑셀양식<%--<spring:message code="merchandise.registerbutton" text="default text"/>--%></span>
                                    </button>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <%--<th><spring:message code="merchandise.table.column1" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column2" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column3" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column4" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column5" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column6" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column7" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column8" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column9" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column10" text="default text"/></th>
                        <th><spring:message code="merchandise.table.column11" text="default text"/></th>--%>
                        <th>순번</th>
                        <th>등록자 소속</th>
                        <th>등록자ID</th>
                        <th>등록 건수</th>
                        <th>성공 건수</th>
                        <th>업로드 종류</th>
                        <th>등록일</th>
                        <th>처리자ID</th>
                        <th>처리상태</th>
                        <th>처리일</th>
                        <th>처리</th>
                    </thead>
                    <tbody>

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
            location.href = "${path}/merchant/uploadexcel/insert";
        });

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });
    });
</script>
</body>
</html>
