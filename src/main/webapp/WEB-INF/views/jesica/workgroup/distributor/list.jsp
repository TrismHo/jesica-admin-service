<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.workgroupmanagement.exclusivedistributor" arguments="${title}" text="총판"/></title>
</head>
<style>
    .form-control-test {
        width: 100%;
        height: 30px;
        font-size: 11px;
        display: inline;
        border-radius: 0px;
        border: 1px solid #d5dbe0;;
    }
</style>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.exclusivedistributor" text="총판"/></li>
                </ol>
                <h3 class="rix-title">
                    <spring:message code="sidemenu.workgroupmanagement.exclusivedistributor" arguments="${title}" text="총판"/>
                </h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">

                            <div class="col-xl-12 col-md-12">
                                <form class="brand_search_form"></form>
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.affiliated" text="제휴본사"/><%--가맹점선택--%></strong></td>
                                        <td style="width:30%">
                                            <label>
                                                <select class="form-control width-150 searchHeadList headNo" name="headNo">
                                                </select>
                                            </label>
                                        </td>
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/></strong></td>
                                        <td style="width:50%">
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control dataStatus" name="dataStatus">
                                                    <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                    <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>><spring:message code="list.search.normal" text="정상"/></option>
                                                    <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>><spring:message code="list.search.stop" text="정지"/></option>
                                                </select>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option><spring:message code="list.search.distributorheadquarters" text="총판명"/></option>
                                                </select>
                                            </label>
                                            <label>
                                                <input type="text" name="branchName" value="${searchValue.branchName}" class="form-control width-150" maxlength="50">
                                            </label>
                                            <label>
                                                <span class="btn-group  bg-black-transparent-2 rounded">
                                                    <a href="/workgroup/distributor/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                        <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                    </a>
                                                </span>
                                            </label>
                                        </td>
                                    </tr>
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

                                    </tbody>
                                </table>
                            </div>
                            <%--   <i class="fa fa-angle-single-down detailOptionBtnUpNarrow detailOptionBtn2"></i>
                               <i class="fa fa-angle-single-up detailOptionBtnDownNarrow detailOptionBtn2"></i>--%>
                            <%--<span class="arrow-down-narrow detailOptionBtn2">
                            </span>
                            <span class="arrow-up-narrow detailOptionBtn2">
                            </span>--%>
                            <%--<i id="detailOptionBtn" class=" fas fa-lg fa-fw m-r-10 fa-plus"></i>--%>

                            <br>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus"><spring:message code="list.search.distributorregistration" text="총판등록"/></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5" ><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/> </button>
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
            </form>
            <div class="panel-body p-15">
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
                        <%--<th></th>--%>
                        <th class="text-center"><spring:message code="list.word.no" text="순번"/></th>
                        <th class="text-center"><spring:message code="list.word.brand" text="브랜드"/></th>
                        <th class="text-center"><spring:message code="list.word.affiliated" text="제휴본사"/></th>
                        <th class="text-center"><spring:message code="list.word.distributor" text="총판"/></th>
                        <th class="text-center"><spring:message code="list.word.status" text="상태"/></th>
                        <th class="text-center"><spring:message code="list.word.serviceclassification" text="서비스구분"/></th>
                        <th class="text-center"><spring:message code="list.word.deposit" text="예치금"/></th>
                        <th class="text-center"><spring:message code="list.word.cash" text="캐시"/></th>
                        <th class="text-center"><spring:message code="list.word.arrears" text="체납금"/></th>
                        <th class="text-center"><spring:message code="list.word.epresentativenumber" text="대표번호"/></th>
                        <th class="text-center"><spring:message code="list.word.contact" text="연락처"/></th>
                        <th class="text-center"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                        <th class="text-center"><spring:message code="list.word.modifieddate" text="수정일"/></th>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${tbBranch}" varStatus="status">
                            <tr class="detailRow" branchNo="${item.branchNo}">
                                <%--<td class="select-td checkbox_label" onclick="event.cancelBubble = true">
                                    <input type="checkbox" name="chk" id="select${status.index}" class="checkbox d-none">
                                    <label for="select${status.index}" class="input-label"> <i class="fa fa-square check_all_i"></i></label>
                                </td>--%>
                                <td>${status.index + 1}</td>
                                <td>${item.head.brand.brandName}</td>
                                <td>
                                    <span class="orangeColor d-block">H${item.head.headNo}</span>
                                    <span>${item.head.headName}</span>
                                </td>
                                <td>
                                    <span class="orangeColor d-block">B${item.branchNo}</span>
                                    <span>${item.branchName}</span>
                                </td>
                                <td class="text-center <c:if test="${item.dataStatus == 'STOP'}">text-red</c:if>">
                                    <c:if test="${item.dataStatus == 'OK'}">
                                        <spring:message code="list.detail.normal" text="정상"/>
                                    </c:if>
                                    <c:if test="${item.dataStatus == 'STOP'}">
                                        <spring:message code="list.detail.stop" text="정지"/>
                                    </c:if>
                                </td>
                                <td class="text-center <c:if test="${item.serviceYn == 'TEST_OR_CALC'}">text-red</c:if>">
                                    <c:if test="${item.serviceYn == 'TEST_OR_CALC'}"><spring:message code="list.word.testorcalc" text="테스트 또는 정산"/></c:if>
                                    <c:if test="${item.serviceYn == 'SERVICE'}"> <spring:message code="list.word.service" text="서비스"/></c:if>
                                </td>
                                <td class="text-right"><fmt:formatNumber value="${item.deposit}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-right"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-right"><fmt:formatNumber value="${item.cashDefault}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                                <td class="text-center">${item.branchTel}</td>
                                <td class="text-center">${item.actualTel}</td>
                                <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                                <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
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
    $(document).on("click",".detailRow", function() {
        let branchNo = $(this).attr("branchNo");
        location.href = "${path}/workgroup/distributor/detail?branchNo="+branchNo;
    });

    $(() => {
        //제휴본사 검색
        let allmsg = "<spring:message code="list.script.all" text="전체"/>";
        $(document).ready(function(){
            let headReq = convertFormToObj($('form.head_search_form'));
            let headNo = "${searchValue.headNo}";
            let role = "${sessionScope.sessionKey.userRole}";
            let sessionHead = "${sessionScope.sessionKey.headNo}";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(headReq),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    if(role == 0) {
                        $(".searchHeadList").append(
                            "<option value=\"\">"+allmsg+"</option>"
                        )
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            if(headNo == data.searchHeadList[i].headNo) {
                                $(".searchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            } else {
                                $(".searchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+">"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            }
                        }
                    } else if (role == 1) {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            if(sessionHead == data.searchHeadList[i].headNo) {
                                $(".searchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            }
                        }
                    } else if (role == 2) {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            if(sessionHead == data.searchHeadList[i].headNo) {
                                $(".searchHeadList").append(
                                    "<option value="+data.searchHeadList[i].headNo+" selected>"+data.searchHeadList[i].headName+"["+data.searchHeadList[i].headNo+"]</option>"
                                )
                            }
                        }
                    }
                }
            });
        });

        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });
        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-85');
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
            $(".searchOptionZone").toggleClass('act-height-85');
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

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".insert_btn").click(function() {
            location.href = "${path}/workgroup/distributor/insert";
        });



        let date = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', '2020-01-01');
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
</script>
</body>
</html>
