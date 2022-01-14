<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.franchiseeregistration1" text="API 테스트"/></title>
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
    #placesList .item .marker_15 {background-position: 0 -654px;}
    #pagination {margin:10px auto;text-align: center;}
    #pagination a {display:inline-block;margin-right:10px;}
    #pagination .on {font-weight: bold; cursor: default;color:#777;}
    .form-control {
        padding: 7px .35rem;
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement1" text="외부연동"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/workgroup/affilfranch/list"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise" text="렌터카 API"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.search.franchiseeregistration1" text="API 테스트"/><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.search.franchiseeregistration1" text="API 테스트"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>

<%--            <div class="tab-content">--%>
                <!-- begin tab-pane -->
<%--                <div class="tab-pane fade active show" id="default-tab-1">--%>
                    <div class="row width-full p-5">
                        <!-- begin col-8 -->
                        <!-- begin panel -->
                        <div class="panel panel-inverse width-full">
                            <!-- begin table-responsive -->
                            <div class="table-responsive m-l-5">
                                <div class="timeline-header m-t-10 m-b-10">
                                    <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                    <span><strong><spring:message code="list.detail.basicInformation" text="기본정보"/></strong></span>
                                </div>
                                <form class="dlvy_search_form"></form>
                                <form class="insert_form" id="insert_form">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <table class="table table-bordered">
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters1" text="렌터카 업체명"/></td>
                                        <td><input type="text" class="form-control width-200 storeName" name="storeName" value="" maxlength="30"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemerchantname1" text="렌터카 업체명을 입력해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.1" text="차량번호"/></td>
                                        <td>
                                            <select class="form-control width-200 carNum" name="carNum" >
                                                <c:forEach var="item" items="${carList}" varStatus="status">
                                                    <option value="${item.carNum}">${item.carModel}(${item.carNum})</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.chooseyourdefaultshippinggroup" text="차량번호를 선택해주세요"/></td>
                                    </tr>
                                 <%--   <tr>
                                        <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters1" text="고객전화번호"/></td>
                                        <td><input type="text" class="form-control width-200 custTel" name="custTel" value="" maxlength="12" numberOnly> </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemerchantname1" text="고객전화번호를 입력하세요."/></td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters1" text="운전자휴대폰번호"/></td>
                                        <td><input type="text" class="form-control width-200 custDriverTel1" name="custDriverTel1" value="" maxlength="12" numberOnly></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemerchantname1" text="운전자휴대폰번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters1" text="인수시간/반납시간"/></td>
                                        <td style="width:40%">
                                            <label>
                                                <input type="text" class="form-control startDtm background-white"  name="startDtm" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                &nbsp;
                                                <select class="form-control width-50 startDtmHH">
                                                    <c:forEach begin="0" end="23" var="cnt" step="1">
                                                        <option>
                                                            <c:if test="${cnt < 10}">
                                                                0${cnt}
                                                            </c:if>
                                                            <c:if test="${cnt >= 10}">
                                                                ${cnt}
                                                            </c:if>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                시
                                                <select class="form-control width-50 startDtmMM">
                                                    <c:forEach begin="0" end="50" var="cnt" step="10">
                                                        <option>
                                                            <c:if test="${cnt < 10}">
                                                                0${cnt}
                                                            </c:if>
                                                            <c:if test="${cnt >= 10}">
                                                                ${cnt}
                                                            </c:if>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                분
                                                ~
                                            </label>
                                            <br>
                                            <label>
                                                <input type="text" class="form-control endDtm background-white" name="endDtm" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                            <select class="form-control width-50 endDtmHH">
                                                <c:forEach begin="0" end="23" var="cnt" step="1">
                                                    <option>
                                                        <c:if test="${cnt < 10}">
                                                            0${cnt}
                                                        </c:if>
                                                        <c:if test="${cnt >= 10}">
                                                            ${cnt}
                                                        </c:if>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            시
                                            <select class="form-control width-50 endDtmMM">
                                                <c:forEach begin="0" end="50" var="cnt" step="10">
                                                    <option>
                                                        <c:if test="${cnt < 10}">
                                                            0${cnt}
                                                        </c:if>
                                                        <c:if test="${cnt >= 10}">
                                                            ${cnt}
                                                        </c:if>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            분
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemerchantname1" text="인수시간/반납시간을 선택해주세요."/></td>
                                    </tr>
                                </table>
                            </form>
                            </div>

                            <!-- end table-responsive -->
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/></button>
                            </div>
                        </div>
                        <!-- end panel -->
                        <!-- end col-8 -->
                    </div>
                </div>
<%--            </div>--%>
<%--        </div>--%>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<%--modal search end--%>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
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
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db9263cde5ebca76e7e4ead94532f163&libraries=services"></script>--%>
<%@include file="../../../common/include_kakao_map_js.jsp" %>
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c1a125dbfc0b31fb5f601512a4e58d0&libraries=services"></script>--%>


<%@include file="../../../common/include_number_only_js.jsp" %>
<script>

    let date = new Date();

    $(".startDtm").datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd",
        language: "kr"
    });
    $(".startDtm").datepicker('setDate', date);

    /*date.setMonth(date.getMonth() + 1, 1);*/
    $(".endDtm").datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd",
        language: "kr"
    });
    $(".endDtm").datepicker('setDate', date);



    $("input[name=dlvyMinAmt]").focus(function(){
    }).blur(function(){
        if($(this).val() == ""){
            $(this).val("0");
        }
    });



    $(() => {

        $(".btn_list").click(function() {
            location.href = "/extralink/rentcar/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/rentcar/insert/action";
            let _forms = $('.insert_form');
            let req = convertFormToObj(_forms);
            let registermsg = "<spring:message code="list.detail.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let registerfailmsg = "<spring:message code="list.detail.registrationfailed" text="등록에 실패하였습니다."/>";
            let enrollment = "<spring:message code="list.detail.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.detail.cancel" text="취소"/>";
            if (inputDataCheck(req)) {
                swal({
                    title: registermsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        enrollment
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        let storeName = $(".storeName").val();
                        let carNum = $(".carNum").val();
                        let custDriverTel1 = $(".custDriverTel1").val();
                        let reservStartDate =  $(".startDtm").val().replaceAll("-","").replaceAll("-","") + $(".startDtmHH").val() + $(".startDtmMM").val() ;
                        let reservEndDate = $(".endDtm").val().replaceAll("-","").replaceAll("-","") +  $(".endDtmHH").val() + $(".endDtmMM").val() ;

                        if(reservStartDate >= reservEndDate) {
                            alert("인수시간/반납시간을 확인해주세요.");
                            return;
                        }else {
                            $.ajax({
                                type: "POST",
                                url: url,
                                data: {
                                    storeName : storeName,
                                    carNum : carNum,
                                    custDriverTel1 : custDriverTel1,
                                    reservStartDate : reservStartDate,
                                    reservEndDate : reservEndDate
                                },
                                dataType: "json",
                                success: function (data) {
                                    if (data.result == 200) {
                                        alert("등록되었습니다.");
                                        location.href = "${path}/extralink/rentcar/list";
                                    } else {
                                        alert(registerfailmsg);
                                        return;
                                    }
                                }
                            });
                        }
                    }
                });
            }
        });
    });



    function inputDataCheck(args) {
        if (isNull(args.storeName)) {
            return alert_focus("storeName", "렌터카 업체명을 입력해주세요");
        } else if (isNull(args.custDriverTel1)) {
            return alert_focus("custDriverTel1", "운전자휴대폰번호를 입력해주세요.");
        }
        return true;
    }
</script>
</body>
</html>
