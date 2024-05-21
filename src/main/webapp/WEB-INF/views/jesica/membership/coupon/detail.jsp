<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Pick-Order | <spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 관리"/></title>

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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="쿠폰 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 상세"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation1" text="기본정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation1" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
              <%--  <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation1" text="발급 현황"/>&lt;%&ndash;<spring:message code="merchandise.detail.tab2" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation1" text="발급 현황"/>&lt;%&ndash;<spring:message code="merchandise.detail.tab2" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                    </a>
                </li>--%>
            </ul>
            <div class="tab-content" style="padding: 15px 15px 5px 15px">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" name="modUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰번호"/></td>
                                    <td><input type="text" name="cpnNo" class="form-control width-full cpnNo" maxlength="150" value="${body.data.cpnNo}" readonly></td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="변경불가"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰명"/></td>
                                    <td><input type="text" name="cpnTitle" class="form-control width-full cpnTitle" maxlength="150" value="${body.data.cpnTitle}"></td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰명을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50" width="15%" ><spring:message code="list.detail.postclassification1" text="쿠폰 사용여부"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnUseYn" class="cpnUseYn" value="Y" style="margin-right: 5px" <c:if test="${body.data.cpnUseYn == 'Y'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="사용"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnUseYn" class="cpnUseYn" value="N" style="margin-right: 5px" <c:if test="${body.data.cpnUseYn == 'N'}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="정지"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용여부를 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50" width="15%" ><spring:message code="list.detail.postclassification1" text="쿠폰 발급기준"/></td>
                                    <td  <c:if test="${body.data.issuedType == 'B' || 'S'}"> style="display:none;"</c:if>>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedType" class="issuedType" value="D" style="margin-right: 5px" <c:if test="${body.data.issuedType == 'D'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="조건충족시"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedType" class="issuedType" value="T" style="margin-right: 5px" <c:if test="${body.data.issuedType == 'T'}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="지정한시점"/></span>
                                        </label>
                                    </td>
                                    <td <c:if test="${body.data.issuedType != 'B' || 'S'}">style="display:none;" </c:if>>
                                        <c:if test="${body.data.issuedType == 'B'}">일괄지급</c:if>
                                        <c:if test="${body.data.issuedType == 'S'}">스탬프지급</c:if>
                                        <input type="hidden" name="issuedType" value="${body.data.issuedType}">
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 발급기준을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="issuedCondition-form" <c:if test="${body.data.issuedType != 'D'}">style="display:none;" </c:if>>
                                    <td class="bg-light height-50" width="15%" ><spring:message code="list.detail.postclassification1" text="쿠폰 발급조건"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="D" style="margin-right: 5px" <c:if test="${body.data.issuedCondition == 'D'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="주문횟수충족"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="R" style="margin-right: 5px" <c:if test="${body.data.issuedCondition == 'R'}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="회원가입완료"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 발급조건을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50" width="15%"><spring:message code="list.detail.postclassification1" text="할인 금액 구분"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="discountType" value="D" id="D" style="margin-right: 5px" <c:if test="${body.data.discountType == 'D'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="주문금액"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker " style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="할인 금액 구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.postclassification1" text="쿠폰 사용기간 구분"/></td>
                                    <td>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnPeriodType" class="cpnPeriodType" value="D" style="margin-right: 5px" <c:if test="${body.data.cpnPeriodType == 'D'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="직접설정"/></span>
                                        </label>
                                        <label style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnPeriodType" class="cpnPeriodType" value="S" style="margin-right: 5px" <c:if test="${body.data.cpnPeriodType == 'S'}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="발급일로부터"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용기간 구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="cpnPeriod-form" <c:if test="${body.data.cpnPeriodType == 'S'}">style="display: none;" </c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="쿠폰 사용기간"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control cpnPeriodS background-white"  name="cpnPeriodS" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                        </label> ~ &nbsp;
                                        <label>
                                            <input type="text" class="form-control cpnPeriodE background-white"  name="cpnPeriodE" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 사용기간을 작성하세요."/>
                                    </td>
                                </tr>
                                <tr id="cpnPeriodLimit-form" <c:if test="${body.data.cpnPeriodType == 'D'}">style="display: none;" </c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="쿠폰 사용기간"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control validDay background-white"  name="cpnPeriodLimit" value="${body.data.cpnPeriodLimit}">
                                            <span>일 후 만료</span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 사용기간를 작성하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="쿠폰 발급 시작/종료"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control periodS background-white" name="periodS" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                        </label>
                                        <label>
                                            <input type="text" class="form-control periodE background-white" name="periodE" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 발급가능기간을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="할인방식"/></td>
                                    <td>
                                        <div style="display: flex; align-items: center">
                                            <span class="m-r-20">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="disType" class="disType" value="1" style="margin-right: 5px" <c:if test="${body.data.disType == 1}">checked</c:if>>
                                                    <span><spring:message code="list.detail.tothewhole1" text="할인금액"/></span>
                                                </label>
                                                <label style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="disType" class="disType" value="2" style="margin-right: 5px" <c:if test="${body.data.disType == 2}">checked</c:if>>
                                                    <span><spring:message code="list.detail.affiliate1" text="할인률"/></span>
                                                </label>
                                            </span>
                                            <span>
                                                <input type="text" class="form-control discountAmt" name="discountAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.discountAmt}">
                                                <span id="amt-form" <c:if test="${body.data.disType == 2}">style="display: none"</c:if>>원</span>
                                                <span id="rate-form" <c:if test="${body.data.disType == 1}">style="display: none"</c:if>>%</span>
                                            </span>
                                        </div>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 할인방식을 선택 후 값 또는 비율을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰 사용가능 주문 금액"/></td>
                                    <td>
                                        <input type="text" name="cpnUseLimit" class="form-control cpnUseLimit" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.cpnUseLimit}">
                                        <span>원</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용가능 주문 금액을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰 적용 주문 횟수"/></td>
                                    <td>
                                        <input type="text" name="ordCnt" class="form-control ordCnt"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.ordCnt}">
                                        <span>개</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 적용 주문 횟수를 입력해주세요"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="최대 할인 금액"/></td>
                                    <td>
                                        <input type="text" name="maxDisAmt" class="form-control maxDisAmt"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.maxDisAmt}">
                                        <span>원</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 적용 주문 횟수를 입력해주세요"/>
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

