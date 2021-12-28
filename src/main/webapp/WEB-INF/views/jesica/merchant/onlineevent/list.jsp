<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Jesicar | 온라인 이벤트</title>
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
                    <li class="breadcrumb-item active"><spring:message code="side.main2.sub8" text="default text"/></li>
                </ol>
                <h3 class="rix-title">온라인 이벤트<%--<spring:message code="merchandise.title" text="default text"/>--%></h3>
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
                                            <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <label for="aa" class="font-size-10">
                                                        <input type="radio" id="aa" name="aa" class="align-middle" checked><spring:message code="merchandise.search1.option4" text="default text"/>
                                                    </label>
                                                    <label for="bb" class="font-size-10">
                                                        <input type="radio" id="bb" name="aa" class="align-middle"><spring:message code="merchandise.search1.option5" text="default text"/>
                                                    </label>
                                                </label>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong>가맹점 상태<%--<spring:message code="merchandise.search8" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control width-150">
                                                        <option>정상+정지상태</option>
                                                        <option>정상</option>
                                                        <option>정지</option>
                                                        <option>캐쉬부족</option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option>가맹점명<%--<spring:message code="merchandise.search9.option1" text="default text"/>--%></option>
                                                        <option>가맹점코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                    </select>
                                                    <input type="text" class="form-control" <%--style="width: 200px;"--%>> <%--<i style="padding: 9px;" class="fas fa-lg fa-fw m-r-15 fa-plus-circle detailOptionBtn"></i>--%>
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
                                                <label for="aa" class="font-size-10">
                                                    <input type="radio" id="11" name="aa" class="align-middle" checked>소속
                                                </label>
                                                <label for="bb" class="font-size-10">
                                                    <input type="radio" id="22" name="aa" class="align-middle">영업
                                                </label>
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/>" class="form-control background-white" readonly>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong>가맹점 상태<%--<spring:message code="merchandise.search8" text="default text"/>--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control width-150">
                                                    <option>정상+정지상태</option>
                                                    <option>정상</option>
                                                    <option>정지</option>
                                                    <option>캐쉬부족</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>가맹점명<%--<spring:message code="merchandise.search9.option1" text="default text"/>--%></option>
                                                    <option>가맹점코드<%--<spring:message code="merchandise.search9.option2" text="default text"/>--%></option>
                                                </select>
                                                <input type="text" class="form-control" <%--style="width: 200px;"--%>> <%--<i  class="fas fa-lg fa-fw m-r-15 fa-plus-circle detailOptionBtn"></i>--%>
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <i class="fa fa-angle-double-down detailOptionBtnUpNarrow detailOptionBtn2"></i>
                            <i class="fa fa-angle-double-up detailOptionBtnDownNarrow detailOptionBtn2"></i>
                            <%--<span class="arrow-down-narrow detailOptionBtn2">
                            </span>
                            <span class="arrow-up-narrow detailOptionBtn2">
                            </span>--%>
                            <%--<i id="detailOptionBtn" class=" fas fa-lg fa-fw m-r-10 fa-plus"></i>--%>
                            <div class="col-xl-12 col-md-12 searchOptionZone">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>이벤트 설정여부<%--<spring:message code="merchandise.search2" text="default text"/>--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control width-150">
                                                        <option>스탬프 전체</option>
                                                        <option>사용</option>
                                                        <option>사용 안함</option>
                                                    </select>
                                                    <select class="form-control width-150">
                                                        <option>최초주문 할인 전체</option>
                                                        <option>사용</option>
                                                        <option>사용 안함</option>
                                                    </select>
                                                    <select class="form-control width-150">
                                                        <option>주문금액별 할인 전체</option>
                                                        <option>사용</option>
                                                        <option>사용 안함</option>
                                                    </select>
                                                    <select class="form-control width-150">
                                                        <option>포장 할인 전체</option>
                                                        <option>사용</option>
                                                        <option>사용 안함</option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search2" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search2.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search2.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search2.option3" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search2.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search3" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search3.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search3.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search3.option3" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search4" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search4.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search4.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search4.option3" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search4.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search5" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search5.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search5.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search5.option3" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search6" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search6.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search6.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search6.option3" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search7" text="default text"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search7.option1" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search7.option2" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search7.option3" text="default text"/></option>
                                                        <option><spring:message code="merchandise.search7.option4" text="default text"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>--%>
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
                        <th>순번</th>
                        <th>제휴본사</th>
                        <th>총판</th>
                        <th>가맹점</th>
                        <th>상태</th>
                        <th>만나샵 플랫폼</th>
                        <th>스탬프</th>
                        <th>스탬프 이미지</th>
                        <th>최초주문 할인</th>
                        <th>최초주문 할인 이미지</th>
                        <th>주문금액별 할인</th>
                        <th>주문금액별 할인 이미지</th>
                        <th>포장 할인</th>
                        <th>포장할인 이미지</th>
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
                                <td>
                                    <span class="orangeColor d-block">B0011</span>
                                    <span>(금호)테스트가맹점</span>
                                </td>
                                <td class="text-center text-green">정상</td>
                                <td class="text-center">사용 안함</td>
                                <td class="text-center">사용 안함</td>
                                <td class="text-center text-red">미등록</td>
                                <td class="text-center">사용안함</td>
                                <td class="text-center text-red">미등록</td>
                                <td class="text-center">사용안함</td>
                                <td class="text-center text-red">미등록</td>
                                <td class="text-center">사용안함</td>
                                <td class="text-center text-red">미등록</td>
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
        $("#testTable").DataTable();
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

        $(".detailRow").click(function() {
            location.href = "${path}/merchant/onlineevent/detail";
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
