<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 가맹점 상세</title>
    <%@include file="../../../common/include_head.jsp" %>
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
        <div id="content" class="content p-0">
            <div class="col-xl-12">
                <div class="p-t-20 p-b-0">
                    <ol class="breadcrumb float-xl-right p-r-10">
                        <li class="breadcrumb-item"><spring:message code="side.main1" text="업무그룹"/></li>
                        <li class="breadcrumb-item"><a href="${path}/workgroup/affilfranch/list"><spring:message code="side.main1.sub3" text="가맹점"/></a></li>
                        <li class="breadcrumb-item active">상세정보</li>
                    </ol>
                    <h3 class="rix-title p-b-5">가맹점 상세</h3>
                </div>
                <div class="m-t-10">
                    <table class="table table-bordered">
                        <tr>
                            <td class="bg-light height-40" style="width:15%"><strong>업무그룹</strong></td>
                            <td style="width:35%">
                                <span class="text-green">[H${tbStore.head.headNo}]</span> ${tbStore.head.headName} &nbsp;|&nbsp;
                                <span class="text-green">[B${tbStore.branch.branchNo}]</span> ${tbStore.branch.branchName}
                            </td>
                            <td class="bg-light" style="width:15%"><strong>가맹점</strong></td>
                            <td>
                                <span class="text-green" style="width:35%">[S${tbStore.storeNo}]</span> ${tbStore.storeName}
                            </td>
                        </tr>
                    </table>
                </div>
                <ul class="nav nav-tabs m-t-10">
                    <li class="nav-item">
                        <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                            <span class="d-sm-none">기본 정보<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                            <span class="d-sm-block d-none">기본 정보<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        </a>
                    </li>
                    <li class="nav-item">
                          <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="merchandise.detail.tab1" text="사업자 정보"/></span>
                              <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab1" text="사업자 정보"/></span>
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
                    <li class="nav-item">
                        <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none">온라인 플랫폼 설정<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                            <span class="d-sm-block d-none">온라인 플랫폼 설정<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#default-tab-8" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none">운영정보<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                            <span class="d-sm-block d-none">운영정보<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                        </a>
                    </li>
                     <li class="nav-item">
                          <a href="#default-tab-6" data-toggle="tab" class="nav-link">
                              <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="블록 배달팁 설정"/></span>
                              <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="블록 배달팁 설정"/></span>
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
                                <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%">서비스구분</td>
                                    <td style="width:60%">
                                        <label class="">
                                            <input type="radio" name="serviceYn" class="align-bottom serviceYn"
                                                   value="0"
                                                   <c:if test="${tbStore.serviceYn == 'TEST_OR_CALC'}">checked</c:if> > 테스트<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="serviceYn" class="align-bottom serviceYn"
                                                   value="1"
                                                   <c:if test="${tbStore.serviceYn == 'SERVICE'}">checked</c:if>> 서비스<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">테스트 설정시 정산이 이루어지지 않습니다.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">가맹점명</td>
                                    <td><input type="text" class="form-control width-200 storeName" name="storeName"
                                               value="${tbStore.storeName}"></td>
                                    <td class="text-danger-darker">가맹점 이름을 입력하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">기본 배송그룹</td>
                                    <td>
                                        <select class="form-control width-200 searchDlvyList dlvyNo" name="dlvyNo">
                                        </select>
                                    </td>
                                    <td class="text-danger-darker">기본 배송그룹을 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50">가맹점 상태</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dataStatus" value="0"
                                                   class="align-bottom dataStatus"
                                                   <c:if test="${tbStore.dataStatus == 'DELETE'}">checked</c:if>> 삭제<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="1"
                                                   class="align-bottom dataStatus"
                                                   <c:if test="${tbStore.dataStatus == 'OK'}">checked</c:if>> 정상<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="2"
                                                   class="align-bottom dataStatus"
                                                   <c:if test="${tbStore.dataStatus == 'STOP'}">checked</c:if>> 정지<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">사업자 인증 완료 후 정상으로 설정하세요.</td>
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
                                    <td class="bg-light height-50">24시간운영 여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="alldayOpenYn" value="false"
                                                   class="align-bottom alldayOpenYn"
                                                   <c:if test="${tbStore.alldayOpenYn == false}">checked</c:if>> 시간제
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="alldayOpenYn" value="true"
                                                   class="align-bottom alldayOpenYn"
                                                   <c:if test="${tbStore.alldayOpenYn == true}">checked</c:if>> 24시간
                                            운영<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">매장 24시 운영 여부를 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light height-50">매장타입</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="storeType" value="0"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.storeType == 'ONLY_DELIVERY'}">checked</c:if>> <spring:message
                                                code="merchandise.search1.option4" text="배달전용"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="storeType" value="1"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.storeType == 'ORDER_DELIVERY'}">checked</c:if>> <spring:message
                                                code="merchandise.search1.option4" text="주문배달"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="storeType" value="2"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.storeType == 'MART'}">checked</c:if>> <spring:message
                                                code="merchandise.search1.option4" text="마트"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="storeType" value="3"
                                                   class="align-bottom storeType"
                                                   <c:if test="${tbStore.storeType == 'TRADITIONAL_MARKET'}">checked</c:if>>
                                            <spring:message code="merchandise.search1.option4" text="전통시장"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">매장 운영 타입을 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">가맹점 대표번호</td>
                                    <td><input type="text" class="form-control width-200" name="storeTel"
                                               value="${tbStore.storeTel}"></td>
                                    <td class="text-danger-darker">대표번호를 입력하세요.</td>
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
                                    <td class="bg-light">인증 휴대전화</td>
                                    <td><input type="text" class="form-control width-200" name="authTel"
                                               value="${tbStore.authTel}"></td>
                                    <td class="text-danger-darker">인증시 사용할 휴대전화번호를 입력하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">영업담당자 이름</td>
                                    <td><input type="text" class="form-control width-200" name="mngrName"
                                               value="${tbStore.mngrName}"></td>
                                    <td class="text-danger-darker">영업 담당자 이름을 입력하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">주소명칭</td>
                                    <td>
                                        <label class="m-r-10">
                                            <input type="text" class="form-control width-200" name="poi" value="${tbStore.poi}"  placeholder="기본 주소명을 입력해주세요">
                                            <input
                                                    id="pac-input"
                                                    class="form-control width-350"
                                                    type="text"
                                                    placeholder="주소를 검색해주세요"
                                            /><%--<input type="button" onclick="initAutocomplete()" id="addressSearchButton" class="btn btn-primary p-t-5 p-b-5 m-l-10" value="주소검색">--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker">앱에 표시될 주소 명칭입니다.</td>
                                </tr>
                                    <%--<tr>
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
                                                            </labe
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="width-150 border-left-0 border-bottom-0">마스터가맹 정산방식</td></td>
                                                        <td class="border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                            <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="0" <c:if test="${tbStore.masterChargeYn.ordinal() == 0}">checked</c:if>=""> 수동정산</label>
                                                            <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="1"  <c:if test="${tbStore.masterChargeYn.ordinal() == 1}">checked</c:if>> 실시간정산</label>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>--%>
                                <tr>
                                    <td class="bg-light">지도</td>
                                    <td>
                                        <div id="map" class="height-300 width-full"></div><br>
                                        <input type="hidden" class="addr_1" id="addr_1" name="addr1" value="${tbStore.addr1}">
                                        위도 <input type="text" id="lat" name="lat" value="${tbStore.lat}" readonly>
                                        경도 <input type="text" id="lng" name="lng" value="${tbStore.lng}" readonly>
                                        </label><br><br>
                                        <input type="text" class="form-control width-100" id="addr_1" name="addr1" value="${tbStore.addr1}">
                                        <input type="text" class="form-control width-100" id="addr_2" name="addr2" value="${tbStore.addr2}">
                                        <input type="text" class="form-control width-200" id="addr_3" name="addr3" value="${tbStore.addr3}">
                                        <input type="text" class="form-control width-200" id="addr_4" name="addr4" value="${tbStore.addr4}" placeholder="나머지주소" >
                                    </td>
                                    <td class="text-danger-darker">주소를 검색하면 주소 정보와 좌표가 자동 세팅됩니다.</td>
                                </tr>
                                    <tr>
                                        <td class="bg-light">주소상세</td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-400" name="addr5" value="${tbStore.addr5}">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">주소 상세 항목이 있으면 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">멀티가맹점 설정</td>
                                        <td class="p-0 ">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 border-bottom-0 width-200">멀티가맹점 타입</td>
                                                    <td class="border-0">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="0" <c:if test="${tbStore.multiType.ordinal() == 0}">checked</c:if>> 사용안함</label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="1" <c:if test="${tbStore.multiType.ordinal() == 1}">checked</c:if>> 종속</label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiType" value="2" <c:if test="${tbStore.multiType.ordinal() == 2}">checked</c:if>> 마스터</label>
                                                    </td>
                                                </tr>
                                                <tr class="multi_form_master_tr p-0"  style="display: <c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 1}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 2}"></c:if>">
                                                    <td class="width-200  border-left-0 border-bottom-0">종속가맹 상품 판매대행 </td>
                                                    <td class="border-left-0  border-bottom-0" colspan="2">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="masterGoodsYnChk" name="masterGoodsYnChk" value="0" <c:if test="${tbStore.masterGoodsYn.ordinal() == 0}">checked</c:if>> 관리안함</label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterGoodsYnChk" name="masterGoodsYnChk" value="1"  <c:if test="${tbStore.masterGoodsYn.ordinal() == 1}">checked</c:if>> 판매관리</label>
                                                    </td>
                                                </tr>
                                               <tr class="multi_form_slave_tr" style="display:<c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 2}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 1}"></c:if>">
                                                    <td class="width-200 border-left-0 border-right-0">마스터 가맹점 선택</td>
                                                    <td class="" >
                                                        <label>
                                                            <select class="form-control masterStoreNo" name="masterStoreNoSelect">
                                                            </select>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr class="multi_form_slave_tr" style="display:<c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 2}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 1}"></c:if>">
                                                    <td class="width-200 border-left-0 border-top-0 border-bottom-0">마스터가맹 정산방식</td>
                                                    <td class="border-0">
                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="0" <c:if test="${tbStore.masterChargeYn.ordinal() == 0}">checked</c:if>=""> 수동정산</label>
                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; class="masterChargeYnChk" name="masterChargeYnChk" value="1"  <c:if test="${tbStore.masterChargeYn.ordinal() == 1}">checked</c:if>> 실시간정산</label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker">멀티가맹점 설정을 선택해주세요.</td>
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
                                    <td class="bg-light">예치금</td>
                                    <td><input type="texy" class="form-control width-200 deposit" name="deposit"
                                               value="${tbStore.deposit}" numberOnly readonly></td>
                                    <td class="text-danger-darker">충전 계좌로 이체시 예치금으로 입금됩니다.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">캐시</td>
                                    <td><input type="text" class="form-control width-200 cash" name="cash"
                                               value="${tbStore.cash}" numberOnly readonly> ( 체납금 : ${tbStore.cashDefault} 원 )
                                        <input type="hidden" name="cashDefault" value="${tbStore.cashDefault}" />
                                    </td>
                                    <td class="text-danger-darker">체납금이 존재하면 사용이 정지됩니다.</td>
                                </tr>
                                    <tr>
                                        <td class="bg-light">충전 계좌</td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200">은행</td>
                                                    <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200"  value="${cBankName}" readonly>
                                                        <input type="hidden" class="form-control width-200 cybankTypeCode" name="cybankTypeCode" value="${tbStore.cybankTypeCode}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0">계좌번호</td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 cybankAccount" name="cybankAccount" value="${tbStore.cybankAccount}" readonly></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker">수정 불가</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">출금 계좌</td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200">은행</td>
                                                    <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200 "  value="${bankName}" readonly>
                                                        <input type="hidden" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${tbStore.bankTypeCode}" readonly>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0">계좌번호</td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="${tbStore.bankAccount}" readonly></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0">예금주</td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="${tbStore.bankOwner}" readonly></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0">PIN번호</td>
                                                    <td class="border-bottom-0 border-right-0">
                                                        <div class="pin-div">
                                                            <input  name="pinNum" class="form-control width-200 pinNum" value="${tbStore.pinNum}" type="password" >
                                                            <i class="fa fa-eye fa-lg m-l-5"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker">수정 불가</td>
                                    </tr>
                                <tr>
                                    <td class="bg-light">메모</td>
                                    <td><input type="text" class="form-control width-600" name="memo"
                                               value="${tbStore.memo}"></td>
                                    <td class="text-danger-darker">기타 메모</td>
                                </tr>
                            </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
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
                                        <td class="bg-light">상호</td>
                                        <td>
                                            <input type="text" class="form-control width-200 bizName" name="bizName" value="${tbStore.businessInfo.bizName}">
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="1" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'NORMAL'}">checked</c:if>>일반
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="2" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'SIMPLE_BUSINESS'}">checked</c:if>>간이
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="3" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'CORPORATION'}">checked</c:if>>법인
                                            </label>
                                            <label class="font-size-10 m-l-10">
                                                <input type="radio" name="corpType" value="0" class="align-bottom corpType" <c:if test="${tbStore.businessInfo.corpType eq 'UNKNOWN'}">checked</c:if>>알수없음
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">사업자등록증 기준의 상호를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" style="width:15%">사업자 등록번호</td>
                                        <td style="width:60%"><input type="text" class="form-control width-200 bizNum" name="bizNum" value="${tbStore.businessInfo.bizNum}"></td>
                                        <td class="text-danger-darker">사업자등록증의 등록번호를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">인증 상태</td>
                                        <td>
                                            <select class="form-control m-r-10 authStatus" name="authStatus">
                                                <option value="0" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 0}"> selected </c:if>>미인증</option>
                                                <option value="1" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 1}"> selected </c:if>>대기</option>
                                                <option value="2" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 2}"> selected </c:if>>승인</option>
                                                <option value="3" <c:if test="${tbStore.businessInfo.authStatus.ordinal() == 3}"> selected </c:if>>거절</option>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker">사업자 인증후 서비스 이용이 가능합니다.</td>
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
                                        <td class="bg-light">대표자 명</td>
                                        <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="${tbStore.businessInfo.bizOwner}"></td>
                                        <td class="text-danger-darker">사업자등록증 기준의 대표자를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">이메일</td>
                                        <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value="${tbStore.businessInfo.bizEmail}"></td>
                                        <td class="text-danger-darker">계산서를 수신할 이메일을 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">연락처</td>
                                        <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value="${tbStore.businessInfo.bizTel}"></td>
                                        <td class="text-danger-darker">사업자 연락처를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">사업장 주소</td>
                                        <td><input type="text" name="bizAddr" class="form-control width-400 bizAddr" value="${tbStore.businessInfo.bizAddr}"></td>
                                        <td class="text-danger-darker">사업자등록증 상의 주소를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">업태/업종</td>
                                        <td>
                                            <input type="text" name="bizType" class="form-control m-r-10 width-200 bizType" value="${tbStore.businessInfo.bizType}">
                                            <input type="text" name="bizItem" class="form-control width-200 bizItem" value="${tbStore.businessInfo.bizItem}">
                                        </td>
                                        <td class="text-danger-darker">사업자등록증 상의 업태와 종목를 입력하세요.</td>
                                    </tr>
                                </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            </div>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-3">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td rowspan="4" class="bg-light-darker">만나 플랫폼</td>
                                    <td class="bg-light">사용 여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">사용안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">주문건당 사용료</td>
                                    <td>660원 / 월 최대 66,000</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">차감 시작일</td>
                                    <td>
                                        <label>
                                            <input type="text" class="date form-control background-white" readonly>
                                        </label>
                                        <label>
                                            부터 차감 / 매월
                                        </label>
                                        <label>
                                            <select class="form-control width-80">
                                                <c:forEach begin="1" end="28" varStatus="idx">
                                                    <option>${idx.index}일</option>
                                                </c:forEach>
                                                <option>말일</option>
                                            </select>
                                        </label>
                                        <label>
                                            누적금액 초기화
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">수수료 정산대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom" checked>지정
                                            안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">지정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light-darker" rowspan="2">온라인 플랫폼</td>
                                    <td class="bg-light">주문건당 가맹비</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200" value="0">
                                        </label>
                                        <label>
                                            % (주문금액 대비)
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">수수료 정산대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom" checked>지정
                                            안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">지정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="4" class="bg-light-darker">MCS 플랫폼</td>
                                    <td class="bg-light">사용 여부</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">사용안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">월 사용료</td>
                                    <td><input type="text" class="form-control width-200"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">차감 시작일</td>
                                    <td>
                                        <label>관리자_D 에서 신청 가능합니다</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">수수료 정산대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>소속총판<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">영업총판<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3" class="bg-light-darker">기타 사용료</td>
                                    <td class="bg-light">심부름 건당관리비</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200">
                                        </label>
                                        <label>
                                            원 이하 주문 시 심부름 건당관리비 차감안함
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">알림톡 건당</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200">
                                        </label>
                                        <label>
                                            원
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">친구톡 건당</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200">
                                        </label>
                                        <label>
                                            원
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light-darker">리스비</td>
                                    <td colspan="2">
                                        <label>
                                            <label>
                                                <select class="form-control width-200">
                                                    <option>리스비 구분 선택</option>
                                                    <option>프린터 리스</option>
                                                    <option>키폰 리스</option>
                                                    <option>CID 리스</option>
                                                    <option>전기자전거 리스</option>
                                                    <option>운전자보험(바이크마스터)</option>
                                                    <option>오토바이리스(바이크마스터)</option>
                                                    <option>오토바이렌탈(대전런닝맨)</option>
                                                    <option>기타장비 리스</option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" class="form-control width-200" placeholder="관리명 입력">
                                            </label>
                                            <label>
                                                <input type="text" class="form-control width-200" placeholder="0">원
                                            </label>
                                        </label>
                                        <br>
                                        <label class="m-t-10">
                                            <label>
                                                <input type="text" class="date form-control background-white" readonly>부터
                                            </label>
                                            <label class="m-l-5 ">
                                                <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                       class="align-bottom">매월<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                            <label>
                                                <select class="form-control width-80">
                                                    <option>1일</option>
                                                    <option>5일</option>
                                                    <option>10일</option>
                                                    <option>15일</option>
                                                    <option>20일</option>
                                                    <option>25일</option>
                                                    <option>말일</option>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control width-80">
                                                    <c:forEach begin="1" end="24" varStatus="idx">
                                                        <option>${idx.index}개월</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label class="m-l-5 ">
                                                <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                       class="align-bottom">매일<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                            <label>
                                                <select class="form-control width-80">
                                                    <c:forEach begin="1" end="365" varStatus="idx">
                                                        <option>${idx.index}일</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <button type="button" class="btn-box">등록하기</button>
                                            </label>
                                        </label>
                                        <br>
                                        <label class="col-form-label">
                                            <i class="fa fa-asterisk rix_asterisk " title="필수 입력 항목입니다.">
                                                <strong class="">리스비 사용시
                                                    등록하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-4">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light">가맹점 특이시항(드라이버용)</td>
                                    <td colspan="2"><input type="text" class="form-control width-200"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">24시간
                                        운영<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td colspan="2">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>설정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">설정안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">할증여부
                                        표시설정<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td colspan="3">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>표시<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">표시안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">배달의 민족 포장주문
                                        연동<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td colspan="3">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>표시<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">표시안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">상품 준비시간</td>
                                    <td colspan="2">
                                        <select class="form-control width-80">
                                            <option>5분</option>
                                            <option>10분</option>
                                            <option>15분</option>
                                            <option>20분</option>
                                            <option>25분</option>
                                            <option>30분</option>
                                            <option>40분</option>
                                            <option>50분</option>
                                            <option>60분</option>
                                            <option>90분</option>
                                            <option>120분</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">접수시
                                        자동변경<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td colspan="3">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom">배달요청으로
                                            변경<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom">완료로
                                            변경<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="4" class="bg-light">MCS 플랫폼</td>
                                    <td>차감대상</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">총판<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">가맹점<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>현금결제 시 배송원 상품대금 지불방식</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom" checked>현금
                                            가능<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom">페이만 가능 (완료시
                                            자동정산)<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>배송원 정산</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>정산<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">정산안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>세무 처리</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>현금영수증(플랫폼사)<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">세금계산서(플랫폼사)<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">세금계산서(소속총판)<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">자체발행(소속총판)<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="p-l-10">
                                            <button type="button" class="btn btn-gray" data-toggle="modal"
                                                    data-target="#listRequest_modal">신청내역
                                            </button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배달대행 락 타임</td>
                                    <td colspan="2">
                                        <select class="form-control width-80">
                                            <option>즉시</option>
                                            <option>10초</option>
                                            <option>20초</option>
                                            <option>30초</option>
                                            <option>40초</option>
                                            <option>50초</option>
                                            <option>1분</option>
                                            <option>2분</option>
                                            <option>5분</option>
                                            <option>7분</option>
                                            <option>10분</option>
                                            <option>공유안함</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">외부 포스 연동</td>
                                    <td colspan="2">
                                        <label>
                                            <select class="form-control width-170">
                                                <option value="">포스 선택</option>
                                                <option value="1001">유니타스</option>
                                                <option value="1002">SPC</option>
                                                <option value="1003">SKY포스A</option>
                                                <option value="1004">EasyPOS</option>
                                                <option value="1005">솔비POS</option>
                                                <option value="1006">OK POS(KIS)</option>
                                                <option value="1007">푸드테크</option>
                                                <option value="1008">KFC</option>
                                                <option value="1009">OK POS(스파이더)</option>
                                                <option value="1015">씨스페이스</option>
                                                <option value="1018">도깨비포스(마마트)</option>
                                                <option value="1019">바나나포스</option>
                                                <option value="1020">도깨비포스(포유25)</option>
                                                <option value="1021">BBQ-M</option>
                                                <option value="1022">네투시스</option>
                                                <option value="1023">CNTT</option>
                                                <option value="1024">콜신저</option>
                                                <option value="1025">여보세요</option>
                                                <option value="1027">포스피드</option>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <option value="">브랜드없음</option>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="text" class="form-control width-200" placeholder="포스매장코드">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-gray">연동하기</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배달 가능 지역 설정</td>
                                    <td colspan="2">
                                        <label class="">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;  class="align-bottom"
                                                   checked>사용안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" padding: 0 10px 0 50px; min-width:400px;
                                                   class="align-bottom">사용<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-5">
                        <div class="table-responsive">
                            <form class="update_form" id="update_form5" method="post">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%">가맹점 표시명</td>
                                    <td style="width:60%"><input type="text" class="form-control width-200" name="storeNameInapp" value="${tbStore.storeNameInapp}"></td>
                                    <td class="text-danger-darker">앱에 표시되는 매장 이름입니다.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">가맹점 소개</td>
                                    <td>
                                        <input type="text" class="form-control width-400"  name="storeIntro" value="${tbStore.storeIntro}">
                                        <%--${tbStore.storeIntro}--%>
                                    </td>
                                    <td class="text-danger-darker">앱에 표시되는 간략한 매장 소개입니다.</td>
                                </tr>

                                <tr>
                                    <td class="bg-light">주문 카테고리</td>
                                    <td>
                                        <c:forEach var="item" items="${tbSystemCategory}" varStatus="status1">
                                    <label class=" m-r-5">
                                     <%--   <input class="chkCatCode" type="checkbox"
                                               catCode="${item.catCode}"
                                               catLevel="${item.catLevel}"
                                               catValue="${item.catValue}"
                                               parentCatCode="${item.parentCatCode}"
                                               name="" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;
                                        <c:forEach var="itemFo" items="${tbStoreCategoryFo}" varStatus="status2">
                                            <c:choose>
                                                <c:when test="${item.catCode == itemFo.catCode}">
                                                       checked
                                                </c:when>
                                                </c:choose>
                                        </c:forEach>
                                        >--%>



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
                                        <%--<tr class="detailRow" storeNo="${item.storeNo}">
                                            <td class="select-td checkbox_label" onclick="event.cancelBubble = true">
                                                <input type="checkbox" name="chk" id="select${status.index}" class="checkbox d-none">
                                                <label for="select${status.index}" class="input-label"> <i class="fa fa-square check_all_i"></i></label>
                                            </td>
                                            <td>${status.index + 1}</td>
                                            <td><fmt:formatNumber value="${item.cashDefault}" pattern="#,###" /> 원</td>
                                            <td>${item.storeTel}</td>
                                            <td class="text-right">${item.insertDate}</td>
                                        </tr>--%>

                                        <%--<label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>치킨
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>중식
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>피자
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>한식/분식
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>족발/보쌈
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>야식
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>돈까스/일식/회
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>도시락/죽/패스트푸드
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>찜/탕
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>카페/디저트
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>편의점
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>반찬
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>마트
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>봉투
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>기타
                                        </label>
                                        <label class=" m-r-5">
                                            <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>미분류
                                        </label>--%>
                                    </td>
                                    <td class="text-danger-darker">앱에 노출될 배달 카테고리를 선택하세요.</td>
                                    <%--    <tr>
                                            <td class="bg-light">주문가능 서비스</td>
                                            <td>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>배달주문
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>포장주문
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>테이블주문
                                                </label>
                                            </td>
                                        </tr>--%>
                                <tr>
                                    <td class="bg-light">
                                        매장 썸네일 이미지
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
                                                    <div>파일선택</div>
                                                </div>
                                            </label>
                                            <input type="file" id="imgFileSmall" name="imgFileSmall" value="${tbStore.imgFileSmall}"
                                                   class="fileBtn d-none">
                                            <input type="hidden" name="imgFileSmall" value="${tbStore.imgFileSmall}">
                                        </div>
                                    </td>
                                    <td class="text-danger-darker">배달 카테고리내 매장리스트에 표시되는 작은 이미지입니다.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">
                                        메인 이미지
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
                                                    <div>파일선택</div>
                                                </div>
                                            </label>
                                            <input type="file" id="imgFile1" name="imgFile1" value="${tbStore.imgFile1}"
                                                   class="fileBtn d-none">
                                            <input type="hidden" name="imgFile1" value="${tbStore.imgFile1}">
                                        </div>
                                    </td>
                                    <td class="text-danger-darker">매장 메인에 표시되는 이미지입니다.</td>
                                </tr>
                                <%--<tr>
                                    <td class="bg-light">가맹점 설명</td>
                                    <td><input type="text" class="form-control width-400" value=""></td>
                                </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">영업 상태</td>
                                     <td>
                                         <label class="">
                                             <input type="radio" name="status19" class="align-bottom"
                                                    checked>영업&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                         </label>
                                         <label class="m-l-10 ">
                                             <input type="radio" name="status19"
                                                    class="align-bottom">휴식&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">영업 시간</td>
                                     <td>
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="23" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="59" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                         ~
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="23" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                         <label>
                                             <select class="form-control width-70">
                                                 <c:forEach begin="00" end="59" var="hour">
                                                     <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if></option>
                                                     <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if></option>
                                                 </c:forEach>
                                             </select>
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">영업 요일</td>
                                     <td>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>일
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>월
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>화
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>수
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>목
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>금
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status20" checked>토
                                         </label>
                                     </td>
                                 </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">봉사료</td>
                                     <td class="p-0">
                                         <table class="width-full">
                                             <tr>
                                                 <td class="border-left-0 border-top-0">구간1</td>
                                                 <td class="border-left-0 border-top-0 border-right-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 미만 주문 시
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-left-0">구간2</td>
                                                 <td class="border-right-0 border-left-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 미만 주문 시
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-left-0">구간3</td>
                                                 <td class="border-right-0 border-left-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 미만 주문 시
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-bottom-0 border-left-0">최종 구간</td>
                                                 <td class="border-bottom-0 border-right-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">원 이상
                                                     </label>
                                                     <label>
                                                         <input type="text" class="form-control width-200">원
                                                     </label>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                 </tr>--%>
                                <%-- <tr>
                                     <td class="bg-light">결제수단설정</td>
                                     <td>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>선결제(신용카드)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>선결제(제로페이)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>선결제(온통대전)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>만나서결제(현금)
                                         </label>
                                         <label class=" m-r-5">
                                             <input type="checkbox" class="align-bottom" name="status22" checked>만나서결제(카드)
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">외부 주문플랫폼 연동</td>
                                     <td>
                                         <label>
                                             <select class="form-control width-170">
                                                 <option>플랫폼 선택</option>
                                                 <option>KT지니</option>
                                                 <option>바로플랫폼</option>
                                                 <option>KIS(스마트오더)</option>
                                                 <option>스마트데이터</option>
                                                 <option>모아플랫폼</option>
                                                 <option>KG이니시스</option>
                                             </select>
                                         </label>
                                         <label>
                                             <input type="text" class="form-control width-200"
                                                    placeholder="외부 주문플랫폼 가맹점 식별자">
                                         </label>
                                         <label>
                                             <button type="button" class="btn-box">연동 추가</button>
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">보이는 ARS</td>
                                     <td class="p-0">
                                         <table class="width-full">
                                             <tr>
                                                 <td class="border-top-0">ARS 번호</td>
                                                 <td class="border-top-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">
                                                     </label>
                                                     <label>
                                                         <button type="button" class="btn-box">번호 검색</button>
                                                     </label>
                                                 </td>
                                                 <td rowspan="2" class="p-0 border-top-0 border-bottom-0 border-right-0"
                                                     style="width: 60%; max-width: 60%;">
                                                     <label>
                                                         <button type="button" class="btn btn-gray"
                                                                 style="height: 95px; width: 95px; border-radius: 0;">ARS 설정
                                                         </button>
                                                     </label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="border-bottom-0">연결 URL</td>
                                                 <td class="border-bottom-0">
                                                     <label>
                                                         <input type="text" class="form-control width-200">
                                                     </label>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                 </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">배달가능 최소 주문금액</td>
                                     <td>
                                         <label>
                                             <input type="text" class="form-control width-200">원 이상 주문 가능
                                         </label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="bg-light">매장 테이블 개수</td>
                                     <td>
                                         <label>
                                             <input type="text" class="form-control width-200">개
                                         </label>
                                     </td>
                                 </tr>--%>

                                <%-- <tr>
                                     <td class="bg-light">영수증 원산지 표시</td>
                                     <td>
                                         <label>
                                             <input type="text" class="form-control width-300">
                                         </label>
                                     </td>
                                 </tr>--%>
                            </table>
                            </form>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            </div>
                        </div>
                    </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-6">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6">
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="20%"/>
                                        <col width="20%"/>
                                        <col width="15%"/>
                                        <col width="15%"/>
                                        <col width="20%"/>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th colspan="6" class="tabla-custom-title">블록 등록/수정</th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light text-center">선택</th>
                                        <th class="bg-light">블록명</th>
                                        <th class="bg-light">금액</th>
                                        <th class="bg-light">요금구분</th>
                                        <th class="bg-light">상태</th>
                                        <th class="bg-light">정렬</th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light"></th>
                                        <td><input type="text" class="form-control-width-custom"></td>
                                        <th>
                                            <input type="text" class="form-control-width-custom">
                                        </th>
                                        <td>
                                            <select class="form-control-width-custom">
                                                <option>고정</option>
                                                <option>추가</option>
                                            </select>
                                        </td>
                                        <th>
                                            <select class="form-control-width-custom">
                                                <option>정상</option>
                                                <option>정지</option>
                                            </select>
                                        </th>
                                        <td>
                                            <button type="button" class="btn btn-purple"><i class="fa fa-cog"></i> 초기화
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="float-right m-b-20">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-white border-right-0 color">등록</button>
                                        <button type="button" class="btn btn-white btn-draw">그리기</button>
                                        <button type="button" class="btn btn-white btn-draw-hide d-none">숨기기</button>
                                    </div>
                                </div>
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <tbody>
                                    <tr>
                                        <th colspan="6" class="tabla-custom-title">등록 리스트</th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light text-center">선택</th>
                                        <th class="bg-light">블록명</th>
                                        <th class="bg-light">금액</th>
                                        <th class="bg-light">요금구분</th>
                                        <th class="bg-light">상태</th>
                                        <th class="bg-light">정렬</th>
                                    </tr>
                                    <tr>
                                        <th><input type="radio"></th>
                                        <td>신도림동</td>
                                        <th>
                                            <input type="text" class="form-control-width-custom">
                                        </th>
                                        <td>
                                            <select class="form-control-width-custom">
                                                <option>고정</option>
                                                <option>추가</option>
                                            </select>
                                        </td>
                                        <th>
                                            <select class="form-control-width-custom">
                                                <option>정상</option>
                                                <option>정지</option>
                                            </select>
                                        </th>
                                        <td>
                                            <div class="d-table m-auto">
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-double-up align-sub"></span>
                                                </a>
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-up align-sub"></span></a>
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-down align-sub"></span>
                                                </a>
                                                <a class="btn btn-out width-30 height-25 cursor-pointer d-table-cell">
                                                    <span class="fa fa-angle-double-down align-sub"></span>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-6 col-lg-6 height-400">
                                <div id="tipmap" class="height-full width-full"></div>
                            </div>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            </div>
                        </div>
                    </div>

                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-7">
                        <div class="height-500" data-scrollbar="true">
                            <div class="table-responsive">
                                <table class="table table-condensed table-bordered">
                                    <thead>
                                    <th>특정지명</th>
                                    <th>추가요금</th>
                                    <th>검색범위</th>
                                    <th>등록/수정/삭제</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input type="text" class="form-control width-200" placeholder="특정지명을 입력하세요">
                                        </td>
                                        <td><input type="text" class="form-control width-200" value="0">원</td>
                                        <td>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">지번
                                            </label>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">도로명
                                            </label>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">상세주소
                                            </label>
                                            <label class=" m-r-5">
                                                <input type="checkbox" class="align-bottom">행정동명
                                            </label>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary">등록</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </td>
                                    </tr>
                                    <c:forEach begin="0" end="5">
                                        <tr>
                                            <td><input type="text" class="form-control width-200" placeholder="특정지명을 입력하세요">
                                            </td>
                                            <td><input type="text" class="form-control width-200" value="0">원</td>
                                            <td>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>지번
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>도로명
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>상세주소
                                                </label>
                                                <label class=" m-r-5">
                                                    <input type="checkbox" class="align-bottom" padding: 0 10px 0 50px; min-width:400px;  checked>행정동명
                                                </label>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary">수정</button>
                                                <button type="button" class="btn btn-danger">삭제</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-8">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light" style="width:15%">영업상태</td>
                                    <td style="width:60%">
                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="saleStatus" value="1"> 영업</label>
                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="saleStatus" value="0" checked=""> 휴식</label>
                                    </td>
                                    <td class="text-danger-darker">매장 open/close 상태를 변경할 수 있습니다.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">영업요일</td>
                                    <td>
                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px;  id="sOrdWorkType" name="sOrdWorkType" value="1" onclick="fncWorkDayChDisplay('1');" checked> 평일 / 주말 동일</label>
                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px;  id="sOrdWorkType" name="sOrdWorkType" value="2" onclick="fncWorkDayChDisplay('2');" checked> 평일 / 주말 별도</label>
                                    </td>
                                    <td class="text-danger-darker">평일과 주말의 영업시간이 동일한지를 선택하세요.</td>
                                </tr>
                                <tr class="padding-0">
                                    <td class="bg-light">영업시간</td>
                                    <td class="padding-0 border-left-0">
                                        <table class="border-left-0 border-top-0 border-bottom-0" style="width:100%;">
                                            <tbody><tr id="eWorkDay_0" style="display:none">
                                                <td class="border-left-0 border-top-0 border-bottom-0 width-100" id="eAllDayTime">매일</td>
                                                <td class="border-left-0 border-right-0 border-top-0 border-bottom-0">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('0');" value="24시간">
                                                </td>
                                            </tr>
                                            <tr id="eWorkDay_1" style="">
                                                <td class="border-left-0 border-top-0 width-100" id="eAllDayTime">월 ~ 금</td>
                                                <td class="border-left-0 border-right-0 border-top-0">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('1');" value="24시간">
                                                </td>
                                            </tr>
                                            <tr id="eWorkDay_2" style="">
                                                <td class="border-left-0 width-100" id="eAllDayTime">토요일</td>
                                                <td class="border-right-0">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('2');" value="24시간">
                                                </td>
                                            </tr>
                                            <tr id="eWorkDay_3" style="">
                                                <td class="border-left-0 border-top-0 border-bottom-0 width-100" id="eAllDayTime">일요일</td>
                                                <td class="border-left-0 border-top-0 border-bottom-0 border-right-0 ">
                                                    <label style="">시작</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <label style="">종료</label>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>								</select>
                                                    <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                        <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>								</select>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" onclick="fncInitTime('3');" value="24시간">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker">영업시간을 선택하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">휴게시간</td>
                                    <td class="padding-0 ">
                                        <table style="width:100%;" class="">
                                            <tbody>
                                            <tr id="eBreakTime_0">
                                                <td class="border-left-0 border-top-0 border-bottom-0 border-right-0" colspan="2">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTime" value="0" checked="" onclick="fncBreakTimeChDisplay('0');"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTime" value="1" onclick="fncBreakTimeChDisplay('1');" checked> 설정</label>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_1" style="">
                                                <td class="width-100 border-left-0 border-right-0">일요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSunday" value="N" checked="" onclick="$('#eSBreakTime_0').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSunday" value="Y" onclick="$('#eSBreakTime_0').show();"> 설정</label>

                                                    <span id="eSBreakTime_0" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_2" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">월요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeMonday" value="N" checked="" onclick="$('#eSBreakTime_1').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeMonday" value="Y" onclick="$('#eSBreakTime_1').show();"> 설정</label>

                                                    <span id="eSBreakTime_1" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_3" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">화요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeTuesday" value="N" checked="" onclick="$('#eSBreakTime_2').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeTuesday" value="Y" onclick="$('#eSBreakTime_2').show();"> 설정</label>

                                                    <span id="eSBreakTime_2" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_4" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">수요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeWednesday" value="N" checked="" onclick="$('#eSBreakTime_3').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeWednesday" value="Y" onclick="$('#eSBreakTime_3').show();"> 설정</label>

                                                    <span id="eSBreakTime_3" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_5" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">목요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeThursday" value="N" checked="" onclick="$('#eSBreakTime_4').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeThursday" value="Y" onclick="$('#eSBreakTime_4').show();"> 설정</label>

                                                    <span id="eSBreakTime_4" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" name="">
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_6" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-right-0">금요일</td>
                                                <td class="border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeFriday" value="N" checked="" onclick="$('#eSBreakTime_5').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeFriday" value="Y" onclick="$('#eSBreakTime_5').show();"> 설정</label>

                                                    <span id="eSBreakTime_5" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            <tr id="eBreakTime_7" style="">
                                                <td class="width-100 border-left-0 border-top-0 border-bottom-0 border-right-0">토요일</td>
                                                <td class="border-bottom-0 border-right-0" style="line-height: 30px;">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSaturday" value="N" checked="" onclick="$('#eSBreakTime_6').hide();"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="breakTimeSaturday" value="Y" onclick="$('#eSBreakTime_6').show();"> 설정</label>

                                                    <span id="eSBreakTime_6" style="display:none;">
                                                        <label style="padding: 0 10px 0 50px">시작</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04">04 시</option><option value="05" selected="">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00" selected="">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        <label style="">종료</label>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 시</option><option value="01">01 시</option><option value="02">02 시</option><option value="03">03 시</option><option value="04" selected="">04 시</option><option value="05">05 시</option><option value="06">06 시</option><option value="07">07 시</option><option value="08">08 시</option><option value="09">09 시</option><option value="10">10 시</option><option value="11">11 시</option><option value="12">12 시</option><option value="13">13 시</option><option value="14">14 시</option><option value="15">15 시</option><option value="16">16 시</option><option value="17">17 시</option><option value="18">18 시</option><option value="19">19 시</option><option value="20">20 시</option><option value="21">21 시</option><option value="22">22 시</option><option value="23">23 시</option>									</select>
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="00">00 분</option><option value="01">01 분</option><option value="02">02 분</option><option value="03">03 분</option><option value="04">04 분</option><option value="05">05 분</option><option value="06">06 분</option><option value="07">07 분</option><option value="08">08 분</option><option value="09">09 분</option><option value="10">10 분</option><option value="11">11 분</option><option value="12">12 분</option><option value="13">13 분</option><option value="14">14 분</option><option value="15">15 분</option><option value="16">16 분</option><option value="17">17 분</option><option value="18">18 분</option><option value="19">19 분</option><option value="20">20 분</option><option value="21">21 분</option><option value="22">22 분</option><option value="23">23 분</option><option value="24">24 분</option><option value="25">25 분</option><option value="26">26 분</option><option value="27">27 분</option><option value="28">28 분</option><option value="29">29 분</option><option value="30">30 분</option><option value="31">31 분</option><option value="32">32 분</option><option value="33">33 분</option><option value="34">34 분</option><option value="35">35 분</option><option value="36">36 분</option><option value="37">37 분</option><option value="38">38 분</option><option value="39">39 분</option><option value="40">40 분</option><option value="41">41 분</option><option value="42">42 분</option><option value="43">43 분</option><option value="44">44 분</option><option value="45">45 분</option><option value="46">46 분</option><option value="47">47 분</option><option value="48">48 분</option><option value="49">49 분</option><option value="50" selected="">50 분</option><option value="51">51 분</option><option value="52">52 분</option><option value="53">53 분</option><option value="54">54 분</option><option value="55">55 분</option><option value="56">56 분</option><option value="57">57 분</option><option value="58">58 분</option><option value="59">59 분</option>									</select>
                                                        </span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker">요일별 휴게시간을 설정하세요.</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">휴무일</td>
                                    <td class="padding-0">
                                        <table style="width:100%;" id="eHoliday">
                                            <tbody>
                                            <tr>
                                                <td class=" border-left-0 border-top-0 border-bottom-0 border-right-0" colspan="2">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="holiday" value="0" checked="" onclick="fncHolidayChDisplay('0');"> 설정안함</label>
                                                    <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="holiday" value="1" onclick="fncHolidayChDisplay('1');" checked> 설정</label>
                                                </td>
                                            </tr>
                                            <tr id="eHolidayTr" padding: 0 10px 0 50px; min-width:400px;  style="display: table-row;">
                                                <td class="width-100 border-left-0">정기휴무</td>
                                                <td class=" border-left-0" >
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="regularHoliday"  value="N"> 설정안함</label>
                                                    <label ><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="regularHoliday" value="Y" checked=""> 설정</label>
                                                    <label >
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="1" selected="">매월 첫째주</option><option value="2">매월 둘째주</option><option value="3">매월 셋째주</option><option value="4">매월 넷째주</option><option value="5">매월 다섯째주</option><option value="L">매월 마지막주</option><option value="A">매월 매주</option>									</select>
                                                    </label>
                                                    <label >
                                                        <select class="form-control-sm" padding: 0 10px 0 50px; min-width:400px; >
                                                            <option value="1" selected="">일요일</option><option value="2">월요일</option><option value="3">화요일</option><option value="4">수요일</option><option value="5">목요일</option><option value="6">금요일</option><option value="7">토요일</option><option value="A">모든요일</option>									</select>
                                                    </label>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eHolidayAdd" onclick="addHolidayRow(this);" value="추가">
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eHolidayDel" onclick="delHolidayRow(this);" value="삭제">                                               </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table id="eTmpHoliday" class="border-0">
                                            <tbody>
                                            <tr id="eTmpHolidayTr" padding: 0 10px 0 50px; min-width:400px;  style="display: table-row;">
                                                <td class="width-100 border-bottom-0 border-left-0 border-top-0">임시휴무</td>
                                                <td class="border-0">
                                                    <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="tempHoliday" value="N"> 설정안함</label>
                                                    <label ><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="tempHoliday" value="Y" checked=""> 설정</label>
                                                    <label>
                                                        <input type="text" class="form-control hasDatepicker" padding: 0 10px 0 50px; min-width:400px;  id="sSWorkDate_0" value="2021-03-12" readonly="">
                                                    </label>
                                                    <label >
                                                        <input type="text" class="form-control hasDatepicker" padding: 0 10px 0 50px; min-width:400px;  id="sEWorkDate_0" value="2021-03-12" readonly="">
                                                    </label>
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eTmpHolidayAdd" onclick="addTmpHolidayRow(this);" value="추가">
                                                    <input type="button" class="btn btn-primary p-t-5 p-b-5 " style="vertical-align :middle;" name="eTmpHolidayDel" onclick="delTmpHolidayRow(this);" value="삭제">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker">휴무일을 설정하세요.</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i>수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="default-tab-9">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12">
                               <%-- <form class="multi_form_none" id="multi_form_none" method="post"  >
                                    <input type="hidden" name="masterChargeYn" value="" class="null_param">
                                    <input type="hidden" name="masterStoreNo" value="" class="null_param">
                                    <input type="hidden" name="masterGoodsYn" value="" class="null_param">
                                    <input type="hidden" name="multiType" value="">
                                    <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                </form>
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light width-200">가맹점 구분</td>
                                            <td>
                                                <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiTypeSelect" value="0" <c:if test="${tbStore.multiType.ordinal() == 0}">checked</c:if>> 사용안함</label>
                                                <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiTypeSelect" value="1" <c:if test="${tbStore.multiType.ordinal() == 1}">checked</c:if>> 종속</label>
                                                <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="multiTypeSelect" value="2" <c:if test="${tbStore.multiType.ordinal() == 2}">checked</c:if>> 마스터</label>
                                            </td>
                                        </tr>
                                            <tr class="multi_form_master_tr" style="display: <c:if test="${tbStore.multiType.ordinal() == 0 || tbStore.multiType.ordinal() == 1}">none</c:if><c:if test="${tbStore.multiType.ordinal() == 2}">contents</c:if>">
                                                <td class="bg-light">가맹점 설정</td>
                                                <td class="padding-0">
                                                    <form class="multi_form_master" id="multi_form_master" method="post"  >
                                                        <table style="width:100%;" id="">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="width-150 border-top-0 border-left-0 border-bottom-0">종속가맹 상품 판매대행 </td></td>
                                                                    <td class="border-top-0 border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterGoodsYn" value="0" <c:if test="${tbStore.masterGoodsYn.ordinal() == 0}">checked</c:if>> 관리안함</label>
                                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterGoodsYn" value="1"  <c:if test="${tbStore.masterGoodsYn.ordinal() == 1}">checked</c:if>> 판매관리</label>
                                                                        <input type="hidden" name="masterChargeYn" class="null_param">
                                                                        <input type="hidden" name="masterStoreNo" class="null_param">
                                                                        <input type="hidden" name="multiType">
                                                                        <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </td>
                                                </form>
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
                                                                            <select class="form-control masterStoreNo" name="masterStoreNo">
                                                                            </select>
                                                                        </label>
                                                                        <input type="hidden" name="masterGoodsYn" value="" class="null_param" >
                                                                        <input type="hidden" name="multiType">
                                                                        <input type="hidden" name="storeNo" value="${tbStore.storeNo}">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="width-150border-left-0 border-bottom-0">마스터가맹 정산방식</td></td>
                                                                    <td class="border-left-0 border-bottom-0 border-right-0" colspan="2">
                                                                        <label><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterChargeYn" value="0" <c:if test="${tbStore.masterChargeYn.ordinal() == 0}">checked</c:if>=""> 수동정산</label>
                                                                        <label style="padding-left: 10px;"><input type="radio" padding: 0 10px 0 50px; min-width:400px; name="masterChargeYn" value="1"  <c:if test="${tbStore.masterChargeYn.ordinal() == 1}">checked</c:if>> 실시간정산</label>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </form>
                                                    </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </form>
                                <div class="m-l-5 m-t-5">
                                    <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                                    <button type="button" class="btn btn-primary btn_update_multi float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> 멀티 가맹점 수정&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                                </div>--%>
                            </div>
                            <div class="col-xl-6 col-lg-6 height-400">
                                <div id="tipmap" class="height-full width-full"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

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

