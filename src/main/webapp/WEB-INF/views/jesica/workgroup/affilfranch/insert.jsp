<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.franchiseeregistration" text="가맹점등록"/></title>
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
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/workgroup/affilfranch/list"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise" text="가맹점"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.search.franchiseeregistration" text="가맹점등록"/><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.search.franchiseeregistration" text="가맹점등록"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>

<%--            <div class="tab-content">--%>
                <!-- begin tab-pane -->
<%--                <div class="tab-pane fade active show" id="default-tab-1">--%>
                    <div class="row width-full p-5">
                        <!-- begin col-8 -->
                        <!-- begin panel -->
                        <div class="panel panel-inverse width-full">
                            <!-- begin table-responsive -->
                            <div class="table-responsive m-l-5">
                                <div class="timeline-header m-t-10 m-b-10">
                                    <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                    <span><strong><spring:message code="list.detail.basicInformation" text="기본정보"/></strong></span>
                                </div>
                                <form class="dlvy_search_form"></form>
                                <form class="insert_form" id="insert_form">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">

                                <table class="table table-bordered">
                                    <tr>
                                        <td class="bg-light height-50" style="width:15%"><spring:message code="list.detail.serviceclassification" text="서비스 구분"/></td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="0" checked> <spring:message code="list.detail.test" text="테스트"/><%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="1" > <spring:message code="list.detail.service" text="서비스"/><%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.settlementisnotmadewhensettingupatest" text="테스트 설정시 정산이 이루어지지 않습니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.affiliatedworkgroup" text="소속 업무그룹"/></td>
                                        <td>
                                           <%-- <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal"  placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white headName width-200" readonly>
                                                <input type="hidden" class="headNo" name="headNo" value="">

                                            </label>
                                            <label>
                                                <input type="text" data-toggle="" data-target="#branch_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>&lt;%&ndash;총판선택&ndash;%&gt;" class="form-control background-white branchName width-200" readonly>
                                                <input type="hidden" class="branchNo" name="branchNo" value="">
                                            </label>--%>
                                               <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                                   <label>
                                                       <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                       <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                       <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                       <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                   </label>
                                                   <label>
                                                       <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                   </label>
                                               </c:if>
                                               <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                                   <label>
                                                       <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                       <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                       <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                       <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                   </label>
                                                   <label>
                                                       <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                   </label>
                                               </c:if>
                                               <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                                   <label>
                                                       <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                       <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                       <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                       <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">

                                                   </label>
                                                   <label>
                                                       <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                                   </label>
                                               </c:if>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.selectyouraffiliatedheadofficeanddistributor" text="소속 제휴본사와 총판을 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/></td>
                                        <td><input type="text" class="form-control width-200 storeName" name="storeName" value="${tbStore.storeName}" maxlength="30"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemerchantname" text="가맹점 이름을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.externalmerchantcode" text="외부 가맹점 코드"/></td>
                                        <td><input type="text" class="form-control width-200 exStoreCd" name="exStoreCd" value="" placeholder="<spring:message code="list.description.pleaseentertheexternalmerchantcode" text="외부 가맹점 코드를 입력해주세요"/>" maxlength="10"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheexternalmerchantcode" text="외부 가맹점 코드를 입력해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.defaultshippinggroup" text="기본 배송그룹"/></td>
                                        <td>
                                            <select class="form-control width-200 searchDlvyList dlvyNo" name="dlvyNo" >
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.chooseyourdefaultshippinggroup" text="기본 배송그룹을 선택하세요."/></td>
                                    </tr>
                                    <input type="hidden" name="dataStatus" value="1">
                                    <input type="hidden" name="masterYn" value="0">
<%--
                                    <tr>
                                        <td class="bg-light height-50">직영가맹점 여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="masterYn" value="0" class="align-bottom masterYn" checked> 일반가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="masterYn" value="1" class="align-bottom masterYn"> 직영가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">직영 가맹점인지 선택하세요.</td>
                                    </tr>
