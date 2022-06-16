<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar |  <spring:message code="sidemenu.search.deliverygroupregistration" text="배송그룹 등록"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/deliverygrp/list"><spring:message code="sidemenu.workgroupmanagement.deiliverygroup" text="배송그룹"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.search.deliverygroupregistration" text="배송그룹 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.search.deliverygroupregistration" text="배송그룹 등록"/></h3>
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
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                           <%-- <input type="hidden" class="headNo" name="headNo"  value="">
                            <input type="hidden" class="branchNo" name="branchNo"  value="">
                            <input type="hidden" class="storeNo" name="storeNo" value="">--%>
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light height-50" style="width:15%"><spring:message code="list.detail.operationalstatus" text="운영상태"/></td>
                                    <td style="width:60%">
                                        <label class="">
                                            <input type="radio" name="openStatus" class="align-bottom serviceYn" value="0" checked> <spring:message code="list.detail.inoperation" text="운영중"/><%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openStatus" value="1"> <spring:message code="list.detail.pause" text="일시정지"/>
                                        </label>
                                    <td class="text-danger-darker"><spring:message code="list.description.selecttheoperatingstatus" text="운영상태를 선택하세요."/></td>
                                </tr>
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
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                   <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                   <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                               </label>
                                               <label>
                                                   <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                   </c:if>
                                                   <c:if test="${searchValue.branchNo == null || searchValue.branchNo ==''}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   </c:if>


                                                   <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                   <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                               </label>
                                               <label>
                                                   <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                                   <c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                   </c:if>
                                                   <c:if test="${searchValue.storeNo == null || searchValue.storeNo ==''}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${sessionScope.sessionKey.storeNo}">
                                                   </c:if>

                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                               </label>
                                               <label>
                                                   <input type="text"  id="testInput"  data-toggle="modal" data-target="#store_search_modal" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점 입력"/>" name="storeNoText" value="${searchValue.storeNoText}" class="form-control background-white storeName width-100">
                                               </label>
                                           </c:if>

                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectyouraffiliatedheadofficeanddistributor" text="소속 제휴본사/총판/가맹점을 선택하세요."/></td>
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
                                    <td class="bg-light"><spring:message code="list.detail.deliveryagentname" text="배달대행이름"/></td>
                                    <td><input type="text" class="form-control width-200" name="dlvyName" value="" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.nameofthedeliveryagentmessage" text="배달대행 이름을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.availabilityofoperatinghours" text="운영시간 사용여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="openTimeYn" value="1" class="align-bottom openTimeYn" checked> <spring:message code="list.detail.inoperation" text="운영중"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openTimeYn" value="0" class="align-bottom openTimeYn" > <spring:message code="list.detail.pause" text="일시중지"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeliverygroup" text="운영시간 사용여부를 선택해주세요."/></td>
                                </tr>
                                <tr class="opentimeTr">
                                    <td class="bg-light"><spring:message code="list.detail.operationstartendtime" text="운영시작/마감시간"/></td>
                                    <td>
                                        <input type="text" class="form-control width-100 openTimeStart" name="openTimeStart" value=""> ~
                                        <input type="text" class="form-control width-100 openTimeEnd" name="openTimeEnd" value="">
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.detail.operationstartendtime" text="운영시작/마감시간을 입력하세요."/></td>
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
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.deliveryagencygroupclassification" text="배달대행 그룹 구분"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyGroupType" value="1" class="align-bottom alldayOpenYn" checked> <spring:message code="list.detail.orderonly" text="발주전용"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyGroupType" value="2" class="align-bottom alldayOpenYn" > <spring:message code="list.detail.obtainorderonly" text="수주전용"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyGroupType" value="3" class="align-bottom alldayOpenYn" >  <spring:message code="list.detail.orderplusobtainorderonly" text="발주+수주"/><%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeliverygroup" text="배달대행 그룹을 선택하세요."/></td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <!-- end table-responsive -->
                    <div class="m-l-5 m-t-5">
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                        <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.deliverygroupregistration" text="배송그룹 등록"/></button>
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
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
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
    let map;
    let marker;
    $(() => {


        $(".openTimeStart").timepicker({
            minuteStep: 1,
            maxHours:24,
            showMeridian:false,
        });
        $(".openTimeEnd").timepicker({
            minuteStep: 1,
            maxHours:24,
            showMeridian:false,
        });

        $(".openTimeYn").on("click",function(){
            if($(this).val() == 1) {
                $(".opentimeTr").css("display","");
            } else {
                $(".opentimeTr").css("display","none");

            }
        });

        $('.pin-div i').on('click',function(){
            $('input').toggleClass('active');
            if($('input').hasClass('active')){
                $(this).attr('class',"fa fa-eye-slash fa-lg")
                    .prev('input').attr('type',"text");
            }else{
                $(this).attr('class',"fa fa-eye fa-lg")
                    .prev('input').attr('type','password');
            }
        });

        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "BT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".cybankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".cybankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });
        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "CBT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".bankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".bankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });

        /*initMap();*/

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
        $.ajax({
            type: "POST",
            url: "${path}/api/search/dlvy/list",
            data: JSON.stringify(dlvyReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                console.log(data);
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/
                for(var i = 0 ; i < data.searchDlvyList.length ; i++){
                    $(".searchDlvyList").append(
                        "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                    )
                }
            }
        });

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
                    if (data.searchHeadList.length == 0 || data.searchHeadList == null) {
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noheadmsg +
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {
                        for (var i = 0; i < data.searchHeadList.length; i++) {
                            $(".searchHeadList").append(
                                " <li >" +
                                "     <label class=\"head_text\">\n" +
                                "" + data.searchHeadList[i].headName + "" +
                                "<small style=\"color: green;\">[" + data.searchHeadList[i].headNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName=" + data.searchHeadList[i].headName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo=" + data.searchHeadList[i].headNo + " value='적용'></div>\n" +
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
            let req = convertFormToObj($('form.branch_search_form'));
            let nodis = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
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
            location.href = "/workgroup/deliverygrp/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/deliverygrp/insert/action";
            $(".openTimeStart").val( $(".openTimeStart").val().replaceAll(":",""));
            $(".openTimeEnd").val( $(".openTimeEnd").val().replaceAll(":",""));
            if($(".openTimeStart").val().trim().length < 4){
                $(".openTimeStart").val("0"+$(".openTimeStart").val())
            }
            if($(".openTimeEnd").val().trim().length < 4){
                $(".openTimeEnd").val("0"+$(".openTimeEnd").val())
            }
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
                        formData.append("tbDelivery",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(confirmsuss);
                                    location.href = "${path}/workgroup/deliverygrp/list";
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

    function initMap() {
        let uluru = {lat: 37.566302,lng: 126.977946};
        map = new google.maps.Map(document.getElementById("map"), {
            center: uluru,
            zoom: 18,
        });
        marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }



    function initAutocomplete() {
        let lat = $("#lat").val();
        let lng = $("#lng").val();
        if (lat == "") {
            lat = 37.4816268;
        }
        if (lng == "") {
            lng = 126.8829256;
        }

        const map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: lat, lng: lng },
            zoom: 13,
            mapTypeControl: false,
            mapTypeId: "roadmap",
        });
        // Create the search box and link it to the UI element.
        const input = document.getElementById("pac-input");
        const searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        // Bias the SearchBox results towards current map's viewport.
        searchBoxEvent(map,searchBox);
    }

    function searchBoxEvent(map,searchBox ) {

        let geofail = "<spring:message code="list.script.geocodewasnotsuccessfulbecause" text="지오코드가 다음의 이유로 성공하지 못했습니다."/>";
        map.addListener("bounds_changed", () => {
            searchBox.setBounds(map.getBounds());
        });
        let markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener("places_changed", () => {
            const places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }
            // Clear out the old markers.
            markers.forEach((marker) => {
                marker.setMap(null);
            });
            markers = [];
            // For each place, get the icon, name and location.
            const bounds = new google.maps.LatLngBounds();
            places.forEach((place) => {
                if (!place.geometry || !place.geometry.location) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                const icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(35, 35),
                };
                // Create a marker for each place.
                /* markers.push(
                     new google.maps.Marker({
                         map,
                         icon,
                         title: place.name,
                         position: place.geometry.location,
                     })
                 );*/
                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            let poi = $("#pac-input").val();
            let geocoder = new google.maps.Geocoder();
            geocoder.geocode({'address': poi}, function(result, status) {

                if (status === 'OK') {
                    let address = null;

                    // 맵의 중심 좌표를 설정한다.
                    map.setCenter(result[0].geometry.location);
                    // 맵의 확대 정도를 설정한다.
                    map.setZoom(18);
                    // 맵 마커
                    marker = new google.maps.Marker({
                        map: map,
                        position: result[0].geometry.location
                    });

                    let addressArray = result[0].address_components;

                    $("#addr_1").val("");
                    $("#addr_2").val("");
                    $("#addr_3").val("");
                    $("#addr_4").val("");
                    for(var i = 0 ; i < addressArray.length ; i++){
                        if(addressArray[addressArray.length - (i+1)].long_name != '대한민국') {
                            if(i > 5) {
                                let addAddr = addressArray[addressArray.length - (i+1)].long_name;
                                $("#addr_4").val($("#addr_4").val() + addAddr);
                            }else {
                                $("#addr_"+(i-1)).val(addressArray[addressArray.length - (i+1)].long_name);
                            }
                        }
                    }

                    //$("#pac-input").val(result[0].formatted_address.replace('대한민국','').replace(/^\s*/, ""));
                    $("#lng").val(marker.position.lng());
                    $("#lat").val(marker.position.lat());
                } else {
                    alert(geofail +' : ' + status);
                }
            });
            map.fitBounds(bounds);
        });
    }



    function inputDataCheck(args) {
        let deliveryMsg = "<spring:message code="list.script.selectadeliveryagentname" text="배달대행이름을 선택해주세요."/>";
        console.log(args);
        if (isNull(args.dlvyName)) {
            return alert_focus("dlvyName", deliveryMsg);
        }
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

</script>
</body>
</html>

