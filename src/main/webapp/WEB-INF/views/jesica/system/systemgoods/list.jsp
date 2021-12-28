<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.system.systemmerchandise" text="시스템 상품"/></title>

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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.system" text="시스템 운영"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.system.systemmerchandise" text="시스템 상품"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.system.systemmerchandise" text="시스템 상품"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <div class="search-box">
                <div class="inner-search-box p-15">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 ">
                            <form name="frmSearch" id="frmSearch">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.detailedsetting" text="상세설정"/></strong></td>
                                        <td>
                                            <label>
                                               <%-- <select id="systemCategory1" class="form-control catCode1">
                                                    <option value="">선택</option>
                                                    <c:forEach var="item"  items="${categoryList}"  varStatus="status">
                                                        <option value="${item.catCode}">${item.catName}</option>
                                                    </c:forEach>
                                                </select>
                                                <select id="systemCategory2" class="form-control catCode2" >
                                                    <option value="">선택</option>
                                                </select>
                                                <select id="systemCategory3" class="form-control catCode3" >
                                                    <option value="">선택</option>
                                                </select>--%>
                                                   <c:if test="${selCatLevel == 1}">
                                                       <select id="systemCategory1" class="form-control catCode" >
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                           <c:forEach var="item"  items="${catList1}"  varStatus="status">
                                                               <option value="${item.catCode}" <c:if test="${item.catCode == catCode1}">selected</c:if>>${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                       <select id="systemCategory2" class="form-control catCode2">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                           <c:forEach var="item"  items="${catList2}"  varStatus="status">
                                                               <option value="${item.catCode}">${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                       <select id="systemCategory3" class="form-control catCode3">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                       </select>
                                                   </c:if>
                                                   <c:if test="${selCatLevel == 2}">
                                                       <select id="systemCategory1" class="form-control catCode" >
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                           <c:forEach var="item"  items="${catList1}"  varStatus="status">
                                                               <option value="${item.catCode}" <c:if test="${item.catCode == catCode1}">selected</c:if>>${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                       <select id="systemCategory2" class="form-control catCode2">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                           <c:forEach var="item"  items="${catList2}"  varStatus="status">
                                                               <option value="${item.catCode}" <c:if test="${item.catCode == catCode2}">selected</c:if> >${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                       <select id="systemCategory3" class="form-control catCode3">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                           <c:forEach var="item"  items="${catList3}"  varStatus="status">
                                                               <option value="${item.catCode}">${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                   </c:if>
                                                   <c:if test="${selCatLevel == 3}">
                                                       <select id="systemCategory1" class="form-control catCode" name="catCode">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/></option>
                                                           <c:forEach var="item"  items="${catList1}"  varStatus="status">
                                                               <option value="${item.catCode}" <c:if test="${item.catCode == catCode1}">selected</c:if>>${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                       <select id="systemCategory2" class="form-control catCode2">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/><</option>
                                                           <c:forEach var="item"  items="${catList2}"  varStatus="status">
                                                               <option value="${item.catCode}" <c:if test="${item.catCode == catCode2}">selected</c:if> >${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                       <select id="systemCategory3" class="form-control catCode3">
                                                           <option value=""  style="color: #d3d8dd;"><spring:message code="list.search.selected" text="선택"/><</option>
                                                           <c:forEach var="item"  items="${catList3}"  varStatus="status">
                                                               <option value="${item.catCode}" <c:if test="${item.catCode == catCode3}">selected</c:if> >${item.catName}</option>
                                                           </c:forEach>
                                                       </select>
                                                   </c:if>
                                                <input type="hidden" name="catCode" value="">
                                            </label>
                                           <%-- <label>
                                                <select class="form-control">
                                                    <option>구분전체</option>
                                                </select>
                                            </label>--%>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.productstatus" text="상품상태"/></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control dataStatus" name="dataStatus">
                                                    <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                    <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>><spring:message code="list.search.normal" text="정상"/></option>
                                                    <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>><spring:message code="list.search.stop" text="정지"/></option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/></strong></td>
                                        <td style="width:50%">
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어"/></strong></td>
                                        <td colspan=>
                                            <label>
                                                <select class="form-control">
                                                    <option><spring:message code="list.search.merchandisename" text="상품명"/><%--<spring:message code="merchandise.search9.option1" text="default text"/>--%></option>
                                                </select>
                                                <input type="text" class="form-control width-150" name="goodsName" value="${searchValue.goodsName}">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <br>
                        <div class="col-xl-12 col-md-12 m-t-15">
                            <div class="">
                                <button type="button" class="insert_btn btn btn-primary float-left m-b-10">
                                    <span class="fa fa-plus">&nbsp;<spring:message code="list.search.productregistration" text="상품등록"/><%--상품등록--%></span>
                                </button>
                                <%--<div id="detailOptionBtn" class="arrow-down "></div>--%>
                                <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/><%--검색--%> </button>
                                <div class="d-block d-lg-inline-flex float-right m-r-10 m-t-5">
                                    <%--   <div class="dt-buttons btn-group flex-wrap">
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
               <%-- <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12">
                                <form name="frmSearch" id="frmSearch">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>상세설정&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;&lt;%&ndash;가맹점선택&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select id="test1" class="form-control">
                                                    <c:forEach var="item"  items="${categoryList}"  varStatus="status">
                                                    <option value="${item.catCode}">(Lv ${item.catLevel}) ${item.catName}</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label>
                                                <select class="form-control">
                                                    <option>구분전체</option>
                                                </select>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong>상품상태&lt;%&ndash;<spring:message code="merchandise.search8" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control dataStatus" name="dataStatus">
                                                    <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>>전체</option>
                                                    <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>>정상</option>
                                                    <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>>정지</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td class="bg-light" style="width:10%"><strong><spring:message code="merchandise.search8" text="등록기간"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                        <td style="width:50%">
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="검색어 입력"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td colspan=>
                                            <label>
                                                <select class="form-control">
                                                    <option>상품명&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                </select>
                                                <input type="text" class="form-control width-150" name="goodsName" value="${searchValue.goodsName}">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-15">
                                <div class="">
                                    <button class="btn-box-r bgGray float-right width-100 p-5">
                                        <i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/>
                                    </button>
                                    <button class="insert_btn btn btn-primary float-left m-r-10 width-100" type="button">
                                        <i class="fa fa-plus"></i> 상품등록&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;
                                    </button>
                                    <button class="btn-box-r bgGray float-left m-r-10 width-100 p-5" type="button" data-toggle="modal" data-target="#upload_modal">
                                        <i class="fa fa-plus"></i> 엑셀등록&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;
                                    </button>
                                    <button class="btn-box-r bgGray float-left m-r-10 p-5 width-100" type="button" data-toggle="modal" data-target="#add_modal">
                                        <i class="fa fa-download"></i> 엑셀양식&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped">
                    <thead>
                        <tr class="text-center">
                            <th><spring:message code="list.word.no" text="순번"/></th>
                            <th><spring:message code="list.word.categorycode" text="카테고리 코드"/></th>
                            <th><spring:message code="list.word.image" text="이미지"/></th>
                            <th><spring:message code="list.word.productname" text="상품명"/></th>
                            <th><spring:message code="list.word.productprice" text="상품가격"/></th>
                            <th><spring:message code="list.word.taxation" text="과세여부"/></th>
                            <th><spring:message code="list.word.barcode" text="바코드"/></th>
                            <th><spring:message code="list.word.usestatus" text="사용상태"/></th>
                            <th><spring:message code="list.word.registrationdate" text="등록일"/></th>
                            <th><spring:message code="list.word.modifieddate" text="수정일"/></th>
                        </tr>
                    </thead>
                    <tbody>
                      <%--  <c:forEach begin="1" end="10" varStatus="idx">
                            <tr class="text-center detailRow">
                                <td>${idx.index}</td>
                                <td><img src="../../../img/manna-planet_logo.png" width="70px;" height="30px;"></td>
                                <td><img src="../../../img/manna-planet_logo.png" width="70px;" height="30px;"></td>
                                <td>매운족발</td>
                                <td>족발·보쌈</td>
                                <td>매운족발</td>
                                <td>정상</td>
                                <td>2021-01-08 12:36:30</td>
                            </tr>
                        </c:forEach>--%>
                      <c:forEach var="item"  items="${tbSystemGoods}"  varStatus="status">
                          <tr class="detailRow" goodsNo="${item.goodsNo}">
                              <td class="text-center" >${status.index + 1}</td>
                              <td>
                                  <span class="orangeColor d-block">${item.systemCategory.catCode}</span>
                                  <span >${item.systemCategory.catName}</span>
                              </td>
                              <td class="text-center">
                                  <c:url var="url" value=""><c:param name="output" value="${item.imgFileSmall}" /></c:url>
                                  <c:set var="url" value="${fn:substringAfter(url, '=')}" />
                                 <img style="width: 80px;" class="systemImg" src="/api/img/fileLoad?filePath=${url}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'" ></td>
                              <td class="text-center">${item.goodsName}</td>
                              <td class="text-right"><fmt:formatNumber value="${item.goodsPrice}" pattern="#,###" /> <spring:message code="list.word.won" text=" 원"/></td>
                              <td class="text-center">
                                  <c:if test="${item.taxYn == true}"><spring:message code="list.word.taxation" text="과세"/></c:if>
                                  <c:if test="${item.taxYn == false}"><spring:message code="list.word.taxfree" text="비과세"/></c:if></td>
                              <td class="text-center">${item.barcode}</td>
                              <td class="text-center <c:if test="${item.dataStatus == 'STOP'}">text-red</c:if>">
                                  <c:if test="${item.dataStatus == 'OK'}">
                                      <spring:message code="list.detail.normal" text="정상"/>
                                  </c:if>
                                  <c:if test="${item.dataStatus == 'STOP'}">
                                      <spring:message code="list.detail.stop" text="정지"/>
                                  </c:if>
                              </td>
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
<%--    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>--%>
    <!-- end scroll to top btn -->
</div>

<%--modal search start--%>
<div class="modal fade" id="upload_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="upload.jsp" %>
</div>
<%--modal search end--%>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>

/*
    let url = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFileSmall}");

    $(".systemImg").attr("src",url);*/
    $(() => {

        $("#systemCategory1").on("change",function(){
            let parentCatCode = $(this).val();
            searchSystemCate(parentCatCode,2);
        });

        $("#systemCategory2").on("change",function(){
            let parentCatCode = $(this).val();
            searchSystemCate(parentCatCode,3);
        });

        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });

        $(".date").datepicker({
            altFieid: ".startDate",
            altFormat: "yyyy-mm-dd",
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
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

        $(".insert_btn").click(function () {
            location.href = "${path}/system/systemgoods/insert";
        });

        $(document).on("click",".detailRow",function() {
            let goodsNo = $(this).attr("goodsNo");
            location.href = "${path}/system/systemgoods/detail?goodsNo="+goodsNo;
        });

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
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

    function searchFormFunction() {
        let catCode1 = $(".catCode1").val();
        let catCode2 = $(".catCode2").val();
        let catCode3 = $(".catCode3").val();

        if(catCode2 == "") {
            $("input[name=catCode]").val(catCode1);
        } else if (catCode3 == "") {
            $("input[name=catCode]").val(catCode2);
        } else {
            $("input[name=catCode]").val(catCode3);
        }

        $("#frmSearch").submit();
    }

function searchSystemCate(parantCatCode,level){
    let select = "<spring:message code="list.script.select" text="선택"/>";
    $.ajax({
        type: "POST",
        url: "${path}/api/search/systemCate/list",
        data: JSON.stringify({
            parentCatCode : parantCatCode,
            catLevel : level
        }),
        contentType: "application/json;",
        dataType: "json",
        success: function (data) {
            let searchCateList = data.searchCateList;
            if(level == 2) {
                $("#systemCategory2").html("<option value=''>"+select+"</option>");
                $("#systemCategory3").html("<option value=''>"+select+"</option>");
                for (var i = 0 ; i < searchCateList.length ; i++) {
                    $("#systemCategory2").append("<option value="+searchCateList[i].catCode+">"+searchCateList[i].catName+"</option>")
                }

            } else if (level == 3) {
                $("#systemCategory3").html("<option value=''>"+select+"</option>");
                for (var i = 0 ; i < searchCateList.length ; i++) {
                    $("#systemCategory3").append("<option value="+searchCateList[i].catCode+">"+searchCateList[i].catName+"</option>")
                }
            }
        }
    });
}
</script>
</body>
</html>
