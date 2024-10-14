<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.platformno리ticeregistration12" text="이벤트 발송내역"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae  | <spring:message code="list.detail.platformno리ticeregistration12" text="이벤트 발송내역"/></title>
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

    /* Global CSS */
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement12" text="가맹점"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="이벤트 발송내역"/><%--상품--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="상세"/><%--상품--%></a></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration1" text="이벤트 발송현황 상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation12" text="기본정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation12" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" name="logNo" value="${tbMannaEventPush.logNo}">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 일련번호"/></td>
                                        <td width="35%">${tbMannaEventPush.evntSeqNo}</td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 제목"/></td>
                                        <td>${tbMannaEventPush.evTitle}</td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="입력일시"/></td>
                                        <td><javatime:format value="${tbMannaEventPush.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="발송건수"/></td>
                                        <td>${tbMannaEventPush.sendCnt} 건</td>
                                    </tr>

                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="그룹 코드(ext)"/></td>
                                        <td>${tbMannaEventPush.grCode}</td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="그룹 명"/></td>
                                        <td>${tbMannaEventPush.grName}</td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="발송대상"/></td>
                                        <td>${tbMannaEventPush.param1} 명</td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="발송대상 주문건수"/></td>
                                        <td>${tbMannaEventPush.param2} 건</td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 시작일"/></td>
                                        <td><javatime:format value="${tbMannaEventPush.evStartDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="공유가게리스트"/></td>
                                        <td>${tbMannaEventPush.param3}</td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 종료일"/></td>
                                        <td><javatime:format value="${tbMannaEventPush.evEndDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 배달 구분"/></td>
                                        <td>
                                            <c:if test="${tbMannaEventPush.evDvryType == 1}">배달</c:if>
                                            <c:if test="${tbMannaEventPush.evDvryType == 2}">포장</c:if>
                                            <c:if test="${tbMannaEventPush.evDvryType == 3}">대기</c:if>
                                            <c:if test="${tbMannaEventPush.evDvryType == 4}">예약</c:if>
                                            <c:if test="${tbMannaEventPush.evDvryType == 5}">테이블</c:if>
                                        </td>

                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 할인금액(원/%)"/></td>
                                        <td>${tbMannaEventPush.evPrice}</td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 할인금액 최대"/></td>
                                        <td>${tbMannaEventPush.evPriceMax} 원</td>
                                    </tr>
                                    <tr  class="height-50">
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 주문 구분"/></td>
                                        <td>
                                            <c:if test="${tbMannaEventPush.evOrdType == 1}">0원배달</c:if>
                                            <c:if test="${tbMannaEventPush.evOrdType == 2}">0순위배달</c:if>
                                        </td>
                                        <td class="bg-light" width="15%"><spring:message code="list.detail.postclassification1" text="이벤트 할인"/></td>
                                        <td>${tbMannaEventPush.evPrice}</td>
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
                       <%-- <span style="display: flex; align-items: center; margin-left: auto">
                            <button type="button" class="btn btn-primary btn_up m-r-5" style="display: flex; align-items: center">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5"><spring:message code="list.detail.enrollment1" text="수정"/></span>
                            </button>
                        </span>--%>
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


            req.smsYn = (req.smsYn == "on") ? "1": "0";
            req.pushMarketingYn = (req.pushMarketingYn == "on") ? "1": "0";
            req.pushNoticeYn = (req.pushNoticeYn == "on") ? "1": "0";
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
