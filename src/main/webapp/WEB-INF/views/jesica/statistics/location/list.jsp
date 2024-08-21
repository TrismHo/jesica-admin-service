<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 회원통계(지역)</title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | 회원통계(지역)</title>
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
        #map { width: 100%; height: 700px; }

        .border-right-bold{
            border-right: 2px solid #0a0a0a !important;
        }
        .border-left-bold{
            border-left: 2px solid #0a0a0a !important;
        }
        .legend>div {
            background: #fff !important;
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
                    <li class="breadcrumb-item active"><spring:message code="side.main4.sub1" text="회원통계(지역)"/></li>
                </ol>
                <h3 class="rix-title">회원통계<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch" class="formUserList">
                <div class="search-box">
                    <div class="inner-search-box p-15 ">
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
                                               <%-- <label style="margin-left: 30px;" >
                                                    <div class="btn-group ">
                                                        <a class="btn btn-white step-day <c:if test="${searchValue.dayType == '2' || searchValue.dayType == '' || searchValue.dayType == null}">active</c:if>" href="javascript:;" day="2">1일 단위 보기 </a>
                                                        <a class="btn btn-white step-day <c:if test="${searchValue.dayType=='1'}">active</c:if>"   href="javascript:;" day="1">7일 단위 보기 </a>
                                                    </div>
                                                </label>--%>
                                                <input type="hidden" class="selday"  name="selday" value="${searchValue.selday}">
                                                <input type="hidden" class="dayType"  name="dayType" value="${searchValue.dayType}">
                                                <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search1" text="조회"/><%--검색--%> </button>
                                                <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5"></div>
                                                <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5"></div>
                                                <input type="hidden" name="platformType" value="${searchValue.platformType}">
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
                   <%--<li class="nav-item">
                        <a href="#default-tab-3" data-toggle="tab" class="nav-link ">
                            <span class="d-sm-none"><spring:message code="list.detail.businessinformation" text="지역별그래프"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation" text="지역별그래프"/></span>
                        </a>
                    </li>--%>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="default-tab-1">
                        <div class="panel-body ">
                            <div class=" mx-auto"  style="display: inline-block; width: 100%">
                                <div class="table-responsive" >
                                    <div id="map" ></div>
                                </div>
                            </div>
                           <%-- <div class=" mx-auto"  style="display: inline-block; width: 30%" >
                                <div class="table-responsive">
                                    <table id="testTable" class="display table table-bordered w-100 table-striped">
                                        <thead>
                                        <tr class="text-center">
                                            <th rowspan="2">지역명</th>
                                            <th colspan="10">회원가입수</th>
                                        </tr>
                                        <tr class="text-center">
                                            <th >회원가입수</th>
                                            <th>가맹점추천</th>
                                            <th >APP가입</th>
                                        </tr>
                                        </thead>
                                        <tbody id="userTbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="default-tab-2" >
                        <div class="panel-body">
                            <div class=" mx-auto"  style="display: inline-block; width: 70%" >
                                <canvas id="line-chart" width="1168" height="400" style="display: block; box-sizing: border-box; height: 342px; width: 684px;"></canvas>
                            </div>
                            <div class=" mx-auto"  style="display: inline-block; width: 28%">
                                <canvas id="radar-chart" height="680" style="display: block; box-sizing: border-box; height: 513px; width: 513px;"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade " id="default-tab-3" >
                        <div class="panel-body">
                            <%--<div id="map"></div>--%>
                        </div>
                    </div>
                </div>
            </div>
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

    let label = [];
    let totalCnt = [];
    let locationList = [];
    let locationCntList = [];
    let extRecommStCodeCntF = [];
    let extAppUserCntF = [];
    let pointSize = 0;
    let mapList = [];


    Chart.defaults.color = COLOR_DARK_LIGHTER
    Chart.defaults.font.family = 'Nanum Gothic',"나눔 고딕",'NanumGothic',"나눔고딕",'Malgun Gothic','맑은 고딕','MalgunGothic','맑은고딕'
    Chart.defaults.font.weight = 500;

    var ctx2 = document.getElementById('radar-chart').getContext('2d');
    var radarChart = new Chart(ctx2, {
        /*type: 'polarArea',*/
        type: 'doughnut',
        /*type: 'pie',*/
        data: {
            datasets: [{
                data: locationCntList,
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(75, 192, 192)',
                    'rgb(255, 205, 86)',
                    'rgb(201, 203, 207)',
                    'rgb(54, 162, 235)'
                ]
            }],
            labels: locationList,
        },
        options: {
            plugins: {
                legend: {
                    position: 'right'
                }
            }
        }
    });
   var ctx = document.getElementById('line-chart').getContext('2d');
    var lineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: locationList,
            datasets: [/*{
                label: '회원가입수',
                borderColor: COLOR_GREY,
                pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                pointRadius: pointSize,
                borderWidth: 2,
                backgroundColor: COLOR_GREY_TRANSPARENT_1,
                data: totalCnt,
            }, */{
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

    let maplocation = null;
    // 메뉴가 선택되어 active가 된 후 이벤트


    searchUserList();

    function renderGeo() {

        var hanRiverPos = [35.865, 127.9745];
        var map = L.map('map',{
            zoomControl:false,
            dragging: false,
            boxZoom: false,
            doubleClickZoom: false
        }).setView(hanRiverPos, 7);
        /*
                L.tileLayer('https://xdworld.vworld.kr/2d/gray/service/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="http://www.vworld.kr/">오픈플랫폼</a>'
                }).addTo(map);*/
        L.tileLayer('https://tiles.osm.kr/hot/{z}/{x}/{y}.png', {
            maxZoom: 7,
            minZoom: 7,
            attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        var geojson;


        for (var i in geoData.features) {
            var feature = geoData.features[i];

            if (!feature.properties) continue;
            for(var j = 0 ; j < mapList.length ; j++) {
                if(geoData.features[i].properties.CTPRVN_CD == mapList[j].sysCode){
                    feature.properties.value = mapList[j].cnt;
                }
            }
            if(!feature.properties.value) {
                feature.properties.value = 0;
            }
         /*   feature.properties.value = Math.floor((Math.random() * (end - start + 1)) + start);*/
        }

        function getColor(v) {
            return v > 250 ? '#5b03d8' :
                        v > 200 ? '#5b03d8' :
                            v > 150 ? '#791cfb' :
                                v > 100 ? '#791cfb' :
                                    v > 50 ? '#b786fd' :
                                        v > 0 ? '#d5b9fd' : '#fff';
                             /*   v > 0 ? '#FEB24C' : '#FED976';*/
        }

        geojson = L.geoJson(geoData, {
            style: function (feature) {
                var v = feature.properties.value;
                var fColor = getColor(v);
                return {
                    "fillColor": fColor,
                    "weight": 2,
                    "opacity": 1,
                    "color": 'white',
                    "dashArray": '3',
                    "fillOpacity": 0.7
                }
            },
            onEachFeature: function(feature, layer) {
                layer.on({
                    "mouseover": function(e) {
                        var layer = e.target;

                        layer.setStyle({
                            weight: 5,
                            color: '#1AA160',
                            dashArray: '',
                            fillOpacity: 0.7
                        });

                        if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                            layer.bringToFront();
                        }

                        info.update(layer.feature.properties);
                    },
                    "mouseout":function(e) {
                        geojson.resetStyle(e.target);
                        info.update();
                    },
                    "click":function(e) {
                        map.fitBounds(e.target.getBounds());
                    }
                });
            }
        }).addTo(map);

// 정보 표시 컨트롤 추가
        var info = L.control();

        info.onAdd = function (map) {
            this._div = L.DomUtil.create('div', 'info');
            this._div.style = 'padding: 6px 8px;font: 14px/16px Arial, Helvetica, sans-serif;background: white;background: rgba(255,255,255,0.8);box-shadow: 0 0 15px rgba(0,0,0,0.2);border-radius: 5px;';
            this.update();
            return this._div;
        };

// method that we will use to update the control based on feature properties passed
        info.update = function (props) {
            this._div.innerHTML = '<h4 style="margin: 0 0 5px;color: #777;">전국 가입자수 통계</h4>' +  (props ?
                '<b>' + props.CTP_KOR_NM + '</b><br />' + props.value + ' 명'
                : '마우스를 올려보세요.');
        };

        info.addTo(map);

// 범례 표시 컨트롤 추가
        var legend = L.control({position: 'topleft'});

        legend.onAdd = function (map) {
            var div = L.DomUtil.create('div', 'info legend'),
                grades = [0, 20, 40, 60, 80, 100],
                labels = [];
            div.style = "padding: 6px 8px;background: white;background: rgba(255,255,255,0.8);line-height: 18px;color: #555;";
            div.innerHTML +=
                '<div class="table-responsive" style="background-color: #fff;">'+
                '<table id="testTable" class="display table table-bordered table-striped" style="width: 300px">'+
                '<thead>'+
                '<tr class="text-center">'+
                '<th rowspan="2">지역명</th>'+
                '<th colspan="10">회원가입</th>'+
                '</tr>'+
                '<tr class="text-center">'+
                ' <th >회원가입수</th>'+
                '<th>가맹점추천</th>'+
                '<th >APP가입</th>'+
                '</tr>'+
                ' </thead>'+
                '<tbody id="userTbody">'+
                '</tbody>'+
                ' </table>'+
                '</div>';

            return div;
        };

        var legend2 = L.control({position: 'bottomright'});

        legend2.onAdd = function (map) {
            var div2 = L.DomUtil.create('div', 'info legend'),
                grades = [0, 50, 100, 150, 200, 250],
                labels = [];
            div2.style = "padding: 6px 8px;background: white;background: rgba(255,255,255,0.8);line-height: 18px;color: #555;";

              for (var i = 0; i < grades.length; i++) {
                  div2.innerHTML +=
                      '<i style="width: 18px;height: 18px;float: left;margin-right: 8px;opacity: 0.7;background:' + getColor(grades[i] + 1) + '"></i> ' +
                      grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '명<br>' : '+');
              }
            return div2;
        };

        legend.addTo(map);
        legend2.addTo(map);

        map.attributionControl.addAttribution('');
    }

    $(() => {

        $("#testTable").DataTable({
           /* columnDefs: [
                {targets: "_all", className: "text-center"},
              /!*  {targets: [2,3,7,11],  visible: true, className: "border-left-bold" },
                {targets: [12], className: "border-right-bold" },*!/
            ],*/
            rowReorder: false,
            ordering:false,
            language : lang_set, //or lang_eng
            responsive: true,
            dom: '<"row">t<"row"<"col-sm-12 "B>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: [
                { extend: 'excel',text: ' &nbsp; 엑셀 다운로드', className: 'btn-sm fa fa-file-excel' },
            ],
            bPaginate : false,
        });

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
        });


        var day =  $(this).attr("day");
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
        $.ajax({
            type: "POST",
            url: "${path}/api/location/chart/list",
            contentType: "application/json;",
            async: false,
            data :JSON.stringify(req),
            dataType: "json",
            success: function(data) {
                mapList = data.timeList;
                renderGeo();
                $("#userTbody").html();
                for(var i = 0 ; i < data.timeList.length ; i++) {
                    locationList.push(data.timeList[i].codeName);
                    locationCntList.push(Number(data.timeList[i].cnt));
                    extRecommStCodeCntF.push(Number(data.timeList[i].extRecommStCodeCnt));
                    extAppUserCntF.push(Number(data.timeList[i].extAppUserCnt));
                    $("#userTbody").append(
                        "<tr class='text-center'>"+
                        "    <td>"+data.timeList[i].codeName+"</td>"+
                        "    <td>"+data.timeList[i].cnt+" 명</td>"+
                        "    <td>"+data.timeList[i].extRecommStCodeCnt+"</td>"+
                        "    <td>"+data.timeList[i].extAppUserCnt+" 명</td>"+
                        "</tr>"
                    )
                }
                if (data.timeList.length > 40) {
                    pointSize = 0;
                } else {
                    pointSize = 4;
                }

            }
        });
    }
</script>
</body>
</html>
