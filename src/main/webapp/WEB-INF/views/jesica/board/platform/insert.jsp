<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.platformnoticeregistration" text="플랫폼 공지등록"/></title>

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
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticeregistration" text="플랫폼 공지등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.platformnoticeregistration" text="플랫폼 공지등록"/><%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="insert_form" id="insert_form" class="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" name="viewYn" value="1">
                            <input type="hidden" name="dataStatus" value="OK">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification" text="게시물 구분"/></td>
                                    <td>
                                        <%-- <label class="m-r-10 ">
                                             <input type="radio" name="groupType" value="0" class="align-bottom" 객><spring:message code="list.detail.tothewhole" text="전체에게"/>
                                         </label>--%>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="groupType" value="5" class="m-t-1 m-r-3" checked>
                                            <span><spring:message code="list.detail.affiliate1" text="고객"/></span>
                                        </label>
                                        <label class="" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="groupType" value="4" class="m-t-1 m-r-3">
                                            <span><spring:message code="list.detail.deliveryman1" text="드라이버"/></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification" text="플랫폼 구분"/></td>
                                    <td>
                                        <%--<label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="0" class="m-t-1 m-r-3" checked>
                                            <span><spring:message code="list.detail.affiliate1" text="사용안함"/></span>
                                        </label>--%>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" checked>
                                            <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                        </label>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3">
                                            <span><spring:message code="list.detail.deliveryman1" text="양파오더"/></span>
                                        </label>
                                        <label class="" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="3" class="m-t-1 m-r-3">
                                            <span><spring:message code="list.detail.deliveryman1" text="세차히기좋은날"/></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title" text="제목"/></td>
                                    <td><input type="text" name="title" class="form-control width-full title" maxlength="150"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                    <td>
                                        <textarea  id="body"  class="form-control width-full  ckeditor" rows="40" style="height: 500px"></textarea>
                                        <input type="hidden" name="body" class="body" value="">
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
                            <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/></button>
                        </c:if>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
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
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    CKEDITOR.replace('body', { filebrowserUploadUrl: '${path}/api/file/upload/platform',
        font_names: '맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana',
        font_defaultLabel: '맑은 고딕/Malgun Gothic',
        fontSize_defaultLabel: '12',
        allowedContent : true,
        language: 'ko',
    });
    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/board/platform/list?groupType=&dataStatus=OK&title=&startDate=2020-01-01&endDate=${now}";
        })


        $(document).on("click",".btn_add",function() {
            let confirmfailmsg = "<spring:message code="list.script.registrationfailed11" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let registrationwassuccessful = "<spring:message code="list.script.registrationwassuccessful" text="등록에 성공하였습니다."/>";
            var value = CKEDITOR.instances['body'].getData();
            $(".body").val(value);
            let url = "${path}/api/board/platform/insert";
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
                        formData.append("tbNoticePlatform",  new Blob([JSON.stringify(req)], {type:"application/json"}));
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
                                    location.href = "${path}/board/platform/list?groupType=&dataStatus=OK&title=&startDate=2020-01-01&endDate=${now}";
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
        console.log(args);
        let entertitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요"/>";
        let entersubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요"/>";
        if (isNull(args.title)) {
            return alert_focus("title", entertitle);
        } else if (isNull(args.body)) {
            return alert_focus("goodsPrice", entersubject);
        }
        return true;
    }
</script>
</body>
</html>
