<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productregistration" text="렌터카 등록"/></title>
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
        <div class="col-xl-12 p-b-20">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/merchant/merchandise/list"><spring:message code="sidemenu.merchantsetting.222" text="렌터카"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productregistration1" text="렌터카 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productregistration1" text="렌터카 등록"/></h3>
            </div>
<%--            <div class="tab-content">--%>
                <!-- begin tab-pane -->
<%--                <div class="tab-pane fade active show" id="default-tab-1">--%>
                    <div class="" data-scrollbar="true">
                        <div class="table-responsive">
                            <div class="timeline-header m-t-10 m-b-10">
                                <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                <span><strong><spring:message code="list.detail.basicInformation" text="기본 정보"/></strong></span>
                            </div>
                            <form id="insert_form">
                                <input type="hidden" name="dataStatus" value="1">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.franchiseeheadquarters" text="가맹점"/></td>
                                        <td style="width:60%">
                                            <%--<c:if test="${sessionScope.sessionKey.userRole == 0}">--%>
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
                                                    <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/>" class="form-control background-white storeName width-100">
                                                </label>
                                            <%--</c:if>
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
                                                    <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/>" class="form-control background-white storeName width-100">
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
                                                    <input type="text"  id="testInput"  data-toggle="modal" data-target="#store_search_modal" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/>" name="storeNoText" value="${searchValue.storeNoText}" class="form-control background-white storeName width-100">
                                                </label>
                                            </c:if>--%>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectastore" text="가맹점을 선택하세요. (등록후 변경 불가)" /></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.123" text="번호판" /><%--상품상태--%></td>
                                        <td colspan="1">
                                            <label class="font-size-10">
                                                <input type="text" class="form-control width-200 carNum" name="carNum" value="" maxlength="70">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.1" text="번호판을 입력해주세요." /></td>
                                        <input type="hidden" name="goodsStatus" value="1">
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.123" text="모델명" /><%--상품상태--%></td>
                                        <td colspan="1">
                                            <label class="font-size-10">
                                                <input type="text" class="form-control width-200 carModel" name="carModel" value="" maxlength="70">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.2" text="모델명을 입력해주세요." /></td>
                                    </tr>
                                </table>


                                <br>
                                <!-- end tab-pane -->
                                <div class="m-t-5 m-l-5">
                                    <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                    <button type="button" class="btn btn-primary btn_insert float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>

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
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    $(() => {
        $("input[name=stockCnt], input[name=buyPrice], input[name=goodsPrice], input[name=goodsLimitOnce], input[name=goodsLimitDay]").focus(function(){
            $(this).val('');
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });
        $(".list_btn").click(function() {
            location.href = "${path}/merchant/car/list";
        });
        let date = new Date();
        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $("#endDate").datepicker('setDate', date);

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            let noheadmsg = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
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
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='"+apply+"'></div>\n" +
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
            let nodis = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $(".selHeadNo").val(headNo);
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
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName=" + data.searchBranchList[i].branchName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo=" + data.searchBranchList[i].branchNo + " value='"+apply+"'></div>\n" +
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
                    console.log(data)
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
            $(".storeModalCloseBtn").click();
        });

        $(document).on("click",".btn_insert",function() {
            let url = "${path}/api/car/insert/action";
            let _forms = $('#insert_form, #insert_form2');
            let _imgForms = $('#insert_form');
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
                    if(isConfirm) {
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbStoreRentalCarData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    location.href="${path}/merchant/car/list"
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
        let carModelmsg = "<spring:message code="list.script.23" text="차랑모델을 입력해주세요."/>";
        let carNummsg = "<spring:message code="list.script.12" text="차량번호를 입력해주세요."/>";
        let selstoremsg = "<spring:message code="list.script.12" text="가맹점을 선택해주세요."/>";
        if (isNull(args.carModel)) {
            return alert_focus("carModel", carModelmsg);
        } else if (isNull(args.carNum)) {
            return alert_focus("carNum", carNummsg);
        } else if (isNull(args.storeNo)) {
            return alert_focus("storeNo", selstoremsg);
        }
        return true;
    }


</script>
</body>
</html>
