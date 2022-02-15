<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.eventnoticedetails" text="이벤트 관리상세"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 공지"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.eventnoticedetails" text="이벤트 관리상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.eventnoticedetails" text="이벤트 관리상세"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="update_form" id="update_form" class="update_form">
                            <%--<input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">--%>
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbEvent.insertUserId}">
                            <input type="hidden" name="eventNo" value="${tbEvent.eventNo}">
                            <input type="hidden" name="dataStatus" value="${tbEvent.dataStatus}">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.checkexposure" text="노출여부"/></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="0" class="align-bottom" <c:if test="${tbEvent.viewYn == 0}">checked</c:if>> <spring:message code="list.detail.hide" text="숨김"/>
                                        </label>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="1" class="align-bottom" <c:if test="${tbEvent.viewYn == 1}">checked</c:if>> <spring:message code="list.detail.exposure" text="노출"/>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.checkexposure1" text="시작일/종료일"/></td>
                                    <td>
                                        <label >
                                            <input type="text" value="<javatime:format value="${tbEvent.startDate}" pattern="yyyy-MM-dd " />" class="form-control align-bottom startDate" >
                                        </label>
                                        ~
                                        <label >
                                            <input type="text" value="<javatime:format value="${tbEvent.endDate}" pattern="yyyy-MM-dd " />" class="form-control align-bottom endDate" >
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title" text="제목"/></td>
                                    <td><input type="text" name="title" value="${tbEvent.title}" class="form-control width-full title" maxlength="150"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                    <td>
                                        <textarea  id="body"  class="form-control width-full ckeditor" rows="20">${tbEvent.body}</textarea>
                                        <textarea style="display: none;"  name="body"  class="body" rows="10">${tbEvent.body}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="등록 사용자(등록일)"/></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            ${tbEvent.insertUserId} (<javatime:format value="${tbEvent.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />)
                                        </label>
                                    </td>
                                </tr>
                                <%-- <tr>
                                     <td class="bg-light"><spring:message code="list.detail.attachments" text="첨부파일"/></td>
                                     <td>
                                         <div class="category_sort">
                                             <ul class="sort_list">
                                                 <li>
                                                     <div class="sort_body" id="sort_body">
                                                         <img style="width: 150px;" class="storeImg4" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                         &lt;%&ndash;<img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">&ndash;%&gt;
                                                     </div>
                                                 </li>
                                                 <li>
                                                     * <spring:message code="list.detail.recommendedimageratio" text="권장 이미지 비율"/> : 984*876<br><br>
                                                     <div class="fileName"></div>
                                                     <br>
                                                     <div class="fileSize"></div>
                                                 </li>
                                             </ul>
                                             <label for="imgFileSmallFile">
                                                 <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                     <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                 </div>
                                             </label>
                                             <input type="file" id="imgFileSmallFile" name="imgFileSmallFile" value="${tbEvent.imgFileSmall}" class="fileBtn d-none">
                                             <input type="hidden" name="imgFileSmall" value="${tbEvent.imgFileSmall}">
                                         </div>
                                     </td>
                                 </tr>--%>

                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5">
                        <button type="button" class="btn btn-danger btn_remove float-right m-t-5 m-b-5 m-r-5" eventNo="${tbEvent.eventNo}"><i class="fa fa-trash-alt m-r-3"></i> <spring:message code="list.detail.delete" text="삭제"/></button>
                        <button type="button" class="btn btn-primary btn_up float-right m-t-5 m-b-5 m-r-5"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
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
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    let url4 = "${path}/api/img/fileLoad?filePath="+encodeURI("${imgFileSmall}");

    CKEDITOR.replace('body', { filebrowserUploadUrl: '${path}/api/file/upload',
        font_names: '맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana',
        font_defaultLabel: '맑은 고딕/Malgun Gothic',
        fontSize_defaultLabel: '12',
        allowedContent : true,

        language: 'ko', });

   /* CKEDITOR.instances['body'].on('contentDom', function() {
        this.document.on('click', function(event){
            //your code
            alert('Click Event');
        });
    });*/
    $(".storeImg4").attr("src",url4);

    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/board/event/list";
        })

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".btn_remove").click(function() {
            let url = "${path}/api/board/event/delete";
            let eventNo = $(this).attr("eventNo");
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
                            eventNo : eventNo
                        },
                        /*contentType: "application/json;",*/
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 200) {
                                alert(deleted);
                                location.href="${path}/board/event/list?dataStatus=OK";
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
            let url = "${path}/api/board/event/update";
            var value = CKEDITOR.instances['body'].getData();
            $(".body").text(value);
            let startDate = $(".startDate").val();
            let endDate = $(".endDate").val();
            $(".startDate").val(startDate);
            $(".endDate").val(endDate);
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            if($(".startDate").val() == "" || $(".endDate").val() == ""){
                alert("시작일/종료일을 입력해주세요.");
                return;
            }

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
                        formData.append("tbEvent", new Blob([JSON.stringify(req)], {type: "application/json"}));
                        formData.append("startDate", startDate);
                        formData.append("endDate",  endDate);
                        /*formData.append("imgFileSmall", _forms.find('#imgFileSmallFile')[0]);*/
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
        //썸네일
        $(document).on("change", "#imgFileSmallFile", function (e) {
            e.preventDefault();
            let imagetochange = "<spring:message code="list.script.imagetochange" text="변경할 이미지"/>";
            let sizemsg = "<spring:message code="list.script.size" text="용량"/>";
            var file = $("#imgFileSmallFile")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body.innerHTML = '';
                    sort_body.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFileSmallFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName').text(imagetochange +" :" + filename);
            $('.fileSize').text(sizemsg+ " :" + file.size + " Byte");

            return false;
        });
    });

    function inputDataCheck(args) {
        let pleaseenterantitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요"/>";
        let pleaseenteransubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요"/>";
        if (isNull(args.title)) {
            return alert_focus("title", pleaseenterantitle);
        } else if (isNull(args.body)) {
            return alert_focus("body", pleaseenteransubject);
        }
        return true;
    }
</script>
</body>
</html>
