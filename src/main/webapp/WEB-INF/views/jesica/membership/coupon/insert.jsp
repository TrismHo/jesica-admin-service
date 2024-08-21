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
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 등록"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
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
                            <input type="hidden" name="putUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰명"/></td>
                                    <td><input type="text" name="cpnTitle" class="form-control width-full cpnTitle" maxlength="150" value=""></td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰명을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50" width="15%" ><spring:message code="list.detail.postclassification1" text="쿠폰 사용여부"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnUseYn" class="cpnUseYn" value="Y" style="margin-right: 5px" checked>
                                            <span><spring:message code="list.detail.tothewhole1" text="사용"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnUseYn" class="cpnUseYn" value="N" style="margin-right: 5px" >
                                            <span><spring:message code="list.detail.affiliate1" text="정지"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용여부를 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50" width="15%" ><spring:message code="list.detail.postclassification1" text="쿠폰 발급기준"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedType" class="issuedType" value="D" style="margin-right: 5px" checked>
                                            <span><spring:message code="list.detail.tothewhole1" text="조건충족시"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedType" class="issuedType" value="T" style="margin-right: 5px" >
                                            <span><spring:message code="list.detail.affiliate1" text="지정한시점"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 발급기준을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="issuedCondition-form" >
                                    <td class="bg-light height-50" width="15%" ><spring:message code="list.detail.postclassification1" text="쿠폰 발급조건"/></td>
                                    <td>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="D" style="margin-right: 5px" checked>
                                            <span><spring:message code="list.detail.tothewhole1" text="주문횟수충족"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="R" style="margin-right: 5px" >
                                            <span><spring:message code="list.detail.affiliate1" text="회원가입완료"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="F" style="margin-right: 5px" >
                                            <span><spring:message code="list.detail.affiliate1" text="친구초대"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="B" style="margin-right: 5px" >
                                            <span><spring:message code="list.detail.affiliate1" text="일괄지급"/></span>
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
                                            <input type="radio" name="discountType" value="D" id="D" style="margin-right: 5px" checked>
                                            <span><spring:message code="list.detail.tothewhole1" text="주문금액"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker " style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="할인 금액 구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.postclassification1" text="쿠폰 유효기간 구분"/></td>
                                    <td>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnPeriodType" class="cpnPeriodType" value="D" style="margin-right: 5px"  checked>
                                            <span><spring:message code="list.detail.tothewhole1" text="직접설정"/></span>
                                        </label>
                                        <label style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnPeriodType" class="cpnPeriodType" value="S" style="margin-right: 5px" >
                                            <span><spring:message code="list.detail.affiliate1" text="앱 등록일로부터"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 유효기간 구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="cpnPeriod-form" >
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="쿠폰 유효기간"/></td>
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
                                <tr id="cpnPeriodLimit-form" style="display: none;">
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="쿠폰 유효기간"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control validDay background-white"  name="cpnPeriodLimit" value="1">
                                            <span>일 후 만료</span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 사용기간를 작성하세요."/>
                                    </td>
                                </tr>
                                <tr  >
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
                                <tr  id="periodSTr-form" style="display: none">
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="지정한 시점 날짜"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control issuedDate background-white" name="issuedDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
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
                                                    <input type="radio" name="disType" class="disType" value="1" style="margin-right: 5px" checked>
                                                    <span><spring:message code="list.detail.tothewhole1" text="할인금액"/></span>
                                                </label>
                                                <label style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="disType" class="disType" value="2" style="margin-right: 5px">
                                                    <span><spring:message code="list.detail.affiliate1" text="할인률"/></span>
                                                </label>
                                            </span>
                                            <span>
                                                <input type="text" class="form-control discountAmt" name="discountAmt" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="0">
                                                <span id="amt-form" >원</span>
                                                <span id="rate-form" style="display: none">%</span>
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
                                        <input type="text" name="cpnUseLimit" class="form-control cpnUseLimit" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="0">
                                        <span>원</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용가능 주문 금액을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr id="ordCnt-form">
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰 적용 주문 횟수"/></td>
                                    <td>
                                        <input type="text" name="ordCnt" class="form-control ordCnt"oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="0">
                                        <span>개</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 적용 주문 횟수를 입력해주세요"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="최대 할인 금액"/></td>
                                    <td>
                                        <input type="text" name="maxDisAmt" class="form-control maxDisAmt"oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="0" disabled="true">
                                        <span>원</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="최대 할인 금액을 입력해주세요."/>
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
                                <span class="m-l-5"><spring:message code="list.detail.enrollment1" text="생성"/></span>
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
    const dateClasses = [ '.periodS', '.periodE', '.cpnPeriodS', '.cpnPeriodE', '.issuedDate'];

    $(() => {
        /**
         * author june
         */

        //각 일자 초기 세팅
        dateClasses.forEach((dateClass) => {
            let date_;
            $(dateClass).datepicker({
                calendarWeeks: false,
                todayHighlight: true,
                autoclose: true,
                format: "yyyy-mm-dd",
                language: "kr"
            });
            if (dateClass.includes('periodS')) {
                date_ = date;
            } else if (dateClass.includes('periodE')){
                date_ = date;
            } else if (dateClass.includes('cpnPeriodS')){
                date_ = date;
            } else if (dateClass.includes('cpnPeriodE')){
                date_ = date;
            } else if (dateClass.includes('issuedDate')){
                date_ = date;
            }
            //date_ = date_.substring(0, 11);
            $(dateClass).datepicker('setDate', date_);
        });


          $(".issuedType").click((e) => {
            let value = e.target.value;
            let issuedConditionForm = document.getElementById('issuedCondition-form');
            let periodSTrForm = document.getElementById('periodSTr-form');
            let issuedCondition = $("[name=issuedCondition]:checked").val();
            let ordCntForm = document.getElementById('ordCnt-form');
            switch (value) {
                case 'D':
                    periodSTrForm.style.display = 'none';
                    issuedConditionForm.style.display = 'table-row'
                    if(issuedCondition == 'D'){
                        ordCntForm.style.display = 'table-row'
                    } else {
                        ordCntForm.style.display = 'none'
                    }

                    break;
                case 'T':
                    issuedConditionForm.style.display = 'none';
                    ordCntForm.style.display = 'none';
                    periodSTrForm.style.display = 'table-row';
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
                    $(".discountAmt").removeClass("rate-limit");
                    $(".maxDisAmt").attr("disabled", true);
                    $(".maxDisAmt").val("0");
                    break;
                case 2:
                    amtForm.style.display = 'none'
                    rateForm.style.display = 'inline';
                    if($(".discountAmt").val() > 100){
                        $(".discountAmt").val(100);
                    }
                    $(".discountAmt").attr("maxlength", 3);
                    $(".discountAmt").addClass("rate-limit");
                    $(".maxDisAmt").val("0");
                    $(".maxDisAmt").attr("disabled", false);
                    break;
            }
        });




        //쿠폰 유효기간 구분
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

        //쿠폰 주문횟수충족 선택시 보이게
        $(".issuedCondition").click((e) => {
            let value = e.target.value;
            let ordCntForm = document.getElementById('ordCnt-form');
            let issuedType = $("[name=issuedType]:checked").val();

            if(value == 'D' && issuedType == 'D'){
                ordCntForm.style.display = 'table-row';
            }else {
                ordCntForm.style.display = 'none';
            }
        });

        $(".btn_list").click(() => {
            location.href = "${path}/membership/coupon/list";
        });

        $(".btn_up").click(() => {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="등록 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="등록"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="등록되었습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="등록에 실패하였습니다."/>";

            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);
            let cpnPeriodSPick = req.cpnPeriodS + "T00:00:00";
            let cpnPeriodEPick = req.cpnPeriodE + "T23:59:59";

            req.discountAmt = Number(req.discountAmt);
            req.ordCnt = Number(req.ordCnt);
            req.cpnUseLimit = Number(req.cpnUseLimit);
            if(!req.maxDisAmt) {
                req.maxDisAmt = Number(0);
            }else {
                req.maxDisAmt = Number(req.maxDisAmt);
            }
            req.cpnPeriodLimit = Number(req.cpnPeriodLimit);
            req.periodS = req.periodS.replaceAll("-","").replaceAll("-","");
            req.periodE = req.periodE.replaceAll("-","").replaceAll("-","");
            req.cpnPeriodS = req.cpnPeriodS.replaceAll("-","").replaceAll("-","");
            req.cpnPeriodE = req.cpnPeriodE.replaceAll("-","").replaceAll("-","");
            if(req.issuedDate) {
                req.issuedDate = req.issuedDate.replaceAll("-","").replaceAll("-","");
            } else {
                req.issuedDate = "";
            }
            req.ordPathCd = "<spring:eval expression="@environment.getProperty('file.ordPathCd.pickOrder')" />";
            let cpnNo = null;
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
                    console.log(req)
                    if (isConfirm) {
                        $.ajax({
                            type: "POST",
                            /*url: "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/coupon",
                            url: "https://frapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/coupon",*/
                            url:"<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon-manage/coupon",
                            data: req,
                            async:false,
                            contentType: "application/json",
                            dataType: "json",
                            beforeSend: function (xhr) {
                                xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                                xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                            },
                            success: function (data) {
                                if (data.resCode == 0000) {
                                    $.ajax({
                                        type: "POST",
                                        url: "${path}/api/manna/coupon/save",
                                        data: JSON.stringify ({
                                            cpnNo: data.data.cpnNo,
                                            cpnUseYn: req.cpnUseYn,
                                            cpnTitle: req.cpnTitle,
                                            periodS: cpnPeriodSPick,
                                            periodE: cpnPeriodEPick,
                                        }),
                                        contentType: "application/json",
                                        dataType: "json",
                                        success: function (data) {
                                            if (data.result == "200") {
                                                alert(updatesussmsg);
                                                location.href="${path}/membership/coupon/list";
                                            } else {
                                                alert(editfailed);
                                                return;
                                            }
                                        }
                                    });
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
        let emptyOrdCntMsg = "<spring:message code="list.script.pleaseenteransubject1" text=" 횟수를 입력해주세요."/>";
        let emptyCpnPeriodTypeMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰 유효기간을 입력해주세요"/>";
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

        if(args.discountAmt < "1"){
            return alert_focus("discountAmt", "할인금액/할인률은 1이상 가능합니다.");
        }

        return true;
    }
</script>
</body>
</html>
