<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae | <spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></title>
    </c:if>

</head>
<style>
    .inbox .nav-inbox>li:hover{
        background: #e4e7ea;
        color: #2d353c;
    }
    /*  .content {
          margin-left: 220px;
          padding: 5px 30px;
      }*/
    div.xAxis div.tickLabel
    {
        transform: rotate(-45deg);
        -ms-transform:rotate(-45deg); /* IE 9 */
        -moz-transform:rotate(-45deg); /* Firefox */
        -webkit-transform:rotate(-45deg); /* Safari and Chrome */
        -o-transform:rotate(-45deg); /* Opera */
        /*rotation-point:50% 50%;*/ /* CSS3 */
        /*rotation:270deg;*/ /* CSS3 */
        font-size: 4px;
        white-space:nowrap;
    }
    div.xAxis div.tickLabel {
        font-size: 10px;
        color: #b9bcbe;
    }
    .flot-text .tickLabel {
        color: #b9bcbe;
    }
    .widget-stats .stats-icon, .widget.widget-stats .stats-icon {
        font-size: 42px;
        height: 56px;
        width: 56px;
        text-align: center;
        line-height: 56px;
        color: #ddd;
        position: absolute;
        right: 25px;
        top: 25px;
        margin-left: 15px;
    }
    .widget-list .widget-list-item {
         display: table;
         width: 100%;
         text-decoration: none;
         color: #ccd0d5;
         background-color: #2d353c;
         padding: 3px;
     }
    .widget-list .widget-list-item+.widget-list-item .widget-list-action, .widget-list .widget-list-item+.widget-list-item .widget-list-content {
        border-top: 1px solid #495057;
    }
    .notice-list {
        height: 235px;
        max-height: 235px;
        overflow: auto;
        background-color: #2e353c;
    }
