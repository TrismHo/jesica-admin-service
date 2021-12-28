<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.franchiseedetails" text="가맹점 상세"/></title>

</head>
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
    .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
    .map_wrap {position:relative;width:100%;height:300px;}
    #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
    .bg_white {background:#fff;}
    #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
    #menu_wrap .option{text-align: center;}
    #menu_wrap .option p {margin:10px 0;}
    #menu_wrap .option button {margin-left:5px;}
    #placesList li {list-style: none;}
    #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
    #placesList .item span {display: block;margin-top:4px;}
    #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    #placesList .item .info{padding:10px 0 10px 55px;}
    #placesList .info .gray {color:#8a8a8a;}
    #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
    #placesList .info .tel {color:#009900;}
    #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
    #placesList .item .marker_1 {background-position: 0 -10px;}
    #placesList .item .marker_2 {background-position: 0 -56px;}
    #placesList .item .marker_3 {background-position: 0 -102px}
    #placesList .item .marker_4 {background-position: 0 -148px;}
    #placesList .item .marker_5 {background-position: 0 -194px;}
    #placesList .item .marker_6 {background-position: 0 -240px;}
    #placesList .item .marker_7 {background-position: 0 -286px;}
    #placesList .item .marker_8 {background-position: 0 -332px;}
    #placesList .item .marker_9 {background-position: 0 -378px;}
    #placesList .item .marker_10 {background-position: 0 -423px;}
    #placesList .item .marker_11 {background-position: 0 -470px;}
    #placesList .item .marker_12 {background-position: 0 -516px;}
    #placesList .item .marker_13 {background-position: 0 -562px;}
    #placesList .item .marker_14 {background-position: 0 -608px;}
    #placesList .item .marker_15 {background-position: 0 -654px;}
    #pagination {margin:10px auto;text-align: center;}
    #pagination a {display:inline-block;margin-right:10px;}
    #pagination .on {font-weight: bold; cursor: default;color:#777;}

    .map_wrap {width: 100%;position: relative;}
    .modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
    .getdata{position: absolute;top: 370px;left: 10px;z-index: 1;}
    #drawingMap, #map {width: 100%;height: 648px;}
    #map {margin-top: 10px;}

    .modal.modal-message .modal-body, .modal.modal-message .modal-footer, .modal.modal-message .modal-header {
        width: 100%;
        border: none;
        margin: 0 auto;
    }

    .modal .modal-header {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-flex: 0;
        -ms-flex: 0;
        flex: 0;
        -ms-flex-align: center;
        align-items: center;
    }

    @media (max-width: 1350px){
        .modal-content {
             width: 60%;
        }
    }

    @media (max-width: 1920px){
        .modal-content {
            width: 60%;
        }
    }

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
        <div id="content" class="content p-0">
            <div class="col-xl-12">
                <div class="p-t-20 p-b-0">
                    <ol class="breadcrumb float-xl-right p-r-10">
                        <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></li>
                        <li class="breadcrumb-item"><a href="${path}/workgroup/affilfranch/list"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise" text="가맹점"/></a></li>
                        <li class="breadcrumb-item active"><<spring:message code="list.detail.franchiseedetails" text="가맹점 상세"/></li>
                    </ol>
                    <h3 class="rix-title p-b-5"><spring:message code="list.detail.franchiseedetails" text="가맹점 상세"/></h3>
                </div>
                <div class="m-t-10">
                    <table class="table table-bordered">
                        <tr>
                            <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroup" text="업무그룹"/></strong></td>
                            <td style="width:35%">
                                <span class="text-green">[H${tbStore.head.headNo}]</span> ${tbStore.head.headName} &nbsp;|&nbsp;
                                <span class="text-green">[B${tbStore.branch.branchNo}]</span> ${tbStore.branch.branchName}
                            </td>
                            <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.franchisee" text="가맹점"/></strong></td>
                            <td>
                                <span class="text-green" style="width:35%">[S${tbStore.storeNo}]</span> ${tbStore.storeName}
                            </td>
                        </tr>
                    </table>
                </div>
                <ul class="nav nav-tabs m-t-10" id="sel_tab">
                    <li class="nav-item">
                        <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                            <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                        </a>
                    </li>
                    <li class="nav-item">
                          <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="list.detail.businessinformation" text="사업자 정보"/></span>
                              <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation" text="사업자 정보"/></span>
                          </a>
                    </li>
                    <%-- <li class="nav-item">
                         <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                             <span class="d-sm-none">플랫폼 사용료&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                             <span class="d-sm-block d-none">플랫폼 사용료&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                         </a>
                     </li>--%>
                    <%--  <li class="nav-item">
                          <a href="#default-tab-4" data-toggle="tab" class="nav-link">
                              <span class="d-sm-none">배달대행 설정&lt;%&ndash;<spring:message code="merchandise.detail.tab2" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                              <span class="d-sm-block d-none">배달대행 설정&lt;%&ndash;<spring:message code="merchandise.detail.tab2" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                          </a>
                      </li>--%>
                    <li class="nav-item">
                        <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.onlineplatformsettings" text="온라인 플랫폼 설정"/><%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.onlineplatformsettings" text="온라인 플랫폼 설정"/><%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#default-tab-6" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.user" text="사용자"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.user" text="사용자"/></span>
                        </a>
                    </li>
                     <%--<li class="nav-item">
                          <a href="#default-tab-6"  data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="블록 배달팁 설정"/></span>
                              <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="블록 배달팁 설정"/></span>
                          </a>
                      </li>--%>
                    <%--<li class="nav-item">
                        <a href="#default-tab-7" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none">특정지명 배달팁 설정&lt;%&ndash;<spring:message code="merchandise.detail.tab4" text="default text"/>&ndash;%&gt;&lt;%&ndash;옵션&ndash;%&gt;</span>
                            <span class="d-sm-block d-none">특정지명 배달팁 설정&lt;%&ndash;<spring:message code="merchandise.detail.tab4" text="default text"/>&ndash;%&gt;&lt;%&ndash;옵션&ndash;%&gt;</span>
                        </a>
                    </li>--%>
                   <%-- <li class="nav-item">
                        <a href="#default-tab-9" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="멀티가맹점 설정"/></span>
                            <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="멀티가맹점 설정"/></span>
                        </a>
                    </li>--%>
                </ul>
                <div class="tab-content">
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade active show" id="default-tab-1">
                        <div class="table-responsive">
                            <form class="update_form" id="update_form" method="post">
                                <input type="hidden" name="headNo" value="${tbStore.head.headNo}">
                                <input type="hidden" name="branchNo" value="${tbStore.branch.branchNo}">
                                <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                <input type="hidden" name="masterGoodsYn" value="">
                                <input type="hidden" name="masterChargeYn" value="">
                                <input type="hidden" name="masterStoreNo" value="">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${tbStore.insertUserId}">
                                <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%"><spring:message code="list.detail.serviceclassification" text="서비스구분"/></td>
                                    <td style="width:60%">
                                        <label class="">
                                            <input type="radio" name="serviceYn" class="align-bottom serviceYn"
                                                   value="0"
                                                   <c:if test="${tbStore.serviceYn == 'TEST_OR_CALC'}">checked</c:if> > <spring:message code="list.detail.test" text="테스트"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="serviceYn" class="align-bottom serviceYn"
                                                   value="1"
                                                   <c:if test="${tbStore.serviceYn == 'SERVICE'}">checked</c:if>> <spring:message code="list.detail.service" text="서비스"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.settlementisnotmadewhensettingupatest" text="테스트 설정시 정산이 이루어지지 않습니다."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/></td>
                                    <td><input type="text" class="form-control width-200 storeName" name="storeName"
                                               value="${tbStore.storeName}" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthemerchantname" text="가맹점 이름을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.externalmerchantcode" text="외부 가맹점 코드"/></td>
                                    <td><input type="text" class="form-control width-200 memo" name="exStoreCd" value="${tbStore.exStoreCd}" placeholder="<spring:message code="list.description.pleaseentertheexternalmerchantcode" text="외부 가맹점 코드를 입력해주세요"/>" maxlength="10"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheexternalmerchantcode" text="외부 가맹점 코드를 입력해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.defaultshippinggroup" text="기본 배송그룹"/></td>
                                    <td>
                                        <select class="form-control width-200 searchDlvyList dlvyNo" name="dlvyNo">
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.chooseyourdefaultshippinggroup" text="기본 배송그룹을 선택하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.franchiseestatus" text="가맹점 상태"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dataStatus" value="0"
                                                   class="align-bottom dataStatus"
                                                   <c:if test="${tbStore.dataStatus == 'DELETE'}">checked</c:if>><spring:message code="list.detail.delete" text="삭제"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="1"
                                                   class="align-bottom dataStatus"
                                                   <c:if test="${tbStore.dataStatus == 'OK'}">checked</c:if>><spring:message code="list.detail.normal" text="정상"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="2"
                                                   class="align-bottom dataStatus"
                                                   <c:if test="${tbStore.dataStatus == 'STOP'}">checked</c:if>><spring:message code="list.detail.stop" text="정지"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.aftercompletingbusinessmessage" text="사업자 인증 완료 후 정상으로 설정하세요."/></td>
                                </tr>
                                <%--<tr>
                                    <td class="bg-light height-50">직영가맹점 여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="masterYn" value="0" class="align-bottom masterYn"
                                                   <c:if test="${tbStore.masterGoodsYn == 'NO_MANAGEMENT'}">checked</c:if>> 일반가맹점
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="masterYn" value="1" class="align-bottom masterYn"
                                                   <c:if test="${tbStore.masterGoodsYn == 'SALES_MANAGEMENT'}">checked</c:if>> 직영가맹점
                                        </label>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.24houroperation" text="24시간운영 여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="alldayOpenYn" value="false"
                                                   class="align-bottom alldayOpenYn"
                                                   <c:if test="${tbStore.alldayOpenYn == false}">checked</c:if>> <spring:message code="list.detail.parttime" text="시간제"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="alldayOpenYn" value="true"
                                                   class="align-bottom alldayOpenYn"
                                                   <c:if test="${tbStore.alldayOpenYn == true}">checked</c:if>>  <spring:message code="list.detail.24hoursoperation" text="24시간"/>
                                            <%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.choosewhetherthestoreisopen24hours" text="매장 24시간 운영여부를 선택하세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.storetype" text="매장타입"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="storeType" value="0"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.serviceType == 'RENTCAR'}">checked</c:if>> <spring:message
                                                code="list.detail.1" text="렌터카"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="storeType" value="1"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.serviceType == 'CONSIGNMENT'}">checked</c:if>> <spring:message
                                                code="list.detail.1" text="탁송"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="storeType" value="2"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.serviceType == 'RESTAURANT'}">checked</c:if>> <spring:message
                                                code="list.detail.1" text="맛집"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="storeType" value="3"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.serviceType == 'MART'}">checked</c:if>>
                                            <spring:message code="list.detail.1" text="마트"/>
                                        </label>
                                    </td>
 
                                    <td class="text-danger-darker"><spring:message code="list.description.1e" text="서비스타입을 선택하세요."/></td>
                                </tr>
                               <%-- <tr>
                                    <td class="bg-light height-50">매장운영상태</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="openStatus" value="0" class="align-bottom openStatus" <c:if test="${tbStore.openStatus == 0}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="영업종료"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openStatus" value="1" class="align-bottom openStatus" <c:if test="${tbStore.openStatus == 1}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="영업"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="openStatus" value="2" class="align-bottom openStatus" <c:if test="${tbStore.openStatus == 2}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="휴식"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">매장 운영 상태를 선택하세요.</td>
                                </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.storeoperation/delivery" text="매장운영/배달"/></td>
                                        <td class="p-0 ">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 border-bottom-0 width-200"><spring:message code="list.detail.storeoperationstatus" text="매장운영상태"/></td>
                                                    <td class="border-0">
                                                        <label><input type="radio" padding: 0 0 0 50px; min-width:400px; name="openStatus" value="0" <c:if test="${tbStore.openStatus == 0}">checked</c:if>> <spring:message code="list.detail.closed" text="영업종료"/></label>
                                                        <label class="p-l-10"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="openStatus" value="1" <c:if test="${tbStore.openStatus == 1}">checked</c:if>> <spring:message code="list.detail.open" text="영업"/></label>
                                                        <label class="p-l-10"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="openStatus" value="2" <c:if test="${tbStore.openStatus == 2}">checked</c:if> > <spring:message code="list.detail.rest" text="휴식"/></label>
                                                    </td>
                                                </tr>
                                                <tr class="open_form_master_tr p-0"  style="display: <c:if test="${tbStore.openStatus != 1}">none</c:if>">
                                                    <td class="width-200  border-left-0 border-bottom-0"><spring:message code="list.detail.deliveryorderavailability" text="배달주문 가능여부"/></td>
                                                    <td class="border-left-0  border-bottom-0" colspan="2">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="dlvyYn" name="dlvyYn" value="0" checked <c:if test="${tbStore.dlvyYn == 0}">checked</c:if>> <spring:message code="list.detail.impossible" text="불가능"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="dlvyYn" name="dlvyYn" value="1" <c:if test="${tbStore.dlvyYn == 1}">checked</c:if>> <spring:message code="list.detail.possible" text="가능"/></label>
                                                    </td>
                                                </tr>
                                                <tr class="open_form_master_tr p-0"  style="display: <c:if test="${tbStore.openStatus != 1}">none</c:if>">
                                                    <td class="width-200  border-left-0 border-bottom-0"><spring:message code="list.detail.packagingorderavailability" text="포장주문 가능여부"/></td>
                                                    <td class="border-left-0  border-bottom-0" colspan="2">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="takeoutYn" name="takeoutYn" value="0"  <c:if test="${tbStore.takeoutYn == 0}">checked</c:if>>  <spring:message code="list.detail.impossible" text="불가능"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="takeoutYn" name="takeoutYn" value="1"  <c:if test="${tbStore.takeoutYn == 1}">checked</c:if>> <spring:message code="list.detail.possible" text="가능"/></label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectstoreoperationdelivery" text="매장운영/배달여부를 선택해주세요"/></td>
                                    </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.cookingtime" text="조리시간"/></td>
                                    <td>
                                        <select name="cookingTime" class="form-control cookingTime">
                                            <option value="5" <c:if test="${tbStore.cookingTime == 5}">selected</c:if>>5<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="10" <c:if test="${tbStore.cookingTime == 10}">selected</c:if>>10<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="15" <c:if test="${tbStore.cookingTime == 15}">selected</c:if>>15<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="20" <c:if test="${tbStore.cookingTime == 20}">selected</c:if>>20<spring:message code="list.detail.minute" text="조리분시간"/></option>
                                            <option value="25" <c:if test="${tbStore.cookingTime == 25}">selected</c:if>>25<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="30" <c:if test="${tbStore.cookingTime == 30}">selected</c:if>>30<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="40" <c:if test="${tbStore.cookingTime == 40}">selected</c:if>>40<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="50" <c:if test="${tbStore.cookingTime == 50}">selected</c:if>>50<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="60" <c:if test="${tbStore.cookingTime == 60}">selected</c:if>>1<spring:message code="list.detail.hour" text="시간"/></option>
                                            <option value="90" <c:if test="${tbStore.cookingTime == 90}">selected</c:if>>1<spring:message code="list.detail.hour" text="시간"/> 30<spring:message code="list.detail.minute" text="분"/></option>
                                            <option value="120" <c:if test="${tbStore.cookingTime == 120}">selected</c:if>>2<spring:message code="list.detail.hour" text="시간"/></option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.chooseacookingtime" text="조리시간을 선택하세요."/></td>
                                </tr>
                               <%-- <tr>
                                    <td class="bg-light height-50">배달주문 가능여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyYn" value="0" class="align-bottom dlvyYn" <c:if test="${tbStore.dlvyYn == 0}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="불가능"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyYn" value="1" class="align-bottom dlvyYn" <c:if test="${tbStore.dlvyYn == 1}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="가능"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">배달주문 가능여부를 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50">포장주문 가능여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="takeoutYn" value="0" class="align-bottom takeoutYn" <c:if test="${tbStore.takeoutYn == 0}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="불가능"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="takeoutYn" value="1" class="align-bottom takeoutYn" <c:if test="${tbStore.takeoutYn == 1}">checked</c:if>> <spring:message code="merchandise.search1.option4" text="가능"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">포장주문 가능여부를 선택하세요.</td>
                                </tr>--%>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.minimumamountfordelivery" text="배달가능 최소금액"/></td>
                                    <td>
                                        <input type="text" class="form-control width-200 dlvyMinAmt" name="dlvyMinAmt" value="${tbStore.dlvyMinAmt}"  maxlength="7" numberOnly> <spring:message code="list.detail.won" text="원"/>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheminimumdeliveryamount" text="배달가능 최소금액을 입력해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.whethertosetdeliveryarea" text="배달가능지역 설정여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dlvyAreaYn" value="0" class="align-bottom dlvyAreaYn" <c:if test="${tbStore.dlvyAreaYn == 0}">checked</c:if>> <spring:message code="list.detail.impossible" text="불가능"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dlvyAreaYn" value="1" class="align-bottom dlvyAreaYn" <c:if test="${tbStore.dlvyAreaYn == 1}">checked</c:if>> <spring:message code="list.detail.possible" text="가능"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectwhethertosetthedeliveryarea" text="배달가능지역 설정여부를 선택하세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.storerepresentativenumber" text="가맹점 대표번호"/></td>
                                    <td><input type="text" class="form-control width-200" name="storeTel"
                                               value="${tbStore.storeTel}"  maxlength="20" numberOnly></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourrepresentativenumber" text="대표번호를 입력하세요."/></td>
                                </tr>
                                <%-- <tr>
                                     <td>기본 배송그룹</td>
                                     <td>
                                         <label>
                                             <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="배송그룹선택&lt;%&ndash;<spring:message code="merchandise.search1.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white" readonly>
                                         </label>
                                     </td>
                                 </tr>--%>
                                <%--  <tr>
                                      <td>로그인ID</td>
                                      <td><input type="text" class="form-control width-200"></td>
                                  </tr>
                                  <tr>
                                      <td>로그인PW</td>
                                      <td><input type="text" class="form-control width-200"></td>
                                  </tr>--%>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.mobilephoneforauthentication" text="인증용 휴대전화"/></td>
                                    <td><input type="text" class="form-control width-200" name="authTel"
                                               value="${tbStore.authTel}"  maxlength="20" numberOnly></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthemobilephonenumbertobeusedforauthentication" text="인증시 사용할 휴대전화번호를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.salesrepresentativename" text="영업담당자 이름"/></td>
                                    <td><input type="text" class="form-control width-200" name="mngrName"
                                               value="${tbStore.mngrName}"  maxlength="40"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthenameofyoursalesrepresentative" text="영업 담당자 이름을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.addressname" text="주소 명칭"/></td>
                                    <td>
                                        <label class="m-r-10">
                                            <input type="text" class="form-control width-200" name="poi" value="${tbStore.poi}"  placeholder="<spring:message code="list.detail.addressname" text="주소 명칭"/>" readonly>
                                            <input
                                                    id="pac-input"
                                                    class="form-control width-250"
                                                    type="text"
                                                    placeholder="<spring:message code="list.description.pleasesearchfortheaddress" text="주소를 검색해주세요."/>" maxlength="250"
                                            /><input type="button" id="addressSearchButton" class="btn btn-primary p-t-5 p-b-5 m-l-10" value="<spring:message code="list.detail.addresssearch" text="주소검색"/>">
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.addressnameappmessage" text="앱에 표시될 주소 명칭입니다."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.map" text="지도"/></td>
                                    <td>
                                        <%--<div id="map" class="height-300 width-full"></div><br>--%>
                                            <div class="map_wrap mapRefreshBtn">
                                                <div id="map"  class="height-300 width-full" ></div>

                                                <div id="menu_wrap" class="bg_white">
                                                    <div class="option">
                                                        <div>
                                                            <spring:message code="list.detail.searchhistory" text="검색내역"/>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <ul id="placesList"></ul>
                                                    <div id="pagination"></div>
                                                </div>
                                            </div>
                                        <%--<input type="hidden" class="addr_1" id="addr_1" name="addr1" value="${tbStore.addr1}">--%>
                                          <spring:message code="list.detail.latitude" text="위도"/><input type="text" id="lat" name="lat" value="${tbStore.lat}" readonly>
                                         <spring:message code="list.detail.longitude" text="경도"/><input type="text" id="lng" name="lng" value="${tbStore.lng}" readonly>
                                        </label><br><br>
                                        <input type="text" class="form-control width-100" id="addr_1" name="addr1" value="${tbStore.addr1}" maxlength="30">
                                        <input type="text" class="form-control width-100" id="addr_2" name="addr2" value="${tbStore.addr2}" maxlength="50">
                                        <input type="text" class="form-control width-200" id="addr_3" name="addr3" value="${tbStore.addr3}" maxlength="100">
                                        <input type="text" class="form-control width-200" id="addr_4" name="addr4" value="${tbStore.addr4}" maxlength="100" placeholder="<spring:message code="list.detail.theremainingaddress" text="나머지주소"/>" >
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.addresssearchautosettingmessage" text="주소를 검색하면 주소 정보와 좌표가 자동 세팅됩니다."/></td>
                                </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.addressdetail" text="주소 상세"/></td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-400" name="addr5" value="${tbStore.addr5}" maxlength="200">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheaddressdetailsifany" text="주소 상세항목이 있으면 입력하세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.multimerchantsetting" text="멀티가맹점 설정"/></td>
                                        <td class="p-0 ">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 border-bottom-0 width-200"><spring:message code="list.detail.multimerchanttype" text="멀티가맹점 타입"/></td>
                                                    <td class="border-0">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="0" <c:if test="${tbStore.multiType.ordinal() == 0}">checked</c:if>> <spring:message code="list.detail.notused" text="사용안함"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="1" <c:if test="${tbStore.multiType.ordinal() == 1}">checked</c:if>> <spring:message code="list.detail.subordination" text="종속"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="2" <c:if test="${tbStore.multiType.ordinal() == 2}">checked</c:if>> <spring:message code="list.detail.master" text="마스터"/></label>
                                                    </td>
                                                </tr>
                                                <tr class="multi_form_master_tr p-0"  style="display: <c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 1}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 2}"></c:if>">
                                                    <td class="width-200  border-left-0 border-bottom-0"><spring:message code="list.detail.subsidiaryaffiliateproductsalesagency" text="종속가맹 상품 판매대행"/> </td>
                                                    <td class="border-left-0  border-bottom-0" colspan="2">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="masterGoodsYnChk" name="masterGoodsYnChk" value="0" <c:if test="${tbStore.masterGoodsYn.ordinal() == 0}">checked</c:if>> <spring:message code="list.detail.notused" text="사용안함"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterGoodsYnChk" name="masterGoodsYnChk" value="1"  <c:if test="${tbStore.masterGoodsYn.ordinal() == 1}">checked</c:if>> <spring:message code="list.detail.salesmanagement" text="판매관리"/></label>
                                                    </td>
                                                </tr>
                                               <tr class="multi_form_slave_tr" style="display:<c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 2}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 1}"></c:if>">
                                                    <td class="width-200 border-left-0 border-right-0"><spring:message code="list.detail.mastermerchantselection" text="마스터 가맹점 선택"/></td>
                                                    <td class="" >
                                                        <label>
                                                            <select class="form-control masterStoreNo" name="masterStoreNoSelect">
                                                            </select>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr class="multi_form_slave_tr" style="display:<c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 2}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 1}"></c:if>">
                                                    <td class="width-200 border-left-0 border-top-0 border-bottom-0"><spring:message code="list.detail.masteraffiliatesettlementmethod" text="마스터가맹 정산방식"/></td>
                                                    <td class="border-0">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="0" <c:if test="${tbStore.masterChargeYn.ordinal() == 0}">checked</c:if>=""> <spring:message code="list.detail.manualsettlement" text="수동정산"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="1"  <c:if test="${tbStore.masterChargeYn.ordinal() == 1}">checked</c:if>> <spring:message code="list.detail.realtimesettlement" text="실시간정산"/></label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectthemultimerchantsetting" text="멀티가맹점 설정을 선택해주세요."/></td>
                                    </tr>
                                    <tr>

                                   <%-- <tr>
                                        <td class="bg-light">가맹점설정</td>
                                        <td>
                                            <table class="table table-condensed table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td class="bg-light width-200">가맹점 구분</td>
                                                    <td>
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="0" <c:if test="${tbStore.multiType.ordinal() == 0}">checked</c:if>> 사용안함</label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="1" <c:if test="${tbStore.multiType.ordinal() == 1}">checked</c:if>> 종속</label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="2" <c:if test="${tbStore.multiType.ordinal() == 2}">checked</c:if>> 마스터</label>
                                                    </td>
                                                </tr>
                                                <tr class="multi_form_master_tr" style="display: <c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 1}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 2}">contents</c:if>">
                                                    <td class="bg-light">가맹점 설정</td>
                                                    <td class="padding-0">
                                                        <table style="width:100%;" id="">
                                                            <tbody>
                                                            <tr>
                                                                <td class="width-150 border-top-0 border-left-0 border-bottom-0">종속가맹 상품 판매대행 </td></td>
                                                                <td class="border-top-0 border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="masterGoodsYnChk" name="masterGoodsYnChk" value="0" <c:if test="${tbStore.masterGoodsYn.ordinal() == 0}">checked</c:if>> 관리안함</label>
                                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterGoodsYnChk" name="masterGoodsYnChk" value="1"  <c:if test="${tbStore.masterGoodsYn.ordinal() == 1}">checked</c:if>> 판매관리</label>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr class="multi_form_slave_tr" style="display:<c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 2}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 1}">contents</c:if>">
                                                    <td class="bg-light">상품관리여부</td>
                                                    <td class="padding-0">
                                                        <form class="multi_form_slave" id="multi_form_slave" method="post" >
                                                            <table style="width:100%;" id="">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="width-150 border-top-0 border-left-0 border-bottom-0">마스터 가맹점 선택</td></td>
                                                                    <td class="border-top-0 border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label>
                                                                            <select class="form-control masterStoreNo" name="masterStoreNoSelect">
                                                                            </select>
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="width-150border-left-0 border-bottom-0">마스터가맹 정산방식</td></td>
                                                                    <td class="border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="0" <c:if test="${tbStore.masterChargeYn.ordinal() == 0}">checked</c:if>=""> 수동정산</label>
                                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="1"  <c:if test="${tbStore.masterChargeYn.ordinal() == 1}">checked</c:if>> 실시간정산</label>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </form>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                    <td class="bg-light"><spring:message code="list.detail.deposit" text="예치금"/></td>
                                    <td><input type="texy" class="form-control width-200 deposit" name="deposit"
                                               value="${tbStore.deposit}" numberOnly readonly></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.transferringtoachargingaccountmessage" text="충전 계좌로 이체시 예치금으로 입금됩니다."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.cash" text="캐시"/></td>
                                    <td><input type="text" class="form-control width-200 cash" name="cash"
                                               value="${tbStore.cash}" numberOnly readonly> ( <spring:message code="list.detail.arrears" text="체납금"/> : ${tbStore.cashDefault} <spring:message code="list.detail.won" text="원"/> )
                                        <input type="hidden" name="cashDefault" value="${tbStore.cashDefault}" />
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.ifarrearsexistusewillbesuspended" text="체납금이 존재하면 사용이 정지됩니다."/></td>
                                </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200"  value="${cBankName}" readonly>
                                                        <input type="hidden" class="form-control width-200 cybankTypeCode" name="cybankTypeCode" value="${tbStore.cybankTypeCode}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 cybankAccount" name="cybankAccount" value="${tbStore.cybankAccount}" readonly></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200 "  value="${bankName}" readonly>
                                                        <input type="hidden" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${tbStore.bankTypeCode}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="${bankAccount}" readonly>
                                                        <input type="hidden" class="form-control width-200 bankAccount" name="bankAccount" value="${tbStore.bankAccount}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="${bankOwner}" readonly>
                                                        <input type="hidden" class="form-control width-200 bankOwner" name="bankOwner" value="${tbStore.bankOwner}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.pinnumber" text="PIN번호"/></td>
                                                    <td class="border-bottom-0 border-right-0">
                                                        <div class="pin-div">
                                                            <input  name="pinNum" class="form-control width-200 pinNum" value="${tbStore.pinNum}" type="password"  readonly>
                                                            <%--<i class="fa fa-eye fa-lg m-l-5"></i>--%>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                    </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                    <td><input type="text" class="form-control width-600" name="memo"
                                               value="${tbStore.memo}" placeholder="<spring:message code="list.detail.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>" maxlength="200"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                                </tr>

                            </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            </div>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-2">
                        <div class="table-responsive">
                            <form class="update_form2">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.mutual" text="상호"/></td>
                                        <td>
                                            <input type="text" class="form-control width-200 bizName" name="bizName" value="${tbStore.businessInfo.bizName}"  maxlength="80">
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="1" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'NORMAL'}">checked</c:if>><spring:message code="list.detail.normal" text="일반"/>
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="2" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'SIMPLE_BUSINESS'}">checked</c:if>><spring:message code="list.detail.simple" text="간이"/>
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="3" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'CORPORATION'}">checked</c:if>><spring:message code="list.detail.corporation" text="법인"/>
                                            </label>
                                            <label class="font-size-10 m-l-10">
                                                <input type="radio" name="corpType" value="0" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'UNKNOWN'}">checked</c:if>><spring:message code="list.detail.unknown" text="알수없음"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthebusinessnamemessage" text="사업자등록증 기준의 상호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.companyregistrationnumber" text="사업자 등록번호"/></td>
                                        <td style="width:60%"><input type="text" class="form-control width-200 bizNum" name="bizNum" value="${tbStore.businessInfo.bizNum}" maxlength="20" numberOnly="true"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.entertheregistrationnumbermessage" text="사업자등록증의 등록번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.authenticationstatus" text="인증 상태"/></td>
                                        <td>
                                            <select class="form-control m-r-10 authStatus" name="authStatus">
                                                <option value="0" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 0}"> selected </c:if>><spring:message code="list.detail.notcertified" text="미인증"/></option>
                                                <option value="1" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 1}"> selected </c:if>><spring:message code="list.detail.waiting" text="대기"/></option>
                                                <option value="2" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 2}"> selected </c:if>><spring:message code="list.detail.acknowledgment" text="승인"/></option>
                                                <option value="3" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 3}"> selected </c:if>><spring:message code="list.detail.reject" text="거절"/></option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.youcanusetheserviceafterbusinessverification" text="사업자 인증후 서비스 이용이 가능합니다."/></td>
                                    </tr>
                                    <%--                           <tr>
                                                                   <td class="bg-light">사업자 등록증</td>
                                                                   <td>
                                                                       <label for="saupja" class="width-100 height-30 text-center line-height-30" style="background: #a0a0a0;">파일업로드</label>
                                                                       <input type="file" class="d-none" id="saupja">
                                                                       <div class="width-200 height-30 border overflow-hidden m-t-10 line-height-25 white-space-nowrap text-overflow-ellipsis">
                                                                           <span class="fileName"></span>
                                                                       </div>
                                                                   </td>
                                                               </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.representativename" text="대표자명"/></td>
                                        <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="${tbStore.businessInfo.bizOwner}" maxlength="30"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.entertherepresentativebasemessage" text="사업자등록증 기준의 대표자를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.email" text="이메일"/></td>
                                        <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value="${tbStore.businessInfo.bizEmail}" maxlength="45"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.entertheemailtoreceivetheinvoice" text="계산서를 수신할 이메일을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.contact" text="연락처"/></td>
                                        <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value="${tbStore.businessInfo.bizTel}" maxlength="40" numberOnly="true"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourbusinesscontactinformation" text="사업자 연락처를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.businessaddress" text="사업장 주소"/></td>
                                        <td><input type="text" name="bizAddr" class="form-control width-400 bizAddr" value="${tbStore.businessInfo.bizAddr}" maxlength="150"></td>
                                        <td class="text-danger-darker">.<spring:message code="list.description.entertheaddressonyourbusinessmessage" text="사업자등록증 상의 주소를 입력하세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.typeofbusiness/industry" text="업태/업종"/></td>
                                        <td>
                                            <input type="text" name="bizType" class="form-control m-r-10 width-200 bizType" value="${tbStore.businessInfo.bizType}" maxlength="80">
                                            <input type="text" name="bizItem" class="form-control width-200 bizItem" value="${tbStore.businessInfo.bizItem}" maxlength="80">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.typeofbusinessindustrymessage" text="사업자등록증 상의 업태와 종목를 입력하세요."/></td>
                                    </tr>
                                </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            </div>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <%--<div class="tab-pane fade" id="default-tab-3">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td rowspan="4" class="bg-light-darker"><spring:message code="list.detail.typeofbusiness/industry" text="만나 플랫폼"/></td>
                                    <td class="bg-light"><spring:message code="list.detail.whetherornottouse" text="사용 여부"/></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked><spring:message code="list.detail.used" text="사용"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom"><spring:message code="list.detail.notused" text="사용안함"/>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.usagefeeperorder" text="주문건당 사용료"/></td>
                                    <td>660원 / 월 최대 66,000</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">차감 시작일</td>
                                    <td>
                                        <label>
                                            <input type="text" class="date form-control background-white" readonly>
                                        </label>
                                        <label>
                                            부터 차감 / 매월
                                        </label>
                                        <label>
                                            <select class="form-control width-80">
                                                <c:forEach begin="1" end="28" varStatus="idx">
                                                    <option>${idx.index}일</option>
                                                </c:forEach>
                                                <option>말일</option>
                                            </select>
                                        </label>
                                        <label>
                                            누적금액 초기화
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">수수료 정산대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom" checked>지정
                                            안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">지정&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light-darker" rowspan="2">온라인 플랫폼</td>
                                    <td class="bg-light">주문건당 가맹비</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200" value="0">
                                        </label>
                                        <label>
                                            % (주문금액 대비)
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">수수료 정산대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom" checked>지정
                                            안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">지정&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="4" class="bg-light-darker">MCS 플랫폼</td>
                                    <td class="bg-light">사용 여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">사용안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">월 사용료</td>
                                    <td><input type="text" class="form-control width-200"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">차감 시작일</td>
                                    <td>
                                        <label>관리자_D 에서 신청 가능합니다</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">수수료 정산대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>소속총판&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">영업총판&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3" class="bg-light-darker">기타 사용료</td>
                                    <td class="bg-light">심부름 건당관리비</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200">
                                        </label>
                                        <label>
                                            원 이하 주문 시 심부름 건당관리비 차감안함
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">알림톡 건당</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200">
                                        </label>
                                        <label>
                                            원
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">친구톡 건당</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200">
                                        </label>
                                        <label>
                                            원
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light-darker">리스비</td>
                                    <td colspan="2">
                                        <label>
                                            <label>
                                                <select class="form-control width-200">
                                                    <option>리스비 구분 선택</option>
                                                    <option>프린터 리스</option>
                                                    <option>키폰 리스</option>
                                                    <option>CID 리스</option>
                                                    <option>전기자전거 리스</option>
                                                    <option>운전자보험(바이크마스터)</option>
                                                    <option>오토바이리스(바이크마스터)</option>
                                                    <option>오토바이렌탈(대전런닝맨)</option>
                                                    <option>기타장비 리스</option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" class="form-control width-200" placeholder="관리명 입력">
                                            </label>
                                            <label>
                                                <input type="text" class="form-control width-200" placeholder="0">원
                                            </label>
                                        </label>
                                        <br>
                                        <label class="m-t-10">
                                            <label>
                                                <input type="text" class="date form-control background-white" readonly>부터
                                            </label>
                                            <label class="m-l-5 ">
                                                <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                       class="align-bottom">매월&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label>
                                                <select class="form-control width-80">
                                                    <option>1일</option>
                                                    <option>5일</option>
                                                    <option>10일</option>
                                                    <option>15일</option>
                                                    <option>20일</option>
                                                    <option>25일</option>
                                                    <option>말일</option>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control width-80">
                                                    <c:forEach begin="1" end="24" varStatus="idx">
                                                        <option>${idx.index}개월</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label class="m-l-5 ">
                                                <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                       class="align-bottom">매일&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label>
                                                <select class="form-control width-80">
                                                    <c:forEach begin="1" end="365" varStatus="idx">
                                                        <option>${idx.index}일</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <button type="button" class="btn-box">등록하기</button>
                                            </label>
                                        </label>
                                        <br>
                                        <label class="col-form-label">
                                            <i class="fa fa-asterisk rix_asterisk " title="필수 입력 항목입니다.">
                                                <strong class="">리스비 사용시
                                                    등록하세요.&lt;%&ndash;<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>&ndash;%&gt;&lt;%&ndash;[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.&ndash;%&gt; </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>--%>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <%--<div class="tab-pane fade" id="default-tab-4">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light">가맹점 특이시항(기사용)</td>
                                    <td colspan="2"><input type="text" class="form-control width-200"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">24시간
                                        운영&lt;%&ndash;<spring:message code="merchandise.detail.merchanname" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</td>
                                    <td colspan="2">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>설정&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">설정안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">할증여부
                                        표시설정&lt;%&ndash;<spring:message code="merchandise.detail.merchanname" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</td>
                                    <td colspan="3">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>표시&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">표시안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">배달의 민족 포장주문
                                        연동&lt;%&ndash;<spring:message code="merchandise.detail.merchanname" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</td>
                                    <td colspan="3">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>표시&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">표시안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">상품 준비시간</td>
                                    <td colspan="2">
                                        <select class="form-control width-80">
                                            <option>5분</option>
                                            <option>10분</option>
                                            <option>15분</option>
                                            <option>20분</option>
                                            <option>25분</option>
                                            <option>30분</option>
                                            <option>40분</option>
                                            <option>50분</option>
                                            <option>60분</option>
                                            <option>90분</option>
                                            <option>120분</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">접수시
                                        자동변경&lt;%&ndash;<spring:message code="merchandise.detail.merchanname" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</td>
                                    <td colspan="3">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom">배달요청으로
                                            변경&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom">완료로
                                            변경&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="4" class="bg-light">MCS 플랫폼</td>
                                    <td>차감대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>제휴본사&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">총판&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>현금결제 시 배송원 상품대금 지불방식</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom" checked>현금
                                            가능&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom">페이만 가능 (완료시
                                            자동정산)&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>배송원 정산</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>정산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">정산안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>세무 처리</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>현금영수증(플랫폼사)&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">세금계산서(플랫폼사)&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">세금계산서(소속총판)&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">자체발행(소속총판)&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="p-l-10">
                                            <button type="button" class="btn btn-gray" data-toggle="modal"
                                                    data-target="#listRequest_modal">신청내역
                                            </button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배달대행 락 타임</td>
                                    <td colspan="2">
                                        <select class="form-control width-80">
                                            <option>즉시</option>
                                            <option>10초</option>
                                            <option>20초</option>
                                            <option>30초</option>
                                            <option>40초</option>
                                            <option>50초</option>
                                            <option>1분</option>
                                            <option>2분</option>
                                            <option>5분</option>
                                            <option>7분</option>
                                            <option>10분</option>
                                            <option>공유안함</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">외부 포스 연동</td>
                                    <td colspan="2">
                                        <label>
                                            <select class="form-control width-170">
                                                <option value="">포스 선택</option>
                                                <option value="1001">유니타스</option>
                                                <option value="1002">SPC</option>
                                                <option value="1003">SKY포스A</option>
                                                <option value="1004">EasyPOS</option>
                                                <option value="1005">솔비POS</option>
                                                <option value="1006">OK POS(KIS)</option>
                                                <option value="1007">푸드테크</option>
                                                <option value="1008">KFC</option>
                                                <option value="1009">OK POS(스파이더)</option>
                                                <option value="1015">씨스페이스</option>
                                                <option value="1018">도깨비포스(마마트)</option>
                                                <option value="1019">바나나포스</option>
                                                <option value="1020">도깨비포스(포유25)</option>
                                                <option value="1021">BBQ-M</option>
                                                <option value="1022">네투시스</option>
                                                <option value="1023">CNTT</option>
                                                <option value="1024">콜신저</option>
                                                <option value="1025">여보세요</option>
                                                <option value="1027">포스피드</option>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <option value="">브랜드없음</option>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="text" class="form-control width-200" placeholder="포스매장코드">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-gray">연동하기</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배달 가능 지역 설정</td>
                                    <td colspan="2">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">사용&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>--%>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-5">
                        <div class="table-responsive">
                            <form class="update_form" id="update_form5" method="post">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%"><spring:message code="list.detail.merchantdisplayname" text="가맹점 표시명"/></td>
                                    <td style="width:60%"><input type="text" class="form-control width-200" name="storeNameInapp" value="${tbStore.storeNameInapp}" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.thestorenameasitappearsintheapp" text="앱에 표시되는 매장 이름입니다."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.onlinestoreurl" text="온라인매장 URL"/></td>
                                    <td><input type="text" class="form-control  width-400" name="storeUrl" value="${tbStore.storeUrl}" placeholder="<spring:message code="list.description.pleaseenteryouronlinestoreaddress" text="온라인매장 주소를 입력해주세요"/>" maxlength="80"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryouronlinestoreaddress" text="온라인매장 주소를 입력해주세요"/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.merchantintroduction" text="가맹점 소개"/></td>
                                    <td>
                                        <input type="text" class="form-control width-400"  name="storeIntro" value="${tbStore.storeIntro}" maxlength="80">
                                        <%--${tbStore.storeIntro}--%>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.abriefstoreintroductiondisplayedintheapp" text="앱에 표시되는 간략한 매장 소개입니다."/></td>
                                </tr>

                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.ordercategory" text="주문 카테고리"/></td>
                                    <td>
                                        <c:forEach var="item" items="${tbSystemCategory}" varStatus="status1">
                                    <label class=" m-r-5">



                                            <div class="checks small m-l-10">
                                                <input type="checkbox" class="chkCatCode" id="ex_chk${status1.index}"
                                                       catCode="${item.catCode}"
                                                       catLevel="${item.catLevel}"
                                                       catValue="${item.catValue}"
                                                       parentCatCode="${item.parentCatCode}"
                                                <c:forEach var="itemFo" items="${tbStoreCategoryFo}" varStatus="status2">
                                                    <c:choose>
                                                        <c:when test="${item.catCode == itemFo.catCode}">
                                                               checked
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                >
                                                <label for="ex_chk${status1.index}">    ${item.catName}</label>
                                            </div>

                                    </label>

                                </c:forEach>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectthedeliverycategorymessage" text="앱에 노출될 배달 카테고리를 선택하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">
                                        <spring:message code="list.detail.storethumbnailimage" text="매장 썸네일 이미지"/>
                                    </td>
                                    <td>
                                        <div class="category_sort">
                                            <ul class="sort_list">
                                                <li>
                                                    <div class="sort_body2" id="sort_body2">
                                                        <img style="width: 150px;" class="storeImg2" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        <%--<img class="img-preview" src="data:image/png;base64,${tbStore.imgFile1}"
                                                             onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">--%>
                                                    </div>
                                                </li>
                                                <li>
                                                    <%--* 권장 이미지 비율 : 984*876<br>--%>
                                                    <div class="onlinePlatFormFileName2 m-b-10 m-t-5"></div>
                                                    <div class="onlinePlatFormFileSize2"></div>
                                                </li>
                                            </ul>
                                            <label for="imgFileSmall">
                                                <div id="button_base2"
                                                     class="button_base b03_skewed_slide_in btn btn-primary">
                                                    <div> <spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                </div>
                                            </label>
                                            <input type="file" id="imgFileSmall" name="imgFileSmall" value="${tbStore.imgFileSmall}"
                                                   class="fileBtn d-none">
                                            <input type="hidden" name="imgFileSmall" value="${tbStore.imgFileSmall}">
                                        </div>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.thisisasmallimagedisplaymessage" text="배달 카테고리내 매장리스트에 표시되는 작은 이미지입니다. "/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">
                                        <spring:message code="list.detail.mainimage" text="메인 이미지"/>
                                    </td>
                                    <td>
                                        <div class="category_sort">
                                            <ul class="sort_list">
                                                <li>
                                                    <div class="sort_body" id="sort_body">
                                                        <%--<img style="width: 150px;" class="storeImg" src="${path}/api/img/fileLoad?filePath=${tbStore.imgFile1}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">--%>
                                                        <img style="width: 150px;" class="storeImg" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        <%--<img class="img-preview" src="data:image/png;base64,${tbStore.imgFile1}"
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
                                                <div id="button_base"
                                                     class="button_base b03_skewed_slide_in btn btn-primary">
                                                    <div> <spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                </div>
                                            </label>
                                            <input type="file" id="imgFile1" name="imgFile1" value="${tbStore.imgFile1}"
                                                   class="fileBtn d-none">
                                            <input type="hidden" name="imgFile1" value="${tbStore.imgFile1}">
                                        </div>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.thisistheimagedisplayedonthemainstore" text="매장 메인에 표시되는 이미지입니다."/></td>
                                </tr>
                                <%--<tr>
                                    <td class="bg-light">가맹점 설명</td>
                                    <td><input type="text" class="form-control width-400" value=""></td>
                                </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">영업 상태</td>
                                     <td>
                                         <label class="">
                                             <input type="radio" name="status19" class="align-bottom"
                                                    checked>영업&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                         </label>
                                         <label class="m-l-10 ">
                                             <input type="radio" name="status19"
                                                    class="align-bottom">휴식&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">영업 시간</td>
                                     <td>
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="23" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="59" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                         ~
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="23" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="59" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">영업 요일</td>
                                     <td>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>일
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>월
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>화
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>수
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>목
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>금
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>토
                                         </label>
                                     </td>
                                 </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">봉사료</td>
                                     <td class="p-0">
                                         <table class="width-full">
                                             <tr>
                                                 <td class="border-left-0 border-top-0">구간1</td>
                                                 <td class="border-left-0 border-top-0 border-right-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 미만 주문 시
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-left-0">구간2</td>
                                                 <td class="border-right-0 border-left-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 미만 주문 시
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-left-0">구간3</td>
                                                 <td class="border-right-0 border-left-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 미만 주문 시
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-bottom-0 border-left-0">최종 구간</td>
                                                 <td class="border-bottom-0 border-right-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 이상
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                 </tr>--%>
                                <%-- <tr>
                                     <td class="bg-light">결제수단설정</td>
                                     <td>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>선결제(신용카드)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>선결제(제로페이)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>선결제(온통대전)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>만나서결제(현금)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>만나서결제(카드)
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">외부 주문플랫폼 연동</td>
                                     <td>
                                         <label>
                                             <select class="form-control width-170">
                                                 <option>플랫폼 선택</option>
                                                 <option>KT지니</option>
                                                 <option>바로플랫폼</option>
                                                 <option>KIS(스마트오더)</option>
                                                 <option>스마트데이터</option>
                                                 <option>모아플랫폼</option>
                                                 <option>KG이니시스</option>
                                             </select>
                                         </label>
                                         <label>
                                             <input type="text" class="form-control width-200"
                                                    placeholder="외부 주문플랫폼 가맹점 식별자">
                                         </label>
                                         <label>
                                             <button type="button" class="btn-box">연동 추가</button>
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">보이는 ARS</td>
                                     <td class="p-0">
                                         <table class="width-full">
                                             <tr>
                                                 <td class="border-top-0">ARS 번호</td>
                                                 <td class="border-top-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">
                                                     </label>
                                                     <label>
                                                         <button type="button" class="btn-box">번호 검색</button>
                                                     </label>
                                                 </td>
                                                 <td rowspan="2" class="p-0 border-top-0 border-bottom-0 border-right-0"
                                                     style="width: 60%; max-width: 60%;">
                                                     <label>
                                                         <button type="button" class="btn btn-gray"
                                                                 style="height: 95px; width: 95px; border-radius: 0;">ARS 설정
                                                         </button>
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-bottom-0">연결 URL</td>
                                                 <td class="border-bottom-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">
                                                     </label>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                 </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">배달가능 최소 주문금액</td>
                                     <td>
                                         <label>
                                             <input type="text" class="form-control width-200">원 이상 주문 가능
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">매장 테이블 개수</td>
                                     <td>
                                         <label>
                                             <input type="text" class="form-control width-200">개
                                         </label>
                                     </td>
                                 </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">영수증 원산지 표시</td>
                                     <td>
                                         <label>
                                             <input type="text" class="form-control width-300">
                                         </label>
                                     </td>
                                 </tr>--%>
                            </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="default-tab-6">
                            <form class="update_form" id="update_form6" method="post">
                                <div class="table-responsive" style="overflow: hidden;">
                                    <a href="#modal-message" class="btn btn-sm btn-primary m-t-25 m-b-10" data-toggle="modal"><spring:message code="list.detail.userregistration" text="사용자 등록"/></a>
                                    <table class="table table-condensed table-bordered">
                                        <tr id="basicOptionYnView" class="border-0" >
                                            <td colspan="2" class="p-0" style="border: 0;">
                                                <div class="tab-pane fade active show" >

                                                    <form id="update_form2" style="width: 100%;" class="p-0">
                                                        <div class="panel panel-inverse">
                                                            <div class="height-300 overflow-auto border">
                                                                <input type="hidden"  class="viewOrder" value="">
                                                                <table class="table table-bordered border-bottom text-center border-0">
                                                                    <thead>
                                                                    <tr>
                                                                        <th class="bg-light" style="width:5%"><spring:message code="list.detail.no" text="번호"/></th>
                                                                        <th class="bg-light" style="width:15%"><spring:message code="list.detail.id" text="아이디"/></th>
                                                                        <th class="bg-light" style="width:15%"><spring:message code="list.detail.username" text="사용자 이름"/></th>
                                                                        <th class="bg-light" style="width:15%"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></th>
                                                                        <th class="bg-light" style="width:30%"><spring:message code="list.detail.memo" text="메모"/></th>
                                                                        <th class="bg-light" style="width:10%"><spring:message code="list.detail.status" text="상태"/></th>
                                                                        <th class="bg-light" style="width:20%"></th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody id="tbUserStaffBody">

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="m-t-10">
                                        <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                        <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                                    </div>
                                </div>
                            </form>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <%--<div class="tab-pane fade" id="default-tab-6">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6">
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="20%"/>
                                        <col width="20%"/>
                                        <col width="15%"/>
                                        <col width="15%"/>
                                        <col width="20%"/>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th colspan="6" class="tabla-custom-title">블록 등록/수정</th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light text-center">선택</th>
                                        <th class="bg-light">블록명</th>
                                        <th class="bg-light">금액</th>
                                        <th class="bg-light">요금구분</th>
                                        <th class="bg-light">상태</th>
                                        <th class="bg-light">정렬</th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light"></th>
                                        <td><input type="text" class="form-control-width-custom"></td>
                                        <th>
                                            <input type="text" class="form-control-width-custom">
                                        </th>
                                        <td>
                                            <select class="form-control-width-custom">
                                                <option>고정</option>
                                                <option>추가</option>
                                            </select>
                                        </td>
                                        <th>
                                            <select class="form-control-width-custom">
                                                <option>정상</option>
                                                <option>정지</option>
                                            </select>
                                        </th>
                                        <td>
                                            <button type="button" class="btn btn-purple"><i class="fa fa-cog"></i> 초기화
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="float-right m-b-20">
                                    <div class="btn-group">
                                        <button type="button" onclick="insBlock()" class="btn btn-white border-right-0 color">등록</button>
                                        <button type="button" onclick="selectOverlay('POLYGON')" class="btn btn-white btn-draw">그리기</button>
                                        <button type="button" class="btn btn-white btn-draw-hide d-none">숨기기</button>
                                    </div>
                                </div>
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <tbody>
                                    <tr>
                                        <th colspan="6" class="tabla-custom-title">등록 리스트</th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light text-center">선택</th>
                                        <th class="bg-light">블록명</th>
                                        <th class="bg-light">금액</th>
                                        <th class="bg-light">요금구분</th>
                                        <th class="bg-light">상태</th>
                                        <th class="bg-light">정렬</th>
                                    </tr>
                                    <tr>
                                        <th><input type="radio"></th>
                                        <td>신도림동</td>
                                        <th>
                                            <input type="text" class="form-control-width-custom">
                                        </th>
                                        <td>
                                            <select class="form-control-width-custom">
                                                <option>고정</option>
                                                <option>추가</option>
                                            </select>
                                        </td>
                                        <th>
                                            <select class="form-control-width-custom">
                                                <option>정상</option>
                                                <option>정지</option>
                                            </select>
                                        </th>
                                        <td>
                                            <div class="d-table m-auto">
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-double-up align-sub"></span>
                                                </a>
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-up align-sub"></span></a>
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-down align-sub"></span>
                                                </a>
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-double-down align-sub"></span>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-6 col-lg-6 height-full">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="map_wrap mapRefreshBtn" style="height: 650px;">
                                                <div id="drawingMap"></div>
                                                <p class="modes">
                                                    <input type="button" class="btn btn-primary p-5" onclick="" value="모든 블록 보기">
                                                    <input type="button" class="btn btn-white p-5" onclick="" value="모든 블록 닫기">
                                                </p>
