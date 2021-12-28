<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 소속가맹점 등록<%--<spring:message code="merchandise.detail.title" text="default text"/>--%></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1" text="가맹점 설정"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/workgroup/affilfranch/list"><spring:message code="side.main1.sub1" text="가맹점"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="merchandise.insert.title" text="등록"/><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">가맹점 등록<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>

<%--            <div class="tab-content">--%>
                <!-- begin tab-pane -->
<%--                <div class="tab-pane fade active show" id="default-tab-1">--%>
                    <div class="row width-full p-5">
                        <!-- begin col-8 -->
                        <!-- begin panel -->
                        <div class="panel panel-inverse width-full">
                            <!-- begin table-responsive -->
                            <div class="table-responsive m-l-5">
                                <div class="timeline-header m-t-10 m-b-10">
                                    <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                    <span><strong>기본 정보</strong></span>
                                </div>
                                <form class="dlvy_search_form"></form>
                                <form class="insert_form" id="insert_form">
                                <table class="table table-bordered">
                                    <tr>
                                        <td class="bg-light height-50" style="width:15%">서비스 구분</td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="0" checked> 테스트<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="1" > 서비스<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">테스트 설정시 정산이 이루어지지 않습니다.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">소속 업무그룹</td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal"  placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/><%--제휴본사 선택--%>" class="form-control background-white headName width-200" readonly>
                                                <input type="hidden" class="headNo" name="headNo" value="">

                                            </label>
                                            <label>
                                                <input type="text" data-toggle="" data-target="#branch_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/><%--총판선택--%>" class="form-control background-white branchName width-200" readonly>
                                                <input type="hidden" class="branchNo" name="branchNo" value="">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">소속 제휴본사와 총판을 선택하세요.</td>
                                    </tr>
                                    <%--<tr>
                                        <td>가게구분</td>
                                        <td>
                                            <select class="form-control">
                                                <option>음식점</option>
                                                <option>편의점</option>
                                                <option>마트</option>
                                                <option>퀵</option>
                                                <option>화물</option>
                                                <option>콜벤</option>
                                                <option>당일배송</option>
                                            </select>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light">가맹점명</td>
                                        <td><input type="text" class="form-control width-200" name="storeName" value="${tbStore.storeName}"></td>
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
                                    <input type="hidden" name="dataStatus" value="1">
                                    <input type="hidden" name="masterYn" value="0">
<%--
                                    <tr>
                                        <td class="bg-light height-50">직영가맹점 여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="masterYn" value="0" class="align-bottom masterYn" checked> 일반가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="masterYn" value="1" class="align-bottom masterYn"> 직영가맹점&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">직영 가맹점인지 선택하세요.</td>
                                    </tr>
