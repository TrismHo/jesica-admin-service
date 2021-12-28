<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.deiliveryfeedetail" text="배송요금 상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/></li>
                    <li class="breadcrumb-item"><spring:message code="sidemenu.merchantsetting.deiliveryfee" text="배송요금"/></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.deiliveryfeedetail" text="배송요금 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.deiliveryfeedetail" text="배송요금 상세"/></h3>
            </div>
            <div class="m-t-10">
                 <table class="table table-bordered">
                     <tr>
                         <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroupmanagement" text="업무그룹"/></strong></td>
                         <td style="width:35%">
                             <span class="text-green">[H${tbStore.headNo}]</span> ${tbStore.head.headName} |
                             <span class="text-green">[B${tbStore.branchNo}]</span> ${tbStore.branch.branchName}

                         </td>
                         <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/></strong></td>
                         <td>
                             <span class="text-green">[S${tbStore.storeNo}]</span> ${tbStore.storeName}
                         </td>
                     </tr>
                 </table>
             </div>
          <%--  <div class="m-t-10">
                <table class="table table-bordered">
                    <td class="bg-light ">소속 업무그룹</td>
                    <td style="">
                        <label>
                            <input type="text" data-toggle="modal" data-target="#head_search_modal"  placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-150" readonly>
                        </label>
                        <label>
                            <input type="text" data-toggle="" data-target="#branch_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-150" readonly>
                        </label>
                        <label>
                            <input type="text" data-toggle="" data-target="#store_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-150" readonly>
                        </label>
                    </td>
                </table>
            </div>--%>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.feesbymerchant" text="가맹점별 요금"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.feesbymerchant" text="가맹점별 요금"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">

                <!-- begin tab-pane -->
                <%--<div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="true">
                        <div class="table-responsive">
                            <form id="update_form" name="update_form">
                                <table class="table table-bordered">
                                    <input type="hidden" class="storeNo" name="storeNo" value="${tbStore.storeNo}">
                                    <tr>
                                        <td class="bg-light height-50">관리비 정산타입</td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="mngChargeType" value="1" class="align-bottom mngChargeType" <c:if test="${tbStoreMngCharge.mngChargeType == 1}">checked</c:if>> <spring:message code="merchandise.insert.option1" text="월차감"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="mngChargeType" value="2" class="align-bottom mngChargeType" <c:if test="${tbStoreMngCharge.mngChargeType == 2}">checked</c:if>> <spring:message code="merchandise.insert.option1" text="일차감"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">배송원 수수료 할인여부를 선택해주세요 </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">관리비 정산대상</td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="mngTargetType" value="1" class="align-bottom mngTargetType" <c:if test="${tbStoreMngCharge.mngTargetType == 1}">checked</c:if>> <spring:message code="merchandise.insert.option1" text="소속총판"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="mngTargetType" value="2" class="align-bottom mngTargetType" <c:if test="${tbStoreMngCharge.mngTargetType == 2}">checked</c:if>> <spring:message code="merchandise.insert.option1" text="소속배송그룹"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">관리비 정산대상을 선택해주세요 </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">금액</td>
                                        <td>
                                            <input class="form-control width-200" type="text"  name="mngPrice" value="${tbStoreMngCharge.mngPrice}" numberOnly> 원
                                        </td>
                                        <td class="text-danger-darker">금액을 입력해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">차감시작일</td>
                                        <td><input class="form-control width-200 mngChargeStart" type="text"  name="mngChargeStart" value="${tbStoreMngCharge.mngChargeStart}" ></td>
                                        <td class="text-danger-darker">차감시작일을 선택해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">차감일</td>
                                        <td>
                                            <select class="form-control mngChargeDay" name="mngChargeDay">
                                                <c:forEach begin="01" end="28" var="month">
                                                    <c:if test="${month lt 10}"><option value="0${month}" <c:if test="${tbStoreMngCharge.mngChargeDay == month}">selected</c:if> >0${month}</c:if> 일</option>
                                                    <c:if test="${month gt 9}"><option value="${month}" <c:if test="${tbStoreMngCharge.mngChargeDay == month}">selected</c:if>>${month}</c:if> 일</option>
                                                </c:forEach>
                                                <option value="29" <c:if test="${tbStoreMngCharge.mngChargeDay == 29}">selected</c:if>>말일</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker">차감일을 선택해주세요 (월차감 전용)</td>
                                    </tr>
                                </table>
                            </form>

                        </div>
                    </div>
                </div>--%>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form id="update_form" name="update_form">
                            <table class="table table-bordered">
                                <input type="hidden" class="storeNo" name="storeNo" value="${tbStore.storeNo}">
                                <tr>
                                    <td class="bg-light height-50 width-200"><spring:message code="list.detail.whethertousemerchantfeesetting" text="가맹점 요금설정 사용여부"/></td>
                                    <td >
                                        <label class="">
                                            <input type="radio" name="useYn" value="0" class="align-bottom useYn" <c:if test="${tbStoreDlvyCharge.useYn == 0}">checked</c:if>> <spring:message code="list.detail.unused" text="미사용"/>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="useYn" value="1" class="align-bottom useYn" <c:if test="${tbStoreDlvyCharge.useYn == 1}">checked</c:if>> <spring:message code="list.detail.used" text="사용"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.setwhethertousethemerchantfeesetting" text="가맹점 요금설정 사용여부를 설정해주세요"/></td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light height-50"><spring:message code="list.detail.classificationofplan" text="요금제 구분"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyChargeType" value="1" class="align-bottom dlvyChargeType" <c:if test="${tbStoreDlvyCharge.dlvyChargeType == 1}">checked</c:if>> <spring:message code="list.detail.streetfaresystem" text="거리구간요금제"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyChargeType" value="2" class="align-bottom dlvyChargeType" <c:if test="${tbStoreDlvyCharge.dlvyChargeType == 2}">checked</c:if>> <spring:message code="list.detail.blockratesystem" text="블럭요금제"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleasesetupyourplan" text="요금제를 설정해주세요."/></td>
                                </tr>
                                <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
                                <tr class="visibleTr">
                                    <td class="bg-light height-50"><spring:message code="list.detail.sectionfaresystemnumber" text="구간요금제 번호"/> </td>
                                    <td>
                                        <select class="form-control width-200" name="priceChargeNo">
                                           <c:choose>
                                                <c:when test="${tbDlvyPriceChargeList.size() > 0}">
                                                   <c:forEach items="${tbDlvyPriceChargeList}" var="item" varStatus="status">
                                                        <option value="${item.priceChargeNo}" <c:if test="${tbStoreDlvyCharge.priceChargeNo == item.priceChargeNo}">selected</c:if> >${item.priceChargeName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value=""><spring:message code="list.description.thereisnoregisteredplan" text="등록된 요금제가 없습니다."/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"> <spring:message code="list.description.selectasectionfaresystem" text="구간요금제를 선택해주세요."/></td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light"> <spring:message code="list.detail.blockratesystemnumber" text="블럭요금제 번호"/></td>
                                    <td>
                                        <select class="form-control width-200" name="areaChargeNo">

                                            <c:choose>
                                                <c:when test="${tbDlvyAreaChargeList.size() > 0}">
                                                    <c:forEach items="${tbDlvyAreaChargeList}" var="item" varStatus="status">
                                                        <option value="${item.areaChargeNo}" <c:if test="${tbStoreDlvyCharge.areaChargeNo == item.areaChargeNo}">selected</c:if>>${item.areaChargeName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value=""><spring:message code="list.description.thereisnoregisteredplan" text="등록된 요금제가 없습니다."/></option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectablockrateplan" text="블럭요금제를 선택해주세요"/></td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light height-50"><spring:message code="list.detail.snowpremium" text="눈비할증"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="weatherChargeYn" value="0" class="align-bottom weatherChargeYn" <c:if test="${tbStoreDlvyCharge.weatherChargeYn == 0}">checked</c:if>> <spring:message code="list.detail.unused" text="미사용"/>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="weatherChargeYn" value="1" class="align-bottom weatherChargeYn" <c:if test="${tbStoreDlvyCharge.weatherChargeYn == 1}">checked</c:if>> <spring:message code="list.detail.used" text="사용"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectthesnowandrainsurcharge" text="눈비할증여부를 선택해주세요."/></td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light"><spring:message code="list.detail.snowandrainsurcharge" text="눈비할증 요금"/></td>
                                    <td>
                                        <input type="text" name="weatherCharge" value="${tbStoreDlvyCharge.weatherCharge}" class="form-control  weatherCharge" numberOnly maxlength="7"> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthesnowandrainsurcharge" text="눈비할증 요금을 입력해주세요"/></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
               <%-- <div class="tab-pane fade" id="default-tab-3">
                    <div class="table-responsive">
                        <form id="update_form2" name="update_form2">
                            <table class="table table-bordered">
                                <input type="hidden" class="storeNo" name="storeNo" value="${tbStore.storeNo}">
                                <tr>
                                    <td class="bg-light height-50 width-200">가맹점 요금설정 사용여부</td>
                                    <td >
                                        <label class="">
                                            <input type="radio" name="useYn" value="0" class="align-bottom useYn" <c:if test="${tbStoreDlvyCharge.useYn == 0}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="미사용"/>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="useYn" value="1" class="align-bottom useYn" <c:if test="${tbStoreDlvyCharge.useYn == 1}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="사용"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">가맹점 요금설정 사용여부를 설정해주세요</td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light height-50">요금제 구분</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyChargeType" value="1" class="align-bottom dlvyChargeType" <c:if test="${tbStoreDlvyCharge.dlvyChargeType == 1}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="거리구간요금제"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyChargeType" value="2" class="align-bottom dlvyChargeType" <c:if test="${tbStoreDlvyCharge.dlvyChargeType == 2}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="블럭요금제"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">요금제를 설정해주세요</td>
                                </tr>
                                <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
                                <tr class="visibleTr">
                                    <td class="bg-light height-50">구간요금제 번호 </td>
                                    <td>
                                        <select class="form-control width-200" name="priceChargeNo">
                                            <c:choose>
                                                <c:when test="${tbDlvyPriceChargeList.size() > 0}">
                                                    <c:forEach items="${tbDlvyPriceChargeList}" var="item" varStatus="status">
                                                        <option value="${item.priceChargeNo}" <c:if test="${tbStoreDlvyCharge.priceChargeNo == item.priceChargeNo}">selected</c:if> >${item.priceChargeName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="">등록된 요금제가 없습니다.</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker">구간요금제 번호를 선택해주세요 </td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light">블럭요금제 번호 </td>
                                    <td>
                                        <select class="form-control width-200" name="areaChargeNo">

                                            <c:choose>
                                                <c:when test="${tbDlvyAreaChargeList.size() > 0}">
                                                    <c:forEach items="${tbDlvyAreaChargeList}" var="item" varStatus="status">
                                                        <option value="${item.areaChargeNo}" <c:if test="${tbStoreDlvyCharge.areaChargeNo == item.areaChargeNo}">selected</c:if>>${item.areaChargeName}</option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="">등록된 요금제가 없습니다.</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker">블럭요금제 번호를 선택해주세요</td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light height-50">눈비할증</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="weatherChargeYn" value="0" class="align-bottom weatherChargeYn" <c:if test="${tbStoreDlvyCharge.weatherChargeYn == 0}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="미사용"/>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="weatherChargeYn" value="1" class="align-bottom weatherChargeYn" <c:if test="${tbStoreDlvyCharge.weatherChargeYn == 1}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="사용"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">눈비할증여부를 선택해주세요</td>
                                </tr>
                                <tr class="visibleTr">
                                    <td class="bg-light">눈비할증 요금</td>
                                    <td>
                                        <input type="text" name="weatherCharge" value="${tbStoreDlvyCharge.weatherCharge}" class="form-control  weatherCharge" numberOnly> 원
                                    </td>
                                    <td class="text-danger-darker">눈비할증 요금을 입력해주세요</td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>--%>
                <!-- end tab-pane -->
                <div class="m-t-10">
                    <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/>-</button>
                    <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                </div>
            </div>
            <!-- end tab-content -->
            <!-- begin nav-pills -->
            <!-- end nav-pills -->
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
   <%-- <div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../../search/headSearch.jsp" %>
    </div>
    <div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../../search/branchSearch.jsp" %>
    </div>
    <div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../../search/storeSearch.jsp" %>
    </div>--%>
</div>

<%--modal insertRental start--%>
<%--modal insertRental end--%>

<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
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
        $("input[name=weatherCharge]").focus(function(){
            /*  $(this).val('');*/
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });



        $("input[name=useYn]").on("change", function () {

            if($(this).val() == 0 ){
                $(".visibleTr").css("display", "none");
            } else {
                $(".visibleTr").css("display", "");
            }
        });
        $(".list_btn").click(function () {
            location.href = "${path}/merchant/storedlvycharge/list";
        });

        $(".btn_update").click(function() {
            let url = "${path}/api/storedlvycharge/update/action";
     /*       let joinDate = replaceAll($(".mngChargeStart").val(),"-","");
            $(".mngChargeStart").val(joinDate);*/
    /*        let joinDate2 = replaceAll($(".plfStartDate").val(),"-","");
            $(".plfStartDate").val(joinDate2);*/

            let _forms1 = $('#update_form');
            let req = convertFormToObj(_forms1);
            /*let req2 = convertFormToObj(_forms2);*/

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            if (inputDataCheck(req)) {
                swal({
                    title: wouldyouliketoupdate,
                    icon: "warning",
                    buttons: [
                        cancel,
                        update
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {

                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbStoreDlvyChargeData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        /*formData.append("tbUserWorker",  new Blob([JSON.stringify(req2)], {type:"application/json"}));*/
                        $.ajax({
                            type: "POST",
                            url: url,
                            data:  formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    /*location.href = "${path}/workgroup/deliveryman/list"*/
                                    alert(updatesussmsg);
                                    location.reload();
                                } else {
                                    alert(editfailed);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        $(".chargeStartDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        if($(".chargeStartDate").val() ==  ""){
            $(".chargeStartDate").datepicker('setDate', new Date());
        }

        $(".plfStartDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        if($(".plfStartDate").val() ==  ""){
            $(".plfStartDate").datepicker('setDate', new Date());
        }



    });

    function inputDataCheck(args) {
        console.log(args);
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@#$%&\\\=\(\'\"]/gi;

        /* if(regExp.test(args.LoginId)){
             return alert_focus("LoginId", "로그인ID에는 특수문자를 사용할수없습니다.");
             s        }

         if (isNull(args.bmLoginId)) {
             return alert_focus("LoginId", "로그인ID를 입력해주세요.");
         } else if (isNull(args.LoginPwd)) {
             return alert_focus("LoginPwd", "비밀번호를 입력해주세요");
         } else if (isNull(args.Name)) {
             return alert_focus("Name", "이름을 입력해주세요");
         } else if(!pwCheck) {
             return alert_focus("LoginPwd", "비밀번호는 8자리 이상, 영문+숫자+특수문자로 조합하여 설정해주세요.");
         }*/
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }


</script>
</body>
</html>
