<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.platformno리ticeregistration12" text="고객 상세"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | <spring:message code="list.detail.platformno리ticeregistration12" text="고객 상세"/></title>
    </c:if>

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
    #drawingMap,#drawingMapType , #map {width: 100%;height: 648px;}
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

    .priceText{
        text-align: right;
    }
    .alignCenter{
        text-align: center;
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement12" text="사용자 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="고객 관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration12" text="고객 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration1" text="고객 상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation12" text="기본정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation12" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation12" text="보유쿠폰"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation12" text="보유쿠폰"/><%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" name="custNo" value="${tbCust.custNo}">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="플랫폼 구분"/></td>
                                        <td>
                                            <%--<label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="0" class="m-t-1 m-r-3" <c:if test="${tbCust.platformType == 0}">checked</c:if>>
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
                                                <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" <c:if test="${tbCust.platformType == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3" <c:if test="${tbCust.platformType == 2}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="양파오더"/></span>
                                            </label>
                                            <label class="" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="platformType" value="3" class="m-t-1 m-r-3" <c:if test="${tbCust.platformType == 3}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman1" text="세날"/></span>
                                            </label>--%>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="회원여부"/></td>
                                        <td>
                                            <c:if test="${tbCust.isMember == 1}">회원</c:if>
                                            <c:if test="${tbCust.isMember == 0}">비회원</c:if>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="회원 여부입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="추천가맹점명"/></td>
                                        <td>
                                            <span style="font-weight: bold; color: red;">${tbCust.extRecommStCode} </span> ${tbCust.extRecommStName}
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="추천가맹점명 입니다."/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="가입일자"/></td>
                                        <td><javatime:format value="${tbCust.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="가입일자입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이름"/></td>
                                        <td><input type="text" name="custName" class="form-control" value="${tbCust.custName}"></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 이름을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="휴대폰 번호"/></td>
                                        <td><input type="text" name="custTel" class="form-control" value="${tbCust.custTel}"></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 휴대폰번호를 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="로그인 ID"/></td>
                                        <td>${tbCust.loginId}</td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="로그인 ID 입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="계정 상태"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="0" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 'DELETE'}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="삭제"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="1" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 'OK'}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="정상"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="2" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 'STOP'}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman12" text="정지"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="계정 상태를 선택하세요."/>
                                        </td>
                                    </tr>
                                  <%--  <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="주소"/></td>
                                         <td></td>
                                         <td class="text-danger-darker" style="width:25%">
                                             <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 주소 정보입니다.(변경불가)"/>
                                         </td>
                                    </tr>--%>
                                    <tr>
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
                                            <div class="panel-body">
                                                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                                                    <thead>
                                                    <th class="text-center" style="width: 46px"><spring:message code="list.word.no" text="순번"/></th>
                                                    <th class="text-center" style="width: 84px;">시/도</th>
                                                    <th class="text-center" style="width: 98px;">시/군/구</th>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e;">
                                                <ul class="attachList p-0" style="margin-bottom:0px;" >
                                                        <li >
                                                            <div class="panel-body">
                                                                <table id="areaTable" class="display table table-bordered w-100 table-striped ">
                                                                    <tbody>
                                                                    <c:choose>
                                                                        <c:when test="${tbCustLocation.size() > 0}">
                                                                            <c:forEach items="${tbCustLocation}" var="item" varStatus="status" step="1">
                                                                                <tr class="" >
                                                                                    <td style="width:46px;" class="text-center">${status.index + 1}</td>
                                                                                    <td style="width:84px" class="text-center">${item.codeName1}</td>
                                                                                    <td style="width:98px;" class="text-center">${item.codeName2}</td>
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
                                        <td class="bg-light"><spring:message code="list.detail.addressdetail" text="주소 상세"/></td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-400" name="addr5" value="${tbStore.addr5}" maxlength="200">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseentertheaddressdetailsifany" text="주소 상세항목이 있으면 입력하세요"/></td>
                                    </tr>
                                    <tr>
                                       <%-- <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="캐쉬"/></td>
                                        <td><input type="text" class="form-control" value="${tbCust.cash}" readonly></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 보유 캐쉬입니다.(변경불가)"/>
                                        </td>--%>
                                      <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="캐쉬"/></td>
                                        <td>
                                            <table>
                                               <%-- <tr>
                                                    <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="캐쉬"/></td>
                                                    <td ><input type="text" class="form-control" value="${tbCust.cash}" readonly> Cash</td>
                                                    <td class="text-danger-darker" style="width:25%">
                                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 보유 캐쉬입니다.(변경불가)"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="마일리지"/></td>
                                                    <td ><input type="text" class="form-control" value="${tbCust.mileage}" readonly> Mile</td>
                                                    <td class="text-danger-darker" style="width:30%">
                                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 보유 마일리지입니다.(변경불가)"/>
                                                    </td>
                                                </tr>--%>
                                                <tr>
                                                    <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="잔여포인트"/></td>
                                                    <td ><input type="text" class="form-control" value="${tbCust.point}" readonly> Point</td>
                                                    <td class="text-danger-darker" style="width:30%">
                                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="사용하고 남은 잔여포인트입니다.(변경불가)"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="누적포인트"/></td>
                                                    <td ><input type="text" class="form-control" value="${tbCust.accPoint}" readonly> Point</td>
                                                    <td class="text-danger-darker" style="width:30%">
                                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="현재까지 누적된 포인트입니다.(변경불가)"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="누적주문횟수"/></td>
                                        <td><input type="text" class="form-control" value="${tbCust.useCount}" readonly> 회</td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="누적된 주문횟수입니다."/>
                                        </td>
                                    </tr>주
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="성별"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="gender" class="gender" value="M" style="margin-right: 5px" <c:if test="${tbCust.gender == 'M'}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="남자"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="gender" class="gender" value="F" style="margin-right: 5px" <c:if test="${tbCust.gender == 'F'}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="여자"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="gender" class="gender" value="N" style="margin-right: 5px" <c:if test="${tbCust.gender == 'N'}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="알수없음"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="성별을 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="SMS 수신여부"/></td>
                                        <td>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="smsYn" class="smsYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.smsYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="smsYn" class="smsYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.smsYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="SMS 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="주문 PUSH 수신여부"/></td>
                                        <td class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushOrderYn" class="pushOrderYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.pushOrderYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushOrderYn" class="pushOrderYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.pushOrderYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="주문 PUSH 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="공지이벤트 PUSH 수신여부"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushNoticeYn" class="pushNoticeYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.pushNoticeYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushNoticeYn" class="pushNoticeYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.pushNoticeYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="공지이벤트 PUSH 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="마케팅 PUSH 수신여부"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushMarketingYn" class="pushMarketingYn" value="0" style="margin-right: 5px" <c:if test="${tbCust.pushMarketingYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="거부"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="pushMarketingYn" class="pushMarketingYn" value="1" style="margin-right: 5px" <c:if test="${tbCust.pushMarketingYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="동의"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="마케팅 PUSH 수신여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div style="display: flex; align-content: center">
                        <span>
                            <button type="button" class="btn btn-primary btn_list m-t-5" style="display: flex; align-items: center">
                                <i class="fa fa-list"></i>
                                <span class="m-l-5"><spring:message code="list.detail.list1" text="목록"/></span>
                            </button>
                        </span>
                        <span style="display: flex; align-items: center; margin-left: auto">
                            <button type="button" class="btn btn-primary btn_up m-r-5" style="display: flex; align-items: center">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5"><spring:message code="list.detail.enrollment1" text="수정"/></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="panel panel-inverse">
                        <h4 style="padding: 5px">사용쿠폰</h4>
                        <table class="table table-bordered border text-center">
                            <thead>
                                <tr>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.number1" text="번호"/></th>
                                    <th class="bg-light" width="15%"><spring:message code="list.detail.id1" text="쿠폰명"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.id1" text="서비스타입"/></th>
                                    <th class="bg-light" width="10%"><spring:message code="list.detail.id1" text="서비스주문구분"/></th>
                                    <th class="bg-light" width="20%"><spring:message code="list.detail.username1" text="할인율/할인금액"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.username1" text="사용여부"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.userphone1" text="발급일자"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.id1" text="만료일자"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.id1" text="사용일자"/></th>
                                    <th class="bg-light" width="7%"><spring:message code="list.detail.id1" text="상세보기"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${tbCustUsedCouponList}" varStatus="status">
                                    <tr class="detailRow">
                                        <td class="text-center">${status.index + 1}</td>
                                        <td class="text-center">
                                            <div style="overflow: hidden;
                      margin: auto;
                      text-overflow: ellipsis;
                      white-space: nowrap;
                      width: 250px;
                      display: block;">${item.title}
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.serviceType == 2}">탁송</c:if>
                                            <c:if test="${item.serviceType == 3}">맛집</c:if>
                                            <c:if test="${item.serviceType == 4}">마트</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.orderTypeCode == '00'}">전체</c:if>
                                            <c:if test="${item.orderTypeCode == '20'}">인수대행</c:if>
                                            <c:if test="${item.orderTypeCode == '21'}">반납대행</c:if>
                                            <c:if test="${item.orderTypeCode == '22'}">마이카탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '23'}">올레길탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '30'}">맛집배달</c:if>
                                            <c:if test="${item.orderTypeCode == '31'}">맛집포장</c:if>
                                            <c:if test="${item.orderTypeCode == '32'}">맛집예약</c:if>
                                            <c:if test="${item.orderTypeCode == '33'}">테이블주문</c:if>
                                            <c:if test="${item.orderTypeCode == '40'}">마트배달</c:if>
                                            <c:if test="${item.orderTypeCode == '41'}">마트포장</c:if>
                                        </td>
                                        <td class="text-center">
                                                ${item.dcAmt}
                                            <c:if test="${item.dcRateType == 1}">원</c:if>
                                            <c:if test="${item.dcRateType == 2}">%</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.useYn == 0}">미사용</c:if>
                                            <c:if test="${item.useYn == 1}">사용</c:if>
                                        </td>
                                        <td class="text-center">${item.insertDate}</td>
                                        <td class="text-center">${item.expireDate}</td>
                                        <td class="text-center">${item.useDate}</td>
                                        <td class="text-center" style="padding-right: 8px !important;">
                                            <button type="button" class="btn btn-primary btn_coupon_detail" couponNo="${item.couponNo}" style="display: flex; align-items: center; padding: 5px; margin: 0 auto">
                                                <i class="fa fa-ticket-alt"></i>
                                                <span class="m-l-5"><spring:message code="list.detail.list1" text="쿠폰상세"/></span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="panel panel-inverse">
                        <h4 style="padding: 5px">미사용쿠폰</h4>
                        <table class="table table-bordered border text-center">
                            <thead>
                                <tr>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.number1" text="번호"/></th>
                                    <th class="bg-light" width="15%"><spring:message code="list.detail.id1" text="쿠폰명"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.id1" text="서비스타입"/></th>
                                    <th class="bg-light" width="10%"><spring:message code="list.detail.id1" text="서비스주문구분"/></th>
                                    <th class="bg-light" width="20%"><spring:message code="list.detail.username1" text="할인율/할인금액"/></th>
                                    <th class="bg-light" width="5%"><spring:message code="list.detail.username1" text="사용여부"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.userphone1" text="발급일자"/></th>
                                    <th class="bg-light"><spring:message code="list.detail.id1" text="만료일자"/></th>
                                    <th class="bg-light" width="7%"><spring:message code="list.detail.id1" text="상세보기"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${tbCustUnUsedCouponList}" varStatus="status">
                                    <tr class="detailRow">
                                        <td class="text-center">${status.index + 1}</td>
                                        <td class="text-center">
                                            <div style="overflow: hidden;
              margin: auto;
              text-overflow: ellipsis;
              white-space: nowrap;
              width: 250px;
              display: block;">${item.title}
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.serviceType == 2}">탁송</c:if>
                                            <c:if test="${item.serviceType == 3}">맛집</c:if>
                                            <c:if test="${item.serviceType == 4}">마트</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.orderTypeCode == '00'}">전체</c:if>
                                            <c:if test="${item.orderTypeCode == '20'}">인수대행</c:if>
                                            <c:if test="${item.orderTypeCode == '21'}">반납대행</c:if>
                                            <c:if test="${item.orderTypeCode == '22'}">마이카탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '23'}">올레길탁송</c:if>
                                            <c:if test="${item.orderTypeCode == '30'}">맛집배달</c:if>
                                            <c:if test="${item.orderTypeCode == '31'}">맛집포장</c:if>
                                            <c:if test="${item.orderTypeCode == '32'}">맛집예약</c:if>
                                            <c:if test="${item.orderTypeCode == '33'}">테이블주문</c:if>
                                            <c:if test="${item.orderTypeCode == '40'}">마트배달</c:if>
                                            <c:if test="${item.orderTypeCode == '41'}">마트포장</c:if>
                                        </td>
                                        <td class="text-center">
                                                ${item.dcAmt}
                                            <c:if test="${item.dcRateType == 1}">원</c:if>
                                            <c:if test="${item.dcRateType == 2}">%</c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${item.useYn == 0}">미사용</c:if>
                                            <c:if test="${item.useYn == 1}">사용</c:if>
                                        </td>
                                        <td class="text-center">${item.insertDate}</td>
                                        <td class="text-center">${item.expireDate}</td>
                                        <td class="text-center" style="padding-right: 8px !important;">
                                            <button type="button" class="btn btn-primary btn_coupon_detail" couponNo="${item.couponNo}" style="display: flex; align-items: center; padding: 5px; margin: 0 auto">
                                                <i class="fa fa-ticket-alt"></i>
                                                <span class="m-l-5"><spring:message code="list.detail.list1" text="쿠폰상세"/></span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%@include file="../../../common/include_kakao_map_js.jsp" %>
