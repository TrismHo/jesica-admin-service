<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="sidemenu.boardmanagement.platformannouncement" text="고객 관리"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="사용자 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement" text="고객 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement" text="고객 관리"/></h3>
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
                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="회원여부"/></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control" name="isMember">
                                                        <option value="" <c:if test="${searchValue.isMember == ''  || searchValue.isMember == null}">selected</c:if>><spring:message code="list.search.all1" text="전체"/></option>
                                                        <option value="1" <c:if test="${searchValue.isMember == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="회원"/></option>
                                                        <option value="0" <c:if test="${searchValue.isMember == '0'}">selected</c:if>><spring:message code="list.search.deliverymanname1" text="비회원"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.stateofuse1" text="사용상태"/></strong></td>
                                            <td>
                                                <div class="row">
                                                </div>
                                                <label>
                                                    <select class="form-control dataStatus" name="dataStatus">
                                                        <option value="" <c:if test="${searchValue.dataStatus == ''  || searchValue.dataStatus == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                        <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>><spring:message code="list.search.normal1" text="정상"/></option>
                                                        <option value="STOP" <c:if test="${searchValue.dataStatus == 'STOP'}">selected</c:if>><spring:message code="list.search.stop1" text="정지"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.registrationperiod" text="가입기간"/><%--등록기간--%></strong></td>
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
                                                    <select class="form-control" style="width: 110px">
                                                        <option><spring:message code="list.search.title" text="이름"/></option>
                                                    </select>
                                                    <input type="text" class="form-control width-150" name="custName" value="${searchValue.custName}" maxlength="150">
                                                </label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <%--<button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration" text="고객등록"/></span>
                                    </button>--%>
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
                        <th width="10%"><spring:message code="list.detail.title" text="이름"/></th>
                        <th width=""><spring:message code="list.word.contents" text="휴대폰번호"/></th>
                        <th width="10%"><spring:message code="list.word.status1" text="성별"/></th>
                        <th width="10%"><spring:message code="list.word.serviceclassification" text="로그인ID"/></th>
                        <th width="10%"><spring:message code="list.word.status" text="캐쉬"/></th>
                        <th width="10%"><spring:message code="list.word.status1" text="마일리지"/></th>
                        <th width="10%"><spring:message code="list.word.status1" text="회원여부"/></th>
                        <th width="10%"><spring:message code="list.word.registrationdate" text="가입일"/></th>
                        <th width="10%"><spring:message code="list.word.modifieddate" text="수정일"/></th>
                        <th width="10%"><spring:message code="list.word.modifieddate" text="비밀번호"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${custList}" varStatus="status">
                        <tr>
                            <td class="text-center detailRow" custNo="${item.custNo}">${status.index + 1}</td>
                            <td class="text-center detailRow" custNo="${item.custNo}">${item.custName}</td>
                            <td class="text-center detailRow" custNo="${item.custNo}">${item.custTel}</td>
                            <td class="text-center detailRow" custNo="${item.custNo}">
                                <c:if test="${item.gender == 'M'}"><spring:message code="list.search.all" text="남성"/></c:if>
                                <c:if test="${item.gender == 'F'}"><spring:message code="list.word.franchisee1" text="여성"/></c:if>
                                <c:if test="${item.gender == 'N'}"><spring:message code="list.word.franchisee1" text="알수없음"/></c:if>
                            </td>
                            <td class="text-center detailRow" custNo="${item.custNo}">${item.loginId}</td>
                            <td class="text-center detailRow" custNo="${item.custNo}">${item.cash}</td>
                            <td class="text-center detailRow" custNo="${item.custNo}">${item.mileage}</td>
                            <td class="text-center detailRow" custNo="${item.custNo}">
                                <c:if test="${item.isMember == 1}"><spring:message code="list.search.all" text="회원"/></c:if>
                                <c:if test="${item.isMember == 0}"><spring:message code="list.word.franchisee1" text="비회원"/></c:if>
                            </td>
                            <td class="text-center detailRow" custNo="${item.custNo}"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center detailRow" custNo="${item.custNo}"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd" /></td>
                            <td class="text-center">
                                <button type="button" data-toggle="modal" data-target="#password_modal" class="btn btn-warning btn-pwd" custNo="${item.custNo}">
                                    <i class="fa fa-lock"></i>
                                    <span class="m-l-5"><spring:message code="list.detail.list" text="비밀번호 변경"/></span>
                                </button>
                            </td>
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
<div class="modal fade" id="password_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="passwordManagement.jsp" %>
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
        $("#testTable").DataTable({
            language : lang_set, //or lang_eng
        });

        $(".detailRow").click(function() {
            let custNo = $(this).attr("custno");
            location.href = "${path}/user/cust/detail?custNo=" + custNo;
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

        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(endDate == "") {
            $(".endDate").datepicker('setDate', date);
        } else {
            $(".endDate").datepicker('setDate', endDate);
        }

        $(".btn-pwd").click(function () {
            let custNo = $(this).attr("custno");
            $("#custNo").val(custNo);
            $("#loginPwd").val('');
        });

        $(".update_pwd_btn").click(function() {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정 되었습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";

            let url = "${path}/api/user/cust/updatePwd";
            let _forms = $('.update_pwd_form');
            let req = convertFormToObj(_forms);

            if (inputDataCheck(req)) {
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
                            type: "PUT",
                            url,
                            data: JSON.stringify(req),
                            contentType: "application/json",
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    modalHide($('#password_modal'));
                                    alert(updatesussmsg);
                                } else {
                                    alert(editfailed);
                                    return;
                                }
                            }
                        });
                    }
                })
            }
        });
    });

    function inputDataCheck(args) {
        if (isNull(args.loginPwd)) {
            return alert_focus("userId", "변경할 비밀번호를 입력해주세요.");
        }
        return true;
    }
</script>
</body>
</html>
