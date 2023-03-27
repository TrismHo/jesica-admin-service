<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=별device-width,initial-scale=1">
    <title>Jesicar | 회원통계</title>
    <%@include file="../../../common/include_head.jsp" %>
    <style>
        .buttons-csv {
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-csv:hover {
            color: #ddd;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-copy {
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-copy:hover {
            color: #ddd;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-excel {
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-excel:hover {
            color: #ddd;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-print {
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .buttons-print:hover {
            color: #ddd;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
            display: block;
        }
        .dataTables_wrapper.dt-bootstrap4 .dataTables_filter label .form-control {
            /* display: block; */
            /* margin-left: 8px; */
            /* width: 260px; */
            /* height: 34px; */
            width: 150px;
            height: 23px;
            border: 1px solid #ddd;
        }
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
                    <li class="breadcrumb-item active"><spring:message code="side.main4.sub1" text="회원통계"/></li>
                </ol>
                <h3 class="rix-title">회원통계<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
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
                                                <label>
                                                    <select class="form-control" name="paltform" style="margin-right: 30px;" >
                                                        <option value="">전체</option>
                                                        <option value="jesicar">제시카</option>
                                                        <option value="anion">양파오더</option>
                                                        <option value="none">비플랫폼</option>
                                                    </select>
                                                </label>
                                                <label >
                                                    <div class="btn-group ">
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '30' || searchValue.selday == '' || searchValue.selday == null}">active</c:if>"   day="30" href="javascript:;">최근 1개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '180'}">active</c:if>" day="180"  href="javascript:;">최근 6개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '360'}">active</c:if>" day="360" href="javascript:;">최근 1년 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '720'}">active</c:if>" day="720"  href="javascript:;">최근 2년 </a>
                                                    </div>
                                                </label>
                                                <input type="hidden" class="selday"  name="selday" value="${searchValue.selday}">
                                          </td>
                                            <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod1" text="플랫폼"/><%--등록기간--%></strong></td>
                                            <td style="width:50%">
                                                <label>
                                                    <select class="form-control" name="platform" style="margin-right: 30px;" >
                                                        <option value="" <c:if test="${searchValue.platform == ''}">selected</c:if>>전체</option>
                                                        <option value="1" <c:if test="${searchValue.platform == '1'}">selected</c:if>>제시카</option>
                                                        <option value="2" <c:if test="${searchValue.platform == '2'}">selected</c:if>>양파오더</option>
                                                        <option value="0" <c:if test="${searchValue.platform == '0'}">selected</c:if>>비플랫폼</option>
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
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th rowspan="2">날짜</th>
                        <th rowspan="2">요일</th>
                        <th colspan="10">회원통계</th>
                    </tr>
                    <tr class="text-center">
                        <th>회원가입수</th>
                        <th>Android</th>
                        <th>%</th>
                        <th>ios</th>
                        <th>%</th>
                        <th>남성회원</th>
                        <th>%</th>
                        <th>여성회원</th>
                        <th>%</th>
                        <%--<th>제시카</th>
                        <th>%</th>
                        <th>양파오더</th>
                        <th>%</th>
                        <th>비플랫폼</th>
                        <th>%</th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${timeList}" varStatus="status">
                        <tr class="text-center">
                            <td>${item.yyyymmdd}</td>
                            <td>
                                <c:if test="${item.dw == 1}">일요일</c:if>
                                <c:if test="${item.dw == 2}">월요일</c:if>
                                <c:if test="${item.dw == 3}">화요일</c:if>
                                <c:if test="${item.dw == 4}">수요일</c:if>
                                <c:if test="${item.dw == 5}">목요일</c:if>
                                <c:if test="${item.dw == 6}">금요일</c:if>
                                <c:if test="${item.dw == 7}">토요일</c:if>
                            </td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.totalCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.androidCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.androidPer}"/> %</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.iosCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.iosPer}"/> %</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.maleCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.malePer}"/> %</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.femaleCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.femalePer}"/> %</td>
                            <%--<td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.platformJesicarCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.platformJesicarPer}"/> %</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.platformAnionCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.platformAnionPer}"/> %</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.platformNoneCnt}"/> 명</td>
                            <td><fmt:formatNumber type="number"  pattern="###,###,###,###,###,###" value="${item.platformNonePer}"/> %</td>--%>
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

        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
            responsive: true,
            dom: '<"row"<"col-sm-5"l B><"col-sm-7"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                /*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*/
                /* { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
                { extend: 'excel',text: ' &nbsp; 엑셀 다운로드', className: 'btn-sm fa fa-file-excel' },
                /*{ extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
            ],
            bPaginate : false,
        });

        $("#testTable_filter").text("");
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
        let yesterDay = new Date();
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth - day);
        yesterDay.setDate(yesterDay - 1);
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
            $(".endDate").datepicker('setDate', yesterDay);
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
