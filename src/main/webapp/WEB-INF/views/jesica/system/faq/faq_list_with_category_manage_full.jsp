<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%@include file="../../../common/include_head.jsp" %>

    <title>온동네 | FAQ 관리</title>

    <style>
        .faq-file-manager {
            display: flex;
            min-height: 680px;
            border: 1px solid #d9dee5;
            background: #fff;
        }

        /* 왼쪽 카테고리 영역 */
        .faq-file-sidebar {
            flex: 0 0 245px;
            width: 245px;
            border-right: 1px solid #d9dee5;
            background: #f8f9fa;
        }

        .faq-file-sidebar-head {
            display: flex;
            align-items: center;
            min-height: 52px;
            padding: 0 18px;
            border-bottom: 1px solid #d9dee5;
            background: #fff;
            color: #2d353c;
            font-size: 14px;
            font-weight: 700;
        }

        .faq-category-list {
            margin: 0;
            padding: 12px 0;
            list-style: none;
        }

        .faq-category-item {
            display: flex;
            align-items: center;
            gap: 10px;
            min-height: 42px;
            padding: 0 18px;
            color: #4d5965;
            font-size: 13px;
            cursor: pointer;
            transition: background-color .15s ease, color .15s ease;
        }

        .faq-category-item:hover {
            background: #eef1f4;
            color: #2d353c;
        }

        .faq-category-item.active {
            background: #348fe2;
            color: #fff;
        }

        .faq-category-icon {
            flex: 0 0 18px;
            width: 18px;
            text-align: center;
        }

        .faq-category-name {
            min-width: 0;
            flex: 1;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .faq-category-count {
            flex: 0 0 auto;
            min-width: 24px;
            padding: 2px 7px;
            border-radius: 12px;
            background: rgba(0, 0, 0, .07);
            font-size: 11px;
            font-weight: 700;
            text-align: center;
        }

        .faq-category-item.active .faq-category-count {
            background: rgba(255, 255, 255, .2);
        }

        /* 오른쪽 메인 영역 */
        .faq-file-content {
            min-width: 0;
            flex: 1;
            background: #fff;
        }

        .faq-file-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 52px;
            padding: 8px 14px;
            border-bottom: 1px solid #d9dee5;
            background: #fff;
        }

        .faq-toolbar-left,
        .faq-toolbar-right {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .faq-toolbar-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            min-height: 34px;
            padding: 0 12px;
            border: 1px solid #cfd5dc;
            border-radius: 3px;
            background: #fff;
            color: #2d353c;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .faq-toolbar-btn:hover {
            background: #f4f6f8;
        }

        .faq-toolbar-btn.btn-primary {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
        }

        .faq-toolbar-btn.btn-danger {
            border-color: #ff5b57;
            color: #ff5b57;
        }

        .faq-toolbar-btn.btn-danger:hover {
            background: #ff5b57;
            color: #fff;
        }

        .faq-toolbar-btn:disabled {
            opacity: .55;
            cursor: default;
        }

        .faq-search-wrap {
            position: relative;
            width: 280px;
        }

        .faq-search-wrap input {
            height: 34px;
            padding-right: 36px;
            font-size: 12px;
        }

        .faq-search-wrap i {
            position: absolute;
            top: 50%;
            right: 12px;
            color: #8a939d;
            transform: translateY(-50%);
        }

        .faq-file-path {
            display: flex;
            align-items: center;
            min-height: 42px;
            padding: 0 16px;
            border-bottom: 1px solid #e5e7eb;
            background: #f8fafc;
            color: #6b7280;
            font-size: 12px;
        }

        .faq-file-path strong {
            margin-left: 5px;
            color: #2d353c;
        }

        .faq-sort-message {
            display: none;
            padding: 8px 14px;
            border-bottom: 1px solid #f0dca2;
            background: #fff8df;
            color: #8a6d1d;
            font-size: 11px;
        }

        .faq-sort-message.show {
            display: block;
        }

        /* 테이블 */
        .faq-table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .faq-table {
            width: 100%;
            min-width: 1050px;
            margin: 0;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .faq-table th,
        .faq-table td {
            padding: 10px 12px;
            border-bottom: 1px solid #e4e7ea;
            color: #2d353c;
            font-size: 12px;
            vertical-align: middle;
        }

        .faq-table th {
            background: #fff;
            color: #67717b;
            font-weight: 700;
            text-align: left;
            white-space: nowrap;
        }

        .faq-table tbody tr {
            background: #fff;
            cursor: pointer;
            transition: background-color .15s ease;
        }

        .faq-table tbody tr:hover {
            background: #f7f9fb;
        }

        .faq-table tbody tr.selected {
            background: #eef6ff;
        }

        .faq-table tbody tr.ui-sortable-helper {
            display: table;
            width: 100%;
            background: #fff;
            box-shadow: 0 8px 24px rgba(0, 0, 0, .12);
        }

        .faq-table-empty {
            height: 300px;
            color: #999 !important;
            text-align: center !important;
        }

        .faq-sort-handle {
            color: #9aa2aa;
            cursor: move;
            text-align: center;
        }

        .faq-order-no {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 28px;
            height: 28px;
            padding: 0 7px;
            border-radius: 14px;
            background: #eef2f7;
            color: #52606d;
            font-size: 11px;
            font-weight: 700;
        }

        .faq-question-cell {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
        }

        .faq-question-icon {
            flex: 0 0 32px;
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            background: #eef6ff;
            color: #348fe2;
            font-size: 13px;
        }

        .faq-question-text {
            min-width: 0;
            overflow: hidden;
            color: #2d353c;
            font-weight: 600;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .faq-category-badge,
        .faq-use-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 52px;
            padding: 4px 9px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        .faq-category-badge {
            background: #f0f2f5;
            color: #59636e;
        }

        .faq-use-badge.is-use {
            background: #e5f7eb;
            color: #168b4e;
        }

        .faq-use-badge.is-unused {
            background: #f1f3f5;
            color: #777;
        }

        .faq-edit-btn,
        .faq-delete-btn {
            min-width: 58px;
            padding: 6px 10px;
            border-radius: 3px;
            background: #fff;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
        }

        .faq-edit-btn {
            border: 1px solid #348fe2;
            color: #348fe2;
        }

        .faq-edit-btn:hover {
            background: #348fe2;
            color: #fff;
        }

        .faq-delete-btn {
            margin-left: 4px;
            border: 1px solid #ff5b57;
            color: #ff5b57;
        }

        .faq-delete-btn:hover {
            background: #ff5b57;
            color: #fff;
        }

        .faq-sort-placeholder td {
            height: 50px;
            border: 1px dashed #348fe2 !important;
            background: #eef6ff;
        }

        .faq-file-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 46px;
            padding: 0 15px;
            border-top: 1px solid #d9dee5;
            background: #f8fafc;
            color: #67717b;
            font-size: 12px;
        }

        .faq-storage-info {
            display: flex;
            align-items: center;
            gap: 8px;
        }


        /* FAQ 등록 레이어 팝업 */
        #faqInsertModal .modal-dialog,
        #faqEditModal .modal-dialog {
            max-width: 760px;
        }

        #faqInsertModal .modal-content,
        #faqEditModal .modal-content {
            width: 100%;
            border: 0;
            border-radius: 6px;
            overflow: hidden;
        }

        #faqInsertModal .modal-header,
        #faqEditModal .modal-header {
            align-items: center;
            padding: 14px 18px;
            border-bottom: 1px solid #e5e7eb;
            background: #f8fafc;
        }

        #faqInsertModal .modal-title,
        #faqEditModal .modal-title {
            margin: 0;
            color: #2d353c;
            font-size: 15px;
            font-weight: 700;
        }

        #faqInsertModal .modal-body,
        #faqEditModal .modal-body {
            padding: 18px;
        }

        #faqInsertModal .modal-footer,
        #faqEditModal .modal-footer {
            padding: 12px 18px;
            border-top: 1px solid #e5e7eb;
            background: #f8fafc;
        }

        .faq-modal-row {
            display: grid;
            grid-template-columns: 1fr 160px 140px;
            gap: 12px;
        }

        .faq-modal-label {
            display: block;
            margin-bottom: 6px;
            color: #4d5965;
            font-size: 12px;
            font-weight: 700;
        }

        .faq-modal-required {
            color: #ff5b57;
        }

        .faq-modal-help {
            margin-top: 5px;
            color: #8a939d;
            font-size: 11px;
        }

        #insertFaqQ,
        #editFaqQ {
            height: 38px;
        }

        #insertFaqA,
        #editFaqA {
            min-height: 230px;
            resize: vertical;
        }




        @media (max-width: 768px) {
            .faq-modal-row {
                grid-template-columns: 1fr;
            }
        }


        @media (max-width: 992px) {
            .faq-file-manager {
                display: block;
            }

            .faq-file-sidebar {
                width: 100%;
                border-right: 0;
                border-bottom: 1px solid #d9dee5;
            }

            .faq-category-list {
                display: flex;
                overflow-x: auto;
                padding: 8px;
            }

            .faq-category-item {
                flex: 0 0 auto;
                min-height: 36px;
                padding: 0 12px;
                border-radius: 4px;
            }

            .faq-file-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .faq-toolbar-right,
            .faq-search-wrap {
                width: 100%;
            }
        }


        .faq-category-manage-btn { width:28px; height:28px; padding:0; border:1px solid #cfd5dc; border-radius:3px; background:#fff; color:#4d5965; cursor:pointer; }
        .faq-category-manage-btn:hover { border-color:#348fe2; color:#348fe2; }
        #faqCategoryManageModal .modal-dialog { max-width:760px; }
        #faqCategoryManageModal .modal-content { border:0; border-radius:6px; overflow:hidden; }
        #faqCategoryManageModal .modal-header { padding:14px 18px; background:#f8fafc; border-bottom:1px solid #e5e7eb; }
        #faqCategoryManageModal .modal-body { padding:18px; }
        #faqCategoryManageModal .modal-footer { padding:12px 18px; background:#f8fafc; border-top:1px solid #e5e7eb; }
        .faq-category-form-box { margin-bottom:16px; padding:14px; border:1px solid #dfe3e8; border-radius:4px; background:#f8fafc; }
        .faq-category-form-row { display:grid; grid-template-columns:1fr 120px 120px auto; gap:10px; align-items:end; }
        .faq-category-table-wrap { max-height:380px; overflow-y:auto; border:1px solid #dfe3e8; border-radius:4px; }
        .faq-category-manage-table { width:100%; border-collapse:collapse; table-layout:fixed; }
        .faq-category-manage-table th, .faq-category-manage-table td { padding:10px 9px; border-bottom:1px solid #e5e7eb; font-size:12px; }
        .faq-category-manage-table th { position:sticky; top:0; z-index:1; background:#f8fafc; color:#67717b; }
        .faq-category-sort-handle { text-align:center; color:#9aa2aa; cursor:move; }
        .faq-category-empty { height:150px; text-align:center; color:#999!important; }
        .faq-category-edit-btn, .faq-category-delete-btn { min-width:48px; padding:5px 8px; border-radius:3px; background:#fff; font-size:11px; font-weight:600; cursor:pointer; }
        .faq-category-edit-btn { border:1px solid #348fe2; color:#348fe2; }
        .faq-category-delete-btn { margin-left:3px; border:1px solid #ff5b57; color:#ff5b57; }
        .faq-category-sort-placeholder td { height:42px; border:1px dashed #348fe2!important; background:#eef6ff; }
        @media (max-width:768px) { .faq-category-form-row { grid-template-columns:1fr; } }

        .form-control {
            width: 100%;
        }
    </style>
</head>

<body>
<div id="page-loader" class="fade show">
    <span class="spinner"></span>
</div>

<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <div id="content" class="content p-0">
        <div class="panel panel-inverse m-t-1">

            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item">
                        <a href="${path}/system/faq/list">시스템 운영</a>
                    </li>
                    <li class="breadcrumb-item active">FAQ 관리</li>
                </ol>

                <h3 class="rix-title">FAQ 관리</h3>
            </div>

            <div class="panel-body p-15">
                <div class="faq-file-manager">

                    <!-- 왼쪽 카테고리 -->
                    <aside class="faq-file-sidebar">
                        <div class="faq-file-sidebar-head" style="justify-content:space-between;">
                            <span><i class="fa fa-folder-open m-r-8"></i>&nbsp;&nbsp;FAQ 카테고리</span>
                            <button type="button" id="faqCategoryManageBtn" class="faq-category-manage-btn" title="카테고리 관리">
                                <i class="fa fa-cog"></i>
                            </button>
                        </div>

                        <ul id="faqCategoryList" class="faq-category-list">
                            <li class="faq-category-item active"
                                data-category-no="">
                                <span class="faq-category-icon">
                                    <i class="fa fa-folder-open"></i>
                                </span>
                                <span class="faq-category-name">전체 FAQ</span>
                                <span class="faq-category-count"
                                      data-count-category-no="">0</span>
                            </li>
                        </ul>
                    </aside>

                    <!-- 오른쪽 목록 -->
                    <section class="faq-file-content">

                        <div class="faq-file-toolbar">
                            <div class="faq-toolbar-left">
                                <button type="button"
                                        id="faqInsertBtn"
                                        class="faq-toolbar-btn btn-primary">
                                    <i class="fa fa-plus"></i>
                                    FAQ 등록
                                </button>

                                <button type="button"
                                        id="faqSortSaveBtn"
                                        class="faq-toolbar-btn">
                                    <i class="fa fa-save"></i>
                                    순서 저장
                                </button>

                                <button type="button"
                                        id="faqReloadBtn"
                                        class="faq-toolbar-btn">
                                    <i class="fa fa-sync"></i>
                                    새로고침
                                </button>
                            </div>

                            <div class="faq-toolbar-right">
                                <select id="searchUseYn"
                                        class="form-control"
                                        style="width:110px; height:34px; font-size:12px;">
                                    <option value="">전체 상태</option>
                                    <option value="Y">사용</option>
                                    <option value="N">미사용</option>
                                </select>

                                <div class="faq-search-wrap">
                                    <input type="text"
                                           id="searchKeyword"
                                           class="form-control"
                                           maxlength="150"
                                           placeholder="질문 또는 답변 검색">
                                    <i class="fa fa-search"></i>
                                </div>

                                <button type="button"
                                        id="faqSearchBtn"
                                        class="faq-toolbar-btn">
                                    검색
                                </button>
                            </div>
                        </div>

                        <div class="faq-file-path">
                            <i class="fa fa-folder-open m-r-5"></i>
                            FAQ /
                            <strong id="currentFaqCategoryName">전체 FAQ</strong>
                        </div>

                        <div id="faqSortMessage"
                             class="faq-sort-message">
                            검색어 또는 사용 상태 조건이 적용된 경우에는 순서 변경을 저장할 수 없습니다.
                        </div>

                        <div class="faq-table-wrap">
                            <table class="faq-table">
                                <colgroup>
                                    <col style="width:48px;">
                                    <col style="width:75px;">
                                    <col>
                                    <col style="width:120px;">
                                    <col style="width:95px;">
                                    <col style="width:115px;">
                                    <col style="width:165px;">
                                    <col style="width:200px;">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th class="text-center">정렬</th>
                                    <th class="text-center">순서</th>
                                    <th>질문</th>
                                    <th>카테고리</th>
                                    <th class="text-center">사용여부</th>
                                    <th>등록자</th>
                                    <th>등록일시</th>
                                    <th class="text-center">관리</th>
                                </tr>
                                </thead>

                                <tbody id="faqTableBody">
                                <tr>
                                    <td colspan="8"
                                        class="faq-table-empty">
                                        FAQ 목록을 불러오는 중입니다.
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="faq-file-footer">
                            <div>
                                총 <strong id="faqTotalCount">0</strong>건
                            </div>

                            <div class="faq-storage-info">
                                <i class="fa fa-info-circle"></i>
                                드래그 후 순서 저장 버튼을 눌러주세요.
                            </div>
                        </div>

                    </section>
                </div>
            </div>
        </div>
    </div>

    <a href="javascript:;"
       class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade"
       data-click="scroll-top">
        <i class="fa fa-angle-up"></i>
    </a>
</div>


<!-- FAQ 등록 레이어 팝업 -->
<div class="modal fade"
     id="faqInsertModal"
     tabindex="-1"
     role="dialog"
     aria-labelledby="faqInsertModalLabel"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered"
         role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"
                    id="faqInsertModalLabel">
                    FAQ 등록
                </h5>

                <button type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="닫기">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="faqInsertForm">
                    <input type="hidden"
                           id="insertFaqUserId"
                           value="${sessionScope.sessionKey.userLoginId}">

                    <div class="faq-modal-row">
                        <div class="form-group">
                            <label class="faq-modal-label"
                                   for="insertFaqCategoryNo">
                                카테고리
                                <span class="faq-modal-required">*</span>
                            </label>

                            <select id="insertFaqCategoryNo"
                                    class="form-control">
                                <option value="">선택</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="faq-modal-label"
                                   for="insertFaqUseYn">
                                사용 여부
                            </label>

                            <select id="insertFaqUseYn"
                                    class="form-control">
                                <option value="Y">사용</option>
                                <option value="N">미사용</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="faq-modal-label"
                                   for="insertDisplayOrder">
                                노출 순서
                            </label>

                            <input type="number"
                                   id="insertDisplayOrder"
                                   class="form-control"
                                   min="1"
                                   placeholder="자동">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="faq-modal-label"
                               for="insertFaqQ">
                            질문
                            <span class="faq-modal-required">*</span>
                        </label>

                        <input type="text"
                               id="insertFaqQ"
                               class="form-control"
                               maxlength="500"
                               placeholder="질문을 입력해주세요.">

                        <div class="faq-modal-help text-right">
                            <span id="insertFaqQCount">0</span>/500
                        </div>
                    </div>

                    <div class="form-group mb-0">
                        <label class="faq-modal-label"
                               for="insertFaqA">
                            답변
                            <span class="faq-modal-required">*</span>
                        </label>

                        <textarea id="insertFaqA"
                                  class="form-control"
                                  placeholder="답변을 입력해주세요."></textarea>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button"
                        class="btn btn-white"
                        data-dismiss="modal">
                    취소
                </button>

                <button type="button"
                        id="faqInsertSaveBtn"
                        class="btn btn-primary">
                    등록
                </button>
            </div>
        </div>
    </div>
</div>


<!-- FAQ 수정 레이어 팝업 -->
<div class="modal fade" id="faqEditModal" tabindex="-1" role="dialog" aria-labelledby="faqEditModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="faqEditModalLabel">FAQ 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="faqEditForm">
                    <input type="hidden" id="editFaqNo">
                    <input type="hidden" id="editFaqUserId" value="${sessionScope.sessionKey.userLoginId}">
                    <div class="faq-modal-row">
                        <div class="form-group">
                            <label class="faq-modal-label" for="editFaqCategoryNo">카테고리 <span class="faq-modal-required">*</span></label>
                            <select id="editFaqCategoryNo" class="form-control">
                                <option value="">선택</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="faq-modal-label" for="editFaqUseYn">사용 여부</label>
                            <select id="editFaqUseYn" class="form-control">
                                <option value="Y">사용</option>
                                <option value="N">미사용</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="faq-modal-label" for="editDisplayOrder">노출 순서</label>
                            <input type="number" id="editDisplayOrder" class="form-control" min="1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="faq-modal-label" for="editFaqQ">질문 <span class="faq-modal-required">*</span></label>
                        <input type="text" id="editFaqQ" class="form-control" maxlength="500" placeholder="질문을 입력해주세요.">
                        <div class="faq-modal-help text-right"><span id="editFaqQCount">0</span>/500</div>
                    </div>
                    <div class="form-group mb-0">
                        <label class="faq-modal-label" for="editFaqA">답변 <span class="faq-modal-required">*</span></label>
                        <textarea id="editFaqA" class="form-control" placeholder="답변을 입력해주세요."></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
                <button type="button" id="faqEditSaveBtn" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>


<!-- FAQ 카테고리 관리 팝업 -->
<div class="modal fade" id="faqCategoryManageModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">FAQ 카테고리 관리</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="faq-category-form-box">
                    <input type="hidden" id="manageFaqCategoryNo">
                    <input type="hidden" id="manageFaqCategoryUserId" value="${sessionScope.sessionKey.userLoginId}">
                    <div class="faq-category-form-row">
                        <div class="form-group mb-0">
                            <label class="faq-modal-label">카테고리명 <span class="faq-modal-required">*</span></label>
                            <input type="text" id="manageFaqCategoryName" class="form-control" maxlength="50" placeholder="카테고리명을 입력해주세요.">
                        </div>
                        <div class="form-group mb-0">
                            <label class="faq-modal-label">사용 여부</label>
                            <select id="manageFaqCategoryUseYn" class="form-control"><option value="Y">사용</option><option value="N">미사용</option></select>
                        </div>
                        <div class="form-group mb-0">
                            <label class="faq-modal-label">노출 순서</label>
                            <input type="number" id="manageFaqCategoryDisplayOrder" class="form-control" min="1" placeholder="자동">
                        </div>
                        <div>
                            <button type="button" id="faqCategorySaveBtn" class="btn btn-primary">등록</button>
                            <button type="button" id="faqCategoryFormResetBtn" class="btn btn-white" style="display:none;">취소</button>
                        </div>
                    </div>
                </div>
                <div class="faq-category-table-wrap">
                    <table class="faq-category-manage-table">
                        <colgroup><col style="width:44px"><col style="width:60px"><col><col style="width:90px"><col style="width:75px"><col style="width:130px"></colgroup>
                        <thead><tr><th>정렬</th><th>순서</th><th>카테고리명</th><th>사용여부</th><th>FAQ 수</th><th>관리</th></tr></thead>
                        <tbody id="faqCategoryManageTableBody"><tr><td colspan="6" class="faq-category-empty">카테고리 목록을 불러오는 중입니다.</td></tr></tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="faqCategorySortSaveBtn" class="btn btn-primary">순서 저장</button>
                <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    let faqList = [];
    let faqCategoryList = [];

    let currentFaqCategoryNo = "";
    let currentFaqCategoryName = "전체 FAQ";

    let selectedFaqNo = null;
    let isFaqLoading = false;
    let isFaqCategoryLoading = false;
    let isFaqSortSaving = false;
    let isFaqDeleting = false;
    let faqSortChanged = false;
    let isFaqInserting = false;
    let isFaqUpdating = false;
    let isFaqCategorySaving = false;
    let isFaqCategoryDeleting = false;
    let isFaqCategorySortSaving = false;
    let faqCategorySortChanged = false;

    function escapeFaqHtml(value) {
        if (value == null) {
            return "";
        }

        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function formatFaqDate(value) {
        if (!value) {
            return "-";
        }

        let text = String(value).replace("T", " ");

        if (text.indexOf(".") > -1) {
            text = text.substring(0, text.indexOf("."));
        }

        if (text.length > 19) {
            text = text.substring(0, 19);
        }

        return text;
    }

    function hasFaqFilter() {
        return $.trim($("#searchKeyword").val() || "") !== ""
            || $.trim($("#searchUseYn").val() || "") !== "";
    }

    function getFaqSearchParams() {
        let params = {
            useYn: $("#searchUseYn").val() || "",
            keyword: $.trim($("#searchKeyword").val() || "")
        };

        if (currentFaqCategoryNo !== "") {
            params.faqCategoryNo = Number(currentFaqCategoryNo);
        }

        return params;
    }

    function getCategoryListFromResponse(res) {
        if (res && Array.isArray(res.categoryList)) {
            return res.categoryList;
        }

        if (
            res &&
            res.data &&
            Array.isArray(res.data.categoryList)
        ) {
            return res.data.categoryList;
        }

        if (
            res &&
            res.data &&
            Array.isArray(res.data)
        ) {
            return res.data;
        }

        if (Array.isArray(res)) {
            return res;
        }

        return [];
    }

    function getFaqListFromResponse(res) {
        if (res && Array.isArray(res.faqList)) {
            return res.faqList;
        }

        if (
            res &&
            res.data &&
            Array.isArray(res.data.faqList)
        ) {
            return res.data.faqList;
        }

        if (
            res &&
            res.data &&
            Array.isArray(res.data)
        ) {
            return res.data;
        }

        if (Array.isArray(res)) {
            return res;
        }

        return [];
    }

    function loadFaqCategoryList(callback) {
        if (isFaqCategoryLoading) {
            return;
        }

        isFaqCategoryLoading = true;

        $.ajax({
            url: "${path}/api/system/faq/category/list",
            type: "GET",
            data: {
                useYn: "Y",
                dataStatus: 1
            },

            success: function(res) {
                faqCategoryList = getCategoryListFromResponse(res);

                renderFaqCategoryList(faqCategoryList);
                renderFaqCategorySelect(faqCategoryList);

                if (typeof callback === "function") {
                    callback();
                }
            },

            error: function(xhr) {
                console.error(xhr);

                faqCategoryList = [];

                renderFaqCategoryList([]);
                renderFaqCategorySelect([]);

                alert("FAQ 카테고리 목록을 불러오지 못했습니다.");
            },

            complete: function() {
                isFaqCategoryLoading = false;
            }
        });
    }

    function renderFaqCategoryList(list) {
        let html = "";

        html += ""
            + "<li class='faq-category-item"
            + (currentFaqCategoryNo === "" ? " active" : "")
            + "' data-category-no=''>"

            + "    <span class='faq-category-icon'>"
            + "        <i class='fa fa-folder-open'></i>"
            + "    </span>"

            + "    <span class='faq-category-name'>"
            + "        전체 FAQ"
            + "    </span>"

            + "    <span class='faq-category-count' "
            + "          data-count-category-no=''>"
            + "        0"
            + "    </span>"

            + "</li>";

        $.each(list || [], function(index, category) {
            let categoryNo =
                category.faqCategoryNo == null
                    ? ""
                    : category.faqCategoryNo;

            let categoryName =
                category.faqCategoryName ||
                category.categoryName ||
                "-";

            let faqCount =
                category.faqCount == null
                    ? 0
                    : category.faqCount;

            let activeClass =
                String(currentFaqCategoryNo) === String(categoryNo)
                    ? " active"
                    : "";

            html += ""
                + "<li class='faq-category-item"
                + activeClass
                + "' data-category-no='"
                + escapeFaqHtml(categoryNo)
                + "'>"

                + "    <span class='faq-category-icon'>"
                + "        <i class='fa fa-folder'></i>"
                + "    </span>"

                + "    <span class='faq-category-name'>"
                +          escapeFaqHtml(categoryName)
                + "    </span>"

                + "    <span class='faq-category-count' "
                + "          data-count-category-no='"
                +          escapeFaqHtml(categoryNo)
                + "'>"
                +          escapeFaqHtml(faqCount)
                + "    </span>"

                + "</li>";
        });

        $("#faqCategoryList").html(html);
    }

    function renderFaqCategorySelect(list) {
        let optionHtml = "<option value=''>선택</option>";

        $.each(list || [], function(index, category) {
            let categoryNo =
                category.faqCategoryNo == null
                    ? ""
                    : category.faqCategoryNo;

            let categoryName =
                category.faqCategoryName ||
                category.categoryName ||
                "-";

            optionHtml += ""
                + "<option value='"
                + escapeFaqHtml(categoryNo)
                + "'>"
                + escapeFaqHtml(categoryName)
                + "</option>";
        });

        $("#insertFaqCategoryNo").html(optionHtml);
        $("#editFaqCategoryNo").html(optionHtml);
    }


    function resetFaqCategoryForm() {
        $("#manageFaqCategoryNo").val("");
        $("#manageFaqCategoryName").val("");
        $("#manageFaqCategoryUseYn").val("Y");
        $("#manageFaqCategoryDisplayOrder").val("");
        $("#faqCategorySaveBtn").text("등록").prop("disabled", false);
        $("#faqCategoryFormResetBtn").hide();
        isFaqCategorySaving = false;
    }

    function renderFaqCategoryManageList(list) {
        if (!list || list.length === 0) {
            $("#faqCategoryManageTableBody").html("<tr><td colspan='6' class='faq-category-empty'>등록된 FAQ 카테고리가 없습니다.</td></tr>");
            return;
        }
        let html = "";
        $.each(list, function(index, c) {
            let no = c.faqCategoryNo == null ? "" : c.faqCategoryNo;
            let name = c.faqCategoryName || c.categoryName || "-";
            let order = c.displayOrder == null ? index + 1 : c.displayOrder;
            let useYn = String(c.useYn || "N");
            let count = c.faqCount == null ? 0 : c.faqCount;
            let useHtml = useYn === "Y" ? "<span class='faq-use-badge is-use'>사용</span>" : "<span class='faq-use-badge is-unused'>미사용</span>";
            html += "<tr class='faq-category-manage-row' data-category-no='" + escapeFaqHtml(no) + "'>"
                + "<td class='faq-category-sort-handle'><i class='fa fa-bars'></i></td>"
                + "<td class='text-center'><span class='faq-category-order-no'>" + escapeFaqHtml(order) + "</span></td>"
                + "<td>" + escapeFaqHtml(name) + "</td>"
                + "<td class='text-center'>" + useHtml + "</td>"
                + "<td class='text-center'>" + escapeFaqHtml(count) + "</td>"
                + "<td class='text-center'><button type='button' class='faq-category-edit-btn' data-category-no='" + escapeFaqHtml(no) + "'>수정</button>"
                + "<button type='button' class='faq-category-delete-btn' data-category-no='" + escapeFaqHtml(no) + "' data-faq-count='" + escapeFaqHtml(count) + "'>삭제</button></td></tr>";
        });
        $("#faqCategoryManageTableBody").html(html);
    }

    function initFaqCategorySortable() {
        if ($("#faqCategoryManageTableBody").hasClass("ui-sortable")) $("#faqCategoryManageTableBody").sortable("destroy");
        if (!$.fn.sortable) { $("#faqCategorySortSaveBtn").prop("disabled", true); return; }
        $("#faqCategorySortSaveBtn").prop("disabled", false);
        $("#faqCategoryManageTableBody").sortable({
            items: "tr.faq-category-manage-row", handle: ".faq-category-sort-handle", axis: "y", tolerance: "pointer",
            placeholder: "faq-category-sort-placeholder",
            start: function(e, ui) { ui.placeholder.html("<td colspan='6'></td>"); },
            update: function() {
                faqCategorySortChanged = true;
                $("#faqCategoryManageTableBody tr.faq-category-manage-row").each(function(i) { $(this).find(".faq-category-order-no").text(i + 1); });
            }
        });
    }

    function openFaqCategoryManageModal() {
        resetFaqCategoryForm();
        renderFaqCategoryManageList(faqCategoryList);
        initFaqCategorySortable();
        $("#faqCategoryManageModal").modal("show");
    }

    function editFaqCategory(no) {
        let c = null;
        $.each(faqCategoryList || [], function(i, item) { if (String(item.faqCategoryNo) === String(no)) { c = item; return false; } });
        if (!c) { alert("카테고리 정보를 찾을 수 없습니다."); return; }
        $("#manageFaqCategoryNo").val(c.faqCategoryNo);
        $("#manageFaqCategoryName").val(c.faqCategoryName || c.categoryName || "");
        $("#manageFaqCategoryUseYn").val(c.useYn || "Y");
        $("#manageFaqCategoryDisplayOrder").val(c.displayOrder == null ? "" : c.displayOrder);
        $("#faqCategorySaveBtn").text("수정");
        $("#faqCategoryFormResetBtn").show();
    }

    function saveFaqCategory() {
        if (isFaqCategorySaving) return;
        let name = $.trim($("#manageFaqCategoryName").val() || "");
        if (!name) { alert("카테고리명을 입력해주세요."); return; }
        let no = $("#manageFaqCategoryNo").val();
        let order = $("#manageFaqCategoryDisplayOrder").val();
        let isUpdate = no !== "";
        let data = { faqCategoryName:name, useYn:$("#manageFaqCategoryUseYn").val() || "Y", displayOrder:order ? Number(order) : null };
        if (isUpdate) { data.faqCategoryNo = Number(no); data.updateId = $("#manageFaqCategoryUserId").val() || ""; }
        else data.insertId = $("#manageFaqCategoryUserId").val() || "";
        if (!confirm(isUpdate ? "FAQ 카테고리를 수정하시겠습니까?" : "FAQ 카테고리를 등록하시겠습니까?")) return;
        isFaqCategorySaving = true;
        $.ajax({
            url: isUpdate ? "${path}/api/system/faq/category/update" : "${path}/api/system/faq/category/insert",
            type:"POST", contentType:"application/json; charset=UTF-8", data:JSON.stringify(data), dataType:"json",
            success:function(res) {
                alert(res && res.message ? res.message : (isUpdate ? "FAQ 카테고리가 수정되었습니다." : "FAQ 카테고리가 등록되었습니다."));
                resetFaqCategoryForm();
                loadFaqCategoryList(function() { renderFaqCategoryManageList(faqCategoryList); initFaqCategorySortable(); loadFaqList(); });
            },
            error:function(xhr) { alert(xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : "FAQ 카테고리 저장 중 오류가 발생했습니다."); },
            complete:function() { isFaqCategorySaving = false; $("#faqCategorySaveBtn").prop("disabled", false); }
        });
    }

    function deleteFaqCategory(no, count) {
        if (isFaqCategoryDeleting) return;
        if (Number(count || 0) > 0) { alert("해당 카테고리에 등록된 FAQ가 있어 삭제할 수 없습니다."); return; }
        if (!confirm("FAQ 카테고리를 삭제하시겠습니까?")) return;
        isFaqCategoryDeleting = true;
        $.ajax({
            url:"${path}/api/system/faq/category/delete", type:"POST",
            data:{ faqCategoryNo:no, updateId:$("#manageFaqCategoryUserId").val() || "" },
            success:function(res) {
                alert(res && res.message ? res.message : "FAQ 카테고리가 삭제되었습니다.");
                if (String(currentFaqCategoryNo) === String(no)) { currentFaqCategoryNo = ""; currentFaqCategoryName = "전체 FAQ"; $("#currentFaqCategoryName").text("전체 FAQ"); }
                loadFaqCategoryList(function() { renderFaqCategoryManageList(faqCategoryList); initFaqCategorySortable(); loadFaqList(); });
            },
            error:function(xhr) { alert(xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : "FAQ 카테고리 삭제 중 오류가 발생했습니다."); },
            complete:function() { isFaqCategoryDeleting = false; }
        });
    }

    function saveFaqCategorySortOrder() {
        if (isFaqCategorySortSaving) return;
        if (!faqCategorySortChanged) { alert("변경된 카테고리 순서가 없습니다."); return; }
        let list = [];
        $("#faqCategoryManageTableBody tr.faq-category-manage-row").each(function(i) { list.push({ faqCategoryNo:Number($(this).attr("data-category-no")), displayOrder:i + 1 }); });
        if (!confirm("변경된 카테고리 순서를 저장하시겠습니까?")) return;
        isFaqCategorySortSaving = true;
        $.ajax({
            url:"${path}/api/system/faq/category/sort", type:"POST", contentType:"application/json; charset=UTF-8", data:JSON.stringify(list), dataType:"json",
            success:function(res) { alert(res && res.message ? res.message : "FAQ 카테고리 순서가 저장되었습니다."); faqCategorySortChanged = false; loadFaqCategoryList(function() { renderFaqCategoryManageList(faqCategoryList); initFaqCategorySortable(); }); },
            error:function(xhr) { alert(xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : "FAQ 카테고리 순서 저장 중 오류가 발생했습니다."); },
            complete:function() { isFaqCategorySortSaving = false; }
        });
    }

    function loadFaqList() {
        if (isFaqLoading) {
            return;
        }

        isFaqLoading = true;
        faqSortChanged = false;

        $("#faqTableBody").html(
            "<tr>"
            + "    <td colspan='8' class='faq-table-empty'>"
            + "        FAQ 목록을 불러오는 중입니다."
            + "    </td>"
            + "</tr>"
        );

        $.ajax({
            url: "${path}/api/system/faq/list",
            type: "GET",
            data: getFaqSearchParams(),

            success: function(res) {
                faqList = getFaqListFromResponse(res);

                renderFaqList(faqList);
                updateCategoryCount(res, faqList);
                initFaqSortable();
            },

            error: function(xhr) {
                console.error(xhr);

                $("#faqTableBody").html(
                    "<tr>"
                    + "    <td colspan='8' class='faq-table-empty text-danger'>"
                    + "        FAQ 목록을 불러오는 중 오류가 발생했습니다."
                    + "    </td>"
                    + "</tr>"
                );

                $("#faqTotalCount").text("0");
            },

            complete: function() {
                isFaqLoading = false;
            }
        });
    }

    function reloadFaqData() {
        loadFaqCategoryList(function() {
            loadFaqList();
        });
    }

    function renderFaqList(list) {
        $("#faqTotalCount").text(list ? list.length : 0);

        if (!list || list.length === 0) {
            $("#faqTableBody").html(
                "<tr>"
                + "    <td colspan='8' class='faq-table-empty'>"
                + "        조회된 FAQ가 없습니다."
                + "    </td>"
                + "</tr>"
            );

            return;
        }

        let html = "";

        $.each(list, function(index, row) {
            let faqNo = row.faqNo || "";
            let faqQ = row.faqQ || row.question || row.faqQuestion || "-";

            let faqCategoryNo =
                row.faqCategoryNo == null
                    ? ""
                    : row.faqCategoryNo;

            let faqCategoryName =
                row.faqCategoryName ||
                (
                    row.faqCategory &&
                    row.faqCategory.faqCategoryName
                        ? row.faqCategory.faqCategoryName
                        : "-"
                );

            let useYn = String(row.useYn || "N");
            let insertId = row.insertId || "-";
            let insertDate = formatFaqDate(row.insertDate);

            let displayOrder =
                row.displayOrder == null
                    ? index + 1
                    : row.displayOrder;

            let selectedClass =
                String(selectedFaqNo) === String(faqNo)
                    ? " selected"
                    : "";

            let useYnHtml =
                useYn === "Y"
                    ? "<span class='faq-use-badge is-use'>사용</span>"
                    : "<span class='faq-use-badge is-unused'>미사용</span>";

            html += ""
                + "<tr class='faq-row"
                + selectedClass
                + "' data-faq-no='"
                + escapeFaqHtml(faqNo)
                + "' data-category-no='"
                + escapeFaqHtml(faqCategoryNo)
                + "'>"

                + "    <td class='faq-sort-handle'>"
                + "        <i class='fa fa-bars'></i>"
                + "    </td>"

                + "    <td class='text-center'>"
                + "        <span class='faq-order-no'>"
                +              escapeFaqHtml(displayOrder)
                + "        </span>"
                + "    </td>"

                + "    <td>"
                + "        <div class='faq-question-cell'>"
                + "            <div class='faq-question-icon'>"
                + "                <i class='fa fa-question'></i>"
                + "            </div>"
                + "            <div class='faq-question-text' "
                + "                 title='"
                +                  escapeFaqHtml(faqQ)
                + "'>"
                +                  escapeFaqHtml(faqQ)
                + "            </div>"
                + "        </div>"
                + "    </td>"

                + "    <td>"
                + "        <span class='faq-category-badge'>"
                +              escapeFaqHtml(faqCategoryName)
                + "        </span>"
                + "    </td>"

                + "    <td class='text-center'>"
                +          useYnHtml
                + "    </td>"

                + "    <td>"
                +          escapeFaqHtml(insertId)
                + "    </td>"

                + "    <td>"
                +          escapeFaqHtml(insertDate)
                + "    </td>"

                + "    <td class='text-center'>"
                + "        <button type='button' "
                + "                class='faq-edit-btn' "
                + "                data-faq-no='"
                +                  escapeFaqHtml(faqNo)
                + "'>"
                + "            수정"
                + "        </button>"

                + "        <button type='button' "
                + "                class='faq-delete-btn' "
                + "                data-faq-no='"
                +                  escapeFaqHtml(faqNo)
                + "'>"
                + "            삭제"
                + "        </button>"
                + "    </td>"

                + "</tr>";
        });

        $("#faqTableBody").html(html);
    }

    function updateCategoryCount(res, list) {
        let categoryCountList = [];

        if (
            res &&
            Array.isArray(res.categoryCountList)
        ) {
            categoryCountList = res.categoryCountList;

        } else if (
            res &&
            res.data &&
            Array.isArray(res.data.categoryCountList)
        ) {
            categoryCountList = res.data.categoryCountList;
        }

        if (categoryCountList.length > 0) {
            let totalCount = 0;

            $.each(categoryCountList, function(index, item) {
                let categoryNo = item.faqCategoryNo;

                let count =
                    item.faqCount == null
                        ? 0
                        : Number(item.faqCount);

                totalCount += count;

                $(
                    "[data-count-category-no='"
                    + categoryNo
                    + "']"
                ).text(count);
            });

            $("[data-count-category-no='']").text(totalCount);
            return;
        }

        let categoryApiTotalCount = 0;
        let hasCategoryApiCount = false;

        $.each(faqCategoryList || [], function(index, category) {
            if (category.faqCount != null) {
                hasCategoryApiCount = true;
            }

            let count =
                category.faqCount == null
                    ? 0
                    : Number(category.faqCount);

            categoryApiTotalCount += count;

            $(
                "[data-count-category-no='"
                + category.faqCategoryNo
                + "']"
            ).text(count);
        });

        if (hasCategoryApiCount) {
            $("[data-count-category-no='']")
                .text(categoryApiTotalCount);

            return;
        }

        let localCounts = {};

        $.each(list || [], function(index, row) {
            let categoryNo =
                row.faqCategoryNo == null
                    ? ""
                    : String(row.faqCategoryNo);

            if (!categoryNo) {
                return;
            }

            localCounts[categoryNo] =
                (localCounts[categoryNo] || 0) + 1;
        });

        if (currentFaqCategoryNo === "") {
            $("[data-count-category-no='']")
                .text((list || []).length);

            $.each(localCounts, function(categoryNo, count) {
                $(
                    "[data-count-category-no='"
                    + categoryNo
                    + "']"
                ).text(count);
            });

        } else {
            $(
                "[data-count-category-no='"
                + currentFaqCategoryNo
                + "']"
            ).text((list || []).length);
        }
    }

    function initFaqSortable() {
        if ($("#faqTableBody").hasClass("ui-sortable")) {
            $("#faqTableBody").sortable("destroy");
        }

        let disabled = hasFaqFilter();

        $("#faqSortMessage").toggleClass("show", disabled);
        $("#faqSortSaveBtn").prop("disabled", disabled);

        if (disabled) {
            $(".faq-sort-handle").css("cursor", "default");
            return;
        }

        $(".faq-sort-handle").css("cursor", "move");

        if (!$.fn.sortable) {
            $("#faqSortMessage")
                .addClass("show")
                .text("jQuery UI Sortable이 로드되지 않아 드래그 정렬을 사용할 수 없습니다.");

            $("#faqSortSaveBtn").prop("disabled", true);
            return;
        }

        $("#faqTableBody").sortable({
            items: "tr.faq-row",
            handle: ".faq-sort-handle",
            axis: "y",
            tolerance: "pointer",

            helper: function(e, tr) {
                let $originals = tr.children();
                let $helper = tr.clone();

                $helper.children().each(function(index) {
                    $(this).width($originals.eq(index).outerWidth());
                });

                return $helper;
            },

            placeholder: "faq-sort-placeholder",

            start: function(e, ui) {
                ui.placeholder.html(
                    "<td colspan='8'></td>"
                );
            },

            update: function() {
                faqSortChanged = true;
                updateFaqOrderNumber();
            }
        });
    }

    function updateFaqOrderNumber() {
        $("#faqTableBody tr.faq-row").each(
            function(index) {
                $(this)
                    .find(".faq-order-no")
                    .text(index + 1);
            }
        );
    }

    function saveFaqSortOrder() {
        if (isFaqSortSaving) {
            return;
        }

        if (hasFaqFilter()) {
            alert("검색 조건이 적용된 상태에서는 순서를 저장할 수 없습니다.");
            return;
        }

        if (!faqSortChanged) {
            alert("변경된 순서가 없습니다.");
            return;
        }

        let sortList = [];

        $("#faqTableBody tr.faq-row").each(
            function(index) {
                sortList.push({
                    faqNo: Number($(this).data("faq-no")),
                    displayOrder: index + 1
                });
            }
        );

        if (sortList.length === 0) {
            return;
        }

        if (!confirm("변경된 FAQ 노출 순서를 저장하시겠습니까?")) {
            return;
        }

        isFaqSortSaving = true;
        $("#faqSortSaveBtn").prop("disabled", true);

        $.ajax({
            url: "${path}/api/system/faq/sort",
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(sortList),
            dataType: "json",

            success: function(res) {
                alert(
                    res && res.message
                        ? res.message
                        : "FAQ 노출 순서가 저장되었습니다."
                );

                faqSortChanged = false;
                loadFaqList();
            },

            error: function(xhr) {
                console.error(xhr);

                let message =
                    "FAQ 순서 저장 중 오류가 발생했습니다.";

                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.message
                ) {
                    message = xhr.responseJSON.message;
                }

                alert(message);
                loadFaqList();
            },

            complete: function() {
                isFaqSortSaving = false;

                if (!hasFaqFilter()) {
                    $("#faqSortSaveBtn").prop("disabled", false);
                }
            }
        });
    }

    function deleteFaq(faqNo) {
        if (isFaqDeleting) {
            return;
        }

        if (!faqNo) {
            alert("FAQ 번호가 없습니다.");
            return;
        }

        if (!confirm("해당 FAQ를 삭제하시겠습니까?")) {
            return;
        }

        isFaqDeleting = true;
        $(".faq-delete-btn").prop("disabled", true);

        $.ajax({
            url: "${path}/api/system/faq/delete",
            type: "POST",
            data: {
                faqNo: faqNo
            },

            success: function(res) {
                alert(
                    res && res.message
                        ? res.message
                        : "FAQ가 삭제되었습니다."
                );

                selectedFaqNo = null;
                reloadFaqData();
            },

            error: function(xhr) {
                console.error(xhr);

                let message =
                    "FAQ 삭제 중 오류가 발생했습니다.";

                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.message
                ) {
                    message = xhr.responseJSON.message;
                }

                alert(message);
            },

            complete: function() {
                isFaqDeleting = false;
                $(".faq-delete-btn").prop("disabled", false);
            }
        });
    }

    function resetFaqEditForm() {
        if ($("#faqEditForm").length > 0) {
            $("#faqEditForm")[0].reset();
        }

        $("#editFaqNo").val("");
        $("#editFaqCategoryNo").val("");
        $("#editFaqUseYn").val("Y");
        $("#editDisplayOrder").val("");
        $("#editFaqQCount").text("0");

        isFaqUpdating = false;
        $("#faqEditSaveBtn").prop("disabled", false);
    }

    function openFaqEditModal(faqNo) {
        if (!faqNo) {
            alert("FAQ 번호가 없습니다.");
            return;
        }

        resetFaqEditForm();

        $.ajax({
            url: "${path}/api/system/faq/detail",
            type: "GET",
            data: {
                faqNo: faqNo
            },

            success: function(res) {
                let faq =
                    res && res.faq
                        ? res.faq
                        : (
                            res &&
                            res.data &&
                            res.data.faq
                                ? res.data.faq
                                : (
                                    res && res.data
                                        ? res.data
                                        : res
                                )
                        );

                if (!faq) {
                    alert("FAQ 상세정보가 없습니다.");
                    return;
                }

                let faqQ =
                    faq.faqQ ||
                    faq.question ||
                    faq.faqQuestion ||
                    "";

                let faqA =
                    faq.faqA ||
                    faq.answer ||
                    faq.faqAnswer ||
                    "";

                $("#editFaqNo")
                    .val(faq.faqNo || faqNo);

                $("#editFaqCategoryNo")
                    .val(
                        faq.faqCategoryNo == null
                            ? ""
                            : String(faq.faqCategoryNo)
                    );

                $("#editFaqUseYn")
                    .val(faq.useYn || "Y");

                $("#editDisplayOrder")
                    .val(
                        faq.displayOrder == null
                            ? ""
                            : faq.displayOrder
                    );

                $("#editFaqQ").val(faqQ);
                $("#editFaqA").val(faqA);
                $("#editFaqQCount").text(faqQ.length);

                $("#faqEditModal").modal("show");
            },

            error: function(xhr) {
                let message =
                    "FAQ 상세정보를 불러오지 못했습니다.";

                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.message
                ) {
                    message = xhr.responseJSON.message;
                }

                alert(message);
            }
        });
    }

    function validateFaqEditForm() {
        let faqCategoryNo =
            $("#editFaqCategoryNo").val();

        let faqQ =
            $.trim($("#editFaqQ").val() || "");

        let faqA =
            $.trim($("#editFaqA").val() || "");

        if (!faqCategoryNo) {
            alert("카테고리를 선택해주세요.");
            $("#editFaqCategoryNo").focus();
            return false;
        }

        if (!faqQ) {
            alert("질문을 입력해주세요.");
            $("#editFaqQ").focus();
            return false;
        }

        if (faqQ.length > 500) {
            alert("질문은 최대 500자까지 입력할 수 있습니다.");
            $("#editFaqQ").focus();
            return false;
        }

        if (!faqA) {
            alert("답변을 입력해주세요.");
            $("#editFaqA").focus();
            return false;
        }

        return true;
    }

    function updateFaq() {
        if (isFaqUpdating || !validateFaqEditForm()) {
            return;
        }

        let faqNo = $("#editFaqNo").val();
        let displayOrder = $("#editDisplayOrder").val();

        let requestData = {
            faqNo: Number(faqNo),

            faqCategoryNo:
                Number($("#editFaqCategoryNo").val()),

            faqQ:
                $.trim($("#editFaqQ").val() || ""),

            faqA:
                $.trim($("#editFaqA").val() || ""),

            useYn:
                $("#editFaqUseYn").val() || "Y",

            displayOrder:
                displayOrder
                    ? Number(displayOrder)
                    : null,

            updateId:
                $("#editFaqUserId").val() || ""
        };

        if (!confirm("FAQ를 수정하시겠습니까?")) {
            return;
        }

        isFaqUpdating = true;
        $("#faqEditSaveBtn").prop("disabled", true);

        $.ajax({
            url: "${path}/api/system/faq/update",
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(requestData),
            dataType: "json",

            success: function(res) {
                alert(
                    res && res.message
                        ? res.message
                        : "FAQ가 수정되었습니다."
                );

                $("#faqEditModal").modal("hide");

                selectedFaqNo = Number(faqNo);
                reloadFaqData();
            },

            error: function(xhr) {
                let message =
                    "FAQ 수정 중 오류가 발생했습니다.";

                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.message
                ) {
                    message = xhr.responseJSON.message;

                } else if (xhr.responseText) {
                    message = xhr.responseText;
                }

                alert(message);
            },

            complete: function() {
                isFaqUpdating = false;
                $("#faqEditSaveBtn").prop("disabled", false);
            }
        });
    }

    function resetFaqInsertForm() {
        if ($("#faqInsertForm").length > 0) {
            $("#faqInsertForm")[0].reset();
        }

        $("#insertFaqCategoryNo").val("");
        $("#insertFaqUseYn").val("Y");
        $("#insertDisplayOrder").val("");
        $("#insertFaqQCount").text("0");

        isFaqInserting = false;
        $("#faqInsertSaveBtn").prop("disabled", false);
    }

    function openFaqInsertModal() {
        resetFaqInsertForm();

        if (currentFaqCategoryNo !== "") {
            $("#insertFaqCategoryNo")
                .val(String(currentFaqCategoryNo));
        }

        $("#faqInsertModal").modal("show");

        setTimeout(function() {
            if (!$("#insertFaqCategoryNo").val()) {
                $("#insertFaqCategoryNo").focus();
            } else {
                $("#insertFaqQ").focus();
            }
        }, 250);
    }

    function validateFaqInsertForm() {
        let faqCategoryNo =
            $("#insertFaqCategoryNo").val();

        let faqQ =
            $.trim($("#insertFaqQ").val() || "");

        let faqA =
            $.trim($("#insertFaqA").val() || "");

        if (!faqCategoryNo) {
            alert("카테고리를 선택해주세요.");
            $("#insertFaqCategoryNo").focus();
            return false;
        }

        if (!faqQ) {
            alert("질문을 입력해주세요.");
            $("#insertFaqQ").focus();
            return false;
        }

        if (faqQ.length > 500) {
            alert("질문은 최대 500자까지 입력할 수 있습니다.");
            $("#insertFaqQ").focus();
            return false;
        }

        if (!faqA) {
            alert("답변을 입력해주세요.");
            $("#insertFaqA").focus();
            return false;
        }

        return true;
    }

    function insertFaq() {
        if (isFaqInserting) {
            return;
        }

        if (!validateFaqInsertForm()) {
            return;
        }

        let displayOrder =
            $("#insertDisplayOrder").val();

        let requestData = {
            faqCategoryNo:
                Number($("#insertFaqCategoryNo").val()),

            faqQ:
                $.trim($("#insertFaqQ").val() || ""),

            faqA:
                $.trim($("#insertFaqA").val() || ""),

            useYn:
                $("#insertFaqUseYn").val() || "Y",

            displayOrder:
                displayOrder
                    ? Number(displayOrder)
                    : null,

            insertId:
                $("#insertFaqUserId").val() || ""
        };

        if (!confirm("FAQ를 등록하시겠습니까?")) {
            return;
        }

        isFaqInserting = true;
        $("#faqInsertSaveBtn").prop("disabled", true);

        $.ajax({
            url: "${path}/api/system/faq/insert",
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(requestData),
            dataType: "json",

            success: function(res) {
                alert(
                    res && res.message
                        ? res.message
                        : "FAQ가 등록되었습니다."
                );

                $("#faqInsertModal").modal("hide");

                selectedFaqNo = null;
                reloadFaqData();
            },

            error: function(xhr) {
                console.error(xhr);

                let message =
                    "FAQ 등록 중 오류가 발생했습니다.";

                if (
                    xhr.responseJSON &&
                    xhr.responseJSON.message
                ) {
                    message = xhr.responseJSON.message;

                } else if (xhr.responseText) {
                    message = xhr.responseText;
                }

                alert(message);
            },

            complete: function() {
                isFaqInserting = false;
                $("#faqInsertSaveBtn").prop("disabled", false);
            }
        });
    }

    $(() => {
        loadFaqCategoryList(function() {
            loadFaqList();
        });

        $(document).on(
            "click",
            ".faq-category-item",
            function() {
                if (faqSortChanged) {
                    if (!confirm(
                        "저장하지 않은 정렬 변경사항이 있습니다. 이동하시겠습니까?"
                    )) {
                        return;
                    }
                }

                $(".faq-category-item").removeClass("active");
                $(this).addClass("active");

                currentFaqCategoryNo =
                    String(
                        $(this).attr("data-category-no") || ""
                    );

                currentFaqCategoryName =
                    $(this)
                        .find(".faq-category-name")
                        .text();

                $("#currentFaqCategoryName")
                    .text(currentFaqCategoryName);

                selectedFaqNo = null;
                loadFaqList();
            }
        );

        $("#faqSearchBtn").on("click", function() {
            selectedFaqNo = null;
            loadFaqList();
        });

        $("#searchKeyword").on("keyup", function(e) {
            if (e.keyCode === 13) {
                selectedFaqNo = null;
                loadFaqList();
            }
        });

        $("#searchUseYn").on("change", function() {
            selectedFaqNo = null;
            loadFaqList();
        });

        $("#faqReloadBtn").on("click", function() {
            selectedFaqNo = null;
            reloadFaqData();
        });

        $("#faqSortSaveBtn").on("click", function() {
            saveFaqSortOrder();
        });

        $("#faqCategoryManageBtn").on("click", openFaqCategoryManageModal);
        $("#faqCategorySaveBtn").on("click", saveFaqCategory);
        $("#faqCategoryFormResetBtn").on("click", resetFaqCategoryForm);
        $("#faqCategorySortSaveBtn").on("click", saveFaqCategorySortOrder);
        $(document).on("click", ".faq-category-edit-btn", function(e) { e.preventDefault(); e.stopPropagation(); editFaqCategory($(this).attr("data-category-no")); });
        $(document).on("click", ".faq-category-delete-btn", function(e) { e.preventDefault(); e.stopPropagation(); deleteFaqCategory($(this).attr("data-category-no"), $(this).attr("data-faq-count")); });
        $("#faqCategoryManageModal").on("hidden.bs.modal", function() { resetFaqCategoryForm(); faqCategorySortChanged = false; });

        $("#faqInsertBtn").on("click", function() {
            openFaqInsertModal();
        });

        $("#faqInsertSaveBtn").on("click", function() {
            insertFaq();
        });

        $("#insertFaqQ").on("input", function() {
            $("#insertFaqQCount").text(
                String($(this).val() || "").length
            );
        });

        $("#faqInsertModal").on(
            "hidden.bs.modal",
            function() {
                resetFaqInsertForm();
            }
        );

        $("#faqEditSaveBtn").on("click", function() {
            updateFaq();
        });

        $("#editFaqQ").on("input", function() {
            $("#editFaqQCount").text(
                String($(this).val() || "").length
            );
        });

        $("#faqEditModal").on(
            "hidden.bs.modal",
            function() {
                resetFaqEditForm();
            }
        );

        $(document).on(
            "click",
            ".faq-edit-btn",
            function(e) {
                e.preventDefault();
                e.stopPropagation();

                openFaqEditModal(
                    $(this).data("faq-no")
                );
            }
        );

        $(document).on(
            "click",
            ".faq-delete-btn",
            function(e) {
                e.preventDefault();
                e.stopPropagation();

                deleteFaq(
                    $(this).data("faq-no")
                );
            }
        );

        $(document).on(
            "click",
            "#faqTableBody tr.faq-row td:not(.faq-sort-handle)",
            function(e) {
                if (
                    $(e.target).closest(
                        ".faq-edit-btn, .faq-delete-btn"
                    ).length
                ) {
                    return;
                }

                let $row =
                    $(this).closest("tr.faq-row");

                $("#faqTableBody tr")
                    .removeClass("selected");

                $row.addClass("selected");

                selectedFaqNo =
                    $row.data("faq-no");
            }
        );

        $(window).on("beforeunload", function() {
            if (faqSortChanged) {
                return "저장하지 않은 FAQ 정렬 변경사항이 있습니다.";
            }
        });
    });
</script>
</body>
</html>
