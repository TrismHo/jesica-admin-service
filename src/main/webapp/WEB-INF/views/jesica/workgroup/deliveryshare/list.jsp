<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.workgroupmanagement.sharedeiliverygroup" text="배송그룹 공유"/></title>

</head>
<style>
    .nav {
        display: flex;
        flex-wrap: wrap;
        padding-left: 0;
        margin-bottom: 0;
        list-style: none;
    }
    .nav.nav-wizards-2 .nav-item {
        padding: 0 1rem;
    }
    .nav.nav-wizards-2 .nav-item .nav-link.active, .nav.nav-wizards-2 .nav-item .nav-link.completed {
        background: #348fe2;
        color: #fff;
    }
    .nav.nav-wizards-2 .nav-item:first-child .nav-link:after, .nav.nav-wizards-2 .nav-item:first-child .nav-link:before {
        left: 50%;
    }
    .nav.nav-wizards-2 .nav-item .nav-link .nav-text {
        text-align: center;
        font-weight: 600;
        font-size: .75rem;
        position: relative;
        z-index: 10;
        background: inherit;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .nav.nav-wizards-2 .nav-item:first-child .nav-link:after, .nav.nav-wizards-2 .nav-item:first-child .nav-link:before {
        left: 50%;
    }
    .nav.nav-wizards-2 .nav-item .nav-link.active:after, .nav.nav-wizards-2 .nav-item .nav-link.completed:after {
        width: calc(100% + 6rem);
    }
    .nav.nav-wizards-2 .nav-item .nav-link:after, .nav.nav-wizards-2 .nav-item .nav-link:before {
        content: '';
        position: absolute;
        left: -1rem;
        right: -1rem;
        height: 2px;
        top: 50%;
        margin-top: -1px;
        background-color: #e9ecef;
        -webkit-transition: all .2s linear;
        -moz-transition: all .2s linear;
        -ms-transition: all .2s linear;
        -o-transition: all .2s linear;
        transition: all .2s linear;
    }
    .nav.nav-wizards-2 .nav-item .nav-link.active, .nav.nav-wizards-2 .nav-item .nav-link.completed {
        background: #348fe2;
        color: #fff;
    }
    .nav.nav-wizards-2 .nav-item .nav-link {
        position: relative;
        color: #343a40;
        background: #e9ecef;
        -webkit-border-radius: 60px;
        border-radius: 60px;
    }
    .nav-link {
        display: block;
        padding: .5rem 1rem;
    }
    .nav.nav-wizards-2 .nav-item .nav-link:after {
        width: 0%;
        background: #348fe2;
    }
    .nav.nav-wizards-2 .nav-item:last-child .nav-link:after, .nav.nav-wizards-2 .nav-item:last-child .nav-link:before {
        right: 50%;
    }

    .table tbody{overflow-y:auto; overflow-x:hidden;  height:100px}
    .switcher label:before {
        content: '';
        display: block;
        width: 46px;
        height: 20px;
        background: #d5dbe0;
        border: 1px solid #d5dbe0;
        -webkit-border-radius: 46px;
        border-radius: 46px;
        -webkit-transition: all .2s linear;
        -moz-transition: all .2s linear;
        -ms-transition: all .2s linear;
        -o-transition: all .2s linear;
        transition: all .2s linear;
    }

    .switcher label:after {
        content: '';
        height: 15px;
        width: 24px;
        position: absolute;
        left: 2px;
        top: 2px;
        background: #fff;
        -webkit-border-radius: 24px;
        border-radius: 24px;
        -webkit-box-shadow: 0 1px 3px rgba(0,0,0,.15);
        box-shadow: 0 1px 3px rgba(0,0,0,.15);
        -webkit-transition: all .2s linear;
        -moz-transition: all .2s linear;
        -ms-transition: all .2s linear;
        -o-transition: all .2s linear;
        transition: all .2s linear;
    }
    .switcher label {
        display: block;
        margin: 0;
        width: 46px;
        height: 15px;
        position: relative;
    }
    .table td, .table th {
        padding: 4px;
        vertical-align: top;
        border-top: 1px solid #e4e7ea;
    }
    .custom-select {
        display: table-cell;
        width: 50%;
        font-weight: 400;
        line-height: 1.5;
        vertical-align: middle;
        background: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e) no-repeat right .75rem center/8px 10px;
        border: 1px solid #d5dbe0;
    }


    /* 카테고리(분류) 관리 */
    .category_sort .sort_list {
        overflow: hidden;
        list-style: none;
        padding-left: 0px;
    }

    .category_sort .sort_list > li:first-child {
        margin-left: 0;
        list-style: none;
        padding-left: 0px;
    }

    .category_sort .sort_list > li {
        float: left;
        max-width: 500px;
        min-width: 33%;
        min-width: 100%;
        line-height: 11px;
        width: auto;
    }

    .category_sort .sort_list .header {
        padding: 15px 0;
        background-color: #65717c;
        font-size: 14px;
        color: #fff;
        text-align: center
    }

    .category_sort .sort_body {
        overflow: auto;
        height: 300px;
        max-height: 400px;
        border: 1px solid #ccc;
        list-style: none;
        padding-left: 0px;
        background-color: #f9f9fc;
    }

    .category_sort .sort_body .active {
        background-color: #0a6ebd;
    }

    .category_sort .sort_body_list li:first-child {
        border-top: 0
    }

    .category_sort .sort_body_list li {
        padding : 0px;
        border-top: 1px solid #e1e1e1;
        list-style: none;
    }

    .category_sort .sort_body_list li .sort_content {
        overflow: hidden;
    }

    .category_sort .sort_body_list li:hover {
        background-color: #d3e3f2;
    }
    /*       .category_sort ._active {
               background-color: #d3e3f2;
           }*/

    .mapping_active {
        background-color: #d3e3f2;
    }
    .select_val_sub_mapping {
        background-color: #d3e3f2;
    }

    .category_sort .sort_body_list .category_title {
        float: left;
        padding: 4px 0
    }
    .category_sort .sort_body_list .category_bh_title {
        float: left;
        padding: 4px 0;
    /*    overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;*/
    }

    .category_sort .sort_body_list .category_right {
        float: right
    }

    .category_sort .sort_body_list .category_num {
        display: inline-block;
        width: 26px;
        height: 26px;
        /*background-color: black;*/
        background-color: #455663;
        line-height: 26px;
        color: #fff;
        text-align: center
    }
    .category_sort .sort_body_list .category_num_after {
        display: inline-block;
        width: 26px;
        height: 26px;
        border-radius: 100%;
        /*background-color: #455663;*/
        line-height: 26px;
        /*color: #fff;*/
        text-align: center
    }

    .category_sort .sort_ag .asc, .category_sort .sort_ag .desc {
        float: left;
        width: 26px;
        height: 26px;
        background: url(../../img/bg_psn_attr.png) 100% 0 no-repeat;
        text-indent: -9999px
    }

    .category_sort .sort_ag .desc {
        background-position: 100% 100%
    }

    .category_sort .sort_ag .sort_order {
        position: absolute;
        top: 4px;
        right: 22px;
        width: 103px;
        padding: 3px 0;
        border: 1px solid #ccc;
        background-color: #1f2b5d;
        font-weight: bold;
        color: #fff;
        text-align: center
    }
    @media (min-width: 576px) {
        .form-inline label {
            padding: 2px 18px;
             display: block;
            align-items: center;
            justify-content: center;
            margin-bottom: 0;
        }
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.workgroupmanagement" text="업무그룹관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.workgroupmanagement.sharedeiliverygroup" text="배송그룹 공유"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.workgroupmanagement.sharedeiliverygroup" text="배송그룹 공유"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 ">
                                <table class="table table-condensed table-bordered">
                                    <tbody class="h-25">
                                        <tr>
                                            <td class="bg-light  width-150" style="vertical-align: middle"><strong><spring:message code="list.search.workgroup" text="업무그룹"/></strong></td>
                                            <td style="">
                                               <%-- <label>
                                                    <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사명"/>" class="form-control background-white headName width-150 " >
                                                    <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                    <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                    <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                    <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                    <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                                </label>
                                                <label>
                                                    <input type="text" id="testInput" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판명"/>" class="form-control background-white branchName width-150" >
                                                </label>--%>
                                                   <%--<c:if test="${sessionScope.sessionKey.userRole == 0}">--%>
                                                       <label>
                                                           <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " >
                                                           <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">
                                                           <input type="hidden" class="headName" name="headNoText"  value="${searchValue.headNoText}">
                                                           <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                                           <input type="hidden" class="branchName" name="branchNoText" value="${searchValue.branchNoText}">
                                                       </label>
                                                       <label>
                                                           <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
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
                                                       </label>
                                                       <label>
                                                           <input type="text" data-toggle="<c:if test="${(searchValue.branchNo != null && searchValue.branchNo !='') || (sessionScope.sessionKey.headNo != null && sessionScope.sessionKey.headNo !='')}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" >
                                                       </label>
                                                   </c:if>
                                                   <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                                       <label>
                                                           <input type="text" data-toggle="modal" data-target="#head_search_modal"  name="headNoText"  value="${sessionScope.headName}" placeholder="<spring:message code="list.search.affiliatedheadquarters" text="제휴본사명"/>" class="form-control background-white headName width-100 " disabled>
                                                           <input type="hidden" class="headNo" name="headNo"  value="${sessionScope.sessionKey.headNo}">
                                                           <input type="hidden" class="headName" name="headNoText"  value="${sessionScope.headName}">
                                                           <input type="hidden" class="branchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                                                           <input type="hidden" class="branchName" name="branchNoText" value="${sessionScope.branchName}">
                                                       </label>
                                                       <label>
                                                           <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${sessionScope.branchName}"  placeholder="<spring:message code="list.search.distributorheadquarters" text="총판명"/>" class="form-control background-white branchName width-100" disabled>
                                                       </label>
                                                   </c:if>
                                               <%-- <label>
                                                    <input type="text"    data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal_" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
                                                </label>--%>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                           <%-- <div class="col-xl-12 col-md-12 ">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>업무그룹&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;</strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <label>
                                                    <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                                </label>
                                                <button class="btn-box-r bgGray p-5 width-100 line-height-25" onclick="fncGetListExcelBrs('frmSearch');"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </form>
            <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormTwoFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.contractordersearch" text="수주검색"/></button>
            <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormOneFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.placingordersearch" text="발주검색"/> </button>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xl-12 ui-sortable">

                        <div class="panel panel-inverse ">
                            <div class="panel-body p-0">
                                <div class="nav-wizards-container">
                                    <nav class="nav nav-wizards-2 mb-3 mt-3">
                                        <div class="nav-item col">
                                            <a class="nav-link deliveryshare_top active" href="#">
                                                <div class="nav-text"><spring:message code="list.word.orderinggroup" text="발주그룹"/></div>
                                            </a>
                                        </div>
                                        <div class="nav-item col">
                                            <a class="nav-link deliveryshare_top active" href="#">
                                                <div class="nav-text"><spring:message code="list.word.appliedordergroup" text="공유적용된 수주 그룹"/></div>
                                            </a>
                                        </div>
                                        <div>
                                            <a class="nav-link deliveryshare_top active" href="#">
                                                <div class="nav-text"></div>
                                            </a>
                                        </div>
                                        <div class="nav-item col">
                                            <a class="nav-link deliveryshare_top" href="#">
                                                <div class="nav-text"><spring:message code="list.word.ordergroup" text="수주 그룹"/></div>
                                            </a>
                                        </div>
                                    </nav>
                                </div>
                               <div class="card m-15">
                                    <div class="card-body">
                                        <spring:message code="list.word.searchworkgroup" text="1. 업무그룹 검색"/> <br>
                                        <spring:message code="list.word.searchandselectorderinggroup" text="2. 발주그룹 검색후 선택"/><br>
                                        <spring:message code="list.word.registertheordergrouptotheordergroup" text="3. 수주그룹을 해당 발주그룹에 등록"/><br><br>
                                        <div class="hljs-wrapper">
                                            <span class="text-red"><spring:message code="list.word.changesareappliedinrealtime" text=" * 변경시 실시간으로 적용됩니다."/> </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="nav-wizards-container">
                                    <nav class="nav nav-wizards-2 mb-3 mt-3">
                                        <div class="nav-item col">
                                            <form role="form" class="form-inline pull-left search_form width-full">
                                                <div class="panel panel-inverse width-full" data-sortable-id="form-slider-switcher-2">
                                                    <!-- begin panel-heading -->
                                                    <!-- end panel-heading -->
                                                    <!-- begin table -->
                                                    <table class="table table-bordered table-condensed table-td-valign-middle">
                                                        <tbody style="border:1px solid #e4e7ea;">
                                                        <tr>
                                                            <td class="bg-light"><spring:message code="list.word.groupsearch" text="그룹검색"/></td>
                                                            <td>
                                                                <input type="text" name="" style="border:1px solid black;" onkeypress="if(event.keyCode==13) {varietiesSearch(); return false;}" id="prevention_bh_search_val" value="" class="preventBhEnter searchValOne form-control " placeholder="<spring:message code="list.word.pleaseenteryoursearchterm" text="검색어를 입력해주세요."/>" data-live-search="true" data-style="btn-white" data-size="10" maxlength="150">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <div style="display: inline-block; margin: 5px;"><spring:message code="list.word.optionalgroupname" text="선택 그룹명 :"/></div>
                                                                <div class="select_name_text" dlvyNo="" style="display: inline-block;"></div>
                                                                <div class="category_sort">
                                                                    <ul class="sort_list">
                                                                        <li>
                                                                            <div class="category_sort">
                                                                                <ul class="sort_list ">
                                                                                    <li >
                                                                                        <div class="sort_body" style="height: 213px;">
                                                                                            <ul id="" class="sort_body_list select_val_sub deliveryListOne" style="cursor:pointer;list-style: none;padding-left: 0px;">

                                                                                            </ul>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>

                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <!-- end table -->
                                                </div>
                                            </form>
                                            <%----%>
                                        </div>
                                        <div class="nav-item col">
                                            <div class="category_sort">
                                                <ul class="sort_list ">
                                                    <li>
                                                        <div class="sort_body" style="height: 298px;">
                                                            <ul id="" class="sort_body_list deliveryShareList  select_val_sub p-0" style="cursor:pointer;list-style: none;">
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div>
                                              <span class="btn-group p-1  bg-black-transparent-2 rounded " style="background-color: #00b09f;">
                                                <a href="#" class="btn btn-sm btn-white btn-white-without-border hover catTr " onclick="delList()" data-change="widget-theme" data-theme="dark">
                                                    <i class="fas fa-lg fa-fw  fa-arrow-right"></i>
                                                </a>
                                            </span>
                                            <br>
                                            <span class="btn-group p-1  bg-black-transparent-2 rounded " style="background-color: #00b09f;">
                                                <a href="#" class="btn btn-sm btn-white btn-white-without-border hover catTr " onclick="addList()"  data-change="widget-theme" data-theme="dark">
                                                    <i class="fas fa-lg fa-fw  fa-arrow-left"></i>
                                                </a>
                                            </span>
                                        </div>

                                        <div class="nav-item col">
                                            <form role="form" class="form-inline pull-left search_form width-full">
                                                <div class="panel panel-inverse width-full" data-sortable-id="form-slider-switcher-2">
                                                    <!-- begin panel-heading -->
                                                    <!-- end panel-heading -->
                                                    <!-- begin table -->
                                                    <table class="table table-bordered table-condensed table-td-valign-middle">
                                                        <tbody style="border:1px solid #e4e7ea;">
                                                        <tr>
                                                            <td class="bg-light"><spring:message code="list.word.groupsearch" text="그룹검색"/></td>
                                                            <td>
                                                                <input type="text" name="" style="border:1px solid black;" onkeypress="if(event.keyCode==13) {varietiesSearch(); return false;}" id="prevention_bh_search_val" value="" class="preventBhEnter searchValTwo form-control " placeholder="<spring:message code="list.word.pleaseenteryoursearchterm" text="검색어를 입력해주세요."/>" data-live-search="true" data-style="btn-white" data-size="10" maxlength="150">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <div class="" style="display: inline-block;"></div>
                                                                <div class="category_sort">
                                                                    <ul class="sort_list">
                                                                        <li>
                                                                            <div class="category_sort">
                                                                                <ul class="sort_list">
                                                                                    <li>
                                                                                        <div class="sort_body" style="height: 200px;">
                                                                                            <ul id="" class="sort_body_list select_val_sub deliveryListTwo" style="cursor:pointer;list-style: none;padding-left: 0px;">

                                                                                            </ul>
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <!-- end table -->
                                                </div>
                                            </form>
                                        </div>
                                    </nav>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                <%--<div>
                    <button class="btn btn-primary float-right"><i class="fa fa-check m-r-5"></i>수정</button>
                </div>--%>
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
<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
</div>

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
    $(document).on("click",".headName",function(){
        $(".searchHeadBtn").click();
    });
    $(".searchValOne").keyup(function() {
        var value = $(this).val().toLowerCase();
        var array = [];
        array = value.split(' ');
        $(".deliveryListOne li").filter(function() {
            for(var i = 0; i < array.length ; i++) {
                var contain = $(this).text().toLowerCase().indexOf(array[i]) > -1;
                $(this).toggle(contain)
                if(contain == true){
                    break;
                }
            }
        });
    });

    $(".searchValTwo").keyup(function() {
        var value = $(this).val().toLowerCase();
        var array = [];
        array = value.split(' ');
        $(".deliveryListTwo li").filter(function() {
            for(var i = 0; i < array.length ; i++) {
                var contain = $(this).text().toLowerCase().indexOf(array[i]) > -1;
                $(this).toggle(contain)
                if(contain == true){
                    break;
                }
            }
        });
    });

    $(document).on("click",".dlvyList",function(){
        let dlvyNo = $(this).val();
        let dlvyName = $(this).attr("dlvyName");
        $(".select_name_text").text(dlvyName)
        $(".select_name_text").attr("dlvyNo",dlvyNo);
        acceptList(dlvyNo);
    });

    $(document).on("change",".acceptDelayTime",function(){
        let giveDlvyNo = $(this).attr("giveDlvyNo");
        let acceptDlvyNo = $(this).attr("acceptDlvyNo");
        let delayTime = $(this).val();

        $.ajax({
            type: 'get',
            url: "${path}/api/deliveryshare/delayTimeSet",
            /*dataType: "json",*/
            data:{
                "giveDlvyNo" : giveDlvyNo,
                "acceptDlvyNo" : acceptDlvyNo,
                "delayTime" : delayTime
            },
            success: function(data) {

            }
        });

    });

    function acceptList(dlvyNo) {

        let minute = "<spring:message code="list.script.minute" text="분"/>";
        let second = "<spring:message code="list.script.second" text="초"/>";
        let immediately = "<spring:message code="list.script.immediately" text="즉시"/>";
        let nothingfound = "<spring:message code="list.script.nothingfound" text="검색된 내용이 없습니다."/>";
        $.ajax({
            type: 'get',
            url: "${path}/api/deliveryshare/deliveryShareList",
            /*dataType: "json",*/
            data:{
                "dlvyNo" : dlvyNo
            },
            success: function(data) {
                let deliveryShareList = data.deliveryShareList;



                $(".deliveryShareList").html("");
                if (deliveryShareList.length  > 0 ){
                    for (var i = 0; i < deliveryShareList.length; i++ ){
                        let delayList = "";
                        var count = 0;
                        var min = 0;
                        while (count <= 600){
                            if(count == 0){
                                delayList = delayList +  "<option value="+count+">"+immediately+"</option>" ;
                            } else if(deliveryShareList[i].delayTime == count){
                                if(count > 60 ) {
                                    delayList = delayList +  "<option value="+count+" selected>"+count/60+" "+minute+"</option>" ;
                                } else {
                                    delayList = delayList +  "<option value="+count+" selected>"+count+" "+second+"</option>" ;
                                }
                            } else if(count > 60 ) {
                                delayList = delayList +  "<option value="+count+">"+count/60+" "+minute+"</option>" ;
                            } else {
                                delayList = delayList +  "<option value="+count+">"+count+" "+second+"</option>" ;
                            }

                            if(count < 60 ){
                                count = count +10;
                            }else {
                                count = count +60;
                            }

                        }


                        $(".deliveryShareList").append("  " +
                            "<li>" +
                            "       <label for=\"share"+deliveryShareList[i].acceptDlvyNo+"\" style=\"padding: 2px 18px; width: 100%;\">" +
                            "     <div class=\"sort_content\">\n" +
                            "         <input type=\"checkbox\" name=\"delList\" id=\"share"+deliveryShareList[i].acceptDlvyNo+"\" acceptDlvyNo="+deliveryShareList[i].acceptDlvyNo+" class=\"float-left m-t-3 m-r-10\" style=\"vertical-align: middle; \">\n" +
                            "         <span class=\"category_bh_title\">"+deliveryShareList[i].acceptDlvyName+"</span>\n" +
                            "         <div class=\"category_right add_contents_btn\\\">\n" +
                            "           <select style=\"width: 70px; height: 20px;\" class=\"acceptDelayTime\" giveDlvyNo="+deliveryShareList[i].giveDlvyNo+" acceptDlvyNo="+deliveryShareList[i].acceptDlvyNo+">" +
                            delayList+
                            "           </select>" +
                            "         </div>\n" +
                            "     </div>\n" +
                            "</label>" +
                            " </li>");
                    }
                } else {
                    $(".deliveryShareList").append("" +
                        "<li id=\"cate1Idx"+i+"\" style=\"padding: 2px 18px;\">\n" +
                        "    <div class=\"sort_content\">\n" +
                        "        <span value='-1' class=\"category_title\">"+nothingfound+"</span>\n" +
                        "        <div class=\"category_right add_contents_btn\">\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</li>" +
                        "")
                }

                $("input:checkbox[name='addList']").prop("disabled",false);
                $("input:checkbox[name='addList']").prop("checked",false);
                $("input:checkbox[name='addList']").each(function(){
                    for (var j = 0; j < deliveryShareList.length; j++ ){
                        if($(this).val() ==  deliveryShareList[j].acceptDlvyNo) {
                            $(this).attr("disabled", true);
                        }
                    }
                })

            }
        });
    }

    /*$("#testInput").autocomplete({
        source : function(request, response) {
            $.ajax({
                url : "${path}/api/get/branchTxt"
                , type : "GET"
                ,data: {branchName : $("#testInput").val()}
                ,contentType: "application/json;"
                ,dataType: "json"
                , success : function(data){ // 성공
                    console.log(data.branchTxtList);
                    response(
                        $.map(data.branchTxtList, function(item) {
                            return {
                                label : item.branchName+"["+item.branchNo+"]"    //목록에 표시되는 값
                                , value : item.branchName+"["+item.branchNo+"]"        //선택 시 input창에 표시되는 값
                                , headNo : item.headNo
                                , headName : item.headName
                                , branchNo : item.branchNo
                                , branchName : item.branchName
                            };
                        })
                    );    //response
                }
                ,
                error : function(){ //실패
                    alert("통신에 실패했습니다.");
                }
            });
        }
        , minLength : 1
        , autoFocus : false
        , select : function(evt, ui) {
            $(".headNo").val(ui.item.headNo)
            $(".headName").val(ui.item.headName+'['+ui.item.headNo+']')
            $(".branchNo").val(ui.item.branchNo)
            $(".branchName").val(ui.item.branchName+'['+ui.item.branchNo+']')
            $(".storeNo").val(ui.item.storeNo)
            $(".storeName").val(ui.item.storeName+'['+ui.item.storeNo+']')
        }
        , focus : function(evt, ui) {
            return false;
        }
        , close : function(evt) {
        }
    });*/



    function searchFormOneFunction() {
        let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
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
            submit("one")
        }
    }
    function searchFormTwoFunction() {
        let pleaseselectadistributor = "<spring:message code="list.script.pleaseselectadistributor" text="총판을 선택해주세요."/>";
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
            submit("two")

        }
    }


    function submit(shareListChk) {
        let branchNo =  $(".branchNo").val();
        let nothingfound = "<spring:message code="list.script.nothingfound" text="검색된 내용이 없습니다."/>";
        $.ajax({
            type: 'get',
            url: "${path}/api/delivery/findByBranchNo",
            /*dataType: "json",*/
            data:{
                "branchNo" : branchNo,
                "dlvyGroupType" : shareListChk
            },
            success: function(data) {
                let deliveryList = data.deliveryList;

                if(shareListChk == "one") {
                    shareListChk = "deliveryListOne";
                } else if(shareListChk == "two") {
                    shareListChk = "deliveryListTwo";
                }

                $("."+shareListChk).html("");
                if (deliveryList.length  > 0 ){
                    for (var i = 0; i < deliveryList.length; i++ ){
                        if(shareListChk == "deliveryListTwo") {
                            $("."+shareListChk).append("" +
                                "<li>" +
                                "<label for="+deliveryList[i].dlvyNo+">" +
                                "     <div class=\"sort_content\">\n" +
                                "         <input type=\"checkbox\" name=\"addList\" value="+deliveryList[i].dlvyNo+"  id="+deliveryList[i].dlvyNo+" dlvyNo="+deliveryList[i].dlvyNo+" dlvyName="+deliveryList[i].dlvyName+" class=\"float-left m-t-3 m-r-10\" style=\"vertical-align: middle; \">\n" +
                                "         <span class=\"category_bh_title\">"+deliveryList[i].dlvyName +"</span>\n" +
                                "         <div class=\"category_right add_contents_btn\\\">\n" +
                                "         </div>\n" +

                                "     </div>\n" +
                                "     </label>\n" +

                                " </li>")
                        } else {
                            $("."+shareListChk).append("" +
                                "<li id=\"cate1Idx"+i+"\" class=\"dlvyList\" value="+deliveryList[i].dlvyNo+" dlvyName="+deliveryList[i].dlvyName+" style=\"padding:2px 18px\" >\n" +
                                "    <div class=\"sort_content\" class=\"mapping_list \">\n" +
                                "        <span  class=\"category_title\">"+(i+1)+". "+deliveryList[i].dlvyName +"("+ deliveryList[i].dlvyNo+")</span>\n" +
                                "        <div class=\"category_right add_contents_btn\">\n" +
                                "        </div>\n" +
                                "    </div>\n" +
                                "</li>" +
                                "")
                        }

                    }
                } else {
                    //$("#varieties_list").append("<div value='-1' >등록된 기초 품종매핑이 없습니다.</div>");
                    $("."+shareListChk).append("" +
                        "<li id=\"cate1Idx"+i+"\">\n" +
                        "    <div class=\"sort_content\">\n" +
                        "        <span value='-1' class=\"category_title\">"+nothingfound+"</span>\n" +
                        "        <div class=\"category_right add_contents_btn\">\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "</li>" +
                        "")
                }
            }
        });
    }


    function addList() {
        let dlvyNo = $(".select_name_text").attr("dlvyNo");
        let selectaorderinggroup = "<spring:message code="list.script.selectaorderinggroup" text="발주그룹을 선택해주세요"/>";
        let pleaseselectagrouptoadd = "<spring:message code="list.script.pleaseselectagrouptoadd" text="추가할 그룹을 선택해주세요"/>";
        let selectthegrouptodelete = "<spring:message code="list.script.selectthegrouptodelete" text="삭제할 그룹을 선택하세요."/>";
        let addList = [];
        $("input:checkbox[name='addList']").each(function(){
            if($(this).is(":checked") == true) {
                addList.push(parseFloat($(this).val()))
            }
        });

        if(dlvyNo == "" || dlvyNo == null) {
            alert(selectaorderinggroup);
            return;
        } else if (addList.length == 0) {
            alert(pleaseselectagrouptoadd);
            return;
        }


        $.ajax({
            type: 'get',
            url: "${path}/api/deliveryshare/addList",
            data:{
                dlvyNo: dlvyNo,
                addList :JSON.stringify(addList).replace('[','').replace(']','')
            },
            success: function(data) {
                acceptList(dlvyNo);

            }
        });

    }

    function delList() {
        let dlvyNo = $(".select_name_text").attr("dlvyNo");

        let delList = [];
        $("input:checkbox[name='delList']").each(function(){
            if($(this).is(":checked") == true) {
                delList.push(parseFloat($(this).attr("acceptdlvyno")))
            }
        });
        if(dlvyNo == "" || dlvyNo == null) {
            alert(pleaseselectagrouptoadd);
            return;
        } else if (delList.length == 0) {
            alert(selectthegrouptodelete);
            return;
        }



        $.ajax({
            type: 'get',
            url: "${path}/api/deliveryshare/delList",
            data:{
                dlvyNo: dlvyNo,
                delList :JSON.stringify(delList).replace('[','').replace(']','')
            },
            success: function(data) {
                acceptList(dlvyNo);

            }
        });
    }

    $(() => {
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
                    if (data.searchHeadList.length == 0 || data.searchHeadList == null) {
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            noregisteredaffiliateheadquarters +
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {
                        for (var i = 0; i < data.searchHeadList.length; i++) {
                            $(".searchHeadList").append(
                                " <li >" +
                                "     <label class=\"head_text\">\n" +
                                "" + data.searchHeadList[i].headName + "" +
                                "<small style=\"color: green;\">[" + data.searchHeadList[i].headNo + "]</small>\n" +
                                "     </label>\n" +
                                "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName=" + data.searchHeadList[i].headName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo=" + data.searchHeadList[i].headNo + " value='"+apply+"'></div>\n" +
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

        $(document).on("click",".branchName",function(){
            let pleaseselectanaffiliatedheadoffice = "<spring:message code="list.script.pleaseselectanaffiliatedheadoffice" text="제휴본사를 선택해주세요."/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let headNo = $(".headNo").val();
            if(headNo == null || headNo =='') {
                swal({
                    title: pleaseselectanaffiliatedheadoffice,
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
                    title: pleaseselectanaffiliatedheadoffice,
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


        $(".insert_btn").click(function() {
            location.href = "${path}/merchant/merchandise/insert";
        });

        $(".detailRow").click(function() {
            location.href = "${path}/merchant/merchandise/detail";
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
