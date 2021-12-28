<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 이동정산관리</title>
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
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">

            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main3" text="default text"/><%--가맹점설정--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main3.sub4" text="default text"/><%--상품--%></li>
                </ol>
                <h3 class="rix-title">이동정산<%--<spring:message code="merchandise.title" text="default text"/>--%><%--상품관리--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 wide">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>대상구분</strong></td>
                                            <td>
                                                <select class="form-control">
                                                    <option>출금대상</option>
                                                    <option>입금대상</option>
                                                </select>
                                                <label>
                                                    <label class="font-size-10">
                                                        <input type="radio" name="status1" class="align-bottom" checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                                    </label>
                                                    <label class="m-l-5 font-size-10">
                                                        <input type="radio" name="status1" class="align-bottom">총판<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                                    </label>
                                                    <label class="m-l-5 font-size-10">
                                                        <input type="radio" name="status1" class="align-bottom">가맹점<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                                    </label>
                                                    <label class="m-l-5 font-size-10">
                                                        <input type="radio" name="status1" class="align-bottom">배송원<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                                    </label>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/><%--가맹점선택--%></strong></td>
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
                                            <td class="bg-light"><strong>출금조건(일일정산)</strong></td>
                                            <td class="font-size-10">
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>주문플랫폼월정액</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>MCS월정액</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>일비차감</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>배송관리비 월정액</label>
                                            </td>
                                            <td class="bg-light"><strong>출금조건(오더정산)</strong></td>
                                            <td class="font-size-10">
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>배달대행료 수수료</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>주문배달/테이크아웃 수수료</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>배달플랫폼 수수료</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong>출금조건(일차감)</strong></td>
                                            <td class="font-size-10">
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>대여금</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>대여금(완료건당)</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>차감항목 직접입력</label>
                                            </td>
                                            <td class="bg-light"><strong>출금조건(월차감)</strong></td>
                                            <td class="font-size-10">
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>대여금</label>
                                                <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>차감항목 직접입력</label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>대상구분</strong></td>
                                        <td>
                                            <select class="form-control">
                                                <option>출금대상</option>
                                                <option>입금대상</option>
                                            </select>
                                            <label>
                                                <label for="ee" class="font-size-10">
                                                    <input type="radio" id="ee" name="ee" class="align-middle" checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                                </label>
                                                <label for="ff" class="font-size-10">
                                                    <input type="radio" id="ff" name="ff" class="align-middle">총판<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                                </label>
                                                <label for="gg" class="font-size-10">
                                                    <input type="radio" id="gg" name="gg" class="align-middle">가맹점<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                                </label>
                                                <label for="hh" class="font-size-10">
                                                    <input type="radio" id="hh" name="hh" class="align-middle">배송원<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                                </label>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/><%--가맹점선택--%></strong></td>
                                        <td>
                                            <label id="a">
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control background-white" readonly>
                                            </label>
                                            <label id="b">
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control background-white" readonly>
                                            </label>
                                            <label id="c">
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control background-white" readonly>
                                            </label>
                                            <label id="d">
                                                <input type="text" placeholder="배송원 선택<%--<spring:message code="merchandise.search1.option3" text="default text"/>--%><%--가맹점 선택--%>" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>출금조건(일일정산)</strong></td>
                                        <td class="font-size-10">
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>주문플랫폼월정액</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>MCS월정액</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>일비차감</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>배송관리비 월정액</label>
                                        </td>
                                        <td class="bg-light"><strong>출금조건(오더정산)</strong></td>
                                        <td class="font-size-10">
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>배달대행료 수수료</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>주문배달/테이크아웃 수수료</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>배달플랫폼 수수료</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>출금조건(일차감)</strong></td>
                                        <td class="font-size-10">
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>대여금</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>대여금(완료건당)</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>차감항목 직접입력</label>
                                        </td>
                                        <td class="bg-light"><strong>출금조건(월차감)</strong></td>
                                        <td class="font-size-10">
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>대여금</label>
                                            <label class="m-r-5"><input type="checkbox" class="align-bottom m-r-1" checked>차감항목 직접입력</label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-5">
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus">&nbsp;등록<%--<spring:message code="merchandise.registerbutton" text="default text"/>--%><%--상품등록--%></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/><%--검색--%> </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                        <div class="dt-buttons btn-group flex-wrap">
                                            <button class="btn btn-secondary buttons-copy buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span><i class="fas fa-lg fa-fw m-r-10 fa-copy"></i>Copy</span>
                                            </button>
                                            <button class="btn btn-secondary buttons-excel buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span><i class="fas fa-lg fa-fw m-r-10 fa-file-excel"></i>Excel</span>
                                            </button>
                                            <button class="btn btn-secondary buttons-pdf buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span><i class="fas fa-lg fa-fw m-r-10 fa-file-pdf"></i>PDF</span>
                                            </button>
                                            <button class="btn btn-secondary buttons-print btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span><i class="fas fa-lg fa-fw m-r-10 fa-print"></i>Print</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead class="text-center">
                        <%--<th><input type="checkbox"></th>
                        <th><spring:message code="merchandise.table.column1" text="default text"/>&lt;%&ndash;이미지&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column2" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column3" text="default text"/>&lt;%&ndash;매장정상판매가&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column4" text="default text"/>&lt;%&ndash;매장할인판매가&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column5" text="default text"/>&lt;%&ndash;온라인정상판매가&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column6" text="default text"/>&lt;%&ndash;온라인할인적용 주문금액&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column7" text="default text"/>&lt;%&ndash;상품상태&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column8" text="default text"/>&lt;%&ndash;온라인판매상태&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column9" text="default text"/>&lt;%&ndash;매장판매상태&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column10" text="default text"/>&lt;%&ndash;성인인증구분&ndash;%&gt;</th>
                        <th><spring:message code="merchandise.table.column11" text="default text"/>&lt;%&ndash;등록일/수정일&ndash;%&gt;</th>--%>
                        <th>순번</th>
                        <th>설정일자</th>
                        <th>출금대상</th>
                        <th>출금대상코드</th>
                        <th>페이잔액</th>
                        <th>미차감잔액</th>
                        <th>상태</th>
                        <th>출금항목</th>
                        <th>출금금액</th>
                        <th>출금누적</th>
                        <th>출금기간</th>
                        <th>입금대상</th>
                        <th>입금대상코드</th>
                        <th>최종수정</th>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="11" varStatus="status">
                            <tr class="detailRow text-center">
                                <td>${status.index}</td>
                                <td>2020-12-01 13:38:42</td>
                                <td>제휴본사1-총판1-가맹점1</td>
                                <td>S003432</td>
                                <td>0</td>
                                <td>150,000</td>
                                <td class="text-green">정상</td>
                                <td>대여금(일차감)</td>
                                <td>5,000</td>
                                <td>제한없음</td>
                                <td>2020-11-01~2020-12-01</td>
                                <td>제휴본사1-총판1-가맹점2</td>
                                <td>S003433</td>
                                <td>admin</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- end panel -->
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

<%--modal add start--%>
<%--<div class="modal fade" id="searchOption_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="searchOption.jsp" %>
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
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    $(() => {
        $("#testTable").dataTable();
        $(".insert_btn").click(function() {
            location.href = "${path}/settlement/transsettle/insert";
        });

        $(".detailRow").click(function() {
            location.href = "${path}/settlement/transsettle/detail";
        });

        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker({
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
