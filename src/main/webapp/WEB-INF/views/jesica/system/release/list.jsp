<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.boardmanagement.delivernotice1" text="업데이트 내역"/></title>
</head>
<style>
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
                    <li class="breadcrumb-item"><a href="${path}/system/release/list"><spring:message code="sidemenu.boardmanagement1" text="시스템 운영"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.delivernotice1" text="업데이트 내역"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.delivernotice1" text="업데이트 내역"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <div class="search-box">
                                        <div class="inner-search-box p-5">
                                            <div class="row">
                                                <div class="col-xl-12 col-md-12 ">
                                                    <form name="frmSearch" id="frmSearch">
                                                        <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                            <input type="hidden" name="platformType" value="1">
                                                        </c:if>
                                                        <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                            <input type="hidden" name="platformType" value="2">
                                                        </c:if>
                                                        <table class="table table-condensed table-bordered">
                                                            <tbody>
                                                            <tr >
                                                              <%--  <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                                    <select class="form-control" name="flatformType">
                                                                        <option value="1" <c:if test="${searchValue.platformType == 1}">selected</c:if>><spring:message code="list.search.affiliated1" text="제시카"/></option>
                                                                    </select>
                                                                </c:if>
                                                                <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                                    <select class="form-control" name="platformType">
                                                                        <option value="2" <c:if test="${searchValue.platformType == 2}">selected</c:if>><spring:message code="list.search.affiliated1" text="픽오더"/></option>
                                                                    </select>
                                                                </c:if>--%>
                                                                <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/></strong></td>
                                                                <td colspan="1" >
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
                                                                <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="프로그램"/></strong></td>
                                                                <td>
                                                                    <select class="form-control" name="programType">
                                                                        <option value="" <c:if test="${searchValue.programType == ''}">selected</c:if>><spring:message code="list.search.affiliated1" text="전체"/></option>
                                                                        <option value="1" <c:if test="${searchValue.programType == 1}">selected</c:if>><spring:message code="list.search.affiliated1" text="관리자"/></option>
                                                                        <option value="2" <c:if test="${searchValue.programType == 2}">selected</c:if>><spring:message code="list.search.distributor1" text="고객앱"/></option>
                                                                        <%--                                                            <option value="5" <c:if test="${searchValue.serviceType == '5'}">selected</c:if>><spring:message code="list.search.distributor" text="맛집예약"/></option>--%>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="bg-light"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                                                <td>
                                                                    <label>
                                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                                    </label>
                                                                    <label>
                                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                                    </label>
                                                                </td>
                                                                <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                                                <td>
                                                                    <label>
                                                                        <select class="form-control">
                                                                            <option><spring:message code="list.search.title" text="제목"/><%--<spring:message code="merchandise.search9.option2" text="default text"/>--%><%--바코드--%></option>
                                                                        </select>
                                                                        <input type="text" class="form-control width-150" name="title" value="${searchValue.title}" maxlength="150">
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </div>
                                                <div class="col-xl-12 col-md-12 m-t-10">
                                                    <div class="">
                                                            <button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                                                <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration" text="업데이트 내역 등록"/></span>
                                                            </button>
                                                        <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/><%--검색--%> </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th width="5%"><spring:message code="list.word.no" text="번호"/></th>
                        <th width="5%"><spring:message code="list.word.no" text="프로그램"/></th>
                        <th width="20%"><spring:message code="list.detail.title" text="제목"/></th>
                        <th width=""><spring:message code="list.word.contents" text="내용"/></th>
                        <th width="10%"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                        <th width="10%"><spring:message code="list.word.modifieddate" text="수정일"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item"  items="${tbNoticeReleaseList}"  varStatus="status">
                        <tr class="detailRow" noticeNo="${item.noticeNo}">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-center">
                                   <c:if test="${item.programType == 1}">관리자</c:if>
                                   <c:if test="${item.programType == 2}">고객앱</c:if>
                            </td>
                            <td class="text-center">${item.title}</td>
                            <td class="text-center">
                                <div style="overflow: hidden;
                                          margin: auto;
                                          text-overflow: ellipsis;
                                          white-space: nowrap;
                                          width: 250px;
                                          font-weight: 200;
                                          display: block;">  ${item.body}</div>
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
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>


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

        $(".insert_btn").click(function() {
            location.href = '${path}/system/release/insert';
        });

        dateSetting();
    });
    $(document).on("click",".detailRow",function(){
        let noticeNo = $(this).attr("noticeNo");
        location.href = "${path}/system/release/detail?noticeNo="+noticeNo;
    });
</script>
</body>
</html>