</style>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <%@include file="common/include_header.jsp" %>
    <%@include file="common/include_header_test.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="common/include_sidebar.jsp" %>
    <!-- end #sidebar -->

    <div id="content" class="content" style="background-color: #eee;">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb float-xl-right">
            <li class="breadcrumb-item"><a href="javascript:;">메인</a></li>
            <li class="breadcrumb-item active"><spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header"><spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></h1>

        <div class="m-b-5" style="display: flex">
            <c:if test="${empty appCode}">
                <select id="brandTypeCd" name="brandTypeCd" class="form-control" >
                    <option value="" selected>전체</option>
                 <%--   <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                        <option value="${appCodeList.codeValue}" <c:if test="${searchValue.appCode == appCodeList.sysCode}">selected</c:if>>${appCodeList.sysCode} (${appCodeList.codeName})</option>
                    </c:forEach>--%>
                </select>
            </c:if>
            <c:if test="${!empty appCode}">
                <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                    <c:if test="${appCode == appCodeList.sysCode}">
                        <select id="brandTypeCd" name="brandTypeCd" class="form-control" >
                            <option value="${appCodeList.codeValue}" selected>${appCodeList.codeName}</option>
                        </select>
                    </c:if>
                </c:forEach>
            </c:if>
            <select class="chart-year form-control" style="width: 80px; height: 25px; padding: 0 5px; margin-left: auto" disabled>
                <c:forEach begin="0" end="10" var="result" step="1">
                    <option value="<c:out value="${yearStart - result}" />"><c:out value="${yearStart - result}" /></option>
                </c:forEach>
            </select>
            년
            <select class="chart-month form-control m-l-5" style="width: 60px; height: 25px; padding: 0 5px" disabled>
                <c:forEach begin="1" end="12" var="month" step="1">
                    <option value="<c:if test="${month < 10}"><c:out value="${'0'.concat(month)}" /></c:if><c:if test="${month >= 10}"><c:out value="${month}" /></c:if>" <c:if test="${month == thisMonth}">selected</c:if>>
                        <c:if test="${month < 10}"><c:out value="${'0'.concat(month)}" /></c:if>
                        <c:if test="${month >= 10}"><c:out value="${month}" /></c:if>
                    </option>
                </c:forEach>
            </select>
            월 기준
        </div>

        <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
            <!-- end page-header -->
            <div class="row">
                <!-- BEGIN col-8 -->
                <div class="col-xl-6 col-md-12">
                    <div class="widget-chart with-sidebar" data-bs-theme="dark">
                        <div class="widget-chart-content bg-gray-800" style="background-color: #2e353c;">
                            <h4 class="chart-title">
                                주문 변화추이
                                <div class="stats-link float-right">
                                    <a href="${path}statistics/order/list?startDate=${month}&endDate=${now}&selday=&platformType=2"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                </div>
                                <small>한달기준 주문량 변화추이</small>
                            </h4>
                            <div class="widget-chart-content bg-gray-800 w-100" style="background-color: #2e353c;">
                                <canvas id="line-chart" class="height-250"></canvas>
                            </div>
                        </div>
                        <div class="widget-chart-sidebar bg-gray-900 width-400 p-0" style="background-color: #20252b;">
                        <div class="widget b-0 widget-stats" style="background-color: #20252b;">
                            <div class="stats-icon"><i class="fa fa-lg fa-fw m-r-10 fa-credit-card"></i></div>
                            <div class="stats-info">
                                <h4><spring:message code="dashboard.123" text="총 주문수"/></h4>
                                <p class="orderMonth" ></p>
                            </div>
                            <div class="stats-link">
                                <a></a>
                            </div>
                        </div>
                        <div class="flex-grow-1 d-flex align-items-center">
                        </div>
                            <ul class="chart-legend fs-11px p-15">
                                <li ><i class="fa fa-circle fa-fw text-blue fs-9px me-5px t-minus-1 "></i><span class="orderMax font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">주문량 최고</span></li>
                                <li ><i class="fa fa-circle fa-fw text-teal fs-9px me-5px t-minus-1 "></i><span class="orderMin font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">주문량 최저</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-md-12">
                    <div class="widget-chart with-sidebar" data-bs-theme="dark">
                        <div class="widget-chart-content bg-gray-800" style="background-color: #2e353c;">
                            <h4 class="chart-title">
                                신규고객 변화추이
                                <div class="stats-link float-right">
                                    <a href="${path}statistics/user/list?startDate=${month}&endDate=${now}&selday=&platformType=2"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                </div>
                                <small>한달 기준 신규고객 변화추이</small>
                            </h4>
                            <div class="widget-chart-content bg-gray-800 w-100" style="background-color: #2e353c;">
                                <div id="interactive-chart3" class="height-250"></div>
                            </div>
                        </div>
                        <div class="widget-chart-sidebar bg-gray-900 p-0" style="background-color: #20252b;">
                            <div class="widget b-0 widget-stats" style="background-color: #20252b;">
                                <div class="stats-icon"><i class="fa fa-lg fa-fw m-r-10 fa-user"></i></div>
                                <div class="stats-info">
                                    <h4><spring:message code="dashboard.123" text="총 가입수"/></h4>
                                    <p class="userMonth" ></p>
                                </div>
                                <div class="stats-link">
                                    <a></a>
                                </div>
                            </div>
                            <div class="flex-grow-1 d-flex align-items-center">
                            </div>
                            <ul class="chart-legend fs-11px p-15">
                                <li ><i class="fa fa-circle fa-fw text-blue fs-9px me-5px t-minus-1 "></i><span class="userMax font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">가입수 최고</span></li>
                                <li ><i class="fa fa-circle fa-fw text-teal fs-9px me-5px t-minus-1 "></i><span class="userMin font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">가입수 최저</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-6 col-lg-6">
                    <div class="card border-0 mb-3 bg-gray-900 text-white">
                        <div class="card-body" style="background-color: #20252b; background-size: auto 60%;">
                            <h5 class="mb-10px"><span>플랫폼 공지</span></h5>
                        </div>
                        <div class="widget-list rounded-bottom notice-list" data-bs-theme="dark"  >
                            <c:forEach var="item" items="${updatePlatList}" varStatus="status">
                                <c:if test="${item.platformType == 1 && item.programType == 1}">
                                    <a  href="/notice/platform/${item.noticeNo}" class="widget-list-item rounded-0 pt-3px">
                                        <div class="widget-list-media icon">
                                            <i class="fas fa-envelope-open-text bg-indigo text-white"></i>
                                        </div>
                                        <div class="widget-list-content">
                                            <div class="widget-list-title">${item.title}</div>
                                        </div>
                                        <div class="widget-list-action text-nowrap text-gray-500">
                                            <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}
                                        </div>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="card border-0 mb-3 bg-gray-900 text-white">
                        <div class="card-body" style="background-color: #20252b; background-size: auto 60%;">
                            <h5 class="mb-10px">이벤트 내역</span></h5>
                        </div>
                        <div class="widget-list rounded-bottom notice-list" data-bs-theme="dark" >
                                <c:forEach var="item" items="${updateEventList}" varStatus="status">
                                    <a href="/notice/event/${item.eventNo}" class="widget-list-item rounded-0 pt-3px">
                                        <div class="widget-list-media icon">
                                            <i class="fas fa-envelope-open-text bg-indigo text-white"></i>
                                        </div>
                                        <div class="widget-list-content">
                                            <div class="widget-list-title">${item.title}</div>
                                        </div>
                                        <div class="widget-list-action text-nowrap text-gray-500">
                                            <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}
                                        </div>
                                    </a>
                                </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- end col-4 -->
            </div>
            <!-- end row -->
        </c:if>
        <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                <!-- end page-header -->
                <div class="row">
                    <!-- BEGIN col-8 -->
                    <div class="col-xl-6 col-md-12">
                        <div class="widget-chart with-sidebar" data-bs-theme="dark">
                            <div class="widget-chart-content bg-gray-800" style="background-color: #2e353c;">
                                <h4 class="chart-title">
                                    주문 변화추이
                                    <div class="stats-link float-right">
                                        <a href="${path}statistics/order/list?startDate=${month}&endDate=${now}&selday=&platformType=2"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                    </div>
                                    <small>한달기준 주문량 변화추이</small>
                                </h4>
                                <div class="widget-chart-content bg-gray-800 w-100" style="background-color: #2e353c;">
                                    <canvas id="line-chart" class="height-250"></canvas>
                                </div>
                            </div>
                            <div class="widget-chart-sidebar bg-gray-900 width-400 p-0" style="background-color: #20252b;">
                                <div class="widget b-0 widget-stats" style="background-color: #20252b;">
                                    <div class="stats-icon"><i class="fa fa-lg fa-fw m-r-10 fa-credit-card"></i></div>
                                    <div class="stats-info">
                                        <h4><spring:message code="dashboard.123" text="총 주문수"/></h4>
                                        <p class="orderMonth" ></p>
                                    </div>
                                    <div class="stats-link">
                                        <a></a>
                                    </div>
                                </div>
                                <div class="flex-grow-1 d-flex align-items-center">
                                </div>
                                <ul class="chart-legend fs-11px p-15">
                                    <li ><i class="fa fa-circle fa-fw text-blue fs-9px me-5px t-minus-1 "></i><span class="orderMax font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">주문량 최고</span></li>
                                    <li ><i class="fa fa-circle fa-fw text-teal fs-9px me-5px t-minus-1 "></i><span class="orderMin font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">주문량 최저</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-12">
                        <div class="widget-chart with-sidebar" data-bs-theme="dark">
                            <div class="widget-chart-content bg-gray-800" style="background-color: #2e353c;">
                                <h4 class="chart-title">
                                    신규고객 변화추이
                                    <div class="stats-link float-right">
                                        <a href="${path}statistics/user/list?startDate=${month}&endDate=${now}&selday=&platformType=2"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                    </div>
                                    <small>한달 기준 신규고객 변화추이</small>
                                </h4>
                                <div class="widget-chart-content bg-gray-800 w-100" style="background-color: #2e353c;">
                                    <div id="interactive-chart3" class="height-250"></div>
                                </div>
                            </div>
                            <div class="widget-chart-sidebar bg-gray-900 p-0" style="background-color: #20252b;">
                                <div class="widget b-0 widget-stats" style="background-color: #20252b;">
                                    <div class="stats-icon"><i class="fa fa-lg fa-fw m-r-10 fa-user"></i></div>
                                    <div class="stats-info">
                                        <h4><spring:message code="dashboard.123" text="총 가입수"/></h4>
                                        <p class="userMonth" ></p>
                                    </div>
                                    <div class="stats-link">
                                        <a></a>
                                    </div>
                                </div>
                                <div class="flex-grow-1 d-flex align-items-center">
                                </div>
                                <ul class="chart-legend fs-11px p-15">
                                    <li ><i class="fa fa-circle fa-fw text-blue fs-9px me-5px t-minus-1 "></i><span class="userMax font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">가입수 최고</span></li>
                                    <li ><i class="fa fa-circle fa-fw text-teal fs-9px me-5px t-minus-1 "></i><span class="userMin font-weight-bold" style="color: #fff;"></span><span class="float-right p-r-5">가입수 최저</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${sessionScope.sessionKey.roleType != 2}">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6">
                            <div class="card border-0 mb-3 bg-gray-900 text-white">
                                <div class="card-body" style="background-color: #20252b; background-size: auto 60%;">
                                    <h5 class="mb-10px"><span>플랫폼 공지</span></h5>
                                </div>
                                <div class="widget-list rounded-bottom notice-list" data-bs-theme="dark"  >
                                    <c:forEach var="item" items="${updatePlatList}" varStatus="status">
                                        <c:if test="${item.platformType == 2}">
                                            <a  href="/notice/platform/${item.noticeNo}" class="widget-list-item rounded-0 pt-3px"  onclick="window.open(this.href, '_blank', 'width=1000, height=740,resizeable=no'); return false;">
                                                <div class="widget-list-media icon">
                                                    <i class="fas fa-envelope-open-text bg-indigo text-white"></i>
                                                </div>
                                                <div class="widget-list-content">
                                                    <div class="widget-list-title">${item.title}</div>
                                                </div>
                                                <div class="widget-list-action text-nowrap text-gray-500">
                                                    <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6">
                            <div class="card border-0 mb-3 bg-gray-900 text-white">
                                <div class="card-body" style="background-color: #20252b; background-size: auto 60%;">
                                    <h5 class="mb-10px">이벤트 내역</span></h5>
                                </div>
                                <div class="widget-list rounded-bottom notice-list" data-bs-theme="dark" >
                                    <c:forEach var="item" items="${updateEventList}" varStatus="status">
                                        <a href="/notice/event/${item.eventNo}" class="widget-list-item rounded-0 pt-3px"  onclick="window.open(this.href, '_blank', 'width=1000, height=740,resizeable=no'); return false;">
                                            <div class="widget-list-media icon">
                                                <i class="fas fa-envelope-open-text bg-indigo text-white"></i>
                                            </div>
                                            <div class="widget-list-content">
                                                <div class="widget-list-title">${item.title}</div>
                                            </div>
                                            <div class="widget-list-action text-nowrap text-gray-500">
                                                <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- end col-4 -->
                    </div>
                </c:if>
                <!-- end row -->
            </c:if>
    </div>
    <!-- begin #content -->
