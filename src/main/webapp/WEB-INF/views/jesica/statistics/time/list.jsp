<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 시간대별 통계</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main4" text="통계"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main4.sub1" text="시간대별 통계"/></li>
                </ol>
                <h3 class="rix-title">시간대별 통계<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
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
                                                <label >
                                                    <div class="btn-group ">
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '7' }">active</c:if>"  day="7" href="javascript:;" >최근 1주일</a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '30' || searchValue.selday == '' || searchValue.selday == null}">active</c:if>"   day="30" href="javascript:;">최근 1개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '90'}">active</c:if>" day="90"   href="javascript:;">최근 3개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '180'}">active</c:if>" day="180"  href="javascript:;">최근 6개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '360'}">active</c:if>" day="360" href="javascript:;">최근 1년 </a>
                                                    </div>
                                                </label>
                                                <input type="hidden" class="selday"  name="selday" value="${searchValue.selday}">
                                            </td>
                                            <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod1" text="요일"/><%--등록기간--%></strong></td>
                                            <td>
                                                <select class="form-control width-80 m-l-20" name="day">
                                                    <option value=""<c:if test="${searchValue.day == ''}">selected</c:if>>전체</option>
                                                    <option value="2"<c:if test="${searchValue.day == '2'}">selected</c:if>>월</option>
                                                    <option value="3"<c:if test="${searchValue.day == '3'}">selected</c:if>>화</option>
                                                    <option value="4"<c:if test="${searchValue.day == '4'}">selected</c:if>>수</option>
                                                    <option value="5"<c:if test="${searchValue.day == '5'}">selected</c:if>>목</option>
                                                    <option value="6"<c:if test="${searchValue.day == '6'}">selected</c:if>>금</option>
                                                    <option value="7"<c:if test="${searchValue.day == '7'}">selected</c:if>>토</option>
                                                    <option value="1"<c:if test="${searchValue.day == '1'}">selected</c:if>>일</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.stateofuse1" text="주문타입"/></strong></td>
                                            <td colspan="3">
                                                <label>
                                                    <select class="form-control orderTypeCode" name="orderTypeCode">
                                                        <option value=""<c:if test="${searchValue.orderTypeCode == ''}">selected</c:if>>전체</option>
                                                        <option value="20"<c:if test="${searchValue.orderTypeCode == '20'}">selected</c:if>>인수대행</option>
                                                        <option value="21"<c:if test="${searchValue.orderTypeCode == '21'}">selected</c:if>>반냅대행</option>
                                                    </select>
                                                </label>
                                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search1" text="조회"/><%--검색--%> </button>
                                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5"></div>
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
            <div class="panel-body" >
                <table id="" class="display table table-bordered w-100 table-striped">
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
                    <c:forEach var="item" items="${timeList}" varStatus="status">
                        <tr class="text-center">
                            <td>
                                <c:if test="${item.dayDate == 22}">
                                    <fmt:formatNumber type="number" minIntegerDigits="2" pattern="###,###,###,###,###,###" value="22" /> 시 ~
                                    <fmt:formatNumber type="number" minIntegerDigits="2" pattern="###,###,###,###,###,###" value="06" /> 시 </td>
                                </c:if>
                                <c:if test="${item.dayDate != 22}">
                                    <fmt:formatNumber type="number" minIntegerDigits="2" pattern="###,###,###,###,###,###" value="${item.dayDate}" /> 시 ~
                                    <fmt:formatNumber type="number" minIntegerDigits="2" pattern="###,###,###,###,###,###" value="${item.dayDate +1}" /> 시 </td>
                                </c:if>

                            <td>${item.cnt} 건</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.orderAmt}"/> 원</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.discountAmt}"/> 원</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.totalAmt}"/> 원</td>
                            <td>${item.per} %</td>
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
        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".select-day").on("click",function(){
            $(".select-day").removeClass("active");
            var day =  $(this).attr("day");

            var d = new Date();
            var dayOfMonth = d.getDate();
            d.setDate(dayOfMonth - day);


            $(".startDate").datepicker('setDate', d);
            $(".selday").val(day);

            $(this).addClass("active");
        });

        $("#testTable").DataTable();

        var day =  $(this).attr("day");
        let date = new Date();
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth - day);
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";



        if(startDate == ""){
            $(".startDate").datepicker('setDate', d);
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

    function lastWeek() {
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth - 7);
        return getDateStr(d);
    }

    function lastMonth() {
        var d = new Date();
        var monthOfYear = d.getMonth();
        d.setMonth(monthOfYear - 1);
        return getDateStr(d);
    }

</script>
</body>
</html>
