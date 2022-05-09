<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.shippingsourcedetails" text="드라이버상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.1" text="드라이버 관리"/></li>
                    <li class="breadcrumb-item"><a href="${path}/driver/deliveryman/list"><spring:message code="sidemenu.workgroupmanagement.1" text="드라이버"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.2" text="드라이버 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.2" text="드라이버 상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroup" text="업무그룹"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[S${tbUserWorker.storeNo}]</span> ${tbUserWorker.store.storeName}
                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.1" text="드라이버"/></strong></td>
                        <td>
                            <span class="text-green">[${tbUserWorker.userNo}]</span> ${tbUserWorker.name}
                        </td>
                    </tr>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.deliverymaninformation1" text="수수료"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.deliverymaninformation1" text="수수료"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
              <%--  <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">공유 설정&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                        <span class="d-sm-block d-none">공유 설정&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-4" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">배달대행료 수수료&lt;%&ndash;<spring:message code="merchandise.detail.tab2" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                        <span class="d-sm-block d-none">배달대행료 수수료&lt;%&ndash;<spring:message code="merchandise.detail.tab2" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">렌탈 관리&lt;%&ndash;<spring:message code="merchandise.detail.tab3" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품 그룹&ndash;%&gt;</span>
                        <span class="d-sm-block d-none">렌탈 관리&lt;%&ndash;<spring:message code="merchandise.detail.tab3" text="default text"/>&ndash;%&gt;&lt;%&ndash;가격 정보&ndash;%&gt;</span>
                    </a>
                </li>--%>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="false">
                        <div class="table-responsive">
                            <form id="update_form" name="update_form">
                                <table class="table table-bordered">
                                    <%--<input type="hidden" class="blockTypeCode" name="blockTypeCode" value="${tbUserWorker.blockTypeCode}">--%>
                                    <input type="hidden" class="userNo" name="userNo" value="${tbUserWorker.userNo}">
                                    <input type="hidden" class="userType" name="userType" value="4">
                                    <input type="hidden" class="insertUserId" name="insertUserId" value="${tbUserWorker.insertUserId}">
                                    <input type="hidden" class="updateUserId" name="updateUserId" value="">
                                    <input type="hidden" class="headNo" name="headNo" value="${tbUserWorker.headNo}">
                                    <input type="hidden" class="branchNo" name="branchNo" value="${tbUserWorker.branchNo}">
                                    <input type="hidden" class="storeNo" name="storeNo" value="${tbUserWorker.storeNo}">