--%>
                                    <tr>
                                        <td class="bg-light height-50">24시간운영 여부</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="alldayOpenYn" value="false" class="align-bottom alldayOpenYn" checked> 시간제<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="alldayOpenYn" value="true" class="align-bottom alldayOpenYn" > 24시간 운영<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">매장 24시간 운영여부를 선택하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">매장타입</td>
                                        <td>
                                            <label class="">
                                                <input type="radio" name="storeType" value="0" class="align-bottom storeType"> <spring:message code="merchandise.search1.option4" text="배달전용"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="storeType" value="1" class="align-bottom storeType" checked> <spring:message code="merchandise.search1.option4" text="주문배달"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="storeType" value="2" class="align-bottom storeType" > <spring:message code="merchandise.search1.option4" text="마트"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="storeType" value="3" class="align-bottom storeType" > <spring:message code="merchandise.search1.option4" text="전통시장"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">매장 운영 타입을 선택하세요.</td>
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
                                        <td class="bg-light">가맹점 대표번호</td>
                                        <td><input type="text" class="form-control width-200" name="storeTel" value="${tbStore.storeTel}"></td>
                                        <td class="text-danger-darker">대표번호를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">인증 휴대전화</td>
                                        <td><input type="text" class="form-control width-200" name="authTel" value="${tbStore.authTel}"></td>
                                        <td class="text-danger-darker">인증시 사용할 휴대전화번호를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">영업담당자 이름</td>
                                        <td><input type="text" class="form-control width-200" name="mngrName" value="${tbStore.mngrName}"></td>
                                        <td class="text-danger-darker">영업 담당자 이름을 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">주소명칭</td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-200" name="poi"   placeholder="주소명칭을 입력해주세요">
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
                                    <tr>
                                        <td class="bg-light">지도 (주소검색)</td>
                                        <td>
                                            <div id="map" class="height-300 width-full"></div><br>
                                            <label class="m-r-10">
                                            위도 <input type="text" id="lat" name="lat" value="${tbStore.lat}" readonly>
                                            경도 <input type="text" id="lng" name="lng" value="${tbStore.lng}" readonly>
                                            </label><br><br>
                                            <input type="text" class="form-control width-100 addr_1" id="addr_1" name="addr1" value="${tbStore.addr1}">
                                            <input type="text" class="form-control width-100" id="addr_2" name="addr2" value="${tbStore.addr2}">
                                            <input type="text" class="form-control width-200" id="addr_3" name="addr3" value="${tbStore.addr3}">
                                            <input type="text" class="form-control width-200" id="addr_4" name="addr4" value="${tbStore.addr4}"  placeholder="나머지주소">
                                        </td>
                                        <td class="text-danger-darker">주소를 검색하면 주소 정보와 좌표가 자동 세팅됩니다.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">상세주소</td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-400" name="addr5" value="${tbStore.addr5}" placeholder="상세주소를 입력해주세요">
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">	주소 상세 항목이 있으면 입력하세요.</td>
                                    </tr>
                                   <%-- <tr>
                                        <td>가맹점 위치 간편설명(배달기사용)</td>
                                        <td>
                                            <label class="m-r-10">
                                                <input type="text" class="form-control width-200">
                                            </label>
                                        </td>
                                    </tr>--%>
                                    <%-- <tr>
                                         <td class="bg-light" rowspan="8">사업자정보</td>
                                         <td>상호</td>
                                         <td>
                                             <label><input type="text" class="form-control width-200"></label>
                                             <label class="m-r-10 " for="aa">
                                                 <input type="radio" id="aa" name="status2" class="align-bottom" checked>일반&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                             </label>
                                             <label for="bb" class="m-r-10 ">
                                                 <input type="radio" id="bb" name="status2" class="align-bottom">간이&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                             </label>
                                             <label for="bb" class="m-r-10 ">
                                                 <input type="radio" id="bb" name="status2" class="align-bottom">법인&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                             </label>
                                             <label for="bb" class="">
                                                 <input type="radio" id="bb" name="status2" class="align-bottom">알수없음&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                             </label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>사업자 등록번호</td>
                                         <td><input type="text" class="form-control width-200"></td>
                                     </tr>
                                     <tr>
                                         <td>대표자명</td>
                                         <td><input type="text" class="form-control width-200"></td>
                                     </tr>
                                     <tr>
                                         <td>대표자 생년월일</td>
                                         <td><input type="text" class="form-control width-200" placeholder="ex) 800101"></td>
                                     </tr>
                                     <tr>
                                         <td>이메일</td>
                                         <td><input type="text" class="form-control width-200"></td>
                                     </tr>
                                     <tr>
                                         <td>연락처</td>
                                         <td>
                                             <label><input type="text" class="form-control width-200"></label>
                                             <label>
                                                 <select class="form-control">
                                                     <option>기타전화</option>
                                                     <option>요기요앱</option>
                                                     <option>배달통앱</option>
                                                     <option>배민앱</option>
                                                     <option>카카오앱</option>
                                                 </select>
                                             </label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td>사업장 주소</td>
                                         <td><input type="text" class="form-control width-200"></td>
                                     </tr>
                                     <tr>
                                         <td>업종/업태</td>
                                         <td>
                                             <label><input type="text" class="form-control width-200" placeholder="업종 입력"></label>
                                             <label><input type="text" class="form-control width-200" placeholder="업태 입력"></label>
                                         </td>
                                     </tr>--%>
                                    <%--  <tr>
                                          <td class="bg-light" rowspan="3">실제 운영정보</td>
                                          <td>실 주소</td>
                                          <td><input type="text" class="form-control width-200"></td>
                                      </tr>
                                      <tr>
                                          <td>실 운영자명</td>
                                          <td><input type="text" class="form-control width-200"></td>
                                      </tr>
                                      <tr>
                                          <td>실 연락처</td>
                                          <td><input type="text" class="form-control width-200"></td>
                                      </tr>--%>
                                    <input type="hidden" name="deposit" value="0" />
                                    <input type="hidden" name="cash" value="0" />
                                    <input type="hidden" name="cashDefault" value="0" />
                                    <tr>
                                        <td class="bg-light">충전 계좌</td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200">은행</td>
                                                    <td class="border-top-0 border-right-0">
                                                        <select class="form-control m-r-10 cybankTypeCode"  name="cybankTypeCode">
                                                        </select>
                                                        <input type="hidden" name="cybankAccount" value="">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker">캐시 충전시 입금할 은행을 선택하면 계좌번호가 자동 생성됩니다.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">출금 계좌</td>
                                        <td class="p-0 border-0">
                                            <table class="width-full border-0">
                                                <tr>
                                                    <td class="border-left-0 border-top-0 width-200">은행</td>
                                                    <td class="border-top-0 border-right-0">
                                                        <select class="form-control m-r-10 bankTypeCode"  name="bankTypeCode">
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0">계좌번호</td>
                                                    <td class="border-right-0"><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value=""></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0">예금주</td>
                                                    <td class="border-bottom-0 border-right-0"><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value=""></td>
                                                </tr>
                                                <tr>
                                                    <td class="border-left-0 border-bottom-0">PIN번호</td>
                                                    <td class="border-bottom-0 border-right-0">
                                                        <div class="pin-div">
                                                            <input  name="pinNum" class="form-control width-200 pinNum" value="" type="password" >
                                                            <i class="fa fa-eye fa-lg m-l-5"></i>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="text-danger-darker">출금 요청시 입금받을 사업자의 계좌 정보를 입력하세요.</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">메모</td>
                                        <td><input type="text" class="form-control width-600 memo" name="memo" value=""></td>
                                        </td>
                                        <td class="text-danger-darker">기타 메모</td>
                                    </tr>
                                </table>
                            </form>
                                <br>
                                <div class="timeline-header m-t-10 m-b-10">
                                    <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                    <span><strong>사업자 정보</strong></span>
                                </div>
                                <form class="insert_form2">
                                    <table class="table table-condensed table-bordered">
                                        <tr>
                                            <td class="bg-light" style="width:15%;">상호</td>
                                            <td style="width:60%">
                                                <input type="text" class="form-control width-200 bizName" name="bizName" value="">
                                                <label class="m-l-10 font-size-10">
                                                    <input type="radio" name="corpType" value="1" class="align-bottom corpType" checked>일반
                                                </label>
                                                <label class="m-l-10 font-size-10">
                                                    <input type="radio" name="corpType" value="2" class="align-bottom corpType">간이
                                                </label>
                                                <label class="m-l-10 font-size-10">
                                                    <input type="radio" name="corpType" value="3" class="align-bottom corpType">법인
                                                </label>
                                                <label class="font-size-10 m-l-10">
                                                    <input type="radio" name="corpType" value="0" class="align-bottom corpType" >알수없음
                                                </label>
                                            </td>
                                            <td class="text-danger-darker">사업자등록증 기준의 상호를 입력하세요.</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">사업자 등록번호</td>
                                            <td><input type="text" class="form-control width-200 bizNum" name="bizNum" value=""></td>
                                            <td class="text-danger-darker">사업자등록증의 등록번호를 입력하세요.</td>
                                        </tr>
                                        <input type="hidden" name="authStatus" value="0">
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
                                            <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value=""></td>
                                            <td class="text-danger-darker">사업자등록증 기준의 대표자를 입력하세요.</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">이메일</td>
                                            <td><input type="email" name="bizEmail" class="form-control width-200 bizEmail" value=""></td>
                                            <td class="text-danger-darker">계산서를 수신할 이메일을 입력하세요.</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">연락처</td>
                                            <td><input type="text" name="bizTel" class="form-control width-200 bizTel" value=""></td>
                                            <td class="text-danger-darker">사업자 연락처를 입력하세요.</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">사업장 주소</td>
                                            <td><input type="text" name="bizAddr" class="form-control width-400 bizAddr" value=""></td>
                                            <td class="text-danger-darker">사업자등록증 상의 주소를 입력하세요.</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">업태/업종</td>
                                            <td>
                                                <input type="text" name="bizType" class="form-control m-r-10 width-200 bizType" value="">
                                                <input type="text" name="bizItem" class="form-control width-200 bizItem" value="">
                                            </td>
                                            <td class="text-danger-darker">사업자등록증 상의 업태와 종목를 입력하세요.</td>
                                        </tr>
                                    </table>
                                </form>
                            </div>

                            <!-- end table-responsive -->
                            <div class="m-l-5 m-t-5">
                                <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i> 등록<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                            </div>
                        </div>
                        <!-- end panel -->
                        <!-- end col-8 -->
                    </div>
                </div>
