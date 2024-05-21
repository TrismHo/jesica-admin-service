<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 영업가맹점</title>
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
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">

            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1" text="default text"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main1.sub4" text="default text"/></li>
                </ol>
                <h3 class="rix-title">영업가맹점<%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 wide">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.workgroup" text="업무그룹"/><%--가맹점선택--%></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="list.search.affiliated" text="제휴본사 선택"/><%--제휴본사 선택--%>" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="list.search.distributor" text="총판명"/><%--총판선택--%>" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.search" text="searchword"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <%--<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>--%>
                                                    <option>검색구분선택</option>
                                                    <option>제휴본사명칭</option>
                                                    <option>제휴본사코드</option>
                                                    <option>총판명칭</option>
                                                    <option>총판코드</option>
                                                    <option>가맹점명칭</option>
                                                    <option>가맹점코드</option>
                                                    <option>배송그룹명칭</option>
                                                    <option>배송그룹코드</option>
                                                </select>
                                                <input type="text" class="form-control width-150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>업무그룹<%--<spring:message code="merchandise.search1" text="default text"/>--%><%--가맹점선택--%></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control width-150">
                                                    <%--<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>--%>
                                                    <option>검색구분선택</option>
                                                    <option>제휴본사명칭</option>
                                                    <option>제휴본사코드</option>
                                                    <option>총판명칭</option>
                                                    <option>총판코드</option>
                                                    <option>가맹점명칭</option>
                                                    <option>가맹점코드</option>
                                                    <option>배송그룹명칭</option>
                                                    <option>배송그룹코드</option>
                                                </select>
                                                <input type="text" class="form-control width-150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th class="text-left">순번</th>
                            <th>제휴본사</th>
                            <th>총판</th>
                            <th>가맹점</th>
                            <th>사용상태</th>
                            <th>사업자등록번호</th>
                            <th>연락처</th>
                            <th>승인상태</th>
                            <th>약관동의</th>
                            <th>등록일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach begin="1" end="20" varStatus="idx">
                        <tr class="detailRow">
                            <td>${idx.index}</td>
                            <td>
                                <span class="orangeColor d-block">H0004</span>
                                <span>테스트제휴본사(개발)</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">H0004</span>
                                <span>테스트총판(개발)</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">S003475</span>
                                <span>KHLEE_소속가맹점</span>
                            </td>
                            <td class="text-center">정상</td>
                            <td class="text-center">123-45-67890</td>
                            <td class="text-center">01011112222</td>
                            <td class="text-blue text-center">인증완료</td>
                            <td class="text-red text-center">미동의</td>
                            <td class="text-center">2021-01-15 14:53:12</td>
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


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    $(() => {
        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownWide").hide();
                $(".detailOptionBtnUpWide").show();
                /*$(".arrow-down-wide").show();
                $(".arrow-up-wide").hide();*/
            } else {
                $(".detailOptionBtnDownWide").show();
                $(".detailOptionBtnUpWide").hide();
                /*$(".arrow-down-wide").hide();
                $(".arrow-up-wide").show();*/
            }
        });

        $(".detailOptionBtn2").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
                /*$(".arrow-down-narrow").show();
                $(".arrow-up-narrow").hide();*/
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
                /*$(".arrow-down-narrow").hide();
                $(".arrow-up-narrow").show();*/
            }
        });

        $(".detailRow").click(function() {
            location.href = "${path}/workgroup/businessfranch/detail";
        });

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });

        $(".date").datepicker({
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