<%--                                    <div class="timeline-header m-t-10 m-b-10">--%>
                                        <tr>
                                            <td class="bg-light" style="width:15%"><spring:message code="list.detail.image1" text="프로필 사진"/></td>
                                            <td style="width:60%">
                                                <div class="category_sort">
                                                    <ul class="sort_list">
                                                        <li>
                                                            <div class="sort_body1" id="sort_body1">
                                                                <img style="width: 150px;" class="imgFile" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <%--                                                        * 권장 이미지 비율 : 984*876<br><br>--%>
                                                            <div class="deliverymanFileName1"></div>
                                                            <br>
                                                            <div class="deliverymanFileSize1"></div>
                                                        </li>
                                                    </ul>
                                                    <label for="imgFile">
                                                        <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                            <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                        </div>
                                                    </label>
                                                    <input type="file" id="imgFile" name="imgFile" value="${tbUserWorker.profileFile}" class="fileBtn d-none">
                                                    <input type="hidden" name="imgFile" value="${tbUserWorker.profileFile}">
                                                    <input type="hidden" name="profileFile" value="${tbUserWorker.profileFile}">
                                                    <input type="hidden" name="profileFileSmall" value="${tbUserWorker.profileFileSmall}">
                                                </div>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.33" text="프로필 사진을 등록하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light" style="width:15%"><spring:message code="list.detail.image1" text="면허증 사진"/></td>
                                            <td style="width:60%">
                                                <div class="category_sort">
                                                    <ul class="sort_list">
                                                        <li>
                                                            <div class="sort_body2" id="sort_body2">
                                                                <img style="width: 150px;" class="imgFile2" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <%--                                                        * 권장 이미지 비율 : 984*876<br><br>--%>
                                                            <div class="deliverymanFileName2"></div>
                                                            <br>
                                                            <div class="deliverymanFileSize2"></div>
                                                        </li>
                                                    </ul>
                                                    <label for="imgFile2">
                                                        <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                            <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                        </div>
                                                    </label>
                                                    <input type="file" id="imgFile2" name="imgFile2" value="${tbUserWorker.licenseFile}" class="fileBtn2 d-none">
                                                    <input type="hidden" name="imgFile2" value="${tbUserWorker.licenseFile}">
                                                    <input type="hidden" name="licenseFile" value="${tbUserWorker.licenseFile}">
                                                </div>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.33" text="면허증 사진을 등록하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="면허번호"/></td>
                                            <td>
                                                <input type="text" class="form-control width-200 licenseNum" name="licenseNum" value="${tbUserWorker.licenseNum}" maxlength="7" numberOnly>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender1" text="면허번호를 입력해주세요"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="면허종류"/></td>
                                            <td>
                                               <%-- <input type="text" class="form-control width-200 licenseType" name="licenseType" value="${tbUserWorker.licenseType}">--%>
                                               <label class="">
                                                    <input type="radio" name="licenseType" value="11" class="align-bottom licenseType"   <c:if test="${tbUserWorker.licenseType == '11'}">checked</c:if>> <spring:message code="list.detail.male1" text="1종대형"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="12" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == '12'}">checked</c:if>> <spring:message code="list.detail.female1" text="1종보통"/>
                                                </label>
                                                <%--<label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="13" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == 13}">checked</c:if>> <spring:message code="list.detail.female1" text="1종소형"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="14" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == 14}">checked</c:if>> <spring:message code="list.detail.female1" text="1종대형견인"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="15" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == 15}">checked</c:if>> <spring:message code="list.detail.female1" text="1종구난"/>
                                                </label><br><br>--%><%--
                                                <label class="">
                                                    <input type="radio" name="licenseType" value="16" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == 16}">checked</c:if>> <spring:message code="list.detail.female1" text="1종소형견인"/>
                                                </label>--%>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="32" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == '32'}">checked</c:if>> <spring:message code="list.detail.female1" text="2종보통"/>
                                                </label>
                                                <%--<label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="33" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType ==33}">checked</c:if>> <spring:message code="list.detail.female1" text="2종소형"/>
                                                </label>--%>
                                                <%--<label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="34" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == 34}">checked</c:if>> <spring:message code="list.detail.female1" text="2종특수"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="licenseType" value="38" class="align-bottom licenseType"  <c:if test="${tbUserWorker.licenseType == 38}">checked</c:if>> <spring:message code="list.detail.female1" text="2종원자"/>
                                                </label>--%>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="면허종류를 선택해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="면허갱신마감일"/></td>
                                            <td>
                                                <input type="text" class="form-control licenseExpDate" name="licenseExpDate" value="${tbUserWorker.licenseExpDate}" maxlength="8" numberOnly placeholder="YYYYMMDD">
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender1" text="면허갱신마감일을 입력해주세요(년월일)"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="면허 만료여부"/></td>
                                            <td>
                                                <label class="">
                                                    <input type="radio" name="licenseExpYn" value="0" class="align-bottom licenseExpYn"   <c:if test="${tbUserWorker.licenseExpYn == 0}">checked</c:if>> <spring:message code="list.detail.male1" text="유효"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="licenseExpYn" value="1" class="align-bottom licenseExpYn"  <c:if test="${tbUserWorker.licenseExpYn == 1}">checked</c:if>> <spring:message code="list.detail.female1" text="만료"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="면허 만료여부를 선택해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="드라이버 급여방식"/></td>
                                            <td>
                                                <label class="">
                                                    <input type="radio" name="workerPayType" value="1" class="align-bottom workerPayType"   <c:if test="${tbUserWorker.workerPayType == 1}">checked</c:if>> <spring:message code="list.detail.male1" text="급여"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="workerPayType" value="2" class="align-bottom workerPayType"  <c:if test="${tbUserWorker.workerPayType == 2}">checked</c:if>> <spring:message code="list.detail.female1" text="수수료"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="드라이버 급여방식을 선택해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="동시배차건수"/></td>
                                            <td>
                                                <input type="text" class="form-control dlvyLimit" name="dlvyLimit" value="${tbUserWorker.dlvyLimit}" maxlength="7" numberOnly>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender1" text="동시배차건수를 입력해주세요"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.workstatus" text="출근상태"/></td>
                                            <td>
                                                <label class="">
                                                    <input type="radio" name="attendStatus" value="0" class="align-bottom attendStatus" <c:if test="${tbUserWorker.attendStatus.ordinal() == 0}">checked</c:if> > <spring:message code="list.detail.gotowork" text="퇴근"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="attendStatus" value="1" class="align-bottom attendStatus" <c:if test="${tbUserWorker.attendStatus.ordinal() == 1}">checked</c:if>> <spring:message code="list.detail.offwork" text="출근"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="attendStatus" value="2" class="align-bottom attendStatus" <c:if test="${tbUserWorker.attendStatus.ordinal() == 2}">checked</c:if>> <spring:message code="list.detail.rest" text="휴식"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="attendStatus" value="3" class="align-bottom attendStatus" <c:if test="${tbUserWorker.attendStatus.ordinal() == 3}">checked</c:if>> <spring:message code="list.detail.rest1" text="운행"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourworkworkstatus" text="드라이버의 상태를 선택해주세요."/></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.employeenumber" text="사원번호"/></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control width-200 registNum" name="registNum" value="${tbUserWorker.registNum}" maxlength="15">
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryouremployeenumber" text="사원번호를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.434" text="드라이버 이름"/></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control width-200" name="name" value="${tbUserWorker.name}" maxlength="15">
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.3" text="드라이버 이름을 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.3" text="드라이버 연락처"/></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control width-200" name="phone" value="${tbUserWorker.phone}" maxlength="15">
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.3" text="드라이버 연락처를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.3" text="드라이버 성별"/></td>
                                            <td>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="gender" value="M" class="align-bottom attendStatus" <c:if test="${tbUserWorker.gender == 'M'}">checked</c:if>> <spring:message code="list.detail.male" text="남성"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="gender" value="F" class="align-bottom attendStatus" <c:if test="${tbUserWorker.gender == 'F'}">checked</c:if>> <spring:message code="list.detail.female" text="여성"/>
                                                </label>
                                                <label class="">
                                                    <input type="radio" name="gender" value="N" class="align-bottom attendStatus" <c:if test="${tbUserWorker.gender == 'N'}">checked</c:if> > <spring:message code="list.detail.unknown" text=" 알수없음"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="드라이버 성별을 설정하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.dateofentry1" text="입사일 / 퇴사일"/></td>
                                            <td>
                                                <label>
                                                    입사일 : <input type="text" class="form-control joinDate background-white"  name="joinDate" value="${tbUserWorker.joinDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>  &nbsp;
                                                </label>
                                                <label>
                                                    퇴사일 : <input type="text" class="form-control retireDate background-white"  name="retireDate" value="${tbUserWorker.retireDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>  &nbsp;
                                                </label>
                                            </td>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthedateofentry" text="입사일자/퇴사일자를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.residenceaddress" text="거주지 주소"/></td>
                                            <td>
                                                <input type="text" value="${tbUserWorker.addr}" name="addr" class="form-control width-400" maxlength="150">
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourresidentialaddress" text="거주지 주소를 입력하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                            <td>
                                                <input type="text" class="form-control width-600" name="memo" value="${tbUserWorker.memo}" maxlength="150">
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.3" text="드라이버 메모"/></td>
                                        </tr>

                                        <tr>
                                            <td class="bg-light height-50" style="width:15%"><spring:message code="list.detail.3" text="드라이버 상태"/> </td>
                                            <td style="width:60%">
                                                <label >
                                                    <input type="radio" name="dataStatus" value="1" class="align-bottom dataStatus" <c:if test="${tbUserWorker.dataStatus.ordinal() == 1}" >checked</c:if>> <spring:message code="list.detail.normal" text="정상"/><%--정상--%>
                                                </label>
                                                <label class="m-l-10">
                                                    <input type="radio" name="dataStatus" value="2" class="align-bottom dataStatus" <c:if test="${tbUserWorker.dataStatus.ordinal() == 2}" >checked</c:if>> <spring:message code="list.detail.stop" text="정지"/><%--정상--%>
                                                </label>
                                                <label class="m-l-10">
                                                    <input type="radio" name="dataStatus" value="0" class="align-bottom dataStatus" <c:if test="${tbUserWorker.dataStatus.ordinal() == 0}" >checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/><%--정상--%>
                                                </label>
                                                <label class="m-l-10 blockTypeCodeSel" style="display: <c:if test="${tbUserWorker.dataStatus.ordinal() == 1}" >none</c:if>">
                                                    정지/삭제사유 :
                                                    <select class="blockTypeCode" name="blockTypeCode">
                                                        <c:forEach var="item" items="${systemCodeList}" varStatus="status">
                                                            <option value="${item.sysCode}" <c:if test="${tbUserWorker.blockTypeCode == item.sysCode}" >selected</c:if>>${item.codeName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.44" text="드라이버 상태를 설정하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50"><spring:message code="list.detail.loginid" text="로그인 ID"/></td>
                                            <td>${tbUserWorker.userId}
                                                <input type="hidden"  name="userId" class="form-control width-200 userId" value="${tbUserWorker.userId}" readonly>
                                                <input type="hidden"  name="userPwd" class="form-control width-200 userPwd" value="${tbUserWorker.userPwd}"  readonly>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정 불가"/></td>
                                        </tr>
                                        <input type="hidden" name="pushOrderYn" value="${tbUserWorker.pushOrderYn}">
                                        <input type="hidden" name="pushNoticeYn" value="${tbUserWorker.pushNoticeYn}">
                                        <input type="hidden" name="pushMarketingYn" value="${tbUserWorker.pushMarketingYn}">
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.deposit" text="예치금"/></td>
                                            <td><input class="form-control width-200" type="text"  name="deposit" value="${tbUserWorker.deposit}" readonly> <spring:message code="list.detail.won" text="원"/>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.transferringtoachargingaccountmessage" text="충전 계좌로 이체시 예치금으로 입금됩니다."/></td>
                                        </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deposit1" text="주민등록번호"/></td>
                                        <td><input class="form-control width-200" type="text"  name="registrationNum" value="${registrationNum}" >
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.transferringtoachargingaccountmessage" text="주민번호를 입력해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deposit1" text="보험증권번호"/></td>
                                        <td><input class="form-control width-200" type="text"  name="insurancePolicy" value="${tbUserWorker.insurancePolicy}" >
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.transferringtoachargingaccountmessage" text=""/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.cash" text="캐시"/></td>
                                        <td><input class="form-control width-200" type="text"  name="cash" value="${tbUserWorker.cash}" readonly> ( <spring:message code="list.detail.arrears" text="체납금"/> : ${tbUserWorker.cashDefault} <spring:message code="list.detail.won" text="원"/> )</td>
                                        <td class="text-danger-darker"><spring:message code="list.description.ifarrearsexistusewillbesuspended" text="체납금이 존재하면 사용이 정지됩니다."/></td>
                                        <input type="hidden" name="cashDefault" value="${tbUserWorker.cashDefault}" />
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0 border-right-0">
                                                        <input type="text" class="form-control width-200" value="${cBankName}" readonly>
                                                        <input type="hidden" name="cybankTypeCode" value="${tbUserWorker.cybankTypeCode}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                    <td class="border-right-0  border-bottom-0">
                                                        <input type="text" class="form-control width-200" value="${tbUserWorker.cybankAccount}" readonly>
                                                        <input type="hidden" name="cybankAccount" value="${tbUserWorker.cybankAccount}">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0  width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-right-0">
                                                        <input type="text" class="form-control width-200" value="${bankName}" readonly>
                                                        <input type="hidden" name="bankTypeCode" value="${tbUserWorker.bankTypeCode}" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-top-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                    <td class="border-right-0">
                                                        <input type="text" class="form-control width-200" value="${bankAccount}" readonly>
                                                        <input type="hidden" class="border-rigth-0" name="bankAccount" value="${tbUserWorker.bankAccount}" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                    <td class="border-right-0">
                                                        <input type="text"  class="form-control width-200" name="bankOwner" value="${bankOwner}" readonly>
                                                        <input type="hidden"  name="bankOwner" value="${tbUserWorker.bankOwner}" />
                                                    </td>
                                                </tr>
                                                <input  name="pinNum" class="form-control width-200 pinNum" value="${tbUserWorker.pinNum}" type="hidden"  maxlength="150" readonly>
                                                            <%--<i class="fa fa-eye fa-lg m-l-5"></i>--%>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker border-top-0 "><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
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
                                    <table class="table table-condensed table-bordered">
                                        <tr>
                                            <td class="bg-light width-150" ><spring:message code="list.detail.accountholder1" text="일 관리비(원)"/></td>
                                            <td class="border-right-0" colspan="2" >
                                                <input type="text"  class="form-control width-200 dailyCharge" name="dailyCharge" value="${tbWorkerCharge.dailyCharge}"  maxlength="11" numberOnly> 원
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="일 관리비(원)를 입력해주세요"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.accountholder1" text="월 관리비(원)"/></td>
                                            <td class="border-right-0" colspan="2">
                                                <input type="text"  class="form-control width-200 monthlyCharge" name="monthlyCharge" value="${tbWorkerCharge.monthlyCharge}" numberOnly maxlength="11"> 원
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="월 관리비(원)를 입력해주세요"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light" rowspan="6"><spring:message code="list.detail.accountholder1" text="운행건당 수수료"/></td>
                                            <td ><spring:message code="list.detail.accountholder1" text="인수대행 수수료 (릴레이콜 아닌경우사용)"/></td>
                                            <td class="border-right-0">
                                                <input type="text"  class="form-control width-200 takeoverCharge" name="takeoverCharge" value="${tbWorkerCharge.takeoverCharge}" numberOnly>
                                                <select name="takeoverRateType" class="form-control width-60">
                                                    <option value="1"<c:if test="${tbWorkerCharge.takeoverRateType == 1}" >selected</c:if>>원</option>
                                                    <option value="2"<c:if test="${tbWorkerCharge.takeoverRateType == 2}" >selected</c:if>>%</option>
                                                </select>
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="인수대행 수수료를 입력해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td ><spring:message code="list.detail.accountholder1" text="인수대행 수수료(인수)"/></td>
                                            <td class="border-right-0">
                                                <input type="text"  class="form-control width-200 takeoverCharge1" name="takeoverCharge1" value="${tbWorkerCharge.takeoverCharge1}" numberOnly>
                                                <select name="takeoverRateType1" class="form-control width-60">
                                                    <option value="1"<c:if test="${tbWorkerCharge.takeoverRateType1 == 1}" >selected</c:if>>원</option>
                                                    <option value="2"<c:if test="${tbWorkerCharge.takeoverRateType1 == 2}" >selected</c:if>>%</option>
                                                </select>
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="인수대행 수수료를 입력해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td ><spring:message code="list.detail.accountholder1" text="인수대행 수수료(마중)"/></td>
                                            <td class="border-right-0">
                                                <input type="text"  class="form-control width-200 takeoverCharge2" name="takeoverCharge2" value="${tbWorkerCharge.takeoverCharge2}" numberOnly>
                                                <select name="takeoverRateType2" class="form-control width-60">
                                                    <option value="1"<c:if test="${tbWorkerCharge.takeoverRateType2 == 1}" >selected</c:if>>원</option>
                                                    <option value="2"<c:if test="${tbWorkerCharge.takeoverRateType2 == 2}" >selected</c:if>>%</option>
                                                </select>
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="인수대행 수수료를 입력해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td ><spring:message code="list.detail.accountholder1" text="반납대행 수수료"/></td>
                                            <td class="border-right-0">
                                                <input type="text"  class="form-control width-200 returnCharge" name="returnCharge" value="${tbWorkerCharge.returnCharge}" numberOnly>
                                                <select name="returnRateType" class="form-control width-60">
                                                    <option value="1"<c:if test="${tbWorkerCharge.returnRateType == 1}" >selected</c:if>>원</option>
                                                    <option value="2"<c:if test="${tbWorkerCharge.returnRateType == 2}" >selected</c:if>>%</option>
                                                </select>
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="반납대행 수수료를 입력해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td ><spring:message code="list.detail.accountholder1" text="마이카탁송 수수료"/></td>
                                            <td class="border-right-0">
                                                <input type="text"  class="form-control width-200 mycarCharge" name="mycarCharge" value="${tbWorkerCharge.mycarCharge}" numberOnly>
                                                <select name="mycarRateType" class="form-control width-60">
                                                    <option value="1"<c:if test="${tbWorkerCharge.mycarRateType == 1}" >selected</c:if>>원</option>
                                                    <option value="2"<c:if test="${tbWorkerCharge.mycarRateType == 2}" >selected</c:if>>%</option>
                                                </select>
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="마이카탁송 수수료를 입력해주세요."/></td>
                                        </tr>
                                        <tr>
                                            <td ><spring:message code="list.detail.accountholder1" text="올레길탁송 수수료"/></td>
                                            <td class="border-right-0">
                                                <input type="text"  class="form-control width-200 olleCharge" name="olleCharge" value="${tbWorkerCharge.olleCharge}" numberOnly>
                                                <select name="olleRateType" class="form-control width-60">
                                                    <option value="1"<c:if test="${tbWorkerCharge.olleRateType == 1}" >selected</c:if>>원</option>
                                                    <option value="2"<c:if test="${tbWorkerCharge.olleRateType == 2}" >selected</c:if>>%</option>
                                                </select>
                                            </td>
                                            <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="올레길탁송 수수료를 입력해주세요."/></td>
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

</div>

<%--modal insertRental start--%>
<div class="modal fade" id="insertRental_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insertRental.jsp" %>
</div>
<%--modal insertRental end--%>

<%--modal updateRental start--%>
<div class="modal fade" id="updateRental_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="updateRental.jsp" %>
</div>
<%--modal updateRental end--%>

<%--modal listPay start--%>
<div class="modal fade" id="listPay_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="listPay.jsp" %>
</div>
<%--modal listPay end--%>

<%--modal listDeducted start--%>
<div class="modal fade" id="listDeducted_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="listDeducted.jsp" %>
</div>
<%--modal listDeducted end--%>

<%--modal add start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<%--<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />--%>
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<%--<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>--%>
<%--<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>--%>
<%--<script src="${path}/assets/plugins/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${path}/assets/plugins/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${path}/assets/plugins/blueimp-gallery/js/jquery.blueimp-gallery.min.js"></script>--%>
<%--<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-audio.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-video.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-validate.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-ui.js"></script>--%>
<%--<script src="${path}/assets/plugins/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>--%>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<%--<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />--%>
<script>

    function percentChk(number){
        return number.replaceAll(".00","");
    }
    $(() => {

        $(".licenseExpDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyymmdd",
            language: "kr"
        });



        $(".takeoverCharge").val(percentChk($(".takeoverCharge").val()));
        $(".takeoverCharge1").val(percentChk($(".takeoverCharge1").val()));
        $(".takeoverCharge2").val(percentChk($(".takeoverCharge2").val()));
        $(".returnCharge").val(percentChk($(".returnCharge").val()));
        $(".mycarCharge").val(percentChk($(".mycarCharge").val()));
        $(".olleCharge").val(percentChk($(".olleCharge").val()));

        $("input:text[numberOnly]").on("keyup", function() {
            $(this).val($(this).val().replace(/[^0-9.]/g,""));
        });

       $(".dlvyLimit, .dailyCharge,.monthlyCharge,.takeoverRateType,.returnCharge,.mycarCharge,.olleCharge").focus(function(){
            /!*$(this).val('');*!/
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });


        let url = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile}");
        $(".imgFile").attr("src",url);
        let url2 = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile2}");
        $(".imgFile2").attr("src",url2);

        $('.pass-div i').on('click',function(){
            $('input').toggleClass('active');
            if($('input').hasClass('active')){
                $(this).attr('class',"fa fa-eye-slash fa-lg")
                    .prev('input').attr('type',"text");
            }else{
                $(this).attr('class',"fa fa-eye fa-lg")
                    .prev('input').attr('type','password');
            }
        });
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

        $(".dataStatus").on("change",function (){
            var radioVal = $(':radio[name="dataStatus"]:checked').val();

            if(radioVal == 1){
                $(".blockTypeCodeSel").css("display","none");
            } else {
                $(".blockTypeCodeSel").css("display","inline");
            }
        });


        $(".list_btn").click(function () {
            location.href = "${path}/driver/deliveryman/list";
        });

        //사업자등록증
     /*   $(document).on("change", "#saupja", function (e) {
            e.preventDefault();

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
        });*/

        //참고이미지
     /*   $(document).on("change", "#image", function (e) {
            e.preventDefault();

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
        });*/

        //imgFile
        $(document).on("change", "#imgFile", function (e) {
            e.preventDefault();
            chk_file_type(this);
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";

            var file = $("#imgFile")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body1.innerHTML = '';
                    sort_body1.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName1').text(imagetochange +" :" + filename);
            $('.deliverymanFileSize1').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });



        //imgFile2
        $(document).on("change", "#imgFile2", function (e) {
            e.preventDefault();
            chk_file_type(this);
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";

            var file2 = $("#imgFile2")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img2 = new Image();
                img2.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img2.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img2.width = 200;
                    }
                    sort_body2.innerHTML = '';
                    sort_body2.appendChild(img2);
                }
            };
            reader.readAsDataURL(file2);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename2 = file.name;
            } else {
                // old IE
                var filename2 = $("#imgFile2").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName2').text(imagetochange +" :" + filename2);
            $('.deliverymanFileSize2').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });


        //deliverymanImgFile2
     /*   $(document).on("change", "#deliverymanImgFile2", function (e) {
            e.preventDefault();
            chk_file_type(this);
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";

            var file = $("#deliverymanImgFile2")[0].files[0],
                reader = new FileReader();
            /!*파일 읽기를 시작*!/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /!*읽기가 끝나고 난후에*!/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
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
                var filename = $("#deliverymanImgFile2").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName2').text(imagetochange +" :" + filename);
            $('.deliverymanFileSize2').text(sizemsg +" :" + file.size + " Byte");

            return false;
        });*/

        $(".drawing-btn").click(function() {
            showDrawingManager();
            $(".drawing-btn").css('display', 'none');
            $(".drawing-hide-btn").css('display', 'inline');
        });
        $(".drawing-hide-btn").click(function() {
            hideDrawingManager();
            $(".drawing-btn").css('display', 'inline');
            $(".drawing-hide-btn").css('display', 'none');
        });


        $(document).on("click",".btn_update",function() {
            let url = "${path}/api/deliveryman/update/action";

            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            let joinDate = replaceAll($(".joinDate").val(),"-","");
            $(".joinDate").val(joinDate);

            let retireDate = replaceAll($(".retireDate").val(),"-","");
            $(".retireDate").val(retireDate);

            let _forms = $('#update_form');
            let _forms2 = $('#update_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            /*let req2 = convertFormToObj(_forms2);*/
            if (inputDataCheck(req,req2)) {
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
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbUserWorkerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbWorkerChargeData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        formData.append("imgFile2", $("#imgFile2")[0].files[0]);
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


        let date = new Date();
        let joinDate = "${tbUserWorker.joinDate}";
        let retireDate = "${tbUserWorker.retireDate}";

        $(".joinDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        /*date.setMonth(date.getMonth() + 1, 1);*/
        $(".retireDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
    });

    function inputDataCheck(args,args2) {
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@#$%&\\\=\(\'\"]/gi;

        /*if (isNull(args.registNum)) {
            return alert_focus("registNum", " 사원번호를 입력해주세요");
        } else*/ if (isNull(args.name)) {
            return alert_focus("name", "드라이버 이름을 입력해주세요");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "드라이버 연락처를 입력해주세요");
        } /*else if (isNull(args.addr)) {
            return alert_focus("addr", "거주지 주소를 입력해주세요");
        } else if (isNull(args.addr)) {
            return alert_focus("addr", "거주지 주소를 입력해주세요");
        }*/
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

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