--%>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.24houroperation" text="24시간운영 여부"/></td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="alldayOpenYn" value="false" class="align-bottom alldayOpenYn" checked> <spring:message code="list.detail.parttime" text="시간제"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="alldayOpenYn" value="true" class="align-bottom alldayOpenYn" > <spring:message code="list.detail.24hoursoperation" text="24시간 운영"/><%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.choosewhetherthestoreisopen24hours" text="매장 24시간 운영여부를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.1" text="서비스타입"/></td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="serviceType" value="RENTCAR" class="align-bottom serviceType"> <spring:message code="list.detail.1" text="렌터카"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="serviceType" value="CONSIGNMENT" class="align-bottom serviceType" checked> <spring:message code="list.detail.1" text="탁송"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="serviceType" value="RESTAURANT" class="align-bottom serviceType" > <spring:message code="list.detail.1" text="맛집"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="serviceType" value="MART" class="align-bottom serviceType" > <spring:message code="list.detail.1" text="마트"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectastoretype" text="매장타입을 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">기본주문상태</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="orderStatusCode" value="10" class="align-bottom orderStatusCode" checked> 접수
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="orderStatusCode" value="30" class="align-bottom orderStatusCode"> 요청
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.aftercompletingbusinessmessage1" text="기본주문상태를 선택해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">인수대행가능여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="takeoverUseYn" value="0" class="align-bottom takeroverUseYn" checked> 불가능
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="takeoverUseYn" value="1" class="align-bottom takeroverUseYn"> 가능
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.aftercompletingbusinessmessage1" text="인수대행여부를 선택해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">반납대행가능여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="returnUseYn" value="0" class="align-bottom returnUseYn" checked> 불가능
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="returnUseYn" value="1" class="align-bottom returnUseYn"> 가능
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.aftercompletingbusinessmessage1" text="반납대행여부를 선택해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.storeoperation/delivery" text="매장운영/배달"/></td>
                                        <td class="p-0 ">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 border-bottom-0 width-200"><spring:message code="list.detail.storeoperationstatus" text="매장운영상태"/></td>
                                                    <td class="border-0">
                                                        <label><input type="radio" padding: 0 0 0 50px; min-width:400px; name="openStatus" value="0" > <spring:message code="list.detail.closed" text="영업종료"/></label>
                                                        <label class="p-l-10"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="openStatus" value="1" checked> <spring:message code="list.detail.open" text="영업"/></label>
                                                        <label class="p-l-10"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="openStatus" value="2" > <spring:message code="list.detail.rest" text="휴식"/></label>
                                                    </td>
                                                </tr>
                                                <tr class="open_form_master_tr p-0"  style="display: <c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 1}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 2}"></c:if>">
                                                    <td class="width-200  border-left-0 border-bottom-0"><spring:message code="list.detail.deliveryorderavailability" text="배달주문 가능여부"/></td>
                                                    <td class="border-left-0  border-bottom-0" colspan="2">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="dlvyYn" name="dlvyYn" value="0" checked> <spring:message code="list.detail.impossible" text="불가능"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="dlvyYn" name="dlvyYn" value="1" > <spring:message code="list.detail.possible" text="가능"/></label>
                                                    </td>
                                                </tr>
                                                <tr class="open_form_master_tr p-0"  >
                                                    <td class="width-200  border-left-0 border-bottom-0"><spring:message code="list.detail.packagingorderavailability" text="포장주문 가능여부"/></td>
                                                    <td class="border-left-0  border-bottom-0" colspan="2">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="takeoutYn" name="takeoutYn" value="0" checked> <spring:message code="list.detail.impossible" text="불가능"/></label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="takeoutYn" name="takeoutYn" value="1"> <spring:message code="list.detail.possible" text="가능"/></label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseselectstoreoperationdelivery" text="매장운영/배달여부를 선택해주세요"/></td>
                                    </tr>
                                  <%--  <tr>
                                        <td class="bg-light height-50">매장운영상태</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="openStatus" value="0" class="align-bottom openStatus"> <spring:message code="merchandise.search1.option4" text="영업종료"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="openStatus" value="1" class="align-bottom openStatus" checked> <spring:message code="merchandise.search1.option4" text="영업"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="openStatus" value="2" class="align-bottom openStatus" > <spring:message code="merchandise.search1.option4" text="휴식"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">매장 운영 상태를 선택하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">배달주문 가능여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="dlvyYn" value="0" class="align-bottom dlvyYn"> <spring:message code="merchandise.search1.option4" text="불가능"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="dlvyYn" value="1" class="align-bottom dlvyYn" checked> <spring:message code="merchandise.search1.option4" text="가능"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">배달주문 가능여부를 선택하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">포장주문 가능여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="takeoutYn" value="0" class="align-bottom takeoutYn"> <spring:message code="merchandise.search1.option4" text="불가능"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="takeoutYn" value="1" class="align-bottom takeoutYn" checked> <spring:message code="merchandise.search1.option4" text="가능"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">포장주문 가능여부를 선택하세요.</td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.cookingtime" text="조리시간"/></td>
                                        <td>
                                            <select name="cookingTime" class="form-control cookingTime">
                                                <option value="5">5<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="10">10<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="15">15<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="20">20<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="25">25<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="30">30<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="40">40<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="50">50<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="60">1<spring:message code="list.detail.hour" text="시간"/></option>
                                                <option value="90">1<spring:message code="list.detail.hour" text="시간"/> 30<spring:message code="list.detail.minute" text="분"/></option>
                                                <option value="120"><spring:message code="list.detail.hour" text="시간"/></option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.chooseacookingtime" text="조리시간을 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.minimumamountfordelivery" text="배달가능 최소금액"/></td>
                                        <td>
                                            <input type="text" class="form-control width-200 dlvyMinAmt" name="dlvyMinAmt" value="0" maxlength="7" numberOnly> <spring:message code="list.detail.won" text="원"/>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheminimumdeliveryamount" text="배달가능 최소금액을 입력해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.whethertosetdeliveryarea" text="배달가능지역 설정여부"/></td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="dlvyAreaYn" value="0" class="align-bottom dlvyAreaYn"> <spring:message code="list.detail.impossible" text="불가능"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="dlvyAreaYn" value="1" class="align-bottom dlvyAreaYn" checked> <spring:message code="list.detail.possible" text="가능"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.selectwhethertosetthedeliveryarea" text="배달가능지역 설정여부를 선택하세요"/></td>
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
                                        <td class="bg-light"><spring:message code="list.detail.storerepresentativenumber" text="가맹점 대표번호"/></td>
                                        <td><input type="text" class="form-control width-200 storeTel" name="storeTel" value="${tbStore.storeTel}" maxlength="20" numberOnly></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourrepresentativenumber" text="대표번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.mobilephoneforauthentication" text="인증용 휴대전화"/></td>
                                        <td><input type="text" class="form-control width-200 authTel" name="authTel" value="${tbStore.authTel}"  maxlength="20" numberOnly></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemobilephonenumbertobeusedforauthentication" text="인증시 사용할 휴대전화번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.salesrepresentativename" text="영업담당자 이름"/></td>
                                        <td><input type="text" class="form-control width-200 mngrName" name="mngrName" value="${tbStore.mngrName}"  maxlength="40" ></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthenameofyoursalesrepresentative" text="영업 담당자 이름을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.addressname" text="주소 명칭"/></td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-200" name="poi"   placeholder="<spring:message code="list.detail.addressname" text="주소 명칭"/>" readonly>
                                                <input
                                                        id="pac-input"
                                                        class="form-control width-250"
                                                        type="text"
                                                        placeholder="<spring:message code="list.description.pleasesearchfortheaddress" text="주소 명칭"/>" maxlength="250"
                                                /><input type="button" id="addressSearchButton" class="btn btn-primary p-t-5 p-b-5 m-l-10" value="<spring:message code="list.detail.mapaddresssearch" text="지도(주소검색)"/>">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.addressnameappmessage" text="앱에 표시될 주소 명칭입니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.mapaddresssearch" text="지도(주소검색)"/></td>
                                        <td>
                                            <div class="map_wrap">
                                                <div id="map"  class="height-300 width-full" ></div>

                                                <div id="menu_wrap" class="bg_white">
                                                    <div class="option">
                                                        <div>
                                                          <%--  <form onsubmit="searchPlaces(); return false;">
                                                                키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
                                                                <button type="submit">검색하기</button>
                                                            </form>--%>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <ul id="placesList"></ul>
                                                    <div id="pagination"></div>
                                                </div>
                                            </div>
                                           <%-- <div id="map" class="height-300 width-full"></div><br>
                                            <div id="menu_wrap" class="bg_white">
                                                <div class="option">
                                                    <div>
                                                        <form onsubmit="searchPlaces(); return false;">
                                                            키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
                                                            <button type="submit">검색하기</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <hr>
                                                <ul id="placesList"></ul>
                                                <div id="pagination"></div>
                                            </div>--%>

                                            <label class="m-r-10 m-t-10">
                                            <spring:message code="list.detail.latitude" text="위도"/> <input type="text" id="lat" name="lat" value="${tbStore.lat}" readonly>
                                                <spring:message code="list.detail.longitude" text="경도"/> <input type="text" id="lng" name="lng" value="${tbStore.lng}" readonly>
                                            </label><br><br>
                                            <input type="text" class="form-control width-100 addr_1" id="addr_1" name="addr1" value="${tbStore.addr1}" maxlength="30">
                                            <input type="text" class="form-control width-100" id="addr_2" name="addr2" value="${tbStore.addr2}" maxlength="50">
                                            <input type="text" class="form-control width-200" id="addr_3" name="addr3" value="${tbStore.addr3}" maxlength="100">
                                            <input type="text" class="form-control width-200" id="addr_4" name="addr4" value="${tbStore.addr4}" maxlength="100"  placeholder="<spring:message code="list.detail.theremainingaddress" text="나머지주소"/> ">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.addresssearchautosettingmessage" text="주소를 검색하면 주소 정보와 좌표가 자동 세팅됩니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.detailedaddress" text="상세주소"/></td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-400" name="addr5" value="${tbStore.addr5}" placeholder="<spring:message code="list.detail.pleaseenteryourdetailedaddress" text="상세주소를 입력해주세요"/>" maxlength="200">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">	<spring:message code="list.description.pleaseentertheaddressdetailsifany" text="주소 상세항목이 있으면 입력하세요"/></td>
                                    </tr>
                                    <%--<tr>
                                        <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전 계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0 border-right-0">
                                                        <select class="form-control m-r-10 cybankTypeCode"  name="cybankTypeCode">
                                                        </select>
                                                        <input type="hidden" name="cybankAccount" value="">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.accountautomessage" text="캐시 충전시 입금할 은행을 선택하면 계좌번호가 자동 생성됩니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금 계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0 border-right-0">
                                                        <select class="form-control m-r-10 bankTypeCode"  name="bankTypeCode">
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="" maxlength="50" numberOnly="true"></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                    <td class="border-bottom-0 border-right-0"><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="" maxlength="50"></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.pinnumber" text="PIN번호"/></td>
                                                    <td class="border-bottom-0 border-right-0">
                                                        <div class="pin-div">
                                                            <input  name="pinNum" class="form-control width-200 pinNum" value="" type="password" maxlength="50" numberOnly="true">
                                                            <i class="fa fa-eye fa-lg m-l-5"></i>
                                                        </div>
                                                    </td>
                                                </tr>--%>
                                     <%--       </table>
                                        </td>--%>
                                    <input type="hidden" name="deposit" value="0" />
                                    <input type="hidden" name="cash" value="0" />
                                    <input type="hidden" name="cashDefault" value="0" />
                                    <%--<td class="text-danger-darker"><spring:message code="list.description.questingawithdrawautomessage" text="출금 요청시 입금받을 사업자의 계좌 정보를 입력하세요."/></td>--%>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                        <td><input type="text" class="form-control width-600 memo" name="memo" value="" maxlength="200"></td>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력하세요"/></td>
                                    </tr>
                                </table>
                            </form>
                                <br>
                                <div class="timeline-header m-t-10 m-b-10">
                                    <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                    <span><strong><spring:message code="list.detail.businessinformation" text="사업자 정보"/></strong></span>
                                </div>
                                <form class="insert_form2">
                                    <table class="table table-condensed table-bordered">
                                        <tr>
                                            <td class="bg-light" style="width:15%"><spring:message code="list.detail.mutual" text="상호"/></td>
                                            <td style="width:60%">
                                                <input type="text" class="form-control width-200 bizName" name="bizName" value=""  maxlength="80">
                                                <label class="m-l-10 font-size-10">
                                                    <input type="radio" name="corpType" value="1" class="align-bottom corpType" checked><spring:message code="list.detail.normal" text="일반"/>
                                                </label>
                                                <label class="m-l-10 font-size-10">
                                                    <input type="radio" name="corpType" value="2" class="align-bottom corpType"><spring:message code="list.detail.simple" text="간이"/>
                                                </label>
                                                <label class="m-l-10 font-size-10">
                                                    <input type="radio" name="corpType" value="3" class="align-bottom corpType"><spring:message code="list.detail.corporation" text="법인"/>
                                                </label>
                                                <label class="font-size-10 m-l-10">
                                                    <input type="radio" name="corpType" value="0" class="align-bottom corpType" ><spring:message code="list.detail.unknown" text="알수없음"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.enterthebusinessnamemessage" text="사업자등록증 기준의 상호를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.companyregistrationnumber" text="사업자 등록번호"/></td>
                                            <td><input type="text" class="form-control width-200 bizNum" name="bizNum" value="" maxlength="20" numberOnly="true"></td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheregistrationnumbermessage" text="사업자등록증의 등록번호를 입력하세요."/></td>
                                            <input type="hidden" name="authStatus" value="0"/>
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
                                            <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="" maxlength="30"></td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertherepresentativebasemessage" text="사업자등록증 기준의 대표자를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.email" text="이메일"/></td>
                                            <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value="" maxlength="45"></td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheemailtoreceivetheinvoice" text="계산서를 수신할 이메일을 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.contact" text="연락처"/></td>
                                            <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value="" maxlength="40" numberOnly="true"></td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.pleaseenteryourbusinesscontactinformation" text="사업자 연락처를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.businessaddress" text="사업장 주소"/></td>
                                            <td><input type="text" name="bizAddr" class="form-control width-400 bizAddr" value="" maxlength="150"></td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheaddressonyourbusinessmessage" text="사업자등록증 상의 주소를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.typeofbusiness/industry" text="업태/업종"/></td>
                                            <td>
                                                <input type="text" name="bizType" class="form-control width-200 bizType" value="" maxlength="80">
                                                <input type="text" name="bizItem" class="form-control m-r-10 width-200 bizItem" value="" maxlength="80">
                                            </td>
                                            <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.typeofbusinessindustrymessage" text="사업자등록증 상의 업태와 종목를 입력하세요."/></td>
                                        </tr>
                                    </table>
                                </form>
                                <form id="searchSubmitForm" onsubmit="searchPlaces(); return false;" style="display: none;">
                                    <spring:message code="list.detail.keyword" text="키워드"/> : <input type="text" value="가산" id="keyword" size="15">
                                    <button id="kakaoSearchBtn" type="submit"><spring:message code="list.detail.addresssearch" text="주소 검색"/></button>
                                </form>
                            </div>

                            <!-- end table-responsive -->
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/></button>
                            </div>
                        </div>
                        <!-- end panel -->
                        <!-- end col-8 -->
                    </div>
                </div>
