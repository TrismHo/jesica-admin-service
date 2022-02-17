<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.boardmanagement.delivernotice" text="배너 관리"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="게시판 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.delivernotice1" text="배너 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.delivernotice1" text="배너 관리"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                    <input type="hidden" name="dataStatus" value="OK">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                            <tr>
                                                <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="서비스 타입"/></strong></td>
                                                <td>
                                                    <label>
                                                        <select class="form-control" name="serviceType">
                                                            <option value="" <c:if test="${searchValue.serviceType == ''  || searchValue.groupType == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                            <option value="0" <c:if test="${searchValue.serviceType == '0'}">selected</c:if>><spring:message code="list.search.affiliated" text="메인"/></option>
                                                            <option value="2" <c:if test="${searchValue.serviceType == '2'}">selected</c:if>><spring:message code="list.search.distributor" text="탁송"/></option>
                                                            <option value="3" <c:if test="${searchValue.serviceType == '3'}">selected</c:if>><spring:message code="list.search.distributor" text="맛집"/></option>
                                                            <option value="4" <c:if test="${searchValue.serviceType == '4'}">selected</c:if>><spring:message code="list.search.distributor" text="마트"/></option>
                                                            <option value="5" <c:if test="${searchValue.serviceType == '5'}">selected</c:if>><spring:message code="list.search.distributor" text="맛집예약"/></option>
                                                        </select>
                                                    </label>
                                                </td>
                                                <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="게시판 종류"/></strong></td>
                                                <td>
                                                    <label>
                                                        <select class="form-control" name="boardType">
                                                            <option value="" <c:if test="${searchValue.boardType == ''  || searchValue.groupType == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/><%--상품명--%></option>
                                                            <option value="1" <c:if test="${searchValue.boardType == '1'}">selected</c:if>><spring:message code="list.search.affiliated" text="이벤트"/><%--<spring:message code="merchandise.search9.option2" text="default text"/>--%><%--바코드--%></option>
                                                            <option value="2" <c:if test="${searchValue.boardType == '2'}">selected</c:if>><spring:message code="list.search.distributor" text="공지"/></option>
                                                        </select>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                                <td colspan="3">
                                                    <label>
                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                    </label>
                                                    <label>
                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                    </label>
                                                </td>
                                                <%--<td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="사용상태"/></strong></td>
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
                                                </td>--%>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div style="display: flex">
                                    <span class="mr-auto">
                                        <button type="button" class="insert_btn btn btn-primary m-b-10">
                                            <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration" text="배너 등록"/></span>
                                        </button>
                                        <button type="button" data-toggle="modal" data-target="#sort_modal" class="update_orders_btn btn btn-primary m-b-10">
                                            <span class="fa fa-list">&nbsp;<spring:message code="list.search.noticeregistration" text="순서 변경"/></span>
                                        </button>
                                    </span>
                                    <span>
                                        <button class="btn-box-r bgGray line-height-25 width-100 p-5 searchClick" onclick="searchFormFunction()"><i class="fa fa-search grayicon"></i> <spring:message code="list.search.search" text="검색"/><%--검색--%> </button>
                                    </span>
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
                            <th width="30%"><spring:message code="list.word.merchant/deliverygroupname" text="배너 이미지"/></th>
                            <th><spring:message code="list.word.contents" text="서비스 타입"/></th>
                            <th><spring:message code="list.word.division" text="게시판 종류"/></th>
                            <th><spring:message code="list.word.registrationdate" text="등록일"/></th>
                            <th><spring:message code="list.word.status" text="노출여부"/></th>
                            <th width="5%"><spring:message code="list.word.registrationdate" text="노출순서"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item"  items="${bannerList}"  varStatus="status">
                            <tr class="detailRow" bannerNo="${item.bannerNo}">
                                <td class="text-center">${status.index + 1}</td>
                                <td class="text-center">
                                    <img style="width: 192px; height: 54px" class="storeImg" src="/api/img/fileLoad?filePath=${item.bannerFile}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'" >
                                </td>
                                <td class="text-center">
                                    <c:if test="${item.serviceType == 0}">메인</c:if>
                                    <c:if test="${item.serviceType == 2}">탁송</c:if>
                                    <c:if test="${item.serviceType == 3}">맛집</c:if>
                                    <c:if test="${item.serviceType == 4}">마트</c:if>
                                    <c:if test="${item.serviceType == 5}">맛집예약</c:if>
                                </td>
                                <td class="text-center">
                                    <c:if test="${item.boardType == 1}">이벤트</c:if>
                                    <c:if test="${item.boardType == 2}">공지</c:if>
                                </td>
                                <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                                <td class="text-center">
                                    <c:if test="${item.viewYn == 0}">숨김</c:if>
                                    <c:if test="${item.viewYn == 1}">노출</c:if>
                                </td>
                                <td class="text-center">${item.viewOrder}</td>
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
<div class="modal fade" id="sort_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="sortManagement.jsp" %>
</div>
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
        getBannerSort();

        $(function() {
            $("#sortable").sortable({
                update: function() {
                    let bannerNos = $(this).sortable("toArray");
                    $.ajax({
                        type: "GET",
                        url: "${path}/api/banner/update/viewOrder?bannerNos=" + bannerNos,
                        success: function() {
                            getBannerSort();
                            alert("변경 완료");
                        }
                    });
                }
            });
        });

        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
        });

        $(".insert_btn").click(() => {
            location.href = '${path}/board/banner/insert';
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
    $(document).on("click",".detailRow",function(){
        let bannerNo = $(this).attr("bannerNo");
        location.href = "${path}/board/banner/detail?bannerNo="+bannerNo;
    });

    function getBannerSort() {
        $.ajax({
            type: "GET",
            url: "${path}/api/banner/sortList",
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                let bannerSortList = data.listBannerSort;
                bannerSortList = bannerSortList.sort((a, b) => a.viewOrder - b.viewOrder);
                $(".bannerSortList").html("");
                if (bannerSortList.length == 0 || bannerSortList == null) {
                    document.getElementById("sortable").style.visibility = 'hidden';
                    document.getElementById("explain").style.visibility = 'hidden';
                    $(".no-sort-item").append(
                        "<li>" +
                            "<label class=\"store_text text-center w-100\">\n" +
                                "노출되는 배너가 없습니다."+
                            "</label>\n" +
                            "<div class=\"float-right \"></div>\n" +
                        "</li>"
                    )
                } else {
                    drawingBannerSort(bannerSortList);
                }
            }
        });
    }

    /*function drawingBannerSort(bannerSortList) {
        for (let i = 0; i < bannerSortList.length; i++) {
            let imgPath = '/api/img/fileLoad?filePath=' + bannerSortList[i].bannerFile;
            let html = "<li id="+bannerSortList[i].bannerNo+">" +
                            "<div>" +
                                "<img src="+imgPath+" onerror=\"this.src='${path}/assets/img/logo/logo-noimg.gif'\" >" +
                            "</div>" +
                            "<div style=\"width: 250px; text-align: center\">" +
                                bannerSortList[i].title +
                            "</div>" +
                            "<div style=\"width: 250px; text-align: center\">" +
                                bannerSortList[i].insertDate +
                            "</div>" +
                            "<div style=\"width: 250px; text-align: center\">" +
                                bannerSortList[i].viewOrder +
                            "</div>" +
                        "</li>"
            $(".bannerSortList").append(html);
        }
    }*/

    function drawingBannerSort(bannerSortList) {
        for (let i = 0; i < bannerSortList.length; i++) {
            let imgPath = '/api/img/fileLoad?filePath=' + bannerSortList[i].bannerFile;
            let html = "<tr id="+bannerSortList[i].bannerNo+">" +
                            "<td>" +
                                bannerSortList[i].viewOrder +
                            "</td>" +
                            "<td>" +
                                convertBoardType(bannerSortList[i].boardType) +
                            "</td>" +
                            "<td>" +
                                bannerSortList[i].title +
                            "</td>" +
                            "<td>" +
                                bannerSortList[i].insertDate +
                            "</td>" +
                            "<td>" +
                                "<img src="+imgPath+" onerror=\"this.src='${path}/assets/img/logo/logo-noimg.gif'\" >" +
                            "</td>" +
                        "</tr>"
            $(".bannerSortList").append(html);
        }
    }

    function convertBoardType(boardType) {
        return boardType == 1 ? '이벤트' : '공지';
    }
</script>
</body>
</html>
