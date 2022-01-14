<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.search.distributordetails" text="총판상세"/></title>
</head>
<style>
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
    .modal-content {
        width: 60%;
    }

    .map_wrap {width: 100%;position: relative;}
    .modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
    .getdata{position: absolute;top: 370px;left: 10px;z-index: 1;}
    #drawingMap, #map {width: 100%;height: 648px;}
    #map {margin-top: 10px;}
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

    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/distributor/list"><spring:message code="sidemenu.workgroupmanagement.exclusivedistributor" text="총판"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.search.distributordetails" text="총판상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.search.distributordetails" text="총판상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[H${tbBranch.head.headNo}]</span> ${tbBranch.head.headName}
                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.distributorheadquarters" text="총판명"/></strong></td>
                        <td>
                            <span class="text-green">[B${tbBranch.branchNo}]</span> ${tbBranch.branchName}
                        </td>
                    </tr>
                </table>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본정보"/></span>
                    </a>
                </li>
              <%--  <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.affiliatedheadquartersdetail1" text="사업자정보"/>/span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.affiliatedheadquartersdetail1" text="사업자정보"/></span>
                    </a>
                </li>--%>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.affiliatedheadquartersdetail1" text="사업자정보"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.affiliatedheadquartersdetail1" text="사업자정보"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.user" text="사용자"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.user" text="사용자"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-8"  data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="요금설정"/></span>
                        <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="요금설정"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-9"  data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="거리구간요금"/></span>
                        <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="거리구간요금"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-10"  data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="merchandise.detail.tab4" text="블록요금"/></span>
                        <span class="d-sm-block d-none"><spring:message code="merchandise.detail.tab4" text="블록요금"/></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="true">
                        <div class="table-responsive">
                            <%--<table class="table table-condensed table-bordered">--%>
                               <%-- <tr>
                                    <td class="bg-light">총판명</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200" value="K_제휴본사_총판">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">관리센터</td>
                                    <td>
                                        <select class="form-control">
                                            <option>만나(기본값)</option>
                                            <option>공유다</option>
                                            <option>Run</option>
                                            <option>이어드림</option>
                                            <option>날라가</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">총판 직영 구분</td>
                                    <td>
                                        <label>
                                            <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="가맹점을 선택하세요.&lt;%&ndash;<spring:message code="merchandise.search1.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white width-170" value="K_제휴본사_가맹점" readonly>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">기본 배송그룹</td>
                                    <td>
                                        <label>
                                            <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="배송그룹을 선택하세요.&lt;%&ndash;<spring:message code="merchandise.search1.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white width-170" value="K_제휴본사_테스트" readonly>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">총판 상태</td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status1" class="align-bottom" checked>정상&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">정지&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">삭제&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">페이부족&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">로그인ID</td>
                                    <td>test1</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">로그인PW</td>
                                    <td>1234</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">인증용 휴대전화</td>
                                    <td><input type="text" class="form-control width-200" value="01011112222"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">예치금</td>
                                    <td><input type="text" class="form-control width-200" value="0"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">총판 구분</td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status2" checked>일반
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status2">간선총판
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status2">지선총판
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">계약자/담당자 정보</td>
                                    <td class="p-0 border-none">
                                        <table class="width-full border-none">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-100">계약자</td>
                                                <td class="border-top-0"><input type="text" class="form-control width-200" value="A타입"></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">담당자</td>
                                                <td><input type="text" class="form-control width-200"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">충전 계좌</td>
                                    <td class="p-0 border-none">
                                        <table class="width-full border-none">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-100">은행</td>
                                                <td class="border-top-0">우리은행</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">계좌번호</td>
                                                <td>1234567890</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">출금 계좌</td>
                                    <td class="p-0 border-none">
                                        <table class="width-full border-none">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-100">은행</td>
                                                <td class="border-top-0">우리은행</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">계좌번호</td>
                                                <td>1234567890</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">예금주</td>
                                                <td>테스트</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">페이 잔액</td>
                                                <td>
                                                    <div class="width-150 d-inline-block">1000000원</div>
                                                    <button type="button" class="btn btn-gray" data-toggle="modal" data-target="#listPay_modal">내역</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">미차감 잔액</td>
                                                <td>
                                                    <span class="width-150 d-inline-block">0원</span>
                                                    <button type="button" class="btn btn-gray" data-toggle="modal" data-target="#listDeducted_modal" >내역</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">PIN번호</td>
                                                <td>****</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>--%>
                                <form class="dlvy_search_form"></form>
                               <form name="update_form" id="update_form" class="update_form">
                                   <input type="hidden" class="insertUserId" name="insertUserId" value="${tbBranch.insertUserId}">
                                   <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                                   <input type="hidden" name="branchNo" value="${tbBranch.branchNo}">
                                   <input type="hidden" name="headNo" value="${tbBranch.head.headNo}">

                                   <table class="table table-condensed table-bordered">
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.serviceclassification" text="서비스구분"/></td>
                                           <td style="width:60%">
                                               <label class="font-size-10">
                                                   <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="0" <c:if test="${tbBranch.serviceYn == 'TEST_OR_CALC'}">checked</c:if> ><spring:message code="list.detail.test" text="테스트"/>
                                               </label>
                                               <label class="m-l-10 font-size-10">
                                                   <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="1" <c:if test="${tbBranch.serviceYn == 'SERVICE'}">checked</c:if>><spring:message code="list.detail.service" text="서비스"/>
                                               </label>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.settlementisnotmadewhensettingupatest" text="테스트 설정시 정산이 이루어지지 않습니다."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.distributorheadquarters" text="총판명"/></td>
                                           <td><input type="text" class="form-control width-200 branchName" name="branchName" value="${tbBranch.branchName}" maxlength="40"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.enterthedistributorname" text="총판 이름을 입력하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.defaultshippinggroup" text="기본 배송그룹"/></td>
                                           <td>
                                               <select class="form-control width-200 searchDlvyList dlvyNo" name="dlvyNo">
                                               </select>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.chooseyourdefaultshippinggroup" text="기본 배송그룹을 선택하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.distributorstatus" text="총판 상태"/></td>
                                           <td>
                                               <label class="font-size-10">
                                                   <input type="radio" name="dataStatus" value="0" class="align-bottom dataStatus" <c:if test="${tbBranch.dataStatus == 'DELETE'}">checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/>
                                               </label>
                                               <label class="m-l-10 font-size-10">
                                                   <input type="radio" name="dataStatus" value="1" class="align-bottom dataStatus" <c:if test="${tbBranch.dataStatus == 'OK'}">checked</c:if>><spring:message code="list.detail.normal" text="정상"/>
                                               </label>
                                               <label class="m-l-10 font-size-10">
                                                   <input type="radio" name="dataStatus" value="2" class="align-bottom dataStatus" <c:if test="${tbBranch.dataStatus == 'STOP'}">checked</c:if>><spring:message code="list.detail.stop" text="정지"/>
                                               </label>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.aftercompletingbusinessmessage" text="사업자 인증 완료 후 정상으로 설정하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.mobilephoneforauthentication" text="인증용 휴대전화"/></td>
                                           <td><input type="text" class="form-control width-200 authTel" name="authTel" value="${tbBranch.authTel}" maxlength="20" numberOnly="true"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.enterthemobilephonenumbertobeusedforauthentication" text="인증시 사용할 휴대전화번호를 입력하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.distributorrepresentativenumber" text="총판 대표번호"/></td>
                                           <td><input type="text" class="form-control width-200 branchTel" name="branchTel" value="${tbBranch.branchTel}" maxlength="20" numberOnly="true"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourrepresentativenumber" text="대표번호를 입력하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.physicaladdress" text="실제 주소"/></td>
                                           <td><input type="text" class="form-control width-400 actualAddr"  name="actualAddr" value="${tbBranch.actualAddr}" maxlength="200"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryouractualbusinessaddress" text="실제 사업중인 주소를 입력하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.actualoperatorname" text="실제 운영자명"/></td>
                                           <td><input type="text" class="form-control width-200 actualOwner"  name="actualOwner" value="${tbBranch.actualOwner}" maxlength="40"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.enterthenameoftherealbusinessoperator" text="실제 사업중인 운영자 명을 입력하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.realcontact" text="실제 연락처"/></td>
                                           <td><input type="text" class="form-control width-200 actualTel"  name="actualTel" value="${tbBranch.actualTel}" maxlength="20" numberOnly></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.pleaseenterrealcontactinformation" text="실제 연락 가능한 연락처를 입력하세요."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.deposit" text="예치금"/></td>
                                           <td><input type="text" class="form-control width-200 deposit" name="deposit" value="${tbBranch.deposit}" numberOnly readonly></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.transferringtoachargingaccountmessage" text="충전 계좌로 이체시 예치금으로 입금됩니다."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.cash" text="캐시"/></td>
                                           <td><input type="text" class="form-control width-200 cash" name="cash" value="${tbBranch.cash}" numberOnly readonly> ( <spring:message code="list.detail.arrears" text="체납금"/> : ${tbBranch.cashDefault} <spring:message code="list.detail.won" text="원"/> )
                                               <input type="hidden" name="cashDefault" value="${tbBranch.cashDefault}" />
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.ifarrearsexistusewillbesuspended" text="체납금이 존재하면 사용이 정지됩니다."/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전 계좌"/></td>
                                           <td class="p-0 border-0">
                                               <table class="width-full border-0">
                                                   <tr>
                                                       <td class="border-left-0 border-top-0 width-200 border-right-0"><spring:message code="list.detail.bank" text="은행"/></td>
                                                       <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${cBankName}" readonly>
                                                           <input type="hidden" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${tbBranch.cybankTypeCode}" readonly>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-right-0 border-right-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                       <td><input type="text" class="form-control width-200 cybankAccount" name="cybankAccount" value="${tbBranch.cybankAccount}" readonly></td>
                                                   </tr>
                                               </table>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금계좌"/></td>
                                           <td class="p-0 border-0">
                                               <table class="width-full border-0">
                                                  <%-- <tr>
                                                       <td class="border-left-0 border-top-0 width-200">은행</td>
                                                       <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${bankName}" readonly>
                                                           <input type="hidden" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${tbBranch.bankTypeCode}" readonly></td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-right-0">계좌번호</td>
                                                       <td><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="${tbBranch.bankAccount}" readonly></td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-right-0">예금주</td>
                                                       <td><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="${tbBranch.bankOwner}" readonly></td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-bottom-0 ">PIN번호</td>
                                                       <td class="border-bottom-0 border-right-0">
                                                           <div class="pin-div">
                                                               <input  name="pinNum" class="form-control width-200 pinNum" value="${tbBranch.pinNum}" type="password" >
                                                               <i class="fa fa-eye fa-lg m-l-5"></i>
                                                           </div>
                                                       </td>
                                                   </tr>--%>
                                                   <tr>
                                                       <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                       <td class="border-top-0 border-right-0"><input type="text" class="form-control width-200 "  value="${bankName}" readonly>
                                                           <input type="hidden" class="form-control width-200 bankTypeCode" name="bankTypeCode" value="${tbBranch.bankTypeCode}" readonly>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                       <td class="border-right-0"><input type="text" class="form-control width-200 " value="${bankAccount}" readonly>
                                                           <input type="hidden" class="form-control width-200 bankAccount" name="bankAccount" value="${tbBranch.bankAccount}" readonly>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                       <td class="border-right-0"><input type="text" class="form-control width-200 " value="${bankOwner}" readonly>
                                                           <input type="hidden" class="form-control width-200 bankOwner" name="bankOwner" value="${tbBranch.bankOwner}" readonly>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.pinnumber" text="PIN번호"/></td>
                                                       <td class="border-bottom-0 border-right-0">
                                                           <div class="pin-div">
                                                               <input  name="pinNum" class="form-control width-200 pinNum" value="${tbBranch.pinNum}" type="password" readonly>
                                                               <%--<i class="fa fa-eye fa-lg m-l-5"></i>--%>
                                                           </div>
                                                       </td>
                                                   </tr>
                                               </table>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                           <td>
                                               <input type="text" class="form-control width-600 memoEtc" name="memoEtc" value="${tbBranch.memoEtc}"  maxlength="200">
                                               <input type="hidden" name="memoService" value="${tbBranch.memoService}">
                                               <input type="hidden" name="memoArea" value="${tbBranch.memoArea}">
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.othermemo" text="기타 메모"/></td>
                                       </tr>
                                   </table>
                                   <div class="m-l-5 m-t-5">
                                       <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                       <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                                   </div>
                               </form>
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
                                    <td class="bg-light" style="width:15%"><spring:message code="list.detail.mutual" text="상호"/></td>
                                    <td style="width:60%">
                                        <input type="text" class="form-control width-200 bizName" name="bizName" value="${tbBranch.businessInfo.bizName}" maxlength="80">
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="corpType" value="1" class="align-bottom corpType" <c:if test="${tbBranch.businessInfo.corpType eq 'NORMAL'}">checked</c:if>><spring:message code="list.detail.normal" text="일반"/>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="corpType" value="2" class="align-bottom corpType" <c:if test="${tbBranch.businessInfo.corpType eq 'SIMPLE_BUSINESS'}">checked</c:if>><spring:message code="list.detail.simple" text="간이"/>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="corpType" value="3" class="align-bottom corpType" <c:if test="${tbBranch.businessInfo.corpType eq 'CORPORATION'}">checked</c:if>><spring:message code="list.detail.corporation" text="법인"/>
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="radio" name="corpType" value="0" class="align-bottom corpType" <c:if test="${tbBranch.businessInfo.corpType eq 'UNKNOWN'}">checked</c:if>><spring:message code="list.detail.unknown" text="알수없음"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthebusinessnamemessage" text="사업자등록증 기준의 상호를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.companyregistrationnumber" text="사업자 등록번호"/></td>
                                    <td><input type="text" class="form-control width-200 bizNum" name="bizNum" value="${tbBranch.businessInfo.bizNum}" maxlength="20" numberOnly="true"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.entertheregistrationnumbermessage" text="사업자등록증의 등록번호를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.authenticationstatus" text="인증 상태"/></td>
                                    <td>
                                        <select class="form-control m-r-10 authStatus" name="authStatus">
                                            <option value="0" <c:if test="${tbBranch.businessInfo.authStatus.ordinal() == 0}"> selected </c:if>><spring:message code="list.detail.notcertified" text="미인증"/></option>
                                            <option value="1" <c:if test="${tbBranch.businessInfo.authStatus.ordinal() == 1}"> selected </c:if>><spring:message code="list.detail.waiting" text="대기"/></option>
                                            <option value="2" <c:if test="${tbBranch.businessInfo.authStatus.ordinal() == 2}"> selected </c:if>><spring:message code="list.detail.acknowledgment" text="승인"/></option>
                                            <option value="3" <c:if test="${tbBranch.businessInfo.authStatus.ordinal() == 3}"> selected </c:if>><spring:message code="list.detail.reject" text="거절"/></option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.detail.youcanusetheserviceafterbusinessverification" text="사업자 인증후 서비스 이용이 가능합니다."/></td>
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
                                    <td class="bg-light"><spring:message code="list.detail.representativename" text="대표자 명"/></td>
                                    <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="${tbBranch.businessInfo.bizOwner}" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.entertherepresentativebasemessage" text="사업자등록증 기준의 대표자를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.email" text="이메일"/></td>
                                    <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value="${tbBranch.businessInfo.bizEmail}" maxlength="45"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.authenticationstatus" text="계산서를 수신할 이메일을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contact" text="연락처"/></td>
                                    <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value="${tbBranch.businessInfo.bizTel}" maxlength="40" numberOnly="true"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourbusinesscontactinformation" text="사업자 연락처를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.businessaddress" text="사업장 주소"/></td>
                                    <td><input type="text" name="bizAddr" class="form-control width-400 bizAddr" value="${tbBranch.businessInfo.bizAddr}" maxlength="150" ></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.entertheaddressonyourbusinessmessage" text="사업자등록증 상의 주소를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.typeofbusiness/industry" text="업태/업종"/></td>
                                    <td>
                                        <input type="text" name="bizType" class="form-control width-200 bizType" value="${tbBranch.businessInfo.bizType}" maxlength="80">
                                        <input type="text" name="bizItem" class="form-control m-r-10 width-200 bizItem" value="${tbBranch.businessInfo.bizItem}" maxlength="80">
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthebusinessstatusanditemessage" text="사업자등록증 상의 업태와 종목를 입력하세요."/></td>
                                </tr>
                            </table>
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_update float-left m-t-5 m-l-20"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-3">
                    <form class="update_form" id="update_form3" method="post">
                        <div class="table-responsive" style="overflow: hidden;">
                            <a href="#modal-message" class="btn btn-sm btn-primary m-t-25 m-b-10" data-toggle="modal"><spring:message code="list.detail.userregistration" text="사용자등록"/></a>
                            <table class="table table-condensed table-bordered">
                                <tr id="basicOptionYnView" class="border-0" >
                                    <td colspan="2" class="p-0" style="border: 0;">
                                        <div class="tab-pane fade active show" >

                                            <form id="update_form2" style="width: 100%;" class="p-0">
                                                <div class="panel panel-inverse">
                                                    <div class="height-300 overflow-auto border">
                                                        <input type="hidden"  class="viewOrder" value="">
                                                        <table class="table table-bordered border-bottom text-center border-0">
                                                            <thead>
                                                            <tr>
                                                                <th class="bg-light" style="width:5%"><spring:message code="list.detail.number" text="번호"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.id" text="아이디"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.username" text="사용자 이름"/></th>
                                                                <th class="bg-light" style="width:15%"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></th>
                                                                <th class="bg-light" style="width:30%"><spring:message code="list.detail.memo" text="메모"/></th>
                                                                <th class="bg-light" style="width:10%"><spring:message code="list.detail.status" text="상태"/></th>
                                                                <th class="bg-light" style="width:20%"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="tbUserStaffBody">

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="m-t-10">
                                <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="default-tab-8">
                    <form class="update_form8" id="update_form8" method="post">
                        <div class="table-responsive" style="overflow: hidden;">
                            <table class="table table-condensed table-bordered">
                             <%--   <tr>
                                    <td class="bg-light height-50 "  colspan="2"><spring:message code="list.detail.accountholder1" text="설정값"/></td>
                                    <td class="border-right-0" colspan="2">
                                        <label class="">
                                            <input type="radio" name="useYn" class="align-bottom m-r-10 useYn" value="0" <c:if test="${tbBranchPrice.useYn == 0}" >checked</c:if>>총판설정 사용
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="useYn" class="align-bottom m-r-10 useYn" value="1" <c:if test="${tbBranchPrice.useYn == 1}" >checked</c:if>>가맹점설정 사용
                                        </label>
                                    </td>
                                    <td class="text-danger-darker   " style="width: 232px;"><spring:message code="list.description.cannotbemodified" text="가맹점설정 유형을 선택해주세요."/></td>
                                </tr>--%>
                                <tr>
                                    <td class="bg-light height-50 width-60" colspan="2"><spring:message code="list.detail.accountholder1" text="적용할 요금제"/></td>
                                    <td colspan="2">
                                        <label class="">
                                            <input type="radio" name="meterUseYn" class="align-bottom m-r-10 meterUseYn" value="1" <c:if test="${tbBranchPrice.meterUseYn == 1}" >checked</c:if>>기본(미터)요금 사용
                                        </label>
                                        <label class="m-l-10">
                                            <input type="radio" name="meterUseYn" class="align-bottom m-r-10 meterUseYn" value="0" <c:if test="${tbBranchPrice.meterUseYn == 0}" >checked</c:if>>거리구간요금 사용
                                        </label>
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="거리구간 요금 유형을 선택해주세요."/></td>
                                </tr>
                                <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbBranchPrice.meterUseYn == 0}" >none</c:if>">
                                    <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="주문요금"/></td>
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="기본요금"/></td>
                                    <td class="border-right-0" colspan="1">
                                        <input type="text"  class="form-control width-200 meterPrice" name="meterPrice" value="${tbBranchPrice.meterPrice}" numberCommaOnly> 원
                                    </td>
                                    <td class="border-right-0" colspan="">
                                        <input type="text"  class="form-control width-200 meterBaseDistance" name="meterBaseDistance" value="${tbBranchPrice.meterBaseDistance}" numberCommaOnly>  (M 단위)
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="기본요금을 입력해주세요."/></td>
                                </tr>
                                <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbBranchPrice.meterUseYn == 0}" >none</c:if>">
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="추가요금"/></td>
                                    <td class="border-right-0" colspan="1">
                                        <input type="text"  class="form-control width-200 meterAddition" name="meterAddition" value="${tbBranchPrice.meterAddition}" numberCommaOnly>  원
                                    </td>
                                    <td class="border-right-0" colspan="">
                                        <input type="text"  class="form-control width-200 meterAddDistance" name="meterAddDistance" value="${tbBranchPrice.meterAddDistance}" numberCommaOnly> (M 단위)
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="추가요금을 입력해주세요."/></td>
                                </tr>
                                <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbBranchPrice.meterUseYn == 0}" >none</c:if>">
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="최대요금"/></td>
                                    <td class="border-right-0" colspan="2">
                                        <input type="text"  class="form-control width-200 meterMaximum" name="meterMaximum" value="${tbBranchPrice.meterMaximum}" numberCommaOnly>  원
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="최대요금을 입력해주세요."/></td>
                                </tr>
                                <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbBranchPrice.meterUseYn == 0}" >none</c:if>">
                                    <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="배송요금"/></td>
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="기본요금"/></td>
                                    <td class="border-right-0" colspan="">
                                        <input type="text"  class="form-control width-200 dlvyPrice" name="dlvyPrice" value="${tbBranchPrice.dlvyPrice}" numberCommaOnly>  원
                                    </td>
                                    <td class="border-right-0" colspan="">
                                        <input type="text"  class="form-control width-200 dlvyBaseDistance" name="dlvyBaseDistance" value="${tbBranchPrice.dlvyBaseDistance}" numberCommaOnly> (M 단위)
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="기본요금을 입력해주세요."/></td>
                                </tr>
                                <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbBranchPrice.meterUseYn == 0}" >none</c:if>">
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="추가요금"/></td>
                                    <td class="border-right-0" colspan="1">
                                        <input type="text"  class="form-control width-200 dlvyAddition" name="dlvyAddition" value="${tbBranchPrice.dlvyAddition}" numberCommaOnly>  원
                                    </td>
                                    <td class="border-right-0" colspan="1">
                                        <input type="text"  class="form-control width-200 dlvyAddDistance" name="dlvyAddDistance" value="${tbBranchPrice.dlvyAddDistance}" numberCommaOnly> (M 단위)
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="추가요금을 입력해주세요."/></td>
                                </tr>
                                <tr class="useYnTr meterUseYnTr" style="display: <c:if test="${tbBranchPrice.meterUseYn == 0}" >none</c:if>">
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="최대요금"/></td>
                                    <td class="border-right-0" colspan="2">
                                        <input type="text"  class="form-control width-200 dlvyMaximum" name="dlvyMaximum" value="${tbBranchPrice.dlvyMaximum}" numberCommaOnly> 원
                                    </td>
                                    <td class="text-danger-darker   "><spring:message code="list.description.cannotbemodified" text="최대요금을 입력해주세요."/></td>
                                </tr>
                                <tr class="useYnTr">
                                    <td class="bg-light" rowspan="3"><spring:message code="list.detail.accountholder1" text="할증요금 "/></td>
                                    <td class="bg-light"><spring:message code="list.detail.accountholder1" text="눈비할증 "/></td>
                                    <td colspan="2">
                                        <select name="weatherChargeYn" class="form-control width-100">
                                            <option value="0"<c:if test="${tbBranchPrice.weatherChargeYn == 0}" >selected</c:if>>사용안함</option>
                                            <option value="1"<c:if test="${tbBranchPrice.weatherChargeYn == 1}" >selected</c:if>>사용</option>
                                        </select>
                                        <input type="text"  class="form-control width-120 weatherCharge" name="weatherCharge" value="${tbBranchPrice.weatherCharge}" numberCommaOnly> 원
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="요일할증 정보를 입력해주세요"/></td>
                                </tr>

                                <tr class="useYnTr" >
                                    <td class="bg-light" rowspan="1"><spring:message code="list.detail.accountholder1" text="시간할증 "/></td>
                                    <td colspan="1">
                                        <select name="timeChargeYn" class="form-control width-100">
                                            <option value="0"<c:if test="${tbBranchPrice.timeChargeYn == 0}" >selected</c:if>>사용안함</option>
                                            <option value="1"<c:if test="${tbBranchPrice.timeChargeYn == 1}" >selected</c:if>>할증사용</option>
                                        </select>
                                        <input type="text"  class="form-control width-120 timeCharge" name="timeCharge" value="${tbBranchPrice.timeCharge}" numberCommaOnly> 원
                                    </td>
                                    <td>
                                        시작시간 : <input type="text" name="timeStart" class="timeStart form-control" value="${tbBranchPrice.timeStart}" maxlength="4" numberOnly> ~
                                        종료시간 : <input type="text" name="timeEnd" class="timeEnd form-control" value="${tbBranchPrice.timeEnd}" maxlength="4" numberOnly>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="시간할증정보를 입력해주세요"/></td>
                                </tr>
                                <tr class="useYnTr" >
                                    <td class="bg-light" rowspan="1"><spring:message code="list.detail.accountholder1" text="요일할증"/></td>
                                    <td colspan="1" rowspan="1">
                                        <select name="dayChargeYn" class="form-control width-100">
                                            <option value="0"<c:if test="${tbBranchPrice.dayChargeYn == 0}" >selected</c:if>>사용안함</option>
                                            <option value="1"<c:if test="${tbBranchPrice.dayChargeYn == 1}" >selected</c:if>>사용</option>
                                        </select>
                                        <input type="text"  class="form-control width-120 dayCharge" name="dayCharge" value="${tbBranchPrice.dayCharge}" numberCommaOnly> 원
                                    </td>
                                    <td>
                                        <c:if test="${tbBranchPrice.dayFilter != ''}">
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(0,1) == 1}">checked</c:if>>월</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(1,2) == 1}">checked</c:if>>화</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(2,3) == 1}">checked</c:if>>수</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(3,4) == 1}">checked</c:if>>목</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(4,5) == 1}">checked</c:if>>금</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(5,6) == 1}">checked</c:if>>토</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  <c:if test="${tbBranchPrice.dayFilter.substring(6,7) == 1}">checked</c:if>>일</label>
                                            <input type="hidden" name="dayFilter" class="dayFilter" value="${tbStorePrice.dayFilter}">
                                        </c:if>
                                        <c:if test="${tbBranchPrice.dayFilter == ''}">
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >월</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >화</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >수</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >목</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >금</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >토</label>
                                            <label class="m-l-10 "><input type="checkbox" class="dayFilterChk"  >일</label>
                                            <input type="hidden" name="dayFilter" class="dayFilter" value="">
                                        </c:if>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="눈비할증 정보를 입력해주세요"/></td>
                                </tr>
                                 <tr  class="useYnTr">
                                     <td class="bg-light height-50 " colspan="2"><spring:message code="list.detail.accountholder1" text="서비스지역 블럭설정 사용여부"/></td>
                                     <td class="border-right-0" colspan="2">
                                         <label class="">
                                             <input type="radio" name="serviceAreaYn" class="align-bottom m-r-10 serviceAreaYn" value="0" <c:if test="${tbBranchPrice.serviceAreaYn == 0}" >checked</c:if>>미사용
                                         </label>
                                         <label class="m-l-10">
                                             <input type="radio" name="serviceAreaYn" class="align-bottom m-r-10 serviceAreaYn" value="1" <c:if test="${tbBranchPrice.serviceAreaYn == 1}" >checked</c:if>> 사용
                                         </label>
                                     </td>
                                     <td class="text-danger-darker" style="width: 232px;"><spring:message code="list.description.cannotbemodified" text="서비스지역 블럭설정 사용여부를 선택해주세요."/></td>
                                 </tr>
                                </tbody>
                            </table>
                            <div class="m-t-10">
                                <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="default-tab-9">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12">
                            <form class="insert_form_dlvy_price" id="insert_form_dlvy_price">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" class="groupNo" name="groupNo" value="${tbBranch.branchNo}">
                                <input type="hidden" class="groupType" name="groupType" value="2">
                                <input type="hidden" class="dataStatus" name="dataStatus" value="1">
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th colspan="7" class="tabla-custom-title"><spring:message code="list.detail.blockregistrationmodification1" text="거리구간요금 등록/수정"/></th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light text-center"><spring:message code="list.detail.dayoftheweek" text="요일"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.starttimehh" text="시작시간(HH)"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.endtimehh" text="종료시간(HH)"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.distancem" text="거리(M)"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.fee1krw22" text="주문요금"/></th>
                                        <th class="bg-light"><spring:message code="list.detail.fee2krw22" text="배송요금"/></th>
                                        <%--<th class="bg-light"><spring:message code="list.detail.status" text="상태"/></th>--%>
                                        <th class="bg-light"></th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light">
                                            <select class="form-control day" name="day">
                                                <option value="0"><spring:message code="list.detail.monday" text="전체"/></option>
                                                <option value="1"><spring:message code="list.detail.monday" text="월요일"/></option>
                                                <option value="2"><spring:message code="list.detail.tuesday" text="화요일"/></option>
                                                <option value="3"><spring:message code="list.detail.wednesday" text="수요일"/></option>
                                                <option value="4"><spring:message code="list.detail.thursday" text="목요일"/></option>
                                                <option value="5"><spring:message code="list.detail.friday" text="금요일"/></option>
                                                <option value="6"><spring:message code="list.detail.saturday" text="토요일"/></option>
                                                <option value="7"><spring:message code="list.detail.sunday" text="일요일"/></option>
                                            </select>
                                        </th>
                                        <td>
                                            <select class="form-control width-full startTime" name="startTime" >
                                                <c:forEach begin="00" end="24" var="hour">
                                                    <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if><spring:message code="list.detail.timestart" text="시 (시작)"/></option>
                                                    <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if><spring:message code="list.detail.timeend" text="시 (시작)"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="form-control width-full endTime" name="endTime">
                                                <c:forEach begin="00" end="24" var="hour">
                                                    <c:if test="${hour lt 10}"><option value="0${hour}">0${hour}</c:if><spring:message code="list.detail.timeend" text="시 (종료)"/></option>
                                                    <c:if test="${hour gt 9}"><option value="${hour}">${hour}</c:if><spring:message code="list.detail.timeend" text="시 (종료)"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <th>
                                            <input type="text" class="form-control radius" name="radius" placeholder="<spring:message code="list.detail.distancelessthan" text="거리(미만)"/>" maxlength="7" numberOnly >
                                        </th>
                                        <th>
                                            <input type="text" class="form-control custPrice" name="custPrice" placeholder="<spring:message code="list.detail.fee1krw" text="주문요금 (원)"/>" value="0" maxlength="7" numberOnly>
                                        </th>
                                        <th>
                                            <input type="text" class="form-control dlvyPrice" name="dlvyPrice" placeholder="<spring:message code="list.detail.fee1krw" text="배송요금 (원)"/>" value="0" maxlength="7" numberOnly>
                                        </th>
                                        <td>
                                            <button type="button" onclick="insPrice()" class="btn btn-white color"><spring:message code="list.detail.enrollment" text="등록"/></button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>

                            <div class="block_list_div border " >
                                <table class="table table-bordered table-sort block_list_table">
                                    <thead>
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                    </colgroup>
                                    </thead>
                                    <tbody class="addTbody">
                                    </tbody>
                                </table>
                            </div>

                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="default-tab-10">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6">
                            <form class="insert_form_block" id="insert_form_block">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" class="groupNo" name="groupNo" value="${tbBranch.branchNo}">
                                <input type="hidden" class="groupType" name="groupType" value="2">
                                <input type="hidden" class="dataStatus" name="dataStatus" value="1">
                                <input type="hidden" class="areaNo" name="areaNo">
                                <input type="hidden" class="viewOrder" name="viewOrder">
                                <table class="table table-bordered">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="35%"/>
                                        <col width="15%"/>
                                        <col width="15%"/>
                                        <col width="15%"/>
                                        <col width="20%"/>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th colspan="5" class="tabla-custom-title"><spring:message code="list.detail.blockregistrationmodification" text="블록 등록/수정"/></th>
                                    </tr>
                                    <tr>
                                        <th class="bg-light text-center"><spring:message code="list.detail.blockname" text="블록명"/></th>
                                        <th class="bg-light text-center"><spring:message code="list.detail.price1" text="고객요금"/></th>
                                        <th class="bg-light text-center"><spring:message code="list.detail.price1" text="배송요금"/></th>
                                        <th class="bg-light text-center"><spring:message code="list.detail.status1" text="블럭요금 구분"/></th>
                                        <th class="bg-light text-center"><spring:message code="list.detail.sort" text="초기화"/></th>
                                    </tr>
                                    <tr>
                                        <%-- <th class="bg-light"></th>--%>
                                        <td><input type="text" class="form-control-width-custom areaName text-center" name="areaName" maxlength="80"></td>
                                        <th>
                                            <input type="text" class="form-control-width-custom custPrice text-center" name="custPrice" value="0" maxlength="7" numberOnly>
                                        </th>
                                        <th>
                                            <input type="text" class="form-control-width-custom dlvyPrice text-center" name="dlvyPrice" value="0" maxlength="7" numberOnly>
                                        </th>
                                        <th>
                                            <select class="form-control-width-custom areaChargeType" name="areaChargeType">
                                                <%--<option value="0"><spring:message code="list.detail.normal1" text="서비스지역"/></option>--%>
                                                <option value="1"><spring:message code="list.detail.stop1" text="고정요금"/></option>
                                                <option value="2"><spring:message code="list.detail.stop1" text="추가요금"/></option>
                                            </select>
                                        </th>
                                        <td>
                                            <button type="button" class="btn btn-purple resetBtn"><i class="fa fa-cog"></i> <spring:message code="list.detail.reset" text="초기화"/>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                            <div class="float-right m-b-20">
                                    <button type="button" onclick="insBlock()" class="btn btn-primary border-right-0 color insBlockTxt m-r-5"><spring:message code="list.detail.enrollment" text="등록"/></button>
                                    <button type="button" onclick="delBlock()" style="display: none;" class="btn btn-danger border-right-0 color delBlockTxt m-r-5"><spring:message code="list.detail." text="삭제"/></button>
                                    <button type="button" onclick="selectOverlay('POLYGON')" class="btn btn-info btn-draw m-r-5"><spring:message code="list.detail.drawing" text="그리기"/></button>
                                    <button type="button" class="btn btn-white btn-draw-hide d-none"><spring:message code="list.detail.hide" text="숨기기"/></button>
                            </div>
                            <table class="table table-bordered table-sort table table-bordered w-100 ">
                                <thead>
                                <%-- <tr>
                                     <th colspan="6" class="tabla-custom-title">등록 리스트</th>
                                 </tr>--%>
                                <colgroup>
                                    <col width="35%" class="text-center"/>
                                    <col width="15%" class="text-center"/>
                                    <col width="15%" class="text-center"/>
                                    <col width="15%" class="text-center"/>
                                    <col width="20%" class="text-center"/>
                                </colgroup>
                                <tr>
                                    <th colspan="6" class="tabla-custom-title"><spring:message code="list.detail.registrationlist" text="등록 리스트"/></th>
                                </tr>
                                <tr>
                                    <th class="bg-light text-center"><spring:message code="list.detail.blockname" text="블록명"/></th>
                                    <th class="bg-light text-center"><spring:message code="list.detail.price1" text="고객요금"/></th>
                                    <th class="bg-light text-center"><spring:message code="list.detail.price1" text="배송요금"/></th>
                                    <th class="bg-light text-center"><spring:message code="list.detail.price1" text="블럭요금 구분"/></th>
                                    <th class="bg-light text-center"><spring:message code="list.detail.sort" text="정렬"/></th>
                                </tr>
                                </thead>
                            </table>
                            <div class="block_list_div border" >
                                <table class="table table-bordered table-sort block_list_table table-hover">
                                    <thead>
                                    <colgroup>
                                        <col width="35%" class="text-center"/>
                                        <col width="15%" class="text-center"/>
                                        <col width="15%" class="text-center"/>
                                        <col width="15%" class="text-center"/>
                                        <col width="20%" class="text-center"/>
                                    </colgroup>
                                    </thead>
                                    <tbody class="addBlockTbody">
                                    </tbody>
                                </table>
                            </div>
                            <input type="button" class=" btn btn-white p-5 float-right m-t-10" onclick="sortSave()" value="<spring:message code="list.detail.savesort" text="정렬 저장"/>">
                        </div>
                        <div class="col-xl-6 col-lg-6 height-full">
                            <table class="table table-condensed table-bordered">
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="map_wrap mapRefreshBtn" style="height: 650px;">
                                            <div id="drawingMap"></div>
                                            <p class="modes">
                                                <input type="button" class="show_btn block_show_hide btn btn-white p-5" onclick="showBlock()" value="<spring:message code="list.detail.viewallblocks" text="모든 블록 보기"/>">
                                                <input type="button" class="hide_btn block_show_hide btn btn-primary  p-5" onclick="hideBlock()" value="<spring:message code="list.detail.closeallblocks" text="모든 블록 닫기"/>">
                                            </p>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="m-l-5 m-t-5">
                            <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
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

