<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar |<spring:message code="sidemenu.couponmanagement.couponmanagement1" text="쿠폰 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order |<spring:message code="sidemenu.couponmanagement.couponmanagement1" text="쿠폰 관리"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement12" text="쿠폰 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="쿠폰 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="쿠폰 관리"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr >
                                        <td class="bg-light"><strong><spring:message code="list.search.postclassification12" text="서비스 타입"/></strong></td>
                                        <td >
                                            <label>
                                                <select class="form-control" name="serviceType">
                                                    <option value="" <c:if test="${searchValue.serviceType == ''  || searchValue.serviceType == null}">selected</c:if>><spring:message code="list.search.all1" text="전체"/></option>
                                                    <option value="2" <c:if test="${searchValue.serviceType == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="탁송"/></option>
                                                    <option value="3" <c:if test="${searchValue.serviceType == '3'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="맛집"/></option>
                                                    <option value="4" <c:if test="${searchValue.serviceType == '4'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="마트"/></option>
                                                    <option value="5" <c:if test="${searchValue.serviceType == '5'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="맛집 예약"/></option>
                                                </select>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.stateofuse12" text="사용상태"/></strong></td>
                                        <td>
                                            <div class="row">
                                            </div>
                                            <label>
                                                <select class="form-control dataStatus" name="dataStatus">
                                                    <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all1" text="전체"/></option>
                                                    <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>><spring:message code="list.search.normal1" text="정상"/></option>
                                                    <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>><spring:message code="list.search.stop1" text="정지"/></option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><strong><spring:message code="list.search.registrationperiod1" text="등록기간"/><%--등록기간--%></strong></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option><spring:message code="list.search.title1" text="쿠폰명"/></option>
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
                                    <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                        <button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                            <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="쿠폰등록"/></span>
                                        </button>
                                    </c:if>
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search1" text="검색"/><%--검색--%> </button>
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
                            <th><spring:message code="list.word.no1" text="번호"/></th>
                            <th><spring:message code="list.detail.title1" text="쿠폰명"/></th>
                            <th><spring:message code="list.detail.title1" text="쿠폰코드"/></th>
                            <th><spring:message code="list.detail.title1" text="최대발급가능"/></th>
                            <th><spring:message code="list.detail.title1" text="현재발급개수"/></th>
                            <th><spring:message code="list.word.contents1" text="할인금액/할인율"/></th>
                            <th><spring:message code="list.word.serviceclassification1" text="서비스타입"/></th>
                            <th><spring:message code="list.word.status1" text="발급가능시작일"/></th>
                            <th><spring:message code="list.word.status1" text="발급가능종료일"/></th>
                            <th><spring:message code="list.word.status1" text="상태"/></th>
                            <th><spring:message code="list.word.registrationdate1" text="등록일"/></th>
                            <th><spring:message code="list.word.modifieddate1" text="수정일"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item"  items="${tbCouponList}"  varStatus="status">
                        <tr class="detailRow" couponNo="${item.couponNo}">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-center">${item.title}</td>
                            <td class="text-center">${item.couponCode}</td>
                            <td class="text-center">${item.maxPublishCount}개</td>
                            <td class="text-center">${item.publishCount}개</td>
                            <td class="text-center">
                                ${item.dcAmt}
                                <c:if test="${item.dcRateType == 1}">원</c:if>
                                <c:if test="${item.dcRateType == 2}">%</c:if>
                            </td>
                            <td class="text-center" style="">
                                <c:if test="${item.serviceType == 2}">
                                    <spring:message code="list.search.all1" text="탁송"/>
                                </c:if>
                                <c:if test="${item.serviceType == 3}">
                                    <spring:message code="list.word.franchisee1" text="맛집"/>
                                </c:if>
                                <c:if test="${item.serviceType == 4}">
                                    <spring:message code="list.word.franchisee1" text="마트"/>
                                </c:if>
                                <c:if test="${item.serviceType == 5}">
                                    <spring:message code="list.word.franchisee1" text="맛집예약"/>
                                </c:if>
                            </td>
                            <td class="text-center"><javatime:format value="${item.publishStartDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center"><javatime:format value="${item.publishEndDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center">
                                <c:if test="${item.dataStatus == 0}"><span class="text-red"><spring:message code="list.word.hide1" text="삭제"/></span></c:if>
                                <c:if test="${item.dataStatus == 1}"><spring:message code="list.word.exposure1" text="정상"/></c:if>
                                <c:if test="${item.dataStatus == 2}"><spring:message code="list.word.exposure1" text="정지"/></c:if>
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
    $(document).on("click",".detailRow",function(){
        let couponNo = $(this).attr("couponNo")
        location.href = "${path}/board/management/detail?couponNo="+couponNo;
    });
    $(document).on("click",".insert_btn",function(){
        location.href = '${path}/board/management/insert';
    });
    $(() => {
        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
        });

       /* $(".insert_btn").click(function() {
           location.href = '${path}/board/management/insert';
        });*/

        /*$(".detailRow").click(function() {
            let couponNo = $(this).attr("couponNo")
            location.href = "${path}/board/management/detail?couponNo="+couponNo;
        });
*/


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
        $('#frmSearch').submit();
    }
</script>
</body>
</html>
