<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 요금관리</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2" text="default text"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main2.sub9" text="default text"/></li>
                </ol>
                <h3 class="rix-title">요금관리<%--<spring:message code="merchandise.title" text="default text"/>--%></h3>
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
                                            <td class="bg-light"><strong>소속업무그룹<%--<spring:message code="merchandise.search1" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong>배송그룹<%--<spring:message code="merchandise.search8" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="만나기본배송그룹<%--<spring:message code="merchandise.search1.option1" text="default text"/>--%>" class="form-control background-white width-150" readonly>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option>가맹점명칭<%--<spring:message code="merchandise.search9.option1" text="default text"/>--%></option>
                                                        <option>가맹점코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                        <option>제휴본사명칭<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                        <option>제휴본사코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                        <option>관리총판명칭<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                        <option>관리총판코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                        <option>배송그룹명칭<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                        <option>배송그룹코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    </select>
                                                    <input type="text" class="form-control width-150">
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <i class="fa fa-angle-double-down detailOptionBtnUpWide detailOptionBtn1"></i>
                            <i class="fa fa-angle-double-up detailOptionBtnDownWide detailOptionBtn1"></i>
                            <%--<span class="arrow-down-wide detailOptionBtn1">
                            </span>
                            <span class="arrow-up-wide detailOptionBtn1">
                            </span>--%>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>배송그룹<%--<spring:message code="merchandise.search8" text="default text"/>--%></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="만나기본배송그룹<%--<spring:message code="merchandise.search1.option1" text="default text"/>--%>" class="form-control background-white width-150" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>가맹점명칭<%--<spring:message code="merchandise.search9.option1" text="default text"/>--%></option>
                                                    <option>가맹점코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    <option>제휴본사명칭<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    <option>제휴본사코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    <option>관리총판명칭<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    <option>관리총판코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    <option>배송그룹명칭<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    <option>배송그룹코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                </select>
                                                <input type="text" class="form-control width-150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <i class="fa fa-angle-double-down detailOptionBtnUpNarrow detailOptionBtn2"></i>
                            <i class="fa fa-angle-double-up detailOptionBtnDownNarrow detailOptionBtn2"></i>
                            <div class="col-xl-12 col-md-12 searchOptionZone">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>관리비 구분<%--<spring:message code="merchandise.search2" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control width-150">
                                                        <option>월정액</option>
                                                        <option>선분할</option>
                                                        <option>주문건수</option>
                                                        <option>일차감</option>
                                                        <option>무제한</option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong>배송원 수수료할인<%--<spring:message code="merchandise.search2" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control width-150">
                                                        <option>전체</option>
                                                        <option>설정</option>
                                                        <option>미설정</option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12">
                                <div class="">
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <th class="text-center">순번</th>
                        <th>제휴본사</th>
                        <th>총판</th>
                        <th>배송그룹</th>
                        <th class="text-center">가맹점</th>
                        <th class="text-center">관리비 구분</th>
                        <th class="text-center">관리비</th>
                        <th class="text-center">차감 시작일</th>
                        <th class="text-center">차감일</th>
                        <th class="text-center">배송원 수수료할인</th>
                        <th class="text-center">세금계산서 발행여부</th>
                        <th class="text-center">최종 변경 일시</th>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="11" varStatus="status">
                            <tr class="detailRow">
                                <td class="text-center">${status.index}</td>
                                <td>
                                    <span class="orangeColor d-block">H0004</span>
                                    <span>테스트제휴본사(개발)</span>
                                </td>
                                <td>
                                    <span class="orangeColor d-block">B0011</span>
                                    <span>테스트총판</span>
                                </td>
                                <td>만나기본배송그룹</td>
                                <td>
                                    <span class="orangeColor d-block">B0011</span>
                                    <span>(금호)테스트가맹점</span>
                                </td>
                                <td class="text-center">월정액</td>
                                <td class="text-center">
                                    0원
                                    <span class="text-green d-block">(0건 초과시 건당 0원)</span>
                                </td>
                                <td class="text-center text-red">미설정</td>
                                <td class="text-center">1일</td>
                                <td class="text-center text-red">설정안함</td>
                                <td class="text-center">발행안함</td>
                                <td class="text-center">2021-01-05</td>
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
        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
        });
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-55');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownWide").hide();
                $(".detailOptionBtnUpWide").show();
            } else {
                $(".detailOptionBtnDownWide").show();
                $(".detailOptionBtnUpWide").hide();
            }
        });

        $(".detailOptionBtn2").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-55');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
            }
        });

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        /*$(".insert_btn").click(function() {
            location.href = "${path}/merchant/merchandise/insert";
        });*/

        $(".detailRow").click(function() {
            location.href = "${path}/merchant/ratemgt/detail";
        });
    });
</script>
</body>
</html>
