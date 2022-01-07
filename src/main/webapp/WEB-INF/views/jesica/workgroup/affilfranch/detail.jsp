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
                  <%--  <li class="nav-item">
                        <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.onlineplatformsettings" text="온라인 플랫폼 설정"/>&lt;%&ndash;<spring:message code="merchandise.detail.tab3" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품 그룹&ndash;%&gt;</span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.onlineplatformsettings" text="온라인 플랫폼 설정"/>&lt;%&ndash;<spring:message code="merchandise.detail.tab3" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                        </a>
                    </li>--%>
                    <li class="nav-item">
                        <a href="#default-tab-6" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.user" text="사용자"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.user" text="사용자"/></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#default-tab-7" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.user1" text="가맹점 수수료"/></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.user1" text="가맹점 수수료"/></span>
                        </a>
                    </li>
                     <li class="nav-item">
                          <a href="#default-tab-8"  data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="요금설정"/></span>
                              <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="요금설정"/></span>
                          </a>
                      </li>
                     <li class="nav-item">
                          <a href="#default-tab-9"  data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="거리구간요금"/></span>
                              <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="거리구간요금"/></span>
                          </a>
                      </li>
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
                                            <input type="radio" name="serviceType" value="RENTCAR"
                                                   class="align-bottom serviceType"
                                                   <c:if test="${tbStore.serviceType == 'RENTCAR'}">checked</c:if>> <spring:message
                                                code="list.detail.1" text="렌터카"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="serviceType" value="CONSIGNMENT"
                                                   class="align-bottom serviceType"
                                                   <c:if test="${tbStore.serviceType == 'CONSIGNMENT'}">checked</c:if>> <spring:message
                                                code="list.detail.1" text="탁송"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="serviceType" value="RESTAURANT"
                                                   class="align-bottom serviceType"
                                                   <c:if test="${tbStore.serviceType == 'RESTAURANT'}">checked</c:if>> <spring:message
                                                code="list.detail.1" text="맛집"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="serviceType" value="MART"
                                                   class="align-bottom serviceType"
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
                                    <td><input type="text" class="form-control width-200 storeTel" name="storeTel"
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
                                    <td><input type="text" class="form-control width-200 authTel" name="authTel"
                                               value="${tbStore.authTel}"  maxlength="20" numberOnly></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthemobilephonenumbertobeusedforauthentication" text="인증시 사용할 휴대전화번호를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.salesrepresentativename" text="영업담당자 이름"/></td>
                                    <td><input type="text" class="form-control width-200 mngrName" name="mngrName"
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
                                                            </selectㅇ
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
                    <div class="tab-pane fade" id="default-tab-5">
                        <div class="table-responsive">
                            <form class="update_form5" id="update_form5" method="post">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%"><spring:message code="list.detail.merchantdisplayname" text="가맹점 표시명"/></td>
                                    <td style="width:60%"><input type="text" class="form-control width-200 storeNameInapp" name="storeNameInapp" value="${tbStore.storeNameInapp}" maxlength="30"></td>
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
                            </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="default-tab-6">
                            <form class="update_form6" id="update_form6" method="post">
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
                    <div class="tab-pane fade" id="default-tab-7">
                        <form class="update_form7" id="update_form7" method="post">
                            <div class="table-responsive" style="overflow: hidden;">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="선결제 수수료"/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="주문건당"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <input type="text"  class="form-control width-200 pgCharge" name="pgCharge" value="${tbStoreCharge.pgCharge}" numberCommaOnly>
                                            <select name="pgRateType" class="form-control width-60">
                                                <option value="1"<c:if test="${tbStoreCharge.pgRateType == 1}" >selected</c:if>>원</option>
                                                <option value="2"<c:if test="${tbStoreCharge.pgRateType == 2}" >selected</c:if>>%</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="선결제 수수료를 입력해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="4"><spring:message code="list.detail.accountholder1" text="주문중개 수수료"/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="인수대행 "/></td>
                                        <td >
                                            <select name="takeoverUseYn" class="form-control width-100">
                                                <option value="1"<c:if test="${tbStoreCharge.takeoverUseYn == 1}" >selected</c:if>>사용</option>
                                                <option value="0"<c:if test="${tbStoreCharge.takeoverUseYn == 0}" >selected</c:if>>미사용</option>
                                            </select>
                                        </td>
                                        <td class="border-right-0">
                                            <input type="text"  class="form-control width-200 takeoverCharge" name="takeoverCharge" value="${tbStoreCharge.takeoverCharge}" numberCommaOnly>
                                            <select name="takeoverRateType" class="form-control width-60">
                                                <option value="1"<c:if test="${tbStoreCharge.takeoverRateType == 1}" >selected</c:if>>원</option>
                                                <option value="2"<c:if test="${tbStoreCharge.takeoverRateType == 2}" >selected</c:if>>%</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="인수대행 선결제 수수료를 입력해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="반납대행 "/></td>
                                        <td >
                                            <select name="returnUseYn" class="form-control width-100">
                                                <option value="1"<c:if test="${tbStoreCharge.returnUseYn == 1}" >selected</c:if>>사용</option>
                                                <option value="0"<c:if test="${tbStoreCharge.returnUseYn == 0}" >selected</c:if>>미사용</option>
                                            </select>
                                        </td>
                                        <td class="border-right-0">
                                            <input type="text"  class="form-control width-200 returnCharge" name="returnCharge" value="${tbStoreCharge.returnCharge}" numberCommaOnly>
                                            <select name="returnRateType" class="form-control width-60">
                                                <option value="1"<c:if test="${tbStoreCharge.returnRateType == 1}" >selected</c:if>>원</option>
                                                <option value="2"<c:if test="${tbStoreCharge.returnRateType == 2}" >selected</c:if>>%</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="반납대행 선결제 수수료를 입력해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="마이카 "/></td>
                                        <td >
                                            <select name="mycarUseYn" class="form-control width-100">
                                                <option value="1"<c:if test="${tbStoreCharge.mycarUseYn == 1}" >selected</c:if>>사용</option>
                                                <option value="0"<c:if test="${tbStoreCharge.mycarUseYn == 0}" >selected</c:if>>미사용</option>
                                            </select>
                                        </td>
                                        <td class="border-right-0">
                                            <input type="text"  class="form-control width-200 mycarCharge" name="mycarCharge" value="${tbStoreCharge.mycarCharge}" numberCommaOnly>
                                            <select name="mycarRateType" class="form-control width-60">
                                                <option value="1"<c:if test="${tbStoreCharge.mycarRateType == 1}" >selected</c:if>>원</option>
                                                <option value="2"<c:if test="${tbStoreCharge.mycarRateType == 2}" >selected</c:if>>%</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="마이카 선결제 수수료를 입력해주세요."/></td>
                                    </tr>
                                    <tr>
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="올레길탁송 "/></td>
                                    <td >
                                        <select name="olleUseYn" class="form-control width-100">
                                            <option value="1"<c:if test="${tbStoreCharge.olleUseYn == 1}" >selected</c:if>>사용</option>
                                            <option value="0"<c:if test="${tbStoreCharge.olleUseYn == 0}" >selected</c:if>>미사용</option>
                                        </select>
                                    </td>
                                    <td class="border-right-0">
                                        <input type="text"  class="form-control width-200 olleCharge" name="olleCharge" value="${tbStoreCharge.olleCharge}" numberCommaOnly>
                                        <select name="olleRateType" class="form-control width-60">
                                            <option value="1"<c:if test="${tbStoreCharge.olleRateType == 1}" >selected</c:if>>원</option>
                                            <option value="2"<c:if test="${tbStoreCharge.olleRateType == 2}" >selected</c:if>>%</option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="올레길탁송 선결제 수수료를 입력해주세요."/></td>
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
                    <div class="tab-pane fade" id="default-tab-8">
                        <form class="update_form8" id="update_form8" method="post">
                            <div class="table-responsive" style="overflow: hidden;">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light height-50 "  colspan="2"><spring:message code="list.detail.accountholder1" text="설정값"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <label class="">
                                                <input type="radio" name="useYn" class="align-bottom m-r-10 useYn" value="0" <c:if test="${tbStorePrice.useYn == 0}" >checked</c:if>>총판설정 사용
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="useYn" class="align-bottom m-r-10 useYn" value="1" <c:if test="${tbStorePrice.useYn == 1}" >checked</c:if>>가맹점설정 사용
                                            </label>

                                           <%-- <select name="useYn" class="form-control width-150">
                                                <option value="0"<c:if test="${tbStorePrice.useYn == 0}" >selected</c:if>>총판설정 사용</option>
                                                <option value="1"<c:if test="${tbStorePrice.useYn == 1}" >selected</c:if>>가맹점설정 사용</option>
                                            </select>--%>
                                        </td>
                                        <td class="text-danger-darker   " style="width: 232px;"><spring:message code="list.description.cannotbemodified" text="가맹점설정 유형을 선택해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>" >
                                        <td class="bg-light height-50 width-60" colspan="2"><spring:message code="list.detail.accountholder1" text="적용할 요금제"/></td>
                                        <td colspan="2">
                                            <label class="">
                                                <input type="radio" name="meterUseYn" class="align-bottom m-r-10 meterUseYn" value="1" <c:if test="${tbStorePrice.meterUseYn == 1}" >checked</c:if>>기본(미터)요금 사용
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="meterUseYn" class="align-bottom m-r-10 meterUseYn" value="0" <c:if test="${tbStorePrice.meterUseYn == 0}" >checked</c:if>>거리구간요금 사용
                                            </label>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="거리구간 요금 유형을 선택해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="주문요금"/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="기본요금"/></td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 meterPrice" name="meterPrice" value="${tbStorePrice.meterPrice}" numberCommaOnly> 원
                                        </td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 meterBaseDistance" name="meterBaseDistance" value="${tbStorePrice.meterBaseDistance}" numberCommaOnly>  (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="기본요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="추가요금"/></td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 meterAddition" name="meterAddition" value="${tbStorePrice.meterAddition}" numberCommaOnly>  원
                                        </td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 meterAddDistance" name="meterAddDistance" value="${tbStorePrice.meterAddDistance}" numberCommaOnly> (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="추가요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="최대요금"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <input type="text"  class="form-control width-200 meterMaximum" name="meterMaximum" value="${tbStorePrice.meterMaximum}" numberCommaOnly>  원
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="최대요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="배송요금"/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="기본요금"/></td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 dlvyPrice" name="dlvyPrice" value="${tbStorePrice.dlvyPrice}" numberCommaOnly>  원
                                        </td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 dlvyBaseDistance" name="dlvyBaseDistance" value="${tbStorePrice.dlvyBaseDistance}" numberCommaOnly> (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="기본요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="추가요금"/></td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 dlvyAddition" name="dlvyAddition" value="${tbStorePrice.dlvyAddition}" numberCommaOnly>  원
                                        </td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 dlvyAddDistance" name="dlvyAddDistance" value="${tbStorePrice.dlvyAddDistance}" numberCommaOnly> (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="추가요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="최대요금"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <input type="text"  class="form-control width-200 dlvyMaximum" name="dlvyMaximum" value="${tbStorePrice.dlvyMaximum}" numberCommaOnly> 원
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="최대요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="8"><spring:message code="list.detail.accountholder1" text="할증요금 "/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="요일할증 "/></td>
                                        <td colspan="2">
                                            <select name="dayChargeYn" class="form-control width-100">
                                                <option value="0"<c:if test="${tbStorePrice.dayChargeYn == 0}" >selected</c:if>>사용안함</option>
                                                <option value="1"<c:if test="${tbStorePrice.dayChargeYn == 1}" >selected</c:if>>사용</option>
                                            </select>
                                            <input type="text"  class="form-control width-120 dayCharge" name="dayCharge" value="${tbStorePrice.dayCharge}" numberCommaOnly> 원
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="요일할증 정보를 입력해주세요"/></td>
                                    </tr>
                                   <%-- <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="요일할증 금액"/></td>
                                        <td class="border-right-0">
                                            <input type="text"  class="form-control width-200 dayCharge" name="dayCharge" value="${tbStorePrice.dayCharge}" numberCommaOnly> 원
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="반납대행 선결제 수수료를 입력해주세요."/></td>
                                    </tr>--%>
                                   <%-- <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="눈비할증 금액"/></td>

                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="눈비할증 금액을 입력해주세요."/></td>
                                    </tr>--%>

                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.accountholder1" text="시간할증 "/></td>
                                        <td colspan="1">
                                            <select name="timeChargeYn" class="form-control width-100">
                                                <option value="0"<c:if test="${tbStorePrice.timeChargeYn == 0}" >selected</c:if>>사용안함</option>
                                                <option value="1"<c:if test="${tbStorePrice.timeChargeYn == 1}" >selected</c:if>>할증사용</option>
                                            </select>
                                            <input type="text"  class="form-control width-120 timeCharge" name="timeCharge" value="${tbStorePrice.timeCharge}" numberCommaOnly> 원
                                        </td>
                                        <td>
                                            시작시간 : <input type="text" name="timeStart" class="timeStart form-control" value="${tbStorePrice.timeStart}" maxlength="4" numberOnly> ~
                                            종료시간 : <input type="text" name="timeEnd" class="timeEnd form-control" value="${tbStorePrice.timeEnd}" maxlength="4" numberOnly>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증정보를 입력해주세요"/></td>
                                    </tr>
                                   <%-- <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="시간할증 금액"/></td>

                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증금액을 입력해주세요."/></td>
                                    </tr>--%>
                                    <%--<tr>
                                        <td class="border-right-0" colspan="2">

                                           &lt;%&ndash; <label>
                                                <select class="form-control">
                                                    <c:forEach begin="0" end="24" varStatus="hour">
                                                        <c:if test="${hour.index.length < 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart == '0'+hour.index}">>selected</c:if>> 0${hour.index} </option>
                                                        </c:if>
                                                        <c:if test="${hour.index.length >= 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart ==  hour.index}">>selected</c:if>> ${hour.index} </option>
                                                        </c:if>
                                                        ${hour.index}
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control">
                                                    <c:forEach begin="0" end="24" varStatus="hour">
                                                        <c:if test="${hour.index.length < 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart == '0'+hour.index}">>selected</c:if>> 0${hour.index} </option>
                                                        </c:if>
                                                        <c:if test="${hour.index.length >= 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart ==  hour.index}">>selected</c:if>> ${hour.index} </option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </label>&ndash;%&gt;
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증 시작/종료시간을 입력해주세요."/></td>
                                        </tr>--%>
                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="2"><spring:message code="list.detail.accountholder1" text="눈비할증"/></td>
                                        <td colspan="1" rowspan="2">
                                            <select name="weatherChargeYn" class="form-control width-100">
                                                <option value="0"<c:if test="${tbStorePrice.weatherChargeYn == 0}" >selected</c:if>>사용안함</option>
                                                <option value="1"<c:if test="${tbStorePrice.weatherChargeYn == 1}" >selected</c:if>>사용</option>
                                            </select>
                                            <input type="text"  class="form-control width-120 weatherCharge" name="weatherCharge" value="${tbStorePrice.weatherCharge}" numberCommaOnly> 원
                                        </td>
                                        <td>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="월" <c:if test="${fn:contains(tbStorePrice.dayFilter, '월')}">checked</c:if>>월</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="화" <c:if test="${fn:contains(tbStorePrice.dayFilter, '화')}">checked</c:if>>화</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="수" <c:if test="${fn:contains(tbStorePrice.dayFilter, '수')}">checked</c:if>>수</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="목" <c:if test="${fn:contains(tbStorePrice.dayFilter, '목')}">checked</c:if>>목</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="금" <c:if test="${fn:contains(tbStorePrice.dayFilter, '금')}">checked</c:if>>금</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="토" <c:if test="${fn:contains(tbStorePrice.dayFilter, '토')}">checked</c:if>>토</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="일" <c:if test="${fn:contains(tbStorePrice.dayFilter, '일')}">checked</c:if>>일</label>
                                            <input type="hidden" name="dayFilter" class="dayFilter" value="${tbStorePrice.dayFilter}">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="눈비할증 정보를 입력해주세요"/></td>
                                    </tr>
                                   <%-- <tr>
                                       &lt;%&ndash; <td class="bg-light height-50" ><spring:message code="list.detail.accountholder1" text="적용요일"/></td>&ndash;%&gt;

                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="적용요일을 선택해주세요."/></td>
                                    </tr>--%>
                                      <%--  <tr>
                                            <td class="bg-light"><spring:message code="list.detail.accountholder1" text="시간할증 종료시간"/></td>
                                            <td class="border-right-0">
                                                <label>
                                                    <select class="form-control">
                                                        <c:forEach begin="0" end="24" varStatus="hour">
                                                            <option>${hour.index}시(시작)</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                                <label>
                                                    <select class="form-control">
                                                        <c:forEach begin="0" end="24" varStatus="hour">
                                                            <option>${hour.index}시(종료)</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증 종료시간을 선택해주세요."/></td>
                                        </tr>--%>
                                    </tbody>
                                </table>
                                <div class="m-t-10">
                                    <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                    <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="default-tab-9">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12">
                                <form class="insert_form_dlvy_price" id="insert_form_dlvy_price">
                                    <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                    <input type="hidden" class="groupNo" name="groupNo" value="${tbStore.storeNo}">
                                    <input type="hidden" class="dataStatus" name="dataStatus" value="1">
                                    <table class="table table-bordered">
                                        <caption></caption>
                                        <colgroup>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th colspan="7" class="tabla-custom-title"><spring:message code="list.detail.blockregistrationmodification1" text="거리구간요금 등록/수정"/></th>
                                        </tr>
                                        <tr>
                                            <th class="bg-light text-center"><spring:message code="list.detail.dayoftheweek" text="요일"/></th>
                                            <th class="bg-light"><spring:message code="list.detail.starttimehh" text="시작시간(HH)"/></th>
                                            <th class="bg-light"><spring:message code="list.detail.endtimehh" text="종료시간(HH)"/></th>
                                            <th class="bg-light"><spring:message code="list.detail.distancem" text="거리(M)"/></th>
                                            <th class="bg-light"><spring:message code="list.detail.fee1krw22" text="주문요금"/></th>
                                            <th class="bg-light"><spring:message code="list.detail.fee2krw22" text="배송요금"/></th>
                                            <%--<th class="bg-light"><spring:message code="list.detail.status" text="상태"/></th>--%>
                                            <th class="bg-light"></th>
                                        </tr>
                                        <tr>
                                            <th class="bg-light">
                                                <select class="form-control day" name="day">
                                                    <option value="0"><spring:message code="list.detail.monday" text="전체"/></option>
                                                    <option value="1"><spring:message code="list.detail.monday" text="월요일"/></option>
                                                    <option value="2"><spring:message code="list.detail.tuesday" text="화요일"/></option>
                                                    <option value="3"><spring:message code="list.detail.wednesday" text="수요일"/></option>
                                                    <option value="4"><spring:message code="list.detail.thursday" text="목요일"/></option>
                                                    <option value="5"><spring:message code="list.detail.friday" text="금요일"/></option>
                                                    <option value="6"><spring:message code="list.detail.saturday" text="토요일"/></option>
                                                    <option value="7"><spring:message code="list.detail.sunday" text="일요일"/></option>
                                                </select>
                                            </th>
                                            <td>
                                                <select class="form-control width-full startTime" name="startTime" >
                                                    <c:forEach begin="00" end="24" var="hour">
                                                        <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if><spring:message code="list.detail.timestart" text="시 (시작)"/></option>
                                                        <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if><spring:message code="list.detail.timeend" text="시 (시작)"/></option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control width-full endTime" name="endTime">
                                                    <c:forEach begin="00" end="24" var="hour">
                                                        <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if><spring:message code="list.detail.timeend" text="시 (종료)"/></option>
                                                        <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if><spring:message code="list.detail.timeend" text="시 (종료)"/></option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <th>
                                                <input type="text" class="form-control radius" name="radius" placeholder="<spring:message code="list.detail.distancelessthan" text="거리(미만)"/>" maxlength="7" numberOnly >
                                            </th>
                                            <th>
                                                <input type="text" class="form-control custPrice" name="custPrice" placeholder="<spring:message code="list.detail.fee1krw" text="주문요금 (원)"/>" value="0" maxlength="7" numberOnly>
                                            </th>
                                            <th>
                                                <input type="text" class="form-control dlvyPrice" name="dlvyPrice" placeholder="<spring:message code="list.detail.fee1krw" text="배송요금 (원)"/>" value="0" maxlength="7" numberOnly>
                                            </th>
                                            <td>
                                                <button type="button" onclick="insPrice()" class="btn btn-white color"><spring:message code="list.detail.enrollment" text="등록"/></button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <div class="block_list_div border " >
                                    <table class="table table-bordered table-sort block_list_table">
                                        <thead>
                                        <colgroup>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                        </colgroup>
                                        </thead>
                                        <tbody class="addTbody">
                                        </tbody>
                                    </table>
                                </div>

                                <div class="m-l-5 m-t-5">
                                    <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <%--   <div class="tab-pane fade" id="default-tab-9">
                        <form class="update_form8" id="update_form8" method="post">
                            <div class="table-responsive" style="overflow: hidden;">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light height-50 "  colspan="2"><spring:message code="list.detail.accountholder1" text="설정값"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <label class="">
                                                <input type="radio" name="useYn" class="align-bottom m-r-10 useYn" value="0" <c:if test="${tbStorePrice.useYn == 0}" >checked</c:if>>총판설정 사용
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="useYn" class="align-bottom m-r-10 useYn" value="1" <c:if test="${tbStorePrice.useYn == 1}" >checked</c:if>>가맹점설정 사용
                                            </label>

                                           &lt;%&ndash; <select name="useYn" class="form-control width-150">
                                                <option value="0"<c:if test="${tbStorePrice.useYn == 0}" >selected</c:if>>총판설정 사용</option>
                                                <option value="1"<c:if test="${tbStorePrice.useYn == 1}" >selected</c:if>>가맹점설정 사용</option>
                                            </select>&ndash;%&gt;
                                        </td>
                                        <td class="text-danger-darker   " style="width: 232px;"><spring:message code="list.description.cannotbemodified" text="가맹점설정 유형을 선택해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>" >
                                        <td class="bg-light height-50 width-60" colspan="2"><spring:message code="list.detail.accountholder1" text="적용할 요금제"/></td>
                                        <td colspan="2">
                                            <label class="">
                                                <input type="radio" name="meterUseYn" class="align-bottom m-r-10 meterUseYn" value="1" <c:if test="${tbStorePrice.meterUseYn == 1}" >checked</c:if>>기본(미터)요금 사용
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="meterUseYn" class="align-bottom m-r-10 meterUseYn" value="0" <c:if test="${tbStorePrice.meterUseYn == 0}" >checked</c:if>>거리구간요금 사용
                                            </label>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="거리구간 요금 유형을 선택해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="고객요금"/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="기본요금"/></td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 meterPrice" name="meterPrice" value="${tbStorePrice.meterPrice}" numberCommaOnly> 원
                                        </td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 meterBaseDistance" name="meterBaseDistance" value="${tbStorePrice.meterBaseDistance}" numberCommaOnly>  (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="기본요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="추가요금"/></td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 meterAddition" name="meterAddition" value="${tbStorePrice.meterAddition}" numberCommaOnly>  원
                                        </td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 meterAddDistance" name="meterAddDistance" value="${tbStorePrice.meterAddDistance}" numberCommaOnly> (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="추가요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="최대요금"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <input type="text"  class="form-control width-200 meterMaximum" name="meterMaximum" value="${tbStorePrice.meterMaximum}" numberCommaOnly>  원
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="최대요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="배송요금"/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="기본요금"/></td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 dlvyPrice" name="dlvyPrice" value="${tbStorePrice.dlvyPrice}" numberCommaOnly>  원
                                        </td>
                                        <td class="border-right-0" colspan="">
                                            <input type="text"  class="form-control width-200 dlvyBaseDistance" name="dlvyBaseDistance" value="${tbStorePrice.dlvyBaseDistance}" numberCommaOnly> (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="기본요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="추가요금"/></td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 dlvyAddition" name="dlvyAddition" value="${tbStorePrice.dlvyAddition}" numberCommaOnly>  원
                                        </td>
                                        <td class="border-right-0" colspan="1">
                                            <input type="text"  class="form-control width-200 dlvyAddDistance" name="dlvyAddDistance" value="${tbStorePrice.dlvyAddDistance}" numberCommaOnly> (M 단위)
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="추가요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0 || tbStorePrice.meterUseYn == 0}" >none</c:if>">
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="최대요금"/></td>
                                        <td class="border-right-0" colspan="2">
                                            <input type="text"  class="form-control width-200 dlvyMaximum" name="dlvyMaximum" value="${tbStorePrice.dlvyMaximum}" numberCommaOnly> 원
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="최대요금을 입력해주세요."/></td>
                                    </tr>
                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="8"><spring:message code="list.detail.accountholder1" text="할증요금 "/></td>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="요일할증 "/></td>
                                        <td colspan="2">
                                            <select name="dayChargeYn" class="form-control width-100">
                                                <option value="0"<c:if test="${tbStorePrice.dayChargeYn == 0}" >selected</c:if>>사용안함</option>
                                                <option value="1"<c:if test="${tbStorePrice.dayChargeYn == 1}" >selected</c:if>>사용</option>
                                            </select>
                                            <input type="text"  class="form-control width-120 dayCharge" name="dayCharge" value="${tbStorePrice.dayCharge}" numberCommaOnly> 원
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="요일할증 정보를 입력해주세요"/></td>
                                    </tr>
                                   &lt;%&ndash; <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="요일할증 금액"/></td>
                                        <td class="border-right-0">
                                            <input type="text"  class="form-control width-200 dayCharge" name="dayCharge" value="${tbStorePrice.dayCharge}" numberCommaOnly> 원
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="반납대행 선결제 수수료를 입력해주세요."/></td>
                                    </tr>&ndash;%&gt;
                                   &lt;%&ndash; <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="눈비할증 금액"/></td>

                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="눈비할증 금액을 입력해주세요."/></td>
                                    </tr>&ndash;%&gt;

                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.accountholder1" text="시간할증 "/></td>
                                        <td colspan="1">
                                            <select name="timeChargeYn" class="form-control width-100">
                                                <option value="0"<c:if test="${tbStorePrice.timeChargeYn == 0}" >selected</c:if>>사용안함</option>
                                                <option value="1"<c:if test="${tbStorePrice.timeChargeYn == 1}" >selected</c:if>>할증사용</option>
                                            </select>
                                            <input type="text"  class="form-control width-120 timeCharge" name="timeCharge" value="${tbStorePrice.timeCharge}" numberCommaOnly> 원
                                        </td>
                                        <td>
                                            시작시간 : <input type="text" name="timeStart" class="timeStart form-control" value="${tbStorePrice.timeStart}" maxlength="4" numberOnly> ~
                                            종료시간 : <input type="text" name="timeEnd" class="timeEnd form-control" value="${tbStorePrice.timeEnd}" maxlength="4" numberOnly>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증정보를 입력해주세요"/></td>
                                    </tr>
                                   &lt;%&ndash; <tr>
                                        <td class="bg-light"><spring:message code="list.detail.accountholder1" text="시간할증 금액"/></td>

                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증금액을 입력해주세요."/></td>
                                    </tr>&ndash;%&gt;
                                    &lt;%&ndash;<tr>
                                        <td class="border-right-0" colspan="2">

                                           &lt;%&ndash; <label>
                                                <select class="form-control">
                                                    <c:forEach begin="0" end="24" varStatus="hour">
                                                        <c:if test="${hour.index.length < 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart == '0'+hour.index}">>selected</c:if>> 0${hour.index} </option>
                                                        </c:if>
                                                        <c:if test="${hour.index.length >= 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart ==  hour.index}">>selected</c:if>> ${hour.index} </option>
                                                        </c:if>
                                                        ${hour.index}
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control">
                                                    <c:forEach begin="0" end="24" varStatus="hour">
                                                        <c:if test="${hour.index.length < 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart == '0'+hour.index}">>selected</c:if>> 0${hour.index} </option>
                                                        </c:if>
                                                        <c:if test="${hour.index.length >= 1}">
                                                            <option <c:if test="${tbStorePrice.timeStart ==  hour.index}">>selected</c:if>> ${hour.index} </option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </label>&ndash;%&gt;
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증 시작/종료시간을 입력해주세요."/></td>
                                        </tr>&ndash;%&gt;
                                    <tr class="useYnTr" style="display: <c:if test="${tbStorePrice.useYn == 0}" >none</c:if>">
                                        <td class="bg-light" rowspan="2"><spring:message code="list.detail.accountholder1" text="눈비할증"/></td>
                                        <td colspan="1" rowspan="2">
                                            <select name="weatherChargeYn" class="form-control width-100">
                                                <option value="0"<c:if test="${tbStorePrice.weatherChargeYn == 0}" >selected</c:if>>사용안함</option>
                                                <option value="1"<c:if test="${tbStorePrice.weatherChargeYn == 1}" >selected</c:if>>사용</option>
                                            </select>
                                            <input type="text"  class="form-control width-120 weatherCharge" name="weatherCharge" value="${tbStorePrice.weatherCharge}" numberCommaOnly> 원
                                        </td>
                                        <td>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="월" <c:if test="${fn:contains(tbStorePrice.dayFilter, '월')}">checked</c:if>>월</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="화" <c:if test="${fn:contains(tbStorePrice.dayFilter, '화')}">checked</c:if>>화</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="수" <c:if test="${fn:contains(tbStorePrice.dayFilter, '수')}">checked</c:if>>수</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="목" <c:if test="${fn:contains(tbStorePrice.dayFilter, '목')}">checked</c:if>>목</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="금" <c:if test="${fn:contains(tbStorePrice.dayFilter, '금')}">checked</c:if>>금</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="토" <c:if test="${fn:contains(tbStorePrice.dayFilter, '토')}">checked</c:if>>토</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk" value="일" <c:if test="${fn:contains(tbStorePrice.dayFilter, '일')}">checked</c:if>>일</label>
                                            <input type="hidden" name="dayFilter" class="dayFilter" value="${tbStorePrice.dayFilter}">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="눈비할증 정보를 입력해주세요"/></td>
                                    </tr>
                                   &lt;%&ndash; <tr>
                                       &lt;%&ndash; <td class="bg-light height-50" ><spring:message code="list.detail.accountholder1" text="적용요일"/></td>&ndash;%&gt;

                                        <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="적용요일을 선택해주세요."/></td>
                                    </tr>&ndash;%&gt;
                                      &lt;%&ndash;  <tr>
                                            <td class="bg-light"><spring:message code="list.detail.accountholder1" text="시간할증 종료시간"/></td>
                                            <td class="border-right-0">
                                                <label>
                                                    <select class="form-control">
                                                        <c:forEach begin="0" end="24" varStatus="hour">
                                                            <option>${hour.index}시(시작)</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                                <label>
                                                    <select class="form-control">
                                                        <c:forEach begin="0" end="24" varStatus="hour">
                                                            <option>${hour.index}시(종료)</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증 종료시간을 선택해주세요."/></td>
                                        </tr>&ndash;%&gt;
                                    </tbody>
                                </table>
                                <div class="m-t-10">
                                    <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                    <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                                </div>
                            </div>
                        </form>
                    </div>--%>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                   <%-- <div class="tab-pane fade" id="default-tab-9">--%>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12">
                            </div>
                            <form id="searchSubmitForm" onsubmit="searchPlaces(); return false;" style="display: none;">
                                키워드 : <input type="text" value="${tbStore.poi}" id="keyword" size="15">
                                <button id="kakaoSearchBtn" type="submit">검색하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <form class="updatePrice" id="updatePrice">
        <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
        <input type="hidden" name="radius" class="radius" value="">
        <input type="hidden" name="day" class="day" value="">
        <input type="hidden" name="groupNo" class="groupNo" value="">
        <input type="hidden" name="custPrice" class="custPrice" value="">
        <input type="hidden" name="dlvyPrice" class="dlvyPrice" value="">
        <input type="hidden" name="startTime" class="startTime" value="">
        <input type="hidden" name="endTime" class="endTime" value="">
        <input type="hidden" name="dataStatus" class="dataStatus" value="">
        <input type="hidden" name="priceNo" class="priceNo" value="">
    </form>
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
        <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
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
        <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
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
                                <label class="m-l-10 blockTypeCodeSel">
                                    정지/삭제사유 :
                                    <select class="upBlockTypeCode" name="blockTypeCode"
                                    <c:forEach var="item" items="${systemCodeList}" varStatus="status">
                                        <option value="${item.sysCode}" <c:if test="${tbUserStaff.blockTypeCode == item.sysCode}" >selected</c:if>>${item.codeName}</option>
                                    </c:forEach>
                                    </select>
                                </label>
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
    function percentChk(number){
        console.log(number)
        return number.replaceAll(".00","");
    }

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
        let blockTypeCode = $(this).attr("blockTypeCode");

        $(".upUserId").val(userId);
        $(".upName").val(name);
        $(".upPhone").val(phone);
        $(".upMemo").val(memo);
        $(".upUserNo").val(userNo);
        $(".upDataStatus").val(dataStatus).attr("selected","selected");
        if(dataStatus == 1){
            $(".blockTypeCodeSel").css("display","none");
        }else {
            $(".blockTypeCodeSel").css("display","inline");
            $(".upBlockTypeCode").val(blockTypeCode).attr("selected","selected");
        }
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

        priceList();
        //총판설정 사용일때 나머지 row none처리
        $(".useYn").on("click",function(){
            let meterUseYn= $("input[name='meterUseYn']:checked").val();
            if($(this).val() == 1) {
                $(".useYnTr").css("display","");
                if(meterUseYn == 1) {
                    $(".meterUseYnTr").css("display","");
                } else {
                    $(".meterUseYnTr").css("display","none");
                }
            } else {
                $(".useYnTr").css("display","none");
            }



        });

        $(".meterUseYn").on("click",function(){
            if($(this).val() == 1) {
                $(".meterUseYnTr").css("display","");
            } else {
                $(".meterUseYnTr").css("display","none");
            }
        });


        $(".pgCharge").val(percentChk($(".pgCharge").val()));
        $(".takeoverCharge").val(percentChk($(".takeoverCharge").val()));
        $(".returnCharge").val(percentChk($(".returnCharge").val()));
        $(".mycarCharge").val(percentChk($(".mycarCharge").val()));
        $(".olleCharge").val(percentChk($(".olleCharge").val()));

        $("input:text[numberCommaOnly]").on("keyup", function() {
            $(this).val($(this).val().replace(/[^0-9.]/g,""));
        });

        $(".pgCharge,.takeoverCharge,.returnCharge,.mycarCharge,.olleCharge").focus(function(){
            /!*$(this).val('');*!/
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });


        $(".upDataStatus").on("change", function () {
            var radioVal = $('.upDataStatus option:selected').val();
            if (radioVal == 1) {
                $(".blockTypeCodeSel").css("display", "none");
            } else {
                $(".blockTypeCodeSel").css("display", "inline");
            }
        });

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

            let dayFilter ="";
            $("input[class=dayFilterChk]:checked").each(function() {
                dayFilter= dayFilter+$(this).val();
            });
            $(".dayFilter").val(dayFilter);

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
            let _forms3 = $('.update_form7');
            let _forms4 = $('.update_form8');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            let req3 = convertFormToObj(_forms3);
            let req4 = convertFormToObj(_forms4);

            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            let cancelmsg = "<spring:message code="list.script.cancel" text="취소"/>";
            let updatconfirm = "<spring:message code="list.script.update" text="수정"/>";

            console.log(req4);
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
                        formData.append("tbStoreCharge",  new Blob([JSON.stringify(req3)], {type:"application/json"}));
                        formData.append("tbStorePrice",  new Blob([JSON.stringify(req4)], {type:"application/json"}));
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

    function inputDataCheck(args) {
        let storemsg = "<spring:message code="list.script.pleaseenterthestorename" text="가맹점명을 입력해주세요."/>";
        let storephonemsg = "<spring:message code="list.script.merchantphonenumbermsg" text="가맹점전화번호를 입력해주세요."/>";
        let storeheadquartermsg = "<spring:message code="list.script.registeredaffiliateheadquartersmsg" text="고객앱 가맹점명을 입력해주세요."/>";
        if (isNull(args.storeName)) {
            return alert_focus("storeName",storemsg);
        } else if (isNull(args.storeTel)) {
            return alert_focus("storeTel", storephonemsg);
        } else if (isNull(args.authTel)) {
            return alert_focus("authTel", "인증용 휴대전화를 입력해주세요.");
        } else if (isNull(args.mngrName)) {
            return alert_focus("mngrName", "영업담당자 이름을 입력해주세요.");
        } else if (isNull(args.addr1)) {
            return alert_focus("addr1", "주소를 입력해주세요");
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
                            "data-toggle=\"modal\""+
                            " userNo="+data.userStaffList[i].staffNo+
                            " blockTypeCode="+data.userStaffList[i].blockTypeCode+
                            " userId="+data.userStaffList[i].userId+
                            " name="+data.userStaffList[i].name+
                            " phone="+data.userStaffList[i].phone+
                            " dataStatus="+data.userStaffList[i].dataStatus+
                            " staffNo="+data.userStaffList[i].staffNo+
                            " memo="+data.userStaffList[i].memo+
                            " >"+userupdate+"</a>" +
                            "</td>" +
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


    function priceList() {
        let allday = "<spring:message code="list.script.monday" text="전체"/>";
        let monday = "<spring:message code="list.script.monday" text="월요일"/>";
        let tuesday = "<spring:message code="list.script.tuesday" text="화요일"/>";
        let wednesday = "<spring:message code="list.script.wednesday" text="수요일"/>";
        let thursday = "<spring:message code="list.script.thursday" text="목요일"/>";
        let friday = "<spring:message code="list.script.friday" text="금요일"/>";
        let saturday = "<spring:message code="list.script.saturday" text="토요일"/>";
        let sunday = "<spring:message code="list.script.sunday" text="일요일"/>";
        let end = "<spring:message code="list.script.end" text="종료"/>";
        let start = "<spring:message code="list.script.start" text="시작"/>";
        let normal = "<spring:message code="list.script.normal" text="정상"/>";
        let stop = "<spring:message code="list.script.stop" text="정지"/>";
        let distancelesthan = "<spring:message code="list.script.distancelesthan" text="거리(미만)"/>";
        let custPrice = "<spring:message code="list.script.custPrice" text="고객요금"/>";
        let dlvyPrice = "<spring:message code="list.script.dlvyPrice" text="배송요금"/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let nolistmsg = "<spring:message code="list.script.thereisnoregisteredlist" text="등록된 리스트가 없습니다."/>";

        $.ajax({
            type: "POST",
            url: "${path}/api/deliverystreet/dlvyPrice/list",
            data: {
                groupNo: "${tbStore.storeNo}"
            },
            success: function(data) {
                console.log(data)
                let sortList = [];
                var sortingField = "day";

                if(data.tbDlvyPriceList.length >= 1){
                    sortList =  data.tbDlvyPriceList.sort(function(a, b) { // 오름차순
                        return a[sortingField] - b[sortingField];
                    });
                } else {
                    sortList = data.tbDlvyPriceList;
                }


                $(".addTbody").html("");
                for(var i = 0 ; i < sortList.length ; i++){
                    let dataStatus = "";


                    let dayList = "";
                    let dayText = [allday,monday,tuesday,wednesday,thursday,friday,saturday,sunday];
                    let startTime = "";
                    let endTime = "";
                    dayList =  "         <select class=\"form-control day upDay\" name=\"day\">\n";
                    for(let j = 0 ; j < dayText.length ; j ++) {
                        if (sortList[i].day == j) {
                            dayList = dayList +"<option value="+j+" selected>"+dayText[j]+"</option>\n";
                        } else {
                            dayList = dayList +"<option value="+j+">"+dayText[j]+"</option>\n";
                        }
                    }
                    dayList =  dayList+" </select>\n" ;



                    startTime ="        <select class=\"form-control width-full startTime\" name=\"startTime\" >\n";
                    for(let j = 0 ; j <= 24 ; j ++) {
                        let timeText = "";
                        if(j < 10){
                            timeText  = "0"+j;
                        } else {
                            timeText  = j;
                        }
                        if (sortList[i].startTime == j) {

                            startTime = startTime +"<option value="+j+" selected>"+timeText+" ("+start+")</option>\n";
                        } else {
                            startTime = startTime +"<option value="+j+">"+timeText+" ("+start+")</option>\n";
                        }
                    }
                    startTime = startTime +"        </select>\n" ;

                    endTime ="        <select class=\"form-control width-full endTime\" name=\"endTime\" >\n";
                    for(let j = 0 ; j <= 24 ; j ++) {
                        let timeText = "";
                        if(j < 10){
                            timeText  = "0"+j;
                        } else {
                            timeText  = j;
                        }
                        if (sortList[i].endTime == j) {
                            endTime = endTime +"<option value="+j+" selected>"+timeText+" ("+end+")</option>\n";
                        } else {
                            endTime = endTime +"<option value="+j+">"+timeText+" ("+end+")</option>\n";
                        }
                    }
                    endTime = endTime +"        </select>\n" ;


                    if (sortList[i].dataStatus == 1) {
                        dataStatus =      "        <select class=\"form-control dataStatus\">\n" +
                            "            <option value=\"1\" selected>"+normal+"</option>\n" +
                            "            <option value=\"2\">"+stop+"</option>\n" +
                            "        </select>\n" ;
                    }else if(sortList[i].dataStatus == 2){
                        dataStatus =      "        <select class=\"form-control dataStatus\">\n" +
                            "            <option value=\"1\" >"+normal+"</option>\n" +
                            "            <option value=\"2\" selected>"+stop+"</option>\n" +
                            "        </select>\n" ;
                    }
                    let radius ="";
                    let custPrice ="";
                    let dlvyPrice ="";
                    if(sortList[i].radius == "" || sortList[i].radius == null){
                        radius = "";
                    }else {
                        radius = sortList[i].radius;
                    }
                    if(sortList[i].custPrice == "" || sortList[i].custPrice == null){
                        custPrice = "";
                    }else {
                        custPrice = sortList[i].custPrice;
                    }
                    if(sortList[i].dlvyPrice == "" || sortList[i].dlvyPrice == null){
                        dlvyPrice = "";
                    }else {
                        dlvyPrice = sortList[i].dlvyPrice;
                    }

                    $(".addTbody").append("<tr class=\"priceTr"+sortList[i].priceNo+" border\">\n" +
                        "    <th class=\"bg-light\">\n" +
                        dayList +
                        "    </th>\n" +
                        "    <td>\n" +
                        startTime +
                        "    </td>\n" +
                        "    <td>\n" +
                        endTime +
                        "    </td>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control radius\" name=\"radius\" placeholder=\"\" value='"+radius+"' maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control custPrice\" name=\"custPrice\" placeholder=\"\" value='"+custPrice+"' maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control dlvyPrice\" name=\"dlvyPrice\" placeholder=\"\" value='"+dlvyPrice+"' maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <td>\n" +
                        "        <button type=\"button\" onclick=\"upPrice("+sortList[i].priceNo+")\" class=\"btn btn-white color\">"+update+"</button>\n" +
                        "        <button type=\"button\" onclick=\"delPrice("+sortList[i].priceNo+")\" class=\"btn btn-danger color\">삭제</button>\n" +
                        "    </td>\n" +
                        "</tr>")
                }

                if(data.tbDlvyPriceList.length == 0) {
                    $(".addTbody").append(
                        "<tr class=\"\"  >\n" +
                        "<th class=\"text-center\" colspan=\"9\">"+nolistmsg+"</th>"+
                        "</tr>"
                    )
                }
            }
        });
    }

    function upPrice(priceNo) {
        let radius = $(".priceTr"+priceNo).find(".radius").val();
        let day = $(".priceTr"+priceNo).find(".day").val();
        let custPrice = $(".priceTr"+priceNo).find(".custPrice").val();
        let dlvyPrice = $(".priceTr"+priceNo).find(".dlvyPrice").val();
        let startTime = $(".priceTr"+priceNo).find(".startTime").val();
        let endTime = $(".priceTr"+priceNo).find(".endTime").val();
        let dataStatus = 1;

        let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let updatefailmsg = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        $(".updatePrice").find(".priceNo").val(priceNo);
        $(".updatePrice").find(".groupNo").val(${tbStore.storeNo});
        $(".updatePrice").find(".radius").val(radius);
        $(".updatePrice").find(".day").val(day);
        $(".updatePrice").find(".custPrice").val(custPrice);
        $(".updatePrice").find(".dlvyPrice").val(dlvyPrice);
        $(".updatePrice").find(".startTime").val(startTime);
        $(".updatePrice").find(".endTime").val(endTime);
        $(".updatePrice").find(".dataStatus").val(dataStatus);

        let _forms = $('.updatePrice');
        let req = convertFormToObj(_forms);
        console.log(req)
        let url = "${path}/api/deliverystreet/price/update";
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
                var formData = new FormData(document.getElementById('updatePrice'));
                formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.result == 200) {
                            alert(updatesussmsg);
                            priceList();
                        } else {
                            alert(updatefailmsg);
                            return;
                        }
                    }
                });
            }
        });
    }

    function delPrice(priceNo) {
        let radius = $(".priceTr"+priceNo).find(".radius").val();
        let day = $(".priceTr"+priceNo).find(".day").val();
        let custPrice = $(".priceTr"+priceNo).find(".custPrice").val();
        let dlvyPrice = $(".priceTr"+priceNo).find(".dlvyPrice").val();
        let startTime = $(".priceTr"+priceNo).find(".startTime").val();
        let endTime = $(".priceTr"+priceNo).find(".endTime").val();
        let dataStatus = 0;

        let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate1" text="삭제하시겠습니까?"/>";
        let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="삭제에 성공하였습니다."/>";
        let updatefailmsg = "<spring:message code="list.script.editfailed1" text="삭제에 실패하였습니다."/>";
        let update = "<spring:message code="list.script.update1" text="삭제"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        $(".updatePrice").find(".priceNo").val(priceNo);
        $(".updatePrice").find(".groupNo").val(${tbStore.storeNo});
        $(".updatePrice").find(".radius").val(radius);
        $(".updatePrice").find(".day").val(day);
        $(".updatePrice").find(".custPrice").val(custPrice);
        $(".updatePrice").find(".dlvyPrice").val(dlvyPrice);
        $(".updatePrice").find(".startTime").val(startTime);
        $(".updatePrice").find(".endTime").val(endTime);
        $(".updatePrice").find(".dataStatus").val(dataStatus);

        let _forms = $('.updatePrice');
        let req = convertFormToObj(_forms);
        console.log(req)
        let url = "${path}/api/deliverystreet/price/update";
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
                var formData = new FormData(document.getElementById('updatePrice'));
                formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.result == 200) {
                            alert(updatesussmsg);
                            priceList();
                        } else {
                            alert(updatefailmsg);
                            return;
                        }
                    }
                });
            }
        });
    }

    function insPrice() {
        let url = "${path}/api/deliverystreet/price/insert";

        let _forms = $('.insert_form_dlvy_price');
        let req = convertFormToObj(_forms);

        let registmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
        let registfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let enrollment = "<spring:message code="list.script.enrollment" text="등록"/>";
        if (inputDataCheck4(req)) {
            swal({
                title: registmsg,
                icon: "warning",
                buttons: [
                    cancel,
                    enrollment
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData = new FormData(document.getElementById('insert_form_dlvy_price'));
                    formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                priceList();
                            } else {
                                alert(registfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    }



    function inputDataCheck4(args) {
        console.log(args);
        let distancemsg = "<spring:message code="list.script.pleaseenterthdistance" text="거리를 입력해주세요"/>";
        let fee1msg = "<spring:message code="list.script.pleaseenterrate1" text="요금1을 입력해주세요"/>";
        if (isNull(args.custPrice)) {
            return alert_focus("radius",custPrice);
        }
        return true;
    }

</script>
</body>
</html>
