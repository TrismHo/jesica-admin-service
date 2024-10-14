<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.affiliatenotice" text="제휴사 공지"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae  | <spring:message code="sidemenu.boardmanagement.affiliatenotice" text="제휴사 공지"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="게시판 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.affiliatenotice" text="제휴사 공지"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.affiliatenotice" text="제휴사 공지"/></h3>
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
                                                        <table class="table table-condensed table-bordered">
                                                            <tbody>
                                                            <tr >
                                                                <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="게시물구분"/><%--가맹점선택--%></strong></td>
                                                                <td >
                                                                    <label>
                                                                        <select class="form-control" name="groupType">
                                                                            <option value="" <c:if test="${searchValue.groupType == ''  || searchValue.groupType == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/><%--<spring:message code="merchandise.search9.option1" text="default text"/>--%><%--상품명--%></option>
                                                                            <option value="7" <c:if test="${searchValue.groupType == '7'}">selected</c:if>><spring:message code="list.search.deliverygroup" text="배송그룹"/></option>
                                                                            <option value="3" <c:if test="${searchValue.groupType == '3'}">selected</c:if>><spring:message code="list.search.franchisee" text="가맹점"/></option>
                                                                        </select>
                                                                    </label>
                                                                </td>
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
                                                        <c:if test="${sessionScope.sessionKey.userRole == 1 || sessionScope.sessionKey.userRole == 2}">
                                                            <button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                                                <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration" text="공지 등록"/></span>
                                                            </button>
                                                        </c:if>
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
            <%--<form name="frmSearch" id="frmSearch">
                <div class="search-box">
                    <div class="inner-search-box p-5">
                        <div class="row">
                            <!-- begin col-3 -->
                            <div class="col-xl-12 col-md-12 wide">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="bg-light"><strong>게시물구분&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;&lt;%&ndash;가맹점선택&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>전체&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option>내소속&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                    <option>내배송그룹&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                </select>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search8" text="default text"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                            ~
                                            <label>
                                                <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                        <td>
                                            <label>
                                                <select class="form-control">
                                                    <option>제목/내용&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                    <option>제목&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                    <option>내용&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                </select>
                                                <input type="text" class="form-control width-150">
                                            </label>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 narrow">
                                <table class="table table-condensed table-bordered">
                                    <tbody>
                                        <tr>
                                            <td class="bg-light"><strong>게시물구분&lt;%&ndash;<spring:message code="merchandise.search1" text="default text"/>&ndash;%&gt;&lt;%&ndash;가맹점선택&ndash;%&gt;</strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option>전체&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                        <option>내소속&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                        <option>내배송그룹&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search8" text="default text"/>&lt;%&ndash;등록기간&ndash;%&gt;</strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                                </label>
                                                ~
                                                <label>
                                                    <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="merchandise.search9" text="default text"/>&lt;%&ndash;검색어 입력&ndash;%&gt;</strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <option>제목/내용&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>
                                                        <option>제목&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                        <option>내용&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>
                                                    </select>
                                                    <input type="text" class="form-control width-150">
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="default text"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>--%>
            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th width="5%"><spring:message code="list.word.no" text="번호"/></th>
                        <th width="15%" class="text-center"><spring:message code="list.word.merchant/deliverygroupname" text="가맹점 / 배송그룹명"/></th>
                        <th width="20%"><spring:message code="list.detail.title" text="제목"/></th>
                        <th width=""><spring:message code="list.word.contents" text="내용"/></th>
                        <th width="10%"><spring:message code="list.word.serviceclassification" text="구분"/></th>
                        <th width="10%"><spring:message code="list.word.status" text="상태"/></th>
                        <th width="10%"><spring:message code="list.word.registrationdate" text="등록일"/></th>
                        <th width="10%"><spring:message code="list.word.modifieddate" text="수정일"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item"  items="${tbNoticeCompanyList}"  varStatus="status">
                        <tr class="detailRow" noticeNo="${item.noticeNo}">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-left">
                                <c:if test="${item.groupType == 3}">
                                    <span class="orangeColor " >[S${item.storeNo}]</span>
                                </c:if>
                                <c:if test="${item.groupType == 7}">
                                    <span class="orangeColor " >[D${item.dlvyNo}]</span>
                                </c:if>
                                <span>${item.groupName}</span>
                            </td>
                            <td class="text-center">${item.title}</td>
                            <td class="text-center">
                                <div style="overflow: hidden;
                                          margin: auto;
                                          text-overflow: ellipsis;
                                          white-space: nowrap;
                                          width: 250px;
                                          display: block;">  ${item.body}
                                </div>
                            </td>
                            <td class="text-center" style=""><c:if test="${item.groupType == 0}"><spring:message code="list.word.all" text="전체"/></c:if>
                                <c:if test="${item.groupType == 3}"><spring:message code="list.word.franchisee" text="가맹점"/></c:if><c:if test="${item.groupType == 7}"><spring:message code="list.word.deliverygroup" text="배송그룹"/></c:if></td>
                            <td class="text-center">
                                <c:if test="${item.viewYn == 0}"><span class="text-red"><spring:message code="list.word.hide" text="숨김"/></span></c:if>
                                <c:if test="${item.viewYn == 1}"><spring:message code="list.word.exposure" text="노출"/></c:if>
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
            location.href = '${path}/board/company/insert';
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
        let noticeNo = $(this).attr("noticeNo");
        location.href = "${path}/board/company/detail?noticeNo="+noticeNo;
    });
</script>
</body>
</html>
