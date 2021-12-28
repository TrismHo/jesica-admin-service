<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

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
    <%--<div id="content" class="content">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb float-xl-right">
            <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
            <li class="breadcrumb-item active">대시보드</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">대시보드 <small></small></h1>
        <!-- end page-header -->

        <!-- begin row -->
        <div class="row">
            <!-- begin col-3 -->
            <div class="col-xl-3 col-md-6">
                <div class="widget widget-stats bg-blue">
                    <div class="stats-icon"><i class="fas fa-lg fa-fw m-r-10 fa-building"></i></div>
                    <div class="stats-info">
                        <h4>정상 총판</h4>
                        <p><fmt:formatNumber value="${branchChart.count_live_branch}" pattern="#,###" /></p>
                    </div>
                    <div class="stats-link">
                        <a href="${path}/workgroup/affiliated/list?brandNo=&startDate=2020-01-01&endDate=2021-04-07&&headName=&dataStatus=OK">더보기 <i class="fa fa-arrow-alt-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-xl-3 col-md-6">
                <div class="widget widget-stats bg-info">
                    <div class="stats-icon"><i class="far fa-lg fa-fw m-r-10 fa-building"></i></div>
                    <div class="stats-info">
                        <h4>정지 총판</h4>
                        <p>${branchChart.count_stop_branch}</p>
                    </div>
                    <div class="stats-link">
                        <a href="${path}/workgroup/affiliated/list?brandNo=&startDate=2020-01-01&endDate=2021-04-07&&headName=&dataStatus=STOP">더보기 <i class="fa fa-arrow-alt-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-xl-3 col-md-6">
                <div class="widget widget-stats bg-orange">
                    <div class="stats-icon"><i class="fas fa-lg fa-fw m-r-10 fa-building"></i></div>
                    <div class="stats-info">
                        <h4>정상 가맹점</h4>
                        <p><fmt:formatNumber value="${branchChart.count_live_store}" pattern="#,###" /></p>
                    </div>
                    <div class="stats-link">
                        <a href="${path}/workgroup/distributor/list?&startDate=2020-01-01&endDate=2021-04-07&dataStatus=OK&branchName=">더보기 <i class="fa fa-arrow-alt-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
            <!-- begin col-3 -->
            <div class="col-xl-3 col-md-6">
                <div class="widget widget-stats bg-red">
                    <div class="stats-icon"><i class="far fa-lg fa-fw m-r-10 fa-building"></i></div>
                    <div class="stats-info">
                        <h4>정지 가맹점</h4>
                        <p><fmt:formatNumber value="${branchChart.count_stop_store}" pattern="#,###" /></p>
                    </div>
                    <div class="stats-link">
                        <a href="${path}/workgroup/distributor/list?&startDate=2020-01-01&endDate=2021-04-07&dataStatus=STOP&branchName=">더보기 <i class="fa fa-arrow-alt-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- end col-3 -->
        </div>
        <!-- end row -->
        <!-- begin row -->
        <div class="row">
            <!-- begin col-8 -->
            <div class="col-xl-12">
                <!-- begin panel -->
                <div class="panel panel-inverse" data-sortable-id="index-1">
                    <div class="">
                        <div id="" class="" style="height: 1000px;">
                            <div class="vertical-box with-grid inbox bg-light">
                                <div class="vertical-box-column border-left" >
                                    <div class="vertical-box">
                                        <div class="vertical-box-row bg-white">
                                            <div class="vertical-box-cell">
                                                <div class="vertical-box-inner-cell">
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div data-scrollbar="true" data-height="100%" class="p-15" data-init="true" style="overflow: hidden; width: auto; height: 100%; border-bottom: 1px solid #ddd; border-right: 1px solid #ddd;">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="card border-0 text-truncate mb-3 bg-dark text-white">
                                                                    <div class="card-body">
                                                                        <div class="mb-3 text-grey">
                                                                            <b class="mb-3">가맹점 변화 추이</b>
                                                                            <span class="ml-2"><i class="fa fa-info-circle" data-toggle="popover" data-trigger="hover" data-title="Conversion Rate" data-placement="top" data-content="Percentage of sessions that resulted in orders from total number of sessions." data-original-title="" title=""></i></span>
                                                                        </div>

                                                                        <div id="interactive-chart" class="height-sm" style="background: #fff;"></div>

                                                                        <div class="mb-4 text-grey">
                                                                            <i class="fa fa-caret-down"></i> <span data-animation="number" data-value="0.50">0.00</span>% compare to last week
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-red f-s-8 mr-2"></i>
                                                                                Added to cart
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="262">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.79">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-warning f-s-8 mr-2"></i>
                                                                                Reached checkout
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="11">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.85">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-lime f-s-8 mr-2"></i>
                                                                                Sessions converted
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="57">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="2.19">0.00</span>%</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                             </div>
                                                            <div class="col-sm-6">
                                                                <div class="card border-0 text-truncate mb-3 bg-dark text-white">
                                                                    <div class="card-body">
                                                                        <div class="mb-3 text-grey">
                                                                            <b class="mb-3">주문콜 변화 추이</b>
                                                                            <span class="ml-2"><i class="fa fa-info-circle" data-toggle="popover" data-trigger="hover" data-title="Conversion Rate" data-placement="top" data-content="Percentage of sessions that resulted in orders from total number of sessions." data-original-title="" title=""></i></span>
                                                                        </div>

                                                                        <div id="interactive-chart2" class="height-sm" style="background: #fff;"></div>

                                                                        <div class="mb-4 text-grey">
                                                                            <i class="fa fa-caret-down"></i> <span data-animation="number" data-value="0.50">0.00</span>% compare to last week
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-red f-s-8 mr-2"></i>
                                                                                Added to cart
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="262">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.79">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-warning f-s-8 mr-2"></i>
                                                                                Reached checkout
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="11">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.85">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-lime f-s-8 mr-2"></i>
                                                                                Sessions converted
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="57">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="2.19">0.00</span>%</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="card border-0 text-truncate mb-3 bg-dark text-white">
                                                                    <div class="card-body">
                                                                        <div class="mb-3 text-grey">
                                                                            <b class="mb-3">배달대행 수행 변화 추이</b>
                                                                            <span class="ml-2"><i class="fa fa-info-circle" data-toggle="popover" data-trigger="hover" data-title="Conversion Rate" data-placement="top" data-content="Percentage of sessions that resulted in orders from total number of sessions." data-original-title="" title=""></i></span>
                                                                        </div>

                                                                        <div id="interactive-chart3" class="height-sm" style="background: #fff;"></div>

                                                                        <div class="mb-4 text-grey">
                                                                            <i class="fa fa-caret-down"></i> <span data-animation="number" data-value="0.50">0.00</span>% compare to last week
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-red f-s-8 mr-2"></i>
                                                                                Added to cart
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="262">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.79">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-warning f-s-8 mr-2"></i>
                                                                                Reached checkout
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="11">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.85">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-lime f-s-8 mr-2"></i>
                                                                                Sessions converted
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="57">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="2.19">0.00</span>%</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                             </div>
                                                            <div class="col-sm-6">
                                                                <div class="card border-0 text-truncate mb-3 bg-dark text-white">
                                                                    <div class="card-body">
                                                                        <div class="mb-3 text-grey">
                                                                            <b class="mb-3">고객유입 변화 추이</b>
                                                                            <span class="ml-2"><i class="fa fa-info-circle" data-toggle="popover" data-trigger="hover" data-title="Conversion Rate" data-placement="top" data-content="Percentage of sessions that resulted in orders from total number of sessions." data-original-title="" title=""></i></span>
                                                                        </div>

                                                                        <div id="interactive-chart4" class="height-sm" style="background: #fff;"></div>

                                                                        <div class="mb-4 text-grey">
                                                                            <i class="fa fa-caret-down"></i> <span data-animation="number" data-value="0.50">0.00</span>% compare to last week
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-red f-s-8 mr-2"></i>
                                                                                Added to cart
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="262">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.79">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex mb-2">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-warning f-s-8 mr-2"></i>
                                                                                Reached checkout
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="11">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="3.85">0.00</span>%</div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-flex">
                                                                            <div class="d-flex align-items-center">
                                                                                <i class="fa fa-circle text-lime f-s-8 mr-2"></i>
                                                                                Sessions converted
                                                                            </div>
                                                                            <div class="d-flex align-items-center ml-auto">
                                                                                <div class="text-grey f-s-11"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="57">0</span>%</div>
                                                                                <div class="width-50 text-right pl-2 f-w-600"><span data-animation="number" data-value="2.19">0.00</span>%</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end panel -->
            </div>
            <!-- end col-8 -->
        </div>
        <!-- end row -->
    </div>
    <!-- end #content -->



    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->
    </div>--%>
    <div id="content" class="content" style="background-color: #eee;">
        <!-- begin breadcrumb -->
        <ol class="breadcrumb float-xl-right">
            <li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- begin page-header -->
        <h1 class="page-header">Dashboard</h1>
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
       <%-- <div class="row">
            <!-- begin col-4 -->
            <div class="col-xl-4 col-lg-6">
                <!-- begin card -->
                <div class="card border-0 bg-dark-darker text-white mb-3">
                    <!-- begin card-body -->
                    <div class="card-body" style="background: no-repeat bottom right; background-image: url(../assets/img/svg/img-1.svg); background-size: auto 60%;">
                        <!-- begin title -->
                        <div class="mb-3 text-grey">
                            <div class="stats-link">
                                <b><spring:message code="dashboard.mostsalesoutlets" text="최다 판매 가맹점"/></b>
                                <div style="display: inline-block;" class="float-right">
                                    <a style="text-decoration: none" href="${path}/statistics/byfranchise/list"><spring:message code="list.detail.seemore" text="더보기"/><i class="fa fa-arrow-alt-circle-right"></i></a>
                                </div>
                            </div>
                        </div>

                        <!-- end title -->
                        <!-- begin sales -->
                        <c:if test="${rankStoreSell.size() > 0}">
                            ${rankStoreSell[0].storeName}
                            <h3 class="m-b-10"><span data-animation="number" data-value="${rankStoreSell[0].totalAmt}">0.00</span> <spring:message code="list.word.won" text="원"/></h3>
                        </c:if>
                        <c:if test="${rankStoreSell.size() <= 0}">
                            -
                            <h3 class="m-b-10"><span data-animation="number" data-value="0">0.00</span>  <spring:message code="list.word.won" text="원"/></h3>
                        </c:if>

                        <!-- end sales -->
                        <!-- begin percentage -->
                        <div class="text-grey m-b-1"><i class="fa fa-caret-up"></i> <span data-animation="number" data-value="45.76">0.00</span>%  <spring:message code="dashboard.increased" text="증가"/></div>
                        <!-- end percentage -->
                    </div>
                    <!-- end card-body -->
                    <!-- begin widget-list -->
                    <div class="widget-list widget-list-rounded inverse-mode">
                        <c:choose>
                            <c:when test="${rankStoreSell.size() > 0}">
                                <c:forEach items="${rankStoreSell}" var="item" varStatus="status" begin="0" step="1">
                                        <a href="#" class="widget-list-item rounded-0 p-t-3">
                                            <div class="widget-list-content">
                                                <div class="widget-list-title">
                                                        ${item.storeName} <span class="orangeColor">[S${item.storeNo}]</span>
                                                </div>
                                            </div>
                                            <div class="widget-list-action text-nowrap text-grey">
                                                <span data-animation="number" data-value="${item.totalAmt}">0.00</span> <spring:message code="list.word.won" text="원"/>
                                            </div>
                                        </a>
                                </c:forEach>
                                <c:if test="${rankStoreSell.size() < 5}">
                                    <c:forEach var="i" begin="1" end="${5-rankStoreSell.size()}">
                                        <a href="#" class="widget-list-item rounded-0 p-t-3">
                                            <div class="widget-list-content">
                                                <div class="widget-list-title">-</div>
                                            </div>
                                            <div class="widget-list-action text-nowrap text-grey">
                                                <span data-animation="number" data-value="0">0.00</span> <spring:message code="list.word.won" text="원"/>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="i" begin="1" end="5">
                                    <a href="#" class="widget-list-item rounded-0 p-t-3">
                                        <div class="widget-list-content">
                                            <div class="widget-list-title">-</div>
                                        </div>
                                        <div class="widget-list-action text-nowrap text-grey">
                                            <span data-animation="number" data-value="0">0.00</span> <spring:message code="list.word.won" text="원"/>
                                        </div>
                                    </a>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>


                    <!-- end widget-list -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col-4 -->
            <!-- end col-4 -->
            <!-- begin col-4 -->
            <div class="col-xl-4 col-lg-6">
                <!-- begin card -->
                <div class="card border-0 bg-dark text-white mb-3">
                    <!-- begin card-body -->
                    <div class="card-body">
                        <!-- begin title -->
                        <div class="mb-3 text-grey height-30">
                            <b><spring:message code="dashboard.mostsalesoutlets" text="최다 판매 물품"/></b>
                            <div style="display: inline-block;" class="float-right">
                                <a style="text-decoration: none" href="${path}/statistics/byfranchise/list"><spring:message code="list.detail.seemore" text="더보기"/> <i class="fa fa-arrow-alt-circle-right"></i></a>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${maxGoodsSell.size() > 0}">
                                <c:forEach items="${maxGoodsSell}" var="item" varStatus="status" step="1">
                                    <div class="d-flex align-items-center m-b-15">
                                        <div class="text-truncate">
                                            <div>${item.goodsName} <span class="orangeColor">[S${item.storeNo}]</span></div>
                                            <div class="text-grey"><fmt:formatNumber value="${item.totalAmt}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></div>
                                        </div>
                                        <div class="ml-auto text-center">
                                            <div class="f-s-13"><span data-animation="number" data-value="${item.cnt}">0</span></div>
                                            <div class="text-grey f-s-10"><spring:message code="dashboard.sold" text="판매"/></div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${maxGoodsSell.size() < 5}">
                                    <c:forEach var="i" begin="1" end="${5-maxGoodsSell.size()}">
                                        <div class="d-flex align-items-center m-b-15">
                                            <div class="text-truncate">
                                                <div>-</div>
                                                <div class="text-grey"> - <spring:message code="list.word.won" text="원"/></div>
                                            </div>
                                            <div class="ml-auto text-center">
                                                <div class="f-s-13"><span data-animation="number" data-value="0">0</span></div>
                                                <div class="text-grey f-s-10"><spring:message code="dashboard.sold" text="판매"/></div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="i" begin="1" end="5">
                                    <div class="d-flex align-items-center m-b-15">
                                        <div class="text-truncate">
                                            <div>-</div>
                                            <div class="text-grey"> 0 <spring:message code="list.word.won" text="원"/></div>
                                        </div>
                                        <div class="ml-auto text-center">
                                            <div class="f-s-13"><span data-animation="number" data-value="0">0</span></div>
                                            <div class="text-grey f-s-10"><spring:message code="dashboard.sold" text="판매"/></div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>




                        <!-- end title -->
                        <!-- begin product -->

                    </div>
                    <!-- end card-body -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col-4 -->
            <!-- begin col-4 -->
            <div class="col-xl-4 col-lg-6">
                <!-- begin card -->
                <div class="card border-0 bg-dark text-white mb-3">
                    <!-- begin card-body -->
                    <div class="card-body">
                        <!-- begin title -->
                        <div class="mb-3 text-grey height-30">
                            <b><spring:message code="dashboard.mostdeliverycourier" text="최다 배달 배송원"/></b>
                            <div style="display: inline-block;" class="float-right">
                                <a style="text-decoration: none" href="${path}/statistics/byfranchise/list"><spring:message code="list.detail.seemore" text="더보기"/>  <i class="fa fa-arrow-alt-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- end title -->
                        <!-- begin product -->
                        <c:choose>
                            <c:when test="${maxDlvyManChart.size() > 0}">
                                <c:forEach items="${maxDlvyManChart}" var="item" varStatus="status" step="1">
                                    <div class="d-flex align-items-center m-b-15">
                                        <div class="text-truncate">
                                            <div>${item.workerName} <span class="orangeColor">[${item.storeName}]</span> </div>
                                            <div class="text-grey"><fmt:formatNumber value="${item.totalAmt}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></div>
                                        </div>
                                        <div class="ml-auto text-center">
                                            <div class="f-s-13"><span data-animation="number" data-value="${item.cnt}">0</span></div>
                                            <div class="text-grey f-s-10"><spring:message code="dashboard.deliverycomplete" text="배달완료"/></div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${maxDlvyManChart.size() < 5}">
                                    <c:forEach var="i" begin="1" end="${5-maxDlvyManChart.size()}">
                                        <div class="d-flex align-items-center m-b-15">
                                            <div class="text-truncate">
                                                <div>-</div>
                                                <div class="text-grey"> - <spring:message code="list.word.won" text="원"/></div>
                                            </div>
                                            <div class="ml-auto text-center">
                                                <div class="f-s-13"><span data-animation="number" data-value="0">0</span></div>
                                                <div class="text-grey f-s-10"><spring:message code="dashboard.deliverycomplete" text="배달완료"/></div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="i" begin="1" end="5">
                                    <div class="d-flex align-items-center m-b-15">
                                        <div class="text-truncate">
                                            <div>-</div>
                                            <div class="text-grey"> 0  <spring:message code="list.word.won" text="원"/></div>
                                        </div>
                                        <div class="ml-auto text-center">
                                            <div class="f-s-13"><span data-animation="number" data-value="0">0</span></div>
                                            <div class="text-grey f-s-10"><spring:message code="dashboard.deliverycomplete" text="배달완료"/></div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        <!-- end product -->
                    </div>
                    <!-- end card-body -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col-4 -->
        </div>--%>

        <!-- begin row -->
        <div class="row">
            <!-- begin col-8 -->
            <div class="col-xl-6">
                <!-- begin panel -->
                <div class="panel panel-inverse" data-sortable-id="index-1">
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
                <div class="panel panel-inverse" data-sortable-id="index-6">
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



        let normal = "<spring:message code="list.script.normal" text="정상"/>";
        let stop = "<spring:message code="list.script.stop" text="정지"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let complete = "<spring:message code="list.script.complete" text="완료"/>";
        let ordercall = "<spring:message code="list.script.ordercall" text="주문콜"/>";
        let join = "<spring:message code="list.script.ordercall" text="가입"/>";
        let secession = "<spring:message code="list.script.ordercall" text="탈퇴"/>";
        var data1 = [
            [1, 40], [2, 50], [3, 60], [4, 60], [5, 60], [6, 65], [7, 75], [8, 90], [9, 100], [10, 105],
            [11, 110], [12, 110], [13, 120], [14, 130], [15, 135],[16, 145], [17, 132], [18, 123], [19, 135], [20, 150]
        ];
        var data2 = [
            [1, 10],  [2, 6], [3, 10], [4, 12], [5, 18], [6, 20], [7, 25], [8, 23], [9, 24], [10, 25],
            [11, 18], [12, 30], [13, 25], [14, 25], [15, 30], [16, 27], [17, 20], [18, 18], [19, 31], [20, 23]
        ];
        var data3 = [
            [1, 34], [2, 35], [3, 40], [4, 50], [5, 60], [6, 65], [7, 75], [8, 90], [9, 100], [10, 110],
            [11, 85], [12, 90], [13, 120], [14, 110], [15, 125],[16, 155], [17, 162], [18, 153], [19, 165], [20, 170]
        ];
        var data4 = [
            [1, 10],  [2, 6], [3, 10], [4, 12], [5, 18], [6, 20], [7, 25], [8, 23], [9, 24], [10, 25],
            [11, 18], [12, 30], [13, 25], [14, 25], [15, 30], [16, 27], [17, 20], [18, 18], [19, 31], [20, 23]
        ];
        var xLabel = [
            [1,''],[2,''],[3,'May&nbsp;15'],[4,''],[5,''],[6,'May&nbsp;19'],[7,''],[8,''],[9,'May&nbsp;22'],[10,''],
            [11,''],[12,'May&nbsp;25'],[13,''],[14,''],[15,'May&nbsp;28'],[16,''],[17,''],[18,'May&nbsp;31'],[19,''],[20,'']
        ];
        $.plot($("#interactive-chart"), [{
            data: data1,
            label: normal,
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, {
            data: data2,
            label: stop,
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            xaxis: {  ticks:xLabel, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
            yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0, max: 200 },
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
        $("#interactive-chart").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));
            if (item) {
                if (previousPoint !== item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed(2);

                    var content = item.series.label + " " + y;
                    showTooltip(item.pageX, item.pageY, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
            event.preventDefault();
        });


        $.plot($("#interactive-chart2"), [{
            data: data3,
            label: ordercall,
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, {
            data: data4,
            label: cancel,
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            xaxis: {  ticks:xLabel, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
            yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0, max: 200 },
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
        $("#interactive-chart2").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));
            if (item) {
                if (previousPoint !== item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed(2);

                    var content = item.series.label + " " + y;
                    showTooltip(item.pageX, item.pageY, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
            event.preventDefault();
        });

        $.plot($("#interactive-chart3"), [{
            data: data3,
            label: complete,
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, {
            data: data4,
            label: cancel,
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            xaxis: {  ticks:xLabel, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
            yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0, max: 200 },
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
        $("#interactive-chart4").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));
            if (item) {
                if (previousPoint !== item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed(2);

                    var content = item.series.label + " " + y;
                    showTooltip(item.pageX, item.pageY, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
            event.preventDefault();
        });

        $.plot($("#interactive-chart4"), [{
            data: data1,
            label: join,
            color: COLOR_BLUE,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }, {
            data: data2,
            label: secession,
            color: COLOR_GREEN,
            lines: { show: true, fill:false, lineWidth: 2 },
            points: { show: true, radius: 3, fillColor: COLOR_WHITE },
            shadowSize: 0
        }], {
            xaxis: {  ticks:xLabel, tickDecimals: 0, tickColor: COLOR_DARK_TRANSPARENT_2 },
            yaxis: {  ticks: 10, tickColor: COLOR_DARK_TRANSPARENT_2, min: 0, max: 200 },
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
        $("#interactive-chart4").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));
            if (item) {
                if (previousPoint !== item.dataIndex) {
                    previousPoint = item.dataIndex;
                    $("#tooltip").remove();
                    var y = item.datapoint[1].toFixed(2);

                    var content = item.series.label + " " + y;
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
