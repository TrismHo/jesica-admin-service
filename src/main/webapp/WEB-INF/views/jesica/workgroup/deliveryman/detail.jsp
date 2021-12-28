<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.shippingsourcedetails" text="배송원상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/deliveryman/list"><spring:message code="sidemenu.workgroupmanagement.deiliveryman" text="배송원"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.shippingsourcedetails" text="배송원상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.shippingsourcedetails" text="배송원상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroup" text="업무그룹"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[H${tbUserWorker.headNo}]</span> ${tbUserWorker.head.headName} |
                            <span class="text-green">[B${tbUserWorker.branchNo}]</span> ${tbUserWorker.branch.branchName} |
                            <span class="text-green">[S${tbUserWorker.storeNo}]</span> ${tbUserWorker.store.storeName}
                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.deliveryman" text="배송원"/></strong></td>
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
                        <span class="d-sm-none"><spring:message code="list.detail.deliverymaninformation" text="배송원 정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.deliverymaninformation" text="배송원 정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
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
                    <div class="main-content" data-scrollbar="true">
                        <div class="table-responsive">
                            <form id="update_form" name="update_form">
                                <table class="table table-bordered">
                                    <input type="hidden" class="blockTypeCode" name="blockTypeCode" value="${tbUserWorker.blockTypeCode}">
                                    <input type="hidden" class="userNo" name="userNo" value="${tbUserWorker.userNo}">
                                    <input type="hidden" class="userType" name="userType" value="4">
                                    <input type="hidden" class="insertUserId" name="insertUserId" value="${tbUserWorker.insertUserId}">
                                    <input type="hidden" class="updateUserId" name="updateUserId" value="">
                                    <input type="hidden" class="headNo" name="headNo" value="${tbUserWorker.headNo}">
                                    <input type="hidden" class="branchNo" name="branchNo" value="${tbUserWorker.branchNo}">
                                    <input type="hidden" class="storeNo" name="storeNo" value="${tbUserWorker.storeNo}">
