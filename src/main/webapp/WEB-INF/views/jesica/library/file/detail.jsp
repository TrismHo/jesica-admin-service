<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jig-Bae | <spring:message code="list.detail.libNoticedetails" text="자료실"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="list.detail.libNoticedetails" text="자료실"/></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.libNoticedetails" text="자료실 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.libNoticedetails" text="자료실 상세"/></h3>
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
                                    <td class="bg-light"><spring:message code="list.detail.title" text="제목"/></td>
                                    <td>${tbLibrary.fileTitle}</td>
                                    <td rowspan="4" class="m-0 p-t-5" style="vertical-align: top;">
                                        <table class="table table-striped table-borderless table-sm m-0 p-0 text-nowrap ">
                                            <thead>
                                            <tr class="border-bottom">
                                                <th class="w-10px ps-10px"></th>
                                                <th class="px-10px">Name</th>
                                                <th class="px-10px w-100px">Size</th>
                                                <th class="px-10px w-200px">CreateDate</th>
                                                <th class="px-10px w-200px">Type</th>
                                                <th class="px-10px w-200px">download</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${files}" varStatus="status">
                                                <tr  class="filebox cursor-pointer" onclick="downloadFile(`${item.fileOriginName}`,`${item.fileName}`,`${item.filePath}`,`${item.fileContentType}`)">
                                                    <td class="ps-10px border-0 text-center">
                                                        <a class="" >
                                                            <c:if test="${item.fileContentType == 'image/png'}">
                                                            <i class="far fa-image text-body text-opacity-50 fa-lg"  ></i></a>
                                                        </c:if>
                                                        <c:if test="${item.fileContentType == 'application/pdf'}">
                                                            <i class="far fa-file-pdf text-body text-opacity-50 fa-lg " ></i></a>
                                                        </c:if>
                                                        <c:if test="${item.fileContentType == 'application/zip'}">
                                                            <i class="far fa-file-alt text-body text-opacity-50 fa-lg"></i></a>
                                                        </c:if>
                                                    </td>
                                                    <td class="px-10px border-0">${item.fileOriginName}</td>
                                                    <td class="px-10px">${item.fileSize} byte</td>
                                                    <td class="px-10px"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd" /></td>
                                                    <td class="px-10px">${item.fileContentType}</td>
                                                    <td class="px-10px"> <a class="" onclick="downloadFile(`${item.fileOriginName}`,`${item.fileName}`,`${item.filePath}`,`${item.fileContentType}`)">
                                                        <i class="fas me-10px fa-download text-opacity-50 fa-lg"></i>
                                                            <%--<i class="far fa-file-download text-body text-opacity-50 fa-lg"  ></i>--%>
                                                    </a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                    <td style="height: 200px;">
                                        <div class=" h-100">
                                            ${tbLibrary.fileBody}
                                        </div>
                                       <%-- <textarea   name="body"  class="body form-control w-100" rows="10">${tbLibrary.fileBody}</textarea>--%>
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
    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/library/file/list";
        })
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
