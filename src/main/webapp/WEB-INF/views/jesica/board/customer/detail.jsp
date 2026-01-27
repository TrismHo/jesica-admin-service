<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.platformno리ticeregistration12" text="회원 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae r | <spring:message code="list.detail.platformno리ticeregistration12" text="회원 관리"/></title>
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
    .border-bottom-d4 td {
       border:  1px solid #d6d6d6;
    }
    label {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        cursor: pointer;
    }

    [type="checkbox"] {
        appearance: none;
        position: relative;
        border: max(2px, 0.1em) solid gray;
        border-radius: 1.25em;
        width: 2.25em;
        height: 1.25em;
    }

    [type="checkbox"]::before {
        content: "";
        position: absolute;
        left: 0;
        width: 1em;
        height: 1em;
        border-radius: 50%;
        transform: scale(0.8);
        background-color: gray;
        transition: left 250ms linear;
    }

    [type="checkbox"]:checked {
        background-color: tomato;
        border-color: tomato;
    }

    [type="checkbox"]:checked::before {
        background-color: white;
        left: 1em;
    }

    [type="checkbox"]:disabled {
        border-color: lightgray;
        opacity: 0.7;
        cursor: not-allowed;
    }

    [type="checkbox"]:disabled:before {
        background-color: lightgray;
    }

    [type="checkbox"]:disabled + span {
        opacity: 0.7;
        cursor: not-allowed;
    }

    [type="checkbox"]:focus-visible {
        outline-offset: max(2px, 0.1em);
        outline: max(2px, 0.1em) solid tomato;
    }

    [type="checkbox"]:enabled:hover {
        box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    div.dataTables_wrapper div.dataTables_processing {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 200px;
        margin-left: -100px;
        margin-top: -26px;
        text-align: center;
        padding: 1em 0;
        z-index: 5;
        top: 150px;
        border:1px solid #ddd;
    }
    .cust-coupon-list {
        width: 100%;
    }
    #searchCouponCustTab{
        border-bottom: 1px solid #e4e7ea !important;
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="회원 관리"/><%--상품--%></a></li>
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
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation12" text="보유쿠폰"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation12" text="보유쿠폰"/></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form name="update_form" id="update_form" class="update_form">
                            <input class="custNo" type="hidden" name="custNo" value="${tbCust.custNo}">
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
                                                        <span><spring:message code="list.detail.deliveryman1" text="온동네"/></span>
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
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="로그인 ID"/></td>
                                        <td>${tbCust.loginId}</td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="로그인 ID 입니다.(변경불가)"/>
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
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="추천가맹점명"/></td>
                                        <td>
                                            <span style="font-weight: bold; color: red;"><c:if test="${tbCust.extRecommStCode}"> [${tbCust.extRecommStCode}] </c:if>  </span> ${tbCust.extRecommStName}
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="추천가맹점명 입니다."/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="추천인(전화번호)"/></td>
                                        <td>
                                            <c:if test=" ${tbCust.recommCustName != null}"> ${tbCust.recommCustName} (${tbCust.recommCustTel})</c:if>
                                            <c:if test=" ${tbCust.recommCustName == null}"> 추천인 없음 </c:if>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="추천인과 전화번호입니다."/>
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
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="계정 상태"/></td>
                                        <td  class="height-50">
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="0" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole1" text="삭제"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="1" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate1" text="정상"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="dataStatus" class="dataStatus" value="2" style="margin-right: 5px" <c:if test="${tbCust.dataStatus == 2}">checked</c:if>>
                                                <span><spring:message code="list.detail.deliveryman12" text="정지"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="계정 상태를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="가입일자"/></td>
                                        <td><%--<javatime:format value="${tbCust.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />--%>${tbCust.insertDate}</td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="가입일자입니다.(변경불가)"/>
                                        </td>
                                    </tr>
                                    <tr class="height-50">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="친구수"/></td>
                                        <td>
                                            ${tbCust.recommCount} 명
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="친구수 입니다."/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.map" text="친구목록"/></td>
                                        <td>
                                            <div class="panel-body">
                                                <table id="testTable" class="display table table-bordered w-100 table-striped  ">
                                                    <thead>
                                                    <th class="text-center" style="width: 46px"><spring:message code="list.word.no" text="순번"/></th>
                                                    <th class="text-center" style="width: 84px;">이름</th>
                                                    <th class="text-center" style="width: 98px;">전화번호</th>
                                                    <th class="text-center" style="width: 98px;">이용횟수</th>
                                                    <th class="text-center" style="width: 98px;">가입일</th>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e; overflow: auto; height: 150px;">
                                                <ul class="attachList p-0" style="margin-bottom:0px;" >
                                                    <li >
                                                        <div class="panel-body">
                                                            <table id="areaTable" class="display table table-bordered w-100 table-striped border-bottom-d4">
                                                                <tbody>
                                                                <c:choose>
                                                                    <c:when test="${friends.size() > 0}">
                                                                        <c:forEach items="${friends}" var="item" varStatus="status" step="1">
                                                                            <tr class="" >
                                                                                <td style="width:46px;" class="text-center">${status.index + 1}</td>
                                                                                <td style="width:84px" class="text-center">${item.custName}</td>
                                                                                <td style="width:98px;" class="text-center formatPhone">${item.custTel}</td>
                                                                                <td style="width:98px;" class="text-center">${item.useCount} 회</td>
                                                                                <td style="width:98px;" class="text-center">${item.insertdate }</td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <tr class="" >
                                                                            <td colspan="5" class="text-center border-bottom-0"> 데이터가 없습니다. </td>
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
                                        <td class="text-danger-darker"><spring:message code="list.description.addresssearchautosettingmessage" text="친구추천으로 가입한 친구목록입니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification1" text="수신여부"/></td>
                                        <td>
                                            <table class="table table-bordered">
                                                <thead>
                                              <%--  <th class="bg-light">SMS 수신여부</th>--%>
                                                <th class="bg-light">주문 PUSH 수신여부</th>
                                                <%--<th class="bg-light">공지이벤트 PUSH 수신여부</th>--%>
                                                <th class="bg-light">마케팅 PUSH 수신여부</th>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                   <%-- <td>
                                                        <label>
                                                            <input role="switch" type="checkbox" name="smsYn" class="smsYn"   <c:if test="${tbCust.smsYn == 1}">checked</c:if>/>
                                                            <span>SMS수신</span>
                                                        </label>
                                                    </td>--%>
                                                    <td>
                                                        <label>
                                                            <input role="switch" type="checkbox" name="pushOrderYn" class="pushOrderYn" <c:if test="${tbCust.pushOrderYn == 1}">checked</c:if>/>
                                                            <span>주문 PUSH 수신</span>
                                                        </label>
                                                    </td>
                                                   <%-- <td>
                                                        <label>
                                                            <input role="switch" type="checkbox" name="pushNoticeYn" class="pushNoticeYn"  <c:if test="${tbCust.pushNoticeYn == 1}">checked</c:if> />
                                                            <span>공지이벤트 PUSH 수신</span>
                                                        </label>
                                                    </td>--%>
                                                    <td>
                                                        <label>
                                                            <input role="switch" type="checkbox" name="pushMarketingYn" class="pushMarketingYn"   <c:if test="${tbCust.pushMarketingYn == 1}">checked</c:if>/>
                                                            <span>마케팅 PUSH 수신</span>
                                                        </label>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.map" text="지역"/></td>
                                        <td>
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
                                 <%--   <tr>
                                       &lt;%&ndash; <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="캐쉬"/></td>
                                        <td><input type="text" class="form-control" value="${tbCust.cash}" readonly></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="고객 보유 캐쉬입니다.(변경불가)"/>
                                        </td>&ndash;%&gt;
                                      <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="캐쉬"/></td>
                                        <td>
                                            <table>
                                               &lt;%&ndash; <tr>
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
                                                </tr>&ndash;%&gt;
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
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="누적주문횟수"/></td>
                                        <td><input type="text" class="form-control" value="${tbCust.useCount}" readonly> 회</td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage1" text="누적된 주문횟수입니다."/>
                                        </td>
                                    </tr>

                                   <%-- <tr class="height-50">
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
                                    </tr>--%>
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
                              <c:if test="${permission == 2}">
                                  <button type="button" class="btn btn-primary btn_up m-r-5" style="display: flex; align-items: center">
                                    <i class="fa fa-check"></i>
                                    <span class="m-l-5"><spring:message code="list.detail.enrollment1" text="수정"/></span>
                                </button>
                              </c:if>
                        </span>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-2">
                   <%-- <div style="width: 100%;">
                        <form class="form-provide-search" id="form-provide-search">
                            <div class="search-box">
                                <div class="inner-search-box">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 ">
                                            <input class="cpnNo" type="hidden" name="custNo" value="${tbCust.custNo}">
                                            <table  class="table table-condensed table-bordered">
                                                <tbody>
                                                <tr>
                                                    <td class="bg-light"><strong><spring:message code="list.search.registrationperiod1" text="생성일"/></strong></td>
                                                    <td>
                                                        <label>
                                                            <input type="text" class="form-control periodS background-white"  name="periodS" value="" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                        </label>
                                                        <label>
                                                            <input type="text" class="form-control periodE background-white" name="periodE" value="" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                        </label>
                                                    </td>
                                                    <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="쿠폰 사용 여부"/></strong></td>
                                                    <td style="border-right: none">
                                                        <select class="form-control" name="useYn">
                                                            <option value="" value=""/>전체</option>
                                                            <option value="Y"/>사용</option>
                                                            <option value="N"/>미사용</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="검색어 입력"/></strong></td>
                                                    <td style="border-right: none" colspan="3">
                                                        <label>
                                                            <select class="form-control keywordType" name="keywordType" style="width: 110px">
                                                                <option value="cpnCode" ><spring:message code="list.search.title1" text="쿠폰코드"/></option>
                                                            </select>
                                                            <input type="text" class="form-control width-150" name="cpnCode" value="" maxlength="150">
                                                            <input type="button" class="btn btn-primary searchCouponProvide" style="margin-bottom: 3px;" value="검색">
                                                        </label>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>--%>
                    <div class="list m-t-10">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xl-12 ui-sortable">
                                    <div class="card_">
                                        <div class="card-bod">
                                            <div class="panel-body">
                                                <%--/<table id="searchCouponCustTab" class="display table table-bordered w-100 table-striped cust-list " style="width:100%">--%>
                                                <table id="searchCouponCustTab" class="display table table-bordered  table-striped cust-coupon-list">
                                                    <thead>
                                                        <th class="text-center" style="width: 50px;" >번호</th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰일련번호"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰명"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰코드"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="할인금액(할인율)"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용가능 주문금액"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="최대 할인금액"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용가능일"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용만료일"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용여부"/></th>
                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용일"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="주문번호"/></th>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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

    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            }
            else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    var newExportAction = function (e, dt, button, config) {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        /*if(limitYn ==  && getDateDiff(startDate, endDate) > 365) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {*/
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;

        dt.one('preXhr', function (e, s, data) {
            // Just this once, load all data from the server...
            data.start = 0;
            data.length = 2147483647;

            dt.one('preDraw', function (e, settings) {
                // Call the original action function
                oldExportAction(self, e, dt, button, config);

                dt.one('preXhr', function (e, s, data) {
                    // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                    // Set the property to what it was before exporting.
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });

                // Reload the grid with the original page. Otherwise,
                // API functions like table.cell(this) don't work properly.
                setTimeout(dt.ajax.reload, 0);

                // Prevent rendering of the full data to the DOM
                return false;
            });
        });

        // Requery the server with the new one-time export settings
        dt.ajax.reload();
        /* }*/
    };

    let table = null;
    $(() => {
        table = $("#searchCouponCustTab").DataTable({
            language :  {
                lang_set,
                "processing": "데이터 불러오는 중...",
                "info": "총 _MAX_ 건",
            }, //or lang_eng
            /*   pagingType: "full_numbers",*/
            /*   pagingType : "full_numbers",*/
            /* lengthMenu : [ [ 10, 20, 30 ,40], [ 10, 20, 30, 40] ],*/
            responsive: true,
            processing:true,
            bAutoWidth: false,
            ordering: true,
            serverSide: true,
            columns : [
                {data: "listIndex"},
                {data: "cuCpnNo"},
                {data: "cpnTitle"},
                {data: "cpnCode"},
                {data: "disTypeText",
                    render: function (data) {
                        if(data){
                            if(data.disType == "1"){
                                return countString(data.discountAmt,"원");
                            } else if(data.disType == "2"){
                                return countString(data.discountAmt,"%");
                            } else {
                                return "-";
                            }
                        }
                    }
                },
                {data: "cpnUseLimit" ,
                    render: function (data) {
                        return countString(data,"원");
                    }
                },
                {data: "maxDisAmt" ,render: function (data) {
                        return countString(data,"원");
                    }
                },
                {data: "validateFrom"},
                {data: "validateTo"},
                {data: "useYnCustom" ,
                    render: function (data) {
                      return useYnLimit(data);
                    }
                },
                {data: "useDate",
                    render: function (data) {
                        return dateFormat(data);
                    }},
                {data: "ordNo"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {targets: [8,9,10], className: "text-center",
                    render: function (data) {
                        if(data){
                            return dateFormatYYYYMMDD(data);
                        } else {
                            return "";
                        }

                    },
                },
                {targets: [3], className: "text-center",
                    render: function (data) {
                        if(data){
                            return data;
                        } else {
                            return "";
                        }
                    },
                }
            ],
            ajax : {
                url:"<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon/list/${tbCust.custNo}",
                type: "GET",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                },
                data: function (res) {
                    // var formData = objectifyForm($("#form-provide-search").serializeArray());
                    /*var param = formData;

                    param["periodS"] = param["periodS"].replaceAll("-","").replaceAll("-","");
                    param["periodE"] = param["periodE"].replaceAll("-","").replaceAll("-","");

                    param["draw"] = res.draw;
                    param["length"] = res.length;
                    param["start"] = res.start;

                    param.pageSize = param.testTable_length;
                    param.pageNo = res.start/res.length + 1;*/
                    return res;
                },
                dataSrc: function(res) {
                    console.log(data)
                    // 리스트번호
                    if(res.data){
                        var data = res.data;
                        for (let i = 0; i < data.length; i++) {
                            data[i].listIndex = i + 1
                            data[i]["number"] = i;
                            data[i]["disTypeText"] = {disType : data[i]["disType"] , discountAmt : data[i]["discountAmt"]};
                            data[i]["useYnCustom"] = {useYn : data[i]["useYn"] , validateTo : data[i]["validateTo"]};
                        }
                        res.recordsTotal = res.data.length;
                        res.recordsFiltered = res.data.length;
                        return data;
                    } else {
                        var data = {};
                        res.recordsTotal = 0;
                        res.recordsFiltered = 0;
                        return data;
                    }
                },
                statusCode: {
                    200: (response) => {
                        console.log(response)
                        // TODO
                    },
                    400: (response) => {
                        console.log(response)
                        // TODO
                    },
                    500: (response) => {
                        console.log(response)
                        // TODO
                    }
                }
            },
            layout: {
                top1: {
                    searchBuilder: {
                        liveSearch: true
                    }
                }
            },
            paging: false,
            /*responsive: true,*/
            dom: '<"row"<"col-sm-12" f><"col-sm-12"B>>t<"row"<"col-sm-12"><"col-sm-12"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            scrollCollapse: true,
            scrollY: '50vh',
            buttons: [
                /*{ extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },*/
                /*   { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
                { extend: 'excel',
                    text: '&nbsp; 엑셀 다운로드',
                    className: 'btn-sm fa fa-file-excel'
                    ,filename: '엑셀출력_'+moment().format('YYYYMMDDhhmm')
                    ,title: ''
                    ,action: newExportAction
                },
                /*    { extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
            ],
            initComplete: function (settings, json) {
                $("#searchCouponCustTab").wrap("<div style='overflow:auto; width:100%;position:relative;'></div>");
            },
        });

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


           /* req.smsYn = (req.smsYn == "on") ? "1": "0";*/
            req.pushMarketingYn = (req.pushMarketingYn == "on") ? "1": "0";
            /*req.pushNoticeYn = (req.pushNoticeYn == "on") ? "1": "0";*/
            req.pushOrderYn = (req.pushOrderYn == "on") ? "1": "0";

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
        //searchForm();
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
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
    });


    function  formatPhone(phone) {
        if (phone == null || phone.isEmpty()) {
            return "";
        }

        let _phone = phone.trim().replaceAll("-", "");
        switch (_phone.length()) {
            case 10:
                return _phone.substring(0, 3) + "-" + _phone.substring(3, 6) + "-" + _phone.substring(6);
            case 11:
                return _phone.substring(0, 3) + "-" + _phone.substring(3, 7) + "-" + _phone.substring(7);
            default:
                return _phone;
        }
    }
</script>
</body>
</html>