<script>
    $(() => {
        $(".btn_list").click(() => {
            location.href = "${path}/board/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName=&custTel=";
        });

        $(".btn_up").click(() => {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="수정에 실패하였습니다."/>";

            let url = "${path}/api/user/cust/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);

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
                        $.ajax({
                            type: "PUT",
                            url,
                            data: JSON.stringify(req),
                            contentType: "application/json",
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(updatesussmsg);
                                    location.href="${path}/board/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName="
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

        $(".btn_coupon_detail").click(function() {
            let couponNo = $(this).attr('couponNo');
            location.href = "${path}/coupon/management/detail?couponNo=" + couponNo;
        });


        $("#selectAddr").click(function() {
            let word = $(".selectArea2 option:checked").text()
            let code = $(".selectArea2").val();


            $("#areaTable").append(
                " <tr >" +
                "     <td class=\"store_text\">\n" +
                word+
                "     </td>\n" +
                "     <td class=\"store_text\">\n" +
                word+
                "     </td>\n" +
                "     <td class=\"store_text\">\n" +
                word+
                "     </td>\n" +
                " </tr>"
            );
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
                    for(var i = 0 ; i < list.length ; i++){
                        $(".selectArea2").append(
                            "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                        )
                    }
                }
            });
        });


    });

    function inputDataCheck(args) {
        let emptyCustNameMsg = "<spring:message code="list.script.pleaseenterantitle1" text="이름을 입력해주세요"/>";
        let emptyCustTelMsg = "<spring:message code="list.script.pleaseenterantitle1" text="전화번호를 입력해주세요"/>";
        if (isNull(args.custName)) {
            return alert_focus("custName", emptyCustNameMsg);
        } else if (isNull(args.custTel)) {
            return alert_focus("custTel", emptyCustTelMsg);
        }

        return true;
    }
</script>
</body>
</html>
