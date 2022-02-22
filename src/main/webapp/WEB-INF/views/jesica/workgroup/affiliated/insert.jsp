<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.registeredaffiliatedheadquarters" text="제휴본사등록"/></title>

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
                    <li class="breadcrumb-item"><spring:message code="list.detail.workgroupmanagement" text="업무그룹"/></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/affiliated/list"><spring:message code="list.detail.affiliatedheadquarters" text="제휴본사"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.registeredaffiliatedheadquarters" text="제휴본사등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.registeredaffiliatedheadquarters" text="제휴본사등록"/><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5 ">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <div class="timeline-header m-t-10 m-b-10">
                            <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                            <span><strong><spring:message code="list.detail.basicinformation" text="기본 정보"/></strong></span>
                        </div>
                        <form id="insert_form" class="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="bg-light" style="width:15%"><spring:message code="list.detail.serviceclassification" text="서비스 구분"/></td>
                                    <td style="width:60%">
                                        <label class="font-size-10">
                                            <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="0"><spring:message code="list.detail.test" text="테스트"/>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="1" checked><spring:message code="list.detail.service" text="서비스"/>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.settlementisnotmadewhensettingupatest" text="테스트 설정시 정산이 이루어지지 않습니다."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.affiliatedheadquarters" text="제휴본사명"/></td>
                                    <td><input type="text" class="form-control width-200 headName" name="headName" value="" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthenameoftheaffiliateheadquarters" text="제휴본사 이름을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.brand" text="브랜드"/></td>
                                    <td>
                                        <select class="form-control width-200 brandNo" name="brandNo">
                                            <c:forEach var="item" items="${tbBrandList}" varStatus="status">
                                                <option value="${item.brandNo}"> ${item.brandName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.chooseyourbrand" text="브랜드를 선택하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.deliverygroupmanagement" text="배송그룹 관리여부"/>
                                    </td>
                                    <td>
                                        <select class="form-control width-200 dlvyMngYn" name="dlvyMngYn">
                                            <option value="true" ><spring:message code="list.detail.possible" text="가능"/></option>
                                            <option value="false" ><spring:message code="list.detail.impossible" text="불가능"/></option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.whensettomanageablethecontrolfunctionisactivated" text="관리 가능 설정시 관제 기능이 활성화됩니다."/></td>
                                </tr>
                                <input type="hidden" name="dataStatus" value="1" />
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.mobilephoneforauthentication" text="인증용 휴대전화"/></td>
                                    <td><input type="text" class="form-control width-200 authTel" name="authTel" value="" maxlength="20" numberOnly="true"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enterthemobilephonenumbertobeusedforauthentication" text="인증시 사용할 휴대전화번호를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.affiliatedheadquarters" text="제휴본사"/><spring:message code="list.detail.epresentativenumber" text="대표번호"/></td>
                                    <td><input type="text" class="form-control width-200 headTel" name="headTel" value="" maxlength="20" numberOnly="true"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourrepresentativenumber" text="대표번호를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.physicaladdress" text="실제 주소"/></td>
                                    <td><input type="text" class="form-control width-400 actualAddr"  name="actualAddr" value="" maxlength="200"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryouractualbusinessaddress" text="실제 사업중인 주소를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.actualoperatorname" text="실제 운영자명"/></td>
                                    <td><input type="text" class="form-control width-200 actualOwner"  name="actualOwner" value="" maxlength="30"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenterthenameoftheactualbusinessoperator" text="실제 사업중인 운영자 명을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.realcontact" text="실제 연락처"/></td>
                                    <td><input type="text" class="form-control width-200 actualTel"  name="actualTel" value="" maxlength="20" numberOnly="true"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.pleaseenterrealcontactinformation" text="실제 연락 가능한 연락처를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.majorregions" text="주요지역"/></td>
                                    <td>
                                        <%--지역선택은 나중에 바꿔서 입력해야할듯.--%>
                                        <select class="form-control m-r-10" name="memoArea">
                                            <option>서울</option>
                                            <option>부산</option>
                                            <option>대구</option>
                                            <option>인천</option>
                                            <option>광주</option>
                                            <option>대전</option>
                                            <option>울산</option>
                                            <option>세종</option>
                                            <option>경기</option>
                                            <option>강원</option>
                                            <option>충북</option>
                                            <option>충남</option>
                                            <option>전북</option>
                                            <option>전남</option>
                                            <option>경북</option>
                                            <option>경남</option>
                                            <option>제주</option>
                                        </select>
                                        <select class="form-control">
                                            <option>전체</option>
                                        </select>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.setthemainregion" text="주요지역을 설정하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전계좌"/></td>
                                    <td class="p-0 ">
                                        <input type="hidden" name="deposit" value="0" />
                                        <input type="hidden" name="cash" value="0" />
                                        <input type="hidden" name="cashDefault" value="0" />
                                        <table class="width-full border-0">
                                            <tr>
                                                <td class="border-left-0 border-top-0 border-bottom-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                <td class="border-top-0 border-right-0 border-bottom-0">
                                                    <select class="form-control width-200 m-r-10 cybankTypeCode"  name="cybankTypeCode">
                                                    </select>
                                                    <input type="hidden" name="cybankAccount" value="">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.accountautomessage" text="캐시 충전시 입금할 은행을 선택하면 계좌번호가 자동 생성됩니다."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금 계좌"/></td>
                                    <td class="p-0 border-0">
                                        <table class="width-full border-0">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                <td class="border-top-0 border-right-0 ">
                                                    <select class="form-control width-200 m-r-10 bankTypeCode"  name="bankTypeCode">
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                <td class="border-right-0"><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="" maxlength="50" numberOnly="true"></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                <td class="border-bottom-0 border-right-0"><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="" maxlength="20"></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.pinnumber" text="PIN번호"/></td>
                                                <td class="border-left-0 border-bottom-0 border-right-0">
                                                    <div class="pin-div">
                                                        <input  name="pinNum" class="form-control width-200 pinNum" value="" type="password" maxlength="20" numberOnly="true">
                                                        <i class="fa fa-eye fa-lg m-l-5"></i>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.questingawithdrawautomessage" text="출금 요청시 입금받을 사업자의 계좌 정보를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                    <td><input type="text" class="form-control width-600 memoEtc" name="memoEtc" value="" maxlength="200"></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.othermemo" text="기타 메모"/></td>
                                </tr>
                            </table>
                        </form>

                        <br>
                        <div class="timeline-header m-t-10 m-b-10">
                            <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                            <span><strong><spring:message code="list.detail.businessinformation" text="사업자 정보"/></strong></span>
                        </div>
                        <div>
                            <form class="insert_form2">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.mutual" text="상호"/></td>
                                        <td style="width:60%">
                                            <input type="text" class="form-control width-200 bizName" name="bizName" value=""  maxlength="80">
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="1" class="align-bottom corpType" checked><spring:message code="list.detail.normal" text="일반"/>
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="2" class="align-bottom corpType"><spring:message code="list.detail.normal" text="간이"/>
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="corpType" value="3" class="align-bottom corpType"><spring:message code="list.detail.corporation" text="법인"/>
                                            </label>
                                            <label class="font-size-10 m-l-10">
                                                <input type="radio" name="corpType" value="0" class="align-bottom corpType" ><spring:message code="list.detail.unknown" text="알수없음"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.enterthebusinessnamemessage" text="사업자등록증 기준의 상호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.companyregistrationnumber" text="사업자 등록번호"/></td>
                                        <td><input type="text" class="form-control width-200 bizNum" name="bizNum" value="" maxlength="20" numberOnly="true"></td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheregistrationnumbermessage" text="사업자등록증의 등록번호를 입력하세요."/></td>
                                        <input type="hidden" name="authStatus" value="0"/>
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
                                        <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="" maxlength="30"></td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheregistrationnumbermessage" text="사업자등록증 기준의 대표자를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.email" text="이메일"/></td>
                                        <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value="" maxlength="45"></td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheemailtoreceivetheinvoice" text="계산서를 수신할 이메일을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.contact" text="연락처"/></td>
                                        <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value="" maxlength="40" numberOnly="true"></td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.pleaseenteryourbusinesscontactinformation" text="사업자 연락처를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.businessaddress" text="사업장 주소"/></td>
                                        <td><input type="text" name="bizAddr" class="form-control width-400 bizAddr" value="" maxlength="150"></td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertheaddressonyourbusinessmessage" text="사업자등록증 상의 주소를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.typeofbusiness/industry" text="업태/업종"/></td>
                                        <td>
                                            <input type="text" name="bizType" class="form-control m-r-10 width-200 bizType" value="" maxlength="80">
                                            <input type="text" name="bizItem" class="form-control width-200 bizItem" value="" maxlength="80">
                                        </td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.typeofbusinessindustrymessage" text="사업자등록증 상의 업태와 종목을 입력하세요."/></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    <div class="m-l-5 m-t-10">
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i><spring:message code="list.detail.list" text="목록"/></button>
                        <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-5"></i><spring:message code="list.detail.enrollment" text="등록"/></button>
                    </div>
                </div>
            <%--    <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light">상호</td>
                                <td>
                                    <label>
                                        <strong class="align-sub">${tbHead.businessInfo.bizName}</strong>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="corpType" class="align-bottom corpType">알수없음&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="corpType" class="align-bottom corpType">>일반&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="corpType" class="align-bottom corpType">간이&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="corpType" class="align-bottom corpType">법인&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업자 등록번호</td>
                                <td><input type="text" class="form-control width-200" value="${tbHead.businessInfo.bizNum}"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업자 인증</td>
                                <td>
                                    <button type="button" class="btn btn-gray">한신평 인증</button>
                                    <button type="button" class="btn btn-gray">인증 요청</button>
                                    <button type="button" class="btn btn-gray d-none">인증완료</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업자 등록증</td>
                                <td>
                                    <label for="saupja" class="width-100 height-30 text-center line-height-30" style="background: #a0a0a0;">파일업로드</label>
                                    <input type="file" class="d-none" id="saupja">
                                    <div class="width-200 height-30 border overflow-hidden m-t-10 line-height-25 white-space-nowrap text-overflow-ellipsis">
                                        <span class="fileName"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">대표자 명</td>
                                <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="${tbHead.businessInfo.bizOwner}"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">이메일</td>
                                <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value="${tbHead.businessInfo.bizEmail}"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">연락처</td>
                                <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value="${tbHead.businessInfo.bizTel}"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업장 주소</td>
                                <td><input type="text" name="bizAddr" class="form-control width-200 bizAddr" value="${tbHead.businessInfo.bizAddr}"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">업종/업태</td>
                                <td>
                                    <input type="text" name="bizItem" class="form-control m-r-10 width-200 bizItem" value="${tbHead.businessInfo.bizItem}">
                                    <input type="text" name="bizType" class="form-control width-200 bizType" value="${tbHead.businessInfo.bizType}">
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">주요지역</td>
                                <td>
                                    <select class="form-control m-r-10">
                                        <option>서울</option>
                                        <option>대전</option>
                                        <option>대구</option>
                                        <option>부산</option>
                                    </select>
                                    <select class="form-control">
                                        <option>전체</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">실제 주소</td>
                                <td><input type="text" class="form-control width-200 actualAddr"  name="actualAddr"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">실제 운영자 명</td>
                                <td><input type="text" class="form-control width-200 actualOwner"  name="actualOwner"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">실제 연락처</td>
                                <td><input type="text" class="form-control width-200 actualTel"  name="actualTel"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">세금계산서 역발행 구분</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status4" class="align-bottom" checked>일반&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status4" class="align-bottom">간이&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- end table-responsive -->
                    <div class="m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> 등록&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                    </div>
                </div>--%>
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

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

    <%@include file="../../../common/include_kakao_map_js.jsp" %>
    <%@include file="../../../common/include_number_only_js.jsp" %>
<script>
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

        //가상계좌(입금)
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

        $(".btn_list").click(function() {
            location.href = "${path}/workgroup/affiliated/list?brandNo=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&headName=";
        });
        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/affiliated/insert/action";
            let _forms = $('.insert_form');
            let _forms2 = $('.insert_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            let registermsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let registerfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let enrollment = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";


            if (inputDataCheck(req,req2)) {
                swal({
                    title: registermsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        enrollment
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbHeadData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbBusinessInfoData",  new Blob([JSON.stringify(req2)], {type:"application/json"}));
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
                                    location.href = "${path}/workgroup/affiliated/list";
                                } else {
                                    alert(registerfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });
    });


    function inputDataCheck(args,args2) {
        let headnamemsg = "<spring:message code="list.description.enterthenameoftheaffiliatedheadoffice" text="제휴본사명을 입력해주세요."/>";
        if (isNull(args.headName)) {
            return alert_focus("headName", headnamemsg);
        } /*else if (isNull(args.authTel)) {
            return alert_focus("authTel", "인증용 휴대전화를 입력해주세요");
        } */else if (isNull(args.headTel)) {
            return alert_focus("headTel", "제휴본사대표번호를 입력해주세요");
        } else if (isNull(args.actualAddr)) {
            return alert_focus("actualAddr", "실제주소를 입력해주세요");
        }
        /*else if (isNull(args.actualOwner)) {
            return alert_focus("actualOwner", "실제 운영자명을 입력주세요");
        } else if (isNull(args.actualTel)) {
            return alert_focus("actualTel", "실제 연락처를 입력해주세요");
        } else if (isNull(args.bankAccount)) {
            return alert_focus("bankAccount", "출금계좌번호를 입력해주세요");
        } else if (isNull(args.bankOwner)) {
            return alert_focus("bankOwner", "예금주를 입력해주세요");
        } else if (isNull(args.pinNum)) {
            return alert_focus("pinNum", "핀번호를 입력해주세요");
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
        }*/
        return true;
    }
</script>
</body>
</html>
