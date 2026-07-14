<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
         <title>Jesicar |<spring:message code="list.detail.1" text="메인 배너 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 |<spring:message code="list.detail.1" text="메인 배너 관리"/></title>
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
                    <li class="breadcrumb-item"><a href="${path}/driver/deliveryman/list"><spring:message code="sidemenu.workgroupmanagement.1" text="메인 배너 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.1" text="배너 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.1" text="메인 배너 등록"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="insert_form" id="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" name="dataStatus" value="1">
                            <input type="hidden" name="platformType" value="2">
                            <input type="hidden" name="bannerType" value="0">
                            <table class="table table-bordered">
                                <tbody>
                                <%--<tr>
                                  <td class="bg-light"><spring:message code="list.detail.postclassification" text="플랫폼 구분"/></td>
                                   <td>
                                       &lt;%&ndash;<label class="m-r-10" style="display: inline-flex; align-items: center">
                                           <input type="radio" name="platformType" value="0" class="m-t-1 m-r-3" checked>
                                           <span><spring:message code="list.detail.affiliate1" text="사용안함"/></span>
                                       </label>&ndash;%&gt;
                                           <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                               <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                   <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3" checked>
                                                   <span><spring:message code="list.detail.deliveryman1" text="직배"/></span>
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                               <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                   <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" checked>
                                                   <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                               </label>
                                           </c:if>
                                       &lt;%&ndash;<label class="m-r-10" style="display: inline-flex; align-items: center">
                                           <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" checked>
                                           <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                       </label>
                                       <label class="m-r-10" style="display: inline-flex; align-items: center">
                                           <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3">
                                           <span><spring:message code="list.detail.deliveryman1" text="양파오더"/></span>
                                       </label>
                                           <label class="" style="display: inline-flex; align-items: center">
                                               <input type="radio" name="platformType" value="3" class="m-t-1 m-r-3">
                                               <span><spring:message code="list.detail.deliveryman1" text="세날"/></span>
                                           </label>&ndash;%&gt;
                                   </td>
                               </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="노출서비스"/></td>
                                        <td>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="0" style="margin-right: 5px" checked>
                                                <span><spring:message code="list.detail.tothewhole1" text="메인"/></span>
                                            </label>
                                            <%--<c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="0" style="margin-right: 5px" checked>
                                                    <span><spring:message code="list.detail.tothewhole1" text="메인"/></span>
                                                </label>
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="2" style="margin-right: 5px">
                                                    <span><spring:message code="list.detail.affiliate1" text="탁송"/></span>
                                                </label>
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="3" style="margin-right: 5px">
                                                    <span><spring:message code="list.detail.affiliate1" text="맛집"/></span>
                                                </label>
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="serviceType" class="serviceType" value="4" style="margin-right: 5px">
                                                    <span><spring:message code="list.detail.affiliate1" text="마트"/></span>
                                                </label>
                                            </c:if>--%>

                                            <%--<label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="5" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate" text="맛집예약"/></span>
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
                                                <input type="radio" name="viewYn" value="0" style="margin-right: 5px" checked>
                                                <span><spring:message code="list.detail.tothewhole1" text="숨김"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="viewYn" value="1" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="노출"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="배너 노출여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="언어선택"/></td>
                                        <td>
                                            <select name="langCode" class="form-control w-25" >
                                                <c:forEach var="item2" items="${sysLangCode}" varStatus="status">
                                                    <option value="${item2.sysCode}">${item2.codeName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="언어를를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="앱코드"/></td>
                                        <td>
                                            <c:if test="${empty appCode}">
                                                <select name="appCode" class="form-control w-25" >
                                                   <%-- <option value="">전체</option>--%>
                                                    <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                        <option value="${appCodeList.sysCode}">${appCodeList.codeName}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                            <c:if test="${!empty appCode}">
                                                <input type="text" class="form-control" name="appCode" readonly value="${appCode}">
                                            </c:if>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="총판을 선택하세요"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="서비스지역"/></td>
                                        <td>
                                            <select name="serviceNo" class="form-control w-25" >
                                               <%-- <option value="">전체</option>--%>
                                                <c:forEach var="serviceList" items="${appServiceList}" varStatus="status">
                                                   <option value="${serviceList.serviceNo}" <c:if test="${serviceList.serviceNo == 1}"> selected</c:if> >${serviceList.serviceName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="서비스지역를 지정해주세요"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="게시판 종류"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" value="0" style="margin-right: 5px" checked>
                                                <span><spring:message code="list.detail.tothewhole1" text="연결안함"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" value="1" style="margin-right: 5px" >
                                                <span><spring:message code="list.detail.tothewhole1" text="이벤트"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" value="2" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="공지"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" value="3" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="앱화면"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" value="4" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate1" text="외부링크"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="게시판 종류를 선택하세요."/>
                                        </td>
                                    </tr>
                                   <%-- <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="주소별 노출사용여부"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="bannerType" value="0" style="margin-right: 5px" checked>
                                                <span><spring:message code="list.detail.tothewhole1" text="전체"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="bannerType" value="1" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.tothewhole1" text="주소"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="주소별 노출사용여부를 선택하세요."/>
                                        </td>
                                    </tr>--%>
                                    <tr class="location_tr" style="display: none;">
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image12" text="지역등록"/></td>
                                        <td>
                                            <select class="form-control selectArea" >
                                                <c:forEach var="item" items="${sysCodeList}" varStatus="status">
                                                    <option value="${item.sysCode}" code1Name="${item.codeName}">${item.codeName}</option>
                                                </c:forEach>
                                            </select>
                                            <select class="form-control selectArea2 w-50" >
                                                <option value="0">전체</option>
                                                <c:forEach var="item2" items="${sysCodeList2}" varStatus="status">
                                                    <option value="${item2.sysCode}" code2Name="${item2.codeName}" >${item2.codeName}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="button" id="selectAddr" class="btn btn-primary p-t-5 p-b-5 m-l-10"  value="<spring:message code="list.detail.addresssearch" text="주소등록"/>">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson12" text="."/></td>
                                    </tr>
                                    <tr class="location_tr" style="display: none;">
                                        <td class="bg-light"><spring:message code="list.detail.map" text="지역"/></td>
                                        <td>
                                            <%--<select class="form-control selectArea" >
                                                <c:forEach var="item" items="${sysCodeList}" varStatus="status">
                                                    <option value="${item.sysCode}" <c:if test="${tbStore.blockTypeCode == item.sysCode}" >selected</c:if>>${item.codeName}</option>
                                                </c:forEach>
                                            </select>
                                            <select class="form-control selectArea2 w-50" >
                                                    <option value="" >시/도를 선택해주세요.</option>
                                            </select>
                                            <input type="button" id="selectAddr" class="btn btn-primary p-t-5 p-b-5 m-l-10" value="<spring:message code="list.detail.addresssearch" text="주소선택"/>">--%>

                                            <input type="hidden" class="addr_1" id="addr_1" name="addr1" value="${tbStore.addr1}">
                                            <div class="panel-body p-0">
                                                <table id="testTable" class="display  table table-bordered w-100 table-striped ">
                                                    <thead>
                                                    <th class="text-center" style="width: 84px;">시/도</th>
                                                    <th class="text-center" style="width: 98px;">시/군/구</th>
                                                    <th class="text-center" style="width: 98px;"></th>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e; max-height: 150px">
                                                <ul class="attachList p-0" style="margin-bottom:0px;" >
                                                    <li class="p-0">
                                                        <div class="panel-body p-0" >
                                                            <table id="areaTable" class="display table table-bordered w-100 table-striped ">
                                                                <tbody class="areaTbody">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.addresssearchautosettingmessage" text="등록되어있는 시/도 시/군/구입니다 (변경불가)"/></td>
                                    </tr>
                                    <%--<input type="hidden" name="bannerType" value="0">--%>
                                    <input type="hidden" name="viewOrder" class="form-control viewOrder">
                                    <%--<tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="배너노출순서"/></td>
                                        <td>
                                            <input type="text" name="viewOrder" class="form-control viewOrder">
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="배너 노출순서를 입력하세요."/>
                                        </td>
                                    </tr>--%>
                                    <tr class="boardSelect">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="게시글 선택"/></td>
                                        <td>
                                            <input type="hidden" name="boardNo" class="selBoardNo">
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
                                    <tr class="appScheme" style="display: none">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="URL"/></td>
                                        <td>
                                            <input type="text" class="form-control w-25"  name="schemeUrl">
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="앱스키마 URL을 입력해주세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image12" text="배너 이미지"/></td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body1" id="sort_body1">
                                                            <img class="width-full" style="width: 192px; height: 54px" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
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
                    <div class="m-l-5">
                        <c:if test="${sessionScope.sessionKey.userRole == 0}">
                            <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.enrollment1" text="등록"/></button>
                        </c:if>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list1" text="목록"/></button>
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

        $(document).on("change", "input[name='boardType']", function() {
           if($(this).val() == 3 || $(this).val() == 4){
               $(".boardSelect").css("display","none");
               $(".appScheme").css("display","");
           } else {
               if($(this).val() == 0){
                   $(".boardSelect").css("display","none");
                   $(".appScheme").css("display","none");
               } else {
                   $(".boardSelect").css("display","");
                   $(".appScheme").css("display","none");
               }

           }
        });
        $(document).on("click", "#selBoardNoBtn", function() {
            $('#board_title').text('');
            let boardType = $("input[type='radio'][name='boardType']:checked").val();
            let boardTitle = $(this).closest("li").find(".board_text").text();
            let boardNo;
            if (boardType == 1) {
                boardNo = $(this).attr('eventNo');
            } else if(boardType == 2){
                boardNo = $(this).attr('noticeNo');
            } else if(boardType == 3){
                boardNo = "";
            }
            $('.selBoardNo').val(boardNo);
            $('#board_title').text(boardTitle);
            $('.boardModalCloseBtn').click();
        });
        let areaList = [];
        $(document).on("click", ".btn_add", function() {
            let url = "${path}/api/banner/insert";
            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed1" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister1" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment1" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let duplicatemsg = "<spring:message code="list.script.duplicateaccount1" text="계정이 중복되었습니다."/>";

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
                        let formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbAppBannerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        formData.append("areaList",  new Blob([JSON.stringify(areaList)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType="+data.serviceType+"&boardType=&platformType="+req.platformType;
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

        $("#selectAddr").click(function() {
            let word1 = $(".selectArea option:checked").text()
            let word2 = $(".selectArea2 option:checked").text()
            let code1 = $(".selectArea").val();
            let code2 = $(".selectArea2").val();

            let areaMap = { "code1" : code1, "code2": code2};
            let include = false;
            for (let i = 0; i < areaList.length ; i++ ){
                if(JSON.stringify(areaList[i]) == JSON.stringify(areaMap)){
                    include = true;
                }
            }

            if(!include){
                areaList.push(areaMap);
                $(".areaTbody").append(
                    " <tr code1="+code1+" code2="+code2+" class="+code1+code2+">" +
                    "     <td style='width:84px' >\n" +
                    word1+
                    "     </td>\n" +
                    "     <td style='width:98px' >\n" +
                    word2 +
                    "     </td>\n" +
                    "     <td style='width:98px' >\n" +
                    " <input  type=\"button\"  class='btn-sm btn-danger btn-companion deleteLocation' value=\"삭제\"></div>"+
                    "     </td>\n" +
                    " </tr>"
                );
            }
        });

        $(document).on("click", ".deleteLocation", function() {
            let code1 = $(this).parents("tr").attr("code1");
            let code2 = $(this).parents("tr").attr("code2");
            let areaMap = {code1: code1, code2: code2};
            for (let i = 0 ; i < areaList.length; i ++){
                if(JSON.stringify(areaList[i]) == JSON.stringify(areaMap)){
                     areaList.splice(i,1);
                }
            }
            let removeClass= "."+code1+code2;
           $(removeClass).remove();
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

        //게시글 검색
        $(".searchBoardBtn").on("click", () => {
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters1" text="검색된 게시글이 존재하지 않습니다."/>";
            let apply = "<spring:message code="list.script.apply1" text="적용"/>";
            // let req = convertFormToObj($('form.board_search_form'));
            //let platformType = $("input[type='radio'][name='platformType']:checked").val();
            let platformType = 2;
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
    });


    function inputDataCheck(args) {
        if (isNull(args.boardNo)) {
            if(args.boardType != 0 && args.boardType != 3 && args.boardType != 4) {
                return alert_focus("board-search-btn", "게시글을 검색후 선택해주세요");
            }
        } else if (isNull($("#imgFile")[0].files[0])) {
            return alert_focus("button_base", "배너이미지를 선택해주세요");
        }

        if(args.boardType == 3 && args.boardType == 4 && args.schemeUrl == "") {
            return alert_focus("board-search-btn", "URL을 입력해주세요");
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

   /* function getToday() {
        let dateObj = new Date();
        let year = dateObj.getFullYear();
        let month = dateObj.getMonth() + 1 < 10 ? '0' + (dateObj.getMonth() + 1) : (dateObj.getMonth() + 1);
        let date = dateObj.getDate() < 10 ? '0' + dateObj.getDate() : dateObj.getDate();
        return year + '-' + month + '-' + date;
    }*/
</script>
</body>
</html>