<%--modal listRequest start--%>
<div class="modal fade" id="listRequest_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="listRequest.jsp" %>
</div>
<%--modal listRequest end--%>

<%--modal add start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="headSearch.jsp" %>
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
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    let map;
    let tipMap;
    let marker;
    let drawingManager = null;
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
        initTipMap();
        initMap();
        initAutocomplete();

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
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);

            if (inputDataCheck(req)) {
                swal({
                    title: "수정 하시겠습니까",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '수정'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbStoreData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbBusinessInfoData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                        formData.append("tbStoreCategoryFo",  new Blob([JSON.stringify(codeList)], {type:"application/json"}));
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
                                    alert("수정에 성공하였습니다.");
                                    location.reload();
                                } else {
                                    alert("수정에 실패하였습니다.");
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
            e.preventDefault();

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
            $('.onlinePlatFormFileName').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize').text("용량 :" + file.size + " Byte");

            return false;
        });

        //온라인플랫폼이미지
        $(document).on("change", "#imgFileSmall", function (e) {
            e.preventDefault();

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
            $('.onlinePlatFormFileName2').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize2').text("용량 :" + file.size + " Byte");

            return false;
        });

        $(".drawing-btn").click(function () {
            showDrawingManager();
            $(".drawing-btn").css('display', 'none');
            $(".drawing-hide-btn").css('display', 'inline');
        });
        $(".drawing-hide-btn").click(function () {
            hideDrawingManager();
            $(".drawing-btn").css('display', 'inline');
            $(".drawing-hide-btn").css('display', 'none');
        });

        $(".btn-draw").click(function () {
            showDrawingManager();
            $(".btn-draw").addClass("d-none");
            $(".btn-draw-hide").removeClass("d-none");
        });

        $(".btn-draw-hide").click(function () {
            hideDrawingManager();
            $(".btn-draw-hide").addClass("d-none");
            $(".btn-draw").removeClass("d-none");
        });

      /*  $(document).on("click",".btn_update_multi",function() {
            // 체크 되어 있는 값 추출

            let multiType = $("input[name='multiType']:checked").val();
            $("input[name=multiType]").val(multiType);
            let url = "${path}/api/affilfranch/multi/update/action";
            let _forms = $('#multi_form_none');
            let _forms1 = $('#multi_form_master');
            let _forms2 = $('#multi_form_slave');
            $(".null_param").val("");
            let req = convertFormToObj(_forms);
            let req1 = convertFormToObj(_forms1);
            let req2 = convertFormToObj(_forms2);
            swal({
                title: "수정 하시겠습니까",
                icon: "warning",
                buttons: [
                    '취소',
                    '수정'
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData =null;
                    if(multiType == 0){
                        formData = new FormData(document.getElementById('multi_form_none'));
                        formData.append("tbStoreMultiData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    } else if(multiType == 1){
                        formData = new FormData(document.getElementById('multi_form_slave'));
                        formData.append("tbStoreMultiData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                    } else if(multiType == 2){
                        formData = new FormData(document.getElementById('multi_form_master'));
                        formData.append("tbStoreMultiData",  new Blob([JSON.stringify(req1)], {type:"application/json"}));
                    }
                    /!*formData.append("tbStoreData",  new Blob([JSON.stringify(req)], {type:"application/json"}));*!/
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        /!*contentType: "application/json;",*!/
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                location.reload();
                            } else {
                                alert("수정에 실패하였습니다.");
                                return;
                            }
                        }
                    });
                }
            });
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
    //최초 주문 카테고리 체크된 리스트

    function showDrawingManager() {
        if (drawingManager == null) {
            drawingManager = new google.maps.drawing.DrawingManager({
                drawingMode: google.maps.drawing.OverlayType.MARKER,
                drawingControl: true,
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [
                        google.maps.drawing.OverlayType.MARKER,
                        google.maps.drawing.OverlayType.CIRCLE,
                        google.maps.drawing.OverlayType.POLYGON,
                        google.maps.drawing.OverlayType.POLYLINE,
                        google.maps.drawing.OverlayType.RECTANGLE,
                    ],
                },
                markerOptions: {
                    icon:
                        "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png",
                },
                circleOptions: {
                    fillColor: "#ff0000",
                    fillOpacity: 1,
                    strokeWeight: 5,
                    clickable: false,
                    editable: true,
                    zIndex: 1,
                },
                polygonOptions: {
                    fillColor: "#ffffff",
                    clickable: false,
                    editable: true,
                    zIndex: 1,
                }
            });
            drawingManager.setMap(tipMap);
        }
    }

    function hideDrawingManager() {
        if (drawingManager != null) {
            drawingManager.setMap(null);
            drawingManager = null;
        }
    }

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
        console.log(selDay);
        if(selDay == 0) {
            $("#eHolidayTr").css("display","none");
            $("#eTmpHoliday").css("display","none");
        } else if(selDay == 1) {
            $("#eHolidayTr").css("display","table-row");
            $("#eTmpHoliday").css("display","table-row");
        }
    }

    // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places and predicted search terms.
    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">


    function initMap() {
        let lat = Number($("#lat").val());
        let lng = Number($("#lng").val());
        let uluru = {lat: lat,lng: lng};
        map = new google.maps.Map(document.getElementById("map"), {
            center: uluru,
            zoom: 18,
        });
        marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }


     function initTipMap() {
       let uluru = {lat: 17.98168965202384, lng: 102.56941764786893};
       tipMap = new google.maps.Map(document.getElementById("tipmap"), {
           center: uluru,
           zoom: 14,
       });

       const squareCoords = [
           {lat: 17.98278685393457, lng: 102.56079072668399},
           {lat: 17.99030228316645, lng: 102.56907432512804},
           {lat: 17.984179602794764, lng: 102.57976024543845},
           {lat: 17.970259919261057, lng: 102.57233589116656},
           {lat: 17.98278685393457, lng: 102.56079072668399},
       ];

       const bermudaSquare = new google.maps.Polygon({
           paths: squareCoords,
           strokeColor: "#FF0000",
           strokeOpacity: 0.8,
           strokeWeight: 2,
           fillColor: "#FF0000",
           fillOpacity: 0.35,
       });
       bermudaSquare.setMap(tipMap);

       tipMap.addListener('click', function (e) {
           console.log(e.latLng.lat());
           console.log(e.latLng.lng());
       });
   }



    function initAutocomplete() {
        let lat = Number($("#lat").val());
        let lng = Number($("#lng").val());
        let uluru = {lat: lat,lng: lng};
        if (lat == "") {
            lat = 37.4816268;
        }
        if (lng == "") {
            lng = 126.8829256;
        }


        const map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: lat, lng: lng },
            zoom: 18,
            mapTypeControl: false,
            mapTypeId: "roadmap",
        });
        marker = new google.maps.Marker({
            position: uluru,
            map: map
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
                /* markers.push(
                     new google.maps.Marker({
                         map,
                         icon,
                         title: place.name,
                         position: place.geometry.location,
                     })
                 );*/
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

                    //$("#pac-input").val(result[0].formatted_address.replace('대한민국','').replace(/^\s*/, ""));
                    $("#lng").val(marker.position.lng());
                    $("#lat").val(marker.position.lat());
                } else {
                    alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                }
            });
            map.fitBounds(bounds);
        });
    }





    function inputDataCheck(args) {
        console.log(args);
        if (isNull(args.storeName)) {
            return alert_focus("storeName", "가맹점명을 입력해주세요");
        } else if (isNull(args.storeTel)) {
            return alert_focus("storeTel", "가맹점전화번호를 입력해주세요");
        } else if (isNull(args.storeNameInapp)) {
            return alert_focus("storeNameInapp", "고객앱 가맹점명을 입력해주세요");
        }
        return true;
    }



</script>
</body>
</html>
