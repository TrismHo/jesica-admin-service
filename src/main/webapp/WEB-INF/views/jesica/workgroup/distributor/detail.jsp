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
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.affiliatedheadquartersdetail" text="사업자정보"/>/span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.affiliatedheadquartersdetail" text="사업자정보"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.user" text="사용자"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.user" text="사용자"/></span>
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
                                           <td><input type="text" class="form-control width-200 headTel" name="branchTel" value="${tbBranch.branchTel}" maxlength="20" numberOnly="true"></td>
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
                                        <input type="text" name="bizType" class="form-control width-200 bizItem" value="${tbBranch.businessInfo.bizType}" maxlength="80">
                                        <input type="text" name="bizItem" class="form-control m-r-10 width-200 bizType" value="${tbBranch.businessInfo.bizItem}" maxlength="80">
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
        <input type="hidden" name="userType" value="UT_BRANCH">
        <div class="modal-dialog" style="
                    height: 50%;
                ">
            <div class="modal-content" style="
                    margin-top: 200px;
                    width: 120%;
                ">
                <div class="modal-header height-30 m-t-40" >
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
                            <td class="text-danger-darker"><spring:message code="list.description.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/> </td>
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
<%@include file="../../../common/include_number_only_js.jsp" %>
<script>
    $(() => {
        staffList()
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


            $(".upUserId").val(userId);
            $(".upName").val(name);
            $(".upPhone").val(phone);
            $(".upMemo").val(memo);
            $(".upUserNo").val(userNo);
            $(".upDataStatus").val(dataStatus).attr("selected","selected");
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
            let _forms = $('.update_form');
            let _forms2 = $('.update_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            if (inputDataCheck(req)) {
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

    function inputDataCheck(args) {
        let headmsg = "<spring:message code="list.script.enterthenameoftheaffiliatedheadoffice" text="제휴본사명을 입력해주세요"/>";
        if (isNull(args.branchName)) {
            return alert_focus("branchName", headmsg);
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
                            "data-toggle=\"modal\" userId="+data.userStaffList[i].userId+" name="+data.userStaffList[i].name+" phone="+data.userStaffList[i].phone+" dataStatus="+data.userStaffList[i].dataStatus+" memo="+data.userStaffList[i].memo+" staffNo="+data.userStaffList[i].staffNo+"" +
                            " >"+userupdate+"</a></td>" +
                            "</tr>"
                        )
                    }
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
</script>
</body>
</html>
