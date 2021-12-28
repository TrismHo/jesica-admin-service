<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>PetView | 멀티가맹점</title>
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
                    <li class="breadcrumb-item active"><spring:message code="side.main2.sub6" text="default text"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="multifr.title" text="멀티가맹점"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box-bordered">
                        <div class="row">
                            <div class="col-xl-6 col-md-6">
                                <h5 class="m-l-5 m-t-20"><spring:message code="multifr.mainsearch" text="제휴사 선택"/></h5>
                                <table class="table table-condensed table-bordered width-full m-l-5">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="multifr.selectfr" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="multifr.status" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="multifr.status.option1" text="default text"/></option>
                                                        <option><spring:message code="multifr.status.option2" text="default text"/></option>
                                                        <option><spring:message code="multifr.status.option3" text="default text"/></option>
                                                        <option><spring:message code="multifr.status.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="multifr.regidate" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                                ~
                                                <label>
                                                    <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn-box-r bgGray overflowH float-right m-t-5 m-b-5 line-height-25 width-100"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                            </div>
                            <div class="col-xl-6 col-md-6">
                                <h5 class="m-t-20"><spring:message code="multifr.listsearch" text="default text"/></h5>
                                <table class="table table-condensed table-bordered width-full m-r-5">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="multifr.selectfr" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="multifr.status" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="multifr.status.option1" text="default text"/></option>
                                                        <option><spring:message code="multifr.status.option2" text="default text"/></option>
                                                        <option><spring:message code="multifr.status.option3" text="default text"/></option>
                                                        <option><spring:message code="multifr.status.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="multifr.regidate" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                                ~
                                                <label>
                                                    <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn-box-r bgGray overflowH float-right m-t-5 m-b-5 line-height-25 width-100"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!--End Search-->
            <div class="panel-body">
                    <div class="row">
                        <div class="col-xl-4 col-md-4 col-lg-4">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><spring:message code="merchandisecont.merchandisedetail.merchandisedetailthree.setmerchandisegroup" text="메인 가맹점"/><%--설정된 상품그룹--%></h4>
                                </div>
                                <div class="list-group">
                                    <div class="list-group-item border-top-0  p-0">
                                        <li class="navbar-form">
                                            <ol class="breadcrumb float-xl-left">
                                                <div class="d-flex">
                                                    <div class="btn-group">
                                                        <a href="javascript:;" class="btn btn-white btn-white-without-border" >
                                                            <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i>가맹점명 : &nbsp;<input type="text" style="width: 150px;" class="form-control-sm" id="mykeyword" placeholder="검색어를 입력하세요">
                                                            &nbsp;
                                                        </a>
                                                        <div style="margin-bottom: 20px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </ol>
                                        </li>
                                    </div>
                                    <div class="panel panel-inverse m-b-0" data-sortable-id="form-slider-switcher-2">

                                        <!-- begin panel-heading -->
                                        <!-- end panel-heading -->
                                        <!-- begin table -->
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <table id="optionTable" class="table table-condensed table-bordered">
                                                    <thead>
                                                    <tr style="border-top: 1px solid #b8c1ca;">
                                                        <th width="5%" class="bg-light">
                                                            <div class="custom-control custom-checkbox mb-1">
                                                            </div>
                                                        </th>
                                                        <th width="70%;" class="custom-select">옵션명</th>
                                                        <th width="25%;"  ></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="optionList" class="store_option_list">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- end table -->
                                    </div>
                                    <%--  <div class="height-350 overflow-auto">
                                      </div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-4 col-lg-4">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><spring:message code="merchandisecont.merchandisedetail.merchandisedetailthree.setmerchandisegroup" text="종속가맹점"/><%--설정된 상품그룹--%></h4>
                                </div>
                                <div class="list-group panel-body p-0">
                                    <div class="list-group-item border-top-0 p-5">
                                        <li class="navbar-form">
                                            <ol class="breadcrumb float-xl-left">
                                                <div class="d-flex">
                                                    <div class="btn-group">
                                                        <a href="javascript:;" class="btn btn-white btn-white-without-border">
                                                            <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i>옵션그룹
                                                        </a>
                                                    </div>
                                                </div>
                                            </ol>
                                        </li>
                                    </div>
                                    <div class="panel panel-inverse m-b-0" data-sortable-id="form-slider-switcher-2">
                                        <!-- begin panel-heading -->
                                        <!-- end panel-heading -->
                                        <!-- begin table -->
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <ul class="sort_body_list option_mapping_list" style="cursor:pointer;list-style: none;padding-left: 0px;">
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end table -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-4 col-lg-4">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><spring:message code="merchandisecont.merchandisedetail.merchandisedetailthree.setmerchandisegroup" text="가맹점리스트"/><%--설정된 상품그룹--%></h4>
                                </div>
                                <div class="list-group">
                                    <div class="list-group-item border-top-0  p-0">
                                        <li class="navbar-form">
                                            <ol class="breadcrumb float-xl-left">
                                                <div class="d-flex">
                                                    <div class="btn-group">
                                                        <a href="javascript:;" class="btn btn-white btn-white-without-border" >
                                                            <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i>가맹점명 : &nbsp;<input type="text" style="width: 150px;" class="form-control-sm" id="mykeyword" placeholder="검색어를 입력하세요">
                                                            &nbsp;
                                                        </a>
                                                        <div style="margin-bottom: 20px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </ol>
                                        </li>
                                    </div>
                                    <div class="panel panel-inverse m-b-0" data-sortable-id="form-slider-switcher-2">

                                        <!-- begin panel-heading -->
                                        <!-- end panel-heading -->
                                        <!-- begin table -->
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <table id="optionTable" class="table table-condensed table-bordered">
                                                    <thead>
                                                    <tr style="border-top: 1px solid #b8c1ca;">
                                                        <th width="5%" class="bg-light">
                                                            <div class="custom-control custom-checkbox mb-1">
                                                            </div>
                                                        </th>
                                                        <th width="70%;" class="custom-select">옵션명</th>
                                                        <th width="25%;"  ></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="optionList" class="store_option_list">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- end table -->
                                    </div>
                                    <%--  <div class="height-350 overflow-auto">
                                      </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                <div>
                    <button class="btn btn-primary">수정</button>
                </div>
            </div>
        </div>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
    </div>
    <div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../multifranchise/search.jsp" %>
    </div>
</div>
<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
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
            location.href = "${path}/merchant/merchandise/insert";
        });

        $(".detailRow").click(function() {
            location.href = "${path}/merchant/merchandise/detail";
        });

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
    });
</script>
</body>
</html>
