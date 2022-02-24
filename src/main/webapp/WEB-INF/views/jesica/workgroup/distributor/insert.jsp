<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.search.distributorregistration" text="총판등록"/></title>
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
                    <li class="breadcrumb-item"><a href="${path}/workgroup/distributor/list"><spring:message code="sidemenu.workgroupmanagement.exclusivedistributor" text="총판"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.search.distributorregistration" text="총판등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.search.distributorregistration" text="총판등록"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <!-- begin col-8 -->
                <!-- begin panel -->
                <div class="panel panel-inverse width-full">
                    <!-- begin table-responsive -->
                    <%--<div class="table-responsive m-l-5">
                        <table class="table table-bordered">
                            <tr>
                                <td class="bg-light" rowspan="8">기본 정보</td>
                                <td>소속 업무그룹</td>
                                <td>
                                    <label>
                                        <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>&lt;%&ndash;제휴본사 선택&ndash;%&gt;" class="form-control background-white" readonly>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>관리센터</td>
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
                                <td>총판명</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>로그인ID</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>로그인PW</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>인증 휴대전화</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>기본 배송그룹</td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control background-white" data-toggle="modal" data-target="#search_modal" placeholder="배송그룹선택&lt;%&ndash;<spring:message code="merchandise.search1.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;제휴본사 선택&ndash;%&gt;"readonly>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>총판 구분</td>
                                <td>
                                    <label class="m-r-10 font-size-10">
                                        <input type="checkbox" class="align-bottom" name="test1" checked>일반
                                    </label>
                                    <label class="m-r-10 font-size-10">
                                        <input type="checkbox" class="align-bottom" name="test1">간선총판
                                    </label>
                                    <label class="font-size-10">
                                        <input type="checkbox" class="align-bottom" name="test1">지선총판
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="2">계약자 / 담당자 정보</td>
                                <td>계약자</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>담당자</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="9">사업자정보</td>
                                <td>상호</td>
                                <td>
                                    <label><input type="text" class="form-control width-200"></label>
                                    <label class="m-r-10 font-size-10" for="aa">
                                        <input type="radio" id="aa" name="status2" class="align-bottom" checked>일반&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;&lt;%&ndash;소속&ndash;%&gt;
                                    </label>
                                    <label for="bb" class="m-r-10 font-size-10">
                                        <input type="radio" id="bb" name="status2" class="align-bottom">간이&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                    </label>
                                    <label for="bb" class="m-r-10 font-size-10">
                                        <input type="radio" id="bb" name="status2" class="align-bottom">법인&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;&lt;%&ndash;영업&ndash;%&gt;
                                    </label>
                                    <label for="bb" class="font-size-10">
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
                                <td>이메일</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>사업장 주소</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>업종/업태</td>
                                <td>
                                    <label><input type="text" class="form-control width-200"></label>
                                    <label><input type="text" class="form-control width-200"></label>
                                </td>
                            </tr>
                            <tr>
                                <td>주요지역</td>
                                <td>
                                    <label>
                                        <select class="form-control">
                                            <option>서울</option>
                                            <option>대전</option>
                                            <option>대구</option>
                                            <option>부산</option>
                                        </select>
                                    </label>
                                    <label>
                                        <select class="form-control">
                                            <option>전체</option>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>프랜차이즈</td>
                                <td>
                                    <select class="form-control width-150">
                                        <option value="">프랜차이즈 선택</option>
                                        <option value="0001">멕시카나</option>
                                        <option value="0002">BHC</option>
                                        <option value="0003">호식이두마리치킨</option>
                                        <option value="0004">피자나라치킨공주</option>
                                        <option value="0005">치킨매니아</option>
                                        <option value="0006">페리카나</option>
                                        <option value="0007">굽네치킨</option>
                                        <option value="0008">빨간모자피자</option>
                                        <option value="0009">솔루체피자</option>
                                        <option value="0010">원할머니보쌈</option>
                                        <option value="0011">본죽</option>
                                        <option value="0012">피자에땅</option>
                                        <option value="0013">김밥천국</option>
                                        <option value="0014">피자알볼로</option>
                                        <option value="0015">도미노피자</option>
                                        <option value="0016">또레오레</option>
                                        <option value="0017">7번가피자</option>
                                        <option value="0018">놀부보쌈</option>
                                        <option value="0019">임실치즈피자</option>
                                        <option value="0020">디디치킨</option>
                                        <option value="0021">미스터보쌈</option>
                                        <option value="0022">죽이야기</option>
                                        <option value="0023">BBQ</option>
                                        <option value="0024">네네치킨</option>
                                        <option value="0025">맥시칸</option>
                                        <option value="0026">강정이기가막혀</option>
                                        <option value="0027">교촌치킨</option>
                                        <option value="0028">한명숙피자치킨</option>
                                        <option value="0029">멕시칸</option>
                                        <option value="0030">뽕뜨락피자</option>
                                        <option value="0031">미스터피자</option>
                                        <option value="0032">코바코</option>
                                        <option value="0033">마구스피자</option>
                                        <option value="0034">피자마루</option>
                                        <option value="0035">한솥도시락</option>
                                        <option value="0036">야미가</option>
                                        <option value="0037">치킨마루</option>
                                        <option value="0038">59쌀피자</option>
                                        <option value="0039">60계치킨</option>
                                        <option value="0040">BBQ올리브떡볶이</option>
                                        <option value="0041">BRD숯불바베큐치킨</option>
                                        <option value="0042">ICG</option>
                                        <option value="0043">KFC</option>
                                        <option value="0044">강정구의피자생각</option>
                                        <option value="0045">거성치킨</option>
                                        <option value="0046">걸작떡볶이</option>
                                        <option value="0047">계동치킨</option>
                                        <option value="0048">구어스치킨</option>
                                        <option value="0049">구어조은닭</option>
                                        <option value="0050">구워더존치킨</option>
                                        <option value="0051">굽는치킨</option>
                                        <option value="0052">김가네</option>
                                        <option value="0053">깐부치킨</option>
                                        <option value="0054">꾸꾸루꾸</option>
                                        <option value="0055">꾸띵</option>
                                        <option value="0056">난타5000</option>
                                        <option value="0057">노랑통닭</option>
                                        <option value="0058">놀부부대찌개</option>
                                        <option value="0059">눈물떡볶이</option>
                                        <option value="0060">다사랑치킨피자</option>
                                        <option value="0061">도야족발</option>
                                        <option value="0062">돈도니석쇠한판불고기</option>
                                        <option value="0063">돈치킨</option>
                                        <option value="0064">돈통마늘보쌈</option>
                                        <option value="0065">동대문엽기떡볶이</option>
                                        <option value="0066">두리아</option>
                                    </select>
                            </tr>
                            <tr>
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
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="3">출금 계좌 등록</td>
                                <td>은행</td>
                                <td>
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
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td>예금주</td>
                                <td><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="2">충전계좌등록</td>
                                <td>은행</td>
                                <td>
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
                                <td>계좌 발행 시 자동으로 생성됩니다.</td>
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
                    <div class="panel panel-inverse width-full">
                        <div class="table-responsive m-l-5">
                            <div class="timeline-header m-t-10 m-b-10">
                                <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                <span><strong><spring:message code="list.detail.basicInformation" text="기본정보"/></strong></span>
                            </div>
                            <form class="head_search_form"></form>
                            <form class="dlvy_search_form"></form>
                            <form class="insert_form" id="insert_form">
                                <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <table class="table table-bordered">
                                    <tr>
                                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.serviceclassification" text="서비스 구분"/></td>
                                        <td style="width:60%" colspan="2">
                                            <label class="font-size-10">
                                                <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="0"><spring:message code="list.detail.test" text="테스트"/>
                                            </label>
                                            <label class="m-l-10 font-size-10">
                                                <input type="radio" name="serviceYn" class="align-bottom serviceYn" value="1" checked><spring:message code="list.detail.service" text="서비스"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.settlementisnotmadewhensettingupatest" text="테스트 설정시 정산이 이루어지지 않습니다."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.distributorheadquarters" text="총판명"/></td>
                                        <td colspan="2"><input type="text" colspan="2" class="form-control width-200 branchName" name="branchName" value="" maxlength="40"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthedistributorname" text="총판 이름을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.affiliatedheadquarters" text="제휴본사"/></td>
                                        <td colspan="2">
                                            <select class="form-control width-200 searchHeadList headNo" name="headNo">
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.chooseyouraffiliatedheadoffice" text="소속 제휴본사를 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.defaultshippinggroup" text="기본 배송그룹"/></td>
                                        <td colspan="2">
                                            <select class="form-control width-200 searchDlvyList dlvyNo" name="dlvyno" >
                                            </select>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.chooseyourdefaultshippinggroup" text="기본 배송그룹을 선택하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.mobilephoneforauthentication" text="인증용 휴대전화"/></td>
                                        <td colspan="2"><input type="text" class="form-control width-200 authTel" name="authTel" value="" maxlength="20" numberOnly="true"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthemobilephonenumbertobeusedforauthentication" text="인증시 사용할 휴대전화번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.distributorrepresentativenumber" text="총판 대표번호"/></td>
                                        <td colspan="2"><input type="text" class="form-control width-200 branchTel" name="branchTel" value="" maxlength="20" numberOnly="true"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourrepresentativenumber" text="대표번호를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.physicaladdress" text="실제 주소"/></td>
                                        <td colspan="2"><input type="text" class="form-control width-400 actualAddr"  name="actualAddr" value="" maxlength="200"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryouractualbusinessaddress" text="실제 사업중인 주소를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.actualoperatorname" text="실제 운영자 명"/></td>
                                        <td colspan="2"><input type="text" class="form-control width-200 actualOwner"  name="actualOwner" value="" maxlength="40"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.enterthenameoftherealbusinessoperator" text="실제 사업중인 운영자 명을 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.realcontact" text="실제 연락처"/></td>
                                        <td colspan="2"><input type="text" class="form-control width-200 actualTel"  name="actualTel" value="" maxlength="20" numberOnly></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterrealcontactinformation" text="실제 연락 가능한 연락처를 입력하세요."/></td>
                                    </tr>
                                   <%-- <tr>
                                        <td class="bg-light">배달대행번호
                                        </td>
                                        <td>
                                            <select class="form-control dlvyMngYn" name="dlvyMngYn">
                                                <option value="1" <c:if test="${tbHead.dlvyMngYn == true}">selected</c:if>>가능</option>
                                                <option value="0" <c:if test="${tbHead.dlvyMngYn == false}">selected</c:if>>불가능</option>
                                            </select>
                                        </td>
                                    </tr>--%>
                                    <input type="hidden" name="deposit" value="0" />
                                    <input type="hidden" name="cash" value="0" />
                                    <input type="hidden" name="cashDefault" value="0" />
                                   <%-- <tr>
                                        <td class="bg-light"><spring:message code="list.detail.chargingaccount" text="충전계좌"/></td>
                                        <td class="width-200"><spring:message code="list.detail.1" text="가상계좌은행"/></td>
                                        <td class=" border-0">
                                            <select class="form-control width-200 m-r-10 cybankTypeCode"  name="cybankTypeCode">
                                            </select>
                                            <input type="hidden" name="cybankAccount" value="">
                                        </td>
                                        <td class="text-danger-darker">

                                            <spring:message code="list.description.accountautomessage" text="  캐시 충전시 입금할 은행을 선택하면 계좌번호가 자동 생성됩니다."/>
                                        </td>
                                    </tr>--%>
                                   <%-- <tr>
                                        <td class="bg-light" rowspan="5"><spring:message code="list.detail.withdrawalaccount" text="출금계좌"/></td>
                                        <td class="p-0 border-0" colspan="2">
                                        </td>
                                        <td class="text-danger-darker" rowspan="5"><spring:message code="list.description.questingawithdrawautomessage" text="출금 요청시 입금받을 사업자의 계좌 정보를 입력하세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="border-left-0 width-200 border-top-0"><spring:message code="list.detail.1" text="인출은행"/></td>
                                        <td class=" border-right-0 border-top-0">
                                            <select class="form-control width-200 m-r-10 bankTypeCode"  name="bankTypeCode">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="border-left-0"><spring:message code="list.detail.1" text="인출은행 계좌번호"/></td>
                                        <td class="border-right-0"><input type="text" class="form-control width-200 bankAccount" name="bankAccount" value="" maxlength="20" numberOnly="true"></td>
                                    </tr>
                                    <tr>
                                        <td class="border-left-0"><spring:message code="list.detail.accountnumber1" text="인출은행 예금주"/></td>
                                        <td><input type="text" class="form-control width-200 bankOwner" name="bankOwner" value="" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                        <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.pinnumber1" text="PIN번호"/></td>
                                        <td class="border-left-0 border-bottom-0 border-right-0">
                                            <div class="pin-div">
                                                <input  name="pinNum" class="form-control width-200 pinNum" value="" type="password" maxlength="100" numberOnly>
                                                <i class="fa fa-eye fa-lg m-l-5"></i>
                                            </div>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                        <td colspan="2"><input type="text" class="form-control width-600 memoEtc" name="memoEtc" value="" maxlength="200"></td>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.othermemo" text="기타 메모"/></td>
                                    </tr>
                                </table>
                            </form>
                            <br>
                            <div class="timeline-header m-t-10 m-b-10">
                                <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                                <span><strong><spring:message code="list.detail.businessinformation" text="사업자 정보"/></strong></span>
                            </div>
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
                                                <input type="radio" name="corpType" value="2" class="align-bottom corpType"><spring:message code="list.detail.simple" text="간이"/>
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
                                        <td class="bg-light"><spring:message code="list.detail.representativename" text="대표자명"/></td>
                                        <td><input type="text" name="bizOwner" class="form-control width-200 bizOwner" value="" maxlength="30"></td>
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.entertherepresentativebasemessage" text="사업자등록증 기준의 대표자를 입력하세요."/></td>
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
                                        <td class="text-danger-darker" style="width:25%"><spring:message code="list.description.enterthebusinessstatusanditemessage" text="사업자등록증 상의 업태와 종목를 입력하세요."/></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div class="m-l-5 m-t-5">
                            <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-l-5"><i class="fa fa-list m-r-3"></i><spring:message code="list.detail.list" text="목록"/></button>
                            <button type="button" class="btn btn-primary btn_add float-left m-t-5 m-l-20"><i class="fa fa-plus m-r-3"></i><spring:message code="list.detail.enrollment" text="등록"/></button>
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
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
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

        let role = "${sessionScope.sessionKey.userRole}";
        let sessionHead = "${sessionScope.sessionKey.headNo}";
        //제휴본사 검색
        let headReq = convertFormToObj($('form.head_search_form'));
        $.ajax({
            type: "POST",
            url: "${path}/api/search/head/list",
            data: JSON.stringify(headReq),
            contentType: "application/json;",
            dataType: "json",
            success: function(data) {
                /*$(".searchHeadList").append(
                    "<option value=\"\">없음</option>"
                )*/

                if(role == 0) {
                    for(var i = 0 ; i < data.searchHeadList.length ; i++){

                        if(sessionHead == data.searchHeadList[i].headNo) {
                            $(".searchHeadList").append(
                                "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                            )
                        } else {
                            $(".searchHeadList").append(
                                "<option value="+data.searchHeadList[i].headNo+">"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                            )
                        }
                    }
                } else if (role == 1) {
                    for(var i = 0 ; i < data.searchHeadList.length ; i++){
                        if(sessionHead == data.searchHeadList[i].headNo) {
                            $(".searchHeadList").append(
                                "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                            )
                        }
                    }
                } else if (role == 2) {
                    for(var i = 0 ; i < data.searchHeadList.length ; i++){
                        if(sessionHead == data.searchHeadList[i].headNo) {
                            $(".searchHeadList").append(
                                "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                            )
                        }
                    }
                }
            }
        });

        let dlvyReq = convertFormToObj($('form.dlvy_search_form'));
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
                    $(".searchDlvyList").append(
                        "<option value="+data.searchDlvyList[i].dlvyNo+">"+data.searchDlvyList[i].dlvyName+"</option>"
                    )
                }
            }
        });

        $(".btn_list").click(function() {
            location.href = "${path}/workgroup/distributor/list?headNo=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&branchName=";
        })

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/distributor/insert/action";
            let _forms = $('.insert_form');
            let _forms2 = $('.insert_form2');
            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
            let registermsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let registerfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let enrollment = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

            if (inputDataCheck(req, req2)) {
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
                        formData.append("tbBranchData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
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
                                    location.href = "${path}/workgroup/distributor/list";
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



        /*$("#dataTable").dataTable({
            "paging" : true,
            "ordering" : true,
            "info" : true,
            "filter" : true,
            "lengthChange" : true,
            "order" : [[0, "desc"]]
        });*/
        let date = new Date();
        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $("#endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker('setDate', date);
    });
    /*function initPassword(bhId){
        let initPassword = document.createElement('span');
        initPassword.innerHTML = '비밀번호를 초기화 하시겠습니까?<br>초기화 비밀번호 : 1234';
        swal({
            content: initPassword,
            icon: "warning",
            buttons: [
                '취소',
                '초기화'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: "GET",
                    url: "${path}/usermanagement/initPassword?bhId="+bhId,
                    success: function() {
                        swal({
                            title: "초기화가 성공되었습니다.",
                            icon: "success",
                            button: '확인'
                        })
                    }
                });
            }
        });
    }

    /!*----------------------리스트 - 자동완성 검색 기능 시작----------------------*!/
    $(".hospitalName").autocomplete({
        //자동완성의 대상
        source: function (req, res) {
            let term = escapeHtml(req.term).trim().replaceAll("&quot;","").replace("선택된 데이터가 없습니다.","").trim();
            $.ajax({
                type: 'get',
                url: "${path}/hospitalmanagement/autolist",
                dataType: "json",
                data: {"term":term},
                success: function(data) {
                    data = data.autoList;
                    //서버에서 json 데이터 response 후 목록에 추가
                    res(
                        $.map(data, function(item) {
                            let address = new Array();
                            let addressStr = '';
                            if(item.bhAddress != null && item.bhAddress != "") {
                                address = item.bhAddress.split(" ");
                                addressStr = address[0] + " " + address[1];
                            }
                            return {
                                label: item.bhName + "(" + addressStr + ")",
                                item : item.bhId,
                                id : item.bhId,
                            }
                        })
                    );
                }
            });
        },
        minLength: 1,
        delay: 0,
        focus: function (event, ui) {
            return (event.keyCode === 40 || event.keyCode === 38) ? false : ui;
        },
        select: function (event, selected) {
            if(event.keyCode === 13) {
                $(".bmBhId").val(selected.item.id);
            }
            $(".bmBhId").val(selected.item.id);
        }
    });
    /!*----------------------리스트 - 자동완성검색 기능 끝----------------------*!/

    $(".hospital_search_val").on("keydown", function(event) {
        if(event.keyCode != 13)
            $(".bmBhId").val('');
    });

    function deleteRow(bmId) {
        let dataTable = $('#dataTable').DataTable();
        swal({
            title: "삭제하시겠습니까?",
            // text: "데이터가 수정됩니다.!",
            icon: "warning",
            buttons: [
                '취소',
                '삭제'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: "GET",
                    url: "/usermanagement/masterDelete?bmId="+bmId,
                    dataType: "json",
                    success: function() {
                        dataTable.ajax.reload();
                    }
                });
            }
        });
    }
    let _$modalAdd = $('#add_modal');
    let _$modalEdit = $('#edit_modal');

    _$modalAdd.on('show.bs.modal', function () {
        $("#bmBhId").val("");
        $('.save_btn').on('click', function () {
            let table = $("#dataTable").DataTable();
            let _forms = _$modalAdd.find($('.add_form'));
            let req = convertFormToObj(_forms);
            if (insertDataCheck(req)) {
                swal_confirm(
                    '등록 하시겠습니까?',
                    '등록',
                    "${path}/usermanagement/masterInsert/",
                    "POST",
                    req,
                    table,
                    _$modalAdd
                );
            }
        });
    });

    _$modalEdit.on('shown.bs.modal', function (event) {
        $('.update_btn').on('click', function () {
            let table = $("#dataTable").DataTable();
            let _forms = _$modalEdit.find($('form.edit_form'));
            let req = convertFormToObj(_forms);
            if (updateDataCheck(req)) {
                swal_confirm(
                    '수정 하시겠습니까?',
                    '수정',
                    "${path}/usermanagement/masterUpdate/",
                    "POST",
                    req,
                    table,
                    _$modalEdit
                );
            }
        });
    });

    _$tbody.on('click', 'a', function (event) {
        column_select($(this).parents('td').parents('tr'));

        let bmId = _params.bmId;
        let bmBhId = _params.bmBhId;
        let bhName = _params.bhName;
        let bmLoginId = _params.bmLoginId;
        let bmName = _params.bmName;
        let bmRole = _params.bmRole;

        $("#edit_bmId").val(bmId);
        $("#edit_bmBhId").val(bmBhId);
        $("#edit_search_val").val(bhName);
        $("#edit_bmLoginId").val(bmLoginId);
        $("#edit_bmName").val(bmName);
        $("#edit_bmRole").val(bmRole);
        $("#hp_edit_bmId").val(bmId);
        $("#hp_edit_bmBhId").val(bmBhId);
        $("#hp_edit_search_val").val(bhName);
        $("#hp_edit_bmLoginId").val(bmLoginId);
        $("#hp_edit_bmName").val(bmName);
        $("#hp_edit_bmRole").val(bmRole);
        _$modalEdit.modal().show();
    });

   */

  /*  function inputDataCheck(args) {

        if (isNull(args.branchName)) {
            return alert_focus("branchName", headnamemsg);
        }
        return true;
    }*/

    function inputDataCheck(args,args2) {
        if (isNull(args.branchName)) {
            return alert_focus("branchName", "총판명을 입력해주세요.");
        } /*else if (isNull(args.authTel)) {
            return alert_focus("authTel", "인증용 휴대전화를 입력해주세요");
        } */else if (isNull(args.branchTel)) {
            return alert_focus("branchTel", "총판 대표번호를 입력해주세요");
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
