<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 기본통계</title>
    <%@include file="../../../common/include_head.jsp" %>
    <style>
        #test11 {display: none;}
        #test12 {display: none;}
        #test13 {display: none;}
        #test14 {display: none;}
        #test21 {display: none;}
        #test22 {display: none;}
        #test23 {display: none;}
        #test24 {display: none;}
    </style>
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
                    <li class="breadcrumb-item active"><spring:message code="side.main4.sub1" text="default text"/></li>
                </ol>
                <h3 class="rix-title">기본통계<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod1" text="기간"/><%--등록기간--%></strong></td>
                                            <td style="width:50%">
                                                <label>
                                                    <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                </label>
                                                <label>
                                                    <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                                <select class="form-control width-100" name="storeNo">
                                                    <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>최근 1주일</option>
                                                    <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>최근 1개월</option>
                                                    <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>최근 3개월</option>
                                                    <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>최근 6개월</option>
                                                    <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>최근 1년</option>
                                                </select>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.stateofuse1" text="주문타입"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control dataStatus" name="dataStatus">
                                                        <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>전체</option>
                                                        <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>인수대행</option>
                                                        <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>반냅대행</option>
                                                    </select>
                                                </label>
                                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search1" text="조회"/><%--검색--%> </button>
                                                            <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                                    </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
          <%--  <div class="panel-body">
                <div class="row">
                    <!-- begin col-3 -->
                    <div class="col-xl-6 col-md-6">
                        <canvas id="myChart" style="width:100%;"></canvas>
                    </div>
                    <div class="col-xl-6 col-md-6 ">
                        <canvas id="myChart2" style="width:100%;"></canvas>
                    </div>
                </div>
            </div>--%>
            <div class="panel-body" style="height: 430px;">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th>시간대</th>
                        <th>완료콜수</th>
                        <th>주문금액</th>
                        <th>할인금액</th>
                        <th>결제금액</th>
                        <th>비율(%)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="text-center">
                        <td></td>
                        <td>55</td>
                        <td>55</td>
                        <td>55</td>
                        <td>550000</td>
                        <td>55</td>
                    </tr>
                    <c:forEach begin="1" end="10" varStatus="idx">
                        <tr class="text-center">
                            <td>2020-12-05 ~ 2021-01-05</td>
                            <td>${idx.index}</td>
                            <td>${idx.index}</td>
                            <td>${idx.index}</td>
                            <td>${idx.index}0000</td>
                            <td>${idx.index}</td>
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

<script src="${path}/assets/plugins/chart.js/dist/Chart.min.js"></script>
<%--modal search end--%>

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



        $(".detailRow").click(function() {
            location.href = "${path}/settlement/mannashopgrp/detail";
        });

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });

    });


</script>
</body>
</html>
