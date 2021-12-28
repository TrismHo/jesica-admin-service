<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 영업가맹점 상세</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1.sub4" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">영업가맹점 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></li>
                </ol>
                <h3 class="rix-title p-b-5">영업가맹점 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light">소속 업무그룹</td>
                        <td><span class="text-green">[H0147]</span> KHLEE_제휴본사 / <span class="text-green">[BE255]</span> KHLEE_총판</td>
                        <td class="bg-light">가맹점</td>
                        <td><span class="text-green">[S003475]</span> KHLEE_소속가맹점</td>
                    </tr>
                </table>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none">온라인 플랫폼 설정<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                        <span class="d-sm-block d-none">온라인 플랫폼 설정<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">블록 배달팁 설정<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                        <span class="d-sm-block d-none">블록 배달팁 설정<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">특정지명 배달팁 설정<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                        <span class="d-sm-block d-none">특정지명 배달팁 설정<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <!-- begin tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light">가맹점 표시명</td>
                                <td><input type="text" class="form-control width-200" value="KHLEE_소속가맹점"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">가맹점 설명</td>
                                <td><input type="text" class="form-control width-400" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">내가게 소개</td>
                                <td><input type="text" class="form-control width-400" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">영업 상태</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status19" class="align-bottom" checked>영업<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status19" class="align-bottom">휴식<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
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
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>일
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>월
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>화
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>수
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>목
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>금
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status20" checked>토
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">주문 카테고리</td>
                                <td>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>치킨
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>중식
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>피자
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>한식/분식
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>족발/보쌈
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>야식
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>돈까스/일식/회
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>도시락/죽/패스트푸드
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>찜/탕
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>카페/디저트
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>편의점
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>반찬
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>마트
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>봉투
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>기타
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status21" checked>미분류
                                    </label>
                                </td>
                            </tr>
                            <tr>
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
                            </tr>
                            <tr>
                                <td class="bg-light">결제수단설정</td>
                                <td>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status22" checked>선결제(신용카드)
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status22" checked>선결제(제로페이)
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status22" checked>선결제(온통대전)
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status22" checked>만나서결제(현금)
                                    </label>
                                    <label class="font-size-10 m-r-5">
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
                                        <input type="text" class="form-control width-200" placeholder="외부 주문플랫폼 가맹점 식별자">
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
                                            <td rowspan="2" class="p-0 border-top-0 border-bottom-0 border-right-0" style="width: 60%; max-width: 60%;">
                                                <label>
                                                    <button type="button" class="btn btn-gray" style="height: 95px; width: 95px; border-radius: 0;">ARS 설정</button>
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
                            </tr>
                            <tr>
                                <td class="bg-light">주문가능 서비스</td>
                                <td>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status23" checked>배달주문
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status23" checked>포장주문
                                    </label>
                                    <label class="font-size-10 m-r-5">
                                        <input type="checkbox" class="align-bottom" name="status23" checked>테이블주문
                                    </label>
                                </td>
                            </tr>
                            <tr>
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
                            </tr>
                            <tr>
                                <td class="bg-light">첨부파일<%--<spring:message code="merchandise.insert.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                <td>
                                    <div class="category_sort">
                                        <ul class="sort_list">
                                            <li>
                                                <div class="sort_body" id="sort_body">
                                                    <img class="img-preview" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                </div>
                                            </li>
                                            <li>
                                                <%--* 권장 이미지 비율 : 984*876<br>--%>
                                                <div class="onlinePlatFormFileName m-b-10 m-t-5"></div>
                                                <div class="onlinePlatFormFileSize"></div>
                                            </li>
                                        </ul>
                                        <label for="onlinePlatFormImgFile">
                                            <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                <div>파일선택</div>
                                            </div>
                                        </label>
                                        <input type="file" id="onlinePlatFormImgFile" name="onlinePlatFormImgFile" class="fileBtn d-none">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">영수증 원산지 표시</td>
                                <td>
                                    <label>
                                        <input type="text" class="form-control width-300">
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="height-500" data-scrollbar="true">
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
                                            <button type="button" class="btn btn-purple"><i class="fa fa-cog"></i> 초기화</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="float-right m-b-20">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-white border-right-0 color">등록</button>
                                        <button type="button" class="btn btn-white">그리기</button>
                                    </div>
                                </div>
                                <table class="table table-bordered">
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
                            <div class="col-xl-6 col-lg-6 height-400" >
                                <div id="tipmap" class="height-full width-full"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-3">
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
                                    <td><input type="text" class="form-control width-200" placeholder="특정지명을 입력하세요"></td>
                                    <td><input type="text" class="form-control width-200" value="0">원</td>
                                    <td>
                                        <label class="font-size-10 m-r-5">
                                            <input type="checkbox" class="align-bottom">지번
                                        </label>
                                        <label class="font-size-10 m-r-5">
                                            <input type="checkbox" class="align-bottom">도로명
                                        </label>
                                        <label class="font-size-10 m-r-5">
                                            <input type="checkbox" class="align-bottom">상세주소
                                        </label>
                                        <label class="font-size-10 m-r-5">
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
                                        <td><input type="text" class="form-control width-200" placeholder="특정지명을 입력하세요"></td>
                                        <td><input type="text" class="form-control width-200" value="0">원</td>
                                        <td>
                                            <label class="font-size-10 m-r-5">
                                                <input type="checkbox" class="align-bottom" name="status24" checked>지번
                                            </label>
                                            <label class="font-size-10 m-r-5">
                                                <input type="checkbox" class="align-bottom" name="status24" checked>도로명
                                            </label>
                                            <label class="font-size-10 m-r-5">
                                                <input type="checkbox" class="align-bottom" name="status24" checked>상세주소
                                            </label>
                                            <label class="font-size-10 m-r-5">
                                                <input type="checkbox" class="align-bottom" name="status24" checked>행정동명
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
                <div class="m-t-10">
                    <button type="button" class="btn btn-primary btn_add float-right"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                    <button type="button" class="btn btn-primary btn_list"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                </div>
            </div>
        </div>
    </div>

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
    let map;
    let marker;
    $(() => {
        initTipMap();

        $(".list_btn").click(function () {
            location.href = "${path}/workgroup/businessfranch/list";
        });

        //온라인플랫폼이미지
        $(document).on("change", "#onlinePlatFormImgFile", function (e) {
            /*var state = document.getElementById('status'),
                sort_body = document.getElementById('sort_body');

            if (typeof window.FileReader === 'undefined') {
                state.className = 'fail';
            } else {
                state.className = 'success';
                state.innerHTML = '';
            }*/
            e.preventDefault();

            var file = $("#onlinePlatFormImgFile")[0].files[0],
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
                var filename = $("#onlinePlatFormImgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize').text("용량 :" + file.size + " Byte");

            return false;
        });
    });

    function initTipMap() {
        let uluru = {lat: 17.98168965202384,lng: 102.56941764786893};
        map = new google.maps.Map(document.getElementById("tipmap"), {
            center: uluru,
            zoom: 14,
        });

        const squareCoords = [
            { lat: 17.98278685393457, lng: 102.56079072668399 },
            { lat: 17.99030228316645, lng: 102.56907432512804 },
            { lat: 17.984179602794764, lng: 102.57976024543845 },
            { lat: 17.970259919261057, lng: 102.57233589116656 },
            { lat: 17.98278685393457, lng: 102.56079072668399 },
        ];

        const bermudaSquare = new google.maps.Polygon({
            paths: squareCoords,
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#FF0000",
            fillOpacity: 0.35,
        });
        bermudaSquare.setMap(map);
    }

    function postCodeBtn() {
        let address = $("#address").val();

        let geocoder = new google.maps.Geocoder();

        /**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지.
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         *
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         */
        geocoder.geocode({'address': address}, function(result, status) {
            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                map.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                map.setZoom(18);
                // 맵 마커
                marker.setMap(null);
                marker = new google.maps.Marker({
                    map: map,
                    position: result[0].geometry.location
                });
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }
</script>
</body>
</html>
