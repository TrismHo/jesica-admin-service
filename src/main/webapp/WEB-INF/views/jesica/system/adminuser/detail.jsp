<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.systemproductdetails" text="시스템 상품상세"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.system1" text="시스템 운영"/></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.system.systemmerchandise1" text="사용자 관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.systemproductdetails1" text="사용자 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.systemproductdetails1" text="사용자 상세"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="timeline-header m-t-10 m-b-10">
                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                        <span><strong><spring:message code="list.detail.basicInformation" text="기본 정보"/></strong>

                        </span>
                    </div>
                    <form id="update_form" class="update_form">
                        <input type="hidden" class="userNo" name="userNo" value="${userNo}">
                        <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.id1" text="등급"/></td>
                                <td>
                                    <input type="text" class="form-control width-full" value="<c:if test="${tbUserStaff.roleType == 1}">마스터</c:if><c:if test="${tbUserStaff.roleType == 2}">사용자</c:if>" placeholder="" disabled>

                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourid11" text="현재 사용자의 등급입니다.(수정불가)"/></td>
                            </tr>
                            <tr>
                                <td class="bg-light width-150"><spring:message code="list.detail.id" text="아이디"/></td>
                                <td class="width-500"><input type="text" class="form-control width-full userId upUserId" name="upUserId" value="${tbUserStaff.userId}" placeholder="아이디를 입력해주세요" disabled>
                                    <input type="hidden"class="upUserId" name="userId" value="${tbUserStaff.userId}">
                                </td>
                                <td class="text-danger-darker "><spring:message code="list.description.pleaseenteryourid1" text="수정불가"/></td>
                            </tr>
                         <%-- <tr>
                                <td class="bg-light"><spring:message code="list.detail.oldpassword" text="기존 패스워드"/></td>
                                <td><input type="text" class="form-control width-full userOldPwd" name="userOldPwd" value="" placeholder="<spring:message code="list.detail.pleaseenteranewpassword1" text="기존 패스워드를 입력해주세요"/>" maxlength="60"></td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteranewpassword1" text="기존 패스워드를 입력해주세요(기존패스워드가 일치하여야만 정보수정이 가능합니다.)"/> </td>
                            </tr>--%>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.newpassword1" text="신규 패스워드"/></td>
                                <td><input type="text" class="form-control width-full userPwd upUserPwd" name="userPwd" value="" placeholder="<spring:message code="list.detail.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/>" maxlength="60"></td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteranewpassword" text="신규 패스워드를 입력해주세요 (미입력시 기존패스워드로 저장)"/> </td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.username" text="사용자 이름"/></td>
                                <td><input type="text" class="form-control width-full name upName" name="name" value="${tbUserStaff.name}" placeholder="<spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/> " maxlength="20"></td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/> </td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></td>
                                <td><input type="text" class="form-control width-full phone upPhone" name="phone" value="${tbUserStaff.phone}" placeholder="<spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/>" maxlength="20"></td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/> </td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.status" text="상태"/></td>
                                <td>
                                    <select class="form-control upDataStatus" name="dataStatus">
                                        <option value="0" <c:if test="${tbUserStaff.dataStatus == 0}">selected</c:if>> <spring:message code="list.detail.delete" text="삭제"/></option>
                                        <option value="1" <c:if test="${tbUserStaff.dataStatus == 1}">selected</c:if>> <spring:message code="list.detail.normal" text="정상"/></option>
                                        <option value="2" <c:if test="${tbUserStaff.dataStatus == 2}">selected</c:if>> <spring:message code="list.detail.stop" text="정지"/></option>
                                    </select>
                                    <label class="m-l-10 blockTypeCodeSel" style="display: <c:if test="${tbUserStaff.dataStatus == 1}" >none</c:if>">
                                        정지/삭제사유 :
                                        <select class="blockTypeCode" name="blockTypeCode">
                                            <c:forEach var="item" items="${systemCodeList}" varStatus="status">
                                              <option value="${item.sysCode}" <c:if test="${tbUserStaff.blockTypeCode == item.sysCode}" >selected</c:if> > ${item.codeName} </option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber1" text="상태를 선택해주세요"/></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                <td><input type="text" class="form-control width-full memo upMemo" name="memo" value="${tbUserStaff.memo}" placeholder="<spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>" maxlength="200"></td>
                                <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.111" text="등록자"/></td>
                                <td><input type="text" class="form-control width-full "  value="${tbUserStaff.insertUserId}" placeholder="" disabled>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.11" text="수정불가"/></td>
                            </tr>
                            <tr>
                                <td class="bg-light"><spring:message code="list.detail.memo2" text="등록일"/></td>
                                <td><input type="text" class="form-control width-full memo "  value="<javatime:format value="${tbUserStaff.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />" maxlength="200" disabled></td>
                                <td class="text-danger-darker"><spring:message code="list.description.11" text="수정불가"/></td>
                            </tr>
                        </table>
                    </form>

                    <div class="m-l-5">
                        <%--<button type="button" class="btn btn-danger btn_remove float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-trash-alt m-r-3"></i> 삭제&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>--%>
                            <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                            <c:if test="${tbUserStaff.roleType != 1}"><button type="button" class="btn btn-primary btn_update float-left m-t-5 m-b-5 m-r-5" onclick="udt_btn()"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button></c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>

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

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<%-- Custom JS End--%>

<script>


    $(() => {

        $(".upDataStatus").on("change",function (){
            var radioVal = $('.upDataStatus option:selected').val();
            if(radioVal == 1){
                $(".blockTypeCodeSel").css("display","none");
            } else {
                $(".blockTypeCodeSel").css("display","inline");
            }
        });

        $("input[name=goodsPrice]").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });

        $(".btn_list").click(function() {
            location.href = "${path}/system/master/list";
        });


        let date = new Date();
        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $("#endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker('setDate', date);
    });

    function udt_btn() {
        let url = "${path}/api/userStaff/update/action";
        //let url2 = "${path}/api/userStaff/oldpass/confirm";
        let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let correctionwassuccessful = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실페하였습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let _forms = $('.update_form');
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
                    var formData = new FormData(document.getElementById('update_form'));
                    formData.append("tbUserStaffData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                alert(correctionwassuccessful);
                                location.reload();
                            } else {
                                alert(editfailed);
                                return;
                            }
                        }
                    });
                    //기존 패스워드 검사
                  /* $.ajax({
                        type: "POST",
                        url: url2,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.result == 200) {
                                $.ajax({
                                    type: "POST",
                                    url: url,
                                    data: formData,
                                    dataType: "json",
                                    processData: false,
                                    contentType: false,
                                    success: function (data) {
                                        if (data.result == 200) {
                                            alert(correctionwassuccessful);
                                            location.reload();
                                        } else {
                                            alert(editfailed);
                                            return;
                                        }
                                    }
                                });
                            } else {
                                alert("기존패스워드가 일치하지 않습니다.");
                                return;
                            }
                        }
                    });*/


                }
            });
        }
    }

    function inputDataCheck(args) {
        if (isNull(args.userId)) {
            return alert_focus("userId", "아이디를 입력해주세요.");
        } /*else if (isNull(args.userOldPwd)) {
            return alert_focus("userOldPwd", "기존 비밀번호를 입력해주세요.");
        } */else if (isNull(args.name)) {
            return alert_focus("name", "이름를 입력해주세요.");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "전화번호를를 입력해주세요.");
        }
        return true;
    }


</script>
</body>
</html>