<%--            </div>--%>
<%--        </div>--%>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="branchSearch.jsp" %>
</div>
<%--modal search end--%>

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
    let map;
    let marker;
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

        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "BT"},
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
        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "CBT"},
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

        /*initMap();*/
        initAutocomplete();

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
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
                    $(".searchDlvyList").append(
                        "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                    )
                }
            }
        });

        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    for(var i = 0 ; i < data.searchHeadList.length ; i++){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"head_text\">\n" +
                            ""+data.searchHeadList[i].headName+""+
                            "<small style=\"color: green;\">["+data.searchHeadList[i].headNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click",function(){
            let headNo = $(".headNo").val();
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
                    for(var i = 0 ; i < data.searchBranchList.length ; i++){
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"branch_text\">\n" +
                            ""+data.searchBranchList[i].branchName+""+
                            "<small style=\"color: green;\">["+data.searchBranchList[i].branchNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName="+data.searchBranchList[i].branchName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo="+data.searchBranchList[i].branchNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            if(headNo == null || headNo =='') {
                swal({
                    title: "제휴본사를 선택해주세요.",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '확인'
                    ],
                    dangerMode: true,
                });
            }

        });

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".searchBranchList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".branchModalCloseBtn").click();
        });

        $(".btn_list").click(function() {
            location.href = "/workgroup/affilfranch/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/affilfranch/insert/action";
            let _forms = $('.insert_form');
            let _forms2 = $('.insert_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            if (inputDataCheck(req)) {
                swal({
                    title: "등록 하시겠습니까",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '등록'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbStoreData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
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
                                location.href = "${path}/workgroup/affilfranch/list";
                            } else {
                                alert("등록에 실패하였습니다.");
                                return;
                            }
                        }
                    });
                    }
                });
            }
        });
    });

    function initMap() {
        let uluru = {lat: 37.566302,lng: 126.977946};
        map = new google.maps.Map(document.getElementById("map"), {
            center: uluru,
            zoom: 18,
        });
        marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }



    function initAutocomplete() {
        let lat = $("#lat").val();
        let lng = $("#lng").val();
        if (lat == "") {
            lat = 37.4816268;
        }
        if (lng == "") {
            lng = 126.8829256;
        }

        const map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: lat, lng: lng },
            zoom: 13,
            mapTypeControl: false,
            mapTypeId: "roadmap",
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

    /*function postCodeBtn() {
        let poi = $("#pac-input").val();

        let geocoder = new google.maps.Geocoder();

        /!**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지.
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         *
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         *!/
        geocoder.geocode({'address': poi}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                let address = null;

              /!*  // 맵의 중심 좌표를 설정한다.
                map.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                map.setZoom(18);
                // 맵 마커
                marker.setMap(null);
                marker = new google.maps.Marker({
                    map: map,
                    position: result[0].geometry.location
                });*!/

              /!*  let addressArray = result[0].address_components;

                for(var i = 0 ; i < addressArray.length ; i++){
                    if(addressArray[addressArray.length - (i+1)].long_name != '대한민국') {
                        if(i > 5) {
                            let addAddr = addressArray[addressArray.length - (i+1)].long_name;
                            $("#addr_4").val($("#addr_4").val() + addAddr);
                        }else {
                            $("#addr_"+(i-1)).val(addressArray[addressArray.length - (i+1)].long_name);
                        }
                    }
                }*!/

                $("#poi").val(result[0].formatted_address.replace('대한민국','').replace(/^\s*!/, ""));
                initAutocomplete();

                /!*  // 위도
                  console.log('위도(latitude) : ' + marker.position.lat());
                  // 경도
                  console.log('경도(longitude) : ' + marker.position.lng());*!/
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }*/


    function inputDataCheck(args) {
        console.log(args);
        if (isNull(args.headNo)) {
            return alert_focus("headNo", "제휴본사를 선택해주세요");
        } else if (isNull(args.addr1)) {
            return alert_focus("addr1", "주소를 검색해주세요");
        } else if (isNull(args.branchNo)) {
            return alert_focus("branchNo", "총판을 선택해주세요");
        } else if (isNull(args.storeName)) {
            return alert_focus("storeName", "가맹점명을 입력해주세요");
/*
        } else if (isNull(args.storeTel)) {
            return alert_focus("storeTel", "가맹점전화번호를 입력해주세요");
        } else if (isNull(args.storeNameInapp)) {
            return alert_focus("storeNameInapp", "고객앱 가맹점명을 입력해주세요");
        } else if (isNull(args.mngrName)) {
            return alert_focus("mngrName", "영업담당자명을 입력해주세요");
        } else if (isNull(args.authTel)) {
            return alert_focus("authTel", "인증용 휴대전화를 입력해주세요");
        } else if (isNull(args.deposit)) {
            return alert_focus("deposit", "예치금을 입력해주세요");
        } else if (isNull(args.cash)) {
            return alert_focus("cash", "캐쉬를 입력해주세요");
        } else if (isNull(args.cashDefault)) {
            return alert_focus("cashDefault", "캐쉬 체납금을 입력해주세요");
        }  else if (isNull(args.cybankTypeCode)) {
            return alert_focus("cybankTypeCode", "가상계좌 은행구분 코드를 입력해주세요");
        } else if (isNull(args.cybankAccount)) {
            return alert_focus("cybankAccount", "가상계좌 번호을 입력해주세요");
        } else if (isNull(args.bankTypeCode)) {
            return alert_focus("bankTypeCode", "인출은행 구분 코드을 입력해주세요");
        } else if (isNull(args.bankAccount)) {
            return alert_focus("bankAccount", "인출은행 계좌번호를 입력해주세요");
        } else if (isNull(args.bankOwner)) {
            return alert_focus("bankOwner", "인출은행 예금주를 입력해주세요");
        } else if (isNull(args.pinNum)) {
            return alert_focus("pinNum", "PIN번호를 입력해주세요");
*/
        }
        return true;
    }
</script>
</body>
</html>
