<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.platformnoticedetail" text="플랫폼공지 상세"/></title>

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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="게시판 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement" text="플랫폼 공지"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticedetail" text="플랫폼공지 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticedetail" text="플랫폼공지 상세"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbNoticePlatform.insertUserId}">
                            <input type="hidden" name="noticeNo" value="${tbNoticePlatform.noticeNo}">
                            <input type="hidden" name="dataStatus" value="${tbNoticePlatform.dataStatus}">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification" text="게시물 구분"/></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="groupType" value="0" class="align-bottom" <c:if test="${tbNoticePlatform.groupType == 0}">checked</c:if>> <spring:message code="list.detail.tothewhole" text="전체에게"/>
                                        </label>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="groupType" value="8" class="align-bottom" <c:if test="${tbNoticePlatform.groupType == 8}">checked</c:if>> <spring:message code="list.detail.affiliate" text="제휴사"/>
                                        </label>
                                        <label class="">
                                            <input type="radio" name="groupType" value="4" class="align-bottom" <c:if test="${tbNoticePlatform.groupType == 4}">checked</c:if>> <spring:message code="list.detail.deliveryman1" text="드라이버"/>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.checkexposure" text="노출여부"/></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="0" class="align-bottom" <c:if test="${tbNoticePlatform.viewYn == 0}">checked</c:if>> <spring:message code="list.detail.hide" text="숨김"/>
                                        </label>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="1" class="align-bottom" <c:if test="${tbNoticePlatform.viewYn == 1}">checked</c:if>> <spring:message code="list.detail.exposure" text="노출"/>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title" text="제목"/></td>
                                    <td><input type="text" name="title" value="${tbNoticePlatform.title}" class="form-control width-full title" maxlength="150"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                    <td>
                                        <textarea name="body"  class="form-control width-full body" rows="10">${tbNoticePlatform.body}</textarea>
                                    </td>
                                </tr>
                                <%-- <tr>
                                     <td class="bg-light">첨부파일&lt;%&ndash;<spring:message code="merchandise.insert.storesalestatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;매장 판매상태&ndash;%&gt;</td>
                                     <td>
                                         <div class="category_sort">
                                             <ul class="sort_list">
                                                 <li>
                                                     <div class="sort_body" id="sort_body">
                                                         <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                     </div>
                                                 </li>
                                                 <li>
                                                     * 권장 이미지 비율 : 984*876<br><br>
                                                     <div class="fileName"></div>
                                                     <br>
                                                     <div class="fileSize"></div>
                                                 </li>
                                             </ul>
                                             <label for="imgFile">
                                                 <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                     <div>파일선택</div>
                                                 </div>
                                             </label>
                                             <input type="file" id="imgFile" name="imgFile" class="fileBtn d-none">
                                         </div>
                                     </td>
                                 </tr>--%>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5">
                        <c:if test="${sessionScope.sessionKey.userRole == 0}">
                            <button type="button" class="btn btn-danger btn_remove float-right m-t-5 m-b-5 m-r-5" noticeNo="${tbNoticePlatform.noticeNo}"><i class="fa fa-trash-alt m-r-3"></i> <spring:message code="list.detail.delete" text="삭제"/></button>
                            <button type="button" class="btn btn-primary btn_up float-right m-t-5 m-b-5 m-r-5"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                        </c:if>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
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
<%-- Custom JS End--%>

<script>
    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/board/platform/list";
        })
        $(".btn_remove").click(function() {
            let url = "${path}/api/board/platform/delete";
            let noticeNo = $(this).attr("noticeNo");
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted" text="삭제되었습니다."/>";

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
                            url: url,
                            data: {
                                noticeNo : noticeNo
                            },
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(deleted);
                                    location.href="${path}/board/platform/list";
                                } else {
                                    alert(deletionfailed);
                                    return;
                                }
                            }
                        });
                    }
                });
        })


        $(document).on("click",".btn_up",function() {
            let url = "${path}/api/board/platform/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";

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
                        formData.append("tbNoticePlatform", new Blob([JSON.stringify(req)], {type: "application/json"}));
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
    });

    function inputDataCheck(args) {
        let pleaseenterantitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요"/>";
        let pleaseenteransubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요"/>";
        if (isNull(args.title)) {
            return alert_focus("title", pleaseenterantitle);
        } else if (isNull(args.body)) {
            return alert_focus("goodsPrice",pleaseenteransubject);
        }
        return true;
    }
</script>
</body>
</html>
