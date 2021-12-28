<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productdetails" text="상품상세"/></title>
</head>
<style>


</style>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting.merchandise" text="상품관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productdetails" text="상품상세"/><%--상품 상세--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productdetails" text="상품 상세"/><%--상품 상세--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.distributormerchantname" text="가맹점명"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[H${tbStoreGoodsDetail.store.branch.headNo}]</span> ${tbStoreGoodsDetail.store.branch.head.headName} /
                            <span class="text-green">[B${tbStoreGoodsDetail.store.branch.branchNo}]</span> ${tbStoreGoodsDetail.store.branch.branchName} / <span
                                class="text-green">[S${tbStoreGoodsDetail.store.storeNo}]</span> ${tbStoreGoodsDetail.store.storeName} </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.productname" text="상품명"/></strong></td>
                        <td ><span class="text-green"></span>${tbStoreGoodsDetail.goodsName}</td>
                    </tr>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본 정보"/><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본 정보"/><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.priceinformation" text="가격 정보"/><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.priceinformation" text="가격 정보"/><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link group_link">
                        <span class="d-sm-none"><spring:message code="list.detail.merchandisegroup" text="상품 그룹"/><%--상품 그룹--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.merchandisegroup" text="상품 그룹"/><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-4" data-toggle="tab" class="nav-link option_link">
                        <span class="d-sm-none"><spring:message code="list.detail.option" text="옵션"/><%--옵션--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.option" text="옵션"/><%--옵션--%></span>
                    </a>
                </li>
            </ul>

            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="" >
                        <div class="table-responsive" >
                            <form id="update_form">
                                <input type="hidden" name="storeNo" value="${tbStoreGoodsDetail.store.storeNo}">
                                <input type="hidden" name="headNo" value="${tbStoreGoodsDetail.store.branch.headNo}">
                                <input type="hidden" name="branchNo" value="${tbStoreGoodsDetail.store.branch.branchNo}">
                                <input type="hidden" id="storeGoodsNo" name="storeGoodsNo" value="${tbStoreGoodsDetail.storeGoodsNo}">
                                <input type="hidden" name="viewOrder" value="${tbStoreGoodsDetail.viewOrder}">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${tbStoreGoodsDetail.insertUserId}">
                                <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                                   <table class="table table-condensed table-bordered">
                                        <tr>
                                          <td class="bg-light" style="width:15%"><spring:message code="list.detail.productname" text="상품명" /><%--상품상태--%></td>
                                          <td style="width:40%">
                                              <label class="font-size-10">
                                                  <input type="text" class="form-control width-200 goodsName" name="goodsName" value="${tbStoreGoodsDetail.goodsName}" maxlength="70">
                                              </label>
                                          </td>
                                            <td class="text-danger-darker width-150"><spring:message code="list.description.pleaseentertheproductname" text="상품 이름을 입력하세요" /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light"><spring:message code="list.detail.productstatus" text="상품 상태" /><%--상품상태--%></td>
                                          <td colspan="1">
                                              <label class="">
                                                  <input type="radio" name="dataStatus" value="0" class="align-bottom" <c:if test="${tbStoreGoodsDetail.dataStatus.ordinal() == 0}">checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/><%--정상--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="dataStatus" value="1" class="align-bottom" <c:if test="${tbStoreGoodsDetail.dataStatus.ordinal() == 1}">checked</c:if>><spring:message code="list.detail.normal" text="정상"/><%--정지--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="dataStatus" value="2" class="align-bottom" <c:if test="${tbStoreGoodsDetail.dataStatus.ordinal() == 2}">checked</c:if>><spring:message code="list.detail.stop" text="정지"/><%--정지--%>
                                              </label>
                                          </td>
                                          <td class="text-danger-darker"><spring:message code="list.description.pleaseselecttheproductstatus" text="상품 상태를 선택하세요" /></td>
                                      </tr>
                                      <tr>
                                          <td class="bg-light"><spring:message code="list.detail.barcode" text="바코드"/><%----%></td>
                                          <td><input type="text" class="form-control width-200" name="barcode" value="${tbStoreGoodsDetail.barcode}" maxlength="19" placeholder="기본 바코드">
                                              <input type="text" class="form-control width-200" name="barcode2" value="${tbStoreGoodsDetail.barcode2}" maxlength="19" placeholder="추가 바코드"></td>
                                          <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthebarcode" text="바코드를 입력하세요."/></td>
                                      </tr>
                                       <tr>
                                          <td class="bg-light"><spring:message code="list.detail.classificationofadultauthentication" text="성인인증 구분"/><%--성인인증 구분--%></td>
                                          <td colspan="1">
                                              <label class="">
                                                  <input type="radio" name="adultYn" value="true" class="align-bottom" <c:if test="${tbStoreGoodsDetail.adultYn == true}">checked</c:if>><spring:message code="list.detail.need" text="필요"/><%--필요--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="adultYn" value="false" class="align-bottom" <c:if test="${tbStoreGoodsDetail.adultYn == false}">checked</c:if>><spring:message code="list.detail.unnecessary" text="불필요"/><%--불필요--%>
                                              </label>
                                          </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.adultauthenticatemessage" text="구매시 성인 인증 여부를 선택하세요."/></td>
                                      </tr>
                                       <tr>
                                          <td class="bg-light"><spring:message code="list.detail.salesstatus" text="판매 상태"/><%--상품상태--%></td>
                                          <td colspan="1">
                                              <label class="">
                                                  <input type="radio" name="goodsStatus" value="0" class="align-bottom" <c:if test="${tbStoreGoodsDetail.goodsStatus.ordinal() == 0}">checked</c:if> ><spring:message code="list.detail.notforsale" text="판매안함"/><%--정상--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="goodsStatus" value="1" class="align-bottom" <c:if test="${tbStoreGoodsDetail.goodsStatus.ordinal() == 1}">checked</c:if>><spring:message code="list.detail.sale" text="판매중"/><%--정지--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="goodsStatus" value="2" class="align-bottom" <c:if test="${tbStoreGoodsDetail.goodsStatus.ordinal() == 2}">checked</c:if>><spring:message code="list.detail.soldout" text="품절"/><%--정지--%>
                                              </label>
                                          </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.selectyouronlinesalesstatus" text="온라인 판매 상태를 선택하세요."/></td>
                                      </tr>
                                      <tr>
                                          <td class="bg-light"><spring:message code="list.detail.cumulativenumberoforders" text="누적 주문수"/><%----%></td>
                                          <td colspan="1"><input type="text" class="form-control width-200" name="totalSellCnt" numberOnly readOnly value="${tbStoreGoodsDetail.totalSellCnt}"> <spring:message code="list.detail.piece" text="개"/></td>
                                          <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정 불가"/></td>
                                      </tr>
                                       <tr>
                                          <td class="bg-light"><spring:message code="list.detail.taxable" text="과세 여부"/><%--온라인 판매상태--%></td>
                                          <td colspan="1">
                                              <label class="">
                                                  <input type="radio" name="taxYn" value="false" class="align-bottom" <c:if test="${tbStoreGoodsDetail.taxYn == false}">checked</c:if>><spring:message code="list.detail.taxfree" text="비과세"/><%--정상--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="taxYn" value="true" class="align-bottom" <c:if test="${tbStoreGoodsDetail.taxYn == true}">checked</c:if>><spring:message code="list.detail.taxation" text="과세"/><%--정지(품절표시)--%>
                                              </label>
                                          </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.selectwhethertaxablenontaxable" text="과세/비과세 여부를 선택하세요."/></td>
                                      </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.whetherthepurchaseistaxed" text="매입과세 여부"/><%--온라인 판매상태--%></td>
                                           <td colspan="1">
                                               <label class="">
                                                   <input type="radio" name="buyTaxYn" value="false" class="align-bottom" <c:if test="${tbStoreGoodsDetail.buyTaxYn == false}">checked</c:if>><spring:message code="list.detail.taxfree" text="비과세"/><%--정상--%>
                                               </label>
                                               <label class="m-l-10 ">
                                                   <input type="radio" name="buyTaxYn" value="true" class="align-bottom" <c:if test="${tbStoreGoodsDetail.buyTaxYn == true}">checked</c:if>><spring:message code="list.detail.taxation" text="과세"/><%--정지(품절표시)--%>
                                               </label>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.pleaseselectwhethertotaxmessage" text="매입시 과세/비과세 여부를 선택하세요."/></td>
                                       </tr>
                                       <input type="hidden" name="subStoreNo" value="${tbStoreGoodsDetail.subStoreNo}">
                                       <tr>
                                          <td class="bg-light"><spring:message code="list.detail.inventorymanagement" text="재고관리 여부"/><%--온라인 판매상태--%></td>
                                          <td colspan="1">
                                              <label class="">
                                                  <input type="radio" name="stockYn" value="false" class="align-bottom" <c:if test="${tbStoreGoodsDetail.stockYn == false}">checked</c:if>><spring:message code="list.detail.nomanagement" text="관리안함"/><%--정상--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="stockYn" value="true" class="align-bottom" <c:if test="${tbStoreGoodsDetail.stockYn == true}">checked</c:if>><spring:message code="list.detail.undermanagement" text="재고관리"/><%--정지(품절표시)--%>
                                              </label>
                                          </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.choosewhethertomanageinventory" text="재고관리 여부를 선택하세요."/></td>
                                      </tr>
                                       <tr>
                                           <td class="border-left-0  border-top border-right-0 border-bottom-0 bg-light"><spring:message code="list.detail.availablestock" text="재고수량"/><%--검색 단어--%></td>
                                           <td colspan="1"><input type="text" class="form-control width-200" name="stockCnt" numberOnly value="${tbStoreGoodsDetail.stockCnt}" maxlength="7"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.pleaseenterstockquantity" text="재고 수량을 입력하세요."/></td>
                                       </tr>
                                      <tr>
                                          <td class="bg-light"><spring:message code="list.detail.searchstring" text="검색 문자열"/><%----%></td>
                                          <td colspan="1"><input type="text" class="form-control width-200" name="searchText" value="${tbStoreGoodsDetail.searchText}"  maxlength="75"></td>
                                          <td class="text-danger-darker"><spring:message code="list.description.appkeywordmessage" text="앱에서 검색시 노출될 키워드를 입력하세요."/></td>
                                      </tr>
                                      <tr>
                                          <td class="bg-light"><spring:message code="list.detail.productdescription" text="상품 설명"/><%--상품 설명--%></td>
                                          <td colspan="1"><textarea class="form-control width-full height-100" name="goodsDetail" maxlength="850">${tbStoreGoodsDetail.goodsDetail}</textarea></td>
                                          <td class="text-danger-darker"><spring:message code="list.description.entertheproductsettingmessage" text="앱에 표시될 상품 설명을 입력하세요."/></td>
                                      </tr>
                                    </table>
                                    <div>
                                        <div class="timeline-header m-t-10 m-b-10">
                                            <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                            <span>
                                                <spring:message code="list.detail.photoinformation" text="사진정보"/>
                                            </span>
                                            </div>
                                            <div id="dropzone1">
                                                <table class="table table-condensed table-bordered ">
                                                    <tbody>
                                                    <tr>
                                                        <td class="bg-light">  * <spring:message code="list.detail.productthumbnaillist" text="상품 썸네일"/></td>
                                                        <td class="bg-light">  * <spring:message code="list.detail.productimagedetailscreen" text="상품 이미지"/></td>
                                                    </tr>
                                                    <tr >
                                                        <td>
                                                            <div class="category_sort">

                                                                <ul class="sort_list">
                                                                    <li>
                                                                        <div class="sort_body4" id="sort_body4">
                                                                            <img style="width: 150px;" class="storeImg4" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                                            <%--<img class="img-preview" src="data:image/png;base64,${tbStoreGoodsDetail.imgFile1}"
                                                                                 onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">--%>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <%--* 권장 이미지 비율 : 984*876<br>--%>
                                                                        <div class="onlinePlatFormFileName4 m-b-10 m-t-5"></div>
                                                                        <div class="onlinePlatFormFileSize4"></div>
                                                                    </li>
                                                                </ul>
                                                                <label for="imgFileSmall">
                                                                    <div id="button_base4"
                                                                         class="button_base b03_skewed_slide_in btn btn-primary">
                                                                        <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                                    </div>
                                                                </label>
                                                                <input type="file" id="imgFileSmall" name="imgFileSmall" value="${tbStoreGoodsDetail.imgFileSmall}"
                                                                       class="fileBtn d-none">
                                                                <input type="hidden" name="imgFileSmall" value="${tbStoreGoodsDetail.imgFileSmall}">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="category_sort">
                                                                <ul class="sort_list">
                                                                    <li>
                                                                        <div class="sort_body" id="sort_body">
                                                                            <img style="width: 150px;" class="storeImg" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <%--* 권장 이미지 비율 : 984*876<br>--%>
                                                                        <div class="onlinePlatFormFileName m-b-10 m-t-5"></div>
                                                                        <div class="onlinePlatFormFileSize"></div>
                                                                    </li>
                                                                </ul>
                                                                <label for="imgFile1">
                                                                    <div id="button_base"
                                                                         class="button_base b03_skewed_slide_in btn btn-primary">
                                                                        <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                                    </div>
                                                                </label>
                                                                <input type="file" id="imgFile1" name="imgFile1" value="${tbStoreGoodsDetail.imgFile1}"
                                                                       class="fileBtn d-none">
                                                                <input type="hidden" name="imgFile1" value="${tbStoreGoodsDetail.imgFile1}">
                                                                <input type="hidden" name="imgFile2" value="${tbStoreGoodsDetail.imgFile2}">
                                                                <input type="hidden" name="imgFile3" value="${tbStoreGoodsDetail.imgFile3}">
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
                                    <div class="m-t-10">
                                        <button type="button" class="btn btn-primary btn_list m-l-10"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                        <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive" style="overflow: hidden;">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="p-0" colspan="1">
                                        <table class="width-full">
                                            <tbody>
                                            <form id="update_form2">
                                            <tr>
                                                <td class="border-top-0 border-left-0 bg-light" style="width:15%"><spring:message code="list.detail.purchasecost" text="매입 원가"/><%--정상 판매가--%></td>
                                                <td class="border-left border-top-0 border-right-0 border-bottom-0" style="width:60%"><input type="text" name="buyPrice" class="form-control width-200" numberOnly value="${tbStoreGoodsDetail.buyPrice}" maxlength="8"><spring:message code="list.detail.krw" text="KRW"/><%--KRW--%></td>
                                                <td class="text-danger-darker border-top-0 border-right-0"><spring:message code="list.description.enterthepurchasecost" text="매입 원가를 입력하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-0 bg-light"><spring:message code="list.detail.productprice" text="상품 가격"/><%--정상 판매가--%></td>
                                                <td class="border-right-0 border-bottom-0"><input type="text" name="goodsPrice" class="form-control width-200" numberOnly value="${tbStoreGoodsDetail.goodsPrice}" maxlength="8"><spring:message code="list.detail.krw" text="KRW"/><%--KRW--%></td>
                                                <td class="text-danger-darker  border-right-0"><spring:message code="list.description.enterthesellingpriceoftheproduct" text="상품 판매 가격을 입력하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.saleprice" text="상품 할인 가격"/><%--할인 판매가--%></td>
                                                <td class="border-top border-right-0 border-bottom-0"><input type="text" name="goodsDcPrice" class="form-control width-200" numberOnly value="${tbStoreGoodsDetail.goodsDcPrice}" maxlength="7"><spring:message code="list.detail.krw" text="KRW"/><%--KRW--%></td>
                                                <td class="text-danger-darker  border-right-0"><spring:message code="list.description.entertheproductdiscountprice" text="상품 할인 가격을 입력하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.discountperiod" text="할인 기간"/><%--할인 기간--%></td>
                                                <td class="border-top border-right-0 border-bottom-0">
                                                    <label>
                                                        <input type="text" id="startDate" class="form-control startDate background-white goodsDcStartYYYYMM"   readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                    </label>
                                                    <input type="hidden" id="goodsDcStart"  name="goodsDcStart" value="${tbStoreGoodsDetail.goodsDcStart}" >
                                                    ~
                                                    <label>
                                                        <input type="text" id="endDate" class="form-control endDate background-white goodsDcEndYYYYMM"  readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                    </label>
                                                    <input type="hidden" id="goodsDcEnd"  name="goodsDcEnd" value="${tbStoreGoodsDetail.goodsDcEnd}" >
                                                </td>
                                                <td class="text-danger-darker  border-right-0"><spring:message code="list.description.selecttheperioddiscountapplied" text="할인이 적용될 기간을 선택하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.discounttime" text="할인 시간"/></td>
                                                <td>
                                                    <select class="form-control reservHour width-70 goodsDcStartHH">
                                                        <c:choose>
                                                            <c:when test="${tbStoreGoodsDetail.goodsDcStart != null && tbStoreGoodsDetail.goodsDcStart.length() >= 12}">
                                                                <option value="01"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '01'}">selected</c:if>>01</option>
                                                                <option value="02"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '02'}">selected</c:if>>02</option>
                                                                <option value="03"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '03'}">selected</c:if>>03</option>
                                                                <option value="04"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '04'}">selected</c:if>>04</option>
                                                                <option value="05"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '05'}">selected</c:if>>05</option>
                                                                <option value="06"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '06'}">selected</c:if>>06</option>
                                                                <option value="07"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '07'}">selected</c:if>>07</option>
                                                                <option value="08"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '08'}">selected</c:if>>08</option>
                                                                <option value="09"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == '09'}">selected</c:if>>09</option>
                                                                <c:forEach begin="10" end="23" var="hour">
                                                                    <c:if test="${hour gt 9}"><option value="${hour}"<c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(8,10) == hour}">selected</c:if>>${hour}</c:if></option>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="01">01</option>
                                                                <option value="02">02</option>
                                                                <option value="03">03</option>
                                                                <option value="04">04</option>
                                                                <option value="05">05</option>
                                                                <option value="06">06</option>
                                                                <option value="07">07</option>
                                                                <option value="08">08</option>
                                                                <option value="09">09</option>
                                                                <c:forEach begin="10" end="23" var="hour">
                                                                    <option value="${hour}">${hour}</option>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                    <span>:</span>
                                                    <select class="form-control reservMinute width-70 goodsDcStartMI" >
                                                        <c:choose>
                                                            <c:when test="${tbStoreGoodsDetail.goodsDcStart != null && tbStoreGoodsDetail.goodsDcStart.length() >=  12}">
                                                                <option value="00" <c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(10,12) == '00'}">selected</c:if>>00</option>
                                                                <option value="30" <c:if test="${tbStoreGoodsDetail.goodsDcStart.substring(10,12) == '30'}">selected</c:if>>30</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="00" >00</option>
                                                                <option value="30" >30</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                    ~
                                                    <select class="form-control reservHour width-70 goodsDcEndHH" >
                                                        <c:choose>
                                                            <c:when test="${tbStoreGoodsDetail.goodsDcEnd != null && tbStoreGoodsDetail.goodsDcEnd.length() >= 12}">
                                                                <option value="01"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '01'}">selected</c:if>>01</option>
                                                                <option value="02"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '02'}">selected</c:if>>02</option>
                                                                <option value="03"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '03'}">selected</c:if>>03</option>
                                                                <option value="04"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '04'}">selected</c:if>>04</option>
                                                                <option value="05"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '05'}">selected</c:if>>05</option>
                                                                <option value="06"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '06'}">selected</c:if>>06</option>
                                                                <option value="07"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '07'}">selected</c:if>>07</option>
                                                                <option value="08"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '08'}">selected</c:if>>08</option>
                                                                <option value="09"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == '09'}">selected</c:if>>09</option>
                                                                <c:forEach begin="10" end="23" var="hour">
                                                                    <c:if test="${hour gt 9}"><option value="${hour}"<c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(8,10) == hour}">selected</c:if>>${hour}</c:if></option>
                                                                </c:forEach>
