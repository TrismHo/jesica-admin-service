<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 상품복사</title>
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
                    <li class="breadcrumb-item active"><spring:message code="side.main2.sub4" text="default text"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="side.main2.sub4" text="default text"/></h3>
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
                                            <td class="bg-light"><strong><%--<spring:message code="merchandise.search1" text="default text"/>--%>원본 가맹점</strong></td>
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
                                                <label>
                                                    <label class="font-size-10">
                                                        <input type="radio" name="status1" class="align-bottom" checked><spring:message code="merchandise.search1.option4" text="default text"/>
                                                    </label>
                                                    <label class="m-l-5 font-size-10">
                                                        <input type="radio" name="status1" class="align-bottom"><spring:message code="merchandise.search1.option5" text="default text"/>
                                                    </label>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><%--<spring:message code="merchandise.search1" text="default text"/>--%>대상 가맹점</strong></td>
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
                                                <label>
                                                    <label class="font-size-10">
                                                        <input type="radio" name="status2" class="align-bottom" checked><spring:message code="merchandise.search1.option4" text="default text"/>
                                                    </label>
                                                    <label class="m-l-5 font-size-10">
                                                        <input type="radio" name="status2" class="align-bottom"><spring:message code="merchandise.search1.option5" text="default text"/>
                                                    </label>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>상품그룹/추가상품그룹</strong></td>
                                            <td>
                                                <label class="font-size-10">
                                                    <input type="radio" name="status3" class="align-bottom" checked>모두복사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status3" class="align-bottom">상품그룹만<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status3" class="align-bottom">추가상품그룹만<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong>상품상태</strong></td>
                                            <td>
                                                <label class="font-size-10">
                                                    <input type="radio" name="status4" class="align-bottom" checked>원본상품 상태로<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status4" class="align-bottom">정상<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status4" class="align-bottom">정지<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>온라인 판매상태</strong></td>
                                            <td>
                                                <label class="font-size-10">
                                                    <input type="radio" name="status5" class="align-bottom" checked>원본상품 상태로<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status5" class="align-bottom">정상<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status5" class="align-bottom">정지(품절표시)<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status5" class="align-bottom">판매안함<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong>매장 판매상태</strong></td>
                                            <td>
                                                <label class="font-size-10">
                                                    <input type="radio" name="status6" class="align-bottom" checked>원본상품 상태로<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status6" class="align-bottom">정상<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status6" class="align-bottom">정지(품절표시)<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status6" class="align-bottom">판매안함<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--<span class="arrow-down-wide detailOptionBtn1">
                            </span>
                            <span class="arrow-up-wide detailOptionBtn1">
                            </span>--%>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong><%--<spring:message code="merchandise.search1" text="default text"/>--%>원본 가맹점</strong></td>
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
                                            <label>
                                                <label class="font-size-10">
                                                    <input type="radio" name="status7" class="align-bottom" checked><spring:message code="merchandise.search1.option4" text="default text"/>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status7" class="align-bottom"><spring:message code="merchandise.search1.option5" text="default text"/>
                                                </label>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><%--<spring:message code="merchandise.search1" text="default text"/>--%>대상 가맹점</strong></td>
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
                                            <label>
                                                <label class="font-size-10">
                                                    <input type="radio" name="status8" class="align-bottom" checked><spring:message code="merchandise.search1.option4" text="default text"/>
                                                </label>
                                                <label class="m-l-5 font-size-10">
                                                    <input type="radio" name="status8" class="align-bottom"><spring:message code="merchandise.search1.option5" text="default text"/>
                                                </label>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>상품그룹/추가상품그룹</strong></td>
                                        <td>
                                            <label class="font-size-10">
                                                <input type="radio" name="status9" class="align-bottom" checked>모두복사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status9" class="align-bottom">상품그룹만<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status9" class="align-bottom">추가상품그룹만<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>상품상태</strong></td>
                                        <td>
                                            <label class="font-size-10">
                                                <input type="radio" name="status10" class="align-bottom" checked>원본상품 상태로<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status10" class="align-bottom">정상<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status10" class="align-bottom">정지<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>온라인 판매상태</strong></td>
                                        <td>
                                            <label class="font-size-10">
                                                <input type="radio" name="status11" class="align-bottom" checked>원본상품 상태로<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status11" class="align-bottom">정상<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status11" class="align-bottom">정지(품절표시)<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status11" class="align-bottom">판매안함<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>매장 판매상태</strong></td>
                                        <td>
                                            <label class="font-size-10">
                                                <input type="radio" name="status12" class="align-bottom" checked>원본상품 상태로<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status12" class="align-bottom">정상<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status12" class="align-bottom">정지(품절표시)<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                            <label class="m-l-5 font-size-10">
                                                <input type="radio" name="status12" class="align-bottom">판매안함<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%>
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 searchOptionZone">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search2" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search2.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search2.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search2.option3" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search2.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search3" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search3.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search3.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search3.option3" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search4" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search4.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search4.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search4.option3" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search4.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search5" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search5.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search5.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search5.option3" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search6" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search6.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search6.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search6.option3" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search7" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search7.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search7.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search7.option3" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search7.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12">
                                <div class="">
                                    <button class="btn-box-r bgGray float-left m-t-10 line-height-25 width-100 p-5" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-copy grayicon"></i> <spring:message code="side.main2.sub4" text="default text"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
