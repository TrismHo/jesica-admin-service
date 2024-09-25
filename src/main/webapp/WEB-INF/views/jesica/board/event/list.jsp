<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | <spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/></title>
    </c:if>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="앱 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr >
                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="플랫폼 구분"/></strong></td>
                                            <td >
                                                <label>
                                                    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                        <select class="form-control" name="platformType">
                                                            <option value="1" <c:if test="${searchValue.platformType == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="제시카"/></option>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                        <select class="form-control" name="platformType">
                                                            <option value="2" <c:if test="${searchValue.platformType == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="직배"/></option>
                                                        </select>
                                                    </c:if>
                                                 <%--   <select class="form-control" name="platformType">
                                                        <option value="" <c:if test="${searchValue.platformType == ''  || searchValue.platformType == null}">selected</c:if>><spring:message code="list.search.all1" text="전체"/></option>
&lt;%&ndash;                                                        <option value="0" <c:if test="${searchValue.platformType == '0'}">selected</c:if>><spring:message code="list.search.all1" text="사용안함"/></option>&ndash;%&gt;
                                                        <option value="1" <c:if test="${searchValue.platformType == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="제시카"/></option>
                                                        <option value="2" <c:if test="${searchValue.platformType == '2'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="양파오더"/></option>
                                                        <option value="3" <c:if test="${searchValue.platformType == '3'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="세날"/></option>
                                                    </select>--%>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/></strong></td>
                                            <td>
                                                <div class="row">
                                                </div>
                                                <input type="hidden" name="dateStatus" value="OK">
                                                <label>
                                                    <select class="form-control viewYn" name="viewYn">
                                                        <option value="" <c:if test="${searchValue.viewYn == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                        <option value="1" <c:if test="${searchValue.viewYn == '1'}">selected</c:if>><spring:message code="list.search.normal" text="노출"/></option>
                                                        <option value="0" <c:if test="${searchValue.viewYn == '0'}">selected</c:if>><spring:message code="list.search.stop" text="숨김"/></option>
                                                    </select>
                                                </label>
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
                                            <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <%--<option>선택&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>--%>
                                                        <option><spring:message code="list.search.title" text="제목"/><%--<spring:message code="merchandise.search9.option2" text="default text"/>--%><%--바코드--%></option>
                                                        <%--<option>내용&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>--%>
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
                                        <span class="fa fa-plus"><spring:message code="list.word.eventregistration" text="이벤트 등록"/><%--<spring:message code="merchandise.registerbutton" text="default text"/>--%></span>
                                    </button>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/><%--검색--%> </button>
                                </div>
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
                        <th width="20%"><spring:message code="list.detail.title" text="제목"/></th>
                        <th width="10%"><spring:message code="list.word.serviceclassification" text="플랫폼구분"/></th>
                        <th width="5%"><spring:message code="list.word.status" text="상태"/></th>
                        <th width=""><spring:message code="list.word.contents1" text="시작일/종료일"/></th>
                        <th width="10%"><spring:message code="list.word.status" text="등록 사용자"/></th>
                        <th width="10%"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item"  items="${tbEventList}"  varStatus="status">
                        <tr class="detailRow" eventNo="${item.eventNo}">
                            <td class="text-center">${status.index + 1}</td>
                                <%-- <td>
                                     <c:url var="url" value=""><c:param name="output" value="${item.imgFileSmall}" /></c:url>
                                     <c:set var="url" value="${fn:substringAfter(url, '=')}" />
                                     <img style="width: 80px;" class="storeImg" src="/api/img/fileLoad?filePath=${url}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'" ></td>--%>
                            <td class="text-center">${item.title}</td>
                            <td class="text-center" style="">
                                <c:if test="${item.platformType == 0}"><spring:message code="list.word.franchisee1" text="사용안함"/></c:if>
                                <c:if test="${item.platformType == 1}"><spring:message code="list.word.deliverygroup1" text="제시카"/></c:if>
                                <c:if test="${item.platformType == 2}"><spring:message code="list.word.deliverygroup1" text="직배"/></c:if>
                                <c:if test="${item.platformType == 3}"><spring:message code="list.word.deliverygroup1" text="세날"/></c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.viewYn == 0}"><span class="text-red"><spring:message code="list.word.hide" text="숨김"/></span></c:if>
                                <c:if test="${item.viewYn == 1}"><spring:message code="list.word.exposure" text="노출"/></c:if>
                            </td>
                            <td class="text-center">
                                <javatime:format value="${item.startDate}" pattern="yyyy-MM-dd " />
                                ~ <javatime:format value="${item.endDate}" pattern="yyyy-MM-dd " />
                            </td>

                            <td class="text-center">
                                <div style="overflow: hidden;
                                          margin: auto;
                                          text-overflow: ellipsis;
                                          white-space: nowrap;
                                          width: 250px;
                                          font-weight: 200;
                                          display: block;">  ${item.insertUserId}
                                </div>
                            </td>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
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
            location.href = '${path}/board/event/insert';
        });

        $(".detailRow").click(function() {
            let eventNo = $(this).attr("eventNo")
            location.href = "${path}/board/event/detail?eventNo="+eventNo;
        });

        dateSetting();

    });
</script>
</body>
</html>
