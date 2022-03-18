<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 콜수별</title>
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
                <h3 class="rix-title">콜수별<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
           <%-- <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 wide">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>범위대상&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;&lt;%&ndash;가맹점선택&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select id="test1" class="form-control">
                                                    <option value="1">전체</option>
                                                    <option value="2">브랜드</option>
                                                    <option value="3">관리센터</option>
                                                    <option value="4">제휴본사</option>
                                                    <option value="5">총판</option>
                                                </select>
                                            </label>
                                            <label id="test11">
                                                <select class="form-control">
                                                    <option>전체</option>
                                                    <option>만나(기본값)</option>
                                                    <option>공유다</option>
                                                    <option>Run</option>
                                                    <option>이어드림</option>
                                                    <option>날라가</option>
                                                    <option>로드파일럿</option>
                                                    <option>윈윈파트너</option>
                                                    <option>제트콜</option>
                                                </select>
                                            </label>
                                            <label id="test12">
                                                <select class="form-control">
                                                    <option>전체</option>
                                                    <option>만나(기본값)</option>
                                                    <option>공유다</option>
                                                    <option>Run</option>
                                                    <option>이어드림</option>
                                                    <option>날라가</option>
                                                    <option>로드파일럿</option>
                                                    <option>윈윈파트너</option>
                                                    <option>제트콜</option>
                                                </select>
                                            </label>
                                            <label id="test13">
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white" readonly>
                                            </label>
                                            <label id="test14">
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>&lt;%&ndash;총판선택&ndash;%&gt;" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong>기간선택&lt;%&ndash;<spring:message code="merchandise.search8" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
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
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>제휴본사명&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option>총판명&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" class="form-control width-150">
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
                                        <td class="bg-light"><strong>범위대상&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;&lt;%&ndash;가맹점선택&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select id="test2" class="form-control">
                                                    <option value="1">전체</option>
                                                    <option value="2">브랜드</option>
                                                    <option value="3">관리센터</option>
                                                    <option value="4">제휴본사</option>
                                                    <option value="5">총판</option>
                                                </select>
                                            </label>
                                            <label id="test21">
                                                <select class="form-control">
                                                    <option>전체</option>
                                                    <option>만나(기본값)</option>
                                                    <option>공유다</option>
                                                    <option>Run</option>
                                                    <option>이어드림</option>
                                                    <option>날라가</option>
                                                    <option>로드파일럿</option>
                                                    <option>윈윈파트너</option>
                                                    <option>제트콜</option>
                                                </select>
                                            </label>
                                            <label id="test22">
                                                <select class="form-control">
                                                    <option>전체</option>
                                                    <option>만나(기본값)</option>
                                                    <option>공유다</option>
                                                    <option>Run</option>
                                                    <option>이어드림</option>
                                                    <option>날라가</option>
                                                    <option>로드파일럿</option>
                                                    <option>윈윈파트너</option>
                                                    <option>제트콜</option>
                                                </select>
                                            </label>
                                            <label id="test23">
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white" readonly>
                                            </label>
                                            <label id="test24">
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>&lt;%&ndash;총판선택&ndash;%&gt;" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search8" text="default text"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
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
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>제휴본사명&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option>총판명&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" class="form-control width-150">
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
                                    <button class="btn-box-r bgGray float-left m-r-10 p-5" type="button" data-toggle="modal" data-target="#add_modal">
                                        <i class="fa fa-download"></i> 엑셀저장(전체)&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;
                                    </button>
                                    <button class="btn-box-r bgGray float-left m-r-10 p-5" type="button" data-toggle="modal" data-target="#add_modal">
                                        <i class="fa fa-download"></i> 엑셀저장(가맹점)&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>--%>
            <div class="panel-body">
                <div class="row">
                    <!-- begin col-3 -->
                    <div class="col-xl-6 col-md-6">
                        <canvas id="myChart" style="width:100%;"></canvas>
                    </div>
                    <div class="col-xl-6 col-md-6 ">
                        <canvas id="myChart2" style="width:100%;"></canvas>
                    </div>
                </div>
            </div>
            <div class="panel-body" style="height: 430px;">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th>기간</th>
                        <th>공유 배송 그룹 개수</th>
                        <th>발주 완료 건수</th>
                        <th>배달대행 수행 완료 건수</th>
                        <th>배달대행 배달대행료</th>
                        <th>자체 배송 완료 건수</th>
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
<%--modal search start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
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
        $("#test1").on("change", function() {
            if(this.value == '1') {
                $("#test11").hide();
                $("#test12").hide();
                $("#test13").hide();
                $("#test14").hide();
            } else if(this.value == '2') {
                $("#test11").show();
                $("#test12").hide();
                $("#test13").hide();
                $("#test14").hide();
            } else if(this.value == '3') {
                $("#test11").show();
                $("#test12").show();
                $("#test13").hide();
                $("#test14").hide();
            } else if(this.value == '4') {
                $("#test11").show();
                $("#test12").show();
                $("#test13").show();
                $("#test14").hide();
            } else if(this.value == '5') {
                $("#test11").show();
                $("#test12").show();
                $("#test13").show();
                $("#test14").show();
            }
        });


        $("#test2").on("change", function() {
            if(this.value == '1') {
                $("#test21").hide();
                $("#test22").hide();
                $("#test23").hide();
                $("#test24").hide();
            } else if(this.value == '2') {
                $("#test21").show();
                $("#test22").hide();
                $("#test23").hide();
                $("#test24").hide();
            } else if(this.value == '3') {
                $("#test21").show();
                $("#test22").show();
                $("#test23").hide();
                $("#test24").hide();
            } else if(this.value == '4') {
                $("#test21").show();
                $("#test22").show();
                $("#test23").show();
                $("#test24").hide();
            } else if(this.value == '5') {
                $("#test21").show();
                $("#test22").show();
                $("#test23").show();
                $("#test24").show();
            }
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

        var context = document
            .getElementById('myChart')
            .getContext('2d');
        var myChart = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1','2','3','4','5','6','7'
                ],
                datasets: [
                    { //데이터
                        label: 'test1', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //경계선 굵기
                    }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });

        var context2 = document
            .getElementById('myChart2')
            .getContext('2d');
        var myChart2 = new Chart(context2, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1','2','3','4','5','6','7'
                ],
                datasets: [
                    { //데이터
                        label: 'test1', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //경계선 굵기
                    }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                ]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
    });


</script>
</body>
</html>
