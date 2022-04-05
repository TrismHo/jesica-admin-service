<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="안심번호 할당정보"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement1" text="시스템 운영"/></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="안심번호 할당정보"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="안심번호 할당정보"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form class="brand_search_form"></form>

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12">
                                <form name="frmSearch" id="frmSearch">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                        <td style="width:40%">
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control  ">
                                                    <option><spring:message code="list.search.franchiseeheadquarters1" text="업체명"/></option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" name="storeName" value="${searchValue.storeName}" class="form-control width-150" maxlength="150">
                                            </label>
                                            <label>
                                                    <span class="btn-group  bg-black-transparent-2 rounded">
                                                        <a href="${path}/extralink/rentcar/list?&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                            <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                        </a>
                                                    </span>
                                            </label>
                                            <%--  <label>
                                                  <select class="form-control width-150">
                                                      &lt;%&ndash;<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                      <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>&ndash;%&gt;
                                                      <option>제휴본사명칭</option>
                                                      <option>제휴본사코드</option>
                                                      <option>인증단말기번호</option>
                                                      <option>사업자등록번호</option>
                                                      <option>계약자</option>
                                                      <option>담당자</option>
                                                  </select>
                                                  <input type="text" class="form-control w-100">
                                              </label>--%>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                 </form>
                            </div>
                            <%--   <i class="fa fa-angle-single-down detailOptionBtnUpNarrow detailOptionBtn2"></i>
                               <i class="fa fa-angle-single-up detailOptionBtnDownNarrow detailOptionBtn2"></i>--%>
                            <%--<span class="arrow-down-narrow detailOptionBtn2">
                            </span>
                            <span class="arrow-up-narrow detailOptionBtn2">
                            </span>--%>
                            <%--<i id="detailOptionBtn" class=" fas fa-lg fa-fw m-r-10 fa-plus"></i>--%>

                            <br>
                            <div class="col-xl-12 col-md-12  m-t-10">
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <spring:message code="list.search.franchiseeregistration1" text="안심번호 할당"/></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick"  onclick="searchFormBranchFunction()" ><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/> </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                        <%--<div class="dt-buttons btn-group flex-wrap">
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
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
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
                    <th class="text-center"><spring:message code="list.word.no" text="번호"/></th>
                    <th class="text-center"><spring:message code="list.word.affiliated1" text="예약번호"/></th>
                    <th class="text-center"><spring:message code="list.word.distributor1" text="업체명"/></th>
                    <th class="text-center"><spring:message code="list.word.franchisee1" text="차량번호"/></th>
                    <th class="text-center"><spring:message code="list.word.serviceclassification1" text="운전자전화번호"/></th>
                    <th class="text-center"><spring:message code="list.word.multimerchantstore1" text="안심번호"/></th>
                    <th class="text-center"><spring:message code="list.word.multimerchantstore1" text="매핑전화번호"/></th>
                    <th class="text-center"><spring:message code="list.word.deposit1" text="인수일"/></th>
                    <th class="text-center"><spring:message code="list.word.cash1" text="반납일 "/></th>
                    <th class="text-center"><spring:message code="list.word.registrationdate1" text="등록일"/></th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${tbRentalInfo}" varStatus="status">
                        <tr class="detailRow" style="cursor: default;">
                            <td>${status.index + 1}</td>
                            <td class="text-center"><span class="orangeColor d-block">${item.reservNum}</span></td>
                            <td class="text-center">${item.storeName}</td>
                            <td class="text-center">${item.carNum}</td>
                            <%--<td class="text-center custTel" >${item.custTel}</td>--%>
                            <td class="text-center custDriverTel1">${item.custDriverTel1}</td>
                            <td class="text-center">${item.safenNum}</td>
                            <td class="text-center">${item.mappingNum}</td>
                            <td class="text-center"><javatime:format value="${item.reservStartDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.reservEndDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </c:forEach>
                    <%--<c:forEach begin="1" end="20" varStatus="idx">
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
                                <span class="orangeColor d-block">1000</span>
                                <span>만나기본배송그룹</span>
                            </td>
                            <td>
                                <span class="orangeColor d-block">S003475</span>
                                <span>KHLEE_소속가맹점</span>
                            </td>
                            <td>정상</td>
                            <td class="text-blue">인증완료</td>
                            <td class="text-red">미동의</td>
                            <td>2021-01-15 14:53:12</td>
                        </tr>
                    </c:forEach>--%>
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
<!-- end page container -->
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    // DataTables Default

    $(() => {

        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-140');
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
            $(".searchOptionZone").toggleClass('act-height-140');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
            }
        });



        $(".insert_btn").click(function() {
            location.href = "${path}/extralink/rentcar/insert";
        });

        let date = new Date();
        let date2 = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";
        var yesterday = new Date(date2.setDate(date2.getDate() - 1));

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', yesterday);
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

        /*date.setMonth(date.getMonth() + 1, 1);*/
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        if(endDate == ""){
            $(".endDate").datepicker('setDate', date);
        } else {
            $(".endDate").datepicker('setDate', endDate);
        }
    });

    function searchFormBranchFunction() {
        $("#frmSearch").submit();

       /* let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";

        if($(".branchNo").val() == "" || $(".branchNo").val() == null) {
            swal({
                title: pleaseselectadistributor,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            });
        } else {
            $("#frmSearch").submit();
        }*/
    }

</script>
</body>
</html>
