<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jesicar | 이동정산상세</title>
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main3" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main3.sub4" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">이동정산상세<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">이동정산상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <table class="table table-bordered">
                            <tr>
                                <td class="bg-light-darker" rowspan="10"><strong>기본설정/검색</strong></td>
                                <td class="bg-light">상태</td>
                                <td colspan="2">
                                    <label class="font-size-10">
                                        <input type="radio" name="status1" class="align-bottom" checked>정상<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status1" class="align-bottom">정지<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status1" class="align-bottom">삭제<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">제목</td>
                                <td colspan="2"><input type="text" class="form-control width-200"></td>
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="2">출금대상</td>
                                <td>대상타입</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status2" class="align-bottom" checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status2" class="align-bottom">총판<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status2" class="align-bottom">가맹점<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status2" class="align-bottom">배송원<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>대상선택</td>
                                <td>
                                    <label>
                                        <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="배송원 선택<%--<spring:message code="merchandise.search1.option3" text="default text"/>--%><%--가맹점 선택--%>" class="form-control background-white" readonly>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="2">입금대상</td>
                                <td>대상타입</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status3" class="align-bottom" checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom">총판<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom">가맹점<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom">배송원<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>대상선택</td>
                                <td>
                                    <label>
                                        <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="배송원 선택<%--<spring:message code="merchandise.search1.option3" text="default text"/>--%><%--가맹점 선택--%>" class="form-control background-white" readonly>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light" rowspan="4">출금조건</td>
                                <td>일일 정산 시</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="checkbox" name="status4" class="align-bottom" checked>주문플랫폼월정액<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status4" class="align-bottom">MCS월정액<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status4" class="align-bottom">일비차감<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status4" class="align-bottom">배송관리비 월정액<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>오더 정산 시</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="checkbox" name="status5" class="align-bottom" checked>배달대행료 수수료<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status5" class="align-bottom">주문배달/테이크아웃 수수료<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status5" class="align-bottom">배달플랫폼 수수료<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>일차감</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="checkbox" name="status6" class="align-bottom" checked>대여금<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status6" class="align-bottom">대여금(완료건당)<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status6" class="align-bottom">차감항목 직접입력<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>월차감</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="checkbox" name="status7" class="align-bottom" checked>대여금<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="checkbox" name="status7" class="align-bottom">차감항목 직접입력<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="m-l-10">
                                        <input type="text" class="form-control" placeholder="차감항목입력">
                                    </label>
                                    <label class="m-l-10">
                                        <select class="form-control width-70">
                                            <c:forEach begin="1" end="28" varStatus="idx">
                                                <option>${idx.index}</option>
                                            </c:forEach>
                                            <option>말일</option>
                                        </select>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light-darker" rowspan="5"><strong>추가설정</strong></td>
                                <td class="bg-light">출금 시작일</td>
                                <td colspan="2">
                                    <label>
                                        <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">출금 종료일</td>
                                <td colspan="2">
                                    <label>
                                        <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">출금내용</td>
                                <td colspan="2">
                                    <label class="font-size-10">
                                        <input type="radio" name="status8" class="align-bottom" checked>정액<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status8" class="align-bottom">정률<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="m-l-10">
                                        <input type="text" class="form-control text-right" value="0"> (원 or %)
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">출금제한</td>
                                <td colspan="2">
                                    <label class="font-size-10">
                                        <input type="radio" name="status9" class="align-bottom" checked>사용안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status9" class="align-bottom">최대회수<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status9" class="align-bottom">최대금액<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="m-l-10">
                                        <input type="text" class="form-control text-right" value="0"> (회수 or 원)
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">출금메모</td>
                                <td colspan="2">
                                    <input type="text" class="form-control width-400">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
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

<script>
    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/settlement/transsettle/list";
        })

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
    });
</script>
</body>
</html>
