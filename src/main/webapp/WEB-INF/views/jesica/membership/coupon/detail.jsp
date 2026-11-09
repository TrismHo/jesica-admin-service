<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | <spring:message code="list.detail.platformnoticeregistration1" text="쿠폰 관리"/></title>

</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter label .form-control {
        /* display: block; */
        /* margin-left: 8px; */
        /* width: 260px; */
        /* height: 34px; */
        width: 150px;
        height: 23px;
        border: 1px solid #ddd;
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
    .panel-box {
        background: #fff;
        border: 1px solid #ddd;
    }
    /* 할인방식 영역 정리 */
    .discount-setting-box {
        display: flex;
        flex-wrap: wrap;
        align-items: stretch;
        gap: 8px;
        width: 100%;
    }

    .discount-option-group {
        display: inline-flex;
        align-items: center;
        gap: 12px;
        min-height: 34px;
        padding: 6px 10px;
        border: 1px solid #ddd;
        background: #fafafa;
    }

    .discount-option-group label {
        margin-bottom: 0;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-weight: 400;
        white-space: nowrap;
    }

    .discount-option-group input[type="radio"],
    .discount-option-group input[type="checkbox"] {
        margin: 0;
    }

    .point-charge-box {
        background: #fff;
    }

    .point-charge-box label {
        color: #333;
    }

    .discount-amount-box {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        min-height: 34px;
    }

    .discount-amount-box .discountAmt {
        width: 130px;
        min-width: 130px;
    }

    .discount-unit {
        display: inline-flex;
        align-items: center;
        min-width: 18px;
        font-weight: 600;
        color: #333;
    }

    @media (max-width: 1200px) {
        .discount-setting-box {
            flex-direction: column;
            align-items: flex-start;
        }

        .discount-option-group,
        .discount-amount-box {
            width: 100%;
        }

        .discount-amount-box .discountAmt {
            width: 160px;
        }
    }
    .height-600 {
        height: 620px;
    }

    .dataTables_wrapper .dt-buttons {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        margin-left: 8px;
    }

    .dataTables_wrapper .dt-buttons .btn-excel-download {
        height: 31px;
        padding: 5px 12px;
        border-radius: 3px;
        border: 1px solid #1f6f43;
        background: #218838;
        color: #fff !important;
        font-size: 12px;
        line-height: 18px;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }

    .dataTables_wrapper .dt-buttons .btn-excel-download:hover,
    .dataTables_wrapper .dt-buttons .btn-excel-download:focus {
        background: #1e7e34;
        border-color: #1c7430;
        color: #fff !important;
        box-shadow: none;
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
    <link rel="stylesheet" href="${path}/css/jstree.css" />

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
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation1" text="쿠폰설정"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation1" text="쿠폰설정"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item " id="nav-tab-2" <c:if test="${body.data.issuedCondition != 'B'}"> style="display: none;" </c:if>>
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation1" text="쿠폰코드관리"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation1" text="쿠폰코드관리"/></span>
                    </a>
                </li>
                <li class="nav-item " id="nav-tab-3" >
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.businessinformation1" text="지급내역"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.businessinformation1" text="지급내역"/></span>
                    </a>
                </li>
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
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰사용/발급"/></td>
                                    <td>${body.data.cpnUse} / ${body.data.cpnPut}</td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용한 횟수 / 쿠폰 발급 횟수"/>
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
                                        <c:if test="${body.data.issuedType == 'B' || 'S'}">
                                            <input type="hidden" name="issuedType" value="${body.data.issuedType}">
                                        </c:if>
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
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="F" style="margin-right: 5px" <c:if test="${body.data.issuedCondition == 'F'}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="친구초대"/></span>
                                        </label>
                                        <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                            <input type="radio" name="issuedCondition" class="issuedCondition" value="B" style="margin-right: 5px" <c:if test="${body.data.issuedCondition == 'B'}">checked</c:if>>
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
                                            <input type="radio" name="discountType" value="D" id="D" style="margin-right: 5px" <c:if test="${body.data.discountType == 'D'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="주문금액"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker " style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="할인 금액 구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50"><spring:message code="list.detail.postclassification1" text="쿠폰 유효기간구분"/></td>
                                    <td>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnPeriodType" class="cpnPeriodType" value="D" style="margin-right: 5px" <c:if test="${body.data.cpnPeriodType == 'D'}">checked</c:if>>
                                            <span><spring:message code="list.detail.tothewhole1" text="직접설정"/></span>
                                        </label>
                                        <label style="display: inline-flex; align-items: center">
                                            <input type="radio" name="cpnPeriodType" class="cpnPeriodType" value="S" style="margin-right: 5px" <c:if test="${body.data.cpnPeriodType == 'S'}">checked</c:if>>
                                            <span><spring:message code="list.detail.affiliate1" text="앱 등록일로부터"/></span>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 유효기간구분을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr id="cpnPeriod-form" <c:if test="${body.data.cpnPeriodType == 'S'}">style="display: none;" </c:if>>
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
                                <tr id="cpnPeriodLimit-form" <c:if test="${body.data.cpnPeriodType == 'D'}">style="display: none;" </c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="쿠폰 유효기간"/></td>
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
                                <tr id="periodSTr-form" <c:if test="${body.data.issuedType != 'T'}">style="display: none;" </c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="지정한시점 날짜"/></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control issuedDate background-white" name="issuedDate" readonly > <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 발급가능기간을 선택하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">
                                        <spring:message code="list.detail.postclassification1" text="할인방식"/>
                                    </td>
                                    <td>
                                        <div class="discount-setting-box">

                                            <div class="discount-option-group">
                                                <label>
                                                    <input type="radio"
                                                           name="disType"
                                                           class="disType"
                                                           value="1"
                                                           <c:if test="${body.data.disType == 1}">checked</c:if>>
                                                    <span><spring:message code="list.detail.tothewhole1" text="할인금액"/></span>
                                                </label>

                                                <label>
                                                    <input type="radio"
                                                           name="disType"
                                                           class="disType"
                                                           value="2"
                                                           <c:if test="${body.data.disType == 2}">checked</c:if>>
                                                    <span><spring:message code="list.detail.affiliate1" text="할인률"/></span>
                                                </label>
                                            </div>

                                            <div class="discount-option-group point-charge-box" id="pointChangeBox">
                                                <input type="checkbox"
                                                       class="pointChangeYn"
                                                       name="pointChangeYn"
                                                       id="pointChangeYn"
                                                       <c:if test="${body.data.pointChangeYn == 'Y'}">checked</c:if>>
                                                <label for="pointChangeYn">사용잔액 포인트 전환</label>
                                            </div>

                                            <div class="discount-amount-box">
                                                <input type="text"
                                                       class="form-control discountAmt"
                                                       name="discountAmt"
                                                       oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                                                       value="${body.data.discountAmt}">

                                                <span id="amt-form"
                                                      class="discount-unit"
                                                      <c:if test="${body.data.disType == 2}">style="display: none"</c:if>>원</span>

                                                <span id="rate-form"
                                                      class="discount-unit"
                                                      <c:if test="${body.data.disType == 1}">style="display: none"</c:if>>%</span>
                                            </div>

                                        </div>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰의 할인방식을 선택 후 값 또는 비율을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰 사용가능 주문 금액"/></td>
                                    <td>
                                        <input type="text" name="cpnUseLimit" class="form-control cpnUseLimit" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.cpnUseLimit}">
                                        <span>원</span>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 사용가능 주문 금액을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr  id="ordCnt-form" <c:if test="${body.data.issuedType != 'D' || body.data.issuedCondition != 'D' }">style="display: none;" </c:if>>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="쿠폰 적용 주문 횟수"/></td>
                                    <td>
                                        <input type="text" name="ordCnt" class="form-control ordCnt"oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.ordCnt}">
                                        <span>개</span>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%">
                                        <spring:message code="list.description.entertherepresentativebasemessage1" text="쿠폰 적용 주문 횟수를 입력해주세요"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title1" text="최대 할인 금액"/></td>
                                    <td>
                                        <input type="text" name="maxDisAmt" class="form-control maxDisAmt"oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" value="${body.data.maxDisAmt}" <c:if test="${body.data.disType == 1}">disabled="true"</c:if>>
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
                    <div class="search-box search-box-inline p-0">
                        <div class="inner-search-box">
                            <form class="form-coupon-search" id="form-coupon-search">
                                <input class="cpnNo" type="hidden" name="cpnNo" value="${body.data.cpnNo}">

                                <div class="search-inline-bar">
                                    <div class="search-field search-date">
                                        <div class="search-label">생성일</div>
                                        <div class="search-control-group">
                                            <div class="date-input-wrap">
                                                <input type="text"
                                                       class="form-control startDate background-white"
                                                       name="startDate"
                                                       value=""
                                                       readonly>
                                                <i class="fas fa-calendar-alt"></i>
                                            </div>

                                            <span class="date-separator">~</span>

                                            <div class="date-input-wrap">
                                                <input type="text"
                                                       class="form-control endDate background-white"
                                                       name="endDate"
                                                       value=""
                                                       readonly>
                                                <i class="fas fa-calendar-alt"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="search-field search-keyword">
                                        <div class="search-label">검색어</div>
                                        <div class="search-control-group search-keyword-group">
                                            <select class="form-control keywordType" name="searchType">
                                                <option value="cpnCode">
                                                    <spring:message code="list.search.title1" text="쿠폰코드"/>
                                                </option>
                                                <option value="stCode">
                                                    <spring:message code="list.search.title2" text="가맹점 코드"/>
                                                </option>
                                                <option value="insertUserId">
                                                    <spring:message code="list.search.title2" text="생성자"/>
                                                </option>
                                            </select>

                                            <input type="text"
                                                   class="form-control width-150"
                                                   name="searchKeyword"
                                                   value=""
                                                   maxlength="150"
                                                   placeholder="검색어 입력">
                                        </div>
                                    </div>

                                    <div class="search-field">
                                        <div class="search-label">쿠폰생성</div>
                                        <div class="search-control-group">
                                            <input type="text"
                                                   class="form-control width-100 numberOnly"
                                                   id="publishCount"
                                                   value="0"
                                                   maxlength="5"
                                                   numberOnly>

                                            <span>개</span>

                                            <button type="button"
                                                    class="btn btn-search-inline createCoupon">
                                                <span class="fa fa-plus">&nbsp;쿠폰코드 일괄생성</span>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="search-actions">
                                        <button type="button"
                                                class="btn btn-search-inline searchCouponPublish">
                                            <i class="fa fa-search"></i>
                                            검색
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="list m-t-20 height-600">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xl-12 ui-sortable">
                                    <div class="card_">
                                        <div class="card-bod">
                                            <div class="panel-body">
                                                <table id="searchCouponDetailTab2" class="display table table-bordered w-100 table-striped cust-list ">
                                                    <thead>
                                                    <th class="text-center" style="width: 50px;" >번호</th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰코드"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="상태"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="생성일"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="생성자"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="가맹점코드"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="인당제한"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="최대제한"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="등록개수"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="잔여개수"/></th>
                                                    <th class="text-center" style="width: 130px;" ><spring:message code="list.word.no1" text=""/></th>
                                                    <th class="text-center" style="width: 130px;" ><spring:message code="list.word.no1" text=""/></th>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-3">
                    <div class="search-box search-box-inline p-0">
                        <div class="inner-search-box">
                            <form class="form-provide-search" id="form-provide-search">
                                <input class="cpnNo" type="hidden" name="cpnNo" value="${body.data.cpnNo}">

                                <div class="search-inline-bar">
                                    <div class="search-field search-date">
                                        <div class="search-label">생성일</div>
                                        <div class="search-control-group">
                                            <div class="date-input-wrap">
                                                <input type="text"
                                                       class="form-control periodS background-white"
                                                       name="periodS"
                                                       value=""
                                                       readonly>
                                                <i class="fas fa-calendar-alt"></i>
                                            </div>

                                            <span class="date-separator">~</span>

                                            <div class="date-input-wrap">
                                                <input type="text"
                                                       class="form-control periodE background-white"
                                                       name="periodE"
                                                       value=""
                                                       readonly>
                                                <i class="fas fa-calendar-alt"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="search-field">
                                        <div class="search-label">쿠폰 사용 여부</div>
                                        <div class="search-control-group">
                                            <select class="form-control" name="useYn">
                                                <option value="">전체</option>
                                                <option value="Y">사용</option>
                                                <option value="N">미사용</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="search-field search-keyword">
                                        <div class="search-label">검색어</div>
                                        <div class="search-control-group search-keyword-group">
                                            <select class="form-control keywordType" name="searchType">
                                                <option value="1">
                                                    <spring:message code="list.search.title1" text="쿠폰코드"/>
                                                </option>
                                                <option value="2">
                                                    <spring:message code="list.search.title1" text="사용자명"/>
                                                </option>
                                                <option value="3">
                                                    <spring:message code="list.search.title1" text="연락처"/>
                                                </option>
                                            </select>