<%--modal add start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
<%--modal add end--%>

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

<!-- #modal-message -->
<form id="user_modal" class="user_modal">
    <div class="modal modal-message fade" id="modal-message">
        <input type="hidden" name="headNo" value="${tbBranch.head.headNo}">
        <input type="hidden" name="branchNo" value="${tbBranch.branchNo}">
        <input type="hidden" name="storeNo" value="">
        <input type="hidden" name="userType" value="UT_BRANCH">
        <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
        <div class="modal-dialog" style="
                    height: 50%;
                ">
            <div class="modal-content" style="
                    margin: auto;
                    margin-top: 200px;
                ">
                <div class="modal-header height-30 m-t-40" >
                    <h4 class="modal-title"><spring:message code="list.detail.userregistration" text="사용자 등록"/></h4>
                    <button type="button" class="insert_close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-condensed table-bordered">
                        <tbody>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.id" text="아이디"/></td>
                            <td><input type="text" class="form-control width-full userId" name="userId" value="" placeholder="<spring:message code="list.description.pleaseenteryourid" text="아이디를 입력해주세요"/>" maxlength="20"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourid" text="아이디를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.password" text="패스워드"/></td>
                            <td><input type="text" class="form-control width-full userPwd" name="userPwd" value="" placeholder="<spring:message code="list.description.pleaseenteryourpassword" text="패스워드를 입력해주세요"/>" maxlength="60"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourpassword" text="패스워드를 입력해주세요"/> </td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.username" text="사용자 이름"/></td>
                            <td><input type="text" class="form-control width-full name" name="name" value="" placeholder="<spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/>" maxlength="20"> </td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></td>
                            <td><input type="text" class="form-control width-full phone" name="phone" value="" placeholder="<spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/>" maxlength="20" numberOnly="true"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                            <td><input type="text" class="form-control width-full memo" name="memo" value="" placeholder="<spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>" maxlength="200"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" class="btn btn-white" data-dismiss="modal"><spring:message code="list.detail.cancel" text="취소"/></a>
                    <a href="javascript:;" class="btn btn-primary modalUserSave"><spring:message code="list.detail.save" text="저장"/></a>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- #modal-message -->