</div>
<!-- end page container -->
</div>


</div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="common/include_common_js.jsp" %>
<%@include file="common/include_datatables.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="common/include_custom_js.jsp" %>
<script src="../assets/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="../assets/plugins/chart.js/dist/Chart.min.js"></script>
<%-- <link href="../assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
 <script src="../assets/plugins/d3/d3.min.js"></script>
 <script src="../assets/plugins/nvd3/build/nv.d3.min.js"></script>--%>
<script src="${path}/assets/plugins/chart.js/dist/Chart.min_new.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<%-- Custom JS End--%>

<script>
    let label = [];
    let totalCnt = [];
    let endCnt = [];
    let cancelCnt= [];
    let pointSize = 4;
    let orderMonth = 0;
    searchUserList();

    //Chart.defaults.color = COLOR_DARK_LIGHTER
    Chart.defaults.color = '#ffffff';
    Chart.defaults.font.family = 'Nanum Gothic',"나눔 고딕",'NanumGothic',"나눔고딕",'Malgun Gothic','맑은 고딕','MalgunGothic','맑은고딕'
    Chart.defaults.font.weight = 500;

    var ctx111 = document.getElementById('line-chart').getContext('2d');
    var lineChart = new Chart(ctx111, {
        type: 'line',
        data: {
            labels: label,
            datasets: [{
                label: '총주문량',
                textStrokeColor:'#ffffff',
                //borderColor: COLOR_GREY,
                borderColor: '#ffffff',
                //pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                pointBackgroundColor: '#ffffff',
                pointRadius: pointSize,
                borderWidth: 2,
                //backgroundColor: COLOR_GREY_TRANSPARENT_1,
                backgroundColor: '#ffffff',
                data: totalCnt,
            }/*, {
                label: '주문완료',
                borderColor: COLOR_AQUA,
                pointBackgroundColor: COLOR_AQUA_TRANSPARENT_6,
                pointRadius: pointSize,
                borderWidth: 2,
                backgroundColor: COLOR_AQUA_TRANSPARENT_1,
                data: endCnt
            }*/ /*{
                label: '주문취소',
                borderColor: COLOR_RED_LIGHTER,
                pointBackgroundColor: COLOR_RED_TRANSPARENT_6,
                pointRadius: pointSize,
                borderWidth: 2,
                backgroundColor: COLOR_RED_TRANSPARENT_1,
                data: cancelCnt
            }*/]
        },
        options: {
            plugins: {
                legend: {
                    labels: {
                        // This more specific font property overrides the global property
                        font: {
                            size: 13,
                            fontColor: '#ffffff'
                        },
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            let label = context.dataset.label || '';

                            if (label) {
                                label += ': ';
                            }
                            if (context.parsed.y !== null) {
                                label += ' ' + context.parsed.y + '회';
                            }
                            return label;
                        }
                    }
                },
            },

            scales: {
                x: {
                    display: true,
                    title: {
                        display: false,
                        text: 'os별 구분'
                    },
                    grid:{
                        color: "#4d5359",
                    },
                    ticks: {
                        major: {
                            enabled: true
                        },
                        //color: (context) => context.tick && context.tick.major && '#FF0000',
                        font: function (context) {
                            if (context.tick && context.tick.major) {
                                return {
                                    weight: 'bold'
                                };
                            }
                        }
                    }
                },
                y: {
                    grid:{
                        color: "#4d5359",
                    },
                    ticks: {
                        // Include a dollar sign in the ticks
                        callback: function (value, index, ticks) {
                            return value + ' 회'
                        }
                    }
                }
            }
        }
    });


    $(() => {
        let dateObj = new Date();
        let month = dateObj.getMonth() + 1;
        let selectYear = dateObj.getFullYear();
        let selectMonth = month < 10 ? '0' + month : month;
        let searchDate = selectYear + '/' + selectMonth + '/01';

        drawChart(searchDate);

        $("#wait").on("click",function(){
            alert("작업중");
        });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip" class="flot-tooltip">' + contents + '건 </div>').css( {
                top: y - 45,
                left: x - 55
            }).appendTo("body").fadeIn(200);
        }

        //연도 선택시 차트 새로 그림
        $('.chart-year').change(function(e) {
            selectYear = e.target.value;
            searchDate = selectYear + '/' + selectMonth + '/01';
            drawChart(searchDate);
        });

        //월 선택시 차트 새로 그림
        $('.chart-month').change(function(e) {
            selectMonth = e.target.value;
            searchDate = selectYear + '/' + selectMonth + '/01';
            drawChart(searchDate);
        });

        var previousPoint = null;
        $("#interactive-chart,#interactive-chart3").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));
            if (item) {
                if (previousPoint !== item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed(2);
                    var content = item.series.label + " " + Math.floor(y);
                    showTooltip(item.pageX, item.pageY, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
            event.preventDefault();
        });

    });


    //인수대행 취소 없대고 인수대행 반납대행 합침 + 신규 고객 그래프 추가
    function drawChart(searchDate) {
        let receiptComplData = []; //인수대행 완료 데이터
        /*let receiptCancelData = []; //인수대행 취소 데이터*/
        let receiptLabels = []; // 인수대행 일자 label

        let returnComplData = []; //반납대행 완료 데이터
        //let returnCancelData = []; //반납대행 취소 데이터
        let returnLabels = []; // 반납대행 일자 label

        let returnNewUser= []; //신규 유저 데이터
        let userUserLabels = []; // 신규유저 일자 label
        let appCode = `${sessionScope.sessionKey.appCode}`;
        $.ajax({
            type: "POST",
            url: "${path}/api/main/chart/list?appCode="+appCode+"&searchDate=" + searchDate,
            contentType: "application/json;",
            async: false,
            dataType: "json",
            success: function(data) {
                let receiptResult = setChartDatas(data.getCallAllListType2040, data.getCallAllListType2140);
                receiptComplData = receiptResult.complete;
                returnComplData = receiptResult.cancel;
                receiptLabels = receiptResult.labels;



                let getUserCountList = getUserCount(data.getUserCount);

                returnNewUser = getUserCountList.userCount;
                let totalCnt = 0;
                let userList = [];
                for(var i= 0; i < data.getUserCount.length ; i++) {
                    totalCnt = data.getUserCount[i].cnt + totalCnt;
                    userList.push(data.getUserCount[i].cnt)
                }
                const total = totalCnt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                if(userList.length == 0){
                    userList = [0];
                }
                $(".userMonth").text(total);
                $(".userMax").append( Math.max.apply(null,userList) + "회");
                $(".userMin").append( Math.min.apply(null,userList) + "회");
                userUserLabels = getUserCountList.labels;


                /*   let returnResult = setChartDatas(data.getCallAllListType2140, data.getCallAllListType2141);
                   returnComplData = returnResult.complete;
                   //returnCancelData = returnResult.cancel;
                   returnLabels = returnResult.labels;*/

                /*
                                console.log(data);
                                let receiptResult = setChartDatas(data.getCallAllListType2040, data.getCallAllListType2041);
                                receiptComplData = receiptResult.complete;
                                receiptCancelData = receiptResult.cancel;
                                receiptLabels = receiptResult.labels;

                                let returnResult = setChartDatas(data.getCallAllListType2140, data.getCallAllListType2141);
                                returnComplData = returnResult.complete;
                                returnCancelData = returnResult.cancel;
                                returnLabels = returnResult.labels;
                */
            }
        });
        let normal = "<spring:message code="list.script.normal" text="정상"/>";
        let stop = "<spring:message code="list.script.stop" text="정지"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let complete = "<spring:message code="list.script.complete" text="완료"/>";
        let ordercall = "<spring:message code="list.script.ordercall" text="주문콜"/>";
        let join = "<spring:message code="list.script.ordercall" text="가입"/>";
        let secession = "<spring:message code="list.script.ordercall" text="탈퇴"/>";

        $.plot($("#interactive-chart"), [{
            data: receiptComplData,
            label: '인수대행 완료',
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 1, fillColor: COLOR_WHITE },
            shadowSize: 0

        }, /*{
            data: receiptCancelData,
            label: '인수대행 취소',
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }*/{
            data: returnComplData,
            label: "반납대행 완료",
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 1, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            /*labels: {

                fontColor: "red",
                fontSize: 18
            }*/
            xaxis: {  ticks: receiptLabels, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2},
            yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0},
            grid: {
                hoverable: true,
                clickable: true,
                tickColor: COLOR_DARK_TRANSPARENT_2,
                borderWidth: 1,
                backgroundColor: 'transparent',
                borderColor: COLOR_DARK_TRANSPARENT_2
            },
            legend: {
                labelBoxBorderColor: COLOR_DARK_TRANSPARENT_2,
                margin: 10,
                noColumns: 1,
                show: true
            },
            scales: {
                x: {
                    display: true,
                    title: {
                        display: false,
                        text: 'os별 구분'
                    },
                    ticks: {
                        major: {
                            enabled: true
                        },
                        color: (context) => context.tick && context.tick.major && '#FF0000',
                        font: function (context) {
                            if (context.tick && context.tick.major) {
                                return {
                                    weight: 'bold'
                                };
                            }
                        }
                    }
                },
                y: {
                    grid:{
                        color: "#4d5359",
                    },
                    ticks: {
                        // Include a dollar sign in the ticks
                        callback: function (value, index, ticks) {
                            return value + ' 회'
                        }
                    }
                }
            }
        });

        $.plot($("#interactive-chart3"), [{
            data: returnNewUser,
            label: "신규 고객",
            labelColor: "#ffffff",
            color: "#ffffff",
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 1, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, ], {
            xaxis: {  ticks: userUserLabels, tickDecimals: 0, tickColor: "#4d5359", },
            yaxis: {  ticks: 5, tickColor: "#4d5359", min: 0},
            grid: {
                color: "#ffffff",
                hoverable: true,
                clickable: true,
                //tickColor: COLOR_DARK_TRANSPARENT_2,
                tickColor: "#ffffff",
                borderWidth: 1,
                backgroundColor: 'transparent',
                //borderColor: COLOR_DARK_TRANSPARENT_2
                borderColor:  "#4d5359",
            },
            legend: {
                //labelBoxBorderColor: COLOR_DARK_TRANSPARENT_2,
                labelBoxBorderColor:  "#4d5359",
                color: "#ffffff",
                margin: 10,
                noColumns: 1,
                show: true
            },
        });
        /*
                $.plot($("#interactive-chart3"), [{
                    data: returnComplData,
                    label: "반납대행 완료",
                    color: COLOR_BLUE,
                    lines: { show: true, fill:false, lineWidth: 2 },
                    points: { show: true, radius: 3, fillColor: COLOR_WHITE },
                    shadowSize: 0
                }, {
                    data: returnCancelData,
                    label: "반납대행 취소",
                    color: COLOR_GREEN,
                    lines: { show: true, fill:false, lineWidth: 2 },
                    points: { show: true, radius: 3, fillColor: COLOR_WHITE },
                    shadowSize: 0
                }], {
                    xaxis: {  ticks: returnLabels, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
                    yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0  },
                    grid: {
                        hoverable: true,
                        clickable: true,
                        tickColor: COLOR_DARK_TRANSPARENT_2,
                        borderWidth: 1,
                        backgroundColor: 'transparent',
                        borderColor: COLOR_DARK_TRANSPARENT_2
                    },
                    legend: {
                        labelBoxBorderColor: COLOR_DARK_TRANSPARENT_2,
                        noColumns: 1,
                        show: true
                    }
                });
        */

    }

    function setChartDatas(completeDatas, cancelDatas) {
        let completeData = [];
        let cancelData = [];
        let exLabels = [];
        let labels = [];
        for (let i = 0 ; i < completeDatas.length ; i++ ) {
            completeData.push([completeDatas[i].dayDate, completeDatas[i].cnt]);
            exLabels.push(completeDatas[i].dayDate);
        }
        for (let i = 0 ; i < cancelDatas.length ; i++ ) {
            cancelData.push([cancelDatas[i].dayDate, cancelDatas[i].cnt]);
            exLabels.push(cancelDatas[i].dayDate);
        }

        let setLabels = new Set(exLabels); //일자 중복 제거
        let labelArr = Array.from(setLabels); //set -> array 변환
        let sortSetLabels = labelArr.sort((a, b) => a - b); //일자 오름차순 정렬

        //완료 건 일자 array와 인덱스 맞춤 작업
        completeData.forEach((data) => {
            sortSetLabels.forEach((label, idx) => {
                if (data[0] === label) {
                    data[0] = idx;
                }
            });
        });

        //취소 건 일자 array와 인덱스 맞춤 작업
        cancelData.forEach((data) => {
            sortSetLabels.forEach((label, idx) => {
                if (data[0] === label) {
                    data[0] = idx;
                }
            });
        });

        //일자 인덱스 세팅
        sortSetLabels.forEach((label, idx) => {
            labels.push([idx, label]);
        });

        return {
            complete: completeData,
            cancel: cancelData,
            labels,
        }
    }

    function getUserCount(completeDatas ) {
        let completeData = [];
        let cancelData = [];
        let exLabels = [];
        let labels = [];
        for (let i = 0 ; i < completeDatas.length ; i++ ) {
            completeData.push([completeDatas[i].dayDate, completeDatas[i].cnt]);
            exLabels.push(completeDatas[i].dayDate);
        }

        let setLabels = new Set(exLabels); //일자 중복 제거
        let labelArr = Array.from(setLabels); //set -> array 변환
        let sortSetLabels = labelArr.sort((a, b) => a - b); //일자 오름차순 정렬

        //완료 건 일자 array와 인덱스 맞춤 작업
        completeData.forEach((data) => {
            sortSetLabels.forEach((label, idx) => {
                if (data[0] === label) {
                    data[0] = idx;
                }
            });
        });

        //일자 인덱스 세팅
        sortSetLabels.forEach((label, idx) => {
            labels.push([idx, label]);
        });

        return {
            userCount: completeData,
            labels,
        }
    }



    function searchUserList() {
        let req = convertFormToObj($('form.formUserList'));
        $.ajax({
            type: "POST",
            url: "${path}/api/manna/order/main",
            //contentType: "application/json;",
            dataType: "json",
            async: false,
            data :{ "brandTypeCd" : $('#brandTypeCd option:selected').val() },
            success: function(data) {
                orderMonth = 0;
                for(var i = 0 ; i < data.timeList.length ; i++) {
                    label.push(data.timeList[i].yyyymmdd)
                    totalCnt.push(Number(data.timeList[i].totalCnt))
                    endCnt.push(data.timeList[i].sumcount)
                    orderMonth= orderMonth+data.timeList[i].totalCnt;
                    /*        cancelCnt.push(data.timeList[i].cancelCnt)*/
                }

                const cnt = orderMonth.toString()
                    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                $(".orderMonth").text(cnt);
                if(totalCnt.length == 0){
                    totalCnt = [0];
                }
                $(".orderMax").append( Math.max.apply(null,totalCnt) + "회");
                $(".orderMin").append( Math.min.apply(null,totalCnt) + "회");
                if (data.timeList.length > 40) {
                    pointSize = 0;
                } else {
                    pointSize = 4;
                }

            }
        });
    }

    /* nv.addGraph(function() {
         var sin = [], cos = [];
         var parseDate = d3.time.format("%Y-%m-%d %H:%M:%S").parse;
         sin.push({x: parseDate('2020-10-11 00:50:09'), y:  Math.random()*10 });
         sin.push({x: parseDate('2020-10-12 00:50:09'), y:  Math.random()*10 });
         sin.push({x: parseDate('2020-10-13 00:50:09'), y:  Math.random() });


         var lineChartData = [
             { values: sin, key: '주문완료', color: COLOR_AQUA },
             { values: cos, key: '주문취소', color: COLOR_BLUE }
         ];

         var lineChart = nv.models.lineChart().options({
             transitionDuration: 300,
             useInteractiveGuideline: true,
             donut: true
         });

         //lineChart.xAxis.axisLabel('날짜').tickFormat(d3.format(',.1f'));
         //lineChart.xAxis.axisLabel('날짜').tickFormat(d3.time.format("%Y-%m-%d %H:%M:%S").parse);

         lineChart.xAxis
             .tickFormat(function(d) {
                 return d3.time.format('%Y-%m-%d')(new Date(d))
             });
         /!*lineChart.yAxis.axisLabel('주문량').tickFormat(function(d) {
             if (d == null) {
                 return 'N/A';
             }
             return d3.format(',.2f')(d);
         });*!/
         lineChart.yAxis.axisLabel('주문량').tickFormat(function(d) {
             if (d == null) {
                 return 'N/A';
             }
             return d3.format(',.0f')(d);
         });

         d3.select('#nv-line-chart').append('svg').datum(lineChartData).call(lineChart);
         nv.utils.windowResize(lineChart.update);

         return lineChart;
     });*/
</script>
</body>
</html>
