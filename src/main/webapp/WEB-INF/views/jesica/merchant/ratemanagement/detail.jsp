<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 요금관리 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2.sub9" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">요금관리 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></li>
                </ol>
                <h3 class="rix-title p-b-5">요금관리 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="border overflow-hidden p-10 width-md">
                <strong>[H0004] 테스트제휴본사(개발) - [B0011] 테스트총판 - [1000] 만나기본배송그룹</strong>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none">배송 관리비<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none">배송 관리비<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">가맹점별 요금<%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none">가맹점별 요금<%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-3" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">특정지명 요금<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--상품 그룹--%></span>
                        <span class="d-sm-block d-none">특정지명 요금<%--<spring:message code="merchandise.detail.tab3" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-4" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">거리구간별 요금<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                        <span class="d-sm-block d-none">거리구간별 요금<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-5" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">블록별 배달 요금<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                        <span class="d-sm-block d-none">블록별 배달 요금<%--<spring:message code="merchandise.detail.tab4" text="default text"/>--%><%--옵션--%></span>
                    </a>
                </li>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="height-500" data-scrollbar="true">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light text-left">배송원 수수료할인<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status1" class="align-bottom" checked>설정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">설정안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <br>
                                        <label>
                                            <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                                <strong class="font-size-10">배송원 배달대행료 수수료 차감 시, 배송원에 설정된 할인가맹점 수수료로 차감됩니다.<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                            </i>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">형태<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status2" class="align-bottom" checked>월정액 관리비<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">정산대상<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status3" class="align-bottom" checked>소속 총판<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status3" class="align-bottom">소속 배송그룹<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">세금계산서 발행여부<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status4" class="align-bottom" checked>발행<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status4" class="align-bottom">발행안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">상세설정<%--<spring:message code="merchandise.detail.adultcertificationclassification" text="default text"/>--%><%--성인인증 구분--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status5" class="align-bottom" checked>월정액<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status5" class="align-bottom">선분할<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status5" class="align-bottom">일차감<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status5" class="align-bottom">주문건수<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <div class="m-t-15">
                                            <label class="m-r-30">
                                                <span class="m-r-5">월정액 : </span><input type="number" class="form-control">원
                                            </label>
                                            <label>
                                                <span class="m-r-5">초과건당 : </span><input type="number" class="form-control">원
                                            </label>
                                            <br>
                                            <label class="m-r-30 m-t-10">
                                                <span class="m-r-5">무료건 : </span><input type="number" class="form-control">건
                                            </label>
                                            <label class="m-t-10">
                                                <span class="m-r-5">누적건수 : </span><strong>0</strong> 건
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">차감일자<%--<spring:message code="merchandise.detail.merchandescription" text="default text"/>--%><%--상품 설명--%></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                        </label>
                                        부터 매월
                                        <select class="form-control width-80 m-l-5">
                                            <c:forEach begin="1" end="28" var="idx">
                                                <option value="${idx}">${idx}일</option>
                                            </c:forEach>
                                            <option value="">말일</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="height-500" data-scrollbar="true">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light text-left">사용설정<%--<spring:message code="merchandise.detail.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td colspan="3">
                                        <label class="font-size-10">
                                            <input type="radio" name="status6" class="align-bottom" checked>설정안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status6" class="align-bottom">설정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">기본거리<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control text-right" placeholder="기본거리요금">원
                                        </label>
                                    </td>
                                    <td colspan="2">
                                        <label class="m-l-10">
                                            <input type="text" class="form-control text-right" placeholder="기본거리(M)">(M 단위)
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">추가거리<%--<spring:message code="merchandise.detail.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control text-right" placeholder="추가거리요금">원
                                        </label>
                                    </td>
                                    <td colspan="2">
                                        <label class="m-l-10">
                                            <input type="text" class="form-control text-right" placeholder="추가거리(M)">(M 단위)
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">최대요금<%--<spring:message code="merchandise.detail.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                    <td colspan="3">
                                        <label>
                                            <input type="text" class="form-control text-right">&nbsp;원 <%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">요일할증<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status7" class="align-bottom" checked>설정안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status7" class="align-bottom">설정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control text-right" placeholder="요일할증요금">&nbsp;원 <%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>일
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>월
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>화
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>수
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>목
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>금
                                        </label>
                                        <label class="font-size-10 m-l-10">
                                            <input type="checkbox" class="align-bottom" name="status8" checked>토
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">시간할증<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status8" class="align-bottom" checked>설정안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status8" class="align-bottom">설정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control text-right" placeholder="시간할증요금">&nbsp;원 <%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                        </label>
                                    </td>
                                    <td>
                                        <select class="form-control width-80">
                                            <c:forEach begin="0" end="23" var="hour">
                                                <option value="${hour}">
                                                    <c:choose>
                                                        <c:when test="${hour lt 10}">
                                                            0${hour}시
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${hour}시
                                                        </c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <select class="form-control width-80">
                                            <c:forEach begin="0" end="59" var="minute">
                                                <option value="${minute}">
                                                    <c:choose>
                                                        <c:when test="${minute lt 10}">
                                                            0${minute}분
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${minute}분
                                                        </c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                        ~
                                        <select class="form-control width-80">
                                            <c:forEach begin="0" end="23" var="hour">
                                                <option value="${hour}">
                                                    <c:choose>
                                                        <c:when test="${hour lt 10}">
                                                            0${hour}시
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${hour}시
                                                        </c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <select class="form-control width-80">
                                            <c:forEach begin="0" end="59" var="minute">
                                                <option value="${minute}">
                                                    <c:choose>
                                                        <c:when test="${minute lt 10}">
                                                            0${minute}분
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${minute}분
                                                        </c:otherwise>
                                                    </c:choose>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light text-left">눈비할증<%--<spring:message code="merchandise.detail.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status9" class="align-bottom" checked>설정안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status9" class="align-bottom">설정<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                    <td colspan="2">
                                        <label>
                                            <input type="text" class="form-control text-right" placeholder="눈비할증요금">&nbsp;원 <%--<spring:message code="merchandise.detail.onlinesalestatus.option1" text="default text"/>--%><%--정상--%>
                                        </label>
                                    </td>
                                </tr>
                            </table>
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
                                    <th>검색범위</th>
                                    <th>특정지명</th>
                                    <th>요금구분</th>
                                    <th>책정요금</th>
                                    <th>시작시간(이상)</th>
                                    <th>종료시간(미만)</th>
                                    <th>등록/수정/삭제</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>지번
                                            </label>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>도로명
                                            </label>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>상세주소
                                            </label>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>행정동명
                                            </label>
                                        </td>
                                        <td><input type="text" class="form-control" placeholder="특정지명을 입력하세요"></td>
                                        <td>
                                            <select class="form-control">
                                                <option>선택하기</option>
                                                <option>특정요금</option>
                                                <option>추가요금</option>
                                            </select>
                                        </td>
                                        <td><input type="text" class="form-control" placeholder="책정요금을 입력하세요"></td>
                                        <td>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary">등록</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </td>
                                    </tr>
                                <c:forEach begin="0" end="5">
                                    <tr>
                                        <td>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>지번
                                            </label>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>도로명
                                            </label>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8" checked>상세주소
                                            </label>
                                            <label class="font-size-10">
                                                <input type="checkbox" class="align-bottom" name="status8">행정동명
                                            </label>
                                        </td>
                                        <td><input type="text" class="form-control" placeholder="특정지명을 입력하세요"></td>
                                        <td>
                                            <select class="form-control">
                                                <option>선택하기</option>
                                                <option>특정요금</option>
                                                <option>추가요금</option>
                                            </select>
                                        </td>
                                        <td><input type="text" class="form-control" placeholder="책정요금을 입력하세요"></td>
                                        <td>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="form-control width-70">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시</option>
                                                </c:forEach>
                                            </select>
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
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-4">
                    <div class="height-500" data-scrollbar="true">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td>일요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>월요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>화요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>수요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>목요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>금요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>토요일</td>
                                    <td>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(시작)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <select class="form-control">
                                                <c:forEach begin="0" end="24" varStatus="hour">
                                                    <option>${hour.index}시(종료)</option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="시작거리(m, 이상)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="종료거리(m, 이하)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금1건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금2건(원)">
                                        </label>
                                        <label>
                                            <input type="number" class="form-control" placeholder="요금3건(원)">
                                        </label>
                                        <label>
                                            <button type="button" class="btn btn-primary">등록하기</button>
                                            <button type="button" class="btn btn-green">엑셀등록</button>
                                            <button type="button" class="btn btn-green">양식다운</button>
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
                                        <button type="button" class="btn btn-white" onclick="showDrawingManager()">그리기</button>
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
                                                <input type="text" class="form-control">
                                            </th>
                                            <td>
                                                <select class="form-control">
                                                    <option>고정</option>
                                                    <option>추가</option>
                                                </select>
                                            </td>
                                            <th>
                                                <select class="form-control">
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
    let map;
    let tipMap;
    let marker;
    let drawingManager = null;
    $(() => {
        initTipMap();

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
    });

    function initTipMap() {
        let uluru = {lat: 17.98168965202384,lng: 102.56941764786893};
        tipMap = new google.maps.Map(document.getElementById("tipmap"), {
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
        bermudaSquare.setMap(tipMap);

        tipMap.addListener('click', function(e) {
            console.log(e.latLng.lat());
            console.log(e.latLng.lng());
        });
    }

    function showDrawingManager() {
        if(drawingManager == null) {
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
        if(drawingManager != null) {
            drawingManager.setMap(null);
            drawingManager = null;
        }
    }
</script>
</body>
</html>