부
                                            <input type="text"
                                                   class="form-control width-150"
                                                   name="searchKeyword"
                                                   value=""
                                                   maxlength="150"
                                                   placeholder="검색어 입력">
                                        </div>
                                    </div>

                                    <div class="search-actions">
                                        <button type="button"
                                                class="btn btn-search-inline searchCouponProvide">
                                            <i class="fa fa-search"></i>
                                            검색
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="list m-t-20 height-600">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xl-12 ui-sortable">
                                    <div class="card_">
                                        <div class="card-bod">
                                            <div class="panel-body">
                                                <table id="searchCouponProvideTab3" class="listTable display table compact-table table-striped">
                                                    <thead>
                                                    <th class="text-center" style="width: 50px;" >번호</th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰일련번호"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰명"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="쿠폰코드"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용자명"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="연락처"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="할인금액(할인율)"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용가능 주문금액"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="최대 할인금액"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용가능일"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용만료일"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용여부"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="사용일"/></th>
                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="주문번호"/></th>
                                                    </thead>
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
<div class="modal fade" id="search_membership_coupon" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/membershipCouponSearch.jsp" %>
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
<%@include file="../../../common/include_number_only_js.jsp" %>
<%-- Custom JS End--%>

<script>
    const date = new Date(); //각 날짜 초기 세팅 date객체
    const dateClasses = ['.periodS', '.periodE', '.cpnPeriodS', '.cpnPeriodE', '.issuedDate'];
    const cpnNo = document.getElementsByName('cpnNo')[0].value;
    const COUPON_PROVIDE_EXCEL_PAGE_SIZE = 100;




    function getCouponProvideBaseParam() {
        var formData = objectifyForm($("#form-provide-search").serializeArray());
        var param = formData;

        param["periodS"] = (param["periodS"] || "").replaceAll("-", "");
        param["periodE"] = (param["periodE"] || "").replaceAll("-", "");

        return param;
    }

    function getCouponProvideExcelParam(pageNo) {
        var param = getCouponProvideBaseParam();

        param.draw = pageNo;
        param.start = (pageNo - 1) * COUPON_PROVIDE_EXCEL_PAGE_SIZE;
        param.length = COUPON_PROVIDE_EXCEL_PAGE_SIZE;
        param.pageNo = pageNo;
        param.pageSize = COUPON_PROVIDE_EXCEL_PAGE_SIZE;
        param.excelDownloadYn = "Y";

        return param;
    }

    function requestCouponProvideExcelPage(pageNo) {
        return $.ajax({
            url: "<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon-manage/coupon/provide",
            type: "GET",
            data: getCouponProvideExcelParam(pageNo),
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            }
        });
    }

    function couponProvideDiscountText(row) {
        if (String(row.disType) === "1") {
            return countString(row.discountAmt, "원");
        }

        if (String(row.disType) === "2") {
            return countString(row.discountAmt, "%");
        }

        return "-";
    }

    function couponProvideUseYnText(row) {
        return useYnLimit({
            useYn: row.useYn,
            validateTo: row.expDate
        }) || "-";
    }

    function excelValue(value) {
        if (value === null || value === undefined || value === "") {
            return "-";
        }

        return String(value);
    }

    function makeCouponProvideExcelRows(list) {
        return list.map(function(row, index) {
            return [
                index + 1,
                excelValue(row.cuCpnNo),
                excelValue(row.cpnTitle),
                excelValue(row.cpnCode),
                excelValue(row.userName),
                excelValue(row.userTel),
                excelValue(couponProvideDiscountText(row)),
                excelValue(countString(row.cpnUseLimit, "원")),
                excelValue(countString(row.maxDisAmt, "원")),
                excelValue(row.redayDate),
                excelValue(row.expDate),
                excelValue(couponProvideUseYnText(row)),
                excelValue(row.useDate),
                excelValue(row.ordNo)
            ];
        });
    }

    function downloadCouponProvideXlsx(list) {
        if (typeof XLSX === "undefined") {
            alert("엑셀 라이브러리가 로드되지 않았습니다.");
            return;
        }

        var headers = [
            "번호",
            "쿠폰일련번호",
            "쿠폰명",
            "쿠폰코드",
            "사용자명",
            "연락처",
            "할인금액(할인율)",
            "사용가능 주문금액",
            "최대 할인금액",
            "사용가능일",
            "사용만료일",
            "사용여부",
            "사용일",
            "주문번호"
        ];

        var rows = makeCouponProvideExcelRows(list);
        var sheetData = [headers].concat(rows);

        var workbook = XLSX.utils.book_new();
        var worksheet = XLSX.utils.aoa_to_sheet(sheetData);

        worksheet["!cols"] = [
            { wch: 8 },
            { wch: 18 },
            { wch: 25 },
            { wch: 22 },
            { wch: 15 },
            { wch: 18 },
            { wch: 18 },
            { wch: 18 },
            { wch: 18 },
            { wch: 15 },
            { wch: 15 },
            { wch: 12 },
            { wch: 18 },
            { wch: 18 }
        ];

        XLSX.utils.book_append_sheet(workbook, worksheet, "지급내역");
        XLSX.writeFile(workbook, "지급내역_" + moment().format("YYYYMMDDHHmm") + ".xlsx");
    }

    function downloadCouponProvideExcel() {
        var allList = [];
        var pageNo = 1;
        var totalCount = 0;

        var $btn = $(".btn-excel-download");
        var originalHtml = $btn.html();

        $btn.prop("disabled", true).html('<i class="fa fa-spinner fa-spin"></i><span>엑셀 생성중...</span>');

        function finish() {
            $btn.prop("disabled", false).html(originalHtml);
        }

        function fetchNextPage() {
            requestCouponProvideExcelPage(pageNo)
                .done(function(res) {
                    var list = [];

                    if (res && res.data && res.data.infoData) {
                        list = res.data.infoData;
                    }

                    if (res && res.data && res.data.totalCount) {
                        totalCount = Number(res.data.totalCount);
                    }

                    if (list && list.length > 0) {
                        allList = allList.concat(list);
                    }

                    if (
                        list.length === 0 ||
                        (totalCount > 0 && allList.length >= totalCount) ||
                        (totalCount === 0 && list.length < COUPON_PROVIDE_EXCEL_PAGE_SIZE)
                    ) {
                        if (allList.length === 0) {
                            alert("엑셀 다운로드할 데이터가 없습니다.");
                            finish();
                            return;
                        }

                        downloadCouponProvideXlsx(allList);
                        finish();
                        return;
                    }

                    pageNo++;
                    fetchNextPage();
                })
                .fail(function() {
                    alert("엑셀 다운로드 중 오류가 발생했습니다.");
                    finish();
                });
        }

        fetchNextPage();
    }


    $(() => {
        function togglePointChangeBox() {
            const disType = $("input[name='disType']:checked").val();

            if (disType === "1") {
                $("#pointChangeBox").show();
            } else {
                $("#pointChangeBox").hide();

                // 체크 상태는 유지한다.
                // 할인률 상태에서는 저장 시점에만 N으로 보낸다.
            }
        }
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
            } else if (dateClass.includes('issuedDate')){
                date = '${body.data.issuedDate}';
            }
            date = date.substring(0, 11);
            $(dateClass).datepicker('setDate', date);
        });


        //쿠폰 발급기준 - 조건충족시 발급조건 추가
        //쿠폰 발급기준 - 조건충족시 발급조건 추가
        $(".issuedType").click((e) => {
            let value = e.target.value;

            let issuedConditionForm = document.getElementById('issuedCondition-form');
            let periodSTrForm = document.getElementById('periodSTr-form');
            let ordCntForm = document.getElementById('ordCnt-form');

            let issuedCondition = $("[name=issuedCondition]:checked").val();

            switch (value) {
                case 'D':
                    if (periodSTrForm) {
                        periodSTrForm.style.display = 'none';
                    }

                    if (issuedConditionForm) {
                        issuedConditionForm.style.display = 'table-row';
                    }

                    if (ordCntForm) {
                        if (issuedCondition === 'D') {
                            ordCntForm.style.display = 'table-row';
                        } else {
                            ordCntForm.style.display = 'none';
                        }
                    }

                    $('.issuedDate').datepicker('setDate', null);
                    break;

                case 'T':
                    if (issuedConditionForm) {
                        issuedConditionForm.style.display = 'none';
                    }

                    if (ordCntForm) {
                        ordCntForm.style.display = 'none';
                    }

                    if (periodSTrForm) {
                        periodSTrForm.style.display = 'table-row';
                    }

                    if ('${body.data.issuedDate}' === '') {
                        $('.issuedDate').datepicker('setDate', new Date());
                    }
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
                    $(".maxDisAmt").attr("disabled", false);
                    $(".maxDisAmt").val("0");
                    break;
            }

            togglePointChangeBox();
        });

        togglePointChangeBox();
        //쿠폰 유효기간구분
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
            let navTab2 = document.getElementById('nav-tab-2');
            let issuedType = $("[name=issuedType]:checked").val();

            if(value == 'B') {
                navTab2.style.display = 'table-row';
            } else {
                navTab2.style.display = 'none';
            }

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
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="수정되었습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="수정에 실패하였습니다."/>";
            let issuedType = $("[name=issuedType]:checked").val();
            let issuedCondition = $("[name=issuedCondition]:checked").val();



            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);
            req.pointChangeYn = req.disType == "1" && $("#pointChangeYn").is(":checked") ? "Y" : "N";

            let cpnPeriodSPick = req.cpnPeriodS + "T00:00:00";
            let cpnPeriodEPick = req.cpnPeriodE + "T23:59:59";
            let periodSPick = req.periodS + "T00:00:00";
            let periodEPick = req.periodE + "T23:59:59";
            req.cpnNo = Number(req.cpnNo);
            req.discountAmt = Number(req.discountAmt);
            req.ordCnt = Number(req.ordCnt);
            req.cpnUseLimit = Number(req.cpnUseLimit);
            if(!req.maxDisAmt) {
                req.maxDisAmt = Number(0);
            }else {
                req.maxDisAmt = Number(req.maxDisAmt);
            }


            if(issuedCondition == 'D' && issuedType == 'D' && req.ordCnt < 1 ) {
                alert("쿠폰 적용 주문 횟수는 최소 1개 이상 지정해주세요");
                return;
            }
            req.cpnPeriodLimit = Number(req.cpnPeriodLimit);
            req.periodS = req.periodS.replaceAll("-","").replaceAll("-","");
            req.periodE = req.periodE.replaceAll("-","").replaceAll("-","");
            req.cpnPeriodS = req.cpnPeriodS.replaceAll("-","").replaceAll("-","");
            req.cpnPeriodE = req.cpnPeriodE.replaceAll("-","").replaceAll("-","");


            if(req.issuedDate){
                req.issuedDate = req.issuedDate.replaceAll("-","").replaceAll("-","");
            }
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
                            url:"<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon-manage/coupon",
                            /*     url: "https://frapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/coupon",
                                   url: "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/coupon",
                           */
                            data: req,
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
                                            cpnNo: req.cpnNo,
                                            cpnUseYn: req.cpnUseYn,
                                            cpnTitle: req.cpnTitle,
                                            periodS: periodSPick,
                                            periodE: periodEPick,
                                        }),
                                        contentType: "application/json",
                                        dataType: "json",
                                        success: function (data) {
                                            if (data.result== "200") {
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


    let table = null;
    let table2 = null;
    $(document).on("click",".createCoupon",function() {
        if(`${body.data.issuedCondition}` == "B"){
            let couponPeriodS = '${body.data.periodS}';
            let couponPeriodE = '${body.data.periodE}';
            let today = new Date();
            let periodS = new Date(couponPeriodS + "T00:00:00");
            let periodE = new Date(couponPeriodE + "T23:59:59");

            /*if(today >= periodS && today <= periodE){*/
                if (Number($("#publishCount").val()) > 0) {
                    swal({
                        title: "쿠폰을 생성하시겠습니까?",
                        icon: "warning",
                        buttons: [
                            "취소",
                            "생성"
                        ],
                        dangerMode: true,
                    }).then(function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                type: "POST",
                                url: "${path}/api/manna/couponpublish/save",
                                data: {
                                    cpnNo:  Number("${body.data.cpnNo}"),
                                    publishCount: $("#publishCount").val()
                                },
                                /*      contentType: "application/json",*/
                                dataType: "json",
                                success: function (data) {
                                    if (data.result== "200") {
                                        alert("쿠폰생성에 성공하였습니다");
                                        searchForm();
                                    } else {
                                        alert("쿠폰생성에 실패하였습니다.");
                                        return;
                                    }
                                }
                            });
                        }
                    })
                } else {
                    alert("쿠폰생성갯수를 확인해주세요.");
                }
          /*  } else {
                  alert("쿠폰 발급 가능일자가 아닙니다.");
                  return;
            }*/
        } else {
            alert("쿠폰 발급조건을 일괄지급 상태로 변경후 사용가능합니다.");
            return;
        }
    });

    $(document).on("click",".searchCouponPublish",function() {
        searchForm();
    });
    $(document).on("click",".searchCouponProvide",function() {
        searchForm3();
    });

    $(document).on("click","#nav-tab-2",function(){
        if(!table) {
            dateSetting(365);

            var buttonCommon = {
                exportOptions: {
                    format: {
                        body: function (data, row, column, node) {
                            // if it is select
                            if (column == 2) {
                                return $(data).find("option:selected").text()
                            } else return data
                        }
                    }
                }
            };

            table = $('#searchCouponDetailTab2').ajaxDataTable(
                "form-coupon-search",
                "${path}/api/membership/coupon/publish/list",
                "A3",
                "3",
                true,   // 또는 false
                {
                    columns: [
                        {data: "listIndex"},
                        {data: "cpnCode"},
                        {data: "cpnStatus", render: function(data){
                                if(data == 0) {
                                    return "<select class='form-control w-100 cpnStatus'>" +
                                        "<option value='1'>정상</option>" +
                                        "<option selected value='0'>정지</option>" +
                                        "</select>";
                                } else {
                                    return "<select class='form-control w-100 cpnStatus'>" +
                                        "<option selected value='1'>정상</option>" +
                                        "<option value='0'>정지</option>" +
                                        "</select>";
                                }
                            }},
                        {data: "insertDate", render: function(data){
                                return data ? dateFormat(data) : "";
                            }},
                        {data: "insertUserId"},
                        {data: "stCode", render: function(data){
                                return "<input class='form-control w-100 stCode' type='text' value='" + (data || "") + "'>";
                            }},
                        {data: "registMax", render: function(data){
                                return "<input class='form-control w-100 registMax numberOnly' type='text' value='" + (data ?? "") + "'>";
                            }},
                        {data: "totalRegistMax", render: function(data){
                                return "<input class='form-control w-100 totalRegistMax numberOnly' type='text' value='" + (data ?? "") + "'>";
                            }},
                        {data: "mannaCouponRegist", render: function(data){
                                return (data ? data.length : 0) + "개";
                            }},
                        {data: "useAbleCnt", render: function(data){
                                return (data ?? 0) + "개";
                            }},
                        {
                            data: "cpnCodePublishNo",
                            render: function(data, type, row) {
                                var html = "";

                                html += "" +
                                    "<button class='btn btn-sm btn-info couponPop' " +
                                    "data-toggle='modal' " +
                                    "data-target='#search_membership_coupon' " +
                                    "publishNo='" + (row.publishNo || "") + "'>" +
                                    "등록내역" +
                                    "</button>";

                                return html;
                            }
                        },
                        {
                            data: "cpnCodePublishNo",
                            render: function(data, type, row) {
                                var html = "";

                                var registCnt = row.mannaCouponRegist ? row.mannaCouponRegist.length : 0;

                                html += "" +
                                    "<input class='btn btn-sm btn-info couponUpdate' " +
                                    "couponCode='" + (row.cpnCode || "") + "' " +
                                    "publishNo='" + (row.publishNo || "") + "' " +
                                    "type='button' value='수정'>";

                                if (registCnt === 0) {
                                    html += "" +
                                        "<button class='btn btn-sm btn-danger couponDelete ml-1' " +
                                        "publishNo='" + (row.publishNo || "") + "' " +
                                        "couponCode='" + (row.cpnCode || "") + "'>" +
                                        "삭제" +
                                        "</button>";
                                }

                                return html;
                            }
                        }
                    ],
                    columnDefs: [
                        {targets: "_all", className: "text-center"}
                    ]
                }
            );

            $("#testTable_filter").text("");
            //$("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');


        }
    });
    $(document).on("click",".couponPop",function(e){
        let publishNo =  $(this).attr("publishNo");
        $(".publishNoPopHidden").val(publishNo);
        $("#searchCouponRegist").children("tbody").html("<tr class='odd'><td valign='top' colspan='5' class='ataTables_empty text-center'>데이터가 없습니다.</td></tr>");

        if(!table2) {
            dateSetting(365);

            table2 = $('#searchCouponRegist').ajaxDataTable("form-regist-search", "${path}/api/membership/coupon/regist/list", "A4","2" , true ,{
                columns: [
                    {data: "listIndex"},
                    {data: "registNo"},
                    /*{data: "publishNo"},*/
                    {data: "regDate",
                        render: function(data){
                            if(data){
                                return dateFormat(data);
                            } else {
                                return "";
                            }
                        },
                    },
                    {
                        data: "cust.custName",
                        defaultContent: ""
                    },
                    {data: "regCustTel", render: function(data){
                            if(data){
                                return phoneHyphen(data)
                            } else {
                                return "";
                            }
                        }
                    }
                ],
                columnDefs: [
                    {targets: "_all", className: "text-center"},
                ],
            });
            $("#searchCouponRegist_filter").text("");
            //$("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');
        } else {


          /*  $("#searchCouponRegist").children("tbody").html();

            $(".dataTables_empty").attr("colspan",10)*/
           /* searchForm2();*/
        }
    });


    table3 = $("#searchCouponProvideTab3").DataTable({
        language :  {
            lang_set,
            "processing": "데이터 불러오는 중...",
            "info": " _PAGE_ - _PAGES_ (총 _MAX_ 건)",
        }, //or lang_eng
        /*   pagingType: "full_numbers",*/
        /*   pagingType : "full_numbers",*/
        lengthMenu : [ [ 10, 20, 30 ,40], [ 10, 20, 30, 40] ],
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
            {data: "userName"},
            {data: "userTel"},
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

            {data: "cpnUseLimit"},
            {data: "maxDisAmt"},
            {data: "redayDate"},
            {data: "expDate"},
            {data: "useYnCustom" ,
                render: function (data) {
                    return useYnLimit(data);
                   /* let now = new Date();

                    let month = now.getMonth() + 1;
                    let day = now.getDate();

                    month = month >= 10 ? month : '0' + month;
                    day = day >= 10 ? day : '0' + day;

                    let nowNumber = Number(now.getFullYear()+""+month+""+day)
                    let limitDate = Number(data.validateTo.replaceAll("-","").replaceAll("-",""))

                    if(nowNumber > limitDate){
                        return "만료"
                    } else {

                    }*/

                }
            },
            {data: "useDate"},
            {data: "ordNo"},
        ],
        columnDefs: [
            {
                targets: [1], className: "width-100 text-center",
                render: function (data) {
                    if(data){
                        return data;
                    } else{
                        return "-"
                    }
                }
            },
            {
                targets: [2], className: "width-200 text-center",
                render: function (data) {
                    if(data){
                        return data;
                    } else{
                        return "-"
                    }
                }
            },
            {
                targets: [3,4,5], className: "text-center",
                render: function (data) {
                    if(data){
                        return data;
                    } else{
                        return "-"
                    }
                }
            },
            {
                targets: [7,8], className: "text-center width-120",
                render: function (data) {
                    return countString(data,"원");
                }
            },
            {
                targets: [13], className: "width-150 text-center",
                render: function (data) {
                    if(data){
                        return data;
                    } else{
                        return "-"
                    }
                }
            },
            {targets: "_all", className: "text-center"}
        ],
        ajax : {
            url:"<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon-manage/coupon/provide",
            type: "GET",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            },
            data: function (res) {
                var formData = objectifyForm($("#form-provide-search").serializeArray());
                var param = formData;

                param["periodS"] = param["periodS"].replaceAll("-","").replaceAll("-","");
                param["periodE"] = param["periodE"].replaceAll("-","").replaceAll("-","");

                param["draw"] = res.draw;
                param["length"] = res.length;
                param["start"] = res.start;

                param.pageSize = param.testTable_length;
                param.pageNo = res.start/res.length + 1;
                return param;
            },
            dataSrc: function(res) {
                if (res.data && res.data.infoData) {
                    var data = res.data.infoData;
                    var start = 0;

                    if (res && res.start) {
                        start = Number(res.start);
                    }

                    for (let i = 0; i < data.length; i++) {
                        data[i].listIndex = start + i + 1;
                        data[i]["number"] = i;
                        data[i]["disTypeText"] = {
                            disType: data[i]["disType"],
                            discountAmt: data[i]["discountAmt"]
                        };
                        data[i]["useYnCustom"] = {
                            useYn: data[i]["useYn"],
                            validateTo: data[i]["expDate"]
                        };
                    }

                    res.recordsTotal = res.data.totalCount || 0;
                    res.recordsFiltered = res.data.totalCount || 0;

                    return data;
                } else {
                    res.recordsTotal = 0;
                    res.recordsFiltered = 0;
                    return [];
                }
            },
            statusCode: {
                200: (response) => {
                    //console.log(response)
                    // TODO
                },
                400: (response) => {
                    //console.log(response)
                    // TODO
                },
                500: (response) => {
                    //console.log(response)
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
        paging: true,
        responsive: true,
        dom:
            '<"row mb-2 align-items-center"' +
            '<"col-sm-6 d-flex align-items-center"lB>' +
            '<"col-sm-6 d-flex justify-content-end"f>' +
            '>' +
            't' +
            '<"row mt-2 align-items-center"' +
            '<"col-sm-6"i>' +
            '<"col-sm-6 d-flex justify-content-end"p>' +
            '>',

        buttons: [
            {
                text: '<i class="fa fa-file-excel"></i><span>엑셀 다운로드</span>',
                className: 'btn btn-excel-download',
                action: function () {
                    downloadCouponProvideExcel();
                }
            }
        ],
    });


    function searchForm() {
        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) {table.column(i).search(''); }
        table.column().draw();
    }
    function searchForm2() {
        var numCols2 = table2.columns().nodes().length;
        for(var i=0; i<numCols2; i++) {table2.column(i).search(''); }
        table2.column().draw();
    }
    function searchForm3() {
        var numCols3 = table3.columns().nodes().length;
        for(var i=0; i<numCols3; i++) {table3.column(i).search(''); }
        table3.column().draw();
    }



    $(document).on("keyup",".rate-limit",function(){
        if($(this).val() > 100) {
            $(this).val(100);
        }
    });

    //쿠폰 수정 버튼 클릭
    $(document).on("click",".couponUpdate",function(){
        let cpnCode =  $(this).attr("couponCode");
        let cpnStatus =  $(this).closest("tr").children("td").find(".cpnStatus").val();
        let totalRegistMax =  $(this).closest("tr").children("td").find(".totalRegistMax").val();
        let registMax = $(this).closest("tr").children("td").find(".registMax").val();
        let stCode = $(this).closest("tr").children("td").find(".stCode").val();

        swal({
            title: "수정하시겠습니까?",
            icon: "warning",
            buttons: [
                "취소",
                "수정"
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'POST',
                    url: '${path}/api/membership/coupon/update',
                    data: {
                        cpnCode : cpnCode,
                        cpnStatus : cpnStatus,
                        stCode: stCode,
                        registMax: registMax,
                        totalRegistMax: totalRegistMax
                    },
                    // contentType: 'application/json',
                    success: function(data) {
                        let result = data.resultCode;
                        if(result == 200) {
                            alert("수정에 성공하였습니다.");
                            searchForm();
                            return;
                        } else {
                            alert("수정에 실패하였습니다.");
                        }
                    }
                });
            }
        });
    });

    //쿠폰 삭제 버튼 클릭
    $(document).on("click",".couponDelete",function(){
        let cpnCode =  $(this).attr("couponCode");
        let cpnStatus =  $(this).closest("tr").children("td").find(".cpnStatus").val();
        let totalRegistMax =  $(this).closest("tr").children("td").find(".totalRegistMax").val();
        let registMax = $(this).closest("tr").children("td").find(".registMax").val();
        let stCode = $(this).closest("tr").children("td").find(".stCode").val();

        swal({
            title: "삭제하시겠습니까?",
            icon: "warning",
            buttons: [
                "취소",
                "삭제"
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'POST',
                    url: '${path}/api/membership/coupon/delete',
                    data: {
                        cpnCode : cpnCode,
                        cpnStatus : cpnStatus,
                        stCode: stCode,
                        registMax: registMax,
                        totalRegistMax: totalRegistMax
                    },
                    // contentType: 'application/json',
                    success: function(data) {
                        let result = data.resultCode;
                        if(result == 200) {
                            alert("삭제에 성공하였습니다.");
                            searchForm();
                            return;
                        } else {
                            alert("삭제에 실패하였습니다.");
                        }
                    }
                });
            }
        });
    });

    //
   /* $(document).on("click",".couponPop",function(){
        let publishNo =  $(this).attr("publishNo");
        $.ajax({
            type: 'POST',
            url: '${path}/api/membership/couponregist/info',
            data: {
                publishNo: publishNo
            },
            // contentType: 'application/json',
            success: function(data) {
                let result = data.resultCode;
                if(result == 200) {
                    $(".registNoText").val(data.mannaCouponRegist.registNo)
                    $(".publishNoText").val(data.mannaCouponRegist.publishNo)
                    $(".regDateText").val(data.mannaCouponRegist.regDate)
                    $(".regCustNoText").val(data.mannaCouponRegist.regCustNo)
                    $(".regCustTelText").val(data.mannaCouponRegist.regCustTel)
                    $(".regCpnNoText").val(data.mannaCouponRegist.regCpnNo)
                } else {
                    alert("내역이 존재하지 않습니다.");
                    return;
                }
            }
        });
    });*/

    function inputDataCheck(args) {
        let emptyTitleMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰명을 입력해주세요"/>";
        let emptyDiscountAmtMsg = "<spring:message code="list.script.pleaseenterantitle1" text="할인금액 또는 할인율을 입력해주세요"/>";
        let emptyCpnUseLimitMsg = "<spring:message code="list.script.pleaseenteransubject1" text="쿠폰 사용가능 주문 금액을 입력해주세요"/>";
        let emptyOrdCntMsg = "<spring:message code="list.script.pleaseenteransubject1" text="횟수를 입력해주세요."/>";
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

        args.periodS = args.periodS.replaceAll("-","").replaceAll("-","");
        args.periodE = args.periodE.replaceAll("-","").replaceAll("-","");
        args.cpnPeriodS = args.cpnPeriodS.replaceAll("-","").replaceAll("-","");
        args.cpnPeriodE = args.cpnPeriodE.replaceAll("-","").replaceAll("-","");

        if(args.cpnPeriodType == 'D' && (isNull(args.cpnPeriodS) ||isNull(args.cpnPeriodE))) {
            return alert_focus("cpnPeriodS", "쿠폰유효기간을 확인해주세요.");
        }

        if(args.periodS > args.periodE) {
            return alert_focus("periodE", "쿠폰발급일을 확인해주세요.");
        }
        if(args.cpnPeriodS > args.cpnPeriodE) {
            return alert_focus("cpnPeriodS", "쿠폰유효기간을 확인해주세요.");
        }

        return true;

    }

    $(document).on("focus", ".numberOnly", function(){
        $(this).val($(this).val().replace(/[^0-9.]/g,""));
    });
    $(document).on("keyup",".numberOnly", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });
    $(document).on("focusout", ".numberOnly", function(){
        $(this).val($(this).val().replace(/[^0-9.]/g,""));
    });


</script>
</body>
</html>
