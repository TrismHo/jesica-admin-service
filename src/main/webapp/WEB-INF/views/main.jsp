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
    <c:if test="${sessionScope.sessionKey.roleType != 2}">
        <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
            <div id="content" class="content" style="background-color: #eee;">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;">메인</a></li>
                    <li class="breadcrumb-item active"><spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header"><spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></h1>
                <!-- end page-header -->

                <div class="row">
                    <div class="col-xl-3 col-md-4">
                        <div class="widget widget-stats bg-teal-lighter">
                            <div class="stats-icon"><i class="fas fa-lg fa-fw m-r-10 fa-building"></i></div>
                            <div class="stats-info">
                                <h4><spring:message code="dashboard.123" text="전체고객"/></h4>
                                <p data-animation="number" data-value="${userChart}"></p>
                            </div>
                            <div class="stats-link">
                                <a href="${path}/board/cust/list?isMember=&dataStatus=&startDate=2021-01-01&endDate=${now}&custName="><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-xl-3 col-md-4">
                        <div class="widget widget-stats bg-red-lighter">
                            <div class="stats-icon"><i class="far fa-lg fa-fw m-r-10 fa-building"></i></div>
                            <div class="stats-info">
                                <h4><spring:message code="dashboard.231" text="정상드라이버"/></h4>

                                <p data-animation="number" data-value="${userWorkerChart}"></p>
                            </div>
                            <div class="stats-link">
                                <a href="${path}/driver/deliveryman/list?dataStatus=OK&name=&startDate=2021-01-01&endDate=${now}"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- begin col-3 -->
                    <div class="col-xl-3 col-md-4">
                        <div class="widget widget-stats bg-blue-lighter">
                            <div class="stats-icon"><i class="fas fa-lg fa-fw m-r-10 fa-building"></i></div>
                            <div class="stats-info">
                                <h4><spring:message code="dashboard.123" text="드라이버심사요청"/></h4>

                                <p data-animation="number" data-value="${workerApplyChart}"></p>
                            </div>
                            <div class="stats-link">
                                <a href="${path}/driver/apply/list?&authStatus=1"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-xl-3 col-md-4">
                        <div class="widget widget-stats bg-red-lighter">
                            <div class="stats-icon"><i class="far fa-lg fa-fw m-r-10 fa-building"></i></div>
                            <div class="stats-info">
                                <h4><spring:message code="dashboard.123" text="렌터카 가맹점"/></h4>

                                <p data-animation="number" data-value="${storeRentChart}"></p>
                            </div>
                            <div class="stats-link">
                                <a href="${path}/workgroup/affilfranch/list?headNoText=렌트카예약서비스%28전국%29%5B1096%5D+++++&headNo=1096&headNoText=%0D%0A렌트카예약서비스%28전국%29%5B1096%5D%0D%0A+++++&branchNo=10007&branchNoText=%0D%0A제주%5D렌트카_관리총판%5B10007%5D%0D%0A+++++&branchNoText=제주%5D렌트카_관리총판%5B10007%5D+++++&startDate=2020-01-01&endDate=${now}&dataStatus=OK&storeName="><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end col-3 -->
                </div>
                <!-- end row -->


                <!-- begin row -->
                    <%--  <div class="m-b-5" style="display: flex">
                          <select class="chart-year form-control" style="width: 80px; height: 25px; padding: 0 5px; margin-left: auto">
                              <c:forEach begin="0" end="10" var="result" step="1">
                                  <option value="<c:out value="${yearStart - result}" />"><c:out value="${yearStart - result}" /></option>
                              </c:forEach>
                          </select>
                          <select class="chart-month form-control m-l-5" style="width: 60px; height: 25px; padding: 0 5px">
                              <c:forEach begin="1" end="12" var="month" step="1">
                                  <option value="<c:if test="${month < 10}"><c:out value="${'0'.concat(month)}" /></c:if><c:if test="${month >= 10}"><c:out value="${month}" /></c:if>" <c:if test="${month == thisMonth}">selected</c:if>>
                                      <c:if test="${month < 10}"><c:out value="${'0'.concat(month)}" /></c:if>
                                      <c:if test="${month >= 10}"><c:out value="${month}" /></c:if>
                                  </option>
                              </c:forEach>
                          </select>
                      </div>--%>
                <div class="row">
                    <!-- begin col-8 -->
                    <div class="col-xl-6 ">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <spring:message code="dashboard.123" text="인수/반납대행 변화추이"/>
                                </h4>
                                <div class="panel-heading-btn">
                                    <div class="stats-link">
                                        <a href="${path}/statistics/day/list?startDate=${month}&endDate=${now}&selday=&day=&orderTypeCode=&storeNo=-1"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                    </div>
                                        <%--<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>--%>
                                </div>
                            </div>
                            <div class="panel-body pr-1">

                                <div id="interactive-chart" class="height-sm"></div>
                            </div>
                        </div>
                        <!-- end panel -->
                    </div>
                    <!-- end col-8 -->
                    <!-- begin col-4 -->
                    <div class="col-xl-6">
                        <!-- begin panel -->
                        <div class="panel panel-inverse" >
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <spring:message code="dashboard.123" text="신규고객 변화추이"/>
                                </h4>
                                <div class="panel-heading-btn">
                                        <%-- <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                         <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                                         <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                         <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                                     --%>
                                    <div class="stats-link">
                                        <a href="${path}/statistics/user/list?startDate=${month}&endDate=${now}&selday=&platformType=1"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body pr-1">
                                <div id="interactive-chart3" class="height-sm"></div>
                            </div>
                        </div>
                        <!-- end panel -->
                    </div>
                    <!-- end col-4 -->
                </div>
                <div class="row">
                    <!-- begin col-4 -->
                    <div class="col-xl-6 col-lg-6">
                        <!-- begin card -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">업데이트 내역</h4>
                            </div>
                            <div class="panel-body p-0 scroll-arrow height-250" style="overflow-y: auto" >
                                <ul class="todolist">
                                    <c:forEach var="item" items="${updateList}" varStatus="status">
                                        <c:if test="${item.platformType == 1 && item.programType == 1}">
                                            <li>
                                                <a  class="todolist-container" data-click="todolist"  href="/notice/update/${item.noticeNo}" onclick="window.open(this.href, '_blank', 'width=1000, height=740,resizeable=no'); return false;" class="todolist-container" data-click="todolist">
                                                    <div class="todolist-input" style="color:#2d353c;"> <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}</div>
                                                    <div class="todolist-title"> ${item.title}</div>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- end col-4 -->
                    <!-- begin col-4 -->
                    <div class="col-xl-6 col-lg-6">
                        <!-- begin card -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">플랫폼 공지</h4>
                            </div>
                            <div class="panel-body p-0 scroll-arrow height-250" style="overflow-y: auto" >
                                <ul class="todolist">
                                    <c:forEach var="item" items="${updatePlatList}" varStatus="status">
                                        <li>
                                            <a  class="todolist-container" data-click="todolist"  href="/notice/platform/${item.noticeNo}" onclick="window.open(this.href, '_blank', 'width=1000, height=740, resizeable=no'); return false;">
                                                <div class="todolist-input" style="color:#2d353c;"> <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}</div>
                                                <div class="todolist-title">${item.title}</div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col-4 -->
                    <!-- begin col-4 -->
                    <!-- end col-4 -->
                </div>
                <!-- end row -->
            </div>
        </c:if>
        <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
            <div id="content" class="content" style="background-color: #eee;">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;">메인</a></li>
                    <li class="breadcrumb-item active"><spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header"><spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></h1>
                <!-- end page-header -->

                <!-- end row -->


                <!-- begin row -->
                    <%--  <div class="m-b-5" style="display: flex">
                          <select class="chart-year form-control" style="width: 80px; height: 25px; padding: 0 5px; margin-left: auto">
                              <c:forEach begin="0" end="10" var="result" step="1">
                                  <option value="<c:out value="${yearStart - result}" />"><c:out value="${yearStart - result}" /></option>
                              </c:forEach>
                          </select>
                          <select class="chart-month form-control m-l-5" style="width: 60px; height: 25px; padding: 0 5px">
                              <c:forEach begin="1" end="12" var="month" step="1">
                                  <option value="<c:if test="${month < 10}"><c:out value="${'0'.concat(month)}" /></c:if><c:if test="${month >= 10}"><c:out value="${month}" /></c:if>" <c:if test="${month == thisMonth}">selected</c:if>>
                                      <c:if test="${month < 10}"><c:out value="${'0'.concat(month)}" /></c:if>
                                      <c:if test="${month >= 10}"><c:out value="${month}" /></c:if>
                                  </option>
                              </c:forEach>
                          </select>
                      </div>--%>
                <div class="row">
                    <!-- begin col-8 -->
                    <div class="col-xl-6 ">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <spring:message code="dashboard.123" text="주문 변화추이"/>
                                </h4>
                                <div class="panel-heading-btn">
                                        <%--<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                        <a href="javascript:;" cla화ss="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                                    --%>
                                    <div class="stats-link">
                                        <a href="${path}statistics/order/list?startDate=${month}&endDate=${now}&selday=&platformType=2"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body pr-1">
                                <canvas id="line-chart"  class="height-sm" style="display: block; box-sizing: border-box; height: 342px; width: 684px;"></canvas>
                            </div>
                        </div>
                        <!-- end panel -->
                    </div>
                    <!-- end col-8 -->
                    <!-- begin col-4 -->
                    <div class="col-xl-6">
                        <!-- begin panel -->
                        <div class="panel panel-inverse" >
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <spring:message code="dashboard.123" text="신규고객 변화추이"/>
                                </h4>
                                <div class="panel-heading-btn">
                                        <%-- <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                         <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                                         <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                         <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                                     --%>
                                    <div class="stats-link">
                                        <a href="${path}statistics/user/list?startDate=${month}&endDate=${now}&selday=&platformType=2"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body pr-1">
                                <div id="interactive-chart3" class="height-sm"></div>
                            </div>
                        </div>
                        <!-- end panel -->
                    </div>
                    <!-- end col-4 -->
                </div>
                <div class="row">
                    <!-- begin col-4 -->
                    <div class="col-xl-4 col-lg-4">
                        <!-- begin card -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">이벤트 내역</h4>
                            </div>
                            <div class="panel-body p-0 scroll-arrow height-250" style="overflow-y: auto" >
                                <ul class="todolist">
                                    <c:forEach var="item" items="${updateEventList}" varStatus="status">
                                        <li>
                                            <a  class="todolist-container" data-click="todolist"  href="/notice/event/${item.eventNo}" onclick="window.open(this.href, '_blank', 'width=1000, height=740,resizeable=no'); return false;" class="todolist-container" data-click="todolist">
                                                <div class="todolist-input" style="color:#2d353c;"> <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}</div>
                                                <div class="todolist-title"> ${item.title}</div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- end col-4 -->
                    <!-- begin col-4 -->
                    <div class="col-xl-4 col-lg-4">
                        <!-- begin card -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">플랫폼 공지</h4>
                            </div>
                            <div class="panel-body p-0 scroll-arrow height-250" style="overflow-y: auto" >
                                <ul class="todolist">
                                    <c:forEach var="item" items="${updatePlatList}" varStatus="status">
                                        <li>
                                            <a  class="todolist-container" data-click="todolist"  href="/notice/platform/${item.noticeNo}" onclick="window.open(this.href, '_blank', 'width=1000, height=740, resizeable=no'); return false;">
                                                <div class="todolist-input" style="color:#2d353c;"> <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}</div>
                                                <div class="todolist-title">${item.title}</div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col-4 -->
                    <!-- begin col-4 -->
                    <!-- end col-4 -->
                    <!-- begin col-4 -->
                    <div class="col-xl-4 col-lg-4">
                        <!-- begin card -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <h4 class="panel-title">업데이트 내역</h4>
                            </div>
                            <div class="panel-body p-0 scroll-arrow height-250" style="overflow-y: auto" >
                                <ul class="todolist">
                                    <c:forEach var="item" items="${updateList}" varStatus="status">
                                        <c:if test="${item.platformType == 2 && item.programType == 1}">
                                            <li>
                                                <a  class="todolist-container" data-click="todolist"  href="/notice/update/${item.noticeNo}" onclick="window.open(this.href, '_blank', 'width=1000, height=740,resizeable=no'); return false;" class="todolist-container" data-click="todolist">
                                                    <div class="todolist-input" style="color:#2d353c;"> <c:set var = "string2" value = "${fn:substring(item.insertDate, 0, 11)}" />${string2}</div>
                                                    <div class="todolist-title"> ${item.title}</div>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>

        </c:if>

    </c:if>
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
    searchUserList();

    Chart.defaults.color = COLOR_DARK_LIGHTER
    Chart.defaults.font.family = 'Nanum Gothic',"나눔 고딕",'NanumGothic',"나눔고딕",'Malgun Gothic','맑은 고딕','MalgunGothic','맑은고딕'
    Chart.defaults.font.weight = 500;

    var ctx111 = document.getElementById('line-chart').getContext('2d');
    var lineChart = new Chart(ctx111, {
        type: 'line',
        data: {
            labels: label,
            datasets: [{
                label: '총주문량',
                borderColor: COLOR_GREY,
                pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                pointRadius: pointSize,
                borderWidth: 2,
                backgroundColor: COLOR_GREY_TRANSPARENT_1,
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
                            size: 15
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
        $.ajax({
            type: "POST",
            url: "${path}/api/main/chart/list?searchDate=" + searchDate,
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
            }
        });

        $.plot($("#interactive-chart3"), [{
            data: returnNewUser,
            label: "신규 고객1",
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 1, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, /*{
            data: returnCancelData,
            label: "반납대행 취소",
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }*/], {
            xaxis: {  ticks: userUserLabels, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
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
            }
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
            contentType: "application/json;",
            async: false,
            data :JSON.stringify(req),
            dataType: "json",
            success: function(data) {
                console.log(data)
                for(var i = 0 ; i < data.timeList.length ; i++) {
                    label.push(data.timeList[i].yyyymmdd)
                    totalCnt.push(data.timeList[i].totalCnt)
                    endCnt.push(data.timeList[i].sumcount)
            /*        cancelCnt.push(data.timeList[i].cancelCnt)*/
                }
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