z                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="01">01</option>
                                                                <option value="02">02</option>
                                                                <option value="03">03</option>
                                                                <option value="04">04</option>
                                                                <option value="05">05</option>
                                                                <option value="06">06</option>
                                                                <option value="07">07</option>
                                                                <option value="08">08</option>
                                                                <option value="09">09</option>
                                                                <c:forEach begin="10" end="23" var="hour">
                                                                    <option value="${hour}">${hour}</option>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                    <span>:</span>
                                                    <select class="form-control reservMinute width-70 goodsDcEndMI" >
                                                        <c:choose>
                                                            <c:when test="${tbStoreGoodsDetail.goodsDcEnd != null && tbStoreGoodsDetail.goodsDcEnd.length() >= 12}">
                                                                <option value="00" <c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(10,12) == '00'}">selected</c:if>>00</option>
                                                                <option value="30" <c:if test="${tbStoreGoodsDetail.goodsDcEnd.substring(10,12) == '30'}">selected</c:if>>30</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="00" >00</option>
                                                                <option value="30" >30</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td class="text-danger-darker"><spring:message code="list.description.pleaseselectthetimethediscountisapplied" text="할인이 적용될 시간을 선택하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.1timeorderlimitquantity" text="1회 주문제한 수량"/><%--1회 주문제한 수량--%></td>
                                                <td class="border-top border-right-0 border-bottom-0"><input type="text" name="goodsLimitOnce" class="form-control width-200" numberOnly value="${tbStoreGoodsDetail.goodsLimitOnce}" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                                <td class="text-danger-darker"><spring:message code="list.description.thisisthemaximumquantitymessage" text="1회 주문시 가능한 최대 수량입니다."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 bg-light border-top border-right-0 border-bottom-0"><spring:message code="list.detail.1dayorderlimitquantity" text="1일 주문제한 수량"/><%--1일 주문제한 수량--%></td>
                                                <td class="border-top border-right-0 border-bottom-0"><input type="text" name="goodsLimitDay" class="form-control width-200" numberOnly value="${tbStoreGoodsDetail.goodsLimitDay}" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                                <td class="text-danger-darker"><spring:message code="list.description.thisisthemaximumquantitydaymessage" text="1일간 주문 가능한 최대 수량입니다."/></td>
                                            </tr>
                                            <tr>
                                                <td class="border-right-0 border-bottom-0 bg-light border-left-0"><spring:message code="list.detail.defaultoptionsetting" text="기본 옵션 유무"/><%--온라인 판매상태--%></td>
                                                <td class="border-top border-right-0 border-bottom-0 " colspan="1">
                                                    <label class="">
                                                        <input type="radio" name="basicOptionYn" value="false" class="align-bottom basicOptionYn" <c:if test="${tbStoreGoodsDetail.basicOptionYn == false}">checked</c:if>> <spring:message code="list.detail.nodefaultoption" text="기본옵션없음"/><%--정상--%>
                                                    </label>
                                                    <label class="m-l-10 ">
                                                        <input type="radio" name="basicOptionYn" value="true" class="align-bottom basicOptionYn" <c:if test="${tbStoreGoodsDetail.basicOptionYn == true}">checked</c:if>><spring:message code="list.detail.defaultoption" text="기본옵션있음"/><%--정지(품절표시)--%>
                                                    </label>
                                                </td>
                                                <td rowspan="2" class="text-danger-darker border-bottom-0"><spring:message code="list.description.registerbasicoptionmessage" text="상품 가격을 결정할 기본 옵션을 등록하세요."/></td>
                                            </tr>
                                            </form>
                                            <tr id="basicOptionYnView" style="display: <c:if test="${tbStoreGoodsDetail.basicOptionYn == true}">contents</c:if>  <c:if test="${tbStoreGoodsDetail.basicOptionYn != true}">none</c:if>">
                                                <td colspan="2" class="p-0">
                                                    <table class="table table-bordered border-bottom text-center border-0">
                                                        <thead>
                                                            <tr>
                                                                <th width="30%;" class="bg-light border-top-0"><spring:message code="list.detail.productname" text="상품이름"/></th>
                                                                <th width="20%;" class="bg-light border-top-0"><spring:message code="list.detail.salesstatus" text="판매상태"/></th>
                                                                <th width="30%;" class="bg-light border-top-0">가격<spring:message code="list.detail.productname" text="상품이름"/></th>
                                                                <th class="bg-light border-top-0" style="width:95px;"></th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <form id="update_form3" style="width: 100%;">
                                                        <div class="panel panel-inverse">
                                                            <div class="height-300 overflow-auto">
                                                                <input type="hidden" class="viewOrder" value="">
                                                                <table class="table table-bordered border-bottom text-center border-0 tbStoreGoodsItemTable">
                                                                    <thead>
                                                                    <tr class="border-bottom-0 border-left-0">
                                                                        <td width="30%;" class="border-bottom bg-light border-left-0"><input type="text" class="form-control width-full itemName"></td>
                                                                        <td width="20%;"class="border-bottom bg-light border-left-0">
                                                                            <select class="form-control itemStatus">
                                                                                <option value="0"><spring:message code="list.detail.notforsale" text="판매안함"/></option>
                                                                                <option value="1"><spring:message code="list.detail.sale" text="판매중"/></option>
                                                                                <option value="2"><spring:message code="list.detail.soldout" text="품절"/></option>
                                                                            </select>
                                                                        </td>
                                                                        <td width="30%;" class="border-bottom bg-light border-left-0">
                                                                            <input class="form-control itemPrice width-full" type="text" numberOnly>
                                                                        </td>
                                                                        <td class="border-bottom bg-light border-left-0"><button type="button" class="btn btn-primary add_group_list_btn"><spring:message code="list.detail.enrollment" text="등록"/></button></td>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody id="tbStoreGoodsItemBody">
                                                                    <c:choose>
                                                                        <c:when test="${tbStoreGoodsItemList.size() > 0}">
                                                                            <c:forEach var="item"  items="${tbStoreGoodsItemList}"  varStatus="status">
                                                                                <tr basicItemNo="${item.basicItemNo}" viewOrder="${item.viewOrder}" class="border-left-0">
                                                                                    <td class="border-left-0">
                                                                                        <input type="text" class="form-control form-control width-full itemNameText" value="${item.itemName}"></td>
                                                                                    <td class="border-top-0">
                                                                                        <select class="form-control itemStatusText">
                                                                                            <option value="0" <c:if test="${item.itemStatus == 0}">selected</c:if>> <spring:message code="list.detail.notforsale" text="판매안함"/></option>
                                                                                            <option value="1" <c:if test="${item.itemStatus == 1}">selected</c:if>><spring:message code="list.detail.sale" text="판매중"/></option>
                                                                                            <option value="2" <c:if test="${item.itemStatus == 2}">selected</c:if>><spring:message code="list.detail.soldout" text="품절"/></option>
                                                                                        </select>
                                                                                    </td>
                                                                                    <td class="border-top-0"><input type="text" class="form-control itemPriceText width-full" value="${item.itemPrice}"></td>
                                                                                    <td class="border-top-0 ">
                                                                                        <button type="button" class="btn btn-danger removeOptionBtn" basicItemNo="${item.basicItemNo}"><spring:message code="list.detail.delete" text="삭제"/></button>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <%--<tr id="basicOptionYnView" style="display: <c:if test="${tbStoreGoodsDetail.basicOptionYn == true}">contents</c:if>  <c:if test="${tbStoreGoodsDetail.basicOptionYn != true}">none</c:if>">
                                    <td colspan="">
                                        <div class="tab-pane fade active show" id="">
                                            <div class="row">
                                               <form id="update_form3" style="width: 100%;">
                                                <div class="col-xl-12 col-lg-12 ui-sortable ">
                                                    <div class="panel panel-inverse">
                                                        <div class="panel-heading ui-sortable-handle">
                                                            <h4 class="panel-title text-center">기본 옵션 설정</h4>
                                                        </div>
                                                        <div class="height-300 overflow-auto border">
                                                            <input type="hidden" class="viewOrder" value="">
                                                            <table class="table table-bordered border-bottom text-center border-0 tbStoreGoodsItemTable">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="bg-light">상품이름</th>
                                                                        <th class="bg-light">판매상태</th>
                                                                        <th class="bg-light">가격</th>
                                                                        <th class="bg-light"></th>
                                                                    </tr>
                                                                    <tr class="border-bottom-0">
                                                                        <td class="border-bottom bg-light"><input type="text" class="form-control width-full itemName"></td>
                                                                        <td class="border-bottom bg-light">
                                                                            <select class="form-control itemStatus">
                                                                                <option value="0">판매중지</option>
                                                                                <option value="1">판매중</option>
                                                                                <option value="2">품절</option>
                                                                            </select>
                                                                        </td>
                                                                        <td class="border-bottom bg-light">
                                                                            <input class="form-control itemPrice width-full" type="text" numberOnly>
                                                                        </td>
                                                                        <td class="border-right-0 border-bottom bg-light"><button type="button" class="btn btn-primary add_group_list_btn">등 록</button></td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbStoreGoodsItemBody">
                                                                    <c:choose>
                                                                        <c:when test="${tbStoreGoodsItemList.size() > 0}">
                                                                            <c:forEach var="item"  items="${tbStoreGoodsItemList}"  varStatus="status">
                                                                                <tr basicItemNo="${item.basicItemNo}" viewOrder="${item.viewOrder}">
                                                                                    <td class="border-left-0">
                                                                                        <input type="text" class="form-control form-control width-full itemNameText" value="${item.itemName}"></td>
                                                                                    <td class="border-top-0">
                                                                                       <select class="form-control itemStatusText">
                                                                                            <option value="0" <c:if test="${item.itemStatus == 0}">selected</c:if>>판매중지</option>
                                                                                            <option value="1" <c:if test="${item.itemStatus == 1}">selected</c:if>>판매중</option>
                                                                                            <option value="2" <c:if test="${item.itemStatus == 2}">selected</c:if>>품절</option>
                                                                                        </select>
                                                                                    </td>
                                                                                    <td class="border-top-0"><input type="text" class="form-control itemPriceText width-full" value="${item.itemPrice}"></td>
                                                                                    <td class="border-top-0 border-right-0">
                                                                                        <button type="button" class="btn btn-danger removeOptionBtn" basicItemNo="${item.basicItemNo}">삭 제</button>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
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
                                </tr>--%>
                                </tbody>
                            </table>
                        <div class="m-t-10">
                            <button type="button" class="btn btn-primary btn_list"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                            <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-3">
                    <div class="row">
                        <div class="col-xl-6 col-md-6 col-lg-6">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><spring:message code="list.detail.setoptiongroup" text="설정된 옵션그룹"/><%--설정된 상품그룹--%></h4>
                                </div>
                                <div class="list-group panel-body p-0">
                                    <div class="list-group-item border-top-0">
                                        <li class="navbar-form">
                                            <ol class="breadcrumb float-xl-left">
                                                <div class="d-flex">
                                                    <div class="btn-group">
                                                        <a href="javascript:;" class="btn btn-white btn-white-without-border text-red">
                                                            * <spring:message code="list.description.realtimeaddedremovedmessage" text="옵션 추가/해제시 실시간으로 적용됩니다."/>
                                                        </a>
                                                    </div>
                                                </div>
                                            </ol>
                                        </li>
                                    </div>
                                    <div class="panel panel-inverse m-b-0" data-sortable-id="form-slider-switcher-1">
                                        <!-- begin panel-heading -->
                                        <!-- end panel-heading -->
                                        <!-- begin table -->
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <ul class="sort_body_list category_mapping_list m-b-0" style="cursor:pointer;list-style: none;padding-left: 0px;">
                                                    <c:choose>
                                                        <c:when test="${tbStoreCategoryList.size() > 0}">
                                                            <c:forEach var="item"  items="${tbStoreCategoryList}" varStatus="status">
                                                                <li storeCatNo="${item.storeCatNo}" class="mapping_list ">
                                                                    <div class="sort_content">
                                                                        <span class="category_title">${item.catName}</span>
                                                                        <div class="category_right delete_group_btn"  catName="${item.catName}">
                                                                            <span class="category_title text-center">
                                                                                <button type="button" class="btn btn-danger height-30 p-r-5 p-l-10 d-flex align-items-center ">
                                                                                   <spring:message code="list.detail.ungroup" text="그룹 헤제"/>
                                                                                    <i class="fas fa-lg fa-fw fa-minus-square m-l-5"></i>
                                                                                </button>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end table -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6 col-lg-6">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><spring:message code="list.detail.productgrouplist" text="상품그룹 목록"/></h4>
                                </div>
                                <div class="list-group panel-body p-0">
                                    <div class="list-group-item border-top-0">
                                        <li class="navbar-form">
                                            <ol class="breadcrumb float-xl-left">
                                                <div class="d-flex">
                                                    <div class="btn-group goods_level_group">
                                                        <a href="javascript:;" class="btn btn-white btn-white-without-border level_one_btn" catLevel="1">
                                                            <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i><spring:message code="list.detail.toplevel" text="최상위"/>
                                                        </a>
                                                    </div>
                                                </div>
                                            </ol>
                                        </li>
                                    </div>
                                    <div class=" m-b-0" data-sortable-id="form-slider-switcher-2">
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <ul  class="sort_body_list store_group_list m-b-0" style="cursor:pointer;list-style: none;padding-left: 0px;">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-4">
                    <div class="row">
                        <div class="col-xl-6 col-md-6 col-lg-6">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><%--<spring:message code="merchandisecont.merchandisedetail.merchandisedetailthree.setmerchandisegroup" text="설정된 옵션그룹"/>--%><spring:message code="list.detail.setoptiongroup" text="설정된 옵션그룹"/></h4>
                                </div>
                                <div class="list-group panel-body p-0">
                                    <div class="list-group-item border-top-0">
                                        <a href="javascript:;" class="btn btn-white btn-white-without-border text-red">
                                            * <spring:message code="list.description.realtimeaddedremovedmessage" text="옵션 추가/해제시 실시간으로 적용됩니다."/>
                                        </a>
                                    </div>
                                    <div class="panel panel-inverse m-b-0" data-sortable-id="form-slider-switcher-3">
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <ul class="sort_body_list option_mapping_list m-b-0" style="cursor:pointer;list-style: none;padding-left: 0px;">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6 col-lg-6">
                            <div class="panel panel-inverse border">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-left"><%--<spring:message code="merchandisecont.merchandisedetail.merchandisedetailthree.setmerchandisegroup" text="옵션리스트"/>--%><spring:message code="list.detail.listofoptions" text="옵션 목록"/></h4>
                                </div>
                                <div class="list-group">
                                    <div class="list-group-item border-top-0  p-5">
                                        <li class="navbar-form">
                                            <ol class="breadcrumb float-xl-left">
                                                <div class="d-flex">
                                                    <div class="btn-group">
                                                        <a href="javascript:;" class="btn btn-white btn-white-without-border" >
                                                                <label class="">
                                                                    <input type="radio" name="mandatoryYn" value="1" class="align-bottom" checked> <spring:message code="list.detail.requiredoption" text="필수옵션"/>
                                                                </label>
                                                                <label class="m-l-10 ">
                                                                    <input type="radio" name="mandatoryYn" value="0" class="align-bottom"> <spring:message code="list.detail.selectoption" text="선택옵션"/>
                                                                </label>
                                                            &nbsp; &nbsp; &nbsp; <input type="text" style="width: 150px;" class="form-control-sm" id="mykeyword" placeholder="<spring:message code="list.detail.pleaseenteryoursearchterm" text="검색어를 입력하세요"/>">
                                                        </a>
                                                        <div style="margin-bottom: 20px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </ol>
                                        </li>
                                    </div>
                                    <div class="panel panel-inverse m-b-0" data-sortable-id="form-slider-switcher-4">

                                        <!-- begin panel-heading -->
                                        <!-- end panel-heading -->
                                        <!-- begin table -->
                                        <div class="category_sort">
                                            <div class="sort_body">
                                                <table id="optionTable" class="table table-condensed table-bordered border-0">
                                               <%--     <thead>
                                                        <tr style="border-top: 1px solid #b8c1ca;">
                                                            <th width="5%" class="bg-light">
                                                            </th>
                                                            <th width="70%;" class="">옵션명</th>
                                                            <th width="25%;"  ></th>
                                                        </tr>
                                                    </thead>--%>
                                                    <tbody id="optionList" class="store_option_list">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- end table -->
                                    </div>
                                    <%--  <div class="height-350 overflow-auto">
                                      </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              <%--  <!-- end tab-pane -->
                <div class="m-t-10">
                    <button type="button" class="btn btn-primary btn_add float-right"><i class="fa fa-check m-r-3"></i> <spring:message code="button.update" text="수정"/>&lt;%&ndash;수정&ndash;%&gt;&lt;%&ndash;<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                    <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="button.list" text="목록"/>&lt;%&ndash;목록&ndash;%&gt;&lt;%&ndash;<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                </div>--%>
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