<%--            </div>--%>
<%--        </div>--%>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
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
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db9263cde5ebca76e7e4ead94532f163&libraries=services"></script>--%>
<%@include file="../../../common/include_kakao_map_js.jsp" %>
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c1a125dbfc0b31fb5f601512a4e58d0&libraries=services"></script>--%>


<%@include file="../../../common/include_number_only_js.jsp" %>
<script>

    $("input[name=dlvyMinAmt]").focus(function(){
    }).blur(function(){
        if($(this).val() == ""){
            $(this).val("0");
        }
    });
    $(document).on("click","input[name='openStatus']",function(){
        let chkVal = $("input[name='openStatus']:checked").val();
        if(chkVal == 0){
            $(".open_form_master_tr").css("display","none");
            $(".open_form_master_tr").css("display","none");
        } else if(chkVal == 1){
            $(".open_form_master_tr").css("display","");
            $(".open_form_master_tr").css("display","");
        } else if(chkVal == 2){
            $(".open_form_master_tr").css("display","none");
            $(".open_form_master_tr").css("display","none");
        }
    });

    $(document).on("click","#addressSearchButton",function(){
        let searchTxt = $("#pac-input").val();
        $("#keyword").val(searchTxt);
        $("#searchSubmitForm").submit();

    })

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
    })

    // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB);
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
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
        itemStr += '  <span style="display:none;" class="lat">' + places.y + '</span>' +
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
                image: markerImage
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

   /* let map;
    let marker;*/
    $(() => {
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

        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "CBT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".cybankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".cybankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });
        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "BT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".bankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".bankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });

        /*initMap();*/
        /*initAutocomplete();*/

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
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
                    $(".searchDlvyList").append(
                        "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                    )
                }
            }
        });

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            let req = convertFormToObj($('form.head_search_form'));
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
                            noregisteredaffiliateheadquarters+
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
            let noregistereddistributors = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            let headNo = $(".headNo").val();
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
                            noregistereddistributors+
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

        $(document).on("click",".branchName",function(){
            let affiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let cancel = "<spring:message code="list.detail.cancel" text="취소"/>";
            let headNo = $(".headNo").val();
            if(headNo == null || headNo =='') {
                swal({
                    title: affiliatedheadoffice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            }

        });

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".searchBranchList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".branchModalCloseBtn").click();
        });

        $(".btn_list").click(function() {
            location.href = "/workgroup/affilfranch/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/affilfranch/insert/action";
            let _forms = $('.insert_form');
            let _forms2 = $('.insert_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            let registermsg = "<spring:message code="list.detail.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let registerfailmsg = "<spring:message code="list.detail.registrationfailed" text="등록에 실패하였습니다."/>";
            let enrollment = "<spring:message code="list.detail.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.detail.cancel" text="취소"/>";
            if (inputDataCheck(req,req2)) {
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
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbStoreData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbBusinessInfoData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                            if (data.result == 200) {
                                location.href = "${path}/workgroup/affilfranch/list";
                            } else {
                                alert(registerfailmsg);
                                return;
                            }
                        }
                    });
                    }
                });
            }
        });
    });

   /* function initMap() {
        let uluru = {lat: 37.566302,lng: 126.977946};
        map = new google.maps.Map(document.getElementById("map"), {
            center: uluru,
            zoom: 18,
        });
        marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }



    function initAutocomplete() {
        let lat = $("#lat").val();
        let lng = $("#lng").val();
        if (lat == "") {
            lat = 37.4816268;
        }
        if (lng == "") {
            lng = 126.8829256;
        }

        const map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: lat, lng: lng },
            zoom: 13,
            mapTypeControl: false,
            mapTypeId: "roadmap",
        });
        // Create the search box and link it to the UI element.
        const input = document.getElementById("pac-input");
        const searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        // Bias the SearchBox results towards current map's viewport.
        searchBoxEvent(map,searchBox);
    }

    function searchBoxEvent(map,searchBox ) {
        map.addListener("bounds_changed", () => {
            searchBox.setBounds(map.getBounds());
        });
        let markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener("places_changed", () => {
            const places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }
            // Clear out the old markers.
            markers.forEach((marker) => {
                marker.setMap(null);
            });
            markers = [];
            // For each place, get the icon, name and location.
            const bounds = new google.maps.LatLngBounds();
            places.forEach((place) => {
                if (!place.geometry || !place.geometry.location) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                const icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(35, 35),
                };
                // Create a marker for each place.
               /!* markers.push(
                    new google.maps.Marker({
                        map,
                        icon,
                        title: place.name,
                        position: place.geometry.location,
                    })
                );*!/
                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            let poi = $("#pac-input").val();
            let geocoder = new google.maps.Geocoder();
            geocoder.geocode({'address': poi}, function(result, status) {

                if (status === 'OK') {
                    let address = null;

                     // 맵의 중심 좌표를 설정한다.
                      map.setCenter(result[0].geometry.location);
                      // 맵의 확대 정도를 설정한다.
                      map.setZoom(18);
                      // 맵 마커
                      marker = new google.maps.Marker({
                          map: map,
                          position: result[0].geometry.location
                      });

                      let addressArray = result[0].address_components;

                    $("#addr_1").val("");
                    $("#addr_2").val("");
                    $("#addr_3").val("");
                    $("#addr_4").val("");
                      for(var i = 0 ; i < addressArray.length ; i++){
                          if(addressArray[addressArray.length - (i+1)].long_name != '대한민국') {
                              if(i > 5) {
                                  let addAddr = addressArray[addressArray.length - (i+1)].long_name;
                                  $("#addr_4").val($("#addr_4").val() + addAddr);
                              }else {
                                  $("#addr_"+(i-1)).val(addressArray[addressArray.length - (i+1)].long_name);
                              }
                          }
                      }

                    //$("#pac-input").val(result[0].formatted_address.replace('대한민국','').replace(/^\s*!/, ""));
                    $("#lng").val(marker.position.lng());
                    $("#lat").val(marker.position.lat());
                } else {
                    alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                }
            });
            map.fitBounds(bounds);
        });
    }*/

    /*function postCodeBtn() {
        let poi = $("#pac-input").val();

        let geocoder = new google.maps.Geocoder();

        /!**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지.
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         *
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         *!/
        geocoder.geocode({'address': poi}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                let address = null;

              /!*  // 맵의 중심 좌표를 설정한다.
                map.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                map.setZoom(18);
                // 맵 마커
                marker.setMap(null);
                marker = new google.maps.Marker({
                    map: map,
                    position: result[0].geometry.location
                });*!/

              /!*  let addressArray = result[0].address_components;

                for(var i = 0 ; i < addressArray.length ; i++){
                    if(addressArray[addressArray.length - (i+1)].long_name != '대한민국') {
                        if(i > 5) {
                            let addAddr = addressArray[addressArray.length - (i+1)].long_name;
                            $("#addr_4").val($("#addr_4").val() + addAddr);
                        }else {
                            $("#addr_"+(i-1)).val(addressArray[addressArray.length - (i+1)].long_name);
                        }
                    }
                }*!/

                $("#poi").val(result[0].formatted_address.replace('대한민국','').replace(/^\s*!/, ""));
                initAutocomplete();

                /!*  // 위도
                  console.log('위도(latitude) : ' + marker.position.lat());
                  // 경도
                  console.log('경도(longitude) : ' + marker.position.lng());*!/
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }*/


    function inputDataCheck(args,args2) {
        let msg2 = "<spring:message code="list.script.pleasesearchfortheaddress" text="주소를 검색해주세요."/>";
        let msg3 = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice1" text="가멩잠명을 선택해주세요."/>";
        let msg4 = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요"/>";
        let msg5 = "<spring:message code="list.script.pleaseenterthestorename" text="가맹점명을 입력해주세요."/>";
        if (isNull(args.headNo)) {
            return alert_focus("headNoText", "제휴본사를 선택해주세요.");
        } else if (isNull(args.branchNo)) {
            return alert_focus("branchNoText", "총판명을 선택해주세요.");
        } else if (isNull(args.storeName)) {
            return alert_focus("storeName", "가맹점명을 입력해주세요.");
        } else if (isNull(args.addr1)) {
            return alert_focus("addr1", "주소를 입력해주세요");
        }
       /* else if (isNull(args.exStoreCd)) {
            return alert_focus("exStoreCd", "외부 가맹점 코드를 입력해주세요.");
        } */
        /*else if (isNull(args.storeTel)) {
            return alert_focus("storeTel", "가맹점전화번호를 입력해주세요");
        } else if (isNull(args.authTel)) {
            return alert_focus("authTel", "인증용 휴대전화번호를 입력해주세요");
        } else if (isNull(args.mngrName)) {
            return alert_focus("mngrName", "영업담당자 이름을 입력해주세요");
        }
        else if (isNull(args.bankAccount)) {
            return alert_focus("bankAccount", "인출은행 계좌번호를 입력해주세요");
        } else if (isNull(args.bankOwner)) {
            return alert_focus("bankOwner", "인출은행 예금주를 입력해주세요");
        } else if (isNull(args.pinNum)) {
            return alert_focus("pinNum", "PIN번호를 입력해주세요");
        } else if (isNull(args2.bizName)) {
            return alert_focus("bizName", "상호를 입력해주세요");
        } else if (isNull(args2.bizNum)) {
            return alert_focus("bizNum", "사업자 등록번호를 입력해주세요");
        } else if (isNull(args2.bizOwner)) {
            return alert_focus("bizOwner", "대표자명를 입력해주세요");
        } else if (isNull(args2.bizEmail)) {
            return alert_focus("bizEmail", "이메일를 입력해주세요");
        } else if (isNull(args2.bizTel)) {
            return alert_focus("bizTel", "사업자 연락처를 입력해주세요");
        } else if (isNull(args2.bizAddr)) {
            return alert_focus("bizAddr", "사업장주소를 입력해주세요");
        } else if (isNull(args2.bizType)) {
            return alert_focus("bizType", "업태를 입력해주세요");
        } else if (isNull(args2.bizItem)) {
            return alert_focus("bizItem", "종목를 입력해주세요");
        }*/
        return true;
    }
</script>
</body>
</html>
