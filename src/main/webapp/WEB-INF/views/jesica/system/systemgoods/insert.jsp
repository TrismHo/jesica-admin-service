<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.systemproductregistration" text="시스템 상품등록"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.system" text="시스템 운영"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.system.systemmerchandise" text="시스템 상품"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.systemproductregistration" text="시스템 상품등록"/><%--<spring:message code="list.detailtitle" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.systemproductregistration" text="시스템 상품등록"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="timeline-header m-t-10 m-b-10">
                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                        <span><strong><spring:message code="list.detail.basicInformation" text="기본정보"/></strong></span>
                    </div>
                    <form id="insert_form" class="insert_form">
                        <table class="table table-condensed table-bordered">
                            <tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.productname" text="상품명" /><%--상품상태--%></td>
                                <td colspan="1">
                                    <label class="font-size-10">
                                        <input type="text" class="form-control width-200 goodsName" name="goodsName" value="" placeholder="<spring:message code="list.detail.productname" text="상품명" />" maxlength="80">
                                    </label>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheproductname" text="상품 이름을 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.productprice" text="상품가격" /><%--상품상태--%></td>
                                <td colspan="1">
                                    <label class="font-size-10">
                                        <input type="text" class="form-control width-200 goodsPrice" name="goodsPrice" value="0" placeholder="<spring:message code="list.detail.productprice" text="상품가격" />" maxlength="7" numberOnly>
                                    </label>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.enterthesellingpriceoftheproduct" text="상품 판매 가격을 입력하세요." /></td>
                            </tr>
                            <tr>
                                <td class="bg-light height-50"><spring:message code="list.detail.productmemo" text="상품메모" /></td>
                                <td colspan="1">
                                    <label class="font-size-10">
                                        <input type="text" class="form-control goodsMemo width-200" name="goodsMemo" value="" placeholder="<spring:message code="list.detail.productmemo" text="상품메모" />" maxlength="180">
                                    </label>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenterproductnotes" text="상품메모를 입력하세요." /></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.categorycode" text="카테고리코드" /><%--상품상태--%></td>
                                <td colspan="1">
                                    <select id="systemCategory1" class="form-control catCode1">
                                        <option value=""  style="color: #d3d8dd;"><spring:message code="list.detail.selection" text="선택" /></option>
                                        <c:forEach var="item"  items="${categoryList}"  varStatus="status">
                                            <option value="${item.catCode}"> ${item.catName}</option>
                                        </c:forEach>
                                    </select>
                                    <select id="systemCategory2" class="form-control catCode2" >
                                        <option value=""  style="color: #d3d8dd;"><spring:message code="list.detail.selection" text="선택" /></option>
                                    </select>
                                    <select id="systemCategory3" class="form-control catCode3" >
                                        <option value=""  style="color: #d3d8dd;"><spring:message code="list.detail.selection" text="선택" /></option>
                                    </select>
                                    <input type="hidden" name="catCode" value="">
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteracategory" text="카테고리를 입력하세요." /></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.barcode" text="바코드"/><%----%></td>
                                <td><input type="text" class="form-control width-200 barcode" name="barcode" value="" placeholder="<spring:message code="list.detail.barcode" text="바코드"/>" maxlength="20">
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthebarcode" text="바코드를 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td class="bg-light height-50"><spring:message code="list.description.productstatus" text="상품상태"/></td>
                                <td>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="dataStatus" class="align-bottom dataStatus" value="OK" checked><spring:message code="list.detail.normal" text="정상"/>
                                    </label>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="dataStatus" class="align-bottom dataStatus" value="STOP" ><spring:message code="list.detail.stop" text="정지"/>
                                    </label>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseselecttheproductstatus" text="상품상태를 선택해주세요."/></td>
                            </tr>
                            <tr>
                                <td class="bg-light height-50"><spring:message code="list.detail.taxation" text="과세여부"/></td>
                                <td>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="taxYn" class="align-bottom taxYn" value="false" checked><spring:message code="list.detail.taxfree" text="비과세"/>
                                    </label>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="taxYn" class="align-bottom taxYn" value="true" ><spring:message code="list.detail.taxation" text="과세"/>
                                    </label>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseselectwhethertotaxmessage" text="매입시 과세/비과세 여부를 선택하세요"/></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.productdescription" text="상품 설명"/><%--상품 설명--%></td>
                                <td><textarea class="form-control width-full" rows="5"  id="goodsDetail" name="goodsDetail" maxlength="900"></textarea></td>
                                <td class="text-danger-darker"><spring:message code="list.description.entertheproductsettingmessage" text="앱에 표시될 상품 설명을 입력하세요."/></td>
                            </tr>
                        </table>
                        <br>
                        <div>
                            <div class="timeline-header m-t-10 m-b-10">
                                <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                <span>
                                    <spring:message code="list.detail.photoinformation" text="사진정보"/>
                                </span>
                            </div>
                            <div id="dropzone1">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light">  * <spring:message code="list.detail.productthumbnaillist" text="상품 썸네일"/> <%--(리스트)--%></td>
                                        <td class="bg-light">  * <spring:message code="list.detail.productimagedetailscreen" text="상품 이미지"/> <%--(상세화면)--%></td>
                                    </tr>
                                    <tr >
                                        <td>
                                            <div class="category_sort">

                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body1" id="sort_body1">
                                                            <img style="width: 250px;" class="systemImg" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                            <%--<img class="img-preview" src="data:image/png;base64,${tbStoreGoodsDetail.imgFile1}"
                                                                 onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">--%>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <%--* 권장 이미지 비율 : 984*876<br>--%>
                                                        <div class="onlinePlatFormFileName m-b-10 m-t-5"></div>
                                                        <div class="onlinePlatFormFileSize"></div>
                                                    </li>
                                                </ul>
                                                <label for="imgFile1">
                                                    <div id="button_base4"
                                                         class="button_base b03_skewed_slide_in btn btn-primary">
                                                        <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                    </div>
                                                </label>
                                                <input type="file" id="imgFile1" name="imgFile1" value="" class="fileBtn d-none">
                                                <input type="hidden" name="imgFile1" value="">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body2" id="sort_body2">
                                                            <img style="width: 250px;" class="systemImg2" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <%--* 권장 이미지 비율 : 984*876<br>--%>
                                                        <div class="onlinePlatFormFileName2 m-b-10 m-t-5"></div>
                                                        <div class="onlinePlatFormFileSize2"></div>
                                                    </li>
                                                </ul>
                                                <label for="imgFile2">
                                                    <div id="button_base"
                                                         class="button_base b03_skewed_slide_in btn btn-primary">
                                                        <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                    </div>
                                                </label>
                                                <input type="file" id="imgFile2" name="imgFile2" value=""
                                                       class="fileBtn d-none">
                                                <input type="hidden" name="imgFile2" value="">
                                                <input type="hidden" name="imgFileSmall" value="">
                                            </div>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <%-- <form action="/upload" class="dropzone needsclick file-zone1" id="file-dropzone1">
                                     <div class="dz-message needsclick">
                                         <b><spring:message code="merchandisecont.merchandisedetail.merchandisedetailone.listimage" text="리스트 이미지"/></b>
                                         <span class="dz-note needsclick">
                                             <spring:message code="merchandisecont.merchandisedetail.merchandisedetailone.listdropzone" text="-리스트 이미지 드래그&드롭 ZONE"/>
                                     </div>
                                 </form>--%>
                            </div>
                            <%-- <div id="dropzone1">
                                  <form action="/upload" class="dropzone needsclick file-zone1" id="file-dropzone1">
                                      <div class="dz-message needsclick">
                                          <b><spring:message code="merchandisecont.merchandisedetail.merchandisedetailone.listimage" text="리스트 이미지"/></b>
                                          <span class="dz-note needsclick">
                                                     <spring:message code="merchandisecont.merchandisedetail.merchandisedetailone.listdropzone" text="-리스트 이미지 드래그&드롭 ZONE"/>
                                      </div>
                                  </form>
                              </div>--%>
                            <%--  <div id="dropzone2">
                                  <form action="/upload" class="dropzone needsclick file-zone2" id="file-dropzone2">
                                      <div class="dz-message needsclick">
                                          <b><spring:message code="merchandisecont.merchandisedetail.merchandisedetailone.detailimage" text="상세 이미지"/></b>
                                          <span class="dz-note needsclick">
                                                      <spring:message code="merchandisecont.merchandisedetail.merchandisedetailone.detailidropzone" text="상세 이미지 드래그&드롭 ZONE"/>
                                                    </span>
                                      </div>
                                  </form>
                              </div>--%>
                            <input type="file" id="imgFile2"  class="dz-hidden-input" style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                        </div>
                        <!-- end tab-pane -->
                        <%--<div class="m-t-5 m-l-5">
                            <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="button.list" text="목록"/>&lt;%&ndash;목록&ndash;%&gt;&lt;%&ndash;<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                            <button type="button" class="btn btn-primary update_btn float-left m-t-5 m-l-20"  onclick="udt_btn()"><i class="fa fa-check m-r-3"></i> <spring:message code="button.update" text="등록"/>&lt;%&ndash;수정&ndash;%&gt;&lt;%&ndash;<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                        </div>--%>
                    </form>


                    <%--<div class="table-responsive m-l-5">
                        <form class="update_form" id="update_form">
                            <input type="hidden" class="goodsNo" name="goodsNo" value="${tbSystemGoods.goodsNo}">
                            <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <td class="bg-light text-center width-100">카테고리코드&lt;%&ndash;<spring:message code="list.detailmerchanname" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</td>
                                <td colspan="3">
                                    <label>
                                        <input type="text" class="form-control catCode" name="catCode" value="${tbSystemGoods.systemCategory.catCode}">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center width-100">상품명&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control goodsName" name="goodsName" value="${tbSystemGoods.goodsName}">
                                    </label>
                                </td>
                                <td class="bg-light text-center width-100">상품가격&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control goodsPrice" name="goodsPrice" value="${tbSystemGoods.goodsPrice}" numberOnly>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center">바코드&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control barcode" name="barcode" value="${tbSystemGoods.barcode}">
                                    </label>
                                </td>
                                <td class="bg-light text-center">상품메모&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control goodsMem width-full" name="goodsMemo" value="${tbSystemGoods.goodsMemo}">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center height-50">과세여부&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="taxYn" class="align-bottom taxYn" value="false" <c:if test="${tbSystemGoods.taxYn == false}">checked</c:if>>비과세&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="taxYn" class="align-bottom taxYn" value="true" <c:if test="${tbSystemGoods.taxYn == true}">checked</c:if>>과세&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                    </label>
                                </td>
                                <td class="bg-light text-center height-50">상품상태&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="dataStatus" class="align-bottom dataStatus" value="OK" <c:if test="${tbSystemGoods.dataStatus == 'OK'}">checked</c:if>>정상&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label class="m-r-10 ">
                                        <input type="radio" name="dataStatus" class="align-bottom dataStatus" value="STOP" <c:if test="${tbSystemGoods.dataStatus == 'STOP'}">checked</c:if>>정지&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center">상품상태&lt;%&ndash;<spring:message code="list.detailmerchanstatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품상태&ndash;%&gt;</td>
                                <td colspan="3">
                                   <textarea class="form-control width-full" rows="10"  id="goodsDetail" name="goodsDetail">${tbSystemGoods.goodsDetail}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center">첨부파일&lt;%&ndash;<spring:message code="list.detailstoresalestatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;매장 판매상태&ndash;%&gt;</td>
                                <td class="p-0" colspan="3">
                                    <table class="width-full">
                                        <thead>
                                        <tr class="text-center">
                                            <th class="border-0">목록</th>
                                            <th class="border-top-0 border-right-0 border-bottom-0">상세</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="border-left-0 border-bottom-0">
                                                <div class="category_sort">
                                                    <ul class="sort_list d-block">
                                                        <li>
                                                            <div class="m-b-10">* 권장 이미지 비율 : 984*876</div>
                                                            <div class="sort_body1" id="sort_body1">
                                                                <img class="width-full systemImg" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="imgFile1" class="m-t-20">
                                                                <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                                    <div>파일선택</div>
                                                                </div>
                                                            </label>
                                                            <br>
                                                            <br>
                                                            <div class="fileName1"></div>
                                                            <br>
                                                            <div class="fileSize1"></div>
                                                        </li>
                                                    </ul>
                                                    <input type="file" id="imgFile1" name="imgFile1" value="${tbSystemGoods.imgFile1}" class="fileBtn d-none">
                                                    <input type="hidden" name="imgFile1" value="${tbSystemGoods.imgFile1}">
                                                </div>
                                            </td>
                                            <td class="border-bottom-0 border-right-0">
                                                <div class="category_sort">
                                                    <ul class="sort_list d-block">
                                                        <li>
                                                            <div class="m-b-10">* 권장 이미지 비율 : 984*876</div>
                                                            <div class="sort_body2" id="sort_body2">
                                                                <img class="width-full systemImg2" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <label for="imgFile2" class="m-t-20">
                                                                <div id="button_base2" class="button_base b03_skewed_slide_in btn btn-primary">
                                                                    <div>파일선택</div>
                                                                </div>
                                                            </label>
                                                            <br>
                                                            <br>
                                                            <div class="fileName2"></div>
                                                            <br>
                                                            <div class="fileSize2"></div>
                                                        </li>
                                                    </ul>
                                                    <input type="file" id="imgFile2" name="imgFile2" value="${tbSystemGoods.imgFile2}" class="fileBtn d-none">
                                                    <input type="hidden" name="imgFile2" value="${tbSystemGoods.imgFile2}">
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </form>
                    </div>--%>
                    <div class="m-l-5">
                        <%--<button type="button" class="btn btn-danger btn_remove float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-trash-alt m-r-3"></i> 삭제&lt;%&ndash;<spring:message code="list.detailinsertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>--%>
                        <button type="button" class="btn btn-primary btn_insert float-left m-t-5 m-b-5 m-r-5 "><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/></button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
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

