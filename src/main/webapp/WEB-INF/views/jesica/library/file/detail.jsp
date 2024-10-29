<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jig-Bae | <spring:message code="list.detail.libNoticedetails" text="관리자 자료"/></title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="자료실"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><spring:message code="list.detail.libNoticedetails" text="관리자 자료"/></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.libNoticedetails" text="관리자 자료상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.libNoticedetails" text="관리자 자료상세"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="update_form" id="update_form" class="update_form">
                            <%--<input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">--%>
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbLibrary.insertUserId}">
                            <input type="hidden" name="libNo" value="${tbLibrary.libNo}">
                            <input type="hidden" name="dataStatus" value="${tbLibrary.dataStatus}">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="앱코드"/></td>
                                    <td>
                                        <c:if test="${empty appCode}">
                                            <select name="appCode" class="form-control w-25" >
                                                <option value="">전체</option>
                                                <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                    <option value="${appCodeList.sysCode}"<c:if test="${tbLibrary.appCode == appCodeList.sysCode}">selected</c:if>>${appCodeList.sysCode} (${appCodeList.codeName})</option>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                        <c:if test="${!empty appCode}">
                                            <input type="text" class="form-control" name="appCode" readonly value="${tbLibrary.appCode}">
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title" text="제목"/></td>
                                    <td><input type="text" name="title" value="${tbLibrary.fileTitle}" class="form-control width-full title" maxlength="150"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                    <td>
                                        <textarea   name="body"  class="body form-control w-100" rows="10">${tbLibrary.fileBody}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="등록 사용자(등록일)"/></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            ${tbLibrary.insertUserId} (<javatime:format value="${tbLibrary.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />)
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table id="searchCustTable" class="display table table-bordered w-100 table-striped cust-list ">
                                            <thead>
                                            <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="파일명"/></th>
                                            <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="파일크기"/></th>
                                            <th class="text-center" style="width: 30px;" ></th>
                                            </thead>
                                            <tbody id="file-list" class="file-list" style="">
                                            <%-- <tr><td colspan="4" style="text-align: center; background-color: #e4e4e4; border:1px solid #9e9e9e; height: 498px;">파일이 없습니다.</td> </tr>--%>
                                          <%--  <tr class="none-file">
                                                <td colspan="4" class="text-center ">파일이 존재하지 않습니다.</td>
                                            </tr>--%>
                                            <c:forEach var="item" items="${files}" varStatus="status">
                                                <tr  class="filebox">
                                                    <td class="fileName text-center">${item.fileOriginName}</td>
                                                    <td class="fileName text-center">${item.fileSize} byte</td>
                                                    <td class="fileSize text-center"><a class="" onclick="downloadFile(`${item.fileOriginName}`,`${item.fileName}`,`${item.filePath}`,`${item.fileContentType}`)">
                                                        <c:if test="${item.fileContentType == 'image/png'}">
                                                             <i class="far fa-image"  style="font-size: 20px;"></i></a>
                                                        </c:if>
                                                        <c:if test="${item.fileContentType == 'application/pdf'}">
                                                            <i class="far fa-file-pdf " style="font-size: 20px;"></i></a>
                                                        </c:if>
                                                        <c:if test="${item.fileContentType == 'application/zip'}">
                                                            <i class="far fa-file-alt " style="font-size: 20px;"></i></a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5">

                        <c:if test="${permission == 2}">
                            <button type="button" class="btn btn-danger btn_remove float-right m-t-5 m-b-5 m-r-5" libNo="${tbLibrary.libNo}"><i class="fa fa-trash-alt m-r-3"></i> <spring:message code="list.detail.delete" text="삭제"/></button>
                            <button type="button" class="btn btn-primary btn_up float-right m-t-5 m-b-5 m-r-5"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                            <button type="button" class="btn btn-blue btn_push float-right m-t-5 m-b-5 m-r-5" libNo="${tbLibrary.libNo}"><i class="fa fa-caret-right m-r-3"></i> <spring:message code="list.detail.delete" text="푸시발송(전체)"/></button>
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
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>

   /* CKEDITOR.instances['body'].on('contentDom', function() {
        this.document.on('click', function(event){
            //your code
            alert('Click Event');
        });
    });*/

    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/board/event/list";
        })

        $(".btn_remove").click(function() {
            let url = "${path}/api/board/event/delete";
            let libNo = $(this).attr("libNo");
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
                            libNo : libNo
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
        });

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
                        formData.append("tbLibrary", new Blob([JSON.stringify(req)], {type: "application/json"}));
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
    });


   function downloadFile(fileOriginName,fileName,filePath,fileContentType) {
       let url = "${path}/api/file/download?filePath="+encodeURI(filePath)+"&fileOriginName="+fileOriginName+"&fileName="+fileName+"&contentType="+fileContentType;

       location.href=url;
   }
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
