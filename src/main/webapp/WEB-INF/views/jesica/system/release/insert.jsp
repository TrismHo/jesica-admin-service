<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jesicar | 업데이트 내역</title>
    <%@include file="../../../common/include_head.jsp" %>
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
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="${path}/system/release/list"><spring:message code="side.main5" text="시스템 운영"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="${path}/system/release/list"><spring:message code="side.main5.sub1" text="업데이트 내역"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">업데이트 내역 등록<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">업데이트 내역 등록<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="insert_form" id="insert_form" class="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="insertUserName" name="insertUserName" value="${sessionScope.sessionKey.userStaffName}">
                            <input type="hidden" name="noticeNo" value="">
                            <input type="hidden" name="dataStatus" value="1">
                            <table class="table table-condensed table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light ">
                                      플랫폼명
                                    </td>
                                    <td><input type="text" class="form-control width-100" readonly value="<c:if test="${sessionScope.sessionKey.company == 'jesicar'}">제시카</c:if><c:if test="${sessionScope.sessionKey.company == 'yangpa'}">직배</c:if>" maxlength="150">
                                        <input type="hidden" class="form-control width-100" name="platformType" readonly value="<c:if test="${sessionScope.sessionKey.company == 'jesicar'}">1</c:if><c:if test="${sessionScope.sessionKey.company == 'yangpa'}">2</c:if>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light ">
                                        업데이트 공지 타입
                                    </td>
                                    <td>
                                        <select class="form-control" name="programType">
                                            <option value="1">관리자</option>
                                            <option value="2">오더앱</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light ">제목<%--<spring:message code="merchandise.insert.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td><input type="text" class="form-control width-full title" name="title" value="" maxlength="150"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">내용<%--<spring:message code="merchandise.insert.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                    <td>
                                        <textarea class="form-control width-full body" name="body" rows="10"></textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> 등록<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    $(() => {
        let basicList = "${sessionScope.sessionKey.userRole}";

        $(".btn_list").click(function() {
            location.href = "${path}/system/release/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/system/release/insert";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let registrationwassuccessful = "<spring:message code="list.script.registrationwassuccessful" text="등록에 성공하였습니다."/>";
            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";

            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);
            if (inputDataCheck(req)) {
                swal({
                    title: confirmmsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                    var formData = new FormData(document.getElementById('insert_form'));
                    formData.append("tbNoticeRelease",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(registrationwassuccessful);
                                    location.href="${path}/system/release/list";
                                } else {
                                    alert(confirmfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });
    });


    function inputDataCheck(args) {
        let entertitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요."/>";
        let entersubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요."/>";
        if (isNull(args.title)) {
            return alert_focus("title", entertitle);
        } else if (isNull(args.body)) {
            return alert_focus("body", entersubject);
        }
        return true;
    }
</script>
</body>
</html>
