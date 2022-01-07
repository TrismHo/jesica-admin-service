<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.registeringastreetrateplan" text="거리요금제 등록"/></title>
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
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement.deliverystreet" text="거리요금"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.registeringastreetrateplan" text="거리요금제 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.registeringastreetrateplan" text="거리요금제 등록"/></h3>
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
                            <span><strong><spring:message code="list.detail.basicInformation" text="기본 정보"/></strong></span>
                        </div>
                        <form class="insert_form" id="insert_form">
                        <%--    <input type="hidden" class="headNo" name="headNo"  value="">
                            <input type="hidden" class="branchNo" name="branchNo"  value="">
                            <input type="hidden" class="storeNo" name="storeNo" value="">--%>
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.affiliatedworkgroup" text="소속 업무그룹"/></td>
                                    <td style="width:60%;">
                                       <%-- <label>
                                            <input type="text" data-toggle="modal" data-target="#head_search_modal"  placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-150" readonly>

                                        </label>
                                        <label>
                                            <input type="text" data-toggle="" data-target="#branch_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-150" readonly>

                                        </label>
                                        <label>
                                            <input type="text" data-toggle="" data-target="#store_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-150" readonly>

                                        </label>--%>
                                           <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-150 " readonly>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-150" readonly>
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-150 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-150" readonly>
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-150 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-150" disabled>
                                               </label>
                                           </c:if>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectyouraffiliatedheadofficeanddistributor" text="소속 제휴본사와 총판을 선택하세요."/></td>
                                </tr>
                                <%--<tr>
                                    <td>가게구분</td>
                                    <td>
                                        <select class="form-control">
                                            <option>음식점</option>
                                            <option>편의점</option>
                                            <option>마트</option>
                                            <option>퀵</option>
                                            <option>화물</option>
                                            <option>콜벤</option>
                                            <option>당일배송</option>
                                        </select>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="bg-light"> * <spring:message code="list.detail.planname" text="요금제 이름"/></td>
                                    <td><input type="text" class="form-control width-200 areaChargeName" name="priceChargeName" value="" maxlength="80"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.entertheplanname" text="요금제 이름"/></td>
                                </tr>
                                <input type="hidden" name="dataStatus" value="1">
                                <%--
                                                                    <tr>
                                                                        <td class="bg-light height-50">직영가맹점 여부</td>
                                                                        <td>
                                                                            <label class="">
                                                                                <input type="radio" name="masterYn" value="0" class="align-bottom masterYn" checked> 일반가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                                                            </label>
                                                                            <label class="m-l-10 ">
                                                                                <input type="radio" name="masterYn" value="1" class="align-bottom masterYn"> 직영가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                                                            </label>
                                                                        </td>
                                                                        <td class="text-danger-darker">직영 가맹점인지 선택하세요.</td>
                                                                    </tr>
                                --%>
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
    <%@include file="headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="storeSearch.jsp" %>
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
<script src="${path}/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src=""></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" />

<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    $(() => {

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            let noheadmsg = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    if(data.searchHeadList.length == 0 || data.searchHeadList == null){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noheadmsg+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            $(".searchHeadList").append(
                                " <li >" +
                                "     <label class=\"head_text\">\n" +
                                ""+data.searchHeadList[i].headName+""+
                                "<small style=\"color: green;\">["+data.searchHeadList[i].headNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='적용'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click",function(){
            let headNo = $(".headNo").val();
            $(".selHeadNo").val(headNo);
            let nodis = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let req = convertFormToObj($('form.branch_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/branch/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchBranchList").html("");
                    if(data.searchBranchList.length == 0 || data.searchBranchList == null){
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            nodis+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {
                        for (var i = 0; i < data.searchBranchList.length; i++) {
                            $(".searchBranchList").append(
                                " <li >" +
                                "     <label class=\"branch_text\">\n" +
                                "" + data.searchBranchList[i].branchName + "" +
                                "<small style=\"color: green;\">[" + data.searchBranchList[i].branchNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName=" + data.searchBranchList[i].branchName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo=" + data.searchBranchList[i].branchNo + " value='적용'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        //가맹점 선택
        $(".searchStoreBtn").on("click",function(){
            let branchNo = $(".branchNo").val();
            $(".selBranchNo").val(branchNo);
            let req = convertFormToObj($('form.store_search_form'));
            let nostore = "<spring:message code="list.script.therearenoregisteredmerchants" text="등록된 가맹점이 없습니다."/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/store/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchStoreList").html("");
                    if(data.searchStoreList.length == 0 || data.searchStoreList == null){
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            nostore+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {

                        for(var i = 0 ; i < data.searchStoreList.length ; i++){
                            $(".searchStoreList").append(
                                " <li >" +
                                "     <label class=\"store_text\">\n" +
                                ""+data.searchStoreList[i].storeName+""+
                                "<small style=\"color: green;\">["+data.searchStoreList[i].storeNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName="+data.searchStoreList[i].storeName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo="+data.searchStoreList[i].storeNo+" value='적용'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            let selhead = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            if(headNo == null || headNo =='') {
                swal({
                    title: selhead,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            } else {
                $(".searchBranchBtn").click();
            }

        });

        $(document).on("click",".storeName",function(){
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();

            let selhead = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let seldis = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

            if(headNo == null || headNo =='') {
                swal({
                    title: selhead,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            }  else {
                if(branchNo == null || branchNo =='') {
                    swal({
                        title: seldis,
                        icon: "warning",
                        buttons: [
                            cancel,
                            confirm
                        ],
                        dangerMode: true,
                    });
                } else {
                    $(".searchStoreBtn").click();
                }
            }
        });

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".storeName").val("");
            $(".searchBranchList").html("");
            $(".searchStoreList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".storeName").attr("data-toggle","modal");
            $(".storeName").val("");
            $(".searchStoreList").html("");
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });

        $(".btn_list").click(function() {
            location.href = "/workgroup/deliverystreet/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/deliverystreet/insert/action";

            let _forms = $('.insert_form');
            let req = convertFormToObj(_forms);

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirmsuss = "<spring:message code="list.script.registrationwassuccessful" text="등록에 성공하였습니다."/>";

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
                        formData.append("tbDlvyPriceCharge",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(confirmsuss);
                                    location.href = "${path}/workgroup/deliverystreet/list";
                                } else {
                                    alert(confirmfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });
    });

    function inputDataCheck(args) {
        console.log(args)
        let entertheplanname = "<spring:message code="list.script.entertheplanname" text="요금제 이름을 입력해주세요."/>";
        if (isNull(args.priceChargeName)) {
            return alert_focus("priceChargeName", entertheplanname);
        } else if(isNull(args.headNoText)) {
            return alert_focus("headNoText", "제휴본사명를 선택해주세요.");
        } else if(isNull(args.branchNoText)) {
            return alert_focus("branchNoText", "총판을 선택해주세요.");
        }
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

</script>
</body>
</html>

