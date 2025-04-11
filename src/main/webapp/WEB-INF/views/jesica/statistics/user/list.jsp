<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 회원통계</title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae  | 회원통계</title>
    </c:if>

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
        .page-header-fixed {
            padding-top: 32px;
        }
        #map { height: 600px; }

        .border-right-bold{
            border-right: 2px solid #0a0a0a !important;
        }
        .border-left-bold{
            border-left: 2px solid #0a0a0a !important;
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
            <form name="frmSearch" id="frmSearch" class="formUserList">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch">
                                    <input type="hidden" name="platformType" value="${searchValue.platformType}">
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

                                                   <%-- <select class="form-control" name="paltform" style="margin-right: 30px;" >
                                                        <option value="">전체</option>
                                                        <option value="jesicar">제시카</option>
                                                        <option value="anion">양파오더</option>
                                                        <option value="none">비플랫폼</option>
                                                    </select>--%>
                                                </label>
                                                <label >
                                                    <div class="btn-group ">
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '30' || searchValue.selday == '' || searchValue.selday == null}">active</c:if>"   day="30" href="javascript:;">최근 1개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '180'}">active</c:if>" day="180"  href="javascript:;">최근 6개월 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '360'}">active</c:if>" day="360" href="javascript:;">최근 1년 </a>
                                                        <a class="btn btn-white select-day <c:if test="${searchValue.selday == '720'}">active</c:if>" day="720"  href="javascript:;">최근 2년 </a>
                                                    </div>
                                                </label>
                                                <label style="margin-left: 30px;" >
                                                    <div class="btn-group ">
                                                        <a class="btn btn-white step-day active" href="javascript:;" day="2">1일 단위 보기 </a>
                                                        <a class="btn btn-white step-day "   href="javascript:;" day="1">7일 단위 보기 </a>
                                                    </div>
                                                </label>
                                                <input type="hidden" class="selday"  name="selday" value="${searchValue.selday}">
                                                <input type="hidden" class="dayType"  name="dayType" value="${searchValue.dayType}">
                                          </td>
                                            <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod1" text="앱코드"/><%--등록기간--%></strong></td>
                                            <td colspan="3">
                                                <c:if test="${empty appCode}">
                                                    <select id="appCode" name="appCode" class="form-control w-50" >
                                                        <option value="">전체</option>
                                                        <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                            <option value="${appCodeList.sysCode}"<c:if test="${tbNoticePlatform.appCode == appCodeList.sysCode}">selected</c:if>>${appCodeList.sysCode} (${appCodeList.codeName})</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${!empty appCode}">
                                                    <input type="text" class="form-control " readonly value="${sessionScope.sessionKey.appCodeName}">
                                                    <input type="hidden" class="form-control appCode" name="appCode" readonly value="${appCode}">
                                                </c:if>
                                            </td>
                                           <%-- <td class="bg-light" style="width:5%"><strong><spring:message code="list.search.registrationperiod1" text="총판명/코드"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                            <td style="width:40%">

                                                <label>
                                                   <select class="form-control" name="extBrCode" style="margin-right: 30px;" >
                                                       <option value="">전체</option>
                                                       <c:forEach var="item" items="${brCodeList}" varStatus="status">
                                                           <option <c:if test="${item.brCode == searchValue.extBrCode}">selected</c:if> value="${item.brCode}">${item.brName}</option>
                                                       </c:forEach>
                                                   </select>
                                                <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5"></div>
                                            </td>--%>
                                            <%--<td class="bg-light" style="width:5%"><strong><spring:message code="list.search.registrationperiod1" text="지역코드"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                            <td style="width:40%">
                                                <label>
                                                    <select class="form-control" name="addrCode" style="margin-right: 30px;" >
                                                        <option value="">전체</option>
                                                        <c:forEach var="item" items="${brCodeList}" varStatus="status">
                                                            <option <c:if test="${item.brCode == searchValue.extBrCode}">selected</c:if> value="${item.brCode}">${item.brName}</option>
                                                        </c:forEach>
                                                    </select>


                                            </td>--%>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body" >
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                            <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        </a>
                    </li>
                   <li class="nav-item">
                        <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.businessinformation" text="통계그래프"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation" text="통계그래프"/></span>
                        </a>
                    </li>
                   <li class="nav-item">
                        <a href="#default-tab-3" data-toggle="tab" class="nav-link ">
                            <span class="d-sm-none"><spring:message code="list.detail.businessinformation" text="지역별그래프"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation" text="지역별그래프"/></span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="default-tab-1">
                        <div class="table-responsive">
                                <table id="testTable" class="display table table-bordered w-100 table-striped">
                                    <thead>
                                    <tr class="text-center">
                                        <th rowspan="2">날짜</th>
                                        <th rowspan="2">요일</th>
                                        <th colspan="10">회원통계</th>
                                    </tr>
                                    <tr class="text-center">
                                        <th >회원가입수</th>
                                        <th class="border-left-bold">Android</th>
                                        <th>%</th>
                                        <th >ios</th>
                                        <th class="border-right-bold">%</th>
                                        <th>남성회원</th>
                                        <th>%</th>
                                        <th>여성회원</th>
                                        <th class="border-right-bold">%</th>
                                        <th>가맹점추천</th>
                                        <th class="border-right-bold">APP가입</th>
                                        <%--<th>제시카</th>
                                        <th>%</th>
                                        <th>양파오더</th>
                                        <th>%</th>
                                        <th>비플랫폼</th>
                                        <th>%</th>--%>
                                    </tr>
                                    </thead>
                                    <tbody id="userTbody">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    <div class="tab-pane fade" id="default-tab-2" >
                        <div class="panel-body">
                            <div class=" mx-auto"  style="display: inline-block; width: 58%" >
                                <canvas id="line-chart" width="1168" height="400" style="display: block; box-sizing: border-box; height: 342px; width: 684px;"></canvas>
                            </div>
                            <div class=" mx-auto"  style="display: inline-block; width: 20%">
                                <canvas id="radar-chart" height="680" style="display: block; box-sizing: border-box; height: 513px; width: 513px;"></canvas>
                            </div>
                            <div class=" mx-auto"  style="display: inline-block; width: 20%">
                                <canvas id="radar-chart2" height="680" style="display: block; box-sizing: border-box; height: 513px; width: 513px;"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade " id="default-tab-3" >
                        <div class="panel-body">
                            <div id="map"></div>
                        </div>
                    </div>
                </div>
            </div>
         <%-- <div class="panel-body">
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
        </div>
        <!-- end panel -->
    </div>
    <!-- end #content -->
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<script src="${path}/assets/plugins/chart.js/dist/Chart.min_new.js"></script>