<%--                                    <div class="timeline-header m-t-10 m-b-10">--%>
                                        <tr>
                                            <td class="bg-light height-50" style="width:15%"><spring:message code="list.detail.deliverymanstatus" text="배송원 상태"/> </td>
                                            <td style="width:60%">
                                                <label class="">
                                                    <input type="radio" name="dataStatus" value="0" class="align-bottom dataStatus" <c:if test="${tbUserWorker.dataStatus.ordinal() == 0}" >checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/><%--정상--%>
                                                </label>
                                                <label class="m-l-10">
                                                    <input type="radio" name="dataStatus" value="1" class="align-bottom dataStatus" <c:if test="${tbUserWorker.dataStatus.ordinal() == 1}" >checked</c:if>> <spring:message code="list.detail.normal" text="정상"/><%--정상--%>
                                                </label>
                                                <label class="m-l-10">
                                                    <input type="radio" name="dataStatus" value="2" class="align-bottom dataStatus" <c:if test="${tbUserWorker.dataStatus.ordinal() == 2}" >checked</c:if>> <spring:message code="list.detail.stop" text="정지"/><%--정상--%>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.setthecarrierstatus" text="배송원 상태를 설정하세요."/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.loginid" text="로그인 ID"/></td>
                                            <td>${tbUserWorker.userId}
                                                <input type="hidden"  name="userId" class="form-control width-200 userId" value="${tbUserWorker.userId}" readonly>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정 불가"/></td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><spring:message code="list.detail.loginpwd" text="로그인 PWD"/></td>
                                            <td>
                                                <div class="pass-div">
                                                    <input  name="userPwd" class="form-control width-200 userPwd" value="${tbUserWorker.userPwd}" type="password" readonly>
                                                    <%--<i class="fa fa-eye fa-lg m-l-5"></i>--%>
                                                </div>
                                            </td>
                                            <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정 불가"/></td>
                                        </tr>
                                        <input type="hidden" name="pushOrderYn" value="${tbUserWorker.pushOrderYn}">
                                        <input type="hidden" name="pushNoticeYn" value="${tbUserWorker.pushNoticeYn}">
                                        <input type="hidden" name="pushMarketingYn" value="${tbUserWorker.pushMarketingYn}">
                              <%--  <tr>
                                    <td class="bg-light height-50">출근상태</td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="attendStatus" value="0" class="align-bottom dataStatus" checked> <spring:message code="merchandise.search1.option4" text="퇴근"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="attendStatus" value="1" class="align-bottom dataStatus" > <spring:message code="merchandise.search1.option4" text="출근"/>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="attendStatus" value="2" class="align-bottom dataStatus" > <spring:message code="merchandise.search1.option4" text="휴식"/>
                                        </label>
                                    </td>
                                </tr>--%>
                                    <%--<tr>
                                        <td class="bg-light">배송원 이름</td>
                                        <td colspan="3"><input type="text" name="name" value="5555" class="form-control width-200 name"></td>
                                    </tr>--%>
                                  <%--  <tr>
                                        <td class="bg-light">배송원 연락처</td>
                                        <td colspan="3"><input type="text" name="phone" value="6666" class="form-control width-200 phone"></td>
                                    </tr>--%>
                                  <%--  <tr>
                                        <td class="bg-light height-50">배송원 성별</td>
                                        <td>
                                            <label>
                                                <input type="radio" name="gender" value="N" class="align-bottom gender" checked> <spring:message code="merchandise.search1.option4" text="알수없음"/>
                                            </label>
                                            <label class="">
                                                <input type="radio" name="gender" value="M" class="align-bottom gender" > <spring:message code="merchandise.search1.option4" text="남성"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="gender" value="F" class="align-bottom gender" > <spring:message code="merchandise.search1.option4" text="여성"/>
                                            </label>
                                        </td>
                                    </tr>--%>
                                 <%--   <tr>
                                        <td class="bg-light">입사일</td>
                                        <td colspan="3">
                                            <label>
                                                <input type="text" class="form-control joinDate background-white" name="joinDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    </tr>--%>
                                    <%-- <tr>
                                         <td class="bg-light">퇴사일</td>
                                         <td colspan="3">
                                             <label>
                                                 <input type="text" class="form-control joinDate background-white" name="retireDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                             </label>
                                         </td>
                                     </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deposit" text="예치금"/></td>
                                        <td><input class="form-control width-200" type="text"  name="deposit" value="${tbUserWorker.deposit}" readonly> <spring:message code="list.detail.won" text="원"/>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.transferringtoachargingaccountmessage" text="충전 계좌로 이체시 예치금으로 입금됩니다."/></td>
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
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0 "><spring:message code="list.detail.pinnumber" text="PIN번호"/></td>
                                                    <td colspan="3" class="border-bottom-0 border-right-0">
                                                        <div class="pin-div">
                                                            <input  name="pinNum" class="form-control width-200 pinNum" value="${tbUserWorker.pinNum}" type="password"  maxlength="150" readonly>
                                                            <%--<i class="fa fa-eye fa-lg m-l-5"></i>--%>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker border-top-0 "><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                    </tr>
                                 <%--   <tr>
                                        <td class="bg-light">메모</td>
                                        <td colspan="3"><textarea type="text" name="memo" class="form-control width-400 height-150">123</textarea> </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">이미지</td>
                                        <td colspan="3"><textarea type="text" name="imgFile" class="form-control width-400 height-150">123</textarea> </td>
                                    </tr>--%>
                                </table>
                            </form>

                            <%--<table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light">배송원 상태</td>
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
                                            <input type="radio" name="status1" class="align-bottom">퇴사&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
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
                                    <td><input type="text" class="form-control" value="01011112222"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">예치금</td>
                                    <td><input type="text" class="form-control" value="0"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">배송원 구분</td>
                                    <td>
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
                                    <td class="bg-light">충전 계좌</td>
                                    <td class="p-0 border-0">
                                        <table class="width-full border-0">
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
                                    <td class="p-0 border-0">
                                        <table class="width-full border-0">
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
                                                <td class="border-left-0 border-bottom-0">미차감 잔액</td>
                                                <td class="border-bottom-0">
                                                    <span class="width-150 d-inline-block">0원</span>
                                                    <button type="button" class="btn btn-gray" data-toggle="modal" data-target="#listDeducted_modal" >내역</button>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>--%>
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
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.image" text="이미지"/></td>
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
                                                <input type="file" id="imgFile" name="imgFile" value="${tbUserWorker.imgFile}" class="fileBtn d-none">
                                                <input type="hidden" name="imgFile" value="${tbUserWorker.imgFile}">
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson" text="배송원 사진을 등록하세요."/></td>
                                    </tr>

                                  <%--  <tr>
                                        <td>배송원 주민등록증</td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body2" id="sort_body2">
                                                            <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        * 권장 이미지 비율 : 984*876<br><br>
                                                        <div class="deliverymanFileName2"></div>
                                                        <br>
                                                        <div class="deliverymanFileSize2"></div>
                                                    </li>
                                                </ul>
                                                <label for="deliverymanImgFile2">
                                                    <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                        <div>파일선택</div>
                                                    </div>
                                                </label>
                                                <input type="file" id="deliverymanImgFile2" name="deliverymanImgFile2" class="fileBtn d-none">
                                            </div>
                                        </td>
                                    </tr>--%>
                                   <%-- <tr>
                                        <td class="bg-light" rowspan="2">평가</td>
                                        <td>회수</td>
                                        <td>2건</td>
                                    </tr>--%>
                                   <%-- <tr>
                                        <td>합계</td>
                                        <td>5.0</td>
                                    </tr>--%>
                                    <%--<tr>
                                        <td class="bg-light">신분증 이름</td>
                                        <td colspan="2">${tbUserWorker.name}</td>
                                    </tr>--%>
                                 <%--   <tr>
                                        <td class="bg-light">생년월일</td>
                                        <td colspan="2">1988 년 10 월 12 일</td>
                                    </tr>--%>
                                    <%--<tr>
                                        <td class="bg-light">주민번호</td>
                                        <td colspan="2">
                                            <label>
                                                <input type="text" class="form-control" value="881012">
                                            </label>
                                            -
                                            <label>
                                                <input type="text" class="form-control" value="*******">
                                            </label>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.workstatus" text="출근상태"/></td>
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
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.setyourworkworkstatus" text="출근 / 퇴근 상태를 설정하세요."/></td>
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
                                        <td class="bg-light"><spring:message code="list.detail.deliverymanname" text="배송원 이름"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control width-200" name="name" value="${tbUserWorker.name}" maxlength="15">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthenameoftheshipper" text="배송원 이름을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deliverymanphone" text="배송원 연락처"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control width-200" name="phone" value="${tbUserWorker.phone}" maxlength="15">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.deliverymanphonemessage" text="배송원 연락처를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.deliverymangender" text="배송원 성별"/></td>
                                        <td>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="gender" value="1" class="align-bottom attendStatus" <c:if test="${tbUserWorker.gender.ordinal() eq 1}">checked</c:if>> <spring:message code="list.detail.male" text="남성"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="gender" value="2" class="align-bottom attendStatus" <c:if test="${tbUserWorker.gender.ordinal() eq 2}">checked</c:if>> <spring:message code="list.detail.female" text="여성"/>
                                            </label>
                                            <label class="">
                                                <input type="radio" name="gender" value="0" class="align-bottom attendStatus" <c:if test="${tbUserWorker.gender.ordinal() eq 0}">checked</c:if> > <spring:message code="list.detail.unknown" text=" 알수없음"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.setyourgender" text="성별을 설정하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.dateofentry" text="입사일"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control joinDate background-white"  name="joinDate" value="${tbUserWorker.joinDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>  &nbsp;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthedateofentry" text="입사일자를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.resignationdate" text="퇴사일"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control retireDate background-white"  name="retireDate" value="${tbUserWorker.retireDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>  &nbsp;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourresignationdate" text="퇴사일자를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.residenceaddress" text="거주지 주소"/></td>
                                        <td>
                                            <input type="text" value="${tbUserWorker.addr}" name="addr" class="form-control width-400" maxlength="150">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourresidentialaddress" text="거주지 주소를 입력하세요."/></td>
                                    </tr>
                                   <%-- <tr>
                                        <td class="bg-light">근무시간</td>
                                        <td colspan="2">
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
                                    </tr>--%>
                                   <%-- <tr>
                                        <td class="bg-light">운송수단</td>
                                        <td colspan="2">
                                            <select class="form-control">
                                                <option>2륜오토바이</option>
                                                <option>2륜전기오토바이</option>
                                                <option>2륜전기자전거</option>
                                                <option>3륜오토바이</option>
                                                <option>3륜전기오토바이</option>
                                                <option>3륜전기자전거</option>
                                            </select>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                        <td>
                                            <input type="text" class="form-control width-600" name="memo" value="${tbUserWorker.memo}" maxlength="150">
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.shippersnote" text="배송원 메모"/></td>
                                    </tr>
                                    <%--<tr>
                                        <td class="bg-light">배송원 차량번호</td>
                                        <td colspan="2">
                                            <input type="text" class="form-control">
                                        </td>
                                    </tr>--%>
                                   <%-- <tr>
                                        <td class="bg-light">배송원 원천세 차감여부</td>
                                        <td colspan="2">
                                            <label class="font-size-10">
                                                <input type="radio" name="status5" class="align-bottom" checked>사용&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="status5" class="align-bottom">미사용&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </td>
                                    </tr>--%>
                                </table>
                                </form>
                            </div>
                    </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <%--<div class="tab-pane fade" id="default-tab-3">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light" rowspan="6">공유설정</td>
                                    <td>공유 유무</td>
                                    <td colspan="3">
                                        <label class="font-size-10">
                                            <input type="radio" name="status6" class="align-bottom" checked>공유&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status6" class="align-bottom">공유안함&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>동시배차 가능건수</td>
                                    <td colspan="3"><input type="text" class="form-control">건</td>
                                </tr>
                                <tr>
                                    <td>미 공유 시간</td>
                                    <td colspan="3">
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
                                    <td colspan="3">
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
                                    <td colspan="3">
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
                                    <td colspan="3">
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
                            </table>
                        </div>
                </div>--%>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
               <%-- <div class="tab-pane fade" id="default-tab-4">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
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
                            </table>
                        </div>
                </div>--%>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <%--<div class="tab-pane fade" id="default-tab-5">
                    <div class="table-responsive">
                        <div class="m-b-10 float-right">
                            <button type="button" class="btn btn-primary btn_add" data-toggle="modal" data-target="#insertRental_modal"><i class="fa fa-plus m-r-3"></i> 렌탈 등록</button>
                        </div>
                        <table id="testTable" class="table table-bordered">
                            <tr>
                                <td class="bg-light">순번</td>
                                <td class="bg-light">종류</td>
                                <td class="bg-light">일비 차감 시점</td>
                                <td class="bg-light">기간</td>
                                <td class="bg-light">금액</td>
                                <td class="bg-light">삭제</td>
                            </tr>
                            <c:forEach begin="1" end="3" varStatus="idx">
                                <tr class="rentalDetailRow border-bottom" data-toggle="modal" data-target="#updateRental_modal">
                                    <td>${idx.index}</td>
                                    <td>리스비</td>
                                    <td>출근시</td>
                                    <td>2020.10.29 ~ 2020.10.29</td>
                                    <td>10000원</td>
                                    <td onclick="event.cancelBubble=true"><button type="button" class="btn-box-r remove_btn background-white">삭제</button></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>--%>
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
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
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

<script>
    $(() => {
        let url = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFile}");
        $(".imgFile").attr("src",url);

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

     /*   $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });*/

        $(".list_btn").click(function () {
            location.href = "${path}/workgroup/deliveryman/list";
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

        //deliverymanImgFile2
        $(document).on("change", "#deliverymanImgFile2", function (e) {
            e.preventDefault();
            chk_file_type(this);
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";

            var file = $("#deliverymanImgFile2")[0].files[0],
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
        });

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

            let _forms = $('#update_form, #update_form2');
            let req = convertFormToObj(_forms);
            /*let req2 = convertFormToObj(_forms2);*/
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
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbUserWorkerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
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

    function inputDataCheck(args) {
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@#$%&\\\=\(\'\"]/gi;

        /* if(regExp.test(args.LoginId)){
             return alert_focus("LoginId", "로그인ID에는 특수문자를 사용할수없습니다.");
             s        }

         if (isNull(args.bmLoginId)) {
             return alert_focus("LoginId", "로그인ID를 입력해주세요.");
         } else if (isNull(args.LoginPwd)) {
             return alert_focus("LoginPwd", "비밀번호를 입력해주세요");
         } else if (isNull(args.Name)) {
             return alert_focus("Name", "이름을 입력해주세요");
         } else if(!pwCheck) {
             return alert_focus("LoginPwd", "비밀번호는 8자리 이상, 영문+숫자+특수문자로 조합하여 설정해주세요.");
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
