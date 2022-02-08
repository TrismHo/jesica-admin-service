<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.1" text="드라이버 등록"/></title>
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
                    <li class="breadcrumb-item"><a href="${path}/driver/deliveryman/list"><spring:message code="sidemenu.workgroupmanagement.1" text="드라이버 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.1" text="드라이버 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.1" text="드라이버 등록"/></h3>
            </div>

            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <!-- begin table-responsive -->
                    <div class="table-responsive m-l-5">
                                <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                <span><strong><spring:message code="list.detail.basicInformation" text="기본 정보"/></strong></span>
                            </div>
                        <form id="insert_form" name="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="blockTypeCode" name="blockTypeCode" value="">
                            <input type="hidden" class="dataStatus" name="dataStatus" value="1">
                  <%--          <input type="hidden" class="headNo" name="headNo"  value="">
                            <input type="hidden" class="branchNo" name="branchNo"  value="">
                            <input type="hidden" class="storeNo" name="storeNo" value="">--%>
                            <input type="hidden" class="userType" name="userType" value="4">
                            <input type="hidden" name="cashDefault" value="0" />
                            <table class="table table-bordered">

                                    <div class="timeline-header m-t-10 m-b-10">
                                    <tr>
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.affiliatedworkgroup" text="소속 업무그룹"/></td>
                                        <td style="width:60%;">
                                       <%-- <label>
                                            <input type="text" data-toggle="modal" data-target="#head_search_modal"  placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-150" readonly>

                                        </label>
                                            <label>
                                                <input type="text" data-toggle="" data-target="#branch_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-150" readonly>

                                            </label>
                                            <label>
                                                <input type="text" data-toggle="" data-target="#store_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-150" readonly>

                                            </label>--%>
                                           <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                   <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                   <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                               </label>
                                               <label>
                                                   <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                   </c:if>
                                                   <c:if test="${searchValue.branchNo == null || searchValue.branchNo ==''}">
                                                       <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   </c:if>


                                                   <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                   <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                               </label>
                                               <label>
                                                   <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                               </label>
                                           </c:if>
                                           <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                               <label>
                                                   <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                   <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                   <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                   <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                   <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                                   <c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                   </c:if>
                                                   <c:if test="${searchValue.storeNo == null || searchValue.storeNo ==''}">
                                                       <input type="hidden" class="storeNo" name="storeNo" value="${sessionScope.sessionKey.storeNo}">
                                                   </c:if>

                                               </label>
                                               <label>
                                                   <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.detail.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                               </label>
                                               <label>
                                                   <input type="text"  id="testInput"  data-toggle="modal" data-target="#store_search_modal" placeholder="<spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/>" name="storeNoText" value="${searchValue.storeNoText}" class="form-control background-white storeName width-100">
                                               </label>
                                           </c:if>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.selectstorenamemessage" text="소속 제휴본사, 총판, 가맹점을 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.loginid" text="로그인 ID"/></td>
                                        <td colspan="1"><input name="userId" type="text" value="" class="form-control width-200 userId" maxlength="15"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.entertheshippingagentloginid11" text="로그인 ID를 입력하세요. (영문/숫자/기호 4~20자 이내)"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.loginpwd" text="로그인 PWD"/></td>
                                        <td colspan="1">
                                            <div class="pass-div">
                                                <input  name="userPwd" class="form-control width-200 userPwd" value="" type="password" maxlength="60">
                                                <i class="fa fa-eye fa-lg m-l-5"></i>
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.entertheloginpassword" text="로그인 비밀번호를 입력하세요. (영문/숫자/기호 4~20자 이내)"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="기사 급여방식"/></td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="workerPayType" value="1" class="align-bottom workerPayType"  checked> <spring:message code="list.detail.male1" text="급여"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="workerPayType" value="2" class="align-bottom workerPayType" > <spring:message code="list.detail.female1" text="수수료"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="성별을 설정하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image1" text="프로필 사진"/></td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body1" id="sort_body1">
                                                            <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
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
                                                <input type="file" id="imgFile" name="imgFile" class="fileBtn d-none" accept="image/*" >
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson1" text="프로필 사진을 등록하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image1" text="면허증 사진"/></td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body2" id="sort_body2">
                                                            <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
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
                                                <input type="file" id="imgFile2" name="imgFile2" class="fileBtn d-none" accept="image/*" >
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson1" text="면허증 사진을 등록하세요."/></td>
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
                                            <%--<input type="text" class="form-control width-200 licenseType" name="licenseType" value="${tbUserWorker.licenseType}">--%>
                                            <label class="">
                                                 <input type="radio" name="licenseType" value="11" class="align-bottom licenseType" > <spring:message code="list.detail.male1" text="1종대형"/>
                                             </label>
                                             <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="12" class="align-bottom licenseType"  checked> <spring:message code="list.detail.female1" text="1종보통"/>
                                             </label>
                                            <%-- <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="13" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="1종소형"/>
                                             </label>
                                             <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="14" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="1종대형견인"/>
                                             </label>
                                             <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="15" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="1종구난"/>
                                             </label><br><br>
                                             <label class="">
                                                 <input type="radio" name="licenseType" value="16" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="1종소형견인"/>
                                             </label>--%>
                                             <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="32" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="2종보통"/>
                                             </label>
                                             <%--<label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="33" class="align-bottom licenseType"   <spring:message code="list.detail.female1" text="2종소형"/>
                                             </label>
                                             <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="34" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="2종특수"/>
                                             </label>
                                             <label class="m-l-10 ">
                                                 <input type="radio" name="licenseType" value="38" class="align-bottom licenseType"  > <spring:message code="list.detail.female1" text="2종원자"/>
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
                                                <input type="radio" name="licenseExpYn" value="0" class="align-bottom licenseExpYn"   checked> <spring:message code="list.detail.male1" text="유효"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="licenseExpYn" value="1" class="align-bottom licenseExpYn"  > <spring:message code="list.detail.female1" text="만료"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="면허 만료여부를 선택해주세요."/></td>
                                    </tr>

                                    <input type="hidden" name="pushOrderYn" value="false">
                                    <input type="hidden" name="pushNoticeYn" value="false">
                                    <input type="hidden" name="pushMarketingYn" value="false">
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.employeenumber" text="사원번호"/></td>
                                        <td colspan="1"><input type="text" name="registNum" value="" class="form-control width-200  registNum" maxlength="15"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryouremployeenumber" text="사원번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deliverymanname1" text="드라이버 이름"/></td>
                                        <td colspan="1"><input type="text" name="name" value="" class="form-control width-200 name" maxlength="15"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthenameoftheshipper1" text="드라이버 이름을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deliverymanphone1" text="드라이버 연락처"/></td>
                                        <td colspan="1"><input type="text" name="phone" value="" class="form-control width-200 phone" maxlength="15"></td>
                                        <td class="text-danger-darker">	<spring:message code="list.description.deliverymanphonemessage1" text="드라이버 연락처를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50"><spring:message code="list.detail.deliverymangender1" text="드라이버 성별"/></td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="gender" value="M" class="align-bottom gender" > <spring:message code="list.detail.male" text="남성"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="gender" value="F" class="align-bottom gender" > <spring:message code="list.detail.female" text="여성"/>
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="gender" value="N" class="align-bottom gender" checked> <spring:message code="list.detail.unknown" text="알수없음"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="성별을 설정하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.dateofentry" text="입사일"/></td>
                                        <td colspan="1">
                                            <label>
                                                <input type="text" class="form-control joinDate background-white" name="joinDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthedateofentry" text="입사일자를 입력하세요."/></td>
                                    </tr>
                                   <%-- <tr>
                                        <td class="bg-light">퇴사일</td>
                                        <td colspan="1">
                                            <label>
                                                <input type="text" class="form-control joinDate background-white" name="retireDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.residenceaddress" text="거주지 주소"/></td>
                                        <td colspan="1"><input type="text" name="addr" value="" class="form-control width-400" maxlength="150"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourresidentialaddress" text="거주지 주소를 입력하세요."/></td>
                                    </tr>
                                  <%--  <tr>
                                        <td class="bg-light">생년월일</td>
                                        <td colspan="1">
                                            <c:set var="now" value="<%=new java.util.Date()%>" />
                                            <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
                                            <label>
                                                <select class="form-control width-80 birthYear" name="">
                                                    <c:forEach var="i" begin="${sysYear - 100}" end="${sysYear}" step="1">
                                                        <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}년</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control width-80 birthMonth" name="">
                                                    <c:forEach var="i" begin="1" end="12" step="1" >
                                                        <option value="<fmt:formatNumber value="${i}" minIntegerDigits="2"/>" <c:if test="${i == now.month + 1}">selected</c:if> > ${i} 월</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control width-80 birthDate">
                                                </select>
                                            </label>
                                        </td>
                                    </tr>--%>
                                    <input type="hidden" name="deposit" value="0">
                                    <input type="hidden" name="cash" value="0">
                                    <input type="hidden" name="cashDefault" value="0">
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0">
                                                        <select class="form-control width-200 m-r-10 cybankTypeCode" name="cybankTypeCode">
                                                        </select>
                                                    </td>
                                                    <input type="hidden" name="bankAccount" value="">
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker border-left-0"><spring:message code="list.description.accountautomessage" text="캐시 충전시 입금할 은행을 선택하면 계좌번호가 자동 생성됩니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금계좌"/></td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                    <td class="border-top-0">
                                                        <select class="form-control width-200 m-r-10 bankTypeCode" name="bankTypeCode">
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-right-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                    <td><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="" maxlength="50" numberOnly></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-right-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                    <td><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="" maxlength="50"></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-right-0 border-bottom-0"><spring:message code="list.detail.pinnumber" text="PIN번호"/></td>
                                                    <td colspan="1" class="border-bottom-0">
                                                        <div class="pin-div">
                                                            <input  name="pinNum" class="form-control width-200 pinNum" value="" type="password" maxlength="60" numberOnly="true">
                                                            <i class="fa fa-eye fa-lg m-l-5"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker border-left-0"><spring:message code="list.description.questingawithdrawdeliverymanautomessage1" text="출금 요청시 입금받을 드라이버의 계좌 정보를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                        <td colspan="1"><input type="text" class="form-control width-600 memo" name="memo" value="" maxlength="150"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.shippersnote" text="드라이버 메모"/></td>
                                    </tr>
                                </form>
                               <%-- <tr>
                                    <td class="bg-light" >거주지 주소</td>
                                    <td colspan="1"><input type="text" class="form-control width-300"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">근무시간</td>
                                    <td colspan="1">
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="23" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="59" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        ~
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="23" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="59" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">운송수단</td>
                                    <td colspan="1">
                                        <select class="form-control">
                                            <option>2륜오토바이</option>
                                            <option>2륜전기오토바이</option>
                                            <option>2륜전기자전거</option>
                                            <option>3륜오토바이</option>
                                            <option>3륜전기오토바이</option>
                                            <option>3륜전기자전거</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>배송원 구분</td>
                                    <td colspan="1">
                                        <label class="font-size-10">
                                            <input type="radio" name="status2" class="align-bottom" checked>배달&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status2" class="align-bottom">집화/지선&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status2" class="align-bottom">간선&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배송원 메모</td>
                                    <td colspan="1"><input type="text" class="form-control width-300"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배송원 차량번호</td>
                                    <td colspan="1"><input type="text" class="form-control width-200"></td>
                                </tr>--%>
                            </table>
                        <%--    </table>
                                <div class="timeline-header m-t-10 m-b-10">
                                    <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                    <span><strong>공유 설정</strong></span>
                                </div>
                                <table class="table table-bordered">
                                <tr>
                                    <td>공유 유무</td>
                                    <td colspan="1">
                                        <label class="font-size-10">
                                            <input type="radio" name="status3" class="align-bottom" checked>공유&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status3" class="align-bottom">공유안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>동시배차 가능건수</td>
                                    <td colspan="1"><input type="text" class="form-control width-200">건</td>
                                </tr>
                                <tr>
                                    <td>미 공유 시간</td>
                                    <td colspan="1">
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="23" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="59" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        ~
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="23" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="59" varStatus="idx">
                                                    <c:choose>
                                                        <c:when test="${idx.index lt 10}">
                                                            <option value="0${idx.index}}">0${idx.index}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${idx.index}}">${idx.index}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>출발후 완료 가능 시간</td>
                                    <td colspan="1">
                                        <label>
                                            <select class="form-control">
                                                <option value="-1">적용안함</option>
                                                <c:forEach begin="1" end="30" varStatus="idx">
                                                    <option>${idx.index}분</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>검색 최소 반경(배송원-가맹점)</td>
                                    <td colspan="1">
                                        <label>
                                            <select class="form-control">
                                                <option value="-1">적용안함</option>
                                                <c:forEach begin="1" end="15" varStatus="idx">
                                                    <option>${idx.index}km</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>검색 최소 반경(가맹점-고객)</td>
                                    <td colspan="1">
                                        <label>
                                            <select class="form-control">
                                                <option value="-1">적용안함</option>
                                                <c:forEach begin="1" end="15" varStatus="idx">
                                                    <option>${idx.index}km</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light-darker text-center" colspan="5">배달대행료 수수료</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">구분</td>
                                    <td class="bg-light">내 가게 주문(직영 가맹점)</td>
                                    <td class="bg-light">타 가게A(일반가맹점)<br>(대행료 세무 미처리 운행시)</td>
                                    <td class="bg-light">타 가게B(일반가맹점)<br>(대행료 세무 처리 운행시)</td>
                                    <td class="bg-light">할인 가맹점</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">정액(원) / 정률(%) 선택</td>
                                    <td>
                                        <div class="d-table">
                                            <label class="d-table-cell">
                                                <input type="text" class="form-control width-200">
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status6" class="align-bottom" checked>원&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status6" class="align-bottom">%&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-table">
                                            <label class="d-table-cell">
                                                <input type="text" class="form-control width-200">
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status7" class="align-bottom" checked>원&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status7" class="align-bottom">%&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-table">
                                            <label class="d-table-cell">
                                                <input type="text" class="form-control width-200">
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status8" class="align-bottom" checked>원&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status8" class="align-bottom">%&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-table">
                                            <label class="d-table-cell">
                                                <input type="text" class="form-control width-200">
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status9" class="align-bottom" checked>원&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="p-l-5 font-size-10 d-table-cell">
                                                <input type="radio" name="status9" class="align-bottom">%&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">관리자CS 차감그룹수수료, 합산여부</td>
                                    <td>
                                        <label>
                                            <label class="font-size-10">
                                                <input type="radio" name="status10" class="align-bottom" checked>차감그룹 수수료에 추가 합산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <br>
                                            <label class="font-size-10">
                                                <input type="radio" name="status10" class="align-bottom">차감그룹 수수료만 정산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </label>
                                    </td>
                                    <td>
                                        <label>
                                            <label class="font-size-10">
                                                <input type="radio" name="status11" class="align-bottom" checked>차감그룹 수수료에 추가 합산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <br>
                                            <label class="font-size-10">
                                                <input type="radio" name="status11" class="align-bottom">차감그룹 수수료만 정산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </label>
                                    </td>
                                    <td>
                                        <label>
                                            <label class="font-size-10">
                                                <input type="radio" name="status12" class="align-bottom" checked>차감그룹 수수료에 추가 합산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <br>
                                            <label class="font-size-10">
                                                <input type="radio" name="status12" class="align-bottom">차감그룹 수수료만 정산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </label>
                                    </td>
                                    <td>
                                        <label>
                                            <label class="font-size-10">
                                                <input type="radio" name="status13" class="align-bottom" checked>차감그룹 수수료에 추가 합산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <br>
                                            <label class="font-size-10">
                                                <input type="radio" name="status13" class="align-bottom">차감그룹 수수료만 정산&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light" rowspan="3">출금 계좌 등록</td>
                                    <td>은행</td>
                                    <td colspan="1">
                                        <select class="form-control">
                                            <option>국민은행</option>
                                            <option>신한은행</option>
                                            <option>기업은행</option>
                                            <option>하나은행</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>계좌번호</td>
                                    <td colspan="1"><input type="text" class="form-control width-200"></td>
                                </tr>
                                <tr>
                                    <td>예금주</td>
                                    <td colspan="1"><input type="text" class="form-control width-200"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light" rowspan="2">충전계좌등록</td>
                                    <td>은행</td>
                                    <td colspan="1">
                                        <select class="form-control">
                                            <option>국민은행</option>
                                            <option>신한은행</option>
                                            <option>기업은행</option>
                                            <option>하나은행</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="border-bottom">
                                    <td>계좌번호</td>
                                    <td colspan="1"z>계좌 발행 시 자동으로 생성됩니다.</td>
                                </tr>
                            </table>--%>
                        </div>
                    <!-- end table-responsive -->
                <!-- end table-responsive -->
                    <div class="m-l-5 ">
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                        <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/></button>
                    </div>
                </div>
                <!-- end panel -->
                <!-- end col-8 -->
            </div>
        </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
