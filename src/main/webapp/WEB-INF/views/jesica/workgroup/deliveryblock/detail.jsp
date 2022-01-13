<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>EATSUDA | <spring:message code="list.detail.blockrateplandetails" text="블록요금제 상세"/></title>
</head>
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
    .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
    .map_wrap {position:relative;width:100%;height:300px;}
    #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
    .bg_white {background:#fff;}
    #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
    #menu_wrap .option{text-align: center;}
    #menu_wrap .option p {margin:10px 0;}
    #menu_wrap .option button {margin-left:5px;}
    #placesList li {list-style: none;}
    #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
    #placesList .item span {display: block;margin-top:4px;}
    #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    #placesList .item .info{padding:10px 0 10px 55px;}
    #placesList .info .gray {color:#8a8a8a;}
    #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
    #placesList .info .tel {color:#009900;}
    #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
    #placesList .item .marker_1 {background-position: 0 -10px;}
    #placesList .item .marker_2 {background-position: 0 -56px;}
    #placesList .item .marker_3 {background-position: 0 -102px}
    #placesList .item .marker_4 {background-position: 0 -148px;}
    #placesList .item .marker_5 {background-position: 0 -194px;}
    #placesList .item .marker_6 {background-position: 0 -240px;}
    #placesList .item .marker_7 {background-position: 0 -286px;}
    #placesList .item .marker_8 {background-position: 0 -332px;}
    #placesList .item .marker_9 {background-position: 0 -378px;}
    #placesList .item .marker_10 {background-position: 0 -423px;}
    #placesList .item .marker_11 {background-position: 0 -470px;}
    #placesList .item .marker_12 {background-position: 0 -516px;}
    #placesList .item .marker_13 {background-position: 0 -562px;}
    #placesList .item .marker_14 {background-position: 0 -608px;}
    #placesList .item .marker_15 {background-position: 0 -654px;}
    #pagination {margin:10px auto;text-align: center;}
    #pagination a {display:inline-block;margin-right:10px;}
    #pagination .on {font-weight: bold; cursor: default;color:#777;}

    .map_wrap {width: 100%;position: relative;}
    .modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
    .getdata{position: absolute;top: 370px;left: 10px;z-index: 1;}
    #drawingMap, #map {width: 100%;height: 648px;}
    #map {margin-top: 10px;}

    .block_list_div {
        width: 100%;
        height: 300px;
        overflow: auto;
    }

</style>
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
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement.deliveryblock" text="블럭요금"/><%--상품--%></a></li>
                    <li class="breadcrumb-item"><spring:message code="list.detail.blockrateplandetails" text="블록요금제 상세"/>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.blockrateplandetails" text="블록요금제 상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.headquartersdistributor" text="본사/총판"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green" style="width:35%">[H${tbDlvyAreaCharge.head.headNo}]</span> ${tbDlvyAreaCharge.head.headName}
                            <span class="text-green">[B${tbDlvyAreaCharge.branch.branchNo}]</span> ${tbDlvyAreaCharge.branch.branchName}

                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.classificationofplan" text="요금제 구분"/></strong></td>
                        <td>
                            <span class="text-green">[D${tbDlvyAreaCharge.areaChargeNo}]</span> ${tbDlvyAreaCharge.areaChargeName}
                        </td>
                    </tr>
                </table>
            </div>
            <ul class="nav nav-tabs m-t-10" id="sel_tab">
                <li class="nav-item">
                    <a href="#default-tab-6"  data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.blockplan" text="블록요금제"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.blockplan" text="블록요금제"/></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show" id="default-tab-6">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6">
                            <form class="insert_form" id="insert_form">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${tbDlvyAreaCharge.insertUserId}">
                                <input type="hidden" class="areaChargeNo" name="areaChargeNo" value="${tbDlvyAreaCharge.areaChargeNo}">
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <colgroup>
                                        <%--<col width="10%"/>--%>
                                        <col width="20%"/>
                                        <col width="20%"/>
                                        <col width="15%"/>
                                        <col width="20%"/>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th colspan="6" class="tabla-custom-title"><spring:message code="list.detail.blockregistrationmodification" text="블록 등록/수정"/></th>
                                    </tr>
                                    <tr>
                                        <%-- <th class="bg-light text-center">선택</th>--%>
                                        <th class="bg-light"><spring:message code="list.detail.blockname" text="블록명"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.price" text="금액"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.status" text="상태"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.sort" text="정렬"/></th>
                                    </tr>
                                    <tr>
                                        <%-- <th class="bg-light"></th>--%>
                                        <td><input type="text" class="form-control-width-custom areaName" name="areaName" maxlength="80"></td>
                                        <th>
                                            <input type="text" class="form-control-width-custom areaPrice" name="areaPrice" value="0" maxlength="7" numberOnly>
                                        </th>
                                        <th>
                                            <select class="form-control-width-custom dataStatus" name="dataStatus">
                                                <option value="1"><spring:message code="list.detail.normal" text="정상"/></option>
                                                <option value="2"><spring:message code="list.detail.stop" text="정지"/></option>
                                            </select>
                                        </th>
                                        <td>
                                            <button type="button" class="btn btn-purple resetBtn"><i class="fa fa-cog"></i> <spring:message code="list.detail.reset" text="초기화"/>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                            <div class="float-right m-b-20">
                                <div class="btn-group">
                                    <button type="button" onclick="insBlock()" class="btn btn-white border-right-0 color"><spring:message code="list.detail.enrollment" text="등록"/></button>
                                    <button type="button" onclick="selectOverlay('POLYGON')" class="btn btn-white btn-draw"><spring:message code="list.detail.drawing" text="그리기"/></button>
                                    <button type="button" class="btn btn-white btn-draw-hide d-none"><spring:message code="list.detail.hide" text="숨기기"/></button>
                                </div>
                            </div>
                            <table class="table table-bordered table-sort ">
                                <thead>
                                <%-- <tr>
                                     <th colspan="6" class="tabla-custom-title">등록 리스트</th>
                                 </tr>--%>
                                <colgroup>
                                    <col width="10%"/>
                                    <col width="20%"/>
                                    <col width="30%"/>
                                    <col width="15%"/>
                                    <col width="25%"/>
                                    <col width="2px"/>
                                </colgroup>
                                <tr>
                                    <th colspan="7" class="tabla-custom-title"><spring:message code="list.detail.registrationlist" text="등록 리스트"/></th>
                                </tr>
                                <tr>
                                    <th class="bg-light text-center"><spring:message code="list.detail.selection" text="선택"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.blockname" text="블록명"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.price" text="금액"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.status" text="상태"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.sort" text="정렬"/></th>
                                </tr>
                                </thead>
                            </table>
                            <div class="block_list_div border" >
                                <table class="table table-bordered table-sort block_list_table">
                                    <thead>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="20%"/>
                                        <col width="30%"/>
                                        <col width="15%"/>
                                        <col width="25%"/>
                                        <col width="2px"/>
                                    </colgroup>
                                    </thead>
                                    <tbody class="addTbody">
                                    </tbody>
                                </table>
                            </div>
                            <input type="button" class="show_btn block_show_hide btn btn-white p-5 float-right m-t-10" onclick="sortSave()" value="<spring:message code="list.detail.savesort" text="정렬 저장"/>">
                        </div>
                        <div class="col-xl-6 col-lg-6 height-full">
                            <table class="table table-condensed table-bordered">
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="map_wrap mapRefreshBtn" style="height: 650px;">
                                            <div id="drawingMap"></div>
                                            <p class="modes">
                                                <input type="button" class="show_btn block_show_hide btn btn-white p-5" onclick="showBlock()" value="<spring:message code="list.detail.viewallblocks" text="모든 블록 보기"/>">
                                                <input type="button" class="hide_btn block_show_hide btn btn-primary  p-5" onclick="hideBlock()" value="<spring:message code="list.detail.closeallblocks" text="모든 블록 닫기"/>">
                                            </p>
                                        </div>

                                    </td>
                                </tr>

                                </tbody></table>

                        </div>

                        <div class="m-l-5 m-t-5">
                            <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<%--<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>--%>
<script src="${path}/assets/plugins/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${path}/assets/plugins/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${path}/assets/plugins/blueimp-gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-audio.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-video.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-validate.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-ui.js"></script>
<script src="${path}/assets/plugins/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>

<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c1a125dbfc0b31fb5f601512a4e58d0&libraries=services,drawing"></script>
<%@include file="../../../common/include_number_only_js.jsp" %>
<script src="../../assets/js/demo/jquery.tablesorter.min.js"></script>
<script src="../../assets/js/demo/jquery.tablesorter.js"></script>
<script>


    let marker;
    let drawingManager = null;
    $(() => {
        $(".areaPrice").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });

        drawingMap.relayout();
        blockList();
        /*$(".block_list_table tbody").sortable();*/

        $(document).on("click",".resetBtn",function(){
            $(".areaName").val("");
            $(".areaPrice").val("");
            undo();
        });
    });

    function blockList() {
        $.ajax({
            type: "POST",
            url: "${path}/api/deliveryblock/dlvyArea/list",
            data: {
                areaChargeNo: "${tbDlvyAreaCharge.areaChargeNo}"
            },
            success: function(data) {
                let sortList = [];
                let wonmsg = "<spring:message code="list.script.won" text="원"/>";
                let stopmsg = "<spring:message code="list.script.stop" text="정지"/>";
                let normalmsg = "<spring:message code="list.script.normal" text="정상"/>";
                let noregisteredlist = "<spring:message code="list.script.thereisnoregisteredlist" text="등록된 리스트가 없습니다."/>";
                var sortingField = "viewOrder";

                if(data.tbDlvyAreaList.length >= 1){
                    sortList =  data.tbDlvyAreaList.sort(function(a, b) { // 오름차순
                        return a[sortingField] - b[sortingField];
                    });
                } else {
                    sortList = data.tbDlvyAreaList;
                }

                $(".addTbody").html("");

                for(var i = 0 ; i < sortList.length ; i++){
                    let dataStatus = "";
                    if (sortList[i].dataStatus == 1) {
                        dataStatus =      stopmsg;
                    }else if(sortList[i].dataStatus == 2){
                        dataStatus =      normalmsg;
                    }

                    $(".addTbody").append(
                        "<tr class=\"\" areaNo="+sortList[i].areaNo+" viewOrder="+sortList[i].viewOrder+" areaChargeNo="+sortList[i].areaChargeNo+" >\n" +
                        "    <th><input type=\"radio\"></th>\n" +
                        "    <td>"+data.tbDlvyAreaList[i].areaName+"</td>\n" +
                        "    <td>\n" +
                        +sortList[i].areaPrice +" "+ wonmsg +
                        /*
                                                "        <input type=\"text\" class=\"form-control-width-custom\" value="+sortList[i].areaPrice+">\n" +
                        */
                        "    </td>\n" +
                        "    <td>\n" +
                        dataStatus +
                        "    </td>\n" +
                        "    <td>\n" +
                        "        <div class=\"d-table m-auto\">\n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\" onclick=\"moveTop(this)\">\n" +
                        "                <span class=\"fa fa-angle-double-up align-sub\"></span>\n" +
                        "            </a>\n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\"  onclick=\"moveUp(this)\">\n" +
                        "                <span class=\"fa fa-angle-up align-sub\"></span></a>\n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\"  onclick=\"moveDown(this)\">\n" +
                        "                <span class=\"fa fa-angle-down align-sub\"></span>\n" +
                        "            </a>\n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\" onclick=\"moveBottom(this)\">\n" +
                        "                <span class=\"fa fa-angle-double-down align-sub\"></span>\n" +
                        "            </a>\n" +
                        "        </div>\n" +
                        "    </td>\n" +
                        "</tr>"
                    )
                }

                if(data.tbDlvyAreaList.length == 0) {
                    $(".addTbody").append(
                        "<tr class=\"\"  >\n" +
                        "<th class=\"text-center\" colspan=\"5\">"+noregisteredlist+"</th>"+
                        "</tr>"
                    )
                }
            }
        });
    }




    // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places and predicted search terms.
    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">


    let lng = "";
    let lat = "";
    //최초 표시
    $.ajax({
        type: "POST",
        url: "${path}/api/deliveryblock/dlvyAreaGeo/list",
        async:false,
        data: {
            areaChargeNo: "${tbDlvyAreaCharge.areaChargeNo}"
        },
        success: function(data) {
            let tbDlvyAreaGeoList = data.tbDlvyAreaGeoList;

            if(tbDlvyAreaGeoList.length > 0 ){
                for (var j = 0 ; j < tbDlvyAreaGeoList.length ; j ++) {
                    for (var i = 0 ; i < tbDlvyAreaGeoList[j].length ; i ++) {
                        lng = tbDlvyAreaGeoList[0][0].lng;
                        lat = tbDlvyAreaGeoList[0][0].lat;
                    }
                }
            } else {
                lat = 37.5116707;
                lng = 126.874092;
            }
        }
    });



    // Drawing Manager로 도형을 그릴 지도 div
    var drawingMapContainer = document.getElementById('drawingMap'),
        drawingMap = {
            center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };



    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap);
    overlays = []; // 지도에 그려진 도형을 담을 배열
    var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
        map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
        drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
            kakao.maps.drawing.OverlayType.MARKER,
            kakao.maps.drawing.OverlayType.POLYLINE,
            kakao.maps.drawing.OverlayType.RECTANGLE,
            kakao.maps.drawing.OverlayType.CIRCLE,
            kakao.maps.drawing.OverlayType.POLYGON
        ],
        // 사용자에게 제공할 그리기 가이드 툴팁입니다
        // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
        guideTooltip: ['draw', 'drag', 'edit'],
        markerOptions: { // 마커 옵션입니다
            draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다
            removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다
        },
        polylineOptions: { // 선 옵션입니다
            draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
            removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
            editable: true, // 그린 후 수정할 수 있도록 설정합니다
            strokeColor: '#39f', // 선 색
            hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
            hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
        },
        rectangleOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f', // 외곽선 색
            fillColor: '#39f', // 채우기 색
            fillOpacity: 0.5 // 채우기색 투명도
        },
        circleOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f',
            fillColor: '#39f',
            fillOpacity: 0.5
        },
        polygonOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f',
            fillColor: '#39f',
            fillOpacity: 0.5,
            hintStrokeStyle: 'dash',
            hintStrokeOpacity: 0.5
        }
    };

    // 위에 작성한 옵션으로 Drawing Manager를 생성합니다
    var manager = new kakao.maps.drawing.DrawingManager(options);

    // 버튼 클릭 시 호출되는 핸들러 입니다
    function selectOverlay(type) {
        undo();
        // 그리기 중이면 그리기를 취소합니다
        manager.cancel();

        // 클릭한 그리기 요소 타입을 선택합니다
        manager.select(kakao.maps.drawing.OverlayType[type]);
    }


    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
    function removeOverlays() {
        var len = overlays.length, i = 0;

        for (; i < len; i++) {
            overlays[i].setMap(null);
        }

        overlays = [];
    }

    // Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
    function drawMarker(markers) {
        var len = markers.length, i = 0;

        for (; i < len; i++) {
            var marker = new kakao.maps.Marker({
                map: drawingMap,
                position: new kakao.maps.LatLng(markers[i].y, markers[i].x),
                zIndex: markers[i].zIndex
            });

            overlays.push(marker);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
    function drawPolyline(lines) {
        var len = lines.length, i = 0;

        for (; i < len; i++) {
            var path = pointsToPath(lines[i].points);
            var style = lines[i].options;
            var polyline = new kakao.maps.Polyline({
                map: drawMap,
                path: path,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight
            });

            overlays.push(polyline);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 사각형을 아래 지도에 표시하는 함수입니다
    function drawRectangle(rects) {
        var len = rects.length, i = 0;

        for (; i < len; i++) {
            var style = rects[i].options;
            var rect = new kakao.maps.Rectangle({
                map: map,
                bounds: new kakao.maps.LatLngBounds(
                    new kakao.maps.LatLng(rects[i].sPoint.y, rects[i].sPoint.x),
                    new kakao.maps.LatLng(rects[i].ePoint.y, rects[i].ePoint.x)
                ),
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(rect);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 원을 아래 지도에 표시하는 함수입니다
    function drawCircle(circles) {
        var len = circles.length, i = 0;

        for (; i < len; i++) {
            var style = circles[i].options;
            var circle = new kakao.maps.Circle({
                map: map,
                center: new kakao.maps.LatLng(circles[i].center.y, circles[i].center.x),
                radius: circles[i].radius,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(circle);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 다각형을 아래 지도에 표시하는 함수입니다
    function drawPolygon(polygons) {
        var len = polygons.length, i = 0;

        for (; i < len; i++) {
            var path = pointsToPath(polygons[i].points);
            var style = polygons[i].options;
            var polygon = new kakao.maps.Polygon({
                map: drawingMap,
                path: path,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(polygon);
        }
    }

    // Drawing Manager에서 가져온 데이터 중
    // 선과 다각형의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다
    function pointsToPath(points) {
        var len = points.length,
            path = [],
            i = 0;

        for (; i < len; i++) {
            var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
            path.push(latlng);
        }

        return path;
    }




    function inputDataCheck(args) {
        if (isNull(args.areaName)) {
            return alert_focus("storeName", "블록명을 입력해주세요");
        } else if (isNull(args.areaPrice)) {
            return alert_focus("storeTel", "금액을를 입력해주세요");
        }
        return true;
    }

    function undo() {
        // 그리기 요소를 이전 상태로 되돌립니다
        manager.undo();
    }

    // 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
    // Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
    function getDataFromDrawingMap() {
        // Drawing Manager에서 그려진 데이터 정보를 가져옵니다
        var data = manager.getData();

        // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
        removeOverlays();

        // 지도에 가져온 데이터로 도형들을 그립니다
        /* drawMarker(data[kakao.maps.drawing.OverlayType.MARKER]);
         drawPolyline(data[kakao.maps.drawing.OverlayType.POLYLINE]);
         drawRectangle(data[kakao.maps.drawing.OverlayType.RECTANGLE]);
         drawCircle(data[kakao.maps.drawing.OverlayType.CIRCLE]);*/
        drawPolygon(data[kakao.maps.drawing.OverlayType.POLYGON]);
        return data;
    }

    function insBlock() {
        var data = manager.getData();
        let url = "${path}/api/deliveryblock/block/insert";
        let _forms = $('.insert_form');
        let req = convertFormToObj(_forms);

        let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
        let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
        let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        if (inputDataCheck(req)) {
            swal({
                title: confirmmsg,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData = new FormData(document.getElementById('insert_form'));
                    formData.append("tbDlvyArea",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    formData.append("tbDlvyAreaList",  new Blob([JSON.stringify(data.polygon[0].points)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                removeOverlays();
                                blockList();
                            } else {
                                alert(confirmfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    }

    function showBlock() {
        removeOverlays();
        $(".show_btn").removeClass("btn-white");
        $(".show_btn").addClass("btn-primary");
        $(".hide_btn").addClass("btn-white");
        $(".hide_btn").removeClass("btn-primary");

        $.ajax({
            type: "POST",
            url: "${path}/api/deliveryblock/dlvyAreaGeo/list",
            data: {
                areaChargeNo: "${tbDlvyAreaCharge.areaChargeNo}"
            },
            success: function(data) {


                let polygons = [];
                let points = [];
                let tbDlvyAreaGeoList = data.tbDlvyAreaGeoList;

                for (var j = 0 ; j < tbDlvyAreaGeoList.length ; j ++) {
                    points = [];
                    for (var i = 0 ; i < tbDlvyAreaGeoList[j].length ; i ++) {
                        points.push({x: tbDlvyAreaGeoList[j][i].lng, y: tbDlvyAreaGeoList[j][i].lat})
                    }
                    polygons.push({points :points });
                }

                var len = tbDlvyAreaGeoList.length, i = 0;

                for (; i < len; i++) {
                    polygons.push({x: tbDlvyAreaGeoList[i].lat , y : tbDlvyAreaGeoList[i].lng})
                    var path = pointsToPath(polygons[i].points);
                    var polygon = new kakao.maps.Polygon({
                        map: drawingMap,
                        path: path,
                        fillColor: "#39f",
                        fillOpacity: 0.5,
                        strokeColor: "#39f",
                        strokeOpacity: 1,
                        strokeStyle: "solid",
                        strokeWeight: 3
                    });
                    overlays.push(polygon);
                }
            }
        });
    }

    function hideBlock() {
        $(".show_btn").removeClass("btn-primary");
        $(".show_btn").addClass("btn-white");
        $(".hide_btn").addClass("btn-primary");
        $(".hide_btn").removeClass("btn-white");
        removeOverlays();
    }

    $(document).on("click",".mapRefreshBtn",function(){
        drawingMap.relayout();
    });

    $(document).on("click",".nav-link",function(){
        drawingMap.relayout();
    });

    // 메뉴가 선택되어 active가 된 후 이벤트
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        e.target // 현재 설정된 tab
        e.relatedTarget // 이전에 설정된 탭
        map.relayout();
        drawingMap.relayout();
    });

    function moveUp(el){
        var $tr = $(el).closest('tr');
        $tr.prev().before($tr);
    }

    function moveTop(el){
        var $tr = $(el).closest('tr');
        $tr.closest('table').find('tr:first').before($tr);
        // $tr.closest('table') - 클릭한 요소의 부모 table 요소
        // .find('tr:first').before($tr) - 첫번째 tr 찾아서 그 앞에 클릭한 tr 요소 넣기(이동)
    }

    function moveDown(el){
        var $tr = $(el).closest('tr');
        $tr.next().after($tr);
    }

    function moveBottom(el){
        var $tr = $(el).closest('tr');
        $tr.closest('table').find('tr:last').after($tr);
    }

    function sortSave(){
        let sortList = [];

        let savemsg = "<spring:message code="list.script.saved" text="저장되었습니다."/>";
        let savefailmsg = "<spring:message code="list.script.savefailed" text="저장에 실패하였습니다."/>";

        $('.addTbody tr').each(function (index, item) {
            sortList.push({areaNo:Number($(this).attr("areaNo")),viewOrder:Number($(this).attr("viewOrder")),areaChargeNo:Number($(this).attr("areaChargeNo")),newViewOrder:Number((index+1))})
        });

        var formData = new FormData(document.getElementById('insert_form'));
        formData.append("sortList",  new Blob([JSON.stringify(sortList)], {type:"application/json"}));
        $.ajax({
            type: "POST",
            url: "${path}/api/deliveryblock/dlvyArea/resort",
            data: formData,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.result == 200) {
                    alert(savemsg);
                    removeOverlays();
                    blockList();
                } else {
                    alert(savefailmsg);
                    return;
                }
            }
        });

        /* $.ajax({
             type: "POST",
             url: "${path}/api/deliveryblock/dlvyArea/resort",
            data: {
                sortList: sortList
            },
            success: function(data) {
            }
        });*/
    }


</script>
</body>
</html>
