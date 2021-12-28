<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 온라인 이벤트 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2.sub8" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">온라인 이벤트 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></li>
                </ol>
                <h3 class="rix-title p-b-5">온라인 이벤트 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="border overflow-hidden p-10 width-md">
                <strong>[H0004] 테스트제휴본사(개발) - [B0011] 테스트총판 - [B0011] (금호)테스트가맹점</strong>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none">스탬프<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none">스탬프<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">첫 주문 할인<%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none">첫 주문 할인<%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">주문금액별 할인<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                        <span class="d-sm-block d-none">주문금액별 할인<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-4" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">포장 할인<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                        <span class="d-sm-block d-none">포장 할인<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">지원 정책<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                        <span class="d-sm-block d-none">지원 정책<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                    </a>
                </li>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light text-left">사용여부<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status1" class="align-bottom" checked>사용<%--<spring:message code="merchandise.detail.merchanstatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status1" class="align-bottom">사용안함<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">사용 여부를 체크합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">쿠폰지급 도달횟수<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <label>
                                        <select class="form-control width-70">
                                            <c:forEach begin="1" end="10" varStatus="idx">
                                                <option>${idx.index}회</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <br>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">쿠폰을 지급하는 스탬프 회수를 선택하세요(최대 10회까지).<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">쿠폰사용 최소주문금액<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="text" class="form-control text-right">&nbsp;원 이상 주문시 사용 가능<%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <br>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">쿠폰사용 최소 주문금액을 입력하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 구분<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status2" class="align-bottom" checked>금액할인<%--<spring:message code="merchandise.detail.merchanstatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status2" class="align-bottom">무료상품<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status2" class="align-bottom">경품증정<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">이벤트 혜택을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 내용<%--<spring:message code="merchandise.detail.adultcertificationclassification" text="default text"/>--%><%--성인인증 구분--%></td>
                                <td>
                                    <label>
                                        <input type="number" class="form-control">
                                    </label>
                                    <label class="font-size-10">
                                        <input type="radio" name="status3" class="align-bottom" checked>원 할인<%--<spring:message code="merchandise.detail.merchanstatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status3" class="align-bottom">% 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">무료상품을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">이미지 파일<%--<spring:message code="merchandise.detail.merchandescription" text="default text"/>--%><%--상품 설명--%></td>
                                <td>
                                    <div class="category_sort">
                                        <ul class="sort_list">
                                            <li>
                                                <div class="sort_body1" id="sort_body1">
                                                    <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                </div>
                                            </li>
                                            <li>
                                                <div class="stampFileName1"></div>
                                                <br>
                                                <div class="stampFileSize1"></div>
                                            </li>
                                        </ul>
                                        <label for="stampImgFile1">
                                            <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                <div>파일선택</div>
                                            </div>
                                        </label>
                                        <input type="file" id="stampImgFile1" name="stampImgFile1" class="fileBtn d-none">
                                    </div>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">고객주문 웹/앱의 표시될 이미지를 선택하세요 (권장사이즈 984*876)<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light text-left">사용여부<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status4" class="align-bottom" checked>사용<%--<spring:message code="merchandise.detail.merchanstatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status4" class="align-bottom">사용안함<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">사용 여부를 체크합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">할인 방법<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status5" class="align-bottom" checked>주문 시 결제금액에서 할인<%--<spring:message code="merchandise.detail.merchanstatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status5" class="align-bottom">쿠폰 지급<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">할인 방법을 체크 합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 조건<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="text" class="form-control text-right">&nbsp;원 이상 최초주문시 사용 가능<%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">혜택 조건을 입력하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 구분<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status6" class="align-bottom" checked>금액할인<%--<spring:message code="merchandise.detail.merchanstatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status6" class="align-bottom">무료상품<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status6" class="align-bottom">경품증정<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">이벤트 혜택을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 내용<%--<spring:message code="merchandise.detail.adultcertificationclassification" text="default text"/>--%><%--성인인증 구분--%></td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control text-right">
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status7" class="align-bottom" checked>원 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status7" class="align-bottom">% 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">무료상품을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">이미지 파일<%--<spring:message code="merchandise.detail.merchandescription" text="default text"/>--%><%--상품 설명--%></td>
                                <td>
                                    <div class="category_sort">
                                        <ul class="sort_list">
                                            <li>
                                                <div class="sort_body2" id="sort_body2">
                                                    <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                </div>
                                            </li>
                                            <li>
                                                <div class="firstOrderFileName1"></div>
                                                <br>
                                                <div class="firstOrderFileSize1"></div>
                                            </li>
                                        </ul>
                                        <label for="firstOrderImgFile1">
                                            <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                <div>파일선택</div>
                                            </div>
                                        </label>
                                        <input type="file" id="firstOrderImgFile1" name="firstOrderImgFile1" class="fileBtn d-none">
                                    </div>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">고객주문 웹/앱의 표시될 이미지를 선택하세요 (권장사이즈 984*876)<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-3">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light text-left">사용여부<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status8" class="align-bottom" checked>사용<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status8" class="align-bottom">사용안함<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">사용 여부를 체크합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">할인 방법<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status9" class="align-bottom" checked>주문 시 결제금액에서 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">할인 방법을 체크 합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 조건<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="text" class="form-control text-right">&nbsp;원 이상 주문시 사용 가능<%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">혜택 조건을 입력하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 구분<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status10" class="align-bottom" checked>금액할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status10" class="align-bottom">무료상품<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status10" class="align-bottom">경품증정<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">이벤트 혜택을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">혜택 내용<%--<spring:message code="merchandise.detail.adultcertificationclassification" text="default text"/>--%><%--성인인증 구분--%></td>
                                <td>
                                    <label>
                                        <input type="number" class="form-control">
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status11" class="align-bottom" checked>원 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status11" class="align-bottom">% 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">무료상품을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">이미지 파일<%--<spring:message code="merchandise.detail.merchandescription" text="default text"/>--%><%--상품 설명--%></td>
                                <td>
                                    <div class="category_sort">
                                        <ul class="sort_list">
                                            <li>
                                                <div class="sort_body3" id="sort_body3">
                                                    <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                </div>
                                            </li>
                                            <li>
                                                <div class="orderPriceFileName1"></div>
                                                <br>
                                                <div class="orderPriceFileSize1"></div>
                                            </li>
                                        </ul>
                                        <label for="orderPriceImgFile1">
                                            <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                <div>파일선택</div>
                                            </div>
                                        </label>
                                        <input type="file" id="orderPriceImgFile1" name="orderPriceImgFile1" class="fileBtn d-none">
                                    </div>
                                    <label class="m-t-5">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">고객주문 웹/앱의 표시될 이미지를 선택하세요 (권장사이즈 984*876)<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
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
                    <div class="height-500" data-scrollbar="true">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light text-left">사용여부<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status12" class="align-bottom" checked>사용<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status12" class="align-bottom">사용안함<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <br>
                                        <label>
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">사용 여부를 체크합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">할인 방법<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status13" class="align-bottom" checked>주문 시 결제금액에서 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <br>
                                        <label>
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">할인 방법을 체크 합니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">혜택 조건<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="text" class="form-control text-right">&nbsp;원 이상 주문시 사용 가능<%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                        </label>
                                        <br>
                                        <label>
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">혜택 조건을 입력하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">혜택 구분<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status14" class="align-bottom" checked>금액할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status14" class="align-bottom">무료상품<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status14" class="align-bottom">경품증정<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <br>
                                        <label>
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">이벤트 혜택을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">혜택 내용<%--<spring:message code="merchandise.detail.adultcertificationclassification" text="default text"/>--%><%--성인인증 구분--%></td>
                                    <td>
                                        <label>
                                            <input type="number" class="form-control">
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status15" class="align-bottom" checked>원 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status15" class="align-bottom">% 할인<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                        </label>
                                        <br>
                                        <label>
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">무료상품을 선택하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">이미지 파일<%--<spring:message code="merchandise.detail.merchandescription" text="default text"/>--%><%--상품 설명--%></td>
                                    <td>
                                        <div class="category_sort">
                                            <ul class="sort_list">
                                                <li>
                                                    <div class="sort_body4" id="sort_body4">
                                                        <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="packageFileName1"></div>
                                                    <br>
                                                    <div class="packageFileSize1"></div>
                                                </li>
                                            </ul>
                                            <label for="packageImgFile1">
                                                <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                    <div>파일선택</div>
                                                </div>
                                            </label>
                                            <input type="file" id="packageImgFile1" name="packageImgFile1" class="fileBtn d-none">
                                        </div>
                                        <label class="m-t-5">
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">고객주문 웹/앱의 표시될 이미지를 선택하세요 (권장사이즈 984*876)<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-5">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light text-left">지원여부<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status16" class="align-bottom" checked>예<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status16" class="align-bottom">아니오<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나플러스에서 "첫 주문 할인" 이벤트를 지원할 경우 "예" 로 설정하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">지원금액<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control text-right">
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status17" class="align-bottom" checked>원<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status17" class="align-bottom">%<%--<spring:message code="merchandise.detail.merchanstatus.option2" text="default text"/>--%><%--정지--%>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">지원금액을 설정하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">지원 기간<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                    </label>
                                    ~
                                    <label>
                                        <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">이벤트 지원 기간을 설정하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">최대금액<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control text-right">
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">최대 지원금액을 설정하세요.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-left">누적금액<%--<spring:message code="merchandise.detail.adultcertificationclassification" text="default text"/>--%><%--성인인증 구분--%></td>
                                <td>
                                    <label>
                                        <span class="font-size-10"><strong>10000</strong></span>&nbsp;<span class="font-size-10">원</span>
                                    </label>
                                    <br>
                                    <label>
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">이벤트에 지원된 총 누적금액입니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- end tab-pane -->
                <p class="text-right m-b-0">
                    <a href="javascript:;" class="btn btn-white list_btn"><spring:message code="merchandise.detail.listbutton" text="default text"/><%--목록--%></a>
                    <a href="javascript:;" class="btn btn-primary update_btn"><spring:message code="merchandise.detail.updatebutton" text="default text"/><%--수정--%></a>
                </p>
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
        $(".list_btn").click(function () {
            location.href = "${path}/merchant/onlineevent/list";
        });

        $(".startDate").datepicker({
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
        });
        
        //stampImgFile1
        $(document).on("change", "#stampImgFile1", function (e) {
            e.preventDefault();

            var file = $("#stampImgFile1")[0].files[0],
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
                var filename = $("#stampImgFile1").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.stampFileName1').text("변경할 이미지 :" + filename);
            $('.stampFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });

        //firstOrderImgFile1
        $(document).on("change", "#firstOrderImgFile1", function (e) {
            e.preventDefault();

            var file = $("#firstOrderImgFile1")[0].files[0],
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
                var filename = $("#firstOrderImgFile1").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.firstOrderFileName1').text("변경할 이미지 :" + filename);
            $('.firstOrderFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });

        //orderPriceImgFile1
        $(document).on("change", "#orderPriceImgFile1", function (e) {
            e.preventDefault();

            var file = $("#orderPriceImgFile1")[0].files[0],
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
                    sort_body3.innerHTML = '';
                    sort_body3.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#orderPriceImgFile1").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.orderPriceFileName1').text("변경할 이미지 :" + filename);
            $('.orderPriceFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });

        //packageImgFile1
        $(document).on("change", "#packageImgFile1", function (e) {
            e.preventDefault();

            var file = $("#packageImgFile1")[0].files[0],
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
                    sort_body4.innerHTML = '';
                    sort_body4.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#packageImgFile1").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.packageFileName1').text("변경할 이미지 :" + filename);
            $('.packageFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });
    });
</script>
</body>
</html>