&lt;%&ndash;
                                                <p class="modes">
                                                    <input type="button" onclick="selectOverlay('MARKER')" value="마커">
                                                    <input type="button" onclick="selectOverlay('POLYLINE')" value="선">
                                                    <input type="button" onclick="selectOverlay('CIRCLE')" value="원">
                                                    <input type="button" onclick="selectOverlay('RECTANGLE')" value="사각형">
                                                    <input type="button" onclick="selectOverlay('POLYGON')" value="다각형">
                                                </p>
&ndash;%&gt;
                                            </div>

                                        </td>
                                    </tr>

                                    </tbody></table>
                               &lt;%&ndash; <div id="tipmap" class="height-full width-full"></div>&ndash;%&gt;

                            </div>

                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 수정&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                            </div>
                        </div>
                    </div>--%>

                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                   <%-- <div class="tab-pane fade" id="default-tab-7">
                        <div class="height-500" data-scrollbar="true">
                            <div class="table-responsive">
                                <table class="table table-condensed table-bordered">
                                    <thead>
                                    <th>특정지명</th>
                                    <th>추가요금</th>
                                    <th>검색범위</th>
                                    <th>등록/수정/삭제</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input type="text" class="form-control width-200" placeholder="특정지명을 입력하세요">
                                        </td>
                                        <td><input type="text" class="form-control width-200" value="0">원</td>
                                        <td>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">지번
                                            </label>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">도로명
                                            </label>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">상세주소
                                            </label>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">행정동명
                                            </label>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary">등록</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </td>
                                    </tr>
                                    <c:forEach begin="0" end="5">
                                        <tr>
                                            <td><input type="text" class="form-control width-200" placeholder="특정지명을 입력하세요">
                                            </td>
                                            <td><input type="text" class="form-control width-200" value="0">원</td>
                                            <td>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>지번
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>도로명
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>상세주소
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>행정동명
                                                </label>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary">수정</button>
                                                <button type="button" class="btn btn-danger">삭제</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>--%>
                    <!-- begin tab-pane -->
                    <%--<div class="tab-pane fade" id="default-tab-8">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light" style="width:15%">영업상태</td>
                                    <td style="width:60%">
                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="saleStatus" value="1"> 영업</label>
                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="saleStatus" value="0" checked=""> 휴식</label>
                                    </td>
                                    <td class="text-danger-darker">매장 open/close 상태를 변경할 수 있습니다.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">영업요일</td>
                                    <td>
                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  id="sOrdWorkType" name="sOrdWorkType" value="1" onclick="fncWorkDayChDisplay('1');" checked> 평일 / 주말 동일</label>
                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px;  id="sOrdWorkType" name="sOrdWorkType" value="2" onclick="fncWorkDayChDisplay('2');" checked> 평일 / 주말 별도</label>
                                    </td>
                                    <td class="text-danger-darker">평일과 주말의 영업시간이 동일한지를 선택하세요.</td>
                                </tr>
                                <tr class="padding-0">
                                    <td class="bg-light">영업시간</td>
                                    <td class="padding-0 border-left-0">
                                        <table class="border-left-0 border-top-0 border-bottom-0" style="width:100%;">
                                            <tbody><tr id="eWorkDay_0" style="display:none">
                                                <td class="border-left-0 border-top-0 border-bottom-0 width-100" id="eAllDayTime">매일</td>
                                                <td class="border-left-0 border-right-0 border-top-0 border-bottom-0">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('0');" value="24시간">
                                                </td>
                                            </tr>
                                            <tr id="eWorkDay_1" style="">
                                                <td class="border-left-0 border-top-0 width-100" id="eAllDayTime">월 ~ 금</td>
                                                <td class="border-left-0 border-right-0 border-top-0">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('1');" value="24시간">
                                                </td>
                                            </tr>
                                            <tr id="eWorkDay_2" style="">
                                                <td class="border-left-0 width-100" id="eAllDayTime">토요일</td>
                                                <td class="border-right-0">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('2');" value="24시간">
                                                </td>
                                            </tr>
                                            <tr id="eWorkDay_3" style="">
                                                <td class="border-left-0 border-top-0 border-bottom-0 width-100" id="eAllDayTime">일요일</td>
                                                <td class="border-left-0 border-top-0 border-bottom-0 border-right-0 ">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('3');" value="24시간">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker">영업시간을 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">휴게시간</td>
                                    <td class="padding-0 ">
                                        <table style="width:100%;" class="">
                                            <tbody>
                                            <tr id="eBreakTime_0">
                                                <td class="border-left-0 border-top-0 border-bottom-0 border-right-0" colspan="2">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTime" value="0" checked="" onclick="fncBreakTimeChDisplay('0');"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTime" value="1" onclick="fncBreakTimeChDisplay('1');" checked> 설정</label>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_1" style="">
                                                <td class="width-100 border-left-0 border-right-0">일요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSunday" value="N" checked="" onclick="$('#eSBreakTime_0').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSunday" value="Y" onclick="$('#eSBreakTime_0').show();"> 설정</label>

                                                    <span id="eSBreakTime_0" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_2" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">월요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeMonday" value="N" checked="" onclick="$('#eSBreakTime_1').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeMonday" value="Y" onclick="$('#eSBreakTime_1').show();"> 설정</label>

                                                    <span id="eSBreakTime_1" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_3" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">화요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeTuesday" value="N" checked="" onclick="$('#eSBreakTime_2').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeTuesday" value="Y" onclick="$('#eSBreakTime_2').show();"> 설정</label>

                                                    <span id="eSBreakTime_2" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_4" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">수요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeWednesday" value="N" checked="" onclick="$('#eSBreakTime_3').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeWednesday" value="Y" onclick="$('#eSBreakTime_3').show();"> 설정</label>

                                                    <span id="eSBreakTime_3" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_5" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">목요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeThursday" value="N" checked="" onclick="$('#eSBreakTime_4').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeThursday" value="Y" onclick="$('#eSBreakTime_4').show();"> 설정</label>

                                                    <span id="eSBreakTime_4" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" name="">
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_6" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">금요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeFriday" value="N" checked="" onclick="$('#eSBreakTime_5').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeFriday" value="Y" onclick="$('#eSBreakTime_5').show();"> 설정</label>

                                                    <span id="eSBreakTime_5" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_7" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-bottom-0 border-right-0">토요일</td>
                                                <td class="border-bottom-0 border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSaturday" value="N" checked="" onclick="$('#eSBreakTime_6').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSaturday" value="Y" onclick="$('#eSBreakTime_6').show();"> 설정</label>

                                                    <span id="eSBreakTime_6" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker">요일별 휴게시간을 설정하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">휴무일</td>
                                    <td class="padding-0">
                                        <table style="width:100%;" id="eHoliday">
                                            <tbody>
                                            <tr>
                                                <td class=" border-left-0 border-top-0 border-bottom-0 border-right-0" colspan="2">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="holiday" value="0" checked="" onclick="fncHolidayChDisplay('0');"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="holiday" value="1" onclick="fncHolidayChDisplay('1');" checked> 설정</label>
                                                </td>
                                            </tr>
                                            <tr id="eHolidayTr" padding: 0 10px 0 50px; min-width:400px;  style="display: table-row;">
                                                <td class="width-100 border-left-0">정기휴무</td>
                                                <td class=" border-left-0" >
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="regularHoliday"  value="N"> 설정안함</label>
                                                    <label ><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="regularHoliday" value="Y" checked=""> 설정</label>
                                                    <label >
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="1" selected="">매월 첫째주</option><option value="2">매월 둘째주</option><option value="3">매월 셋째주</option><option value="4">매월 넷째주</option><option value="5">매월 다섯째주</option><option value="L">매월 마지막주</option><option value="A">매월 매주</option>									</select>
                                                    </label>
                                                    <label >
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="1" selected="">일요일</option><option value="2">월요일</option><option value="3">화요일</option><option value="4">수요일</option><option value="5">목요일</option><option value="6">금요일</option><option value="7">토요일</option><option value="A">모든요일</option>									</select>
                                                    </label>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eHolidayAdd" onclick="addHolidayRow(this);" value="추가">
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eHolidayDel" onclick="delHolidayRow(this);" value="삭제">                                               </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table id="eTmpHoliday" class="border-0">
                                            <tbody>
                                            <tr id="eTmpHolidayTr" padding: 0 10px 0 50px; min-width:400px;  style="display: table-row;">
                                                <td class="width-100 border-bottom-0 border-left-0 border-top-0">임시휴무</td>
                                                <td class="border-0">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="tempHoliday" value="N"> 설정안함</label>
                                                    <label ><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="tempHoliday" value="Y" checked=""> 설정</label>
                                                    <label>
                                                        <input type="text" class="form-control hasDatepicker" padding: 0 10px 0 50px; min-width:400px;  id="sSWorkDate_0" value="2021-03-12" readonly="">
                                                    </label>
                                                    <label >
                                                        <input type="text" class="form-control hasDatepicker" padding: 0 10px 0 50px; min-width:400px;  id="sEWorkDate_0" value="2021-03-12" readonly="">
                                                    </label>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eTmpHolidayAdd" onclick="addTmpHolidayRow(this);" value="추가">
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eTmpHolidayDel" onclick="delTmpHolidayRow(this);" value="삭제">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker">휴무일을 설정하세요.</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i>수정&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                            </div>
                        </div>
                    </div>--%>
                   <%-- <div class="tab-pane fade" id="default-tab-9">--%>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12">
                               <%-- <form class="multi_form_none" id="multi_form_none" method="post"  >
                                    <input type="hidden" name="masterChargeYn" value="" class="null_param">
                                    <input type="hidden" name="masterStoreNo" value="" class="null_param">
                                    <input type="hidden" name="masterGoodsYn" value="" class="null_param">
                                    <input type="hidden" name="multiType" value="">
                                    <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                </form>
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light width-200">가맹점 구분</td>
                                            <td>
                                                <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiTypeSelect" value="0" <c:if test="${tbStore.multiType.ordinal() == 0}">checked</c:if>> 사용안함</label>
                                                <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiTypeSelect" value="1" <c:if test="${tbStore.multiType.ordinal() == 1}">checked</c:if>> 종속</label>
                                                <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiTypeSelect" value="2" <c:if test="${tbStore.multiType.ordinal() == 2}">checked</c:if>> 마스터</label>
                                            </td>
                                        </tr>
                                            <tr class="multi_form_master_tr" style="display: <c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 1}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 2}">contents</c:if>">
                                                <td class="bg-light">가맹점 설정</td>
                                                <td class="padding-0">
                                                    <form class="multi_form_master" id="multi_form_master" method="post"  >
                                                        <table style="width:100%;" id="">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="width-150 border-top-0 border-left-0 border-bottom-0">종속가맹 상품 판매대행 </td></td>
                                                                    <td class="border-top-0 border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterGoodsYn" value="0" <c:if test="${tbStore.masterGoodsYn.ordinal() == 0}">checked</c:if>> 관리안함</label>
                                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterGoodsYn" value="1"  <c:if test="${tbStore.masterGoodsYn.ordinal() == 1}">checked</c:if>> 판매관리</label>
                                                                        <input type="hidden" name="masterChargeYn" class="null_param">
                                                                        <input type="hidden" name="masterStoreNo" class="null_param">
                                                                        <input type="hidden" name="multiType">
                                                                        <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </td>
                                                </form>
                                            </tr>
                                            <tr class="multi_form_slave_tr" style="display:<c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 2}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 1}">contents</c:if>">
                                                    <td class="bg-light">상품관리여부</td>
                                                    <td class="padding-0">
                                                        <form class="multi_form_slave" id="multi_form_slave" method="post" >
                                                            <table style="width:100%;" id="">
                                                                <tbody>
                                                                <tr>
                                                                    <td class="width-150 border-top-0 border-left-0 border-bottom-0">마스터 가맹점 선택</td></td>
                                                                    <td class="border-top-0 border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label>
                                                                            <select class="form-control masterStoreNo" name="masterStoreNo">
                                                                            </select>
                                                                        </label>
                                                                        <input type="hidden" name="masterGoodsYn" value="" class="null_param" >
                                                                        <input type="hidden" name="multiType">
                                                                        <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="width-150border-left-0 border-bottom-0">마스터가맹 정산방식</td></td>
                                                                    <td class="border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterChargeYn" value="0" <c:if test="${tbStore.masterChargeYn.ordinal() == 0}">checked</c:if>=""> 수동정산</label>
                                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterChargeYn" value="1"  <c:if test="${tbStore.masterChargeYn.ordinal() == 1}">checked</c:if>> 실시간정산</label>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </form>
                                                    </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </form>
                                <div class="m-l-5 m-t-5">
                                    <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                                    <button type="button" class="btn btn-primary btn_update_multi float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 멀티 가맹점 수정&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                                </div>--%>
                            </div>
                            <form id="searchSubmitForm" onsubmit="searchPlaces(); return false;" style="display: none;">
                                키워드 : <input type="text" value="${tbStore.poi}" id="keyword" size="15">
                                <button id="kakaoSearchBtn" type="submit">검색하기</button>
                            </form>
                           <%-- <div class="map_wrap">
                                <div id="drawingMap"></div>
                                <div id="map"></div>
                                <p class="modes">
                                    <button onclick="selectOverlay('MARKER')">마커</button>
                                    <button onclick="selectOverlay('POLYLINE')">선</button>
                                    <button onclick="selectOverlay('CIRCLE')">원</button>
                                    <button onclick="selectOverlay('RECTANGLE')">사각형</button>
                                    <button onclick="selectOverlay('POLYGON')">다각형</button>
                                </p>
                                <p class="getdata">
                                    <button onclick="getDataFromDrawingMap()">가져오기</button>
                                </p>
                            </div>--%>
                        <%--    <div class="col-xl-6 col-lg-6 height-400">
                                <div id="tipmap" class="height-full width-full"></div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<!-- #modal-message -->
