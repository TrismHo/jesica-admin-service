<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.hiredetail" text="사용료 상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.merchantsetting.merchandise.hire" text="사용료"/></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.hiredetail" text="사용료 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.hiredetail" text="사용료 상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroupmanagement" text="업무그룹"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[H${tbStore.headNo}]</span> ${tbStore.head.headName} |
                            <span class="text-green">[B${tbStore.branchNo}]</span> ${tbStore.branch.branchName}

                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/></strong></td>
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
                        <span class="d-sm-none"><spring:message code="list.detail.shippingmanagementfee" text="배송 관리비"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.shippingmanagementfee" text="배송 관리비"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.platformusagefee" text="플랫폼 사용료"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.platformusagefee" text="플랫폼 사용료"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.feeperplatform" text="플랫폼 건당 사용료"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.feeperplatform" text="플랫폼 건당 사용료"/></span>
                    </a>
                </li>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">

                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="true">
                        <div class="table-responsive">
                            <form id="update_form" name="update_form">
                                <table class="table table-bordered">
                                    <input type="hidden" class="storeNo" name="storeNo" value="${tbStore.storeNo}">
                                    <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.whetherdeliveryfeeischarged" text="배송관리비 부과 여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="mngChargeYn" value="0" class="align-bottom mngChargeYn" <c:if test="${tbStoreMngCharge.mngChargeYn == 0}">checked</c:if>> <spring:message code="list.detail.unused" text="미사용"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="mngChargeYn" value="1" class="align-bottom mngChargeYn" <c:if test="${tbStoreMngCharge.mngChargeYn == 1}">checked</c:if>> <spring:message code="list.detail.used" text="사용"/><%--정상--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker height-50"><spring:message code="list.description.selectchargetheplatform" text="플랫폼 부과여부를 선택해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.managementfeesettlementtype" text="관리비 정산타입"/></td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="mngChargeType" value="1" class="align-bottom mngChargeType" <c:if test="${tbStoreMngCharge.mngChargeType == 1}">checked</c:if>> <spring:message code="list.detail.monthlydeduction" text="월차감"/><%--정상--%>
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="mngChargeType" value="2" class="align-bottom mngChargeType" <c:if test="${tbStoreMngCharge.mngChargeType == 2}">checked</c:if>> <spring:message code="list.detail.firstdifference" text="일차감"/><%--정상--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"> <spring:message code="list.description.selectdlvydiscountedynmessage" text="배송원 수수료 할인여부를 선택해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.administrativefeesettlementtarget" text="관리비 정산대상"/></td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="mngTargetType" value="1" class="align-bottom mngTargetType" <c:if test="${tbStoreMngCharge.mngTargetType == 1}">checked</c:if>> <spring:message code="list.detail.affiliateddistributor" text="소속총판"/><%--정상--%>
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="mngTargetType" value="2" class="align-bottom mngTargetType" <c:if test="${tbStoreMngCharge.mngTargetType == 2}">checked</c:if>> <spring:message code="list.detail.litigationdeliverygroup" text="소속배송그룹"/><%--정상--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.selectthetargetfeesettlement" text="관리비 정산대상을 선택해주세요"/> </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.price" text="금액"/></td>
                                        <td>
                                            <input class="form-control width-200" type="text"  name="mngPrice" value="${tbStoreMngCharge.mngPrice}" numberOnly maxlength="7"> <spring:message code="list.detail.won" text="원"/>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheamount" text="금액을 입력해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.startofdeduction" text="차감시작일"/></td>
                                        <td><input class="form-control width-200 mngChargeStart" type="text"  name="mngChargeStart" value="${tbStoreMngCharge.mngChargeStart}" ></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeductionstartdate" text="차감시작일을 선택해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deductiondate" text="차감일"/></td>
                                        <td>
                                            <select class="form-control mngChargeDay" name="mngChargeDay">
                                                <c:forEach begin="01" end="28" var="month">
                                                    <c:if test="${month lt 10}"><option value="0${month}" <c:if test="${tbStoreMngCharge.mngChargeDay == month}">selected</c:if> >0${month}</c:if> <spring:message code="list.detail.day" text="일"/></option>
                                                    <c:if test="${month gt 9}"><option value="${month}" <c:if test="${tbStoreMngCharge.mngChargeDay == month}">selected</c:if>>${month}</c:if> <spring:message code="list.detail.day" text="일"/></option>
                                                </c:forEach>
                                                <option value="29" <c:if test="${tbStoreMngCharge.mngChargeDay == 29}">selected</c:if>>말일</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeductiondate" text="차감일을 선택해주세요 (월차감 전용)"/></td>
                                    </tr>
                                </table>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive">
                        <form id="update_form2" name="update_form2">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.whetherplatformusagefeeischarged" text="플랫폼사용료 부과 여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="plfChargeYn" value="0" class="align-bottom plfChargeYn" <c:if test="${tbStoreMngCharge.plfChargeYn == 0}">checked</c:if>> <spring:message code="list.detail.uncharged" text="미부과"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="plfChargeYn" value="1" class="align-bottom plfChargeYn" <c:if test="${tbStoreMngCharge.plfChargeYn == 1}">checked</c:if>> <spring:message code="list.detail.charge" text="부과"/><%--정상--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectchargetheplatform" text="플랫폼 부과여부를 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.platformmonthlyfee" text="플랫폼 월사용료"/></td>
                                    <td>
                                        <input class="form-control width-200" type="text"  name="plfPrice" value="${tbStoreMngCharge.plfPrice}" numberOnly maxlength="7"> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthemonthlyplatformfee" text="플랫폼 월사용료를 입력해주세요 (월차감 전용)"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.startofdeduction" text="차감시작일"/></td>
                                    <td><input class="form-control width-200 plfChargeStart" type="text"  name="plfChargeStart" value="${tbStoreMngCharge.plfChargeStart}" ></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeductionstartdate" text="차감시작일을 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.deductiondate" text="차감일"/></td>
                                    <td>
                                        <select class="form-control plfChargeDay" name="plfChargeDay">
                                            <c:forEach begin="01" end="28" var="month">
                                                <c:if test="${month lt 10}"><option value="0${month}" <c:if test="${tbStoreMngCharge.plfChargeDay == month}">selected</c:if> >0${month}</c:if> <spring:message code="list.detail.day" text="일"/></option>
                                                <c:if test="${month gt 9}"><option value="${month}" <c:if test="${tbStoreMngCharge.plfChargeDay == month}">selected</c:if>>${month}</c:if> <spring:message code="list.detail.day" text="일"/></option>
                                            </c:forEach>
                                            <option value="29" <c:if test="${tbStoreMngCharge.mngChargeDay == 29}">selected</c:if>>말일</option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeductiondate" text="차감일을 선택해주세요 (월차감 전용)"/></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-3">
                    <div class="table-responsive">
                        <div class="timeline-header m-t-10 m-b-10">
                            <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                            <span><strong><spring:message code="list.detail.eatsuda" text="플랫폼 사용 여부"/></strong></span>
                        </div>
                        <form id="update_form3" name="update_form3">
                            <input type="hidden" class="storeNo" name="storeNo" value="${tbStore.storeNo}">
                            <input type="hidden" name="platformType" value="1">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.whethertousetheplatform" text="플랫폼 사용 여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="platformUseYn" value="0" class="align-bottom platformUseYn" <c:if test="${tbStoreServiceCharge1.platformUseYn == 0}">checked</c:if>> <spring:message code="list.detail.unused" text="미사용"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="platformUseYn" value="1" class="align-bottom platformUseYn" <c:if test="${tbStoreServiceCharge1.platformUseYn == 1}">checked</c:if>> <spring:message code="list.detail.used" text="사용"/><%--정상--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker height-50"><spring:message code="list.description.selectchargetheplatform" text="플랫폼 부과여부를 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.classificationofservicefeesettlement" text="서비스 이용료 정산구분"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="svcRateType" value="1" class="align-bottom svcRateType" <c:if test="${tbStoreServiceCharge1.svcRateType == 1}">checked</c:if>> <spring:message code="list.detail.flatrate" text="정액"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="svcRateType" value="2" class="align-bottom svcRateType" <c:if test="${tbStoreServiceCharge1.svcRateType == 2}">checked</c:if>> <spring:message code="list.detail.fixedrate" text="정률"/><%--정상--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selecttheservicefeesettlementcategory" text="서비스 이용료 정산구분을 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.platformmonthlyfee" text="플랫폼 월사용료"/></td>
                                    <td>
                                        <input class="form-control width-200" type="text"  name="svcPrice" value="${tbStoreServiceCharge1.svcPrice}" numberOnly maxlength="7">
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.detail.platformmonthlyfee" text="플랫폼 월사용료를 입력해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.settlementgroup" text="정산그룹"/></td>
                                    <td>
                                        <select class="form-control" name="chargeNo" class="chargeNo">
                                            <c:forEach var="item"  items="${tbServiceChargeGroup}"  varStatus="status">
                                                <option value="${item.chargeNo}" <c:if test="${tbStoreServiceCharge1.chargeNo == item.chargeNo}">selected</c:if>>${item.chargeName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectasettlementgroup" text="정산그룹을 선택해주세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.startofdeduction" text="차감시작일"/></td>
                                    <td><input class="form-control width-200 chargeStart1" type="text"  name="chargeStart" value="${tbStoreServiceCharge1.chargeStart}" ></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeductionstartdate" text="차감시작일을 선택해주세요"/></td>
                                </tr>
                              <%--  <tr>
                                    <td class="bg-light">차감일</td>
                                    <td>
                                        <select class="form-control plfChargeDay" name="plfChargeDay">
                                            <c:forEach begin="01" end="28" var="month">
                                                <c:if test="${month lt 10}"><option value="0${month}" <c:if test="${tbStoreServiceCharge1.plfChargeDay == month}">selected</c:if> >0${month}</c:if> 일</option>
                                                <c:if test="${month gt 9}"><option value="${month}" <c:if test="${tbStoreServiceCharge1.plfChargeDay == month}">selected</c:if>>${month}</c:if> 일</option>
                                            </c:forEach>
                                            <option value="29" <c:if test="${tbStoreServiceCharge1.plfChargeDay == 29}">selected</c:if>>말일</option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker">차감일을 선택해주세요</td>
                                </tr>--%>
                            </table>
                        </form>
                        <div class="timeline-header m-t-10 m-b-10">
                            <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                            <span><strong><spring:message code="list.detail.externalplatform" text="외부플랫폼"/></strong></span>
                        </div>
                        <form id="update_form4" name="update_form4">
                            <input type="hidden" class="storeNo" name="storeNo" value="${tbStore.storeNo}">
                            <input type="hidden" name="platformType" value="0">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.whethertousetheplatform" text="플랫폼 사용 여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="platformUseYn" value="0" class="align-bottom platformUseYn" <c:if test="${tbStoreServiceCharge0.platformUseYn == 0}">checked</c:if>>  <spring:message code="list.detail.unused" text="미사용"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="platformUseYn" value="1" class="align-bottom platformUseYn" <c:if test="${tbStoreServiceCharge0.platformUseYn == 1}">checked</c:if>> <spring:message code="list.detail.used" text="사용"/><%--정상--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker height-50"><spring:message code="list.description.selectchargetheplatform" text="플랫폼 부과여부를 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.classificationofservicefeesettlement" text="서비스 이용료 정산구분"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="svcRateType" value="1" class="align-bottom svcRateType" <c:if test="${tbStoreServiceCharge0.svcRateType == 1}">checked</c:if>> <spring:message code="list.detail.flatrate" text="정액"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="svcRateType" value="2" class="align-bottom svcRateType" <c:if test="${tbStoreServiceCharge0.svcRateType == 2}">checked</c:if>> <spring:message code="list.detail.fixedrate" text="정률"/><%--정상--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selecttheservicefeesettlementcategory" text="서비스 이용료 정산구분을 선택해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.platformmonthlyfee" text="플랫폼 월사용료"/></td>
                                    <td>
                                        <input class="form-control width-200" type="text"  name="svcPrice" value="${tbStoreServiceCharge0.svcPrice}" numberOnly maxlength="7">
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthemonthlyplatformfee" text="플랫폼 월사용료를 입력해주세요 (월차감 전용)"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.settlementgroup" text="정산그룹"/></td>
                                    <td>
                                        <select class="form-control" name="chargeNo" class="chageNo">
                                            <c:forEach var="item"  items="${tbServiceChargeGroup}"  varStatus="status">
                                                <option value="${item.chargeNo}" <c:if test="${tbStoreServiceCharge0.chargeNo == item.chargeNo}">selected</c:if>>${item.chargeName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectasettlementgroup" text="정산그룹을 선택해주세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.startofdeduction" text="차감시작일"/></td>
                                    <td><input class="form-control width-200 chargeStart0" type="text"  name="chargeStart" value="${tbStoreServiceCharge0.chargeStart}" ></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseselectadeductionstartdate" text="차감시작일을 선택해주세요"/></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <!-- end tab-pane -->
                <div class="m-t-10">
                    <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
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
        $("input[name=mngPrice],input[name=plfPrice]").focus(function(){
            /*  $(this).val('');*/
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });


        $("input[name=useYn]").on("change", function () {
f
            if($(this).val() == 0 ){
                $(".visibleTr").css("display", "none");
            } else {
                $(".visibleTr").css("display", "");
            }
        });
        $(".list_btn").click(function () {
            location.href = "${path}/merchant/storemngcharge/list";
        });

        $(".btn_update").click(function() {
            let url = "${path}/api/storemngcharge/update/action";
            let joinDate = replaceAll($(".mngChargeStart").val(),"-","");
            $(".mngChargeStart").val(joinDate);
            let joinDate2 = replaceAll($(".plfChargeStart").val(),"-","");
            $(".plfChargeStart").val(joinDate2);
            let joinDate3 = replaceAll($(".chargeStart1").val(),"-","");
            $(".chargeStart1").val(joinDate3);
            let joinDate4 = replaceAll($(".chargeStart0").val(),"-","");
            $(".chargeStart0").val(joinDate4);

            let _forms1 = $('#update_form,#update_form2');
            let _forms2 = $('#update_form3');
            let _forms3 = $('#update_form4');
            let req = convertFormToObj(_forms1);
            let req2 = convertFormToObj(_forms2);
            let req3 = convertFormToObj(_forms3);

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";

            /*let req2 = convertFormToObj(_forms2);*/
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
                        formData.append("tbStoreMngChargeData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbStoreServiceChargeData0",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                        formData.append("tbStoreServiceChargeData1",  new Blob([JSON.stringify(req3)], {type:"application/json"}));
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

        $(".mngChargeStart").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        if($(".mngChargeStart").val() ==  ""){
            $(".mngChargeStart").datepicker('setDate', new Date());
        }

        $(".plfChargeStart").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        if($(".plfChargeStart").val() ==  ""){
            $(".plfChargeStart").datepicker('setDate', new Date());
        }

        $(".chargeStart0").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        if($(".chargeStart0").val() ==  ""){
            $(".chargeStart0").datepicker('setDate', new Date());
        }

        $(".chargeStart1").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        if($(".chargeStart1").val() ==  ""){
            $(".chargeStart1").datepicker('setDate', new Date());
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
