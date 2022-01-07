<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.registeringastreetrateplan" text="거리요금제 상세"/></title>

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
    #placesList .item .marker_13 {background-position: 0 -562px;}ㅛ
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
                        <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/><%--가맹점설정--%></a></li>
                        <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement.deliverystreet" text="거리요금"/><%--상품--%></a></li>
                        <li class="breadcrumb-item active"><spring:message code="list.detail.registeringastreetrateplan" text="거리요금제 상세"/></li>
                    </ol>
                    <h3 class="rix-title p-b-5"><spring:message code="list.detail.registeringastreetrateplan" text="거리요금제 상세"/></h3>
                </div>
                <div class="m-t-10">
                    <table class="table table-bordered">
                        <tr>
                            <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.distributormerchantname" text="총판/가맹점명"/></strong></td>
                            <td style="width:35%">
                                <span class="text-green" style="width:35%">[H${tbDlvyPriceCharge.head.headNo}]</span> ${tbDlvyPriceCharge.head.headName}
                                <span class="text-green">[B${tbDlvyPriceCharge.branch.branchNo}]</span> ${tbDlvyPriceCharge.branch.branchName}
                            </td>
                            <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.planname" text="요금제명"/></strong></td>
                            <td>
                                <span class="text-green">[D${tbDlvyPriceCharge.priceChargeNo}]</span> ${tbDlvyPriceCharge.priceChargeName}
                            </td>
                        </tr>
                    </table>
                </div>
                <ul class="nav nav-tabs m-t-10" id="sel_tab">
                     <li class="nav-item">
                          <a href="#default-tab-6"  data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="list.detail.blockdeliverytipsetting" text="블록 배달팁 설정"/></span>
                              <span class="d-sm-block d-none"><spring:message code="list.detail.blockdeliverytipsetting" text="블록 배달팁 설정"/></span>
                          </a>
                      </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="default-tab-6">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12">
                                <form class="insert_form" id="insert_form">
                                    <input type="hidden" class="priceChargeNo" name="priceChargeNo" value="${tbDlvyPriceCharge.priceChargeNo}">
                                    <table class="table table-bordered">
                                        <caption></caption>
                                            <colgroup>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                                <col width="10%"/>
                                            </colgroup>
                                        <tbody>
                                        <tr>
                                            <th colspan="9" class="tabla-custom-title"><spring:message code="list.detail.blockregistrationmodification" text="블록 등록/수정"/></th>
                                            </tr>
                                            <tr>
                                                <th class="bg-light text-center"><spring:message code="list.detail.dayoftheweek" text="요일"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.starttimehh" text="시작시간(HH)"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.endtimehh" text="종료시간(HH)"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.distancem" text="거리(M)"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.fee1krw" text="요금1(원)"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.fee2krw" text="요금2(원)"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.fee3krw" text="요금3(원)"/></th>
                                                <th class="bg-light"><spring:message code="list.detail.status" text="상태"/></th>
                                                <th class="bg-light"></th>
                                            </tr>
                                             <tr>
                                                <th class="bg-light">
                                                    <select class="form-control day" name="day">
                                                        <option value="1"><spring:message code="list.detail.monday" text="월요일"/></option>
                                                        <option value="2"><spring:message code="list.detail.tuesday" text="화요일"/></option>
                                                        <option value="3"><spring:message code="list.detail.wednesday" text="수요일"/></option>
                                                        <option value="4"><spring:message code="list.detail.thursday" text="목요일"/></option>
                                                        <option value="5"><spring:message code="list.detail.friday" text="금요일"/></option>
                                                        <option value="6"><spring:message code="list.detail.saturday" text="토요일"/></option>
                                                        <option value="7"><spring:message code="list.detail.sunday" text="일요일"/></option>
                                                    </select>
                                                </th>
                                                <td>
                                                    <select class="form-control width-full startTime" name="startTime" >
                                                        <c:forEach begin="00" end="24" var="hour">
                                                            <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if><spring:message code="list.detail.timestart" text="시 (시작)"/></option>
                                                            <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if><spring:message code="list.detail.timeend" text="시 (시작)"/></option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control width-full endTime" name="endTime">
                                                        <c:forEach begin="00" end="24" var="hour">
                                                            <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if><spring:message code="list.detail.timeend" text="시 (종료)"/></option>
                                                            <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if><spring:message code="list.detail.timeend" text="시 (종료)"/></option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                 <th>
                                                     <input type="text" class="form-control radius" name="radius" placeholder="<spring:message code="list.detail.distancelessthan" text="거리(미만)"/>" maxlength="7" numberOnly >
                                                 </th>
                                                <th>
                                                    <input type="text" class="form-control price1" name="price1" placeholder="<spring:message code="list.detail.fee1krw" text="요금1 (원)"/>" value="0" maxlength="7" numberOnly>
                                                </th>
                                                <th>
                                                    <input type="text" class="form-control price2" name="price2" placeholder="<spring:message code="list.detail.fee1krw" text="요금2 (원)"/>" value="0" maxlength="7" numberOnly>
                                                </th>
                                                <th>
                                                    <input type="text" class="form-control price3" name="price3" placeholder="<spring:message code="list.detail.fee1krw" text="요금3 (원)"/>" value="0" maxlength="7" numberOnly>
                                                </th>
                                                <th>
                                                    <select class="form-control dataStatus" name="dataStatus">
                                                        <option value="1"><spring:message code="list.detail.normal" text="정상"/></option>
                                                        <option value="2"><spring:message code="list.detail.stop" text="정지"/></option>
                                                    </select>
                                                </th>
                                                <td>
                                                    <button type="button" onclick="insPrice()" class="btn btn-white color"><spring:message code="list.detail.enrollment" text="등록"/></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <div class="block_list_div border " >
                                    <table class="table table-bordered table-sort block_list_table">
                                    <thead>
                                       <colgroup>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                           <col width="10%"/>
                                       </colgroup>
                                    </thead>
                                    <tbody class="addTbody">
                                    </tbody>
                                </table>
                            </div>

                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <form class="updatePrice" id="updatePrice">
        <input type="hidden" name="radius" class="radius" value="">
        <input type="hidden" name="day" class="day" value="">
        <input type="hidden" name="priceChargeNo" class="priceChargeNo" value="">
        <input type="hidden" name="price1" class="price1" value="">
        <input type="hidden" name="price2" class="price2" value="">
        <input type="hidden" name="price3" class="price3" value="">
        <input type="hidden" name="startTime" class="startTime" value="">
        <input type="hidden" name="endTime" class="endTime" value="">
        <input type="hidden" name="dataStatus" class="dataStatus" value="">
        <input type="hidden" name="priceNo" class="priceNo" value="">
    </form>

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
<%@include file="../../../common/include_number_only_js.jsp" %>
<%--<script src="../../assets/js/demo/jquery.tablesorter.min.js"></script>
<script src="../../assets/js/demo/jquery.tablesorter.js"></script>--%>
<script>

    $(() => {

        $(".price1, .price2, .price3").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });
        /*$(".block_list_table tbody").sortable()*/;
        priceList();

        $(".list_btn").on("click",function(){
            location.href = "${path}/workgroup/deliverystreet/list";
        })
    });

    function priceList() {

        let monday = "<spring:message code="list.script.monday" text="월요일"/>";
        let tuesday = "<spring:message code="list.script.tuesday" text="화요일"/>";
        let wednesday = "<spring:message code="list.script.wednesday" text="수요일"/>";
        let thursday = "<spring:message code="list.script.thursday" text="목요일"/>";
        let friday = "<spring:message code="list.script.friday" text="금요일"/>";
        let saturday = "<spring:message code="list.script.saturday" text="토요일"/>";
        let sunday = "<spring:message code="list.script.sunday" text="일요일"/>";
        let end = "<spring:message code="list.script.end" text="종료"/>";
        let start = "<spring:message code="list.script.start" text="시작"/>";
        let normal = "<spring:message code="list.script.normal" text="정상"/>";
        let stop = "<spring:message code="list.script.stop" text="정지"/>";
        let distancelesthan = "<spring:message code="list.script.distancelesthan" text="거리(미만)"/>";
        let fee1 = "<spring:message code="list.script.fee1" text="요금1"/>";
        let fee2 = "<spring:message code="list.script.fee2" text="요금2"/>";
        let fee3 = "<spring:message code="list.script.fee3" text="요금3"/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let nolistmsg = "<spring:message code="list.script.thereisnoregisteredlist" text="등록된 리스트가 없습니다."/>";

        $.ajax({
            type: "POST",
            url: "${path}/api/deliverystreet/dlvyPrice/list",
            data: {
                priceChargeNo: "${tbDlvyPriceCharge.priceChargeNo}"
            },
            success: function(data) {
                console.log(data)
                let sortList = [];
                var sortingField = "day";

                if(data.tbDlvyPriceList.length >= 1){
                    sortList =  data.tbDlvyPriceList.sort(function(a, b) { // 오름차순
                        return a[sortingField] - b[sortingField];
                    });
                } else {
                    sortList = data.tbDlvyPriceList;
                }


                $(".addTbody").html("");
                for(var i = 0 ; i < sortList.length ; i++){
                    let dataStatus = "";


                    let dayList = "";
                    let dayText = [monday,tuesday,wednesday,thursday,friday,saturday,sunday];
                    let startTime = "";
                    let endTime = "";
                    dayList =  "         <select class=\"form-control day upDay\" name=\"day\">\n";
                    for(let j = 0 ; j < dayText.length ; j ++) {
                        if (sortList[i].day == (j+1)) {
                            dayList = dayList +"<option value="+(j+1)+" selected>"+dayText[j]+"</option>\n";
                        } else {
                            dayList = dayList +"<option value="+(j+1)+">"+dayText[j]+"</option>\n";
                        }
                    }
                    dayList =  dayList+" </select>\n" ;



                    startTime ="        <select class=\"form-control width-full startTime\" name=\"startTime\" >\n";
                    for(let j = 0 ; j <= 24 ; j ++) {
                        let timeText = "";
                        if(j < 10){
                            timeText  = "0"+j;
                        } else {
                            timeText  = j;
                        }
                        if (sortList[i].startTime == j) {

                            startTime = startTime +"<option value="+j+" selected>"+timeText+" ("+start+")</option>\n";
                        } else {
                            startTime = startTime +"<option value="+j+">"+timeText+" ("+start+")</option>\n";
                        }
                    }
                    startTime = startTime +"        </select>\n" ;

                    endTime ="        <select class=\"form-control width-full endTime\" name=\"endTime\" >\n";
                    for(let j = 0 ; j <= 24 ; j ++) {
                        let timeText = "";
                        if(j < 10){
                            timeText  = "0"+j;
                        } else {
                            timeText  = j;
                        }
                        if (sortList[i].endTime == j) {
                            endTime = endTime +"<option value="+j+" selected>"+timeText+" ("+end+")</option>\n";
                        } else {
                            endTime = endTime +"<option value="+j+">"+timeText+" ("+end+")</option>\n";
                        }
                    }
                    endTime = endTime +"        </select>\n" ;


                    if (sortList[i].dataStatus == 1) {
                        dataStatus =      "        <select class=\"form-control dataStatus\">\n" +
                            "            <option value=\"1\" selected>"+normal+"</option>\n" +
                            "            <option value=\"2\">"+stop+"</option>\n" +
                            "        </select>\n" ;
                    }else if(sortList[i].dataStatus == 2){
                        dataStatus =      "        <select class=\"form-control dataStatus\">\n" +
                            "            <option value=\"1\" >\"+normal+\"</option>\n" +
                            "            <option value=\"2\" selected>\"+stop+\"</option>\n" +
                            "        </select>\n" ;
                    }

                    $(".addTbody").append("<tr class=\"priceTr"+sortList[i].priceNo+" border\">\n" +
                        "    <th class=\"bg-light\">\n" +
                        dayList +
                        "    </th>\n" +
                        "    <td>\n" +
                        startTime +
                        "    </td>\n" +
                        "    <td>\n" +
                        endTime +
                        "    </td>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control radius\" name=\"radius\" placeholder="+distancelesthan+" value="+sortList[i].radius+" maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control price1\" name=\"price1\" placeholder="+fee1+" value="+sortList[i].price1+" maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control price2\" name=\"price2\" placeholder="+fee2+" value="+sortList[i].price2+" maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control price3\" name=\"price3\" placeholder="+fee3+" value="+sortList[i].price3+" maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        dataStatus +
                        "    </th>\n" +
                        "    <td>\n" +
                        "        <button type=\"button\" onclick=\"upPrice("+sortList[i].priceNo+")\" class=\"btn btn-white color\">"+update+"</button>\n" +
                        "    </td>\n" +
                        "</tr>")
                }

                if(data.tbDlvyPriceList.length == 0) {
                    $(".addTbody").append(
                        "<tr class=\"\"  >\n" +
                        "<th class=\"text-center\" colspan=\"9\">"+nolistmsg+"</th>"+
                        "</tr>"
                    )
                }
            }
        });
    }

    function upPrice(priceNo) {
        let radius = $(".priceTr"+priceNo).find(".radius").val();
        let day = $(".priceTr"+priceNo).find(".day").val();
        let price1 = $(".priceTr"+priceNo).find(".price1").val();
        let price2 = $(".priceTr"+priceNo).find(".price2").val();
        let price3 = $(".priceTr"+priceNo).find(".price3").val();
        let startTime = $(".priceTr"+priceNo).find(".startTime").val();
        let endTime = $(".priceTr"+priceNo).find(".endTime").val();
        let dataStatus = $(".priceTr"+priceNo).find(".dataStatus").val();

        let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let updatefailmsg = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        $(".updatePrice").find(".priceNo").val(priceNo);
        $(".updatePrice").find(".priceChargeNo").val(${tbDlvyPriceCharge.priceChargeNo});
        $(".updatePrice").find(".radius").val(radius);
        $(".updatePrice").find(".day").val(day);
        $(".updatePrice").find(".price1").val(price1);
        $(".updatePrice").find(".price2").val(price2);
        $(".updatePrice").find(".price3").val(price3);
        $(".updatePrice").find(".startTime").val(startTime);
        $(".updatePrice").find(".endTime").val(endTime);
        $(".updatePrice").find(".dataStatus").val(dataStatus);

        let _forms = $('.updatePrice');
        let req = convertFormToObj(_forms);
        let url = "${path}/api/deliverystreet/price/update";
        swal({
            title: updatemsg,
            icon: "warning",
            buttons: [
                cancel,
                update
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                var formData = new FormData(document.getElementById('updatePrice'));
                formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.result == 200) {
                            alert(updatesussmsg);
                            priceList();
                        } else {
                            alert(updatefailmsg);
                            return;
                        }
                    }
                });
            }
        });
    }

    function insPrice() {
        let url = "${path}/api/deliverystreet/price/insert";
        let price1 = $(".price1").val();
        if(price1 == "" || price1 == null) {
            $(".weatherCharge").val(0);
        }
        let price2 = $(".price2").val();
        if(price2 == "" || price2 == null) {
            $(".weatherCharge").val(0);
        }
        let price3 = $(".price3").val();
        if(price3 == "" || price3 == null) {
            $(".weatherCharge").val(0);
        }

        let _forms = $('.insert_form');
        let req = convertFormToObj(_forms);

        let registmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
        let registfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let enrollment = "<spring:message code="list.script.enrollment" text="등록"/>";
        if (inputDataCheck(req)) {
            swal({
                title: registmsg,
                icon: "warning",
                buttons: [
                    cancel,
                    enrollment
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData = new FormData(document.getElementById('insert_form'));
                    formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                priceList();
                            } else {
                                alert(registfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    }






    function inputDataCheck(args) {
        let distancemsg = "<spring:message code="list.script.pleaseenterthdistance" text="거리를 입력해주세요"/>";
        let fee1msg = "<spring:message code="list.script.pleaseenterrate1" text="요금1을 입력해주세요"/>";
        if (isNull(args.radius)) {
            return alert_focus("radius",distancemsg);
        } else if (isNull(args.price1)) {
            return alert_focus("price1", fee1msg);
        }
        return true;
    }









</script>
</body>
</html>
