<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 협력사<%--<spring:message code="merchandise.title" text="default text"/>--%><%--상품관리--%></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main6" text="default text"/><%--가맹점설정--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="side.main6.sub1" text="default text"/><%--상품--%></li>
                </ol>
                <h3 class="rix-title">협력사<%--<spring:message code="merchandise.title" text="default text"/>--%><%--상품관리--%></h3>
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
                                            <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/><%--가맹점선택--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control" style="background-color: white;" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control" style="background-color: white;" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control" style="background-color: white;" readonly>
                                                </label>
                                                <label>
                                                    <label for="aa" style="font-size: 10px;">
                                                        <input type="radio" id="aa" name="aa" class="align-middle" checked><spring:message code="merchandise.search1.option4" text="default text"/><%--소속--%>
                                                    </label>
                                                    <label for="bb" style="font-size: 10px;">
                                                        <input type="radio" id="bb" name="aa" class="align-middle"><spring:message code="merchandise.search1.option5" text="default text"/><%--영업--%>
                                                    </label>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search8" text="default text"/><%--등록기간--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                                ~
                                                <label>
                                                    <input type="text" class="form-control endDate" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/><%--검색어 입력--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search9.option1" text="default text"/><%--상품명--%></option>
                                                        <option><spring:message code="merchandise.search9.option2" text="default text"/><%--바코드--%></option>
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
                                        <td class="bg-light"><strong><spring:message code="merchandise.search1" text="default text"/><%--가맹점선택--%></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control" style="background-color: white;" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control" style="background-color: white;" readonly>
                                            </label>
                                            <label>
                                                <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control" style="background-color: white;" readonly>
                                            </label>
                                            <label>
                                                <label for="aa" style="font-size: 10px;">
                                                    <input type="radio" id="aa" name="aa" class="align-middle" checked><spring:message code="merchandise.search1.option4" text="default text"/><%--소속--%>
                                                </label>
                                                <label for="bb" style="font-size: 10px;">
                                                    <input type="radio" id="bb" name="aa" class="align-middle"><spring:message code="merchandise.search1.option5" text="default text"/><%--영업--%>
                                                </label>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search8" text="default text"/><%--등록기간--%></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control startDate" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                            ~
                                            <label>
                                                <input type="text" class="form-control endDate" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option><spring:message code="merchandise.search9.option1" text="default text"/><%--상품명--%></option>
                                                    <option><spring:message code="merchandise.search9.option2" text="default text"/><%--바코드--%></option>
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
                                            <td class="bg-light"><strong><spring:message code="merchandise.search2" text="default text"/><%--성인인증 구분--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search2.option1" text="default text"/><%--전체--%></option>
                                                        <option><spring:message code="merchandise.search2.option2" text="default text"/><%--필요--%></option>
                                                        <option><spring:message code="merchandise.search2.option3" text="default text"/><%--불필요--%></option>
                                                        <option><spring:message code="merchandise.search2.option4" text="default text"/><%--알수없음--%></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search3" text="default text"/><%--상품 상태--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search3.option1" text="default text"/><%--정상+정지상태--%></option>
                                                        <option><spring:message code="merchandise.search3.option2" text="default text"/><%--정상--%></option>
                                                        <option><spring:message code="merchandise.search3.option3" text="default text"/><%--정지--%></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search4" text="default text"/><%--온라인판매 상태--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search4.option1" text="default text"/><%--전체 상태--%></option>
                                                        <option><spring:message code="merchandise.search4.option2" text="default text"/><%--정상--%></option>
                                                        <option><spring:message code="merchandise.search4.option3" text="default text"/><%--정지(품절)--%></option>
                                                        <option><spring:message code="merchandise.search4.option4" text="default text"/><%--판매안함--%></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search5" text="default text"/><%--목록 이미지 등록--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search5.option1" text="default text"/><%--전체--%></option>
                                                        <option><spring:message code="merchandise.search5.option2" text="default text"/><%--등록--%></option>
                                                        <option><spring:message code="merchandise.search5.option3" text="default text"/><%--미등록--%></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search6" text="default text"/><%--상세 이미지 등록--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search6.option1" text="default text"/><%--전체--%></option>
                                                        <option><spring:message code="merchandise.search6.option2" text="default text"/><%--등록--%></option>
                                                        <option><spring:message code="merchandise.search6.option3" text="default text"/><%--미등록--%></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search7" text="default text"/><%--매장 판매상태--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option><spring:message code="merchandise.search7.option1" text="default text"/><%--전체 상태--%></option>
                                                        <option><spring:message code="merchandise.search7.option2" text="default text"/><%--정상--%></option>
                                                        <option><spring:message code="merchandise.search7.option3" text="default text"/><%--정지(품절)--%></option>
                                                        <option><spring:message code="merchandise.search7.option4" text="default text"/><%--판매안함--%></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12">
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left" style="margin-bottom: 10px;">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="merchandise.registerbutton" text="default text"/><%--상품등록--%></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right" style="line-height: 27px; width: 99px;padding: 5px;" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/><%--검색--%> </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                        <div class="dt-buttons btn-group flex-wrap">
                                            <button class="btn btn-secondary buttons-copy buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span>Copy</span>
                                            </button>
                                            <button class="btn btn-secondary buttons-csv buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span>CSV</span></button>
                                            <button class="btn btn-secondary buttons-excel buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span>Excel</span>
                                            </button>
                                            <button class="btn btn-secondary buttons-pdf buttons-html5 btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span>PDF</span></button>
                                            <button class="btn btn-secondary buttons-print btn-sm" tabindex="0" aria-controls="data-table-combine" type="button">
                                                <span>Print</span></button>
                                        </div>
                                    </div>
                                    <%-- <button id="detailOptionBtn1" data-toggle="modal" data-target="#searchOption_modal" class="btn-box-r bgGray float-right m-r-10 float-right" style="line-height: 27px; width: 99px;"><i class="fa fa-list grayicon"></i> 상세검색</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <th><input type="checkbox"></th>
                        <th><spring:message code="merchandise.table.column1" text="default text"/><%--이미지--%></th>
                        <th><spring:message code="merchandise.table.column2" text="default text"/><%--상품명--%></th>
                        <th><spring:message code="merchandise.table.column3" text="default text"/><%--매장정상판매가--%></th>
                        <th><spring:message code="merchandise.table.column4" text="default text"/><%--매장할인판매가--%></th>
                        <th><spring:message code="merchandise.table.column5" text="default text"/><%--온라인정상판매가--%></th>
                        <th><spring:message code="merchandise.table.column6" text="default text"/><%--온라인할인적용 주문금액--%></th>
                        <th><spring:message code="merchandise.table.column7" text="default text"/><%--상품상태--%></th>
                        <th><spring:message code="merchandise.table.column8" text="default text"/><%--온라인판매상태--%></th>
                        <th><spring:message code="merchandise.table.column9" text="default text"/><%--매장판매상태--%></th>
                        <th><spring:message code="merchandise.table.column10" text="default text"/><%--성인인증구분--%></th>
                        <th><spring:message code="merchandise.table.column11" text="default text"/><%--등록일/수정일--%></th>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="11" varStatus="status">
                            <tr class="detailRow">
                                <td><input type="checkbox"></td>
                                <td></td>
                                <td>테스트${status.index}</td>
                                <td style="text-align: right;">${status.index}0,000</td>
                                <td style="text-align: right;">7,000</td>
                                <td style="text-align: right;">9,000</td>
                                <td style="text-align: right;">6,000</td>
                                <td>정상</td>
                                <td>정상</td>
                                <td>정상</td>
                                <td>불필요</td>
                                <td>2020-12-01 13:38:42</td>
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
        $("#testTable").dataTable();

        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-85');
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
            $(".searchOptionZone").toggleClass('act-height-85');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
            }
        });

        $(".insert_btn").click(function() {
            location.href = "${path}/merchant/merchandise/insert";
        });

        $(".detailRow").click(function() {
            location.href = "${path}/merchant/merchandise/detail";
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
    });
</script>
</body>
</html>
