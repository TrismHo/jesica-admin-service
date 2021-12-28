<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productoptionregistration" text="상품옵션 등록"/></title>
</head>
<style>
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
            <!-- begin nav-tabs -->
            <!-- begin page-header -->
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/merchant/merchanext/list"><spring:message code="sidemenu.merchandise.merchantsetting.option" text="상품옵션"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productoptionregistration" text="상품옵션 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productoptionregistration" text="상품옵션 등록"/></h3>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본 정보"/><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본 정보"/><%--기본 정보--%></span>
                    </a>
                </li>
            </ul>

            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive" style="overflow: hidden;">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="p-0" colspan="1">
                                    <form id="update_form">
                                    <input type="hidden" id="storeOptNo" name="storeOptNo" value="">
                                    <input type="hidden" id="dataStatus" name="dataStatus" value="1">
                                        <table class="width-full">
                                            <tbody>
                                                <tr>
                                                    <td  class="order-top-0 border-left-0 bg-light" style="width:15%">
                                                        <spring:message code="list.detail.franchiseselection" text="기본 정보"/>
                                                    </td>
                                                    <td style="width: 60%;">
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
                                                                <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/>" class="form-control background-white storeName width-100">
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
                                                        </c:if>
                                                    </td>
                                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectastore" text="가맹점을 선택하세요."/></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-0 bg-light"><spring:message code="list.detail.optionname" text="옵션명칭"/><%--정상 판매가--%></td>
                                                    <td class="border-right-0 border-bottom-0"><input type="text" name="optName" class="form-control width-200 optName" value="" maxlength="85"><%--KRW--%></td>
                                                    <td class="text-danger-darker"><spring:message code="list.description.enteranoptionname" text="옵션 이름을 입력하세요."/></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0  border-top border-right-0 border-bottom-0 bg-light"><spring:message code="list.detail.optionclassification" text="옵션구분"/><%--검색 단어--%></td>
                                                    <td colspan="1">
                                                        <label class="m-l-10 ">
                                                            <input type="radio" name="mandatoryYn" value="true" class="align-bottom mandatoryYn"><spring:message code="list.detail.requiredoption" text="필수옵션"/><%--정지(품절표시)--%>
                                                        </label>
                                                        <label class="m-l-10 ">
                                                            <input type="radio" name="mandatoryYn" value="false" class="align-bottom mandatoryYn" checked><spring:message code="list.detail.selectoption" text="선택옵션"/><%--정지(품절표시)--%>
                                                        </label>
                                                    </td>
                                                    <td class="text-danger-darker"><spring:message code="list.detail.selectoption" text="필수/선택 옵션 여부를 선택하세요."/></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.minimumrequirednumberofchoices" text="최소 필수선택개수"/><%--1회 주문제한 수량--%></td>
                                                    <td class="border-top border-right-0 border-bottom-0"><input type="text" name="minSelectCnt" class="form-control width-200 minSelectCnt" numberOnly value="0" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                                    <td class="text-danger-darker"><spring:message code="list.description.selectrequiredoptionminmessage" text="필수로 선택할 최소 개수를 입력하세요."/></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.maximumnumberofchoices" text="최대 선택가능개수"/><%--1일 주문제한 수량--%></td>
                                                    <td class="border-top border-right-0 border-bottom-0"><input type="text" name="maxSelectCnt" class="form-control width-200 maxSelectCnt" numberOnly value="1" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                                    <td class="text-danger-darker"><spring:message code="list.description.maximumnumberselectmessage" text="선택 가능한 최대 개수를 입력하세요."/></td>
                                                </tr>
                                                <tr id="basicOptionYnView" >
                                                    <td colspan="2">
                                                        <div class="tab-pane fade active show" id="">
                                                            <div class="row">
                                                                <form id="update_form2" style="width: 100%;">
                                                                    <div class="col-xl-12 col-lg-12 ui-sortable ">
                                                                        <div class="panel panel-inverse">
                                                                            <div class="panel-heading ui-sortable-handle">
                                                                                <h4 class="panel-title text-center"><spring:message code="list.detail.listofoptions" text="옵션 목록"/></h4>
                                                                            </div>
                                                                            <div class="height-300 overflow-auto border">
                                                                                <input type="hidden"  class="viewOrder" value="">
                                                                                <table class="table table-bordered border-bottom text-center border-0 tbStoreOptionItemTable">
                                                                                    <thead>
                                                                                    <tr>
                                                                                        <th class="bg-light" style="width:40%"><spring:message code="list.detail.itemname" text="아이템 명"/></th>
                                                                                        <th class="bg-light" style="width:20%"><spring:message code="list.detail.salesstatus" text="판매상태"/></th>
                                                                                        <th class="bg-light" style="width:20%"><spring:message code="list.detail.price" text="금액"/></th>
                                                                                        <th class="bg-light"></th>
                                                                                    </tr>
                                                                                    <tr class="border-bottom-0">
                                                                                        <td class="border-bottom bg-light"><input type="text" class="form-control width-300 itemName" placeholder="<spring:message code="list.detail.pleaseenteryourname" text="이름을 입력하세요"/>" maxlength="85"></td>
                                                                                        <td class="border-bottom bg-light">
                                                                                            <select class="form-control itemStatus">
                                                                                                <option value="0"><spring:message code="list.detail.notforsale" text="판매안함"/></option>
                                                                                                <option value="1" selected><spring:message code="list.detail.sale" text="판매중"/></option>
                                                                                                <option value="2"><spring:message code="list.detail.soldout" text="품절"/></option>
                                                                                            </select>
                                                                                        </td>
                                                                                        <td class="border-bottom bg-light">
                                                                                            <input class="form-control itemPrice" type="text" numberOnly placeholder="<spring:message code="list.detail.price" text="품절"/>" maxlength="7">
                                                                                        </td>
                                                                                        <td class="border-right-0 border-bottom bg-light"><button type="button" class="btn btn-primary add_group_ptn"><spring:message code="list.detail.enrollment" text="등록"/></button></td>
                                                                                    </tr>
                                                                                    </thead>
                                                                                    <tbody id="tbStoreOptionItemBody">
                                                                                    <c:choose>
                                                                                        <c:when test="${tbStoreOptionDetail.storeOptions.size() > 0}">
                                                                                            <c:forEach var="item"  items="${tbStoreOptionDetail.storeOptions}" varStatus="status">
                                                                                                <tr  viewOrder="${item.viewOrder}" optItemNo="${item.optItemNo}">
                                                                                                    <td class="border-left-0">
                                                                                                        <input type="text" class="form-control form-control itemNameText width-300" value="${item.itemName}"></td>
                                                                                                    <td class="border-top-0">
                                                                                                        <select class="form-control itemStatusText">
                                                                                                            <option value="0" <c:if test="${item.itemStatus.ordinal() == 0}">selected</c:if>><spring:message code="list.detail.notforsale" text="판매중지"/></option>
                                                                                                            <option value="1" <c:if test="${item.itemStatus.ordinal() == 1}">selected</c:if>><spring:message code="list.detail.sale" text="판매중"/></option>
                                                                                                            <option value="2" <c:if test="${item.itemStatus.ordinal() == 2}">selected</c:if>><spring:message code="list.detail.soldout" text="품절"/></option>
                                                                                                        </select>
                                                                                                    </td>
                                                                                                    <td class="border-top-0"><input type="text" class="form-control itemPriceText" value="${item.itemPrice}" numberOnly></td>
                                                                                                    <td class="border-top-0 border-right-0">
                                                                                                        <button type="button" class="btn btn-danger removeOptionBtn" optItemNo="${item.optItemNo}"><spring:message code="list.detail.delete" text="삭제"/></button>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <tr class="noneItemOption">
                                                                                                <td colspan="4" class="text-center"><spring:message code="list.description.registeradditionalproducts" text="추가상품을 등록해주세요"/></td>
                                                                                            </tr>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="text-danger-darker"><spring:message code="list.description.registeralistofproductoptions" text="상품 옵션 목록을 등록하세요."/></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="m-t-10">
                            <button type="button" class="btn btn-primary btn_insert float-right"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.enrollment" text="추가"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- begin tab-content -->

            <!-- end tab-content -->
        </div>
        <!-- end row -->
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

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
<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

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
<script src="${path}/assets/plugins/dropzone/dist/dropzone.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/ui-tree.demo.js" type="text/javascript"></script>
<script src="${path}/assets/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
<link href="${path}/assets/plugins/dropzone/dist/dropzone.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/jstree.css" />
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    //인스턴스 자동생성 방지
    Dropzone.autoDiscover = false;

    $(() => {
        $(".list_btn").click(function() {
            location.href = "${path}/merchant/merchanext/list";
        });

        let deleteIdList = [];
        let list = [];
        $(document).on("click", ".removeOptionBtn", function () {
            let index = $(this).parents().parents().index();
            let length = $(".tbStoreOptionItemTable tr").length;
            $(".tbStoreOptionItemTable tr").eq(index+2).remove();
            deleteIdList.push($(this).attr("optItemNo"));
        });

        $(document).on("click", ".btn_insert", function () {
            let url = "${path}/api/merchanext/insert/action";
            let _forms = $('#update_form');
            let _forms2 = $('#update_form2');
            let addmsg = "<spring:message code="list.script.wouldyouliketoadd" text="추가 하시겠습니까?"/>";
            let add = "<spring:message code="list.script.add" text="추가"/>";
            let cancelmsg = "<spring:message code="list.script.cancel" text="취소"/>";
            let addfailmsg = "<spring:message code="list.script.additionfailed" text="추가에 실패하였습니다."/>";

            list = [];
            $(".tbStoreOptionItemTable #tbStoreOptionItemBody tr").each(function(){
                if($(this).attr("optItemNo") != "undefined"){
                    pushList = {
                        optItemNo : $(this).attr("optItemNo"),
                        itemName : $(this).find(".itemNameText").val(),
                        itemStatus : $(this).find(".itemStatusText").val(),
                        itemPrice : $(this).find(".itemPriceText").val(),
                        storeOptNo : $("#storeOptNo").val(),
                        viewOrder : $(this).attr("viewOrder")
                    }
                    list.push(pushList);
                }
            });

            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            if (inputDataCheck(req)) {
                swal({
                    title: addmsg,
                    icon: "warning",
                    buttons: [
                        cancelmsg,
                        add
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbStoreOptionData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbStoreOptionItemData",  new Blob([JSON.stringify(list)], {type:"application/json"}));
                        /*formData.append("deleteIdList",  new Blob([JSON.stringify(deleteIdList)], {type:"application/json"}));*/
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
                                    location.href="${path}/merchant/merchanext/list";
                                } else {
                                    alert(addfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        let optItemNo = ${maxNo+1};
        $(document).on("click", ".add_group_ptn", function () {

            let addproductmsg = "<spring:message code="list.script.enteranadditionalproductname" text="추가상품이름을 입력해주세요"/>";
            let add = "<spring:message code="list.script.add" text="추가"/>";
            let cancelmsg = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirmmsg = "<spring:message code="list.script.confirm" text="확인"/>";
            let addfailmsg = "<spring:message code="list.script.additionfailed" text="추가에 실패하였습니다."/>";
            let enteraprice = "<spring:message code="list.script.enteraprice" text="가격을 입력해주세요"/>";
            let stopselling = "<spring:message code="list.script.stopselling" text="판매중지"/>";
            let sale = "<spring:message code="list.script.sale" text="판매중"/>";
            let soldout = "<spring:message code="list.script.soldout" text="품절"/>";
            let deletemsg = "<spring:message code="list.script.delete" text="삭제"/>";


            let itemStatus = $(".itemStatus").val();
            let itemName = $(".itemName").val();
            let itemPrice = $(".itemPrice").val();
            let viewOrder = $(".viewOrder").val();

            if(itemName == "") {
                swal({
                    title: addproductmsg,
                    icon: "warning",
                    buttons: [
                        cancelmsg,
                        confirmmsg
                    ],
                    dangerMode: true,
                })
                return;
            } else if(itemPrice == "") {
                swal({
                    title: enteraprice,
                    icon: "warning",
                    buttons: [
                        cancelmsg,
                        confirmmsg
                    ],
                    dangerMode: true,
                })
                return;
            }
            let optionText = "";
            if(itemStatus == 0) {
                optionText =    "                  <option value=\"0\" selected>"+stopselling+"</option>\n" +
                    "                  <option value=\"1\">"+sale+"</option>\n" +
                    "                  <option value=\"2\">"+soldout+"</option>\n";
            } else if(itemStatus == 1) {
                optionText =    "                  <option value=\"0\" >"+stopselling+"</option>\n" +
                    "                  <option value=\"1\" selected>"+sale+"</option>\n" +
                    "                  <option value=\"2\">"+soldout+"</option>\n";
            } else if(itemStatus == 2) {
                optionText =    "                  <option value=\"0\" >"+stopselling+"</option>\n" +
                    "                  <option value=\"1\" >>"+sale+"</option>\n" +
                    "                  <option value=\"2\" selected>"+soldout+"</option>\n";
            }

            $(".noneItemOption").remove();


            $("#tbStoreOptionItemBody").append(" <tr optItemNo="+optItemNo+" viewOrder="+optItemNo+">\n" +
                "          <td class=\"border-left-0\"><input type=\"text\" class=\"form-control width-300 itemNameText\" value='"+itemName+"'></td>\n" +
                "          <td class=\"border-top-0\">\n" +
                "              <select class=\"form-control itemStatusText\">\n" +
                optionText +
                "              </select>\n" +
                "          </td>\n" +
                "          <td class=\"border-top-0\"><input type=\"text\" class=\"form-control itemPriceText\" value="+itemPrice+"></td>\n" +
                "          <td class=\"border-top-0 border-right-0\">\n" +
                "              <button type=\"button\" class=\"btn btn-danger removeOptionBtn\" optItemNo="+optItemNo+" >"+deletemsg+"</button>\n" +
                "          </td>\n" +
                "      </tr>");
            optItemNo++;
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
                    if(data.searchHeadList.length == 0 || data.searchHeadList == null){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noheadmsg +
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
            let nostore = "<spring:message code="list.script.therearenoregisteredmerchants" text="등록된 가맹점이 없습니다."/>";
            let req = convertFormToObj($('form.store_search_form'));
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

        $(document).on("click", ".mandatoryYn", function () {
            if ($(this).val() == 'true') {
                $(".minSelectCnt").val("1");
                $(".maxSelectCnt").val("1");
            } else {
                $(".minSelectCnt").val("0");
                $(".maxSelectCnt").val("1");
            }
        });

    });






    function inputDataCheck(args) {
        let selstoremsg = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요"/>";
        let optionnamemsg = "<spring:message code="list.script.pleaseselectastore" text="옵션명칭을 입력해주세요"/>";
        let minselectionmsg = "<spring:message code="list.script.enterminrequirednumbermsg" text="최소 필수선택 개수를 입력해주세요"/>";
        let maxselectionmsg = "<spring:message code="list.script.entermaxrequirednumbermsg" text="최대 선택가능 개수를 입력해주세요"/>";

        if (isNull(args.storeNo)) {
            return alert_focus("storeNo", selstoremsg);
        } else if (isNull(args.optName)) {
            return alert_focus("optName", optionnamemsg);
        } else if (isNull(args.minSelectCnt)) {
            return alert_focus("minSelectCtn", minselectionmsg);
        } else if (isNull(args.maxSelectCnt)) {
            return alert_focus("minSelectCtn", maxselectionmsg);
        }
        return true;
    }
</script>
</body>
</html>
