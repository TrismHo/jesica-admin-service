<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.merchantsetting.merchandise.option" text="상품옵션"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.merchantsetting.merchandise.option" text="상품옵션"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.merchantsetting.merchandise.option" text="상품옵션"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->


                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12">
                                <form name="frmSearch" class="frmSearch" id="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                            <tr>
                                                <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.franchiseselection" text="가맹점 선택"/></strong></td>
                                                <td style="width:30%">
                                                 <%--   <label>
                                                        <input type="text" data-toggle="modal" data-target="#head_search_modal" name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-100" readonly>
                                                        <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                    </label>
                                                    <label>
                                                        <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-100" readonly>
                                                        <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                    </label>
                                                    <label>
                                                        <input type="text" data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-100" readonly>
                                                        <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                    </label>--%>
                                                     <%--<c:if test="${sessionScope.sessionKey.userRole == 0}">--%>
                                                         <label>
                                                             <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                             <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                             <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                             <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                             <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                             <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                         </label>
                                                         <label>
                                                             <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                         </label>
                                                         <label>
                                                             <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점명"/>" class="form-control background-white storeName width-100">
                                                         </label>
                                                     <%--</c:if>--%>
                                                     <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                                         <label>
                                                             <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                             <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                             <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                             <c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">
                                                                 <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                             </c:if>
                                                             <c:if test="${searchValue.branchNo == null || searchValue.branchNo ==''}">
                                                                 <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                             </c:if>


                                                             <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                             <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                         </label>
                                                         <label>
                                                             <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                         </label>
                                                         <label>
                                                             <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점명"/>" class="form-control background-white storeName width-100">
                                                         </label>
                                                     </c:if>
                                                     <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                                         <label>
                                                             <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                             <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                             <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                             <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                             <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                                             <c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">
                                                                 <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                             </c:if>
                                                             <c:if test="${searchValue.storeNo == null || searchValue.storeNo ==''}">
                                                                 <input type="hidden" class="storeNo" name="storeNo" value="${sessionScope.sessionKey.storeNo}">
                                                             </c:if>

                                                         </label>
                                                         <label>
                                                             <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                                         </label>
                                                         <label>
                                                             <input type="text"  id="testInput"  data-toggle="modal" data-target="#store_search_modal" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>" name="storeNoText" value="${searchValue.storeNoText}" class="form-control background-white storeName width-100">
                                                         </label>
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
                                                <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/>/<spring:message code="list.word.optionclassification" text="옵션구분"/></strong></td>
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
                                                    <label>
                                                        <select class="form-control mandatoryYn" name="mandatoryYn">
                                                            <option value="null" <c:if test="${searchValue.mandatoryYn == 'null'  || searchValue.mandatoryYn == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                            <option value="true" <c:if test="${searchValue.mandatoryYn == 'true'}">selected</c:if>><spring:message code="list.search.requiredoption" text="필수옵션"/></option>
                                                            <option value="false" <c:if test="${searchValue.mandatoryYn == 'false'}">selected</c:if>><spring:message code="list.search.selectoption" text="선택옵션"/></option>
                                                        </select>
                                                    </label>
                                                </td>
                                                <td class="bg-light"><strong><spring:message code="list.search.search" text="검색어"/><%--검색어 입력--%></strong></td>
                                                <td>
                                                    <label>
                                                        <select class="form-control">
                                                            <option><spring:message code="list.search.optionname" text="옵션명"/></option>
                                                        </select>
                                                        <input type="text" class="form-control" name="optName" value="${searchValue.optName}" maxlength="150">
                                                    </label>
                                                    <label>
                                                        <span class="btn-group  bg-black-transparent-2 rounded">
                                                            <a href="/merchant/merchanext/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border reset_btn" data-change="widget-theme" data-theme="dark">
                                                                <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                            </a>
                                                         </span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                 </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-15" >
                                <div class="">
                                    <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="list.search.optionregistration" text="옵션등록"/><%--상품등록--%></span>
                                    </button>
                                    <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/><%--검색--%> </button>
                                    <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                    <%--<th><input type="checkbox"></th>--%>
                    <th class="text-center"><spring:message code="list.word.no" text="번호"/></th>
                    <th class="text-center"><spring:message code="list.word.optionname" text="옵션명칭"/></th>
                    <th class="text-center"><spring:message code="list.word.usestatus" text="사용상태"/></th>
                    <th class="text-center"><spring:message code="list.word.optionclassification" text="옵션구분"/></th>
                    <th class="text-center"><spring:message code="list.word.maximumselectablenumber" text="최대선택가능개수"/></th>
                    <th class="text-center"><spring:message code="list.word.status" text="상태"/></th>
                    <th class="text-center"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                    <th class="text-center"><spring:message code="list.word.modifieddate" text="수정일"/></th>
                    </thead>
                    <tbody>
                    <c:forEach var="item"  items="${tbStoreOption}"  varStatus="status">
                        <tr class="detailRow" storeOptNo="${item.storeOptNo}">
                         <%--   <td class="select-td checkbox_label" onclick="event.cancelBubble = true">
                                <input type="checkbox" name="chk" id="select${status.index}" class="checkbox d-none">
                                <label for="select${status.index}" class="input-label"> <i class="fa fa-square check_all_i"></i></label>
                            </td>--%>
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-left">${item.optName}</td>
                             <td class="text-center <c:if test="${item.dataStatus == 'STOP'}">text-red</c:if>">
                                 <c:if test="${item.dataStatus == 'OK'}">
                                     <spring:message code="list.detail.normal" text="정상"/>
                                 </c:if>
                                 <c:if test="${item.dataStatus == 'STOP'}">
                                     <spring:message code="list.detail.stop" text="정지"/>
                                 </c:if>
                             </td>
                            <td class="text-center">
                                <c:if test="${item.mandatoryYn == true}"><spring:message code="list.detail.requiredoption" text="필수옵션"/></c:if>
                                <c:if test="${item.mandatoryYn == false}"><spring:message code="list.detail.selectoption" text="선택"/></c:if>
                            </td>
                            <td class="text-center">${item.maxSelectCnt}</td>
                            <td class="text-center">${item.dataStatus}</td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--End Search-->
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

