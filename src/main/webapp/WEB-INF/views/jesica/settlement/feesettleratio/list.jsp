<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 수수료 정산비율</title>
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
                    <li class="breadcrumb-item active"><spring:message code="side.main3.sub2" text="default text"/></li>
                </ol>
                <h3 class="rix-title">수수료 정산비율<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
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
                                            <td class="bg-light"><strong>업무그룹 선택</strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control width-100 background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control width-100 background-white" readonly>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong>수수료 대상</strong></td>
                                            <td class="checkbox-font-size">
                                                <label class="font-size-10">
                                                    <input type="checkbox" class="align-bottom" name="status1">MCS_월정액
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">주문웹_월정액
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">주문웹_공유수수료
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">설치비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">프린터_리스비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">키폰_리스비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">CID_리스비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status1">기타장비_리스비
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
                                            <td class="bg-light"><strong>업무그룹 선택</strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control width-100 background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control width-100 background-white" readonly>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>수수료 대상</strong></td>
                                            <td class="checkbox-font-size">
                                                <label class="font-size-10">
                                                    <input type="checkbox" class="align-bottom" name="status2">MCS_월정액
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">주문웹_월정액
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">주문웹_공유수수료
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">설치비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">프린터_리스비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">키폰_리스비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">CID_리스비
                                                </label>
                                                <label class="font-size-10 m-l-5">
                                                    <input type="checkbox" class="align-bottom" name="status2">기타장비_리스비
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body m-t-10">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th></th>
                            <th>제휴본사</th>
                            <th>총판</th>
                            <th>수수료대상</th>
                            <th>수정ID</th>
                            <th>수정일시</th>
                            <th>제휴본사 비율</th>
                            <th>총판 비율</th>
                            <th>플랫폼사 비율</th>
                            <th>영업총판 비율</th>
                            <th>수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="10" varStatus="idx">
                            <tr class="text-center">
                                <td>${idx.index}</td>
                                <td>외부연동-POS</td>
                                <td>1234123</td>
                                <td>MCS_월정액</td>
                                <td>admin</td>
                                <td>2020-06-12 11:42</td>
                                <td>
                                    <input type="text" class="form-control height-30 text-right">%
                                </td>
                                <td><input type="text" class="form-control height-30 text-right">%</td>
                                <td><input type="text" class="form-control height-30 text-right">%</td>
                                <td><input type="text" class="form-control height-30 text-right">%</td>
                                <td><button type="button" class="btn-box-r background-white"><i class="fa fa-pencil-alt"></i> 수정</button> </td>
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
        $("#testTable").dataTable();

        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownWide").hide();
                $(".detailOptionBtnUpWide").show();
                /*$(".arrow-down-wide").show();
                $(".arrow-up-wide").hide();*/
            } else {
                $(".detailOptionBtnDownWide").show();
                $(".detailOptionBtnUpWide").hide();
                /*$(".arrow-down-wide").hide();
                $(".arrow-up-wide").show();*/
            }
        });

        $(".detailOptionBtn2").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
                /*$(".arrow-down-narrow").show();
                $(".arrow-up-narrow").hide();*/
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
                /*$(".arrow-down-narrow").hide();
                $(".arrow-up-narrow").show();*/
            }
        });

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

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