<%--<script src="../../assets/js/demo/jquery.tablesorter.min.js"></script>
<script src="../../assets/js/demo/jquery.tablesorter.js"></script>--%>
<script>
    //인스턴스 자동생성 방지
    Dropzone.autoDiscover = false;



    $(() => {
        $("input[name=stockCnt], input[name=buyPrice], input[name=goodsPrice], " +
            "input[name=goodsLimitOnce], input[name=goodsLimitDay] ,input[name=goodsDcPrice]").focus(function(){
          /*  $(this).val('');*/
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });

        let parentNo1 = null;
        let parentNo2 = null;

        let parentNo1Name = "";
        let parentNo2Name = "";


        /*$("#optionTable").tablesorter();*/

        $("#mykeyword").keyup(function() {
            var value = $(this).val().toLowerCase();
            var array = [];
            array = value.split(' ');
            $("#optionList tr").filter(function() {
                for(var i = 0; i < array.length ; i++) {
                    var contain = $(this).text().toLowerCase().indexOf(array[i]) > -1;
                    $(this).toggle(contain)
                    if(contain == true){
                        break;
                    }
                }
            });
        });

        //상품그룹 탭 클릭시
        $(document).on("click",".group_link",function(){
           $(".level_one_btn").addClass("active_btn");
            searchLevelList(1, null);
        });

        //옵션 탭 클릭시
        $(document).on("click",".option_link",function(){
            searchOptionList();
            searchOptionMappingList();
        });

        //옵션 추가 클릭시
        $(document).on("click",".add_option_btn",function(){
            let optName = $(this).attr("optName");
            let storeOptNo= $(this).attr("storeOptNo");
            let mandatoryYn= $(this).attr("mandatoryYn");
            let thisVal = $(this);
            addStoreOption(storeOptNo, optName, thisVal, mandatoryYn);
        });

        //옵션 헤제 클릭시
        $(document).on("click",".del_option_btn",function(){
            let optName = $(this).attr("optName");
            let storeOptNo= $(this).attr("storeOptNo");
            let thisVal = $(this);
            delStoreOption(storeOptNo, thisVal, optName);
        });

        //필수/옵션 선택시
        $("input:radio[name=mandatoryYn]").click(function(){
            searchOptionList();
            searchOptionMappingList();
        })


        let url = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile1}");
        let url2 = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile2}");
        let url3 = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile3}");
        let url4 = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFileSmall}");

        let toplevel = "<spring:message code="list.script.toplevel" text="최상위"/>";

        $(".storeImg").attr("src",url);
        $(".storeImg2").attr("src",url2);
        $(".storeImg3").attr("src",url3);
        $(".storeImg4").attr("src",url4);

        $(document).on("click",".level_one_btn, .level1_btn, .level2_btn ,.level3_btn ",function() {
            let storeType = Number("${tbStoreGoodsDetail.store.storeType.ordinal()}");
            if(storeType == 1) {
                $(".goods_level_group").html("");
                $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn active_btn\" catLevel=\"1\">\n" +
                    "     <i class=\"fa fa-folder-open m-r-15\" style=\"color: #b4bb6e;\"></i>" +toplevel+
                    " </a>\n"+
                    " ");
            } else {
                //fa-folder-open
                $(".level_one_btn, .level1_btn, .level2_btn, .level2_btn, .level3_btn").children("i").removeClass("fa-folder-open");
                $(".level_one_btn, .level1_btn, .level2_btn, .level2_btn, .level3_btn").children("i").addClass("fa-folder");
                $(".level_one_btn, .level1_btn, .level2_btn, .level2_btn, .level3_btn").removeClass("active_btn");
                $(this).addClass("active_btn");

                $(this).children("i").removeClass("fa-folder");
                $(this).children("i").addClass("fa-folder-open");



                $(".goods_level_group").html("");
                let catLevel = $(this).attr("catLevel");

                if(catLevel == 1){
                    $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn active_btn\" catLevel=\"1\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>" +toplevel+
                        " </a>\n"+
                        " ");
                    searchLevelList(catLevel ,null);
                } if(catLevel == 2){
                    $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn\" catLevel=\"1\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>" +toplevel+
                        " </a>\n" +
                        " <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level1_btn active_btn\" catLevel=\"2\" parent1No="+parentNo1+">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i> "+parentNo1Name+"\n" +
                        " </a>\n" +
                        " ");
                    searchLevelList(catLevel ,parentNo1);
                } else if (catLevel == 3) {
                    $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn\" catLevel=\"1\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>" +toplevel+
                        " </a>\n" +
                        " <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level1_btn\" catLevel=\"2\" parent1No="+parentNo1+">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i> "+parentNo1Name+"\n" +
                        " </a>\n" +
                        " <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level2_btn active_btn\" catLevel=\"3\" parent1No="+parentNo2+">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>"+parentNo2Name+"\n" +
                        " </a>"
                    );
                    searchLevelList(catLevel ,parentNo2);
                }
            }
        });


        $(document).on("click",".selChildLevel",function(){
            let catLevel = $(this).attr("catLevel");
            let parentNo = $(this).attr("parentNo");
            let catName = $(this).attr("catName");
            let toplevel = "<spring:message code="list.script.toplevel" text="최상위"/>";
            catLevel =  Number(catLevel) + Number(1);
            if(catLevel != 4){
                searchLevelList(catLevel, parentNo);
            }

            if (catLevel != 4) {
                $(".goods_level_group").html("");
                if(catLevel == 1){
                    $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn active_btn\" catLevel=\"1\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>" +toplevel+
                        " </a>\n"+
                        " ");

                }else if(catLevel == 2){
                    $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn\" catLevel=\"1\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>" +toplevel+
                        " </a>\n" +
                        " <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level1_btn active_btn\" catLevel=\"2\" parent1No=\"${searchValue.parent1No}\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i> "+catName+"\n" +
                        " </a>\n" +
                        " ");

                    parentNo1 = parentNo;
                    parentNo2 = null;
                    parentNo1Name = catName;
                    parentNo2Name = null;
                } else if (catLevel == 3) {
                    $(".goods_level_group").append("  <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level_one_btn\" catLevel=\"1\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i></i>" +toplevel+
                        " </a>\n" +
                        " <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level1_btn\" catLevel=\"2\" parent1No=\"${searchValue.parent1No}\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i> "+parentNo1Name+"\n" +
                        " </a>\n" +
                        " <a href=\"javascript:;\" class=\"btn btn-white btn-white-without-border level2_btn active_btn\" catLevel=\"3\" parent1No=\"${searchValue.parent1No}\">\n" +
                        "     <i class=\"fa fa-folder m-r-15\" style=\"color: #b4bb6e;\"></i>"+catName+"\n" +
                        " </a>"
                    );
                    parentNo2 = parentNo;
                    parentNo2Name = catName;
                }
            }


        });

        $(document).on("click",".add_group_btn",function(){
            let storeCatNo = $(this).parents("li").attr("storeCatNo");
            let storeGoodsNo = ${tbStoreGoodsDetail.storeGoodsNo};
            let thisVal = $(this);
            let catName = thisVal.attr("catName");
            let ungroup = "<spring:message code="list.script.ungroup" text="그룹헤제"/>";
            let alreadyregistered = "<spring:message code="list.script.alreadyregistered" text="이미 등록되어있습니다."/>";
            let registrationfailed = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let data = {
                storeCatNo : storeCatNo,
                storeGoodsNo : storeGoodsNo
            }

            $.ajax({
                type: "POST",
                url: "${path}/api/merchandise/addStoreCategoryGoods",
                data: data,
                /*contentType: "application/json;",*/
                dataType: "json",
                /*processData: false,*/
                /*contentType: false,*/
                success: function (data) {
                    if (data.result == 200) {
                 /*       thisVal.removeClass("add_group_btn");
                        thisVal.addClass("add_group_btn_");*/
                        /*thisVal.children("span").children("button").attr("disabled",true)*/
                        $(".category_mapping_list").append(
                          " <li storeCatNo="+storeCatNo+" class=\"mapping_list\">\n" +
                            "    <div class=\"sort_content\">\n" +
                            "        <span class=\"category_title\">"+catName+"</span>\n" +
                            "        <div class=\"category_right delete_group_btn\"  catName="+catName+">\n" +
                            "            <span class=\"category_title text-center\">\n" +
                            "                <button type=\"button\" class=\"btn btn-danger height-30 p-r-5 p-l-10 d-flex align-items-center \">\n" +
                            "                    "+ungroup+"<i class=\"fas fa-lg fa-fw fa-minus-square m-l-5\"></i>\n" +
                            "                </button>\n" +
                            "            </span>\n" +
                            "        </div>\n" +
                            "    </div>\n" +
                            "</li>"
                        );

                    } else if (data.result == 500) {
                        alert(alreadyregistered);
                    } else {
                        alert(registrationfailed);
                    }
                }
            });
        });

        $(document).on("click",".delete_group_btn",function(){

            let additionfailed = "<spring:message code="list.script.additionfailed" text="추가에 실패하였습니다."/>";

            let storeCatNo = $(this).parents("li").attr("storeCatNo");
            let storeGoodsNo = ${tbStoreGoodsDetail.storeGoodsNo};
            let thisVal = $(this);
            let catName = thisVal.attr("catName");
            let data = {
                storeCatNo : storeCatNo,
                storeGoodsNo : storeGoodsNo
            }

            $.ajax({
                type: "POST",
                url: "${path}/api/merchandise/deleteStoreCategoryGoods",
                data: data,
                /*contentType: "application/json;",*/
                dataType: "json",
                /*processData: false,*/
                /*contentType: false,*/
                success: function (data) {
                    if (data.result == 200) {
                        thisVal.parents("li").hide();

                        let catLevel = $(".active_btn").attr("catLevel");
                        if(catLevel == null || catLevel == "" || catLevel == "undefined") {
                            catLevel == 1;
                        }
                        if (catLevel == 1){
                            searchLevelList(catLevel,null);
                        } else if (catLevel == 2) {
                            searchLevelList(catLevel,parentNo1);
                        }  else if (catLevel == 3) {
                            searchLevelList(catLevel,parentNo2);
                        }

                    } else {
                        alert(additionfailed);
                        return;
                    }
                }
            });
        });


        $(".btn_list").click(function() {
            location.href = "/merchant/merchandise/list";
        });
        /*$("#dataTable").dataTable({
            "paging" : true,
            "ordering" : true,
            "info" : true,
            "filter" : true,
            "lengthChange" : true,
            "order" : [[0, "desc"]]
        });*/
        let date = new Date();
        let date2 = new Date();

        <c:if test="${tbStoreGoodsDetail.goodsDcStart != null && tbStoreGoodsDetail.goodsDcStart.length() >= 12}">
            let startDate = "${tbStoreGoodsDetail.goodsDcStart.substring(0,4)}-${tbStoreGoodsDetail.goodsDcStart.substring(4,6)}-${tbStoreGoodsDetail.goodsDcStart.substring(6,8)}";
            let endDate = "${tbStoreGoodsDetail.goodsDcEnd.substring(0,4)}-${tbStoreGoodsDetail.goodsDcEnd.substring(4,6)}-${tbStoreGoodsDetail.goodsDcEnd.substring(6,8)}";
            date = new Date(startDate);
            date2 = new Date(endDate);
        </c:if>



        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#startDate").datepicker('setDate', date);
        date.setMonth(date.getMonth() + 1, 1);

        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#endDate").datepicker('setDate', date2);

        /*$('#file-dropzone1').dropzone({
            url: "${path}/api/hospital/fileUpload?bhpBhId=${dto.bhId}", // 드롭다운 시 업로드 되는 URL
            maxFilesize: 300, // 드롭다운 시 파일 크기
            paramName: "file", // input file="user_file"
            maxThumbnailFilesize: 3, //
            // 최대 업로드 카운트
            addRemoveLinks : true,
            dictRemoveFile: "<button type=\"button\" class=\"btn btn-danger btn-xs dz-delete-btn\" style=\"width:100%\"><i class=\"fas fa-lg fa-fw m-r-10 fa-trash-alt\"></i> 삭제 </button>\n",
            maxFiles: 3,
            // 자동 업로드 끔
            autoProcessQueue: false,
            dictMaxFilesExceeded: "You can only upload upto 3 images",
            dictCancelUploadConfirmation: "Are you sure to cancel upload?",
            previewsContainer: ".file-zone1", // 섬네일 보여주는 Container class*!/
            init: function() {
                myDropzone = this;
                /!*  var submitButton = document.querySelector("#btnSubmit");*!/
               //var mockFile = { name: "7e1ecf74-8e39-49a5-8e23-db63072fa1b1.jpg", size: 12345, type: 'image/jpeg' };
                //myDropzone.displayExistingFile ( mockFile ,  "https://i.picsum.photos/id/959/600/600.jpg" ) ;

                // If the thumbnail is already in the right size on your server:
                let callback = null; // Optional callback when it's done
                let crossOrigin = null; // Added to the `img` tag for crossOrigin handling
                let resizeThumbnail = false; // Tells Dropzone whether it should resize the image first
                myDropzone.displayExistingFile(mockFile, url, callback, crossOrigin, resizeThumbnail);
                myDropzone.displayExistingFile(mockFile2, url2, callback, crossOrigin, resizeThumbnail);
                myDropzone.displayExistingFile(mockFile3, url3, callback, crossOrigin, resizeThumbnail);

                this.on('success', function(file, json) {
                    // 파일이 서버에 업로드가 완료 되었 을때
                    let strId = $("#sortable").sortable("toArray");
                    //console.log("idArr::{} " + strId);
                    /!*var res = JSON.parse(json);*!/
                    location.reload();
                });
                this.on('fail', function(file, json) {
                    // 파일이 서버에 업로드가 완료 되었 을때
                    var res = JSON.parse(json);
                    //console.log(json);
                    alert("서버에러");
                    location.reload();
                });
                // 업로드 버튼 이벤트 등록

                /!*  submitButton.addEventListener("click", function () {
                      // tell Dropzone to process all queued files
                      // 다른 폼의 데이터를 Dropzone 안의 히든 폼으로 주고 서브밋 시키면 Form 2개 데이터를 취합할 수 있다.
                      myDropzone.processQueue();
                  });*!/

                /!*this.on("addedfile", function () {
                    $("#btnSubmit").removeAttr("disabled");
                    $("#btnAllClear").removeAttr("disabled");

                });*!/
            }
        }*/


      /*  this.addFile.call(this, mockFile);
        this.addFile.call(this, mockFile2);
        this.addFile.call(this, mockFile3);
        this.options.thumbnail.call(this, mockFile, url);
        this.options.thumbnail.call(this, mockFile2, url2);
        this.options.thumbnail.call(this, mockFile3, url3);
        );*/
        $('#file-dropzone2').dropzone({
            url: "${path}/api/hospital/fileUpload?bhpBhId=${dto.bhId}", // 드롭다운 시 업로드 되는 URL
            maxFilesize: 300, // 드롭다운 시 파일 크기
            paramName: "file", // input file="user_file"
            maxThumbnailFilesize: 1, //
            // 최대 업로드 카운트

            maxFiles: 1,
            // 자동 업로드 끔
            autoProcessQueue: false,
            addRemoveLinks : true,
            dictCancelUploadConfirmation: "Are you sure to cancel upload?",
            dictMaxFilesExceeded: "You can only upload upto 1 images",
            dictRemoveFile: "<button type=\"button\" class=\"btn btn-danger btn-xs dz-delete-btn\" style=\"width:100%\"><i class=\"fas fa-lg fa-fw m-r-10 fa-trash-alt\"></i> 삭제 </button>\n",
            previewsContainer: ".file-zone2", // 섬네일 보여주는 Container class*/
            init: function() {
                myDropzone = this;
                /*  var submitButton = document.querySelector("#btnSubmit");*/

                let mockFile = { name: "7e1ecf74-8e39-49a5-8e23-db63072fa1b1.jpg", size: 12345 };
                let callback = null; // Optional callback when it's done
                let crossOrigin = null; // Added to the `img` tag for crossOrigin handling
                let resizeThumbnail = false; // Tells Dropzone whether it should resize the image first
                myDropzone.displayExistingFile(mockFile, url, callback, crossOrigin, resizeThumbnail);
                myDropzone.displayExistingFile(mockFile2, url2, callback, crossOrigin, resizeThumbnail);
                myDropzone.displayExistingFile(mockFile3, url3, callback, crossOrigin, resizeThumbnail);

                this.on('success', function(file, json) {
                    // 파일이 서버에 업로드가 완료 되었 을때
                    let strId = $("#sortable").sortable("toArray");
                    //console.log("idArr::{} " + strId);
                    /*var res = JSON.parse(json);*/
                    location.reload();
                });
                this.on('fail', function(file, json) {
                    // 파일이 서버에 업로드가 완료 되었 을때
                    var res = JSON.parse(json);
                    //console.log(json);
                    alert("서버에러");
                    location.reload();
                });
                // 업로드 버튼 이벤트 등록

                /*  submitButton.addEventListener("click", function () {
                      // tell Dropzone to process all queued files
                      // 다른 폼의 데이터를 Dropzone 안의 히든 폼으로 주고 서브밋 시키면 Form 2개 데이터를 취합할 수 있다.
                      myDropzone.processQueue();
                  });*/

                /*this.on("addedfile", function () {
                    $("#btnSubmit").removeAttr("disabled");
                    $("#btnAllClear").removeAttr("disabled");

                });*/
            }
        });
        let deleteIdList = [];
        let list = [];
        $(document).on("click", ".removeOptionBtn", function () {
            let index = $(this).parents().parents().index();
            let length = $(".tbStoreGoodsItemTable tr").length;
            $(".tbStoreGoodsItemTable tr").eq(index+1).remove();
            deleteIdList.push($(this).attr("basicItemNo"));
        });

        $(document).on("click",".basicOptionYn",function(){
            var basicOptionYnVal = $(":input:radio[name=basicOptionYn]:checked").val();

            if(basicOptionYnVal == "true") {
                $("#basicOptionYnView").css("display","contents");
            } else {
                $("#basicOptionYnView").css("display","none");
            }
        })

        $(document).on("click", ".btn_update", function () {
            let url = "${path}/api/merchandise/update/action";
            let _forms = $('#update_form, #update_form2');
            let _forms3 = $('#update_form3');

            let goodsDcStartYYYYMM = $(".goodsDcStartYYYYMM").val().replaceAll('-','');
            let goodsDcEndYYYYMM = $(".goodsDcEndYYYYMM").val().replaceAll('-','');
            let goodsDcStartHHMI = $(".goodsDcStartHH").val() + $(".goodsDcStartMI").val() ;
            let goodsDcEndHHMI = $(".goodsDcEndHH").val() + $(".goodsDcEndMI").val();


            $("#goodsDcStart").val(goodsDcStartYYYYMM+goodsDcStartHHMI);
            $("#goodsDcEnd").val(goodsDcEndYYYYMM+goodsDcEndHHMI);

            list = [];
            $(".tbStoreGoodsItemTable #tbStoreGoodsItemBody tr").each(function(){

                pushList = {
                    basicItemNo : $(this).attr("basicItemNo"),
                    itemName : $(this).find(".itemNameText").val(),
                    itemStatus : $(this).find(".itemStatusText").val(),
                    itemPrice : $(this).find(".itemPriceText").val(),
                    storeGoodsNo : $("#storeGoodsNo").val(),
                    viewOrder : $(this).attr("viewOrder")
                }
                list.push(pushList);
            });

            let req = convertFormToObj(_forms);
            let req3 = convertFormToObj(_forms3);

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
                        formData.append("tbStoreGoodsData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbStoreGoodsItemData",  new Blob([JSON.stringify(list)], {type:"application/json"}));
                        formData.append("deleteIdList",  new Blob([JSON.stringify(deleteIdList)], {type:"application/json"}));
                        formData.append("imgFile1",_forms.find('#imgFile1')[0]);
  /*                      formData.append("imgFile2",_forms.find('#imgFile2')[0]);
                        formData.append("imgFile3",_forms.find('#imgFile3')[0]);*/
                        formData.append("imgFileSmall",_forms.find('#imgFileSmall')[0]);
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

        //온라인플랫폼이미지
        $(document).on("change", "#imgFile1", function (e) {
            e.preventDefault();
            let imgchangemsg = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
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
                    sort_body.innerHTML = '';
                    sort_body.appendChild(img);
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
            $('.onlinePlatFormFileName').text(imgchangemsg+" :" + filename);
            $('.onlinePlatFormFileSize').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });

       /* //온라인플랫폼이미지
        $(document).on("change", "#imgFile2", function (e) {
            e.preventDefault();

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
            $('.onlinePlatFormFileName2').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize2').text("용량 :" + file.size + " Byte");

            return false;
        });

        //온라인플랫폼이미지
        $(document).on("change", "#imgFile3", function (e) {
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

            let imgchangemsg = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
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
            $('.onlinePlatFormFileName4').text(imgchangemsg+" :" + filename);
            $('.onlinePlatFormFileSize4').text(sizemsg+" :" + file.size + " Byte");

            return false;
        });
    });



    let basicItemNo = ${maxNo+1};
    $(document).on("click", ".add_group_list_btn", function () {

        let stopselling = "<spring:message code="list.script.stopselling" text="판매중지"/>";
        let sale = "<spring:message code="list.script.sale" text="판매중"/>";
        let soldout = "<spring:message code="list.script.soldout" text="품절"/>";
        let deletemsg = "<spring:message code="list.script.delete" text="삭제"/>";

        let itemStatus = $(".itemStatus").val();
        let itemName = $(".itemName").val();
        let itemPrice = $(".itemPrice").val();
        let storeGoodsNo = $("#storeGoodsNo").val();
        let viewOrder = $(".viewOrder").val();
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
                "                  <option value=\"1\" >"+sale+"</option>\n" +
                "                  <option value=\"2\" selected>"+soldout+"</option>\n";
        }

        $(".noneItemOption").remove();


        $("#tbStoreGoodsItemBody").append(" <tr basicItemNo="+basicItemNo+" viewOrder="+basicItemNo+" class=\"border-left-0\">\n" +
            "          <td class=\"border-left-0\"><input type=\"text\" class=\"form-control width-full itemNameText\" value='"+itemName+"'></td>\n" +
            "          <td class=\"border-top-0\">\n" +
            "              <select class=\"form-control itemStatusText\">\n" +
            optionText +
            "              </select>\n" +
            "          </td>\n" +
            "          <td class=\"border-top-0\"><input type=\"text\" class=\"form-control itemPriceText width-full\" value="+itemPrice+"></td>\n" +
            "          <td class=\"border-top-0 \">\n" +
            "              <button type=\"button\" class=\"btn btn-danger removeOptionBtn\" basicItemNo="+basicItemNo+" >"+deletemsg+"</button>\n" +
            "          </td>\n" +
            "      </tr>");
        basicItemNo++;
    });

    function searchLevelList(catLevel, parentNo){
        let data = {
            storeNo : "${tbStoreGoodsDetail.store.storeNo}",
            catLevel: catLevel,
        }
        let addgroup = "<spring:message code="list.script.addgroup" text="그룹추가"/>";
        let select = "<spring:message code="list.script.select" text="선택"/>";
        let thisisthelastcategory = "<spring:message code="list.script.thisisthelastcategory" text="마지막 카테고리입니다."/>";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/merchandise/searchStoreCategory",
            data: JSON.stringify(data),
            contentType: "application/json;",
            dataType: "json",
            /*processData: false,*/
            /*contentType: false,*/
            success: function (data) {
                let storeType = Number("${tbStoreGoodsDetail.store.storeType.ordinal()}");
                let list = data.storeCategory;
                $(".store_group_list").html("");
                for(var i = 0 ; i < list.length ; i++){
                    let   button =
                        "<div class=\"category_right add_group_btn\" catName="+list[i].catName+" catLevel="+list[i].catLevel+">\n"+
                            "<span class=\"category_title text-center\">\n"+
                                "<button type=\"button\" class=\"btn btn-primary height-30 p-r-5 p-l-10 d-flex align-items-center \">\n" +
                                "     "+addgroup+"<i class=\"fas fa-lg fa-fw fa-plus-square m-l-5 \" ></i>\n" +
                                "</button>\n";
                            " </span>\n" +
                        " </div>\n";
                   /* if(list[i].storeCatGoodsNo != null) {
                        button =
                            "<div class=\"category_right add_group_btn_\" disabled catName="+list[i].catName+" catLevel="+list[i].catLevel+">\n"+
                            "<span class=\"category_title text-center\">\n"+
                            "<button type=\"button\" class=\"btn btn-primary height-30 p-r-5 p-l-10 d-flex align-items-center  \" disabled>\n" +
                            "     그룹추가<i class=\"fas fa-lg fa-fw fa-plus-square m-l-5 \" ></i>\n" +
                            "</button>\n";
                        " </span>\n" +
                        " </div>\n";
                    }*/
                    let  selChildCat = "";
                    if (storeType != 1){
                        if(catLevel == 1){
                            selChildCat =
                                "<span class=\"btn-group p-1 m-l-0 bg-black-transparent-2 rounded \" style=\"background-color: #00b09f;\">\n" +
                                "               <a href=\"#\" class=\"btn btn-sm btn-white btn-white-without-border hover p-5 selChildLevel\" catLevel="+catLevel+" parentNo="+list[i].storeCatNo+" catName='"+list[i].catName+"'  >\n" +
                                "                       <i class=\"fas fa-lg fa-fw m-r-5 fa-search-plus\" ></i>" +select+
                                "               </a>" +
                                " </span>";
                        } else if (catLevel == 2){
                            selChildCat =
                                "<span class=\"btn-group p-1 m-l-0 bg-black-transparent-2 rounded \" style=\"background-color: #00b09f;\">\n" +
                                "               <a href=\"#\" class=\"btn btn-sm btn-white btn-white-without-border hover p-5 selChildLevel\" catLevel="+catLevel+" parentNo="+list[i].storeCatNo+" catName='"+list[i].catName+"' >\n" +
                                "                       <i class=\"fas fa-lg fa-fw m-r-5 fa-search-plus\" ></i>" +select+
                                "               </a>" +
                                " </span>";
                        } else if (catLevel == 3){
                            selChildCat =
                                "<span class=\"btn-group p-1 m-l-0 bg-black-transparent-2 rounded \" style=\"background-color: #00b09f;\">\n" +
                                "               <a href=\"#\" class=\"btn btn-sm btn-white btn-white-without-border hover p-5 selChildLevel\" catLevel="+catLevel+" parentNo="+list[i].storeCatNo+" catName='"+list[i].catName+"'  >\n" +
                                "                       <i class=\"fas fa-lg fa-fw m-r-5 fa-exclamation-triangle\" ></i>" +thisisthelastcategory+
                                "               </a>" +
                                " </span>";
                        }
                    }


                    $(".store_group_list").append(

                        "<li storeCatNo="+list[i].storeCatNo+" >\n" +
                        "    <div class=\"sort_content\">\n" +
                        "        <span class=\"category_title\">" +
                        selChildCat+
                        " "+list[i].catName+" " +
                        "        </span>\n" +
                        "        <span class=\"category_right\">\n" +
                        "            <span class=\"category_title \" >\n" +
                         button +
                        "            </span>\n" +
                        "        </span>\n" +
                        "    </div>\n" +
                        "</li>"
                    );
                }
            }
        });
    }

    function searchOptionMappingList(){
        let data = {
            storeGoodsNo : "${tbStoreGoodsDetail.storeGoodsNo}"
        }

        let select = "<spring:message code="list.script.select" text="선택"/>";
        let essential = "<spring:message code="list.script.essential" text="필수"/>";
        let optionoff = "<spring:message code="list.script.optionoff" text="옵션헤제"/>";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/merchandise/searchStoreGoodsOption",
            data: JSON.stringify(data),
            contentType: "application/json;",
            dataType: "json",
            /*processData: false,*/
            /*contentType: false,*/
            success: function (data) {
                $(".option_mapping_list").html("");
                let list = data.storeGoodsOptionList;
                $(".option_mapping_list").html("");
                for(var i = 0 ; i < list.length ; i++){
                    let text = "";
                    if(list[i].mandatoryYn == 0) {
                        text = "<span class='text-green'>["+select+"]</span> ";
                    } else {
                        text = "<span class='text-red'>["+essential+"]</span> ";
                    }
                    $(".option_mapping_list").append(
                        "<li storeCatNo="+list[i].optName+" >\n" +
                        "    <div class=\"sort_content\">\n" +
                        "        <span class=\"category_title\">"+
                        text
                        +list[i].optName+"</span>\n" +
                        "        <div class=\"category_right del_option_btn\" storeOptNo="+list[i].storeOptNo+">\n" +
                        "            <span class=\"category_title text-center\">\n" +
                        "                 <button type=\"button\" class=\"btn btn-danger height-30 p-r-5 p-l-10 d-flex align-items-center  \" >\n" +
                        "                    "+optionoff+"<i class=\"fas fa-lg fa-fw fa-minus-square m-l-5 \" ></i>\n" +
                        "                </button>\n" +
                        "            </span>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</li>"
                    );
                }
            }
        });
    }

    function searchOptionList(){
        let data = {
            storeNo : "${tbStoreGoodsDetail.store.storeNo}",
            mandatoryYn : $("input[name='mandatoryYn']:checked").val()
        }
        let select = "<spring:message code="list.script.select" text="선택"/>";
        let essential = "<spring:message code="list.script.essential" text="필수"/>";
        let optionadd = "<spring:message code="list.script.optionadd" text="옵션추가"/>";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/merchandise/searchStoreOption",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            /*processData: false,*/
            /*contentType: false,*/
            success: function (data) {
                $(".store_option_list").html("");
                let list = data.storeCategoryList;
                let txt = "";
                for(var i = 0 ; i < list.length ; i++){
                    let text = "";
                    if(list[i].mandatoryYn == 0){
                        text = "<span class='text-green'>["+select+"]</span> ";
                    } else {
                        text = "<span class='text-red'>["+essential+"]</span> ";
                    }

                      txt=  "<tr class='border-left-0'>\n" +
                        "    <td class='border-left-0 border-right-0 '>"+
                          text
                        +"" +list[i].optName+"</td>\n" +
                        "    <td class='border-left-0 border-right-0'>\n" +
                        "        <span class=\"category_title text-center float-right\">\n" +
                        "            <button type=\"button\" mandatoryYn="+list[i].mandatoryYn+" storeOptNo="+list[i].storeOptNo+" optName='"+list[i].optName+"' class=\"btn btn-primary height-30 p-r-5 p-l-10 d-flex align-items-center add_option_btn \">\n" +
                        "                "+optionadd+" <i class=\"fas fa-lg fa-fw fa-plus-square m-l-5\"></i>\n" +
                        "            </button>\n" +
                        "        </span>\n" +
                        "    </td>\n" +
                        "</tr>"

                    $(".store_option_list").append(
                        txt
                    );
                }
            }
        });
    }



    function addStoreOption(storeOptNo, optName, thisVal, mandatoryYn){
        let data = {
            storeGoodsNo : "${tbStoreGoodsDetail.storeGoodsNo}",
            storeOptNo : storeOptNo
        }
        let select = "<spring:message code="list.script.select" text="선택"/>";
        let essential = "<spring:message code="list.script.essential" text="필수"/>";
        let optionoff = "<spring:message code="list.script.optionoff" text="옵션헤제"/>";
        let alreadyregistered = "<spring:message code="list.script.alreadyregistered" text="이미 등록되어있습니다."/>";
        let registrationfailed = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
        let text = "";
        if (mandatoryYn == 0) {
            text = "<span class='text-green'>["+select+"]</span> ";
        } else {
            text = "<span class='text-red'>["+essential+"]</span> ";
        }

        $.ajax({
            type: "POST",
            url: "${path}/api/merchandise/addStoreGoodsOption",
            data: data,
            /*contentType: "application/json;",*/
            dataType: "json",
            /*processData: false,*/
            /*contentType: false,*/
            success: function (data) {
                if (data.result == 200) {
                    /*thisVal.parents("tr").hide();*/
                    $(".option_mapping_list").append(
                        "<li>\n" +
                        "    <div class=\"sort_content\">\n" +
                        "        <span class=\"category_title\">" +
                        text
                        + optName + "</span>\n" +
                        "        <div class=\"category_right del_option_btn\" storeOptNo=" + storeOptNo + " optName="+optName+">\n" +
                        "            <span class=\"category_title text-center\">\n" +
                        "                 <button type=\"button\" class=\"btn btn-danger height-30 p-r-5 p-l-10 d-flex align-items-center  \" >\n" +
                        "                    "+optionoff+"<i class=\"fas fa-lg fa-fw fa-minus-square m-l-5 \" ></i>\n" +
                        "                </button>\n" +
                        "            </span>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</li>"
                    );
                } else if (data.result == 500) {
                    alert(alreadyregistered);
                } else {
                    alert(registrationfailed);
                }

            }
        });
    }

    function delStoreOption(storeOptNo , thisVal){
        let data = {
            storeGoodsNo : "${tbStoreGoodsDetail.storeGoodsNo}",
            storeOptNo : storeOptNo
        }
        let deletionfailed = "<spring:message code="list.script.deletionfailed" text="삭제에 실패하였습니다."/>";
        $.ajax({
            type: "POST",
            url: "${path}/api/merchandise/delStoreGoodsOption",
            data: data,
            /*contentType: "application/json;",*/
            dataType: "json",
            /*processData: false,*/
            /*contentType: false,*/
            success: function (data) {
                if(data.result == 200 ){
                   /* thisVal.parents("li").hide();*/
                    searchOptionList();
                    searchOptionMappingList();
                } else {
                    alert(deletionfailed);
                }
            }
        });
    }


    function inputDataCheck(args) {
        let productname = "<spring:message code="list.script.pleaseentertheproductname" text="상품명을 입력해주세요."/>";
        let productprice = "<spring:message code="list.script.pleaseentertheproductprice" text="상품가격을 입력해주세요"/>";
        let discountprice = "<spring:message code="list.script.entertheproductdiscountprice" text="상품 할인가격을 입력해주세요."/>";
        let selectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";

        if (isNull(args.goodsName)) {
            return alert_focus("goodsName", productname);
        } else if (isNull(args.goodsPrice)) {
            return alert_focus("goodsPrice", productprice);
        } else if (isNull(args.goodsDcPrice)) {
            return alert_focus("goodsDcPrice", discountprice);
        } else if (isNull(args.storeNo)) {
            return alert_focus("storeNo", selectadistributor);
        }
        return true;
    }

    function chk_file_type(obj) {

        var file_kind = obj.value.lastIndexOf('.');
        var file_name = obj.value.substring(file_kind+1,obj.length);
        var file_type = file_name.toLowerCase();
        var check_file_type = new Array();

        let onlyimagefile = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="이미지 파일만 업로드 가능합니다."/>";
        check_file_type = ['jpg','gif','png','jpeg','bmp','tif'];

        if(check_file_type.indexOf(file_type)==-1) {

            alert(onlyimagefile);
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