<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
</div>
<%--modal add end--%>

<%--modal add start--%>
<%--<div class="modal fade" id="searchOption_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="searchOption.jsp" %>
</div>--%>
<%--modal add end--%>
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

        $("#test").sortable();

        $(".insert_btn").click(function() {
            location.href = "${path}/merchant/merchanext/insert";
        });

        $(document).on("click",".detailRow",function() {
            let storeOptNo = $(this).attr("storeOptNo");
            location.href = "${path}/merchant/merchanext/detail?storeOptNo="+storeOptNo;
        });

        $(".datepicker").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
            afterShow: function() {
                $(".datepicker").css({
                    'z-index' : 9999
                });
            }
        });


        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="등록된 제휴본사가 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    if(data.searchHeadList.length == 0 || data.searchHeadList == null){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregisteredaffiliateheadquarters+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {
                        for(var i = 0 ; i < data.searchHeadList.length ; i++){
                            $(".searchHeadList").append(
                                " <li >" +
                                "     <label class=\"head_text\">\n" +
                                ""+data.searchHeadList[i].headName+""+
                                "<small style=\"color: green;\">["+data.searchHeadList[i].headNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click",function(){
            let headNo = $(".headNo").val();
            $(".selHeadNo").val(headNo);
            let req = convertFormToObj($('form.branch_search_form'));
            let noregistereddistributors = "<spring:message code="list.script.noregistereddistributors" text="등록된 총판이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/branch/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchBranchList").html("");
                    if(data.searchBranchList.length == 0 || data.searchBranchList == null){
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregistereddistributors+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {
                        for (var i = 0; i < data.searchBranchList.length; i++) {
                            $(".searchBranchList").append(
                                " <li >" +
                                "     <label class=\"branch_text\">\n" +
                                "" + data.searchBranchList[i].branchName + "" +
                                "<small style=\"color: green;\">[" + data.searchBranchList[i].branchNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName=" + data.searchBranchList[i].branchName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo=" + data.searchBranchList[i].branchNo + " value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        //가맹점 선택
        $(".searchStoreBtn").on("click",function(){
            let branchNo = $(".branchNo").val();
            $(".selBranchNo").val(branchNo);
            let req = convertFormToObj($('form.store_search_form'));
            let therearenoregisteredmerchants = "<spring:message code="list.script.therearenoregisteredmerchants" text="등록된 가맹점이 없습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            $.ajax({
                type: "POST",
                url: "${path}/api/search/store/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchStoreList").html("");
                    if(data.searchStoreList.length == 0 || data.searchStoreList == null){
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            therearenoregisteredmerchants+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    }else {

                        for(var i = 0 ; i < data.searchStoreList.length ; i++){
                            $(".searchStoreList").append(
                                " <li >" +
                                "     <label class=\"store_text\">\n" +
                                ""+data.searchStoreList[i].storeName+""+
                                "<small style=\"color: green;\">["+data.searchStoreList[i].storeNo+"]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName="+data.searchStoreList[i].storeName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo="+data.searchStoreList[i].storeNo+" value='"+apply+"'></div>\n" +
                                " </li>"
                            )
                        }
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            if(headNo == null || headNo =='') {
                swal({
                    title:pleaseselectanaffiliatedheadoffice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            } else {
                $(".searchBranchBtn").click();
            }

        });

        $(document).on("click",".storeName",function(){
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
            if(headNo == null || headNo =='') {
                swal({
                    title:pleaseselectanaffiliatedheadoffice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                });
            }  else {
                if(branchNo == null || branchNo =='') {
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
                    $(".searchStoreBtn").click();
                }
            }
        });

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".storeName").val("");
            $(".searchBranchList").html("");
            $(".searchStoreList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".storeName").attr("data-toggle","modal");
            $(".storeName").val("");
            $(".searchStoreList").html("");
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });

    });

    function searchFormFunction() {
        let pleaseselectastore = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
        if($(".storeNo").val() == "" || $(".storeNo").val() == null) {
            swal({
                title: pleaseselectastore,
                icon: "warning",
                buttons: [
                    cancel,
                    confirm
                ],
                dangerMode: true,
            });
        } else {
            $("#frmSearch").submit();
        }
    }


</script>
</body>
</html>