<link rel="stylesheet"href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>

<script src="${path}/js/geoJson.js"></script>
<%--<script src="${path}/assets/js/demo/chart-js.demo.js" type="text/javascript"></script>--%>
<%--modal search end--%>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    let table = null;

    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            }
            else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    var newExportAction = function (e, dt, button, config) {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {
            var self = this;
            var oldStart = dt.settings()[0]._iDisplayStart;

            dt.one('preXhr', function (e, s, data) {
                // Just this once, load all data from the server...
                data.start = 0;
                data.length = 2147483647;

                dt.one('preDraw', function (e, settings) {
                    // Call the original action function
                    oldExportAction(self, e, dt, button, config);

                    dt.one('preXhr', function (e, s, data) {
                        // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                        // Set the property to what it was before exporting.
                        settings._iDisplayStart = oldStart;
                        data.start = oldStart;
                    });

                    // Reload the grid with the original page. Otherwise,
                    // API functions like table.cell(this) don't work properly.
                    setTimeout(dt.ajax.reload, 0);

                    // Prevent rendering of the full data to the DOM
                    return false;
                });
            });

            // Requery the server with the new one-time export settings
            dt.ajax.reload();
        }
    };
    let label = [];
    let totalCnt = [];
    let iosTotal =[];
    let iosCnt = 0;
    let maleCnt = [];
    let femaleCnt = [];
    let extRecommStCodeCntF = [];
    let extAppUserCntF = [];
    let totalMaleCnt = [];
    let totalFemaleCnt = [];
    let androidTotal = [];
    let androidCnt = 0;
    let phoneTotal = [];
    let pointSize = 4;
    searchUserList();

    Chart.defaults.color = COLOR_DARK_LIGHTER
    Chart.defaults.font.family = 'Nanum Gothic',"나눔 고딕",'NanumGothic',"나눔고딕",'Malgun Gothic','맑은 고딕','MalgunGothic','맑은고딕'
    Chart.defaults.font.weight = 500;

    var ctx2 = document.getElementById('radar-chart2').getContext('2d');
    var radarChart = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['성별 구분'],
            datasets: [{
                label: '남성회원',
                borderColor: [COLOR_AQUA_TRANSPARENT_7],
                pointRadius: 4,
                borderWidth: 2,
                pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                backgroundColor:  [COLOR_AQUA_TRANSPARENT_3],
                data: totalMaleCnt
            },{
                label: '여성회원',
                borderColor: [COLOR_GREEN_TRANSPARENT_7],
                pointRadius: 4,
                borderWidth: 2,
                pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                backgroundColor:  [COLOR_GREEN_TRANSPARENT_3],
                data: totalFemaleCnt
            }]
        },
        options : {
            plugins: {
                legend: {
                    labels: {
                        // This more specific font property overrides the global property
                        font: {
                            size: 15
                        }
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            let label = context.dataset.label || '';

                            if (label) {
                                label += ': ';
                            }
                            if (context.parsed.y !== null) {
                                label += ' '+context.parsed.y +'대';
                            }
                            return label;
                        }
                    }
                }
            },
            scales: {
                x: {
                    display: true,
                    title: {
                        display: false,
                        text: '회원가입 구분(남성, 여성)'
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
                            return value +' 대'
                        }
                    }
                }
            }
        }
    });
        var ctx2 = document.getElementById('radar-chart').getContext('2d');
        var radarChart2 = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['os별 구분'],
                datasets: [{
                    label: 'ios',
                    borderColor: [COLOR_AQUA_TRANSPARENT_7],
                    pointRadius: 4,
                    borderWidth: 2,
                    pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                    backgroundColor:  [COLOR_AQUA_TRANSPARENT_3],
                    data: iosTotal
                },{
                    label: 'android',
                    borderColor: [COLOR_GREEN_TRANSPARENT_7],
                    pointRadius: 4,
                    borderWidth: 2,
                    pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                    backgroundColor:  [COLOR_GREEN_TRANSPARENT_3],
                    data: androidTotal
                }]
            },
            options : {
                plugins: {
                    legend: {
                        labels: {
                            // This more specific font property overrides the global property
                            font: {
                                size: 15
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';

                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed.y !== null) {
                                    label += ' '+context.parsed.y +'대';
                                }
                                return label;
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: false,
                            text: '회원가입 구분(남성, 여성)'
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
                                return value +' 대'
                            }
                        }
                    }
                }
            }
        });

        var ctx = document.getElementById('line-chart').getContext('2d');
        var lineChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: label,
                datasets: [{
                    label: '회원가입수',
                    borderColor: COLOR_GREY,
                    pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                    pointRadius: pointSize,
                    borderWidth: 2,
                    backgroundColor: COLOR_GREY_TRANSPARENT_1,
                    data: totalCnt,
                }, {
                    label: "가맹점추천",
                    borderColor: COLOR_AQUA,
                    pointBackgroundColor: COLOR_AQUA_TRANSPARENT_6,
                    pointRadius: pointSize,
                    borderWidth: 2,
                    backgroundColor:  COLOR_AQUA_TRANSPARENT_1,
                    data: extRecommStCodeCntF
                }, {
                    label: 'APP가입',
                    borderColor: COLOR_RED_LIGHTER,
                    pointBackgroundColor: COLOR_RED_TRANSPARENT_6,
                    pointRadius: pointSize,
                    borderWidth: 2,
                    backgroundColor:  COLOR_RED_TRANSPARENT_1,
                    data: extAppUserCntF
                }]
            },
            options : {
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
                            label: function(context) {
                                let label = context.dataset.label || '';

                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed.y !== null) {
                                    label += ' '+context.parsed.y +'명';
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
                                return value +' 명'
                            }
                        }
                    }
                }
            }
        });

    // 메뉴가 선택되어 active가 된 후 이벤트
  /*  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        if(!maplocation){
            renderGeo();
        }
    });*/

    $(() => {
        let hideDw = {};
        //7일단위 보기 - 요일 hide
        if($(".dayType").val() == "1"){
            hideDw = {targets: [1], visible: false  }
        } else {
            hideDw = {targets: [1],  visible: true }
        }
        let downloadAble = `${downloadAble}`;
        let roleType = `${sessionScope.sessionKey.roleType}`;
        let downloadChk = "1";
        if(roleType != 0){
            if(downloadAble == 1){
                downloadChk = "";
            }
        } else {
            downloadChk = ""
        }

        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/user/chart/page","A6",downloadChk, false, {
            columns: [
                {data: "yyyymmdd"},
                {data: "dw"},
                {data: "totalCnt"},
                {data: "androidCnt"},
                {data: "androidPer"},
                {data: "iosCnt" },
                {data: "iosPer" },
                {data: "maleCnt" },
                {data: "malePer" },
                {data: "femaleCnt" },
                {data: "femalePer" },
                {data: "extRecommStCodeCnt" },
                {data: "extAppUserCnt" },
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                hideDw,
                {targets: [2,3,7,11],  visible: true, className: "border-left-bold" },
                {targets: [2,3,5,7,9,11,12],render: function (data) {
                        if(data){
                            return data + "명";
                        } else {
                            return "0 명";
                        }

                    }},
                {targets: [1],render: function (data) {
                        if(data == "1"){
                            return  '일요일';
                        } else if(data== "2") {
                            return '월요일';
                        } else if(data == "3") {
                            return '화요일';
                        } else if(data == "4") {
                            return '수요일';
                        } else if(data == "5") {
                            return '목요일';
                        } else if(data == "6") {
                            return '금요일';
                        } else if(data == "7") {
                            return '토요일';
                        }

                    }},
                {targets: [4,6,8,10],render: function (data) {
                        if(data){
                            return data + "%";
                        } else {
                            return "%";
                        }

                    }},
                {targets: [12], className: "border-right-bold" },
            ],
        });


        /*$("#testTable").DataTable({
            columnDefs: [
                hideDw,
                {targets: [2,3,7,11],  visible: true, className: "border-left-bold" },
                {targets: [12], className: "border-right-bold" },
            ],
            rowReorder: true,
            language : lang_set, //or lang_eng
            responsive: true,
            dom: '<"row"<"col-sm-12"l B><"col-sm-7"fr>>t<"row"<"col-sm-5"i><"col-sm-7"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                /!*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*!/
                /!* { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*!/
                downloadMap,
                /!*{ extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*!/
            ],
            bPaginate : false,
        });*/

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
        $(".step-day").on("click",function(){

            $(".step-day").removeClass("active");
            $(".dayType").val($(this).attr("day"));
            $(this).addClass("active");
            let hideDw = {};
            let columns = [];
            //7일단위 보기 - 요일 hide
            if($(".dayType").val() == "1"){
                console.log(table.columns(1).visible(false))
            } else {
                console.log(table.columns(1).visible(true))
            }
            var numCols = table.columns().nodes().length;
            for(var i=0; i<numCols; i++) {table.column(i).search(''); }
            table.column().draw();
            lineChart.data.labels = [];
            lineChart.data.datasets.forEach((dataset) => {
                dataset.data = [];
            });
            radarChart.data.labels = [];
            radarChart.data.datasets.forEach((dataset) => {
                dataset.data = [];
            });
            radarChart2.data.labels = [];
            radarChart2.data.datasets.forEach((dataset) => {
                dataset.data = [];
            });
            searchUserList();

        });


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



    function searchUserList() {
        let req = convertFormToObj($('form.formUserList'));
        label = [];
        totalCnt = [];
        maleCnt = [];
        femaleCnt = [];
        extRecommStCodeCntF = [];
        extAppUserCntF = [];
        totalMaleCnt = [];
        totalFemaleCnt = [];
        iosTotal = [];
        iosCnt = 0;
        androidCnt = 0;
        androidTotal = [];

        $.ajax({
            type: "POST",
            url: "${path}/api/user/chart/list",
            contentType: "application/json;",
            async: false,
            data :JSON.stringify(req),
            dataType: "json",
            success: function(data) {
                let totalMaleCntF = 0;
                let totalFemaleCntF = 0;
              /*  $("#userTbody").html();*/
                console.log(data)
                let dayType = $(".dayType").val();
                for(var i = 0 ; i < data.timeList.length ; i++) {
                    console.log(data.timeList[i].yyyymmdd)
                    if(dayType == "1"){
                        label.push(data.timeList[i].start + " ~ " + data.timeList[i].end )
                    } else {
                        label.push(data.timeList[i].yyyymmdd)
                    }

                     totalCnt.push(data.timeList[i].totalCnt)
                     maleCnt.push(data.timeList[i].maleCnt)
                     femaleCnt.push(data.timeList[i].femaleCnt)
                    extRecommStCodeCntF.push(data.timeList[i].extRecommStCodeCnt)
                    extAppUserCntF.push(data.timeList[i].extAppUserCnt)

                    totalMaleCntF = totalMaleCntF+data.timeList[i].maleCnt;
                    totalFemaleCntF = totalFemaleCntF+data.timeList[i].femaleCnt;

                    iosCnt = iosCnt+ data.timeList[i].iosCnt;
                    androidCnt = androidCnt+ data.timeList[i].androidCnt;
                }




                totalMaleCnt.push(totalMaleCntF)
                totalFemaleCnt.push(totalFemaleCntF)
                iosTotal.push(iosCnt)
                androidTotal.push(androidCnt)
                if (data.timeList.length > 40) {
                    pointSize = 0;
                } else {
                    pointSize = 4;
                }


          /*      radarChart.update();
                radarChart2.update();*/
                radarChart.data = {
                    labels: ['성별 구분'],
                    datasets: [{
                        label: '남성회원',
                        borderColor: [COLOR_AQUA_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                        backgroundColor:  [COLOR_AQUA_TRANSPARENT_3],
                        data: totalMaleCnt
                    },{
                        label: '여성회원',
                        borderColor: [COLOR_GREEN_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                        backgroundColor:  [COLOR_GREEN_TRANSPARENT_3],
                        data: totalFemaleCnt
                    }]
                }
                radarChart2.data = {
                    labels: ['os별 구분'],
                    datasets: [{
                        label: 'ios',
                        borderColor: [COLOR_AQUA_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                        backgroundColor:  [COLOR_AQUA_TRANSPARENT_3],
                        data: iosTotal
                    },{
                        label: 'android',
                        borderColor: [COLOR_GREEN_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                        backgroundColor:  [COLOR_GREEN_TRANSPARENT_3],
                        data: androidTotal
                    }]
                }


                lineChart.data = {
                    labels: label,
                    datasets: [{
                        label: '회원가입수',
                        borderColor: COLOR_GREY,
                        pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                        pointRadius: pointSize,
                        borderWidth: 2,
                        backgroundColor: COLOR_GREY_TRANSPARENT_1,
                        data: totalCnt,
                    }, {
                        label: "가맹점추천",
                        borderColor: COLOR_AQUA,
                        pointBackgroundColor: COLOR_AQUA_TRANSPARENT_6,
                        pointRadius: pointSize,
                        borderWidth: 2,
                        backgroundColor:  COLOR_AQUA_TRANSPARENT_1,
                        data: extRecommStCodeCntF
                    }, {
                        label: 'APP가입',
                        borderColor: COLOR_RED_LIGHTER,
                        pointBackgroundColor: COLOR_RED_TRANSPARENT_6,
                        pointRadius: pointSize,
                        borderWidth: 2,
                        backgroundColor:  COLOR_RED_TRANSPARENT_1,
                        data: extAppUserCntF
                    }]};


                lineChart.update();
                radarChart.update();
                radarChart2.update();
            }
        });
    }

    function serarchForm() {
        lineChart.data.labels = [];
        lineChart.data.datasets.forEach((dataset) => {
            dataset.data = [];
        });
        radarChart.data.labels = [];
        radarChart.data.datasets.forEach((dataset) => {
            dataset.data = [];
        });
        radarChart2.data.labels = [];
        radarChart2.data.datasets.forEach((dataset) => {
            dataset.data = [];
        });
        searchUserList();

        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) {table.column(i).search(''); }
        /*  var searchType = $("#searchType").val();
          var searchValue = $("#searchValue").val();*/
        table.column().draw();
        /*let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {

        }*/
    }
</script>
</body>
</html>