<form id="user_modal" class="user_modal">
    <div class="modal modal-message fade" id="modal-message">
        <input type="hidden" name="headNo" value="${tbStore.head.headNo}">
        <input type="hidden" name="branchNo" value="${tbStore.branch.branchNo}">
        <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
        <input type="hidden" name="userType" value="UT_STORE">
        <div class="modal-dialog" style="
                    height: 50%;
                ">
            <div class="modal-content" style="
                    margin: auto;
                    margin-top: 200px;
                ">
                <div class="modal-header height-30 m-t-40" >
                    <h4 class="modal-title"><spring:message code="list.detail.userregistration" text="사용자 등록"/></h4>
                    <button type="button" class="insert_close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-condensed table-bordered">
                        <tbody>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.id" text="아이디"/></td>
                            <td><input type="text" class="form-control width-full userId" name="userId" value="" placeholder="<spring:message code="list.description.pleaseenteryourid" text="아이디를 입력해주세요"/>" maxlength="20"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourid" text="아이디를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.password" text="패스워드"/></td>
                            <td><input type="text" class="form-control width-full userPwd" name="userPwd" value="" placeholder="<spring:message code="list.description.pleaseenteryourpassword" text="패스워드를 입력해주세요"/>" maxlength="60"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourpassword" text="패스워드를 입력해주세요"/> </td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.username" text="사용자 이름"/></td>
                            <td><input type="text" class="form-control width-full name" name="name" value="" placeholder="<spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/>" maxlength="20"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></td>
                            <td><input type="text" class="form-control width-full phone" name="phone" value="" placeholder="<spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/>" maxlength="20" numberOnly="true"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                            <td><input type="text" class="form-control width-full memo" name="memo" value="" placeholder="<spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>" maxlength="200"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" class="btn btn-white" data-dismiss="modal"><spring:message code="list.detail.cancel" text="취소"/></a>
                    <a href="javascript:;" class="btn btn-primary modalUserSave"><spring:message code="list.detail.save" text="저장"/></a>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- #modal-message -->