<script>
    const date = new Date(); //각 날짜 초기 세팅 date객체
    const dateClasses = ['.periodS', '.periodE', '.cpnPeriodS', '.cpnPeriodE'];
    const cpnNo = document.getElementsByName('cpnNo')[0].value;

    $(() => {
        /**
         * author june
         */

        //각 일자 초기 세팅
        dateClasses.forEach((dateClass) => {
            let date;
            $(dateClass).datepicker({
                calendarWeeks: false,
                todayHighlight: true,
                autoclose: true,
                format: "yyyy-mm-dd",
                language: "kr"
            });
            if (dateClass.includes('periodS')) {
                date = '${body.data.periodS}';
            } else if (dateClass.includes('periodE')){
                date = '${body.data.periodE}';
            } else if (dateClass.includes('cpnPeriodS')){
                date = '${body.data.cpnPeriodS}';
            } else if (dateClass.includes('cpnPeriodE')){
                date = '${body.data.cpnPeriodE}';
            }
            date = date.substring(0, 11);
            $(dateClass).datepicker('setDate', date);
        });


        //쿠폰 발급기준 - 조건충족시 발급조건 추가
        $(".issuedType").click((e) => {
            let value = e.target.value;
            let issuedConditionForm = document.getElementById('issuedCondition-form');
            switch (value) {
                case 'D':
                    issuedConditionForm.style.display = 'table-row'
                    break;
                case 'T':
                    issuedConditionForm.style.display = 'none'
                    break;
            }
        });

        //할인방식에 따른 form(원, %) 노출 선택
        $(".disType").click((e) => {
            let value = parseInt(e.target.value);
            let amtForm = document.getElementById('amt-form');
            let rateForm = document.getElementById('rate-form');

            switch (value) {
                case 1:
                    amtForm.style.display = 'inline'
                    rateForm.style.display = 'none';
                    $(".discountAmt").attr("maxlength", 15);
                    $(".discountAmt").val(`${body.data.discountAmt}`);
                    $(".discountAmt").removeClass("rate-limit");
                    break;
                case 2:
                    amtForm.style.display = 'none'
                    rateForm.style.display = 'inline';
                    if($(".discountAmt").val() > 100){
                        $(".discountAmt").val(100);
                    }
                    $(".discountAmt").attr("maxlength", 3);
                    $(".discountAmt").addClass("rate-limit");
                    break;
            }
        });


        //쿠폰 사용기간 구분
        $(".cpnPeriodType").click((e) => {
            let value = e.target.value;
            let cpnPeriodForm = document.getElementById('cpnPeriod-form');
            let cpnPeriodLimitForm = document.getElementById('cpnPeriodLimit-form');

            switch (value) {
                case 'D':
                    cpnPeriodForm.style.display = 'table-row'
                    cpnPeriodLimitForm.style.display = 'none';
                    break;
                case 'S':
                    cpnPeriodForm.style.display = 'none'
                    cpnPeriodLimitForm.style.display = 'table-row';
                    break;
            }
        });

        $(".btn_list").click(() => {
            location.href = "${path}/membership/coupon/list";
        });

        $(".btn_up").click(() => {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="수정에 실패하였습니다."/>";

            let url = "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/coupon";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);
            req.cpnNo = Number(req.cpnNo);
            req.discountAmt = Number(req.discountAmt);
            req.ordCnt = Number(req.ordCnt);
            req.cpnUseLimit = Number(req.cpnUseLimit);
            req.maxDisAmt = Number(req.maxDisAmt);
            req.cpnPeriodLimit = Number(req.cpnPeriodLimit);
            req.periodS = req.periodS.replaceAll("-","").replaceAll("-","");
            req.periodE = req.periodE.replaceAll("-","").replaceAll("-","");
            req.cpnPeriodS = req.cpnPeriodS.replaceAll("-","").replaceAll("-","");
            req.cpnPeriodE = req.cpnPeriodE.replaceAll("-","").replaceAll("-","");

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
                            type: "PATCH",
                            url: "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/coupon",
                            data: req,
                            contentType: "application/json",
                            dataType: "json",
                            beforeSend: function (xhr) {
                                xhr.setRequestHeader("authKey", "$2b$10$AInuqBy72feWtpZ/xYa7a.x7myRhz9VZ9QqRtazEVtlWgEgi9NO5y");
                                xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                            },
                            success: function (data) {
                                if (data.resCode == 0000) {
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
    });

    $(document).on("keyup",".rate-limit",function(){
        if($(this).val() > 100) {
            $(this).val(100);
        }
    });

    function inputDataCheck(args) {
        let emptyTitleMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰명을 입력해주세요"/>";
        let emptyDiscountAmtMsg = "<spring:message code="list.script.pleaseenterantitle1" text="할인금액 또는 할인율을 입력해주세요"/>";
        let emptyCpnUseLimitMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰 사용가능 주문 금액을 입력해주세요"/>";
        let emptyOrdCntMsg = "<spring:message code="list.script.pleaseenteransubject1" text="ㅌㅇㄴㅇ 횟수를 입력해주세요."/>";
        let emptyCpnPeriodTypeMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰 사용기간을 입력해주세요"/>";
        let emptyMaxDisAmtMsg = "<spring:message code="list.script.pleaseenteransubject1" text="최대 할인금액을 입력해주세요"/>";

        if (isNull(args.cpnPeriodLimit) && args.cpnPeriodType == 'S') {
            return alert_focus("cpnPeriodLimit", emptyCpnPeriodTypeMsg);
        } else if (isNull(args.cpnTitle)) {
            return alert_focus("cpnTitle", emptyTitleMsg);
        } else if (isNull(args.cpnUseLimit)) {
            return alert_focus("cpnUseLimit", emptyCpnUseLimitMsg);
        }  else if (isNull(args.discountAmt)) {
            return alert_focus("discountAmt", emptyDiscountAmtMsg);
        } else if (isNull(args.ordCnt)) {
            return alert_focus("ordCnt", emptyOrdCntMsg);
        } else if (isNull(args.maxDisAmt)) {
            return alert_focus("maxDisAmt", emptyMaxDisAmtMsg);
        }

        return true;
    }
</script>
</body>
</html>