<form id="user_update_modal" class="user_update_modal">
    <div class="modal modal-message-up fade" id="modal-message-up">
        <input type="hidden" name="headNo" value="${tbBranch.head.headNo}">
        <input type="hidden" name="branchNo" value="${tbBranch.branchNo}">
        <input type="hidden" name="storeNo" value="">
        <input type="hidden" class="userNo upUserNo" name="userNo" value="">
        <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
        <input type="hidden" name="userType" value="UT_BRANCH">
        <div class="modal-dialog" style="
                    height: 50%;
                ">
            <div class="modal-content" style="
                    margin-top: 200px;
                    width: 120%;
                ">
                <div clasㅇs="modal-header height-30 m-t-40" >
                    <h4 class="modal-title"><spring:message code="list.detail.useredit" text="사용자 수정"/></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <table class="table table-condensed table-bordered">
                        <tbody>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.id" text="아이디"/></td>
                            <td><input type="text" class="form-control width-full userId upUserId" name="" value="" placeholder="<spring:message code="list.description.pleaseenteryourid" text="아이디를 입력해주세요"/>" disabled>
                                <input type="hidden"class="upUserId" name="userId" value="">
                            </td>
                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.newpassword" text="새 패스워드"/></td>
                            <td><input type="text" class="form-control width-full userPwd upUserPwd" name="userPwd" value="" placeholder="<spring:message code="list.description.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/>" maxlength="60"></td>
                            <td class="text-danger-darker">
                                <spring:message code="list.description.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/>

                            </td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.username" text="사용자 이름"/></td>
                            <td><input type="text" class="form-control width-full name upName" name="name" value="" placeholder="<spring:message code="list.detail.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/>" maxlength="20"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></td>
                            <td><input type="text" class="form-control width-full phone upPhone" name="phone" value="" placeholder="사용자 전화번호를 입력해주세요" maxlength="20" numberOnly="true"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.status" text="상태"/></td>
                            <td>
                                <select class="form-control upDataStatus" name="dataStatus">
                                    <option value="1"><spring:message code="list.detail.normal" text="정상"/></option>
                                    <option value="2"><spring:message code="list.detail.stop" text="정지"/></option>
                                </select>
                                <label class="m-l-10 blockTypeCodeSel">
                                    정지/삭제사유 :
                                    <select class="upBlockTypeCode" name="blockTypeCode"
                                    <c:forEach var="item" items="${systemCodeList}" varStatus="status">
                                        <option value="${item.sysCode}" <c:if test="${tbUserStaff.blockTypeCode == item.sysCode}" >selected</c:if>>${item.codeName}</option>
                                    </c:forEach>
                                    </select>
                                </label>
                            </td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/></td>
                        </tr>
                        <tr>
                            <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                            <td><input type="text" class="form-control width-full memo upMemo" name="memo" value="" placeholder="<spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>"  maxlength="200"></td>
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" class="btn btn-white" data-dismiss="modal"><spring:message code="list.detail.cancel" text="취소"/></a>
                    <a href="javascript:;" class="btn btn-primary modalUserUp"><spring:message code="list.detail.update" text="수정"/></a>
                </div>
            </div>
        </div>
    </div>