<form id="user_update_modal" class="user_update_modal">
    <div class="modal modal-message-up fade" id="modal-message-up">
        <input type="hidden" name="headNo" value="${tbStore.head.headNo}">
        <input type="hidden" name="branchNo" value="${tbStore.branch.branchNo}">
        <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
        <input type="hidden" class="userNo upUserNo" name="userNo" value="">
        <input type="hidden" name="userType" value="UT_STORE">
        <div class="modal-dialog" style="
                    height: 50%;
                ">
            <div class="modal-content" style="
                    margin-top: 200px;
                    width: 120%;
                ">
                <div class="modal-header height-30 m-t-40" >
                    <h4 class="modal-title"><spring:message code="list.detail.useredit" text="사용자 수정"/></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-condensed table-bordered">
                        <tbody>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.id" text="아이디"/></td>
                            <td><input type="text" class="form-control width-full userId upUserId" name="" value="" placeholder="아이디를 입력해주세요" disabled>
                                <input type="hidden"class="upUserId" name="userId" value="">
                            </td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourid" text="아이디를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.newpassword" text="새 패스워드"/></td>
                            <td><input type="text" class="form-control width-full userPwd upUserPwd" name="userPwd" value="" placeholder="<spring:message code="list.detail.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/>" maxlength="60"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/> </td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.username" text="사용자 이름"/></td>
                            <td><input type="text" class="form-control width-full name upName" name="name" value="" placeholder="<spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/> " maxlength="20"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/> </td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></td>
                            <td><input type="text" class="form-control width-full phone upPhone" name="phone" value="" placeholder="<spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/>" maxlength="20"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/> </td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.status" text="상태"/></td>
                            <td>
                                <select class="form-control upDataStatus" name="dataStatus">
                                    <option value="1"><spring:message code="list.detail.normal" text="정상"/></option>
                                    <option value="2"><spring:message code="list.detail.stop" text="정지"/></option>
                                </select>
                            </td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                            <td><input type="text" class="form-control width-full memo upMemo" name="memo" value="" placeholder="<spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>" maxlength="200"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" class="btn btn-white" data-dismiss="modal"><spring:message code="list.detail.cancel" text="취소"/></a>
                    <a href="javascript:;" class="btn btn-primary modalUserUp"><spring:message code="list.detail.update" text="수정"/></a>
                </div>
            </div>
        </div>
    </div>
