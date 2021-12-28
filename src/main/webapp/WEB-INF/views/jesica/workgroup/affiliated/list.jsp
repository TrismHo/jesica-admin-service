<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar |  <spring:message code="sidemenu.workgroupmanagement.affiliatedheadquarters"  text="제휴본사"/> </title>

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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.affiliatedheadquarters" text="제휴본사"/></li>
                </ol>
                <h3 class="rix-title">
                    <spring:message code="sidemenu.workgroupmanagement.affiliatedheadquarters" arguments="${title}" text="제휴본사"/>
                </h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <!-- begin col-3 -->
                                <%--<div class="col-xl-12 col-md-12 wide">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search1" text="브랜드"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option>전체</option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search8" text="등록기간"/></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                                ~
                                                <label>
                                                    <input type="text" class="form-control endDate background-white"  readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search9" text="검색어 입력"/></strong></td>
                                            <td>
                                                &lt;%&ndash;<label>
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
                                                    <input type="text" class="form-control width-150">
                                                </label>&ndash;%&gt;
                                                    <div class="row">
                                                        <div class="col-xl-4">
                                                            <select class="form-control w-100">
                                                                &lt;%&ndash;<option><spring:message code="merchandise.search9.option1" text="default text"/>&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                                <option><spring:message code="merchandise.search9.option2" text="default text"/>&lt;%&ndash;바코드&ndash;%&gt;</option>&ndash;%&gt;
                                                                <option><spring:message code="merchandise.search9.option1" text="제휴본사명칭"/></option>
                                                                <option><spring:message code="merchandise.search9.option1" text="제휴본사코드"/></option>
                                                            </select>
                                                        </div>
                                                        <div class="col-xl-4 ml-2">
                                                            <input type="text" class="form-control w-100">
                                                        </div>
                                                    </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>--%>
                               <%-- <i class="fa fa-angle-single-down detailOptionBtnUpWide detailOptionBtn1"></i>
                                <i class="fa fa-angle-single-up detailOptionBtnDownWide detailOptionBtn1"></i>--%>
                                <%--<span class="arrow-down-wide detailOptionBtn1">
                                </span>
                                <span class="arrow-up-wide detailOptionBtn1">
                                </span>--%>
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
                                <div class="col-xl-12 col-md-12">
                                    <form class="brand_search_form"></form>

                                        <table class="table table-condensed table-bordered">
                                            <tbody>
                                            <tr>
                                                <td class="bg-light" style="width:10%">
                                                    <strong><spring:message code="list.search.brand" text="브랜드"/><%--가맹점선택--%></strong>
                                                </td>
                                                <td style="width:30%">
                                                    <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                                        <label>
                                                            <select class="form-control searchBrandList brandNo" name="brandNo">
                                                            </select>
                                                        </label>
                                                    </c:if>
                                                    <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                                        <spring:message code="list.search.headquarterslevelaccount" text="본사등급 계정 (단일조회)"/>
                                                        <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}" disable>
                                                    </c:if>


                                                </td>
                                                <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                                <td style="width:50%">
                                                    <label>
                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                    </label>
                                                    <label>
                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/></strong></td>
                                                <td>
                                                    <div class="row">
                                                    </div>
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
                                                            <option><spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/></option>
                                                        </select>
                                                    </label>
                                                    <label>
                                                        <input type="text" name="headName" value="${searchValue.headName}" class="form-control width-150" maxlength="50">
                                                    </label>
                                                    <label>
                                                        <span class="btn-group  bg-black-transparent-2 rounded">
                                                            <a href="/workgroup/affiliated/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
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
                                        <span class="fa fa-plus"><spring:message code="list.search.registeredaffiliated " text="제휴본사등록"/></span>
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
                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                    <thead>
                        <th class="text-center">
                            <input type="checkbox" name="checked_all" id="select0" class="d-none">
                            <label for="select0" class="input-label "> <i class="fa fa-square check_all_i"></i></label>
                        </th>
                        <th class="text-center"><spring:message code="list.word.no" text="순번"/></th>
                        <th class="text-center"><spring:message code="list.word.brand" text="브랜드"/></th>
                        <th class="text-center"><spring:message code="list.word.affiliated" text="제휴본사"/></th>
                        <th class="text-center"><spring:message code="list.word.status" text="상태"/></th>
                        <th class="text-center"><spring:message code="list.word.serviceclassification" text="서비스구분 "/></th>
                        <th class="text-center"><spring:message code="list.word.deposit" text="예치금"/></th>
                        <th class="text-center"><spring:message code="list.word.cash" text="캐시"/></th>
                        <th class="text-center"><spring:message code="list.word.arrears" text="체납금"/></th>
                        <th class="text-center"><spring:message code="list.word.epresentativenumber" text="대표번호"/></th>
                        <th class="text-center"><spring:message code="list.word.contact" text="연락처"/></th>
                        <th class="text-center"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                        <th class="text-center"><spring:message code="list.word.modifieddate" text="수정일"/></th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${workGroup}" varStatus="status">
                        <tr class="detailRow" headNo="${item.headNo}">
                            <td class="select-td checkbox_label" onclick="event.cancelBubble = true">
                                <input type="checkbox" name="chk" id="select${status.index}" class="checkbox d-none">
                                <label for="select${status.index}" class="input-label"> <i class="fa fa-square check_all_i"></i></label>
                            </td>
                            <td>${status.index + 1}</td>
                            <td>${item.brand.brandName}</td>
                            <td>
                                <span class="orangeColor d-block">H${item.headNo}</span>
                                <span>${item.headName}</span>
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
                                <c:if test="${item.serviceYn == 'TEST_OR_CALC'}"> <spring:message code="list.word.testorcalc" text="테스트 또는 정산"/></c:if>
                                <c:if test="${item.serviceYn == 'SERVICE'}"> <spring:message code="list.word.service" text="서비스"/></c:if>
                            </td>
                            <td class="text-right"><fmt:formatNumber value="${item.deposit}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-right"><fmt:formatNumber value="${item.cash}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-right"><fmt:formatNumber value="${item.cashDefault}" pattern="#,###" /> <spring:message code="list.word.won" text="원"/></td>
                            <td class="text-center">${item.headTel}</td>
                            <td class="text-center">${item.actualTel}</td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>

                   <%-- <c:forEach begin="1" end="11" varStatus="status" >
                        <tr class="detailRow">
                            <td class="select-td checkbox_label" onclick="event.cancelBubble = true">
                                <input type="checkbox" name="chk" id="select${status.index}" class="checkbox d-none">
                                <label for="select${status.index}" class="input-label"> <i class="fa fa-square check_all_i"></i></label>
                            </td>
                            &lt;%&ndash;<td><input type="checkbox"></td>&ndash;%&gt;
                            <td>${status.index}</td>
                            <td>테스트${status.index}</td>
                            <td class="text-right">${status.index}0,000</td>
                            <td class="text-right">7,000</td>
                            <td class="text-right">9,000</td>
                            <td class="text-right">6,000</td>
                            <td>정상</td>
                            <td>정상</td>
                            <td>정상</td>
                            <td>불필요11</td>
                            <td>불필요11</td>
                            <td>불필요11</td>
                            <td>2020-12-01 13:38:42</td>
                            <td>2020-12-01 13:38:42</td>
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
        let allmsg = "<spring:message code="list.script.all" text="전체"/>";
        //브랜드 검색
        $(document).ready(function(){
            let brandReq = convertFormToObj($('form.brand_search_form'));
            let brandNo = "${searchValue.brandNo}";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/brand/list",
                data: JSON.stringify(brandReq),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchBrandList").append(
                        "<option value=\"\">"+allmsg+"</option>"
                    )
                    for(var i = 0 ; i < data.searchBrandList.length ; i++){
                        if(brandNo == data.searchBrandList[i].brandNo) {
                            $(".searchBrandList").append(
                                "<option value="+data.searchBrandList[i].brandNo+" selected>"+data.searchBrandList[i].brandName+"</option>"
                            )
                        } else {
                            $(".searchBrandList").append(
                                "<option value="+data.searchBrandList[i].brandNo+">"+data.searchBrandList[i].brandName+"</option>"
                            )
                        }

                    }
                }
            });
        });





        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });

        //check all
        $( "#select0").click( function (){
            if ($("input[name=checked_all]:checkbox").is( ":checked")){
                $( "input[name=chk]:checkbox" ).attr( "checked", "checked" );
                $(".check_all_i").addClass("checked_true");
            } else {
                $( "input[name=chk]:checkbox" ).removeAttr( "checked");
                $(".check_all_i").removeClass("checked_true");
            }
        });

        $(".checkbox_label").click(function (){
            if ( $(this).closest("td").find(".checkbox").is( ":checked")){
                $(this).closest("input[type=checked]").removeAttr( "checked");
                $(this).find("i").addClass("checked_true");
            } else {
                $(this).parents("td").find("input[type=checked]").attr( "checked", "checked" );
                $(this).find("i").removeClass("checked_true");
            }
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

        $(".insert_btn").click(function() {
            location.href = "${path}/workgroup/affiliated/insert";
        });

        $(document).on("click",".detailRow",function(){
            let headNo = $(this).attr("headNo")
            location.href = "${path}/workgroup/affiliated/detail?headNo="+headNo;
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