</form>

<form class="updatePrice" id="updatePrice">
    <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
    <input type="hidden" name="radius" class="radius" value="">
    <input type="hidden" name="groupType" class="groupType" value="2">
    <input type="hidden" name="day" class="day" value="">
    <input type="hidden" name="groupNo" class="groupNo" value="">
    <input type="hidden" name="custPrice" class="custPrice" value="">
    <input type="hidden" name="dlvyPrice" class="dlvyPrice" value="">
    <input type="hidden" name="startTime" class="startTime" value="">
    <input type="hidden" name="endTime" class="endTime" value="">
    <input type="hidden" name="dataStatus" class="dataStatus" value="">
    <input type="hidden" name="priceNo" class="priceNo" value="">
</form>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c1a125dbfc0b31fb5f601512a4e58d0&libraries=services,drawing"></script>
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>


    let tipMap;
    let marker;
    let drawingManager = null;
    let lng2 = "";
    let lat2 = "";

    //최초 표시
    $.ajax({
        type: "POST",
        url: "${path}/api/deliveryblock/dlvyAreaGeo/list",
        async:false,
        data: {
            groupNo: "${tbBranch.branchNo}"
            ,groupType : "2"
        },
        success: function(data) {
            let tbDlvyAreaGeoList = data.tbDlvyAreaGeoList;
            console.log(tbDlvyAreaGeoList.length)
            if(tbDlvyAreaGeoList.length > 0 ){
                for (var j = 0 ; j < tbDlvyAreaGeoList.length ; j ++) {
                    for (var i = 0 ; i < tbDlvyAreaGeoList[j].length ; i ++) {
                        if(tbDlvyAreaGeoList[0][0] != null){
                            lng2 = tbDlvyAreaGeoList[0][0].lng;
                            lat2 = tbDlvyAreaGeoList[0][0].lat;
                        } else {
                            lat2 = 37.5116707;
                            lng2 = 126.874092;
                        }
                    }
                }
            } else {
                lat2 = 37.5116707;
                lng2 = 126.874092;
            }
        }
    });

    // Drawing Manager로 도형을 그릴 지도 div
    var drawingMapContainer = document.getElementById('drawingMap'),
        drawingMapOption = {
            center: new kakao.maps.LatLng(lat2,lng2), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMapOption);
    var overlays = []; // 지도에 그려진 도형을 담을 배열
    var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
        map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
        drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
            kakao.maps.drawing.OverlayType.MARKER,
            kakao.maps.drawing.OverlayType.POLYLINE,
            kakao.maps.drawing.OverlayType.RECTANGLE,
            kakao.maps.drawing.OverlayType.CIRCLE,
            kakao.maps.drawing.OverlayType.POLYGON
        ],
        // 사용자에게 제공할 그리기 가이드 툴팁입니다
        // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
        guideTooltip: ['draw', 'drag', 'edit'],
        markerOptions: { // 마커 옵션입니다
            draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다
            removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다
        },
        polylineOptions: { // 선 옵션입니다
            draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
            removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
            editable: true, // 그린 후 수정할 수 있도록 설정합니다
            strokeColor: '#39f', // 선 색
            hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
            hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
        },
        rectangleOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f', // 외곽선 색
            fillColor: '#39f', // 채우기 색
            fillOpacity: 0.5 // 채우기색 투명도
        },
        circleOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f',
            fillColor: '#39f',
            fillOpacity: 0.5
        },
        polygonOptions: {
            draggable: true,
            removable: true,
            editable: true,
            strokeColor: '#39f',
            fillColor: '#39f',
            fillOpacity: 0.5,
            hintStrokeStyle: 'dash',
            hintStrokeOpacity: 0.5
        }
    };

    // 위에 작성한 옵션으로 Drawing Manager를 생성합니다
    var manager = new kakao.maps.drawing.DrawingManager(options);



    $(() => {
        drawingMap.relayout();
        blockList();
        priceList();
        staffList();
        $(".upDataStatus").on("change",function (){
            var radioVal = $('.upDataStatus option:selected').val();
            if(radioVal == 1){
                $(".blockTypeCodeSel").css("display","none");
            } else {
                $(".blockTypeCodeSel").css("display","inline");
            }
        });

        $(document).on("click",".resetBtn",function(){
            $(".insBlockTxt").text("등록");
            $(".delBlockTxt").css("display","none");

            $(".selectBlockRadio").prop("checked",false);
            $(".areaName").val("");
            $(".areaNo").val("");
            $(".custPrice").val("0");
            $(".dlvyPrice").val("0");
            hideBlock();
        });


        $(".custPrice, .dlvyPrice").focus(function(){
            /!*$(this).val('');*!/
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });

        $(".meterUseYn").on("click",function(){
            if($(this).val() == 1) {
                $(".meterUseYnTr").css("display","");
            } else {
                $(".meterUseYnTr").css("display","none");
            }
        });

        $(document).on("click",".addBlockTbody tr",function(){
            $(".insBlockTxt").text("수정");
            $(".delBlockTxt").css("display","inline");

            hideBlock();
            $(this).find(".selectBlockRadio").prop('checked', true);

            let upAreaNo = $(this).attr("areaNo");
            let upAreaName = $(this).attr("areaName");
            let upCustPrice = $(this).attr("custPrice");
            let upDlvyPrice = $(this).attr("dlvyPrice");
            let upViewOrder = $(this).attr("viewOrder");
            let upAreaChargeType = $(this).attr("areaChargeType");
            let upGroupNo = "${tbBranch.branchNo}";
            let upGroupType = 2;

            $(".areaName").val(upAreaName);
            $(".custPrice").val(upCustPrice);
            $(".dlvyPrice").val(upDlvyPrice);
            $(".viewOrder").val(upViewOrder);
            $(".areaChargeType").val(upAreaChargeType);
            $(".areaNo").val(upAreaNo);


            //selectOverlay('POLYGON');

            //해당블록 보이기.
            $.ajax({
                type: "POST",
                url: "${path}/api/deliveryblock/dlvyAreaGeo/detail",
                data: {
                    groupNo: "${tbBranch.branchNo}",
                    groupType: 2,
                    areaNo : upAreaNo
                },
                success: function(data) {
                    let polygons = [];
                    let points = [];
                    // 좌표 배열
                    var sPath = [];
                    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
                    var bounds = new daum.maps.LatLngBounds();

                    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
                    var bounds = new daum.maps.LatLngBounds();

                    let tbDlvyAreaGeoList = data.tbDlvyAreaGeoList;

                    for (var j = 0 ; j < tbDlvyAreaGeoList.length ; j ++) {
                        points = [];
                        for (var i = 0 ; i < tbDlvyAreaGeoList[j].length ; i ++) {
                            points.push({x: tbDlvyAreaGeoList[j][i].lng, y: tbDlvyAreaGeoList[j][i].lat})
                            sPath.push(new kakao.maps.LatLng(tbDlvyAreaGeoList[j][i].lat, tbDlvyAreaGeoList[j][i].lng));
                            bounds.extend(new daum.maps.LatLng(tbDlvyAreaGeoList[j][i].lat, tbDlvyAreaGeoList[j][i].lng));
                        }
                        manager.put(kakao.maps.drawing.OverlayType.POLYGON, sPath);
                        drawingMap.setBounds(bounds);
                    }

                }
            });
        });


        $(document).on("click",".modalUserSave",function(){
            let modalReq = convertFormToObj($('form.user_modal'));
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let registrationwassuccessful = "<spring:message code="list.script.registrationwassuccessful" text="등록에 성공하였습니다."/>";
            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let duplemsg = "<spring:message code="list.script.duplicateaccount" text="계정이 중복되었습니다."/>";

            if (inputDataCheck3(modalReq)) {
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
                        var formData = new FormData(document.getElementById('user_modal'));
                        formData.append("tbUserStaffData",  new Blob([JSON.stringify(modalReq)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/userStaff/insert/action",
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(registrationwassuccessful);
                                    staffList();
                                    $(".insert_close").click();
                                } else if (data.result == 500) {
                                    alert(duplemsg);
                                } else  {
                                    alert(confirmfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        $(document).on("click",".modalUserUp",function(){
            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let modalReq = convertFormToObj($('form.user_update_modal'));
            if (inputDataCheck2(modalReq)) {
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
                        var formData = new FormData(document.getElementById('user_update_modal'));
                        formData.append("tbUserStaffData",  new Blob([JSON.stringify(modalReq)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/userStaff/update/action",
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(updatesussmsg);
                                    staffList();
                                    $(".close").click();
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

        $(document).on("click",".update_staff",function(){


            let userId = $(this).attr("userId");
            let name = $(this).attr("name");
            let phone = $(this).attr("phone");
            let memo = $(this).attr("memo");
            let userNo = $(this).attr("staffNo");
            let dataStatus = $(this).attr("dataStatus");
            let blockTypeCode = $(this).attr("blockTypeCode");

            $(".upUserId").val(userId);
            $(".upName").val(name);
            $(".upPhone").val(phone);
            $(".upMemo").val(memo);
            $(".upUserNo").val(userNo);
            $(".upDataStatus").val(dataStatus).attr("selected","selected");

            if(dataStatus == 1){
                $(".blockTypeCodeSel").css("display","none");
            }else {
                $(".blockTypeCodeSel").css("display","inline");
                $(".upBlockTypeCode").val(blockTypeCode).attr("selected","selected");
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

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
        let dlvyNo = "${tbBranch.dlvyNo}";
        $.ajax({
            type: "POST",
            url: "${path}/api/search/dlvy/list",
            data: JSON.stringify(dlvyReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                console.log(data);
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

        $(".btn_list").click(function() {
            location.href = "${path}/workgroup/distributor/list";
        });
        $(document).on("click",".btn_update",function() {
            let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let url = "${path}/api/distributor/update/action";

            let dayFilter ="";
            $("input[class=dayFilterChk]").each(function() {
                if($(this).is(':checked')){
                    dayFilter= dayFilter+1;
                } else {
                    dayFilter= dayFilter+0;
                }
            });
            $(".dayFilter").val(dayFilter);

            let _forms = $('.update_form');
            let _forms2 = $('.update_form2');
            /*let _forms3 = $('.update_form7');*/
            let _forms4 = $('.update_form8');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            /*let req3 = convertFormToObj(_forms3);*/
            let req4 = convertFormToObj(_forms4);
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
                   /* if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbBranchData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
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
                                    location.href = "${path}/workgroup/distributor/list";
                                } else {
                                    alert("수정에 실패하였습니다.");
                                    return;
                                }
                            }
                        });
                    }*/
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbBranchData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbBusinessInfoData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
                        formData.append("tbBranchPrice",  new Blob([JSON.stringify(req4)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    //location.href = "${path}/workgroup/distributor/list";
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

        //상세이미지
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
            $('.fileName').text(filename);

            return false;
        });
    });

    function inputDataCheck(args,args2) {
        if (isNull(args.branchName)) {
            return alert_focus("branchName", "총판명을 입력해주세요.");
        } else if (isNull(args.authTel)) {
            return alert_focus("authTel", "인증용 휴대전화를 입력해주세요");
        } else if (isNull(args.branchTel)) {
            return alert_focus("branchTel", "총판 대표번호를 입력해주세요");
        } else if (isNull(args.actualAddr)) {
            return alert_focus("actualAddr", "실제주소를 입력해주세요");
        } else if (isNull(args.actualOwner)) {
            return alert_focus("actualOwner", "실제 운영자명을 입력주세요");
        } else if (isNull(args.actualTel)) {
            return alert_focus("actualTel", "실제 연락처를 입력해주세요");
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
        }
        return true;
    }

    function staffList() {
        let headNo = "${tbBranch.head.headNo}";
        let branchNo = "${tbBranch.branchNo}";
        let storeNo =  "";
        let userType = 2;

        let normalmsg = "<spring:message code="list.script.normal" text="정상"/>";
        let stopmsg = "<spring:message code="list.script.stop" text="정지"/>";
        let thereisnoregisteredid = "<spring:message code="list.script.thereisnoregisteredid" text="등록된 아이디가 없습니다."/>";
        let userupdate = "<spring:message code="list.script.userupdate" text="사용자 수정"/>";
        $.ajax({
            type: "GET",
            url: "${path}/api/userStaff/list",
            data: {
                headNo : headNo,
                branchNo : branchNo,
                storeNo : storeNo,
                userType : userType
            },
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                $("#tbUserStaffBody").html("");
                /*  $(".searchDlvyList").append(
                      "<option value=\"\">없음</option>"
                  )*/

                if(data.userStaffList.length < 0) {
                    $("#tbUserStaffBody").append(
                        "<tr><td colspan='7'>"+thereisnoregisteredid+"</td></tr>"
                    )
                } else {
                    for(var i = 0 ; i < data.userStaffList.length ; i++){
                        let dataStatus = "";
                        if(data.userStaffList[i].dataStatus == 1) {
                            dataStatus = normalmsg;
                        } else if(data.userStaffList[i].dataStatus == 2){
                            dataStatus = stopmsg;
                        }

                        $("#tbUserStaffBody").append(
                            "<tr staffNo="+data.userStaffList[i].staffNo+" >" +
                            "   <td class=\"p-0\">"+(i+1)+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].userId+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].name+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].phone+"</td>" +
                            "   <td class=\"p-0\">"+data.userStaffList[i].memo+"</td>" +
                            "   <td class=\"p-0\">"+dataStatus+"</td>" +
                            "   <td class=\"p-0\"><a href=\"#modal-message-up\" class=\"btn btn-sm btn-primary update_staff\" " +
                            "data-toggle=\"modal\""+
                            " userNo="+data.userStaffList[i].staffNo+
                            " blockTypeCode="+data.userStaffList[i].blockTypeCode+
                            " userId="+data.userStaffList[i].userId+
                            " name="+data.userStaffList[i].name+
                            " phone="+data.userStaffList[i].phone+
                            " dataStatus="+data.userStaffList[i].dataStatus+
                            " staffNo="+data.userStaffList[i].staffNo+
                            " memo="+data.userStaffList[i].memo+
                            " >"+userupdate+"</a>" +
                            "</td>" +
                            "</tr>"
                        )
                    }
                }
            }
        });
    }

    function priceList() {
        let allday = "<spring:message code="list.script.monday" text="전체"/>";
        let monday = "<spring:message code="list.script.monday" text="월요일"/>";
        let tuesday = "<spring:message code="list.script.tuesday" text="화요일"/>";
        let wednesday = "<spring:message code="list.script.wednesday" text="수요일"/>";
        let thursday = "<spring:message code="list.script.thursday" text="목요일"/>";
        let friday = "<spring:message code="list.script.friday" text="금요일"/>";
        let saturday = "<spring:message code="list.script.saturday" text="토요일"/>";
        let sunday = "<spring:message code="list.script.sunday" text="일요일"/>";
        let end = "<spring:message code="list.script.end" text="종료"/>";
        let start = "<spring:message code="list.script.start" text="시작"/>";
        let normal = "<spring:message code="list.script.normal" text="정상"/>";
        let stop = "<spring:message code="list.script.stop" text="정지"/>";
        let distancelesthan = "<spring:message code="list.script.distancelesthan" text="거리(미만)"/>";
        let custPrice = "<spring:message code="list.script.custPrice" text="고객요금"/>";
        let dlvyPrice = "<spring:message code="list.script.dlvyPrice" text="배송요금"/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let nolistmsg = "<spring:message code="list.script.thereisnoregisteredlist" text="등록된 리스트가 없습니다."/>";

        $.ajax({
            type: "POST",
            url: "${path}/api/deliverystreet/dlvyPrice/list",
            data: {
                groupNo: "${tbBranch.branchNo}",
                groupType:"2"
            },
            success: function(data) {
                console.log(data)
                let sortList = [];
                var sortingField = "day";

                if(data.tbDlvyPriceList.length >= 1){
                    sortList =  data.tbDlvyPriceList.sort(function(a, b) { // 오름차순
                        return a[sortingField] - b[sortingField];
                    });
                } else {
                    sortList = data.tbDlvyPriceList;
                }


                $(".addTbody").html("");
                for(var i = 0 ; i < sortList.length ; i++){
                    let dataStatus = "";


                    let dayList = "";
                    let dayText = [allday,monday,tuesday,wednesday,thursday,friday,saturday,sunday];
                    let startTime = "";
                    let endTime = "";
                    dayList =  "         <select class=\"form-control day upDay\" name=\"day\">\n";
                    for(let j = 0 ; j < dayText.length ; j ++) {
                        if (sortList[i].day == j) {
                            dayList = dayList +"<option value="+j+" selected>"+dayText[j]+"</option>\n";
                        } else {
                            dayList = dayList +"<option value="+j+">"+dayText[j]+"</option>\n";
                        }
                    }
                    dayList =  dayList+" </select>\n" ;



                    startTime ="        <select class=\"form-control width-full startTime\" name=\"startTime\" >\n";
                    for(let j = 0 ; j <= 24 ; j ++) {
                        let timeText = "";
                        if(j < 10){
                            timeText  = "0"+j;
                        } else {
                            timeText  = j;
                        }
                        if (sortList[i].startTime == j) {

                            startTime = startTime +"<option value="+j+" selected>"+timeText+" ("+start+")</option>\n";
                        } else {
                            startTime = startTime +"<option value="+j+">"+timeText+" ("+start+")</option>\n";
                        }
                    }
                    startTime = startTime +"        </select>\n" ;

                    endTime ="        <select class=\"form-control width-full endTime\" name=\"endTime\" >\n";
                    for(let j = 0 ; j <= 24 ; j ++) {
                        let timeText = "";
                        if(j < 10){
                            timeText  = "0"+j;
                        } else {
                            timeText  = j;
                        }
                        if (sortList[i].endTime == j) {
                            endTime = endTime +"<option value="+j+" selected>"+timeText+" ("+end+")</option>\n";
                        } else {
                            endTime = endTime +"<option value="+j+">"+timeText+" ("+end+")</option>\n";
                        }
                    }
                    endTime = endTime +"        </select>\n" ;


                    if (sortList[i].dataStatus == 1) {
                        dataStatus =      "        <select class=\"form-control dataStatus\">\n" +
                            "            <option value=\"1\" selected>"+normal+"</option>\n" +
                            "            <option value=\"2\">"+stop+"</option>\n" +
                            "        </select>\n" ;
                    }else if(sortList[i].dataStatus == 2){
                        dataStatus =      "        <select class=\"form-control dataStatus\">\n" +
                            "            <option value=\"1\" >"+normal+"</option>\n" +
                            "            <option value=\"2\" selected>"+stop+"</option>\n" +
                            "        </select>\n" ;
                    }
                    let radius ="";
                    let custPrice ="";
                    let dlvyPrice ="";
                    if(sortList[i].radius == "" || sortList[i].radius == null){
                        radius = "";
                    }else {
                        radius = sortList[i].radius;
                    }
                    if(sortList[i].custPrice == "" || sortList[i].custPrice == null){
                        custPrice = "";
                    }else {
                        custPrice = sortList[i].custPrice;
                    }
                    if(sortList[i].dlvyPrice == "" || sortList[i].dlvyPrice == null){
                        dlvyPrice = "";
                    }else {
                        dlvyPrice = sortList[i].dlvyPrice;
                    }

                    $(".addTbody").append("<tr class=\"priceTr"+sortList[i].priceNo+" border\">\n" +
                        "    <th class=\"bg-light\">\n" +
                        dayList +
                        "    </th>\n" +
                        "    <td>\n" +
                        startTime +
                        "    </td>\n" +
                        "    <td>\n" +
                        endTime +
                        "    </td>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control radius\" name=\"radius\" placeholder=\"\" value='"+radius+"' maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control custPrice\" name=\"custPrice\" placeholder=\"\" value='"+custPrice+"' maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <th>\n" +
                        "        <input type=\"text\" class=\"form-control dlvyPrice\" name=\"dlvyPrice\" placeholder=\"\" value='"+dlvyPrice+"' maxlength=\"7\" numberOnly>\n" +
                        "    </th>\n" +
                        "    <td>\n" +
                        "        <button type=\"button\" onclick=\"upPrice("+sortList[i].priceNo+")\" class=\"btn btn-white color\">"+update+"</button>\n" +
                        "        <button type=\"button\" onclick=\"delPrice("+sortList[i].priceNo+")\" class=\"btn btn-danger color\">삭제</button>\n" +
                        "    </td>\n" +
                        "</tr>")
                }

                if(data.tbDlvyPriceList.length == 0) {
                    $(".addTbody").append(
                        "<tr class=\"\"  >\n" +
                        "<th class=\"text-center\" colspan=\"9\">"+nolistmsg+"</th>"+
                        "</tr>"
                    )
                }
            }
        });
    }

    function upPrice(priceNo) {
        let radius = $(".priceTr"+priceNo).find(".radius").val();
        let day = $(".priceTr"+priceNo).find(".day").val();
        let custPrice = $(".priceTr"+priceNo).find(".custPrice").val();
        let dlvyPrice = $(".priceTr"+priceNo).find(".dlvyPrice").val();
        let startTime = $(".priceTr"+priceNo).find(".startTime").val();
        let endTime = $(".priceTr"+priceNo).find(".endTime").val();
        let dataStatus = 1;

        let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let updatefailmsg = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        $(".updatePrice").find(".priceNo").val(priceNo);
        $(".updatePrice").find(".groupNo").val(${tbBranch.branchNo});
        $(".updatePrice").find(".radius").val(radius);
        $(".updatePrice").find(".day").val(day);
        $(".updatePrice").find(".custPrice").val(custPrice);
        $(".updatePrice").find(".dlvyPrice").val(dlvyPrice);
        $(".updatePrice").find(".startTime").val(startTime);
        $(".updatePrice").find(".endTime").val(endTime);
        $(".updatePrice").find(".dataStatus").val(dataStatus);

        let _forms = $('.updatePrice');
        let req = convertFormToObj(_forms);
        console.log(req)
        let url = "${path}/api/deliverystreet/price/update";
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
                var formData = new FormData(document.getElementById('updatePrice'));
                formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.result == 200) {
                            alert(updatesussmsg);
                            priceList();
                        } else {
                            alert(updatefailmsg);
                            return;
                        }
                    }
                });
            }
        });
    }

    function delPrice(priceNo) {
        let radius = $(".priceTr"+priceNo).find(".radius").val();
        let day = $(".priceTr"+priceNo).find(".day").val();
        let custPrice = $(".priceTr"+priceNo).find(".custPrice").val();
        let dlvyPrice = $(".priceTr"+priceNo).find(".dlvyPrice").val();
        let startTime = $(".priceTr"+priceNo).find(".startTime").val();
        let endTime = $(".priceTr"+priceNo).find(".endTime").val();
        let dataStatus = 0;

        let updatemsg = "<spring:message code="list.script.wouldyouliketoupdate1" text="삭제하시겠습니까?"/>";
        let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="삭제에 성공하였습니다."/>";
        let updatefailmsg = "<spring:message code="list.script.editfailed1" text="삭제에 실패하였습니다."/>";
        let update = "<spring:message code="list.script.update1" text="삭제"/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        $(".updatePrice").find(".priceNo").val(priceNo);
        $(".updatePrice").find(".groupNo").val(${tbBranch.branchNo});
        $(".updatePrice").find(".radius").val(radius);
        $(".updatePrice").find(".day").val(day);
        $(".updatePrice").find(".custPrice").val(custPrice);
        $(".updatePrice").find(".dlvyPrice").val(dlvyPrice);
        $(".updatePrice").find(".startTime").val(startTime);
        $(".updatePrice").find(".endTime").val(endTime);
        $(".updatePrice").find(".dataStatus").val(dataStatus);

        let _forms = $('.updatePrice');
        let req = convertFormToObj(_forms);
        console.log(req)
        let url = "${path}/api/deliverystreet/price/update";
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
                var formData = new FormData(document.getElementById('updatePrice'));
                formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data.result == 200) {
                            alert(updatesussmsg);
                            priceList();
                        } else {
                            alert(updatefailmsg);
                            return;
                        }
                    }
                });
            }
        });
    }

    function insPrice() {
        let url = "${path}/api/deliverystreet/price/insert";

        let _forms = $('.insert_form_dlvy_price');
        let req = convertFormToObj(_forms);

        let registmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
        let registfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let enrollment = "<spring:message code="list.script.enrollment" text="등록"/>";
        if (inputDataCheck4(req)) {
            swal({
                title: registmsg,
                icon: "warning",
                buttons: [
                    cancel,
                    enrollment
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    var formData = new FormData(document.getElementById('insert_form_dlvy_price'));
                    formData.append("tbDlvyPrice",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                priceList();
                            } else {
                                alert(registfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    }



    //블록요금
    function blockList() {
        $.ajax({
            type: "POST",
            url: "${path}/api/deliveryblock/dlvyArea/list",
            data: {
                groupNo: "${tbBranch.branchNo}",
                groupType: "2"
            },
            success: function(data) {
                let sortList = [];
                let wonmsg = "<spring:message code="list.script.won" text="원"/>";
                let stopmsg = "<spring:message code="list.script.stop" text="정지"/>";
                let normalmsg = "<spring:message code="list.script.normal" text="정상"/>";
                let noregisteredlist = "<spring:message code="list.script.thereisnoregisteredlist" text="등록된 리스트가 없습니다."/>";
                var sortingField = "viewOrder";
                let areaChargeTypeTxt = "서비스";
                let custPriceComma = 0;
                let dlvyPriceComma = 0;

                if(data.tbDlvyAreaList.length >= 1){
                    sortList =  data.tbDlvyAreaList.sort(function(a, b) { // 오름차순
                        return a[sortingField] - b[sortingField];
                    });
                } else {
                    sortList = data.tbDlvyAreaList;
                }

                $(".addBlockTbody").html("");



                for(var i = 0 ; i < sortList.length ; i++){
                    if(sortList[i].areaChargeType == 0) {
                        areaChargeTypeTxt = "";
                    } else if(sortList[i].areaChargeType == 1) {
                        areaChargeTypeTxt = "고정요금";
                    } else if(sortList[i].areaChargeType == 2) {
                        areaChargeTypeTxt = "추가요금";
                    } else {
                        areaChargeTypeTxt="";
                    }
                    custPriceComma = numberWithCommas(sortList[i].custPrice);
                    dlvyPriceComma = numberWithCommas(sortList[i].dlvyPrice);

                    $(".addBlockTbody").append(
                        "<tr class=\"\" areaNo="+sortList[i].areaNo+"  areaChargeType="+sortList[i].areaChargeType+" dlvyPrice="+sortList[i].dlvyPrice+" custPrice="+sortList[i].custPrice+" areaName="+data.tbDlvyAreaList[i].areaName+" areaNo="+sortList[i].areaNo+" viewOrder="+sortList[i].viewOrder+" groupNo="+sortList[i].groupNo+" groupType='2' >\n" +
                        "    <th class=''><input type=\"radio\" class='selectBlockRadio width-10' name='selectBlockRadio'>&nbsp;&nbsp; \n" +
                        "    "+data.tbDlvyAreaList[i].areaName+" </th>\n" +
                        "    <td class='priceText'>\n " + custPriceComma +" "+ wonmsg + "    </td>\n" +
                        "    <td class='priceText'>\n " +dlvyPriceComma+" "+ wonmsg + "    </td>\n" +
                        "    <td class='alignCenter'>\n" +areaChargeTypeTxt + "    </td>\n" +
                        "    <td>\n" +
                        "        <div class=\"d-table m-auto\">\n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\" onclick=\"moveTop(this)\">\n" +
                        "                <span class=\"fa fa-angle-double-up align-sub\"></span>\n" +
                        "            </a>&nbsp; \n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\"  onclick=\"moveUp(this)\">\n" +
                        "                <span class=\"fa fa-angle-up align-sub\"></span>" +
                        "           </a>&nbsp; \n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\"  onclick=\"moveDown(this)\">\n" +
                        "                <span class=\"fa fa-angle-down align-sub\"></span>\n" +
                        "            </a>&nbsp; \n" +
                        "            <a class=\"btn btn-out width-30 height-25 cursor-pointer d-table-cell\" onclick=\"moveBottom(this)\">\n" +
                        "                <span class=\"fa fa-angle-double-down align-sub\"></span>\n" +
                        "            </a>\n" +
                        "        </div>\n" +
                        "    </td>\n" +
                        "</tr>"
                    )
                }

                if(data.tbDlvyAreaList.length == 0) {
                    $(".addTbody").append(
                        "<tr class=\"\"  >\n" +
                        "<th class=\"text-center\" colspan=\"5\">"+noregisteredlist+"</th>"+
                        "</tr>"
                    )
                }
            }
        });
    }




    // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places ㄴand predicted search terms.
    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">



    // 버튼 클릭 시 호출되는 핸들러 입니다
    function selectOverlay(type) {
        /*undo();*/
        hideBlock();
        // 그리기 중이면 그리기를 취소합니다
        manager.cancel();

        // 클릭한 그리기 요소 타입을 선택합니다
        manager.select(kakao.maps.drawing.OverlayType[type]);
    }
    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
    function removeOverlays() {
        var len = overlays.length, i = 0;

        for (; i < len; i++) {
            overlays[i].setMap(null);
        }

        overlays = [];
    }

    // Drawing Manager에서 가져온 데이터 중 다각형을 아래 지도에 표시하는 함수입니다
    function drawPolygon(polygons) {
        var len = polygons.length, i = 0;

        for (; i < len; i++) {
            var path = pointsToPath(polygons[i].points);
            var style = polygons[i].options;
            var polygon = new kakao.maps.Polygon({
                map: drawingMap,
                path: path,
                strokeColor: style.strokeColor,
                strokeOpacity: style.strokeOpacity,
                strokeStyle: style.strokeStyle,
                strokeWeight: style.strokeWeight,
                fillColor: style.fillColor,
                fillOpacity: style.fillOpacity
            });

            overlays.push(polygon);
        }
    }

    // Drawing Manager에서 가져온 데이터 중
    // 선과 다각형의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다
    function pointsToPath(points) {
        var len = points.length,
            path = [],
            i = 0;

        for (; i < len; i++) {
            var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
            path.push(latlng);
        }

        return path;
    }




    function inputDataCheck5(args) {
        if (isNull(args.areaName)) {
            return alert_focus("storeName", "블록명을 입력해주세요");
        } else if (isNull(args.custPrice)) {
            return alert_focus("storeTel", "고객금액을 입력해주세요");
        } else if (isNull(args.dlvyPrice)) {
            return alert_focus("dlvyPrice", "배송요금을 입력해주세요");
        }
        return true;
    }

    function delBlock(){
        let url = "${path}/api/deliveryblock/block/delete";
        let _forms = $('.insert_form_block');
        let req = convertFormToObj(_forms);
        let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister1" text="삭제 하시겠습니까?"/>";
        let confirm = "<spring:message code="list.script.enrollment1" text="삭제"/>";
        let succsessMsg = "<spring:message code="list.script.enrollment1" text="삭제되었습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        if (inputDataCheck5(req)) {
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
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            areaNo: req.areaNo
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 200) {
                                alert(succsessMsg)
                                removeOverlays();
                                blockList();
                                $(".resetBtn").click();
                            } else {
                                alert(confirmfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    }

    function insBlock() {
        //1 : 생성 , 2 : 수정
        let insType = 1;
        var data = manager.getData();
        let url = "${path}/api/deliveryblock/block/insert";

        let _forms = $('.insert_form_block');
        let req = convertFormToObj(_forms);
        let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
        let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
        let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
        let succsessMsg = "<spring:message code="list.script.enrollment1" text="등록되었습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

        if(req.areaNo.length > 0) {
            url = "${path}/api/deliveryblock/block/update";
            confirmfailmsg = "<spring:message code="list.script.registrationfailed1" text="수정에 실패하였습니다."/>";
            confirmmsg = "<spring:message code="list.script.wouldyouliketoregister1" text="수정 하시겠습니까?"/>";
            confirm = "<spring:message code="list.script.enrollment1" text="수정"/>";
            succsessMsg = "<spring:message code="list.script.enrollment1" text="수정되었습니다."/>";
        }else {
            if(data.polygon[0] == null){
                alert("블록을 지정해주세요.");
                return;
            }else {
                url = "${path}/api/deliveryblock/block/insert";
            }
        }
        if (inputDataCheck5(req)) {
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
                    var formData = new FormData(document.getElementById('insert_form_block'));
                    formData.append("tbDlvyArea",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    formData.append("tbDlvyAreaList",  new Blob([JSON.stringify(data.polygon[0].points)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                alert(succsessMsg)
                                removeOverlays();
                                blockList();
                            } else {
                                alert(confirmfailmsg);
                                return;
                            }
                        }
                    });
                }
            });
        }
    }

    function showBlock() {
        removeOverlays();
        hideBlock();
        $(".show_btn").removeClass("btn-white");
        $(".show_btn").addClass("btn-primary");
        $(".hide_btn").addClass("btn-white");
        $(".hide_btn").removeClass("btn-primary");

        $.ajax({
            type: "POST",
            url: "${path}/api/deliveryblock/dlvyAreaGeo/list",
            data: {
                groupNo: "${tbBranch.branchNo}",
                groupType: 2
            },
            success: function(data) {
                let polygons = [];
                let points = [];
                // 좌표 배열
                var sPath = [];
                // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
                var bounds = new daum.maps.LatLngBounds();

                let tbDlvyAreaGeoList = data.tbDlvyAreaGeoList;

                for (var j = 0 ; j < tbDlvyAreaGeoList.length ; j ++) {
                    points = [];
                    sPath= [];
                    for (var i = 0 ; i < tbDlvyAreaGeoList[j].length ; i ++) {
                        console.log(tbDlvyAreaGeoList[j][i])
                        points.push({x: tbDlvyAreaGeoList[j][i].lng, y: tbDlvyAreaGeoList[j][i].lat})
                        sPath.push(new kakao.maps.LatLng(tbDlvyAreaGeoList[j][i].lat, tbDlvyAreaGeoList[j][i].lng));
                        bounds.extend(new daum.maps.LatLng(tbDlvyAreaGeoList[j][i].lat, tbDlvyAreaGeoList[j][i].lng));

                    }
                    manager.put(kakao.maps.drawing.OverlayType.POLYGON, sPath);
                    drawingMap.setBounds(bounds);
                }
            }
        });
    }

    //블록 초기화
    function hideBlock(){
        $(".show_btn").removeClass("btn-primary");
        $(".show_btn").addClass("btn-white");
        $(".hide_btn").addClass("btn-primary");
        $(".hide_btn").removeClass("btn-white");
        // 그리기 중이면 그리기를 취소
        manager.cancel();

        objPolygon = manager.getOverlays();

        if (objPolygon.polygon.length > 0){
            var iPolygonLength = objPolygon.polygon.length-1;
            var iCol = iPolygonLength;
            for (var i=0; i <= iPolygonLength; i++){

                if (iCol >= 0){
                    manager.remove(objPolygon.polygon[iCol]);
                }

                iCol = iCol-1;
            }
        }
    }

    $(document).on("click",".mapRefreshBtn",function(){
        drawingMap.relayout();
    });

    $(document).on("click",".nav-link",function(){
        drawingMap.relayout();
    });

    // 메뉴가 선택되어 active가 된 후 이벤트
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        e.target // 현재 설정된 tab
        e.relatedTarget // 이전에 설정된 탭
        //map.relayout();
        drawingMap.relayout();
    });

    function moveUp(el){
        var $tr = $(el).closest('tr');
        $tr.prev().before($tr);
    }

    function moveTop(el){
        var $tr = $(el).closest('tr');
        $tr.closest('table').find('tr:first').before($tr);
        // $tr.closest('table') - 클릭한 요소의 부모 table 요소
        // .find('tr:first').before($tr) - 첫번째 tr 찾아서 그 앞에 클릭한 tr 요소 넣기(이동)
    }

    function moveDown(el){
        var $tr = $(el).closest('tr');
        $tr.next().after($tr);
    }

    function moveBottom(el){
        var $tr = $(el).closest('tr');
        $tr.closest('table').find('tr:last').after($tr);
    }

    function sortSave(){
        let sortList = [];

        let savemsg = "<spring:message code="list.script.saved" text="저장되었습니다."/>";
        let savefailmsg = "<spring:message code="list.script.savefailed" text="저장에 실패하였습니다."/>";

        $('.addBlockTbody tr').each(function (index, item) {
            sortList.push({areaNo:Number($(this).attr("areaNo")),viewOrder:Number($(this).attr("viewOrder")),groupNo:Number($(this).attr("groupNo")),newViewOrder:Number((index+1)),groupType:2})
        });

        var formData = new FormData(document.getElementById('insert_form_block'));
        formData.append("sortList",  new Blob([JSON.stringify(sortList)], {type:"application/json"}));
        $.ajax({
            type: "POST",
            url: "${path}/api/deliveryblock/dlvyArea/resort",
            data: formData,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.result == 200) {
                    alert(savemsg);
                    removeOverlays();
                    blockList();
                } else {
                    alert(savefailmsg);
                    return;
                }
            }
        });
    }



    function inputDataCheck2(args) {
        let inputyounameplease = "<spring:message code="list.script.inputyounameplease" text="이름을 입력해주세요"/>";
        let inputyouphonenum = "<spring:message code="list.script.inputyourphonenumberplease" text="전화번호를 입력해주세요"/>";
        if (isNull(args.name)) {
            return alert_focus("name", inputyounameplease);
        } else if (isNull(args.phone)) {
            return alert_focus("phone", inputyouphonenum);
        }
        return true;
    }

    function inputDataCheck3(args) {
        let inputyouidplease = "<spring:message code="list.script.Inputyouridplease" text="아이디을 입력해주세요"/>";
        let inputyounameplease = "<spring:message code="list.script.inputyounameplease" text="이름을 입력해주세요"/>";
        let inputyouphonenum = "<spring:message code="list.script.inputyourphonenumberplease" text="전화번호를 입력해주세요"/>";
        if (isNull(args.userId)) {
            return alert_focus("userId", inputyouidplease);
        } else if (isNull(args.name)) {
            return alert_focus("name", inputyounameplease);
        } else if (isNull(args.phone)) {
            return alert_focus("phone", inputyouphonenum);
        }
        return true;
    }

    function inputDataCheck4(args) {
        console.log(args);
        let distancemsg = "<spring:message code="list.script.pleaseenterthdistance" text="거리를 입력해주세요"/>";
        let fee1msg = "<spring:message code="list.script.pleaseenterrate1" text="요금1을 입력해주세요"/>";
        if (isNull(args.custPrice)) {
            return alert_focus("radius",custPrice);
        }
        return true;
    }
</script>
</body>
</html>