</form>

<%--modal listPay start--%>
<div class="modal fade" id="listPay_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="listPay.jsp" %>
</div>
<%--modal listPay end--%>

<%--modal listDeducted start--%>
<%--<div class="modal fade" id="listDeducted_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="listDeducted.jsp" %>
</div>
&lt;%&ndash;modal listDeducted end&ndash;%&gt;

&lt;%&ndash;modal listRequest start&ndash;%&gt;
<div class="modal fade" id="listRequest_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="listRequest.jsp" %>
</div>
&lt;%&ndash;modal listRequest end&ndash;%&gt;

&lt;%&ndash;modal add start&ndash;%&gt;
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="headSearch.jsp" %>
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
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
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
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c1a125dbfc0b31fb5f601512a4e58d0&libraries=services,drawing"></script>
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>

    $(document).on("click",".modalUserSave",function(){

        let registersussmsg = "<spring:message code="list.detail.registrationwassuccessful" text="등록에 성공하였습니다."/>";
        let registermsg = "<spring:message code="list.detail.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
        let registerfailmsg = "<spring:message code="list.detail.registrationfailed" text="등록에 실패하였습니다."/>";
        let duplemsg = "<spring:message code="list.detail.duplicateaccount" text="계정이 중복되었습니다."/>";
        let enrollment = "<spring:message code="list.detail.enrollment" text="등록"/>";
        let cancel = "<spring:message code="list.detail.cancel" text="취소"/>";
        let modalReq = convertFormToObj($('form.user_modal'));
        if (inputDataCheck3(modalReq)) {
            swal({
                title: registermsg,
                icon: "warning",
                buttons: [
                    cancel,
                    enrollment
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData = new FormData(document.getElementById('user_modal'));
                    formData.append("tbUserStaffData",  new Blob([JSON.stringify(modalReq)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: "${path}/api/userStaff/insert/action",
                        data: formData,
                        /*contentType: "application/json;",*/
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                alert(registersussmsg);
                                staffList();
                                $(".insert_close").click();
                            } else if (data.result == 500) {
                                alert(duplemsg);
                            } else  {
                                alert(registerfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    });


    $(document).on("click",".modalUserUp",function(){
        let updatesussmsg = "<spring:message code="list.detail.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let editfailed = "<spring:message code="list.detail.editfailed" text="수정에 실패하였습니다."/>";
        let updatemsg = "<spring:message code="list.detail.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let cancel = "<spring:message code="list.detail.cancel" text="취소"/>";
        let update = "<spring:message code="list.detail.update" text="수정"/>";
        let modalReq = convertFormToObj($('form.user_update_modal'));
        if (inputDataCheck2(modalReq)) {
            swal({
                title: updatemsg,
                icon: "warning",
                buttons: [
                    cancel,
                    update
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData = new FormData(document.getElementById('user_update_modal'));
                    formData.append("tbUserStaffData",  new Blob([JSON.stringify(modalReq)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: "${path}/api/userStaff/update/action",
                        data: formData,
                        /*contentType: "application/json;",*/
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                alert(updatesussmsg);
                                staffList();
                                $(".close").click();
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


    $(document).on("click",".update_staff",function(){


        let userId = $(this).attr("userId");
        let name = $(this).attr("name");
        let phone = $(this).attr("phone");
        let memo = $(this).attr("memo");
        let userNo = $(this).attr("staffNo");
        let dataStatus = $(this).attr("dataStatus");


        $(".upUserId").val(userId);
        $(".upName").val(name);
        $(".upPhone").val(phone);
        $(".upMemo").val(memo);
        $(".upUserNo").val(userNo);
        $(".upDataStatus").val(dataStatus).attr("selected","selected");
    });


    $(document).on("click","#addressSearchButton",function(){
        let searchTxt = $("#pac-input").val();
        $("#keyword").val(searchTxt);
        $("#searchSubmitForm").submit();

    });

    $(document).on("click","input[name='openStatus']",function(){
        let chkVal = $("input[name='openStatus']:checked").val();
        if(chkVal == 0){
            $(".open_form_master_tr").css("display","none");
        } else if(chkVal == 1){
            $(".open_form_master_tr").css("display","");
            $(".open_form_master_tr").css("display","");
        } else if(chkVal == 2){
            $(".open_form_master_tr").css("display","none");
            $(".open_form_master_tr").css("display","none");
        }
    });

    $(document).on("click","#placesList li",function(){
        $("input[name=poi]").val($(this).find(".placeName").text());
        $("#lat").val($(this).find(".lat").text());
        $("#lng").val($(this).find(".lng").text());


        let addressArray = $(this).find(".addressName").text().split(' ');

        $("#addr_1").val("");
        $("#addr_2").val("");
        $("#addr_3").val("");
        $("#addr_4").val("");
        for(var i = 0 ; i < addressArray.length ; i++){
            if(i > 5) {
                let addAddr = addressArray[i];
                $("#addr_4").val($("#addr_4").val() + addAddr);
            }else {
                $("#addr_"+(i+1)).val(addressArray[i]);
            }
        }
    });
    let lat = Number($("#lat").val());
    let lng = Number($("#lng").val());
    // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div

        mapOption = {
            center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };


    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    /*searchPlaces();*/

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(lat, lng);


    addMarker(markerPosition,0,null)

    var iwContent = '<div style="padding:5px;">${tbStore.poi}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(lat, lng), //인포윈도우 표시 위치입니다
        iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 인포윈도우를 생성하고 지도에 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        map: map, // 인포윈도우가 표시될 지도
        position : iwPosition,
        content : iwContent,
        removable : iwRemoveable
    });



    // 아래 코드는 인포윈도우를 지도에서 제거합니다
    // infowindow.close();
    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {
        let keywordmsg = "<spring:message code="list.detail.pleaseenterankeyword" text="키워드를 입력해주세요!"/>";
        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert(keywordmsg);
            return false;
        }

        infowindow.close();
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB);
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        let noresultmsg = "<spring:message code="list.detail.nosearchresultsfound" text="검색 결과가 존재하지 않습니다."/>";
        let errormsg = "<spring:message code="list.detail.erroroccurredinthesearchresults" text="검색 결과 중 오류가 발생하였습니다."/>";
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert(noresultmsg);
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert(errormsg);
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';
        itemStr += '  <span style="display:none;" class="lat">' + places.y  + '</span>' +
            '</div>';
        itemStr += '  <span style="display:none;" class="lng">' + places.x  + '</span>' +
            '</div>';
        itemStr += '  <span style="display:none;" class="placeName">' + places.place_name  + '</span>' +
            '</div>';
        itemStr += '  <span style="display:none;" class="addressName">' + places.address_name  + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage,
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }

    let tipMap;
    let marker;
    let drawingManager = null;
    $(() => {
        staffList();
        map.relayout();
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

        //가맹점 선택(멀티가맹점)
        let req = {
            multiType: "2"
        }
        let mastertStoreNoVal = "${tbStore.masterStoreNo}";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/store/list",
            data: JSON.stringify(req),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                $(".masterStoreNo").html("");
                for(var i = 0 ; i < data.searchStoreList.length ; i++){
                    let txt = "";
                    if (Number(mastertStoreNoVal) == Number(data.searchStoreList[i].storeNo)) {
                       txt = "<option value='"+data.searchStoreList[i].storeNo+"' selected>"+data.searchStoreList[i].storeName+"</option>"
                    } else {
                        txt = "<option value='"+data.searchStoreList[i].storeNo+"'>"+data.searchStoreList[i].storeName+"</option>"
                    }
                    $(".masterStoreNo").append(
                        txt
                    )
                }
            }
        });

        let firstCodeList = [];
        //최초 주문 카테고리 체크된 리스트
        $("input[class=chkCatCode]:checked").each(function() {
            var catCode = $(this).attr("catCode");
            var catLevel = $(this).attr("catLevel");
            firstCodeList.push({storeNo : "${tbStore.storeNo}", catCode : catCode , catLevel : catLevel ,parentCatCode : null, insertDate : null });
        });

        let url = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile1}");
        let url2 = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFileSmall}");
        $(".storeImg").attr("src",url);
        $(".storeImg2").attr("src",url2);

        /*initMap();*/
        /*initTipMap();*/
        /*initMap();*/

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
        let dlvyNo = "${tbStore.dlvyNo}";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/dlvy/list",
            data: JSON.stringify(dlvyReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/
                for(var i = 0 ; i < data.searchDlvyList.length ; i++){
                    if(dlvyNo == data.searchDlvyList[i].dlvyNo){
                        $(".searchDlvyList").append(
                            "<option value="+data.searchDlvyList[i].dlvyNo+" selected>"+data.searchDlvyList[i].dlvyName+"</option>"
                        )
                    } else {
                        $(".searchDlvyList").append(
                            "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                        )
                    }

                }
            }
        });

        $(".list_btn").click(function () {
            location.href = "${path}/workgroup/affilfranch/list";
        });
        $(document).on("click", ".btn_update", function () {
            // 체크 되어 있는 값 추출
            let codeList = [];
            let storeNo = "${tbStore.storeNo}";
            $("input[class=chkCatCode]:checked").each(function() {
                var catCode = $(this).attr("catCode");
                var catLevel = $(this).attr("catLevel");
                codeList.push({storeNo : storeNo, catCode : catCode , catLevel : catLevel ,parentCatCode : null, insertDate : null });
            });

            var deleteList = firstCodeList.filter(function(each1) {
                return codeList.every(function(each2){
                    return each1.catCode != each2.catCode;
                });
            });

            let multiType = $("input[name='multiType']:checked").val();
            let masterGoodsYn = $("input[name='masterGoodsYnChk']:checked").val();
            let masterChargeYn = $("input[name='masterChargeYnChk']:checked").val();
            let masterStoreNo =  $(".masterStoreNo").val();

            if(multiType == 0){
                $("input[name='masterGoodsYn']").val(0);
                $("input[name='masterChargeYn']").val(0);
                $("input[name='masterStoreNo']").val(null);
            } else if(multiType == 1){

                $("input[name='masterGoodsYn']").val(0);
                $("input[name='masterChargeYn']").val(masterChargeYn);
                $("input[name='masterStoreNo']").val(masterStoreNo);
            } else if(multiType == 2){

                $("input[name='masterGoodsYn']").val(masterGoodsYn);
                $("input[name='masterChargeYn']").val(0);
                $("input[name='masterStoreNo']").val(0);
            }
         /*   let multiType = $("input[name='multiTypeSelect']:checked").val();
            $("input[name=multiType]").val(multiType);*/
            let url = "${path}/api/affilfranch/update/action";
            let _forms = $('.update_form, .update_form5');
            let _forms2 = $('.update_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);

            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            let cancelmsg = "<spring:message code="list.script.cancel" text="취소"/>";
            let updatconfirm = "<spring:message code="list.script.update" text="수정"/>";

            if (inputDataCheck(req)) {
                swal({
                    title: updatemsg,
                    icon: "warning",
                    buttons: [
                        cancelmsg,
                        updatconfirm
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbStoreData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbBusinessInfoData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                        formData.append("tbStoreCategoryFo",  new Blob([JSON.stringify(codeList)], {type:"application/json"}));
                        formData.append("deleteList",  new Blob([JSON.stringify(deleteList)], {type:"application/json"}));
                        /*formData.append("imgFile1",_forms.find('#imgFile1')[0]);*/
                        formData.append("imgFile1", $("#imgFile1")[0].files[0]);
                        /*formData.append("imgFileSmall",_forms.find('#imgFileSmall')[0]);*/
                        formData.append("imgFileSmall", $("#imgFileSmall")[0].files[0]);
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

        $(".date").datepicker({
            altFieid: ".startDate",
            altFormat: "yyyy-mm-dd",
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        //사업자등록증
        $(document).on("change", "#saupja", function (e) {
            e.preventDefault();

            var result = chk_file_type(this);

            let file = $("#saupja")[0].files[0],
                reader = new FileReader();
            reader.readAsDataURL(file);
            let filename;
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                filename = file.name;
            } else {
                // old IE
                filename = $("#saupja").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName1').text(filename);

            return false;
        });


        //참고이미지
        $(document).on("change", "#image", function (e) {
            e.preventDefault();

            var result = chk_file_type(this);

            let file = $("#image")[0].files[0],
                reader = new FileReader();
            reader.readAsDataURL(file);
            let filename;
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                filename = file.name;
            } else {
                // old IE
                filename = $("#image").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName2').text(filename);

            return false;
        });

        //온라인플랫폼이미지
        $(document).on("change", "#imgFile1", function (e) {
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";
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
            $('.onlinePlatFormFileName').text(imagetochange + " :" + filename);
            $('.onlinePlatFormFileSize').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });

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
                var filename = $("#imgFileSmall").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName2').text(imagetochange +" :" + filename);
            $('.onlinePlatFormFileSize2').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });

        /*$(".drawing-btn").click(function () {
            showDrawingManager();
            $(".drawing-btn").css('display', 'none');
            $(".drawing-hide-btn").css('display', 'inline');
        });*/
      /*  $(".drawing-hide-btn").click(function () {
            hideDrawingManager();
            $(".drawing-btn").css('display', 'inline');
            $(".drawing-hide-btn").css('display', 'none');
        });*/

        /*$(".btn-draw").click(function () {
            showDrawingManager();
            $(".btn-draw").addClass("d-none");
            $(".btn-draw-hide").removeClass("d-none");
        });

        $(".btn-draw-hide").click(function () {
            hideDrawingManager();
            $(".btn-draw-hide").addClass("d-none");
            $(".btn-draw").removeClass("d-none");
        });*/


    });
    $(document).on("click","input[name='multiType']",function(){
        let chkVal = $("input[name='multiType']:checked").val();
        if(chkVal == 0){
            $(".multi_form_master_tr").css("display","none");
            $(".multi_form_slave_tr").css("display","none");
        } else if(chkVal == 1){
            $(".multi_form_master_tr").css("display","none");
            $(".multi_form_slave_tr").css("display","");
        } else if(chkVal == 2){
            $(".multi_form_master_tr").css("display","");
            $(".multi_form_slave_tr").css("display","none");
        }
    });


    function fncWorkDayChDisplay(selDay) {
        if(selDay == 1) {
            $("#eWorkDay_0").css("display","table-row");
            $("#eWorkDay_1").css("display","none");
            $("#eWorkDay_2").css("display","none");
            $("#eWorkDay_3").css("display","none");
        } else if(selDay == 2) {
            $("#eWorkDay_0").css("display","none");
            $("#eWorkDay_1").css("display","table-row");
            $("#eWorkDay_2").css("display","table-row");
            $("#eWorkDay_3").css("display","table-row");
        }
    }

    function fncBreakTimeChDisplay(selDay) {
        if(selDay == 0) {
            $("#eBreakTime_1").css("display","none");
            $("#eBreakTime_2").css("display","none");
            $("#eBreakTime_3").css("display","none");
            $("#eBreakTime_4").css("display","none");
            $("#eBreakTime_5").css("display","none");
            $("#eBreakTime_6").css("display","none");
            $("#eBreakTime_7").css("display","none");
        } else if(selDay == 1) {
            $("#eBreakTime_1").css("display","table-row");
            $("#eBreakTime_2").css("display","table-row");
            $("#eBreakTime_3").css("display","table-row");
            $("#eBreakTime_4").css("display","table-row");
            $("#eBreakTime_5").css("display","table-row");
            $("#eBreakTime_6").css("display","table-row");
            $("#eBreakTime_7").css("display","table-row");
        }
    }

    function fncHolidayChDisplay(selDay) {
        if(selDay == 0) {
            $("#eHolidayTr").css("display","none");
            $("#eTmpHoliday").css("display","none");
        } else if(selDay == 1) {
            $("#eHolidayTr").css("display","table-row");
            $("#eTmpHoliday").css("display","table-row");
        }
    }

    // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places and predicted search terms.
    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">





   /*  function initTipMap() {

       });
   }*/

    /*// Drawing Manager로 도형을 그릴 지도 div
    var drawingMapContainer = document.getElementById('drawingMap'),
        drawingMap = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap);

    var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
        map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
        drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
            kakao.maps.drawing.OverlayType.MARKER,
            kakao.maps.drawing.OverlayType.POLYLINE,
            kakao.maps.drawing.OverlayType.RECTANGLE,
            kakao.maps.drawing.OverlayType.CIRCLE,
            kakao.maps.drawing.OverlayType.POLYGON
        ],
        // 사용자에게 제공할 그리기 가이드 툴팁입니다
        // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
        guideTooltip: ['draw', 'drag', 'edit'],
        markerOptions: { // 마커 옵션입니다
            draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다
            removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다
        },
        polylineOptions: { // 선 옵션입니다
            draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
            removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
            editable: true, // 그린 후 수정할 수 있도록 설정합니다
            strokeColor: '#39f', // 선 색
            hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
            hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
        },
        rectangleOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f', // 외곽선 색
            fillColor: '#39f', // 채우기 색
            fillOpacity: 0.5 // 채우기색 투명도
        },
        circleOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f',
            fillColor: '#39f',
            fillOpacity: 0.5
        },
        polygonOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f',
            fillColor: '#39f',
            fillOpacity: 0.5,
            hintStrokeStyle: 'dash',
            hintStrokeOpacity: 0.5
        }
    };

    // 위에 작성한 옵션으로 Drawing Manager를 생성합니다
    var manager = new kakao.maps.drawing.DrawingManager(options);

    // 버튼 클릭 시 호출되는 핸들러 입니다
    function selectOverlay(type) {
        undo();
        // 그리기 중이면 그리기를 취소합니다
        manager.cancel();

        // 클릭한 그리기 요소 타입을 선택합니다
        manager.select(kakao.maps.drawing.OverlayType[type]);
    }*/

  /*  // Drawing Manager에서 데이터를 가져와 도형을 표시할 아래쪽 지도 div
    var mapContainer = document.getElementById('dmap'),
        mapOptions = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도 div와 지도 옵션으로 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOptions),
        overlays = []; // 지도에 그려진 도형을 담을 배열

    // 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
    // Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
    function getDataFromDrawingMap() {
        // Drawing Manager에서 그려진 데이터 정보를 가져옵니다
        var data = manager.getData();

        // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
        removeOverlays();

        // 지도에 가져온 데이터로 도형들을 그립니다
        drawMarker(data[kakao.maps.drawing.OverlayType.MARKER]);
        drawPolyline(data[kakao.maps.drawing.OverlayType.POLYLINE]);
        drawRectangle(data[kakao.maps.drawing.OverlayType.RECTANGLE]);
        drawCircle(data[kakao.maps.drawing.OverlayType.CIRCLE]);
        drawPolygon(data[kakao.maps.drawing.OverlayType.POLYGON]);
    }*/

    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
    /*function removeOverlays() {
        var len = overlays.length, i = 0;

        for (; i < len; i++) {
            overlays[i].setMap(null);
        }

        overlays = [];
    }

    // Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
    function drawMarker(markers) {
        var len = markers.length, i = 0;

        for (; i < len; i++) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(markers[i].y, markers[i].x),
                zIndex: markers[i].zIndex
            });

            overlays.push(marker);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
    function drawPolyline(lines) {
        var len = lines.length, i = 0;

        for (; i < len; i++) {
            var path = pointsToPath(lines[i].points);
            var style = lines[i].options;
            var polyline = new kakao.maps.Polyline({
                map: map,
                path: path,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight
            });

            overlays.push(polyline);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 사각형을 아래 지도에 표시하는 함수입니다
    function drawRectangle(rects) {
        var len = rects.length, i = 0;

        for (; i < len; i++) {
            var style = rects[i].options;
            var rect = new kakao.maps.Rectangle({
                map: map,
                bounds: new kakao.maps.LatLngBounds(
                    new kakao.maps.LatLng(rects[i].sPoint.y, rects[i].sPoint.x),
                    new kakao.maps.LatLng(rects[i].ePoint.y, rects[i].ePoint.x)
                ),
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(rect);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 원을 아래 지도에 표시하는 함수입니다
    function drawCircle(circles) {
        var len = circles.length, i = 0;

        for (; i < len; i++) {
            var style = circles[i].options;
            var circle = new kakao.maps.Circle({
                map: map,
                center: new kakao.maps.LatLng(circles[i].center.y, circles[i].center.x),
                radius: circles[i].radius,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(circle);
        }
    }

    // Drawing Manager에서 가져온 데이터 중 다각형을 아래 지도에 표시하는 함수입니다
    function drawPolygon(polygons) {
        var len = polygons.length, i = 0;

        for (; i < len; i++) {
            var path = pointsToPath(polygons[i].points);
            var style = polygons[i].options;
            var polygon = new kakao.maps.Polygon({
                map: map,
                path: path,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(polygon);
        }
    }

    // Drawing Manager에서 가져온 데이터 중
    // 선과 다각형의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다
    function pointsToPath(points) {
        var len = points.length,
            path = [],
            i = 0;

        for (; i < len; i++) {
            var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
            path.push(latlng);
        }

        return path;
    }*/




    function inputDataCheck(args) {
        let storemsg = "<spring:message code="list.script.pleaseenterthestorename" text="가맹점명을 입력해주세요."/>";
        let storephonemsg = "<spring:message code="list.script.merchantphonenumbermsg" text="가맹점전화번호를 입력해주세요."/>";
        let storeheadquartermsg = "<spring:message code="list.script.registeredaffiliateheadquartersmsg" text="고객앱 가맹점명을 입력해주세요."/>";
        if (isNull(args.storeName)) {
            return alert_focus("storeName",storemsg);
        } else if (isNull(args.storeTel)) {
            return alert_focus("storeTel", storephonemsg);
        } else if (isNull(args.storeNameInapp)) {
            return alert_focus("storeNameInapp", storeheadquartermsg);
        }
        return true;
    }

    function inputDataCheck2(args) {
        let inputyounameplease = "<spring:message code="list.script.inputyounameplease" text="이름을 입력해주세요"/>";
        let inputyouphonenum = "<spring:message code="list.script.inputyourphonenumberplease" text="전화번호를 입력해주세요."/>";
        if (isNull(args.name)) {
            return alert_focus("name", inputyounameplease);
        } else if (isNull(args.phone)) {
            return alert_focus("phone", inputyouphonenum);
        }
        return true;
    }

    function inputDataCheck3(args) {
        let inputyouidplease = "<spring:message code="list.script.Inputyouridplease" text="아이디을 입력해주세요"/>";
        let inputyounameplease = "<spring:message code="list.script.inputyounameplease" text="이름을 입력해주세요"/>";
        let inputyouphonenum = "<spring:message code="list.script.inputyourphonenumberplease" text="전화번호를 입력해주세요"/>";
        if (isNull(args.userId)) {
            return alert_focus("userId", inputyouidplease);
        } else if (isNull(args.name)) {
            return alert_focus("name", inputyounameplease);
        } else if (isNull(args.phone)) {
            return alert_focus("phone", inputyouphonenum);
        }
        return true;
    }

    function undo() {
        // 그리기 요소를 이전 상태로 되돌립니다
        manager.undo();
    }

    function insBlock() {
        $.ajax({
            type: "POST",
            url: "${path}/api/dlvy/insBlock",
            data: JSON.stringify(dlvyReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                undo()
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/
                for(var i = 0 ; i < data.searchDlvyList.length ; i++){
                    if(dlvyNo == data.searchDlvyList[i].dlvyNo){
                        $(".searchDlvyList").append(
                            "<option value="+data.searchDlvyList[i].dlvyNo+" selected>"+data.searchDlvyList[i].dlvyName+"</option>"
                        )
                    } else {
                        $(".searchDlvyList").append(
                            "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                        )
                    }

                }
            }
        });
    }

    function staffList() {
        let headNo = "${tbStore.head.headNo}";
        let branchNo = "${tbStore.branch.branchNo}";
        let storeNo =  "${tbStore.storeNo}";
        let userType = 3;

        let thereisnoregisteredid = "<spring:message code="list.script.thereisnoregisteredid" text="등록된 아이디가 없습니다."/>";
        let normalmsg = "<spring:message code="list.script.normal" text="정상"/>";
        let stopmsg = "<spring:message code="list.script.stop" text="정지"/>";
        let userupdate = "<spring:message code="list.script.userupdate" text="사용자 수정"/>";

        $.ajax({
            type: "GET",
            url: "${path}/api/userStaff/list",
            data: {
                headNo : headNo,
                branchNo : branchNo,
                storeNo : storeNo,
                userType : userType
            },
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                $("#tbUserStaffBody").html("");
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/

                if(data.userStaffList.length == 0) {
                    $("#tbUserStaffBody").append(
                        "<tr><td colspan='7'>"+thereisnoregisteredid+"</td></tr>"
                    )
                } else {
                    for(var i = 0 ; i < data.userStaffList.length ; i++){
                        let dataStatus = "";
                        if(data.userStaffList[i].dataStatus == 1) {
                            dataStatus = normalmsg;
                        } else if(data.userStaffList[i].dataStatus == 2){
                            dataStatus = stopmsg;
                        }

                        $("#tbUserStaffBody").append(
                            "<tr staffNo="+data.userStaffList[i].staffNo+" >" +
                            "   <td class=\"p-0\">"+(i+1)+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].userId+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].name+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].phone+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].memo+"</td>" +
                            "   <td class=\"p-0\">"+dataStatus+"</td>" +
                            "   <td class=\"p-0\"><a href=\"#modal-message-up\" class=\"btn btn-sm btn-primary update_staff\" " +
                            "data-toggle=\"modal\" userId="+data.userStaffList[i].userId+" name="+data.userStaffList[i].name+" phone="+data.userStaffList[i].phone+" dataStatus="+data.userStaffList[i].dataStatus+" memo="+data.userStaffList[i].memo+" staffNo="+data.userStaffList[i].staffNo+"" +
                            " >"+userupdate+"</a></td>" +
                            "</tr>"
                        )
                    }
                }
            }
        });
    }

    $(document).on("click",".mapRefreshBtn",function(){
        map.relayout();
    });

    $(document).on("click",".nav-link",function(){
        map.relayout();
    });

    // 메뉴가 선택되어 active가 된 후 이벤트
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        e.target // 현재 설정된 tab
        e.relatedTarget // 이전에 설정된 탭
        map.relayout();
    });

    function chk_file_type(obj) {

        var file_kind = obj.value.lastIndexOf('.');
        var file_name = obj.value.substring(file_kind+1,obj.length);
        var file_type = file_name.toLowerCase();
        var check_file_type = new Array();

        let imgfilemsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="이미지 파일만 업로드 가능합니다."/>";
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
