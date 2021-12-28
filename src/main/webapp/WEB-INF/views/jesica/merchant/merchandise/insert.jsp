<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productregistration" text="상품 등록"/></title>
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
                    <li class="breadcrumb-item"><a href="/merchant/merchandise/list"><spring:message code="sidemenu.merchantsetting.merchandise" text="상품"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productregistration" text="상품 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productregistration" text="상품 등록"/></h3>
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
                                <input type="hidden" name="storeNo" value="${tbStoreGoodsDetail.store.storeNo}">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" name="storeGoodsNo" value="${tbStoreGoodsDetail.storeGoodsNo}">
                                <input type="hidden" name="viewOrder" value="${tbStoreGoodsDetail.viewOrder}">
                                <input type="hidden" name="dataStatus" value="1">
                                <input type="hidden" name="totalSellCnt" value="0">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.franchiseeheadquarters" text="가맹점"/></td>
                                        <td style="width:60%">
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
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectastore" text="가맹점을 선택하세요. (등록후 변경 불가)" /></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.productname" text="상품명" /><%--상품상태--%></td>
                                        <td colspan="1">
                                            <label class="font-size-10">
                                                <input type="text" class="form-control width-200 goodsName" name="goodsName" value="" maxlength="70">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheproductname" text="상품 이름을 입력하세요." /></td>
                                        <input type="hidden" name="goodsStatus" value="1">
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.barcode" text="바코드"/><%----%></td>
                                        <td><input type="text" class="form-control width-200" name="barcode" value="${tbStoreGoodsDetail.barcode}" maxlength="19" placeholder="<spring:message code="list.detail.defaultbarcode" text="기본 바코드" />">
                                            <input type="text" class="form-control width-200" name="barcode2" value="${tbStoreGoodsDetail.barcode2}" maxlength="19" placeholder="<spring:message code="list.detail.additionalbarcodes" text="추가 바코드" />"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthebarcode" text="바코드를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.classificationofadultauthentication" text="성인인증 구분"/><%--성인인증 구분--%></td>
                                        <td colspan="1">
                                            <label>
                                                <input type="radio" name="adultYn" value="false" class="align-bottom" checked><spring:message code="list.detail.unnecessary" text="불필요"/><%--불필요--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="adultYn" value="true" class="align-bottom" ><spring:message code="list.detail.need" text="필요"/><%--필요--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.adultauthenticatemessage" text="구매시 성인 인증 여부를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.salesstatus" text="판매 상태"/></td>
                                        <td colspan="1">
                                            <label class="">
                                                <input type="radio" name="goodsStatus" value="0" class="align-bottom" checked ><spring:message code="list.detail.notforsale" text="판매안함"/><%--정상--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="goodsStatus" value="1" class="align-bottom" ><spring:message code="list.detail.sale" text="판매중"/><%--정지--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="goodsStatus" value="2" class="align-bottom" ><spring:message code="list.detail.soldout" text="품절"/><%--정지--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.selectyouronlinesalesstatus" text="온라인 판매 상태를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.taxable" text="과세 여부"/><%--온라인 판매상태--%></td>
                                        <td colspan="1">
                                            <label class="">
                                                <input type="radio" name="taxYn" value="false" class="align-bottom" checked><spring:message code="list.detail.taxfree" text="비과세"/><%--정상--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="taxYn" value="true" class="align-bottom" ><spring:message code="list.detail.taxation" text="과세"/><%--정지(품절표시)--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.selectwhethertaxablenontaxable" text="과세/비과세 여부를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.whetherthepurchaseistaxed" text="매입과세 여부"/><%--온라인 판매상태--%></td>
                                        <td colspan="1">
                                            <label class="">
                                                <input type="radio" name="buyTaxYn" value="false" class="align-bottom" checked><spring:message code="list.detail.taxfree" text="비과세"/><%--정상--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="buyTaxYn" value="true" class="align-bottom" ><spring:message code="list.detail.taxation" text="과세"/><%--정지(품절표시)--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectwhethertotaxmessage" text="매입시 과세/비과세 여부를 선택하세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.inventorymanagement" text="재고관리 여부"/><%--온라인 판매상태--%></td>
                                        <td colspan="1">
                                            <label class="">
                                                <input type="radio" name="stockYn" value="false" class="align-bottom" checked><spring:message code="list.detail.nomanagement" text="관리안함"/><%--정상--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="stockYn" value="true" class="align-bottom" ><spring:message code="list.detail.undermanagement" text="관리중"/><%--정지(품절표시)--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.choosewhethertomanageinventory" text="재고관리 여부를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.availablestock" text="재고수량"/></td>
                                        <td colspan="1"><input type="text" class="form-control width-200" name="stockCnt" numberOnly value="0" maxlength="7"> <spring:message code="list.detail.piece" text="개"/></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterstockquantity" text="재고 수량을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.searchstring" text="검색 문자열"/><%----%></td>
                                        <td><input type="text" class="form-control width-200" name="searchText" value="" maxlength="75"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.appkeywordmessage" text="앱에서 검색시 노출될 키워드를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.productdescription" text="상품 설명"/><%--상품 설명--%></td>
                                        <td><textarea class="form-control width-full height-100" name="goodsDetail" maxlength="850"></textarea></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.entertheproductsettingmessage" text="앱에 표시될 상품 설명을 입력하세요."/></td>
                                    </tr>
                                </table>

                                <br>
                                <div>
                                    <div class="timeline-header m-t-10 m-b-10">
                                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                        <span><strong><spring:message code="list.detail.priceinformation" text="가격 정보"/></strong></span>
                                    </div>
                                    <div>
                                        <table class="table table-condensed table-bordered">
                                            <tr>
                                                <td class="bg-light" style="width:15%;"><spring:message code="list.detail.purchasecost" text="매입 원가"/><%--정상 판매가--%></td>
                                                <td style="width: 60%"><input type="text" name="buyPrice" class="form-control width-200" numberOnly value="0" maxlength="8"><spring:message code="list.detail.krw" text="KRW"/><%--KRW--%></td>
                                                <td class="text-danger-darker"><spring:message code="list.description.enterthepurchasecost" text="매입 원가를 입력하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.productprice" text="상품 가격"/><%--정상 판매가--%></td>
                                                <td><input type="text" name="goodsPrice" class="form-control width-200" numberOnly value="0" maxlength="8"><spring:message code="list.detail.krw" text="KRW"/><%--KRW--%></td>
                                                <td class="text-danger-darker"><spring:message code="list.description.enterthesellingpriceoftheproduct" text="상품 판매 가격을 입력하세요."/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.1timeorderlimitquantity" text="1회 주문제한 수량"/><%--1회 주문제한 수량--%></td>
                                                <td><input type="text" name="goodsLimitOnce" class="form-control width-200" numberOnly value="0" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                                <td class="text-danger-darker"><spring:message code="list.description.thisisthemaximumquantitymessage" text="1회 주문시 가능한 최대 수량입니다."/></td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><spring:message code="list.detail.1dayorderlimitquantity" text="1일 주문제한 수량"/><%--1일 주문제한 수량--%></td>
                                                <td><input type="text" name="goodsLimitDay" class="form-control width-200" numberOnly value="0" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                                <td class="text-danger-darker"><spring:message code="list.description.thisisthemaximumquantitydaymessage" text="1일간 주문 가능한 최대 수량입니다."/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

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
                                                <td class="bg-light">  * <spring:message code="list.detail.productthumbnaillist" text="상품 썸네일 (리스트)"/></td>
                                                <td class="bg-light">  * <spring:message code="list.detail.productimagedetailscreen" text="상품 이미지 (상세화면)"/></td>
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
                                                        <input type="file" id="imgFileSmall" name="imgFileSmall" value=""
                                                               class="fileBtn d-none">
                                                        <input type="hidden" name="imgFileSmall" value="">
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
                                                        <input type="file" id="imgFile1" name="imgFile1" value=""
                                                               class="fileBtn d-none">
                                                        <input type="hidden" name="imgFile1" value="">
                                                        <input type="hidden" name="imgFile2" value="">
                                                        <input type="hidden" name="imgFile3" value="">
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

        $(".btn_list").click(function() {
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
            let url = "${path}/api/merchandise/insert/action";
            let _forms = $('#insert_form, #insert_form2');
            let _imgForms = $('#insert_form');
            let req = convertFormToObj(_forms);

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let duplicatemsg = "<spring:message code="list.script.duplicateaccount" text="계정이 중복되었습니다."/>";


            /*            let goodsDcStartYYYYMM = $(".goodsDcStartYYYYMM").val().replaceAll('-','');
                        let goodsDcEndYYYYMM = $(".goodsDcEndYYYYMM").val().replaceAll('-','');
                        let goodsDcStartHHMI = $(".goodsDcStartHH").val() + $(".goodsDcStartMI").val() ;
                        let goodsDcEndHHMI = $(".goodsDcEndHH").val() + $(".goodsDcEndMI").val();*/


          /*  $("#goodsDcStart").val(goodsDcStartYYYYMM+goodsDcStartHHMI);
            $("#goodsDcEnd").val(goodsDcEndYYYYMM+goodsDcEndHHMI);*/

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
                        formData.append("tbStoreGoodsData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile1",_forms.find('#imgFile1')[0]);
                        /* formData.append("imgFile2",_forms.find('#imgFile2')[0]);
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
                                    location.href="${path}/merchant/merchandise/list"
                                } else {
                                    alert(confirmfailmsg);
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
            $('.onlinePlatFormFileName').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize').text("용량 :" + file.size + " Byte");

            return false;
        });

        /*//온라인플랫폼이미지
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
            $('.onlinePlatFormFileName4').text(imgchangemsg +" :" + filename);
            $('.onlinePlatFormFileSize4').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });

    });
    function inputDataCheck(args) {
        let productmsg = "<spring:message code="list.script.pleaseentertheproductname" text="상품명을 입력해주세요."/>";
        let pricemsg = "<spring:message code="list.script.pleaseentertheproductprice" text="상품가격을 입력해주세요."/>";
        let selstoremsg = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요."/>";
        if (isNull(args.goodsName)) {
            return alert_focus("goodsName", productmsg);
        } else if (isNull(args.goodsPrice)) {
            return alert_focus("goodsPrice", pricemsg);
        } else if (isNull(args.storeNo)) {
            return alert_focus("storeNo", selstoremsg);
        }
        return true;
    }

    function chk_file_type(obj) {
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