<%--modal search start--%>
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

        $("#systemCategory1").on("change",function(){
            let parentCatCode = $(this).val();
            searchSystemCate(parentCatCode,2);
        });

        $("#systemCategory2").on("change",function(){
            let parentCatCode = $(this).val();
            searchSystemCate(parentCatCode,3);
        });

        $("input[name=goodsPrice]").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });

        $(".btn_list").click(function() {
            location.href="${path}/system/systemgoods/list";
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
            let url = "${path}/api/systemgoods/detail/insert";
            let catCode1 = $(".catCode1").val();
            let catCode2 = $(".catCode2").val();
            let catCode3 = $(".catCode3").val();

            let addmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let registrationfailed = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let enrollmentmsg = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancelmsg = "<spring:message code="list.script.cancel" text="취소"/>";

            if(catCode2 == "") {
                $("input[name=catCode]").val(catCode1);
            } else if (catCode3 == "") {
                $("input[name=catCode]").val(catCode2);
            } else {
                $("input[name=catCode]").val(catCode3);
            }

            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);

            /*            let goodsDcStartYYYYMM = $(".goodsDcStartYYYYMM").val().replaceAll('-','');
                        let goodsDcEndYYYYMM = $(".goodsDcEndYYYYMM").val().replaceAll('-','');
                        let goodsDcStartHHMI = $(".goodsDcStartHH").val() + $(".goodsDcStartMI").val() ;
                        let goodsDcEndHHMI = $(".goodsDcEndHH").val() + $(".goodsDcEndMI").val();*/


            /*  $("#goodsDcStart").val(goodsDcStartYYYYMM+goodsDcStartHHMI);
              $("#goodsDcEnd").val(goodsDcEndYYYYMM+goodsDcEndHHMI);*/

            if (inputDataCheck(req)) {
                swal({
                    title: addmsg,
                    icon: "warning",
                    buttons: [
                        cancelmsg,
                        enrollmentmsg
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if(isConfirm){
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbSystemGoodsData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile1",_forms.find('#imgFile1')[0]);
                        formData.append("imgFile2",_forms.find('#imgFile2')[0]);
                        /*formData.append("imgFile3",_forms.find('#imgFile3')[0]);*!/*/
                        formData.append("imgFileSmall",_forms.find('#imgFile1')[0]);
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
                                    location.href="${path}/system/systemgoods/list";
                                } else {
                                    alert(registrationfailed);
                                    return;
                                }
                            }
                        });
                    }

                    /* if (isConfirm) {
                         $.ajax({
                             type: "POST",
                             url: url,
                             data: JSON.stringify(req),
                             contentType: "application/json;",
                             dataType: "json",
                             success: function(data) {
                                 if(data.result == 200) {
                                     location.reload();
                                 } else {
                                     alert("등록에 실패하였습니다.");
                                     return;
                                 }
                             }
                         });
                     }*/
                });
            }
        });

        //온라인플랫폼이미지
        $(document).on("change", "#imgFile1", function (e) {
            e.preventDefault();

            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";

            var result = chk_file_type(this);

            var file = $("#imgFile1")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 220) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 220;
                    }
                    if (img.height > 130) {
                        img.height = 130;
                    }
                    sort_body1.innerHTML = '';
                    sort_body1.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFile1").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName').text(imagetochange +" :" + filename);
            $('.onlinePlatFormFileSize').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });

        //온라인플랫폼이미지
        $(document).on("change", "#imgFile2", function (e) {
            e.preventDefault();
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";

            var result = chk_file_type(this);

            var file = $("#imgFile2")[0].files[0],
                reader = new FileReader();
            /!*파일 읽기를 시작*!/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /!*읽기가 끝나고 난후에*!/
                reader.onloadend = function (e) {
                    if (img.width > 220) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 220;
                    }
                    if (img.height > 130) {
                        img.height = 130;
                    }
                    sort_body2.innerHTML = '';
                    sort_body2.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFile2").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName2').text(imagetochange+" :" + filename);
            $('.onlinePlatFormFileSize2').text(sizemsg+" :" + file.size + " Byte");

            return false;
        });

        //온라인플랫폼이미지
       /* $(document).on("change", "#imgFile3", function (e) {
            e.preventDefault();

            var file = $("#imgFile3")[0].files[0],
                reader = new FileReader();
            /!*파일 읽기를 시작*!/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /!*읽기가 끝나고 난후에*!/
                reader.onloadend = function (e) {
                    if (img.width > 220) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 220;
                    }
                    if (img.height > 130) {
                        img.height = 130;
                    }
                    sort_body3.innerHTML = '';
                    sort_body3.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFile3").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName3').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize3').text("용량 :" + file.size + " Byte");

            return false;
        });*/

        //온라인플랫폼이미지
        $(document).on("change", "#imgFileSmall", function (e) {
            e.preventDefault();
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";
            var result = chk_file_type(this);

            var file = $("#imgFileSmall")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 220) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 220;
                    }
                    if (img.height > 130) {
                        img.height = 130;
                    }
                    sort_body4.innerHTML = '';
                    sort_body4.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFileSmall").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName4').text(imagetochange +" :" + filename);
            $('.onlinePlatFormFileSize4').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });

    });
    function inputDataCheck(args) {
        let productmsg = "<spring:message code="list.script.pleaseentertheproductname" text="상품명을 입력해주세요"/>";
        let productpricemsg = "<spring:message code="list.script.pleaseentertheproductprice" text="상품가격을 입력해주세요"/>";
        if (isNull(args.goodsName)) {
            return alert_focus("goodsName", productmsg);
        } else if (isNull(args.goodsPrice)) {
            return alert_focus("goodsPrice", productpricemsg);
        }
        return true;
    }

    function searchSystemCate(parantCatCode,level){
        let productpricemsg = "<spring:message code="list.script.pleaseentertheproductprice" text="상품가격을 입력해주세요"/>";
        let select = "<spring:message code="list.script.select" text="선택"/>";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/systemCate/list",
            data: JSON.stringify({
                parentCatCode : parantCatCode,
                catLevel : level
            }),
            contentType: "application/json;",
            dataType: "json",
            success: function (data) {
                let searchCateList = data.searchCateList;
                if(level == 2) {
                    $("#systemCategory2").html("<option value=''>"+select+"</option>");
                    $("#systemCategory3").html("<option value=''>"+select+"</option>");
                    for (var i = 0 ; i < searchCateList.length ; i++) {
                        $("#systemCategory2").append("<option value="+searchCateList[i].catCode+">"+searchCateList[i].catName+"</option>")
                    }

                } else if (level == 3) {
                    $("#systemCategory3").html("<option value=''>+select+</option>");
                    for (var i = 0 ; i < searchCateList.length ; i++) {
                        $("#systemCategory3").append("<option value="+searchCateList[i].catCode+">"+searchCateList[i].catName+"</option>")
                    }
                }
            }
        });
    }

    function chk_file_type(obj) {
        let select = "<spring:message code="list.script.select" text="선택"/>";
        let imgfilemsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="이미지 파일만 업로드 가능합니다."/>";
        var file_kind = obj.value.lastIndexOf('.');
        var file_name = obj.value.substring(file_kind+1,obj.length);
        var file_type = file_name.toLowerCase();
        var check_file_type = new Array();
        check_file_type = ['jpg','gif','png','jpeg','bmp','tif'];

        if(check_file_type.indexOf(file_type)==-1) {

            alert(imgfilemsg);
            var parent_Obj=obj.parentNode;
            var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);

            document.getElementById("imgFile").value = "";    //초기화를 위한 추가 코드
            document.getElementById("imgFile").select();        //초기화를 위한 추가 코드
            document.selection.clear();                          //일부 브라우저 미지원
            return false;
        }
    }
</script>
</body>
</html>
