<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/></title>

</head>
<style>
    .inbox .nav-inbox>li:hover{
        background: #e4e7ea;
        color: #2d353c;
    }
    .content {
        margin-left: 220px;
        padding: 5px 30px;
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

    <!-- begin #content -->
</div>
<!-- end page container -->
    </div>--%>
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
                        <h4><spring:message code="dashboard.123" text="신규고객"/></h4>

                        <p data-animation="number" data-value="${userChart}"></p>
                    </div>
                    <div class="stats-link">
                        <a id="wait"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
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
        <div class="row">
            <!-- begin col-8 -->
            <div class="col-xl-6 ">
                <!-- begin panel -->
                <div class="panel panel-inverse" >
                    <div class="panel-heading">
                        <h4 class="panel-title"><spring:message code="dashboard.123" text="인수대행 변화추이"/></h4>
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
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
                        <h4 class="panel-title"><spring:message code="dashboard.123" text="반납대행 변화추이"/></h4>
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
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
                                <li>
                                    <a href="${path}/board/release/detail?noticeNo=${item.noticeNo}" class="todolist-container" data-click="todolist">
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
                                    <a href="${path}/board/platform/detail?noticeNo=${item.noticeNo}" class="todolist-container" data-click="todolist">
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
    <script src="../assets/js/demo/chart-js.demo.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->

<%-- Custom JS End--%>

<script>
    $(() => {

        $("#wait").on("click",function(){
           alert("작업중");
        });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip" class="flot-tooltip">' + contents + '건 </div>').css( {
                top: y - 45,
                left: x - 55
            }).appendTo("body").fadeIn(200);
        }

        var data1 = [];
        var data2 = [];
        var data3 = [];
        var data4 = [];
        var xLabel = [];
        var xLabel2 = [];
        $.ajax({
            type: "POST",
            url: "${path}/api/main/chart/list",
            contentType: "application/json;",
            async:false,
            dataType: "json",
            success: function(data) {
                for(var i = 0 ; i < data.getCallAllListType2040.length ; i++ ){
                    data1.push([i,data.getCallAllListType2040[i].cnt]);
                    if(i%3 == 0){
                        xLabel.push([i,data.getCallAllListType2040[i].dayDate]);
                    }else {
                        xLabel.push([i,""]);
                    }

                }
              for(var i = 0 ; i < data.getCallAllListType2041.length ; i++ ){
                    data2.push([i,data.getCallAllListType2041[i].cnt]);
                   /* if(i%5 == 0){
                        xLabel.push([i,data.getCallAllListType2041[i].dayDate]);
                    }else {
                        xLabel.push([i,'']);
                    }*/
                }


                for(var i = 0 ; i < data.getCallAllListType2140.length ; i++ ){
                    data3.push([i,data.getCallAllListType2140[i].cnt]);
                    xLabel2.push([i,data.getCallAllListType2140[i].dayDate]);
                }
                for(var i = 0 ; i < data.getCallAllListType2141.length ; i++ ){
                    data4.push([i,data.getCallAllListType2141[i].cnt]);
                    /*xLabel2.push([i,data.getCallAllListType2141[i].dayDate]);*/
                }
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
            data: data1,
            label: '인수대행 완료',
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, {
            data: data2,
            label: '인수대행 취소',
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            xaxis: {  ticks:xLabel, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
            yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0 },
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
            data: data3,
            label: "반납대행 완료",
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, {
            data: data4,
            label: "반납대행 취소",
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            xaxis: {  ticks:xLabel2, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
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
                margin: 10,
                noColumns: 1,
                show: true
            }
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
                    var content = item.series.label + " " +   Math.floor(y);
                    showTooltip(item.pageX, item.pageY, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
            event.preventDefault();
        });



    });
</script>
</body>
</html>
