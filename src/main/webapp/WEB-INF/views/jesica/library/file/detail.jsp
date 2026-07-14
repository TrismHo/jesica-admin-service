<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>상생온동네 | <spring:message code="list.detail.libNoticedetails" text="자료실"/></title>

    <style>
        .edit-only { display:none; }
        .is-edit .edit-only { display:block; }
        .is-edit .view-only { display:none; }

        tr.file-deleting { opacity: .5; }
        a.delete { cursor:pointer; }

        .library-shell{
            border: 1px solid rgba(0,0,0,.08);
            background: #fff;
        }

        .library-main{
            display: flex;
            align-items: stretch;
            min-height: 680px;
        }

        .library-left{
            width: 50%;
            background: #fff;
        }

        .library-right{
            flex: 1;
            min-width: 0;
            border-left: 1px solid rgba(0,0,0,.08);
            background: #fbfbfc;
        }

        .section-head{
            padding: 10px 12px;
            border-bottom: 1px solid rgba(0,0,0,.08);
            background: #f1f3f5;
        }

        .section-title{
            margin: 0;
            font-size: 14px;
            font-weight: 700;
            color: #222;
        }

        .section-body{
            padding: 14px;
        }

        .admin-panel{
            border: 1px solid #cfd6dd;
            background: #fff;
        }

        .admin-info-wrap{
            background: #fff;
        }

        .admin-info-row{
            display: table;
            width: 100%;
            table-layout: fixed;
            border-bottom: 1px solid #d9dee3;
        }

        .admin-info-row:last-child{
            border-bottom: 0;
        }

        .admin-info-label,
        .admin-info-value{
            display: table-cell;
            vertical-align: middle;
        }

        .admin-info-label{
            width: 118px;
            padding: 14px 12px;
            background: #f7f8fa;
            border-right: 1px solid #d9dee3;
            font-size: 12px;
            font-weight: 700;
            color: #333;
            text-align: left;
            white-space: nowrap;
        }

        .admin-info-value{
            padding: 12px;
            background: #fff;
            color: #222;
            font-size: 13px;
            line-height: 1.6;
            min-width: 0;
        }

        .admin-view-text{
            min-height: 20px;
            white-space: pre-wrap;
            word-break: break-word;
            color: #222;
        }

        .admin-body-text{
            min-height: 240px;
        }

        .admin-meta-text{
            color: #444;
        }

        .admin-input{
            width: 100% !important;
            height: 36px !important;
            padding: 6px 10px !important;
            border: 1px solid #bfc7cf !important;
            border-radius: 0 !important;
            box-shadow: none !important;
            background: #fff !important;
            font-size: 13px !important;
            color: #222 !important;
        }

        .admin-input:focus{
            border-color: #7ea6d9 !important;
            box-shadow: inset 0 0 0 1px #7ea6d9 !important;
        }

        .admin-select{
            width: 220px !important;
            max-width: 100%;
            height: 36px !important;
            padding: 6px 10px !important;
            border: 1px solid #bfc7cf !important;
            border-radius: 0 !important;
            box-shadow: none !important;
            background: #fff !important;
            font-size: 13px !important;
            color: #222 !important;
        }

        .admin-select:focus{
            border-color: #7ea6d9 !important;
            box-shadow: inset 0 0 0 1px #7ea6d9 !important;
        }

        .admin-textarea{
            height: 240px !important;
            resize: vertical;
            line-height: 1.6 !important;
            padding-top: 10px !important;
        }

        .body-row .admin-info-label{
            vertical-align: top;
            padding-top: 14px;
        }

        .body-row .admin-info-value{
            vertical-align: top;
        }

        .type-view-wrap{
            display: flex;
            align-items: center;
            gap: 8px;
            min-height: 24px;
            flex-wrap: wrap;
        }

        .type-badge{
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 70px;
            height: 26px;
            padding: 0 10px;
            border: 1px solid #cfd6dd;
            background: #f7f8fa;
            color: #333;
            font-size: 12px;
            font-weight: 700;
            line-height: 24px;
            white-space: nowrap;
        }

        .type-badge.common{
            border-color: #9fb7d8;
            background: #f3f7fc;
            color: #1f5b96;
        }

        .type-badge.agency{
            border-color: #bdd2b7;
            background: #f5faf3;
            color: #357a38;
        }

        .type-badge.user{
            border-color: #d8c29f;
            background: #fff9ef;
            color: #8a5a13;
        }

        .type-badge.food{
            border-color: #e1b7b7;
            background: #fff5f5;
            color: #9a3b3b;
        }

        .type-badge.local{
            border-color: #b7c8df;
            background: #f4f8ff;
            color: #315d91;
        }

        .type-desc{
            color: rgba(0,0,0,.45);
            font-size: 12px;
        }

        .char-row {
            margin-top: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px;
            font-size: 12px;
            color: rgba(0,0,0,.45);
        }

        .char-count {
            font-weight: 700;
            color: #666;
        }

        .char-count.is-over {
            color: #dc3545;
        }

        .bottom-actions{
            margin-top: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
            padding-top: 2px;
        }

        .bottom-actions-left,
        .bottom-actions-right{
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .bottom-actions .btn{
            min-width: 84px;
            border-radius: 0 !important;
            font-weight: 600;
            box-shadow: none !important;
        }

        .file-toolbar{
            padding: 10px 12px;
            border-bottom: 1px solid rgba(0,0,0,.08);
            background: #f7f8fa;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
            flex-wrap: wrap;
        }

        .file-toolbar-left,
        .file-toolbar-right{
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .file-toolbar-hint{
            font-size: 12px;
            color: rgba(0,0,0,.45);
        }

        .file-tree-header{
            padding: 10px 12px;
            border-bottom: 1px solid rgba(0,0,0,.08);
            background: #fff;
            font-size: 13px;
            color: #444;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .file-tree-header .fa-folder-open{
            color: #d6a100;
        }

        .file-scroll{
            max-height: 620px;
            overflow: auto;
            background: #fff;
        }

        .file-table{
            margin: 0 !important;
        }

        .file-table thead tr{
            border-bottom: 1px solid rgba(0,0,0,.08);
            background: #f8f9fa;
        }

        .file-table thead th{
            position: sticky;
            top: 0;
            z-index: 5;
            background: #f8f9fa;
            font-weight: 700;
            color: #333;
        }

        .file-table td,
        .file-table th{
            padding-top: 11px !important;
            padding-bottom: 11px !important;
            vertical-align: middle !important;
        }

        .file-row{
            transition: background-color .12s ease, opacity .12s ease;
        }

        .file-row:hover{
            background: #fafafa;
        }

        .file-badge-new{
            display: inline-block;
            margin-left: 6px;
            padding: 2px 8px;
            font-size: 11px;
            font-weight: 700;
            color: #4b5563;
            background: #eef1f4;
        }

        .file-empty{
            padding: 40px 12px;
            text-align: center;
            color: rgba(0,0,0,.45);
            font-size: 13px;
        }

        .delete-col{
            text-align: center;
        }

        .file-type{
            max-width: 100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        @media (max-width: 1200px){
            .library-main{
                flex-direction: column;
            }

            .library-left{
                width: 100%;
            }

            .library-right{
                width: 100%;
                min-width: 0;
                border-left: 0;
                border-top: 1px solid rgba(0,0,0,.08);
            }

            .file-scroll{
                max-height: unset;
            }
        }

        @media (max-width: 768px){
            .admin-info-row,
            .admin-info-label,
            .admin-info-value{
                display: block;
                width: 100%;
            }

            .admin-info-label{
                border-right: 0;
                border-bottom: 1px solid #d9dee3;
            }

            .admin-body-text,
            .admin-textarea{
                min-height: 180px;
                height: 180px !important;
            }

            .admin-select{
                width: 100% !important;
            }
        }
    </style>
</head>
<body>
<div id="page-loader" class="fade show"><span class="spinner"></span></div>

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <div id="content" class="content p-20">
        <div class="p-b-10">
            <ol class="breadcrumb float-xl-right p-r-10 m-b-10">
                <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="자료실"/></a></li>
                <li class="breadcrumb-item"><spring:message code="list.detail.libNoticedetails" text="자료실"/></li>
                <li class="breadcrumb-item active"><spring:message code="list.detail.libNoticedetails" text="자료실 상세"/></li>
            </ol>
            <h3 class="rix-title p-b-5"><spring:message code="list.detail.libNoticedetails" text="자료실 상세"/></h3>
        </div>

        <div class="library-shell">
            <div class="library-main">
                <div class="library-left">
                    <div class="section-head">
                        <h4 class="section-title">기본정보</h4>
                    </div>

                    <div class="section-body">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbLibrary.insertUserId}">
                            <input type="hidden" name="libNo" value="${tbLibrary.libNo}">
                            <input type="hidden" name="dataStatus" value="${tbLibrary.dataStatus}">

                            <div class="admin-panel">
                                <div class="admin-info-wrap">
                                    <div class="admin-info-row">
                                        <div class="admin-info-label">제목</div>
                                        <div class="admin-info-value">
                                            <div class="view-only admin-view-text" id="viewTitle">${tbLibrary.fileTitle}</div>

                                            <input type="text"
                                                   class="form-control admin-input edit-only"
                                                   name="fileTitle"
                                                   id="fileTitle"
                                                   maxlength="100"
                                                   value="${tbLibrary.fileTitle}">

                                            <div class="char-row edit-only">
                                                <span>최대 100자</span>
                                                <span class="char-count" id="fileTitleCount">0 / 100</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="admin-info-row">
                                        <div class="admin-info-label">구분</div>
                                        <div class="admin-info-value">
                                            <div class="view-only type-view-wrap" id="viewFileType">
                                                <c:choose>
                                                    <c:when test="${tbLibrary.fileType == 1}">
                                                        <span class="type-badge common">공통</span>
                                                        <span class="type-desc">전체 대상</span>
                                                    </c:when>
                                                    <c:when test="${tbLibrary.fileType == 2}">
                                                        <span class="type-badge agency">총판</span>
                                                        <span class="type-desc">총판 대상</span>
                                                    </c:when>
                                                    <c:when test="${tbLibrary.fileType == 3}">
                                                        <span class="type-badge user">사용자</span>
                                                        <span class="type-desc">사용자 대상</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="type-badge">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <select name="fileType"
                                                    id="fileType"
                                                    class="form-control admin-select edit-only">
                                                <option value="1" <c:if test="${empty tbLibrary.fileType || tbLibrary.fileType == 1}">selected</c:if>>공통</option>
                                                <option value="2" <c:if test="${tbLibrary.fileType == 2}">selected</c:if>>총판</option>
                                                <option value="3" <c:if test="${tbLibrary.fileType == 3}">selected</c:if>>사용자</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="admin-info-row">
                                        <div class="admin-info-label">업종</div>
                                        <div class="admin-info-value">
                                            <div class="view-only type-view-wrap" id="viewShopType">
                                                <c:choose>
                                                    <c:when test="${tbLibrary.shopType == 1}">
                                                        <span class="type-badge common">모두</span>
                                                        <span class="type-desc">전체 업종</span>
                                                    </c:when>
                                                    <c:when test="${tbLibrary.shopType == 2}">
                                                        <span class="type-badge food">음식업</span>
                                                        <span class="type-desc">음식업 대상</span>
                                                    </c:when>
                                                    <c:when test="${tbLibrary.shopType == 3}">
                                                        <span class="type-badge local">특산물</span>
                                                        <span class="type-desc">특산물 대상</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="type-badge">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <select name="shopType"
                                                    id="shopType"
                                                    class="form-control admin-select edit-only">
                                                <option value="1" <c:if test="${empty tbLibrary.shopType || tbLibrary.shopType == 1}">selected</c:if>>모두</option>
                                                <option value="2" <c:if test="${tbLibrary.shopType == 2}">selected</c:if>>음식업</option>
                                                <option value="3" <c:if test="${tbLibrary.shopType == 3}">selected</c:if>>특산물</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="admin-info-row body-row">
                                        <div class="admin-info-label">내용</div>
                                        <div class="admin-info-value">
                                            <div class="view-only admin-view-text admin-body-text" id="viewBody">${tbLibrary.fileBody}</div>

                                            <textarea name="fileBody"
                                                      id="fileBody"
                                                      class="form-control admin-input admin-textarea edit-only"
                                                      rows="10">${tbLibrary.fileBody}</textarea>

                                            <div class="char-row edit-only">
                                                <span>최대 1000자</span>
                                                <span class="char-count" id="fileBodyCount">0 / 1000</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="admin-info-row">
                                        <div class="admin-info-label">등록 사용자</div>
                                        <div class="admin-info-value admin-meta-text">
                                            ${tbLibrary.insertUserId}
                                        </div>
                                    </div>

                                    <div class="admin-info-row">
                                        <div class="admin-info-label">등록일</div>
                                        <div class="admin-info-value admin-meta-text">
                                            <javatime:format value="${tbLibrary.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="bottom-actions">
                            <div class="bottom-actions-left">
                                <button type="button" class="btn btn-primary btn_list">
                                    <i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/>
                                </button>
                            </div>

                            <div class="bottom-actions-right">
                                <button type="button" class="btn btn-danger btn_remove" libNo="${tbLibrary.libNo}">
                                    <i class="fa fa-trash-alt m-r-3"></i> <spring:message code="list.detail.delete" text="삭제"/>
                                </button>

                                <button type="button" class="btn btn-primary btn_up view-only">
                                    <i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/>
                                </button>

                                <button type="button" class="btn btn-success btn_save edit-only">
                                    <i class="fa fa-save m-r-3"></i> 저장
                                </button>

                                <button type="button" class="btn btn-white border btn_cancel edit-only">
                                    취소
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="library-right">
                    <div class="file-toolbar">
                        <div class="file-toolbar-left">
                            <div class="file-tree-header" style="padding:0; border:0; background:transparent;">
                                <i class="fa fa-folder-open"></i>
                                <span>첨부파일</span>
                            </div>
                        </div>

                        <div class="file-toolbar-right">
                            <div class="edit-only">
                                <label for="attachFile" class="btn btn-sm btn-primary m-0">
                                    <i class="fa fa-paperclip m-r-5"></i> 파일선택
                                </label>
                                <input type="file" id="attachFile" name="attachFile" multiple class="d-none" accept="*"/>
                            </div>
                            <div class="file-toolbar-hint edit-only">선택 즉시 아래 목록에 추가됩니다.</div>
                        </div>
                    </div>

                    <div class="file-scroll">
                        <table class="table table-striped table-borderless table-sm m-0 text-nowrap file-table">
                            <thead>
                            <tr class="border-bottom">
                                <th class="w-10px ps-10px"></th>
                                <th class="px-10px">Name</th>
                                <th class="px-10px w-100px">Size</th>
                                <th class="px-10px w-140px">CreateDate</th>
                                <th class="px-10px w-180px">Type</th>
                                <th class="px-10px w-80px text-center">Down</th>
                                <th class="px-10px w-60px text-center"></th>
                            </tr>
                            </thead>

                            <tbody id="fileTbody">
                            <c:choose>
                                <c:when test="${not empty files}">
                                    <c:forEach var="item" items="${files}" varStatus="status">
                                        <tr class="filebox cursor-pointer file-row"
                                            data-file-no="${item.fileNo}"
                                            onclick="downloadFile(`${item.fileOriginName}`,`${item.fileName}`,`${item.filePath}`,`${item.fileContentType}`)">
                                            <td class="ps-10px border-0 text-center">
                                                <a>
                                                    <c:choose>
                                                        <c:when test="${item.fileContentType == 'application/pdf'}">
                                                            <i class="far fa-file-pdf text-body text-opacity-50 fa-lg"></i>
                                                        </c:when>
                                                        <c:when test="${fn:startsWith(item.fileContentType, 'image/')}">
                                                            <i class="far fa-image text-body text-opacity-50 fa-lg"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-file-alt text-body text-opacity-50 fa-lg"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </td>

                                            <td class="px-10px border-0">${item.fileOriginName}</td>
                                            <td class="px-10px">${item.fileSize} byte</td>
                                            <td class="px-10px"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd"/></td>

                                            <td class="px-10px file-type" title="${item.fileContentType}">
                                                    ${item.fileContentType}
                                            </td>

                                            <td class="px-10px text-center">
                                                <a onclick="event.stopPropagation(); downloadFile(`${item.fileOriginName}`,`${item.fileName}`,`${item.filePath}`,`${item.fileContentType}`)">
                                                    <i class="fas me-10px fa-download text-opacity-50 fa-lg"></i>
                                                </a>
                                            </td>

                                            <td class="delete-col">
                                                <a class="delete edit-only"
                                                   onclick="event.stopPropagation(); deleteFile(${item.fileNo});">
                                                    <i class="far fa-minus-square"></i>
                                                </a>
                                                <span class="view-only" style="color:rgba(0,0,0,.35);">-</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr id="fileEmptyRow">
                                        <td colspan="7" class="file-empty">첨부파일이 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top">
    <i class="fa fa-angle-up"></i>
</a>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    var deleteFileNos = [];
    var selectedFiles = [];
    var snapshot = null;

    var MAX_LIBRARY_TITLE_LENGTH = 100;
    var MAX_LIBRARY_BODY_LENGTH = 1000;

    $(function () {
        bindLibraryLengthCounter("#fileTitle", "#fileTitleCount", MAX_LIBRARY_TITLE_LENGTH);
        bindLibraryLengthCounter("#fileBody", "#fileBodyCount", MAX_LIBRARY_BODY_LENGTH);

        $(".btn_list").on("click", function () {
            location.href = "${path}/library/file/list";
        });

        $("#content").removeClass("is-edit");

        $(".btn_up").on("click", function () {
            takeSnapshot();
            $("#content").addClass("is-edit");

            updateLengthCount("#fileTitle", "#fileTitleCount", MAX_LIBRARY_TITLE_LENGTH);
            updateLengthCount("#fileBody", "#fileBodyCount", MAX_LIBRARY_BODY_LENGTH);
        });

        $(".btn_cancel").on("click", function () {
            restoreSnapshot();

            updateLengthCount("#fileTitle", "#fileTitleCount", MAX_LIBRARY_TITLE_LENGTH);
            updateLengthCount("#fileBody", "#fileBodyCount", MAX_LIBRARY_BODY_LENGTH);

            $("#content").removeClass("is-edit");
        });

        $("#attachFile").on("change", function () {
            var files = this.files;
            if (!files || files.length === 0) return;

            for (var i = 0; i < files.length; i++) {
                appendNewFileRow(files[i]);
            }

            $("#attachFile").val("");
        });

        $(".btn_save").on("click", function(){
            var libNo = $("input[name='libNo']").val();
            var title = $.trim($("#fileTitle").val() || "");
            var body  = $.trim($("#fileBody").val() || "");
            var fileType = Number($("#fileType").val() || 1);
            var shopType = Number($("#shopType").val() || 1);

            if (!title) {
                return alert_focus("fileTitle", "제목을 입력해주세요");
            }

            if (title.length > MAX_LIBRARY_TITLE_LENGTH) {
                return alert_focus("fileTitle", "제목은 최대 " + MAX_LIBRARY_TITLE_LENGTH + "자까지 입력 가능합니다");
            }

            if (!body) {
                return alert_focus("fileBody", "내용을 입력해주세요");
            }

            if (body.length > MAX_LIBRARY_BODY_LENGTH) {
                return alert_focus("fileBody", "내용은 최대 " + MAX_LIBRARY_BODY_LENGTH + "자까지 입력 가능합니다");
            }

            var fd = new FormData();

            var libraryInfo = {
                libNo: Number(libNo),
                fileTitle: title,
                fileBody: body,
                fileType: fileType,
                shopType: shopType,
                dataStatus: Number($("input[name='dataStatus']").val() || 1),
                insertUserId: $("input[name='insertUserId']").val()
            };

            fd.append("libraryInfo", new Blob([JSON.stringify(libraryInfo)], { type: "application/json" }));

            if (deleteFileNos && deleteFileNos.length > 0) {
                fd.append("deleteFileNos", new Blob([JSON.stringify(deleteFileNos)], { type: "application/json" }));
            }

            if (selectedFiles && selectedFiles.length > 0) {
                for (var i = 0; i < selectedFiles.length; i++) {
                    fd.append("attachFile", selectedFiles[i]);
                }
            }

            $.ajax({
                url: "${path}/api/library/file/update",
                type: "POST",
                data: fd,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function(res){
                    if(res && (res.result === "200" || res.result === 200)){
                        alert(res.message || "수정 되었습니다.");
                        location.reload();
                    } else {
                        alert((res && res.message) ? res.message : "수정 실패");
                    }
                },
                error: function(xhr){
                    alert("수정 요청 실패: " + xhr.status);
                }
            });
        });

        $(".btn_remove").on("click", function(){
            var libNo = $("input[name='libNo']").val();

            swal({
                title: "삭제 하시겠습니까?",
                icon: "warning",
                buttons: ["취소", "삭제"],
                dangerMode: true
            }).then(function(isConfirm){
                if(!isConfirm) return;

                $.ajax({
                    type: "POST",
                    url: "${path}/api/library/file/delete",
                    data: { libNo: libNo },
                    dataType: "json",
                    success: function(res){
                        if(res && (res.result === "200" || res.result === 200)){
                            alert(res.message || "삭제되었습니다.");
                            location.href = "${path}/library/file/list";
                        } else {
                            alert((res && res.message) ? res.message : "삭제 실패");
                        }
                    },
                    error: function(xhr){
                        alert("삭제 요청 실패: " + xhr.status);
                    }
                });
            });
        });
    });

    function bindLibraryLengthCounter(inputSelector, countSelector, maxLength) {
        var $input = $(inputSelector);

        $input.off("input.libraryCount keyup.libraryCount change.libraryCount");
        $input.on("input.libraryCount keyup.libraryCount change.libraryCount", function () {
            updateLengthCount(inputSelector, countSelector, maxLength);
        });

        updateLengthCount(inputSelector, countSelector, maxLength);
    }

    function updateLengthCount(inputSelector, countSelector, maxLength) {
        var $input = $(inputSelector);
        var $count = $(countSelector);

        if ($input.length === 0 || $count.length === 0) {
            return;
        }

        var value = $input.val() || "";

        if (value.length > maxLength) {
            value = value.substring(0, maxLength);
            $input.val(value);
        }

        var len = value.length;
        $count.text(len + " / " + maxLength);
        $count.toggleClass("is-over", len > maxLength);
    }

    function downloadFile(fileOriginName, fileName, filePath, fileContentType) {
        var url = "${path}/api/file/download?filePath=" + encodeURI(filePath)
            + "&fileOriginName=" + encodeURI(fileOriginName)
            + "&fileName=" + encodeURI(fileName)
            + "&contentType=" + encodeURI(fileContentType);

        location.href = url;
    }

    function deleteFile(fileNo) {
        if (!fileNo) return;

        if ($.inArray(fileNo, deleteFileNos) === -1) {
            deleteFileNos.push(fileNo);
        }

        var $tr = $(".file-row[data-file-no='" + fileNo + "']");
        $tr.addClass("file-deleting");
        $tr.find("a.delete").css({ "pointer-events": "none", "opacity": ".5" });
    }

    function fmtBytes(bytes) {
        var u = ["B", "KB", "MB", "GB"];
        var i = 0;
        var n = Number(bytes || 0);

        while (n >= 1024 && i < u.length - 1) {
            n = n / 1024;
            i++;
        }

        return (i === 0 ? n : n.toFixed(1)) + " " + u[i];
    }

    function fileKey(f) {
        return (f.name + "__" + f.size + "__" + f.lastModified);
    }

    function iconForFile(file) {
        var type = (file.type || "").toLowerCase();

        if (type.indexOf("pdf") > -1) {
            return '<i class="far fa-file-pdf text-body text-opacity-50 fa-lg"></i>';
        }

        if (type.indexOf("image/") === 0) {
            return '<i class="far fa-image text-body text-opacity-50 fa-lg"></i>';
        }

        if (type.indexOf("zip") > -1 || type.indexOf("compressed") > -1) {
            return '<i class="far fa-file-alt text-body text-opacity-50 fa-lg"></i>';
        }

        return '<i class="far fa-file-alt text-body text-opacity-50 fa-lg"></i>';
    }

    function appendNewFileRow(file) {
        var key = fileKey(file);

        for (var i = 0; i < selectedFiles.length; i++) {
            if (fileKey(selectedFiles[i]) === key) {
                return;
            }
        }

        selectedFiles.push(file);
        $("#fileEmptyRow").remove();

        var rowHtml = ''
            + '<tr class="filebox file-row new-file-row" data-new-key="' + escapeAttr(key) + '">'
            + '  <td class="ps-10px border-0 text-center">' + iconForFile(file) + '</td>'
            + '  <td class="px-10px border-0">' + escapeHtml(file.name) + ' <span class="file-badge-new">신규</span></td>'
            + '  <td class="px-10px">' + fmtBytes(file.size) + '</td>'
            + '  <td class="px-10px">-</td>'
            + '  <td class="px-10px">' + escapeHtml(file.type || "-") + '</td>'
            + '  <td class="px-10px text-center">-</td>'
            + '  <td class="delete-col">'
            + '    <a class="delete" onclick="event.stopPropagation(); removeNewFile(\'' + escapeJs(key) + '\');"><i class="far fa-minus-square"></i></a>'
            + '  </td>'
            + '</tr>';

        $("#fileTbody").append(rowHtml);
    }

    function removeNewFile(key) {
        var next = [];

        for (var i = 0; i < selectedFiles.length; i++) {
            if (fileKey(selectedFiles[i]) !== key) {
                next.push(selectedFiles[i]);
            }
        }

        selectedFiles = next;

        $("#fileTbody tr.new-file-row").each(function () {
            if ($(this).attr("data-new-key") === key) {
                $(this).remove();
            }
        });

        if ($("#fileTbody tr").length === 0) {
            $("#fileTbody").append('<tr id="fileEmptyRow"><td colspan="7" class="file-empty">첨부파일이 없습니다.</td></tr>');
        }
    }

    function takeSnapshot() {
        snapshot = {
            title: $("#fileTitle").val(),
            body: $("#fileBody").val(),
            fileType: $("#fileType").val(),
            shopType: $("#shopType").val()
        };
    }

    function restoreSnapshot() {
        if (!snapshot) return;

        $("#fileTitle").val(snapshot.title);
        $("#fileBody").val(snapshot.body);
        $("#fileType").val(snapshot.fileType);
        $("#shopType").val(snapshot.shopType);

        $("#viewTitle").text(snapshot.title);
        $("#viewBody").text(snapshot.body);

        deleteFileNos = [];

        $(".file-row").removeClass("file-deleting");
        $("a.delete").css({ "pointer-events": "auto", "opacity": "1" });

        selectedFiles = [];
        $(".new-file-row").remove();
        $("#attachFile").val("");

        if ($("#fileTbody tr").length === 0) {
            $("#fileTbody").append('<tr id="fileEmptyRow"><td colspan="7" class="file-empty">첨부파일이 없습니다.</td></tr>');
        }
    }

    function escapeHtml(str) {
        str = String(str);
        str = str.replace(/&/g, "&amp;");
        str = str.replace(/</g, "&lt;");
        str = str.replace(/>/g, "&gt;");
        str = str.replace(/"/g, "&quot;");
        str = str.replace(/'/g, "&#39;");
        return str;
    }

    function escapeAttr(str) {
        return String(str)
            .replace(/"/g, "&quot;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;");
    }

    function escapeJs(str) {
        return String(str)
            .replace(/\\/g, "\\\\")
            .replace(/'/g, "\\'");
    }
</script>
</body>
</html>
