<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.merchantsetting.merchandise.group" text="상품그룹"/></title>
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
        <div class="panel panel-inverse m-t-1 p-0">
            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.merchantsetting.merchandise.group" text="상품그룹"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.merchantsetting.merchandise.group" text="상품그룹"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12">
                                <form name="frmSearch" class="frmSearch" id="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <td class="bg-light"><strong><spring:message code="list.search.franchiseselection" text="가맹점 선택"/><%--가맹점선택--%></strong></td>
                                        <td>
                                         <%--   <label>
                                                <input type="text" data-toggle="modal" data-target="#head_search_modal" name="headNoText"  value="${searchValue.headNoText}" placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-200" readonly>
                                                <input type="hidden" class="headNo" name="headNo"  value="${searchValue.headNo}">


                                            </label>
                                            <label>
                                                <input type="text" data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#branch_search_modal" name="branchNoText" value="${searchValue.branchNoText}"  placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-200" readonly>
                                                <input type="hidden" class="branchNo" name="branchNo" value="${searchValue.branchNo}">
                                            </label>
                                            <label>
                                                <input type="text" data-toggle="<c:if test="${searchValue.storeNo != null && searchValue.storeNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-200" readonly>
                                                <input type="hidden" class="storeNo" name="storeNo" value="${searchValue.storeNo}">
                                            </label>--%>
                                            <input type="hidden" class="catLevelSearch" name="catLevel"  value="${searchValue.catLevel}">
                                            <input type="hidden" class="parentCatNoSearch" name="parentCatNo"  value="${searchValue.parentCatNo}">
                                            <input type="hidden" class="catNameSearch" name="catName"  value="${searchValue.catName}">
                                            <input type="hidden" class="parent1" name="parent1"  value="${searchValue.parent1}">
                                            <input type="hidden" class="parent2" name="parent2"  value="${searchValue.parent2}">
                                            <input type="hidden" class="parent1No" name="parent1No"  value="${searchValue.parent1No}">
                                            <input type="hidden" class="parent2No" name="parent2No"  value="${searchValue.parent2No}">
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
                                                 <input type="text"  id="testInput"  data-toggle="<c:if test="${searchValue.branchNo != null && searchValue.branchNo !=''}">modal</c:if>" data-target="#store_search_modal" name="storeNoText" value="${searchValue.storeNoText}" placeholder="<spring:message code="list.search.franchiseeheadquarters" text="가맹점 입력"/>" class="form-control background-white storeName width-100">
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
                                            <label>
                                                <span class="btn-group  bg-black-transparent-2 rounded">
                                                    <a href="${path}/merchant/merchangroup/list" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                        <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                    </a>
                                                </span>
                                            </label>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <ul class="nav nav-tabs m-t-5">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.word.productgroupsetting" text="상품그룹 설정"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.word.productgroupsetting" text="상품그룹 설정"/></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.word.productsettingsbyproductgroup" text="상품그룹별 상품 설정"/></span>
                        <span class="d-sm-block d-none"><spring:message code="list.word.productsettingsbyproductgroup" text="상품그룹별 상품 설정"/></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="panel-body p-0">
                        <div class="row">
                          <%--  <div class="col-xl-3 ui-sortable">
                                <div class="panel panel-inverse" data-sortable-id="tree-view-2">
                                    <div class="panel-heading ui-sortable-handle">
                                        <h4 class="panel-title">카테고리 ( 카테고리번호 )</h4>
                                    </div>
                                    <div class="panel-body">

                                        <div id="jstree-merchandise" class="jstree jstree-2 jstree-default"></div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="col-xl-7 ui-sortable">
                                <div class="panel panel-inverse" >
                                    <div class="panel-heading ui-sortable-handle">
                                        <h4 class="panel-title"><spring:message code="list.word.categoryinformation" text="카테고리 정보"/></h4>
                                    </div>
                                    <div class="panel-body p-0">
                                            <li class="navbar-form">
                                                <ol class="breadcrumb float-xl-left">
                                                    <div class="d-flex">
                                                        <div class="btn-group">
                                                            <a href="javascript:;" class="btn btn-white btn-white-without-border level_one_btn">

                                                                <c:if test="${searchValue.catLevel == 'LV1' }">
                                                                    <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i><spring:message code="list.word.toplevel" text="최상위"/>
                                                                </c:if>
                                                                <c:if test="${searchValue.catLevel != 'LV1'}">
                                                                    <i class="fa fa-folder m-r-15" style="color: #b4bb6e;"></i><spring:message code="list.word.toplevel" text="최상위"/>
                                                                </c:if>
                                                            </a>
                                                            <c:if test="${searchValue.catLevel == 'LV1'}">
                                                            </c:if>
                                                            <c:if test="${searchValue.catLevel == 'LV2'}">
                                                                <a href="javascript:;" class="btn btn-white btn-white-without-border level2_btn"  parent1No="${searchValue.parent1No}">
                                                                    <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i> ${searchValue.parent1}
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${searchValue.catLevel == 'LV3'}">
                                                                <a href="javascript:;" class="btn btn-white btn-white-without-border level2_btn"  parent1No="${searchValue.parent1No}">
                                                                    <i class="fa fa-folder m-r-15" style="color: #b4bb6e;"></i> ${searchValue.parent1}
                                                                </a>
                                                                <a href="javascript:;" class="btn btn-white btn-white-without-border level3_btn" parent2No="${searchValue.parent2No}" data-change="widget-theme" data-theme="dark">
                                                                    <i class="fa fa-folder-open m-r-15" style="color: #b4bb6e;"></i>${searchValue.parent2}
                                                                </a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </ol>
                                            </li>
                                            <br>
                                            <span class="pull-right"><spring:message code="list.word.categorylevel" text="카테고리 레벨"/> : <font id="fontTxt">${searchValue.catLevel}</font></span>
                                            <br>
                                            <table id="testTable" class="table table-bordered w-100 table-striped">
                                                <thead class="text-center">
                                                <tr>
                                                    <th ></th>
                                                    <th><spring:message code="list.word.categoryname" text="카테고리명"/></th>
                                                    <th><spring:message code="list.word.categorydetails" text="카테고리 상세값"/></th>
                                                    <th width="80"><spring:message code="list.word.datastate" text="데이터 상태"/></th>
                                                    <th ><spring:message code="list.word.memo" text="메모"/></th>
                                                    <th width="164"></th>
                                                </tr>
                                                </thead>
                                                <tbody id="catBody">
                                                <c:forEach var="item"  items="${tbStoreCategory}"  varStatus="status">
                                                    <tr >
                                                        <td>
                                                            <c:if test="${searchValue.catLevel == 'LV3'}">
                                                            <span class="btn-group p-1 m-l-15 bg-black-transparent-2 rounded " >
                                                                <div href="#" class="btn btn-sm btn-white btn-white-without-border " parent1="" parent1No="" parent2="" parent2No="" catLevel="${item.catLevel}" parentCatNo="${item.storeCatNo}" catName="${item.catName}" storeCatNo="${item.storeCatNo}" data-change="widget-theme" data-theme="dark" >
                                                                    <i class="fas fa-lg fa-fw m-r-5 fa-exclamation-triangle" style="background-color: re"></i><spring:message code="list.word.thisisthelastcategory" text="마지막 카테고리입니다"/>
                                                                </div>
                                                            </span>
                                                            </c:if>
                                                           <%-- <c:if test="${searchValue.catLevel != 'LV3' && item.store.storeType.ordinal() != 1}">
                                                            <span class="btn-group p-1 m-l-15 bg-black-transparent-2 rounded " style="background-color: #00b09f;">
                                                                <a href="#" class="btn btn-sm btn-white btn-white-without-border hover catTr" parent1="" parent1No="" parent2="" parent2No="" catLevel="${item.catLevel}" parentCatNo="${item.storeCatNo}" catName="${item.catName}" storeCatNo="${item.storeCatNo}" data-change="widget-theme" data-theme="dark" >
                                                                    <i class="fas fa-lg fa-fw m-r-5 fa-search-plus"></i><spring:message code="list.word.select" text="선택"/>
                                                                </a>
                                                            </span>
                                                            </c:if>--%>
                                                            <input type="hidden" class="form-control width-full storeCatNoTxt" value="${item.storeCatNo}">
                                                        <input type="hidden" class="storeNoTxt" value="${item.storeNo}" ></td>
                                                        <td><input type="text" class="form-control width-full catNameTxt" value="${item.catName}" maxlength="75"></td>
                                                        <td><input type="text" class="form-control width-full catValueTxt" value="${item.catValue}" maxlength="15">
                                                            <input type="hidden" class="catLevel catLevelSelect" value="${item.catLevel.ordinal()}">
                                                            <input type="hidden" class="form-control width-full viewOrderTxt" value="${item.viewOrder}">
                                                            <input type="hidden" class="form-control width-full parentCatNo parentCatNoTxt"  value="${item.parentCatNo}" <c:if test="${item.catLevel.ordinal() == 1}">disabled</c:if>>
                                                        </td>
                                                        <td>
                                                            <select class="form-control  width-full dataStatusSelect">
                                                                <option value="0" <c:if test="${item.dataStatus.ordinal() == 0}">selected</c:if>><spring:message code="list.word.delete" text="삭제"/></option>
                                                                <option value="1" <c:if test="${item.dataStatus.ordinal() == 1}">selected</c:if>><spring:message code="list.word.normal" text="정상"/></option>
                                                                <option value="2" <c:if test="${item.dataStatus.ordinal() == 2}">selected</c:if>><spring:message code="list.word.stop" text="정지"/></option>
                                                            </select>
                                                        </td>
                                                        <td><input type="text" class="form-control width-full memoTxt" value="${item.memo}" maxlength="75"> </td>
                                                        <td>
                                                            <button type="button" class="btn btn-primary update_btn"><i class="fa fa-check m-r-5"></i><spring:message code="list.word.update" text="수정"/></button>
                                                            <button type="button" class="btn btn-danger del_btn" storeCatNo="${item.storeCatNo}" ><i class="fa fa-trash m-r-5"></i><spring:message code="list.word.delete" text="삭제"/></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-5 ui-sortable">
                                <div class="panel panel-inverse" >
                                    <div class="panel-heading ui-sortable-handle">
                                        <h4 class="panel-title"><spring:message code="list.word.categoryinformationregistration" text="카테고리 정보등록"/></h4>
                                    </div>
                                    <div class="panel-body p-0">
                                        <form class="insert_form" id="insert_form">
                                            <input type="hidden" id="storeNoTxt" name="storeNo" value="">
                                            <input type="hidden" name="catLevel" value="${searchValue.catLevel}">
                                            <input type="hidden" class="form-control width-full parentCatNo" name="parentCatNo" value="${searchValue.parentCatNo}" >
                                            <input type="hidden" class="form-control width-full" name="viewOrder" value="0" numberOnly>
                                            <table id="testTable1" class="table table-bordered w-100 table-striped">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th><spring:message code="list.word.categoryname" text="카테고리명"/></th>
<%--                                                        <th>카테고리 상세값</th>--%>
                                                        <%--<th>카테고리 레벨</th>--%>
<%--                                                        <th  width="90">데이터 상태</th>--%>
                                                        <th ><spring:message code="list.word.memo" text="메모"/></th>
                                                        <th width="120"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td><input type="text" class="form-control width-full" name="catName" maxlength="75"></td>
<%--                                                    <td><input type="text" class="form-control width-full" name="catValue"></td>--%>
                                                      <%--  <select class="form-control catLevel" name="catLevel" >
                                                            <option value="1" <c:if test="${searchValue.catLevel == 'LV1'}">selected</c:if>>LV1</option>
                                                            <option value="2" <c:if test="${searchValue.catLevel == 'LV2'}">selected</c:if>>LV2</option>
                                                            <option value="3" <c:if test="${searchValue.catLevel == 'LV3'}">selected</c:if>>LV3</option>
                                                        </select>--%>
                                                    <input type="hidden" name="catValue" value="">
                                                        <input type="hidden" name="dataStatus" value="1">
<%--                                                    <td>--%>
<%--                                                        <select class="form-control width-full" name="dataStatus">--%>
<%--                                                            <option value="0">삭제</option>--%>
<%--                                                            <option value="1" selected>정상</option>--%>
<%--                                                            <option value="2">정지</option>--%>
<%--                                                        </select>--%>
<%--                                                    </td>--%>
                                                    <td><input type="text" class="form-control width-full" name="memo" maxlength="75"></td>
                                                    <td><button type="button" class="btn btn-green btn_insert"><i class="fa fa-plus m-r-5"></i><spring:message code="list.word.enrollment" text="등록"/></button></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
                       <%-- <table id="testTable" class="table table-bordered w-100 table-striped">
                            <thead class="text-center">
                                <th>그룹분류</th>
                                <th>그룹번호</th>
                                <th>그룹명</th>
                                <th>상품개수</th>
                                <th>노출여부</th>
                                <th>처리</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">
                                        <select class="form-control">
                                            <option>매장</option>
                                            <option>온라인</option>
                                            <option>상품통계</option>
                                            <option>프린터</option>
                                        </select>
                                    </td>
                                    <td></td>
                                    <td><input type="text" class="form-control width-full"></td>
                                    <td></td>
                                    <td></td>
                                    <td><button type="button" class="btn btn-green"><i class="fa fa-plus m-r-5"></i>그룹 등록</button></td>
                                </tr>
                            <c:forEach begin="1" end="2" varStatus="status">
                                <tr class="detailRow">
                                    <td class="text-center">
                                        <select class="form-control">
                                            <option>매장</option>
                                            <option>온라인</option>
                                            <option>상품통계</option>
                                            <option>프린터</option>
                                        </select>
                                    </td>
                                    <td class="text-center">635${status.index}</td>
                                    <td><input type="text" class="form-control width-full"></td>
                                    <td class="text-center">${status.index}</td>
                                    <td class="text-center"><input type="checkbox"></td>
                                    <td>
                                        <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>그룹 수정</button>
                                        <button type="button" class="btn btn-danger"><i class="fa fa-trash m-r-5"></i>그룹 삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>--%>
                    </div>
                </div>
                <%--<div class="tab-pane fade" id="default-tab-2">
                    <form name="frmSearch">
                        <div class="search-box">
                            <div class="inner-search-box p-5">
                                <div class="row">
                                    <!-- begin col-3 -->
                                    <div class="col-xl-12 col-md-12">
                                        <table class="table table-condensed table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td class="bg-light"><strong>상품등록기간</strong></td>
                                                    <td>
                                                        <label>
                                                            <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                        </label>
                                                        ~
                                                        <label>
                                                            <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                        </label>
                                                    </td>
                                                    <td class="bg-light"><strong>상품상태</strong></td>
                                                    <td>
                                                        <label>
                                                            <select class="form-control">
                                                                <option>정상+정지</option>
                                                                <option>정상</option>
                                                                <option>정지</option>
                                                            </select>
                                                        </label>
                                                    </td>
                                                    <td class="bg-light"><strong>온라인 판매상태</strong></td>
                                                    <td>
                                                        <label>
                                                            <select class="form-control">
                                                                <option>전체</option>
                                                                <option>정상</option>
                                                                <option>정지(품절)</option>
                                                                <option>판매안함</option>
                                                            </select>
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light"><strong>매장판매상태</strong></td>
                                                    <td>
                                                        <label>
                                                            <select class="form-control">
                                                                <option>전체</option>
                                                                <option>정상</option>
                                                                <option>정지(품절)</option>
                                                                <option>판매안함</option>
                                                            </select>
                                                        </label>
                                                    </td>
                                                    <td class="bg-light"><strong>그룹 등록 구분</strong></td>
                                                    <td>
                                                        <label>
                                                            <select class="form-control">
                                                                <option>전체</option>
                                                                <option>등록</option>
                                                                <option>미등록</option>
                                                            </select>
                                                        </label>
                                                    </td>
                                                    <td class="bg-light"><strong>검색어 입력</strong></td>
                                                    <td>
                                                        <label>
                                                            <select class="form-control">
                                                                <option>상품명</option>
                                                                <option>바코드</option>
                                                            </select>
                                                            <input type="text" class="form-control">
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
                    <div class="row">
                        <div class="col-xl-12 col-lg-6">
                            <div class="panel panel-inverse p-0">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-center">상품그룹</h4>
                                </div>
                                <div class="height-300 overflow-auto">
                                    <table class="table table-bordered border-bottom text-center">
                                        <thead>
                                            <th>선택</th>
                                            <th>그룹구분</th>
                                            <th>그룹명</th>
                                            <th>정렬</th>
                                        </thead>
                                        <tbody>
                                        <c:forEach begin="1" end="2" varStatus="idx">
                                            <tr id="${idx.index}">
                                                <td><input type="radio"></td>
                                                <td><span class="text-green">온라인</span></td>
                                                <td>[6342${idx.index}] / dddd44</td>
                                                <td>
                                                    <a class="btn btn-out width-30 height-25 cursor-pointer">
                                                        <span class="fa fa-angle-double-up align-sub"></span>
                                                    </a>
                                                    <a class="btn btn-out width-30 height-25 cursor-pointer">
                                                        <span class="fa fa-angle-up align-sub"></span></a>
                                                    <a class="btn btn-out width-30 height-25 cursor-pointer">
                                                        <span class="fa fa-angle-down align-sub"></span>
                                                    </a>
                                                    <a class="btn btn-out width-30 height-25 cursor-pointer">
                                                        <span class="fa fa-angle-double-down align-sub"></span>
                                                    </a>
                                                </td>
                                                    &lt;%&ndash;<td>
                                                        <button type="button" class="btn btn-primary updateBtn">수정</button>
                                                        <button type="button" class="btn btn-danger removeBtn">삭제</button>
                                                    </td>&ndash;%&gt;
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6">
                            <div class="panel panel-inverse p-0">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-center">상품그룹별 상품</h4>
                                </div>
                                <div class="height-300 overflow-auto">
                                    <table class="table table-bordered border-bottom text-center">
                                        &lt;%&ndash;<colgroup>
                                            <col width="10%"/>
                                            <col width="15%"/>
                                            <col width="30%"/>
                                            <col width="15%"/>
                                            <col width="15%"/>
                                            <col width="15%"/>
                                        </colgroup>&ndash;%&gt;
                                        <thead>
                                        <th>선택</th>
                                        <th>그룹번호</th>
                                        <th>그룹명</th>
                                        <th>선택</th>
                                        <th>개수</th>
                                        <th>비고</th>
                                        <tr class="border-bottom-0">
                                            <td></td>
                                            <td></td>
                                            <td><input type="text" class="form-control"></td>
                                            <td>
                                                <select class="form-control">
                                                    <option>무관</option>
                                                    <option>필수</option>
                                                    <option>최대</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control">
                                                    <option>무관</option>
                                                    <option>1개</option>
                                                    <option>2개</option>
                                                    <option>3개</option>
                                                    <option>4개</option>
                                                    <option>5개</option>
                                                </select>
                                            </td>
                                            <td><button type="button" class="btn btn-primary ">그룹등록</button></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach begin="1" end="10" varStatus="idx">
                                            <tr id="${idx.index}">
                                                <td><input type="checkbox"></td>
                                                <td>200</td>
                                                <td><input type="text" class="form-control" value="test${idx.index}"></td>
                                                <td>
                                                    <select class="form-control">
                                                        <option>무관</option>
                                                        <option>필수</option>
                                                        <option>최대</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="form-control">
                                                        <option>무관</option>
                                                        <option>1개</option>
                                                        <option>2개</option>
                                                        <option>3개</option>
                                                        <option>4개</option>
                                                        <option>5개</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn reactive_btn btn-primary updateBtn">수정</button>
                                                    <button type="button" class="btn reactive_btn btn-danger removeBtn">삭제</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-1 col-lg-6 text-center">
                            <div class="btn-zone-wide">
                                <a class="btn btn-in m-t-160">
                                    <span class="fa fa-arrow-right"></span>
                                </a>
                                <br>
                                <a class="btn btn-in box">
                                    <span class="fa fa-arrow-left"></span>
                                </a>
                            </div>
                            <div class="btn-zone-narrow">
                                <a class="btn btn-in m-t-160">
                                    <span class="fa fa-arrow-right"></span>
                                </a>
                                <br>
                                <a class="btn btn-in box">
                                    <span class="fa fa-arrow-left"></span>
                                </a>
                            </div>
                            <div class="btn-zone-cramped m-b-5">
                                <a class="btn btn-in">
                                    <span class="fa fa-arrow-down"></span>
                                </a>
                                <a class="btn btn-in box">
                                    <span class="fa fa-arrow-up"></span>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-6">
                            <div class="panel panel-inverse p-0">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-center">상품 선택</h4>
                                </div>
                                <div class="height-300 overflow-auto">
                                    <table class="table table-bordered border-bottom text-center">
                                        <colgroup>
                                            <col width="10%"/>
                                            <col width="15%"/>
                                            <col width="30%"/>
                                            <col width="15%"/>
                                            <col width="15%"/>
                                            <col width="15%"/>
                                        </colgroup>
                                        <thead>
                                            <th><input type="checkbox"></th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>상태</th>
                                        </thead>
                                        <tbody>
                                        <c:forEach begin="1" end="2" varStatus="idx">
                                            <tr id="${idx.index}">
                                                <td><input type="checkbox"></td>
                                                <td>테스트상품${idx.index}</td>
                                                <td>${idx.index}0000</td>
                                                <td><span class="text-green">정상</span></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
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
    <div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../../search/headSearch.jsp" %>
    </div>
    <div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../../search/branchSearch.jsp" %>
    </div>
    <div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="../../search/storeSearch.jsp" %>
    </div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<script src="${path}/assets/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
<%--<script src="${path}/assets/js/demo/ui-tree.demo.js" type="text/javascript"></script>--%>
<link rel="stylesheet" href="${path}/css/jstree.css" />
<%-- Custom JS End--%>
<script>
    $(() => {
        $(".catLevelSearch").val("LV1");
        /*let storeNo = $(".storeNo").val();
        if (storeNo != null && storeNo != "") {
            $.ajax({
                type: "POST",
                url: "${path}/api/merchant/merchangroup/store",
                data: {
                    "storeNo" : storeNo
                },
                /!*contentType: "application/json;",*!/
                dataType: "json",
                success: function(datas) {
                    let data = Array();
                    data = datas.searchBranchList;
                    $.each(data, function (idx, list){
                        if (list.parentCatNo  == null) {list.parentCatNo = "#"}
                        if (list.catName  == null) {list.catName = ""}
                        if (list.storeNo  == null) {list.storeNo = ""}
                        if (list.catLevel  == null) {list.catLevel = ""}
                        if (list.catValue  == null) {list.catValue = ""}
                        if (list.parentCatNo  == null) {
                            list.parentCatNo = "0"
                        }
                        if (list.dataStatus  == null) {list.dataStatus = ""}
                        if (list.memo  == null) {list.memo = ""}
                        data[(idx)] = {
                            id: list.storeCatNo,
                            parent:  list.parentCatNo ,
                            text : list.catName + " (" + list.storeCatNo + ")",
                            data: {
                                storeCatNo : list.storeCatNo,
                                catName : list.catName,
                                storeNo : list.storeNo,
                                catLevel : list.catLevel,
                                catValue : list.catValue,
                                parentCatNo : list.parentCatNo,
                                dataStatus : list.dataStatus,
                                memo : list.memo
                            }
                        };
                    });
                    $("#jstree-merchandise").jstree({
                        core: {
                            themes: {
                                responsive: false
                            },
                            check_callback: true,
                            data: data  //데이터 연결
                        },
                        types: {
                            default: {
                                icon: false
                            },
                            file: {
                                icon: "fa fa-shopping-basket text-warning fa-lg"
                            }
                        },
                        "state": { "key": "demo2" },
                        "plugins": [ "contextmenu", "dnd", "state", "types" ]
                        //선택시
                    }).bind('select_node.jstree', function(event, data){
                        var storeNo = data.instance.get_node(data.selected).data.storeNo;    //paht 가져오기
                        var storeCatNo = data.instance.get_node(data.selected).data.storeCatNo;    //data 에서 a 가져오기
                        var catLevel = data.instance.get_node(data.selected).data.catLevel;    //data 에서 a 가져오기

                        //var storeNo = data.node.data.storeNo;    //paht 가져오기
                        //var storeCatNo = data.node.data.storeCatNo;    //data 에서 a 가져오기
                        //var catLevel = data.node.data.catLevel;    //data 에서 a 가져오기
                        let newArray = new Array();
                        let appendList = datas.searchBranchList;

                        if(catLevel == 0) {
                            catLevel = "NONE";
                        } else if(catLevel == 1) {
                            catLevel = "LV1";
                        } else if(catLevel == 2) {
                            catLevel = "LV2";
                        }  else if(catLevel == 3) {
                            catLevel = "LV3";
                        }


                        $("#catBody").html("");


                        for(var i = 0 ; i < appendList.length;  i++ ) {

                            console.log(appendList[i].data.catLevel);
                            if(catLevel == "NONE") {

                            } else if(catLevel == "LV1") {
                                if(appendList[i].data.catLevel == 1){
                                    newArray.push(appendList[i])
                                }
                            } else if(catLevel == "LV2") {
                                if(appendList[i].data.catLevel == 2){
                                    newArray.push(appendList[i])
                                }
                            }  else if(catLevel == "LV3") {
                                if(appendList[i].data.catLevel == 3){
                                    newArray.push(appendList[i])
                                }
                            }
                        }

                        console.log(newArray);

                        let appendStatus = "";
                        let appendParentCatNo = "";
                        for(var i = 0 ; i < newArray.length;  i++ ) {
                            if(newArray[i].data.dataStatus == 0) {
                                appendStatus = "   \"  <option value=\"0\" selected >삭제</option>\\n" +
                                    "                 <option value=\"1\" >정상</option>\n" +
                                    "                 <option value=\"2\" >정지</option>\n"
                            } else if (newArray[i].data.dataStatus == 1) {
                                appendStatus = "   \"  <option value=\"0\" >삭제</option>\\n" +
                                    "                 <option value=\"1\" selected>정상</option>\n" +
                                    "                 <option value=\"2\" >정지</option>\n"
                            } else if (newArray[i].data.dataStatus == 2) {
                                appendStatus = "   \"  <option value=\"0\" >삭제</option>\\n" +
                                    "                 <option value=\"1\" >정상</option>\n" +
                                    "                 <option value=\"2\" selected>정지</option>\n"
                            }

                            if(newArray[i].data.catLevel == 1) {
                                appendParentCatNo = "        <input type=\"text\" class=\"form-control width-full parentCatNo parentCatNoTxt\" disabled  value="+(newArray[i].data.parentCatNo == '#' ? '' : newArray[i].data.parentCatNo) +" > </td>\n"
                            }
                            else {
                                appendParentCatNo = "        <input type=\"text\" class=\"form-control width-full parentCatNo parentCatNoTxt\"  value="+(newArray[i].data.parentCatNo == '#' ? '' : newArray[i].data.parentCatNo) +" > </td>\n"
                            }

                            $("#catBody").append(" <tr>\n" +
                                "    <td><input type=\"text\" class=\"form-control width-full storeCatNoTxt\"value="+newArray[i].data.storeCatNo+" disabled>\n" +
                                "    <input type=\"hidden\" class=\"storeNoTxt\" value="+storeNo+"></td>\n" +
                                "    <td><input type=\"text\" class=\"form-control width-full catNameTxt\" value="+newArray[i].data.catName+"></td>\n" +
                                "    <td><input type=\"text\" class=\"form-control width-full catValueTxt\" value="+newArray[i].data.catValue+">\n" +
                                "        <input type=\"hidden\" class=\"catLevel catLevelSelect\" value="+newArray[i].data.catLevel+">\n" +
                                "    </td>\n" +
                                "    <td>\n" +
                                "        <input type=\"hidden\" class=\"form-control width-full viewOrderTxt\" value="+(newArray[i].data.viewOrder == 'undefined' ? appendList[i].data.viewOrder : '') +">\n" +
                                appendParentCatNo+
                                /!*"        <input type=\"text\" class=\"form-control width-full parentCatNo parentCatNoTxt\"  value="+(newArray[i].data.parentCatNo == '#' ? '' : newArray[i].data.parentCatNo) +" > </td>\n" +*!/
                                "    <td>\n" +
                                "        <select class=\"form-control dataStatusSelect\">\n" +
                                appendStatus+
                                "        </select>\n" +
                                "    </td>\n" +
                                "    <td><input type=\"text\" class=\"form-control width-full memoTxt\" value="+newArray[i].data.memo+"> </td>\n" +
                                "    <td>\n" +
                                "        <button type=\"button\" class=\"btn btn-primary update_btn\"><i class=\"fa fa-check m-r-5\"></i>수정</button>\n" +
                                "        <button type=\"button\" class=\"btn btn-danger del_btn\" storeCatNo="+newArray[i].data.storeCatNo+" ><i class=\"fa fa-trash m-r-5\"></i>삭제</button>\n" +
                                "    </td>\n" +
                                "</tr>")
                        }
                        $("#fontTxt").text(catLevel)
                        $(".catLevelSearch").val(catLevel);
                        //삭제시
                    }).bind('delete_node.jstree', function(event, data){
                        var storeCatNo = data.node.data.storeCatNo;    //data 에서 a 가져오기
                        var storeNo = data.node.data.storeNo;    //data 에서 a 가져오기
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/merchant/merchangroup/delete",
                            data: {
                                storeCatNo : storeCatNo,
                                storeNo : storeNo
                            },
                            dataType: "json",
                            success: function(data) {
                                if(data.result == 200) {
                                    location.reload();
                                } else {
                                    alert("삭제에 실패하였습니다.");
                                    return;
                                }
                            }
                        });
                        //추가시
                    }).bind('create_node.jstree', function(event, data){

                    }).bind("reopen.jstree", function(e,data) {
                    }).bind("loaded.jstree", function (e, data) {
                    });
                }
            });
        } else {
            $("#jstree-merchandise").append ("카테고리가 없습니다.");
        }*/

        $(document).on("click",".level_one_btn",function() {
            $(".catLevelSearch").val("LV1");
            $(".parentCatNoSearch").val("");
            $(".frmSearch").submit();
        });
        $(document).on("click",".level2_btn",function() {
            $(".catLevelSearch").val("LV2");
            $(".parentCatNoSearch").val($(this).attr("parent1No"));
            $(".frmSearch").submit();
        });
        $(document).on("click",".level3_btn",function() {
            $(".catLevelSearch").val("LV3");
            $(".parentCatNoSearch").val($(this).attr("parent2No"));
            $(".frmSearch").submit();
        });
        $(document).on("click",".catTr",function() {

            let parentCatNo = $(this).attr("parentCatNo");
            let catLevel = $(this).attr("catLevel");
            let catName = $(this).attr("catName");
            let storeCatNo = $(this).attr("storeCatNo");
            if(catLevel == "LV1") {
                catLevel = "LV2";
                $(".parent1").val(catName);
                $(".parent1No").val(storeCatNo);
            } else if(catLevel == "LV2") {
                catLevel = "LV3";
                $(".parent2").val(catName);
                $(".parent2No").val(storeCatNo);
            } else if(catLevel == "LV3") {
                catLevel = "LV4";
            }

            $(".catLevelSearch").val(catLevel);
            $(".parentCatNoSearch").val(parentCatNo);
            $(".catNameSearch").val(catName);


            if(catLevel != "LV4") {
                $(".frmSearch").submit();
            }
        });



        $(document).on("click",".del_btn",function(){
            let storeCatNo = $(this).attr("storeCatNo");
            let storeNo = $(".storeNo").val();
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted" text="삭제되었습니다."/>";
            if (storeCatNo != null && storeCatNo != "") {
                swal({
                    title: doyouwanttodelete,
                    icon: "warning",
                    buttons: [
                        cancel,
                        deletemsg
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/merchant/merchangroup/delete",
                            data: {
                                storeCatNo : storeCatNo,
                                storeNo : storeNo
                            },
                            dataType: "json",
                            success: function(data) {
                                if(data.result == 200) {
                                    alert(deleted);
                                    location.reload();
                                } else {
                                    alert(deletionfailed);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        $(document).on("click",".update_btn",function(){

            var thisTxt = $(this).parent().parents("tr");

            let storeCatNo = thisTxt.find(".storeCatNoTxt").val();
            let catName = thisTxt.find(".catNameTxt").val();
            let catValue = thisTxt.find(".catValueTxt").val();
            let catLevel = thisTxt.find(".catLevelSelect").val();
            let viewOrder = thisTxt.find(".viewOrderTxt").val();
            let parentCatNo = thisTxt.find(".parentCatNoTxt").val();
            let dataStatus = thisTxt.find(".dataStatusSelect").val();
            let storeNo = thisTxt.find(".storeNoTxt").val();
            let memo = thisTxt.find(".memoTxt").val();

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";

            let data = {
                storeCatNo : storeCatNo,
                storeNo : storeNo,
                catName : catName,
                catValue : catValue,
                catLevel : catLevel,
                dataStatus : dataStatus,
                viewOrder : viewOrder,
                parentCatNo : parentCatNo,
                memo : memo
            }
            if (storeCatNo != null && storeCatNo != "") {
                swal({
                    title: wouldyouliketoupdate,
                    icon: "warning",
                    buttons: [
                        cancel,
                        update
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "POST",
                            url: "${path}/api/merchant/merchangroup/update",
                            data: JSON.stringify(data),
                            contentType: "application/json;",
                            dataType: "json",
                            success: function(data) {
                                if(data.result == 200) {
                                    alert(updatesussmsg);
                                    location.reload();
                                } else {
                                    alert(editfailed);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
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

        /*$("#detailOptionBtn1").click(function(e) {
            e.preventDefault();
        })*/
        /*$("#dataTable").dataTable({

        });*/

        $(".insert_btn").click(function() {
            location.href = "${path}/merchant/merchandise/insert";
        });

        /*$(".detailRow").click(function() {
            location.href = "${path}/merchant/merchandise/detail";
        });*/

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

        $(document).on("change",".catLevel", function(){
            let level = $(this).val();
              if(level == 1) {
                  $(this).parents().parents("tr").find(".parentCatNo").attr("disabled",true);
                  $(this).parents().parents("tr").find(".parentCatNo").val("");
              } else {
                  $(this).parents().parents("tr").find(".parentCatNo").attr("disabled",false);
              }
        });
        $(document).on("click",".btn_insert",function() {

            let storeNo = $(".storeNo").val();
            let storeNoTxt = $("#storeNoTxt").val(storeNo);
            let _forms = $('#insert_form ');
            let req = convertFormToObj(_forms);
            let registermsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let registerfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let enrollment = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

            if (inputDataCheck(req)) {
                swal({
                    title: registermsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        enrollment
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                     if (isConfirm) {
                         $.ajax({
                             type: "POST",
                             url: "${path}/api/merchant/merchangroup/insert",
                             data: JSON.stringify(req),
                             contentType: "application/json;",
                             dataType: "json",
                             success: function(data) {
                                 if(data.result == 200) {
                                     location.reload();
                                 } else {
                                     alert(registerfailmsg);
                                     return;
                                 }
                             }
                         });
                     }
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
/*


    var jstreeExtend = {};

    /!**
     * jstree 제어
     * elem : jstree dom 객체
     *!/
    jstreeExtend.jstree = function(elem){
        $('#jstree-merchandise') = $tree;
        //jstree 객체
        $tree = elem;

        // jstree 생성
        $tree.jstree({
            //core 제어
            'core': {
                'data': data,
                "check_callback": true // plugins 'dnd'와 같이 사용 이동하고싶을때
            },
            "plugins": ["dnd", "types"],
            "types": {
                "valid_children": ["default"],
                "default": {
                    "max_depth": 2 // 하위 depth 제한
                }
            }
        });

        // 트리 구조 로딩 완료 시
        $tree.bind("loaded.jstree", function(e) {
            //...
        }.bind(this));

        // 트리 구조 새로고침 시
        $tree.bind("refresh.jstree", function(e,d) {
            //...
        }.bind(this));

        /!**
         * 해당 ID 값의 데이터를 리턴
         *  id : node.id
         * *!/
        this.findCoreData = function(id) {
            var coreData = $tree.jstree(true).settings.core.data;
            for (var i=0; i<coreData.length; i++) {
                var data = coreData[i];
                if (data.id == id) {
                    return data;
                }
            }
            return null;
        };

        /!**
         * root node get
         * *!/
        this.getRootNode = function() {
            return $tree.jstree(true).get_node('#');
        };

        /!**
         * 노드의 원시 데이터 set
         * data : arry
         * *!/
        this.setCoreData = function(data) {
            $tree.jstree(true).settings.core.data = data;
        };

        /!**
         * 노드의 원시 데이터 get
         * *!/
        this.getCoreData = function() {
            return $tree.jstree(true).settings.core.data;
        };

        /!**
         * 현재 트리구조 + 원본 데이터를 Merge 하여 데이터를 리턴
         * *!/
        this.getData = function() {
            var newData = [];
            var jdata = $tree.jstree(true).get_json("#", {flat:true});
            for (var i=0; i<jdata.length; i++) {
                var current = jdata[i];
                var id = current.id;
                var data = this.findCoreData(id);
                if (data) {
//        current.text = $("<div>"+current.text+"</div>").text();
                    newData.push($.extend(data, current));
                }
            }
            return newData;
        };

        /!**
         * 새로고침
         * *!/
        this.refresh = function() {
            $tree.jstree(true).refresh();
        }

        /!**
         * 데이터 추가
         * d : obj
         * *!/
        this.addData = function(d){
            var data = this.getData();
            data.splice(data.length,0,d);
            this.setCoreData(data);
            this.refresh(data);
        }

        /!**
         * 노드 이름 수정 폼
         *  id
         * *!/
        this.edit = function(id) {
            $tree.jstree(true).edit(id);
        };

        /!**
         * 노드 가져오기
         *  id
         * *!/
        this.getNode = function(id) {
            return $tree.jstree(true).get_node(id);
        };

        /!**
         * 자식노드 가져오기
         *  id
         * *!/
        this.childrenNode = function(id) {
            var ids = this.getNode(id).children;
            if(!ids) return [];

            var children = [];
            for (var i=0; i<ids.length; i++) {
                children.push(this.getNode(ids[i]));
            }
            return children;
        };

        /!**
         * 부모노드 가져오기
         *  id
         * *!/
        this.parentNode = function(id) {
            return this.getNode(this.getNode(id).parent);
        };

        /!**
         * 전체열기
         * *!/
        this.openAll = function() {
            $tree.jstree("open_all");
        };

        /!**
         * 전체 닫기
         * *!/
        this.closeAll = function() {
            $tree.jstree("close_all");
        };

        /!**
         * 특정 노드 열기
         *  id
         * *!/
        this.openNode = function(id) {
            $tree.jstree("open_node", id)
        };

        /!**
         * 특정 노드 닫기
         *  id
         * *!/
        this.closeNode = function(id) {
            $tree.jstree("close_node", id)
        };

        /!**
         * 특정노드 삭제
         *  id
         * *!/
        this.removeNode = function(id) {
            $tree.jstree(true).delete_node(id);
        };

        /!**
         * 특정노드 이름변경
         * node : 변경할 대상 node
         * text : 변경할 이름 string
         * *!/
        this.renameNode = function(node, text) {
            $tree.jstree("rename_node", node, text);
        };
    }*/
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
    function inputDataCheck(args) {
        let enterthecategoryname = "<spring:message code="list.script.enterthecategoryname" text="카테고리명 입력해주세요"/>";
        let pleaseselectastore = "<spring:message code="list.script.pleaseselectastore" text="가맹점을 선택해주세요"/>";
        let entertheoutputorder = "<spring:message code="list.script.entertheoutputorder" text="출력순서를 입력해주세요"/>";



        if (isNull(args.catName)) {
            return alert_focus("catName", enterthecategoryname);
        } else if (isNull(args.storeNo)) {
            return alert_focus("storeNo", pleaseselectastore);
        } else if (isNull(args.viewOrder)) {
            return alert_focus("viewOrder", entertheoutputorder);
        }
        return true;
    }
</script>
</body>
</html>
