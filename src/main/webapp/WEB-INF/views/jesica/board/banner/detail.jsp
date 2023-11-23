<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>

    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.1" text="배너 상세"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | <spring:message code="list.detail.1" text="배너 상세"/></title>
    </c:if>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.1" text="게시판 관리"/></li>
                    <li class="breadcrumb-item"><a href="${path}/driver/deliveryman/list"><spring:message code="sidemenu.workgroupmanagement.1" text="배너 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.1" text="배너 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.1" text="배너 상세"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="update_form" id="update_form">
                            <input type="hidden" name="bannerNo" id="bannerNo" value="${tbAppBanner.bannerNo}">
                            <input type="hidden" name="dataStatus" value="1">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="플랫폼 구분"/></td>
                                        <td>
                                            <%--<label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="0" class="m-t-1 m-r-3" <c:if test="${tbAppBanner.platformType == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="사용안함"/></span>
                                            </label>--%>
                                            <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3" checked>
                                                    <span><spring:message code="list.detail.deliveryman1" text="PICK오더"/></span>
                                                </label>
                                            </c:if>
                                            <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" checked>
                                                    <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                                </label>
                                            </c:if>
                                            <%--<label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" <c:if test="${tbAppBanner.platformType == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3" <c:if test="${tbAppBanner.platformType == 2}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="양파오더"/></span>
                                            </label>
                                            <label class="" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="3" class="m-t-1 m-r-3" <c:if test="${tbAppBanner.platformType == 3}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="세날"/></span>
                                            </label>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="노출서비스"/></td>
                                        <td>
                                            <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="0" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 0}">checked</c:if>>
                                                    <span><spring:message code="list.detail.tothewhole1" text="메인"/></span>
                                                </label>
                                            </c:if>
                                            <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="0" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 0}">checked</c:if>>
                                                    <span><spring:message code="list.detail.tothewhole1" text="메인"/></span>
                                                </label>
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="2" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 2}">checked</c:if>>
                                                    <span><spring:message code="list.detail.affiliate1" text="탁송"/></span>
                                                </label>
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="3" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 3}">checked</c:if>>
                                                    <span><spring:message code="list.detail.affiliate1" text="맛집"/></span>
                                                </label>
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="4" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 4}">checked</c:if>>
                                                    <span><spring:message code="list.detail.affiliate1" text="마트"/></span>
                                                </label>
                                            </c:if>

                                            <%--<label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="5" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 5}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="맛집예약"/></span>
                                            </label>--%>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="노출서비스를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="노출여부"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="viewYn" value="0" style="margin-right: 5px" <c:if test="${tbAppBanner.viewYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="숨김"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="viewYn" value="1" style="margin-right: 5px" <c:if test="${tbAppBanner.viewYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="노출"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="배너 노출여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="게시판 종류"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" class="boardType" value="0" style="margin-right: 5px" <c:if test="${tbAppBanner.boardType == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="연결안함"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" class="boardType" value="1" style="margin-right: 5px" <c:if test="${tbAppBanner.boardType == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="이벤트"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" class="boardType" value="2" style="margin-right: 5px" <c:if test="${tbAppBanner.boardType == 2}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="공지"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="게시판 종류를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <input type="hidden" name="viewOrder" class="form-control viewOrder" value="${tbAppBanner.viewOrder}" readonly>

                                  <%--  <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="배너노출순서"/></td>
                                        <td>
                                            <input type="text" name="viewOrder" class="form-control viewOrder" value="${tbAppBanner.viewOrder}" readonly>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="배너 노출순서를 입력하세요."/>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="게시글 선택"/></td>
                                        <td>
                                            <input type="hidden" name="boardNo" class="selBoardNo" id="boardNo" value="${tbAppBanner.boardNo}">
                                            <button type="button" data-toggle="modal" data-target="#board_search_modal" class="btn btn-primary board-search-btn">
                                                <span class="fa fa-search m-r-3"></span>
                                                <spring:message code="list.search.noticeregistration1" text="게시글 검색"/>
                                            </button>
                                            <span id="board_title" class="m-l-10"></span>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="연결할 게시글을 검색 후 선택해주세요."/>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="주소별 노출사용여부"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="bannerType" value="0" style="margin-right: 5px"  <c:if test="${tbAppBanner.bannerType == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="전체"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="bannerType" value="1" style="margin-right: 5px"  <c:if test="${tbAppBanner.bannerType == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="주소"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="주소별 노출사용여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr class="location_tr" <c:if test="${tbAppBanner.bannerType == 0}">style="display: none;"</c:if>>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image12" text="지역등록"/></td>
                                        <td>
                                            <select class="form-control selectArea" >
                                                <c:forEach var="item" items="${sysCodeList}" varStatus="status">
                                                    <option value="${item.sysCode}" >${item.codeName}</option>
                                                </c:forEach>
                                            </select>
                                            <select class="form-control selectArea2 w-50" >
                                                <option value="0">전체</option>
                                                <c:forEach var="item2" items="${sysCodeList2}" varStatus="status">
                                                    <option value="${item2.sysCode}">${item2.codeName}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="button" id="selectAddr" class="btn btn-primary p-t-5 p-b-5 m-l-10" <c:if test="${tbAppBanner.bannerType == 0}">disabled</c:if>  value="<spring:message code="list.detail.addresssearch" text="주소등록"/>">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson12" text="."/></td>
                                    </tr>
                                    <tr class="location_tr" <c:if test="${tbAppBanner.bannerType == 0}">style="display: none;"</c:if>>
                                        <td class="bg-light"><spring:message code="list.detail.map" text="지역"/></td>
                                        <td><%--
                                            <select class="form-control selectArea" >
                                                <c:forEach var="item" items="${sysCodeList}" varStatus="status">
                                                    <option value="${item.sysCode}" <c:if test="${tbStore.blockTypeCode == item.sysCode}" >selected</c:if>>${item.codeName}</option>
                                                </c:forEach>
                                            </select>
                                            <select class="form-control selectArea2 w-50" >
                                                    <option value="" >시/도를 선택해주세요.</option>
                                            </select>
                                            <input type="button" id="selectAddr" class="btn btn-primary p-t-5 p-b-5 m-l-10" value="<spring:message code="list.detail.addresssearch" text="주소선택"/>">--%>

                                            <%--<input type="hidden" class="addr_1" id="addr_1" name="addr1" value="${tbStore.addr1}">--%>
                                            <div class="panel-body p-0">
                                                <table id="testTable" class="display  table table-bordered w-100 table-striped ">
                                                    <thead>
                                                    <th class="text-center" style="width: 84px;">시/도</th>
                                                    <th class="text-center" style="width: 98px;">시/군/구</th>
                                                    <th class="text-center" style="width: 98px;"></th>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e;">
                                                <ul class="attachList p-0" style="margin-bottom:0px;" >
                                                    <li class="p-0">
                                                        <div class="panel-body p-0" >
                                                            <table id="areaTable" class="display table table-bordered w-100 table-striped ">
                                                                <tbody class="areaTbody">
                                                                <c:choose>
                                                                    <c:when test="${appBannerLocation.size() > 0}">
                                                                        <c:forEach items="${appBannerLocation}" var="item" varStatus="status" step="1">
                                                                            <tr class="" >
                                                                                <td style="width:84px" >${item.codeName1}</td>
                                                                                <td style="width:98px;" >${item.codeName2}</td>
                                                                                <td style="width:98px;" >
                                                                                    <input  type="button" bnrLocNo="${item.bnrLocNo}"  class="btn-sm btn-danger btn-approval deleteLocation" value="삭제">
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <tr class="" >
                                                                            <td colspan="3" class="text-center"> 데이터가 없습니다. </td>
                                                                        </tr>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.addresssearchautosettingmessage" text="등록되어있는 시/도 시/군/구입니다 (변경불가)"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image12" text="배너 이미지"/></td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body1" id="sort_body1">
                                                            <img class="width-full" style="width: 192px; height: 54px" src="/api/img/fileLoad?filePath=${imgFile}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        * 권장 이미지 비율 : 32:9<br><br>
                                                        <div class="deliverymanFileName1"></div>
                                                        <br>
                                                        <div class="deliverymanFileSize1"></div>
                                                    </li>
                                                </ul>
                                                <label for="imgFile">
                                                    <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                        <div><spring:message code="list.detail.selectfile1" text="파일선택"/></div>
                                                    </div>
                                                </label>
                                                <input type="file" id="imgFile" name="imgFile" class="fileBtn d-none" accept="image/*" >
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson12" text="배너 이미지를 등록하세요."/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5" style="display: flex; align-content: center">
                        <span>
                            <button type="button" class="btn btn-primary btn_list m-t-5" style="display: flex; align-items: center">
                                <i class="fa fa-list"></i>
                                <span class="m-l-5"><spring:message code="list.detail.list1" text="목록"/></span>
                            </button>
                        </span>
                            <span style="display: flex; align-items: center; margin-left: auto">
                            <button type="button" class="btn btn-primary btn_update m-r-5" style="display: flex; align-items: center">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5"><spring:message code="list.detail.enrollment1" text="수정"/></span>
                            </button>
                            <button type="button" class="btn btn-danger btn_remove m-t-5 m-b-5" style="display: flex; align-items: center">
                                <i class="fa fa-trash-alt"></i>
                                <span class="m-l-5"><spring:message code="list.detail.delete1" text="삭제"/></span>
                            </button>
                        </span>
                    </div>
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

<div class="modal fade" id="board_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/boardSearch.jsp" %>
</div>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
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

<script>
    $(() => {

        $(document).on("change","[name='bannerType']", function(){
            let bannerType = $("input[type='radio'][name='bannerType']:checked").val();
            if(bannerType == 1){
                $("#selectAddr").attr("disabled",false);
                $(".location_tr").css("display","" );
            } else {
                $("#selectAddr").attr("disabled",true);
                $(".location_tr").css("display","none");
            }
        })

        $(document).on("click", ".deleteLocation", function() {
            let bnrLocNo = $(this).attr("bnrLocNo");

            $.ajax({
                type: "POST",
                url: "${path}/api/banner/location/delete",
                data: {bnrLocNo : bnrLocNo, bannerNo : ${tbAppBanner.bannerNo}},
                /*contentType: "application/json;",*/
                dataType: "json",
                success: function(data) {
                    let list = data.bannerList;
                    $(".areaTbody").html("");
                    for(var i = 0 ; i < list.length ; i++){
                     /*   $(".selectArea2").append(
                            "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                        )*/
                        if(!list[i].codeName2) {
                            list[i].codeName2 = "";
                        }
                        $(".areaTbody").append(
                            " <tr >" +
                            "     <td style='width:84px' >\n" +
                            list[i].codeName1+
                            "     </td>\n" +
                            "     <td style='width:98px' >\n" +
                            list[i].codeName2 +
                            "     </td>\n" +
                            "     <td style='width:98px' >\n" +
                            " <input  type=\"button\" bnrLocNo="+list[i].bnrLocNo+" class='btn-sm btn-danger btn-companion deleteLocation' value=\"삭제\"></div>"+
                            "     </td>\n" +
                            " </tr>"
                        );
                    }
                }
            });
        });
        $("#selectAddr").click(function() {
            let word1 = $(".selectArea option:checked").text()
            let word2 = $(".selectArea2 option:checked").text()
            let code1 = $(".selectArea").val();
            let code2 = $(".selectArea2").val();

            $.ajax({
                type: "POST",
                url: "${path}/api/banner/location/add",
                data: {addr1 : code1, addr2 : code2 , bannerNo : ${tbAppBanner.bannerNo}},
                /*contentType: "application/json;",*/
                dataType: "json",
                success: function(data) {
                    let list = data.bannerList;
                    $(".areaTbody").html("");
                    for(var i = 0 ; i < list.length ; i++){
                     /*   $(".selectArea2").append(
                            "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                        )*/
                        if(!list[i].codeName2) {
                            list[i].codeName2 = "";
                        }
                        $(".areaTbody").append(
                            " <tr >" +
                            "     <td style='width:84px' >\n" +
                            list[i].codeName1+
                            "     </td>\n" +
                            "     <td style='width:98px' >\n" +
                            list[i].codeName2 +
                            "     </td>\n" +
                            "     <td style='width:98px' >\n" +
                            " <input  type=\"button\" bnrLocNo="+list[i].bnrLocNo+" class='btn-sm btn-danger btn-companion deleteLocation' value=\"삭제\"></div>"+
                            "     </td>\n" +
                            " </tr>"
                        );
                    }
                }
            });
        });


        $(".selectArea").on("change", function (){
            // 시/도 선택시
            $.ajax({
                type: "POST",
                url: "${path}/api/system/code/area/list",
                data: {sysType : "A2", sysCode : $(this).val()+"%"},
                /*contentType: "application/json;",*/
                dataType: "json",
                success: function(data) {
                    let list = data.systemCodeList;
                    $(".selectArea2").html("");
                    $(".selectArea2").append(
                        "<option value='0'>전체</option>"
                    )
                    for(var i = 0 ; i < list.length ; i++){
                        $(".selectArea2").append(
                            "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                        )
                    }
                }
            });
        });


        let platformType = $("input[type='radio'][name='platformType']:checked").val();
        let boardType = $("input[type='radio'][name='boardType']:checked").val();
        let boardNo = $("#boardNo").val();
        let originBoardTitle = '';
        $.ajax({
            type: "GET",
            url: "${path}/api/board/search",
            data: {
                platformType,
                boardType,
                boardNo,
            },
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                let boardTitle = "";

                if(boardType == 0){
                    boardTitle = "";
                } else {
                    boardTitle = data.boardList[0].title + "[" + convertInsertDate(data.boardList[0].insertDate) + "]";
                }
                if (boardType == 1) {
                    boardNo = data.boardList[0].eventNo;
                } else if (boardType == 2)  {
                    boardNo = data.boardList[0].noticeNo;
                } else {
                    boardNo = ''
                }
                $('.selBoardNo').val(boardNo);
                $('#board_title').text(boardTitle);
                originBoardTitle = boardTitle;
            }
        });

        //imgFile
        $(document).on("change", "#imgFile", function(e) {
            e.preventDefault();

            let result = chk_file_type(this);
            let file = $("#imgFile")[0].files[0],

            reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                let img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body1.innerHTML = '';
                    sort_body1.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            let filename;
            if (window.FileReader) {
                // modern browser
                filename = file.name;
            } else {
                // old IE
                filename = $("#imgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName1').text("변경할 이미지 :" + filename);
            $('.deliverymanFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });

        $(".btn_list").click(function() {
            location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=&platformType=1";
        });

        $(".boardType").click((e) => {
            let value = e.target.value;

            if (boardType !== value) {
                $("#boardNo").val("");
                $("#board_title").text('');
            } else {
                $("#boardNo").val('${tbAppBanner.boardNo}');
                $("#board_title").text(originBoardTitle);
            }
        });

        $(document).on("click", "#selBoardNoBtn", function() {
            $('#board_title').text('');
            let boardType = $("input[type='radio'][name='boardType']:checked").val();
            let boardTitle = $(this).closest("li").find(".board_text").text();
            let boardNo;
            if (boardType == 1) {
                boardNo = $(this).attr('eventNo');
            } else {
                boardNo = $(this).attr('noticeNo');
            }
            $('.selBoardNo').val(boardNo);
            $('#board_title').text(boardTitle);
            $('.boardModalCloseBtn').click();
        });

        $(document).on("click", ".btn_update", function() {
            let url = "${path}/api/banner/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);
            let bannerNo = req.bannerNo;

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed1" text="수정에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister1" text="수정 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment1" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";

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
                        let formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbAppBannerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        $.ajax({
                            type: "PUT",
                            url: url,
                            data: formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    location.href = "${path}/board/banner/detail?bannerNo=" + bannerNo;
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

        //게시글 검색
        $(".searchBoardBtn").on("click", () => {
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters1" text="검색된 게시글이 존재하지 않습니다."/>";
            let apply = "<spring:message code="list.script.apply1" text="적용"/>";
            // let req = convertFormToObj($('form.board_search_form'));
            let platformType = $("input[type='radio'][name='platformType']:checked").val();
            let boardType = $("input[type='radio'][name='boardType']:checked").val();
            let keyword = $('#keyword').val();

            $.ajax({
                type: "GET",
                url: "${path}/api/board/search",
                data: {
                    platformType,
                    boardType,
                    keyword,
                },
                contentType: "application/json;",
                dataType: "json",
                success: (data) => {
                    resetSearchResult();
                    if(data.boardList.length == 0 || data.boardList == null) {
                        $(".searchBoardList").append(
                            " <li >" +
                            "     <label class=\"b_text\">\n" +
                            noregisteredaffiliateheadquarters+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {
                        for (let i = 0 ; i < data.boardList.length ; i++) {
                            let insertDate = convertInsertDate(data.boardList[i].insertDate);
                            if (boardType == 1) {
                                $(".searchBoardList").append(
                                    " <li >" +
                                    "     <label class=\"board_text\">\n" +
                                    ""+data.boardList[i].title+""+
                                    "<small style=\"color: green;\">["+ insertDate +"]</small>\n" +
                                    "     </label>\n" +
                                    "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBoardNoBtn\" title="+data.boardList[i].title+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" eventNo="+data.boardList[i].eventNo+" value='"+apply+"'></div>\n" +
                                    " </li>"
                                )
                            } else {
                                $(".searchBoardList").append(
                                    " <li >" +
                                    "     <label class=\"board_text\">\n" +
                                    ""+data.boardList[i].title+""+
                                    "<small style=\"color: green;\">["+ insertDate +"]</small>\n" +
                                    "     </label>\n" +
                                    "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBoardNoBtn\" title="+data.boardList[i].title+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" noticeNo="+data.boardList[i].noticeNo+" value='"+apply+"'></div>\n" +
                                    " </li>"
                                )
                            }
                        }
                    }
                }
            });
        });

        $('#keyword').on('keydown', (e) => {
            if (e.keyCode === 13) {
                $('.searchBoardBtn').click();
            }
        });

        $("#board_search_modal").on('show.bs.modal', () => {
            $('.searchBoardBtn').click();
        });

        $(".btn_remove").click(() => {
            let bannerNo = $("#bannerNo").val();
            let url = '${path}/api/banner/delete';
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete1" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg1" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed1" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted1" text="삭제되었습니다."/>";

            swal({
                title: doyouwanttodelete,
                icon: 'warning',
                buttons: [
                    cancel,
                    deletemsg,
                ],
                dangerMode: true,
            }).then((isConfirm) => {
                if (isConfirm) {
                    $.ajax({
                        type: 'DELETE',
                        url: url,
                        data: {
                            bannerNo
                        },
                        dataType: 'json',
                        success: (data) => {
                            if (data.result == 200) {
                                alert(deleted);
                                location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=";
                            } else {
                                alert(deletionfailed);
                                return;
                            }
                        }
                    })
                }
            })
        });
    });



    function inputDataCheck(args) {
        if (isNull(args.boardNo)) {
            if(args.boardType != 0) {
                return alert_focus("board-search-btn", "게시글을 검색후 선택해주세요");
            }
        }
        return true;
    }

    function chk_file_type(obj) {
        let imgmsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded1" text="취소"/>";
        let file_kind = obj.value.lastIndexOf('.');
        let file_name = obj.value.substring(file_kind + 1, obj.length);
        let file_type = file_name.toLowerCase();
        let check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp', 'tif'];

        if(check_file_type.indexOf(file_type) == -1) {

            alert(imgmsg);
            let parent_Obj=obj.parentNode;
            let node = parent_Obj.replaceChild(obj.cloneNode(true),obj);

            document.getElementById("imgFile").value = "";    //초기화를 위한 추가 코드
            document.getElementById("imgFile").select();        //초기화를 위한 추가 코드
            document.selection.clear();                          //일부 브라우저 미지원
            return false;
        }
    }

    function convertInsertDate(date) {
        return date.replace("T", " ");
    }

    function resetSearchResult() {
        $(".searchBoardList").html("");
    }
    function getToday() {
        let dateObj = new Date();
        let year = dateObj.getFullYear();
        let month = dateObj.getMonth() + 1 < 10 ? '0' + (dateObj.getMonth() + 1) : (dateObj.getMonth() + 1);
        let date = dateObj.getDate() < 10 ? '0' + dateObj.getDate() : dateObj.getDate();
        return year + '-' + month + '-' + date;
    }
</script>
</body>
</html>