<%--modal search end--%>


<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
</div>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
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

<script>
    $(() => {
        $(".licenseExpDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyymmdd",
            language: "kr"
        });

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

        getCalendar();

        //인출계좌
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

        //가상계좌정보
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


        //imgFile
        $(document).on("change", "#imgFile", function (e) {
            e.preventDefault();

            var result = chk_file_type(this);

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
            $('.deliverymanFileName1').text("변경할 이미지 :" + filename);
            $('.deliverymanFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });
        //imgFile2
        $(document).on("change", "#imgFile2", function (e) {
            e.preventDefault();

            var result = chk_file_type(this);

            var file2 = $("#imgFile2")[0].files[0],

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
                    sort_body2.innerHTML = '';
                    sort_body2.appendChild(img);
                }
            };
            reader.readAsDataURL(file2);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename2 = file2.name;
            } else {
                // old IE
                var filename2 = $("#imgFile2").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName2').text("변경할 이미지 :" + filename2);
            $('.deliverymanFileSize2').text("용량 :" + file2.size + " Byte");

            return false;
        });

        $(".btn_list").click(function() {
            location.href = "${path}/driver/deliveryman/list";
        });

        let date = new Date();

        $(".joinDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyymmdd",
            language: "kr"
        });

        $(".joinDate").datepicker('setDate', date);


        $(".birthMonth").change(function() {
            getCalendar();
        });

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            let noheadmsg = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
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
                            noheadmsg +
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
            let headNo = $(".headNo").val();
            let nodis = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
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
                            nodis+
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

        //가맹점 선택
        $(".searchStoreBtn").on("click",function(){
            let branchNo = $(".branchNo").val();
            $(".selBranchNo").val(branchNo);
            let req = convertFormToObj($('form.store_search_form'));
            let nostore = "<spring:message code="list.script.therearenoregisteredmerchants" text="등록된 가맹점이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/store/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchStoreList").html("");
                    if(data.searchStoreList.length == 0 || data.searchStoreList == null){
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            nostore +
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {

                        for(var i = 0 ; i < data.searchStoreList.length ; i++){
                            $(".searchStoreList").append(
                                " <li >" +
                                "     <label class=\"store_text\">\n" +
                                ""+data.searchStoreList[i].storeName+""+
                                "<small style=\"color: green;\">["+data.searchStoreList[i].storeNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName="+data.searchStoreList[i].storeName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo="+data.searchStoreList[i].storeNo+" value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            let selhead = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            if(headNo == null || headNo =='') {
                swal({
                    title: selhead,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            } else {
                $(".searchBranchBtn").click();
            }

        });

        $(document).on("click",".storeName",function(){
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();

            let selhead = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let seldis = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

            if(headNo == null || headNo =='') {
                swal({
                    title: selhead,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            }  else {
                if(branchNo == null || branchNo =='') {
                    swal({
                        title: seldis,
                        icon: "warning",
                        buttons: [
                            cancel,
                            confirm
                        ],
                        dangerMode: true,
                    });
                } else {
                    $(".searchStoreBtn").click();
                }
            }
        });

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".storeName").val("");
            $(".searchBranchList").html("");
            $(".searchStoreList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".storeName").attr("data-toggle","modal");
            $(".storeName").val("");
            $(".searchStoreList").html("");
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });


        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/deliveryman/insert/action";
            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let duplicatemsg = "<spring:message code="list.script.duplicateaccount" text="계정이 중복되었습니다."/>";

           if (inputDataCheck(req)) {
                swal({
                    title: confirmmsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbUserWorkerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        formData.append("imgFile2", $("#imgFile2")[0].files[0]);
                        $.ajax({
                            type: "POST",
                            url: url,
                            data:  formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    location.href = "${path}/driver/deliveryman/list";
                                } else if (data.result == 500) {
                                    alert(duplicatemsg);
                                    return;
                                }else {
                                    alert(confirmfailmsg);
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
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@#$%&\\\=\(\'\"]/gi;

       /* if (regExp.test(args.LoginId)) {
            return alert_focus("LoginId", "로그인ID에는 특수문자를 사용할수없습니다.");
        }
        if (isNull(args.bmLoginId)) {
            return alert_focus("LoginId", "로그인ID를 입력해주세요.");
        } else */
       if (isNull(args.name)) {
            return alert_focus("name", " 드라이버 이름을 입력해주세요");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "드라이버 연락처를 입력해주세요");
        }
       /*else if (isNull(args.bankAccount)) {
            return alert_focus("bankAccount", "계좌번호를 입력해주세요");
        } else if (isNull(args.bankAccount)) {
            return alert_focus("bankOwner", "예금주를 입력해주세요");
        } else if (isNull(args.pinNum)) {
            return alert_focus("pinNum", "pin번호를 입력해주세요");
        } */

       else if (isNull(args.storeNo)) {
            return alert_focus("storeNo", "가맹점을 선택해주세요");
        }
        return true;
    }



    function getCalendar() {
        let birthYear = $(".birthYear").val();
        let birthMonth = $(".birthMonth").val();
        let lastDate = new Date(birthYear, birthMonth, 0).getDate();
        let html = '';
        $(".birthDate").empty();

        for(let i = 1; i <= lastDate; i++) {
            html = '<option value="' + i + '">' + i + '일</option>';
            $(".birthDate").append(html);
        }
    }

    function chk_file_type(obj) {
        let imgmsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="취소"/>";
        var file_kind = obj.value.lastIndexOf('.');
        var file_name = obj.value.substring(file_kind+1,obj.length);
        var file_type = file_name.toLowerCase();
        var check_file_type = new Array();
        check_file_type = ['jpg','gif','png','jpeg','bmp','tif'];

        if(check_file_type.indexOf(file_type)==-1) {

            alert(imgmsg);
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
