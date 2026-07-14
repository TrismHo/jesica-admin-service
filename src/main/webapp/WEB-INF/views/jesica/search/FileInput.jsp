<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>
    .library-register-modal .modal-content {
        border: 0;
        border-radius: 0;
        background: #fff;
    }

    .library-register-modal .modal-body {
        padding: 0;
        background: #f7f8fa;
    }

    .library-register-shell {
        background: #fff;
        border: 1px solid #cfd6dd;
    }

    .library-register-main {
        display: flex;
        align-items: stretch;
        min-height: 520px;
    }

    .library-register-left {
        width: 58%;
        background: #fff;
    }

    .library-register-right {
        flex: 1;
        min-width: 0;
        border-left: 1px solid #d9dee3;
        background: #fbfbfc;
    }

    .section-head {
        padding: 10px 12px;
        border-bottom: 1px solid #d9dee3;
        background: #f1f3f5;
    }

    .section-title {
        margin: 0;
        font-size: 14px;
        font-weight: 700;
        color: #222;
    }

    .section-sub {
        margin-top: 4px;
        font-size: 12px;
        color: rgba(0,0,0,.5);
    }

    .section-body {
        padding: 14px;
    }

    .admin-panel {
        border: 1px solid #cfd6dd;
        background: #fff;
    }

    .admin-info-wrap {
        background: #fff;
    }

    .admin-info-row {
        display: table;
        width: 100%;
        table-layout: fixed;
        border-bottom: 1px solid #d9dee3;
    }

    .admin-info-row:last-child {
        border-bottom: 0;
    }

    .admin-info-label,
    .admin-info-value {
        display: table-cell;
        vertical-align: middle;
    }

    .admin-info-label {
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

    .admin-info-value {
        padding: 12px;
        background: #fff;
        color: #222;
        font-size: 13px;
        line-height: 1.6;
        min-width: 0;
    }

    .body-row .admin-info-label {
        vertical-align: top;
        padding-top: 14px;
    }

    .body-row .admin-info-value {
        vertical-align: top;
    }

    .admin-input {
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

    .admin-input:focus {
        border-color: #7ea6d9 !important;
        box-shadow: inset 0 0 0 1px #7ea6d9 !important;
    }

    .admin-select {
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

    .admin-select:focus {
        border-color: #7ea6d9 !important;
        box-shadow: inset 0 0 0 1px #7ea6d9 !important;
    }

    .select-help-text {
        margin-top: 5px;
        font-size: 12px;
        color: rgba(0,0,0,.45);
    }

    .admin-textarea {
        height: 240px !important;
        resize: vertical;
        line-height: 1.6 !important;
        padding-top: 10px !important;
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

    .file-toolbar {
        padding: 14px 12px;
        border-bottom: 1px solid #d9dee3;
        background: #f7f8fa;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 8px;
        flex-wrap: wrap;
    }

    .file-toolbar-left,
    .file-toolbar-right {
        display: flex;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
    }

    .file-tree-header {
        font-size: 13px;
        color: #444;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .file-tree-header .fa-folder-open {
        color: #d6a100;
    }

    .file-toolbar-hint {
        font-size: 12px;
        color: rgba(0,0,0,.45);
    }

    .file-scroll {
        max-height: 430px;
        overflow: auto;
        background: #fff;
    }

    .file-table {
        margin: 0 !important;
    }

    .file-table thead tr {
        border-bottom: 1px solid #d9dee3;
        background: #f8f9fa;
    }

    .file-table thead th {
        position: sticky;
        top: 0;
        z-index: 5;
        background: #f8f9fa;
        font-weight: 700;
        color: #333;
    }

    .file-table td,
    .file-table th {
        padding-top: 11px !important;
        padding-bottom: 11px !important;
        vertical-align: middle !important;
    }

    .file-row {
        transition: background-color .12s ease;
    }

    .file-row:hover {
        background: #fafafa;
    }

    .file-empty {
        padding: 40px 12px;
        text-align: center;
        color: rgba(0,0,0,.45);
        font-size: 13px;
    }

    .delete-col {
        text-align: center;
    }

    .delete-file {
        cursor: pointer;
        color: #dc3545;
    }

    .bottom-actions {
        padding: 12px 14px;
        border-top: 1px solid #d9dee3;
        background: #fff;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
    }

    .bottom-actions .btn {
        min-width: 84px;
        border-radius: 0 !important;
        font-weight: 600;
        box-shadow: none !important;
    }

    .file-name-cell {
        max-width: 260px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    @media (min-width: 992px) {
        .modal-lg.library-register-modal,
        .modal-xl.library-register-modal {
            max-width: 1030px;
        }
    }

    @media (max-width: 992px) {
        .library-register-main {
            flex-direction: column;
        }

        .library-register-left {
            width: 100%;
        }

        .library-register-right {
            width: 100%;
            border-left: 0;
            border-top: 1px solid #d9dee3;
        }

        .file-scroll {
            max-height: unset;
        }
    }

    @media (max-width: 768px) {
        .admin-info-row,
        .admin-info-label,
        .admin-info-value {
            display: block;
            width: 100%;
        }

        .admin-info-label {
            border-right: 0;
            border-bottom: 1px solid #d9dee3;
        }

        .admin-textarea {
            height: 180px !important;
        }

        .admin-select {
            width: 100% !important;
        }
    }

    .modal-content {
        width: 100%;
    }
</style>

<div class="modal-dialog modal-lg library-register-modal" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse m-0">
            <div class="panel-heading ui-sortable-handle">
                <h4 class="panel-title">자료등록</h4>
                <div class="panel-heading-btn">
                    <a href="javascript:;"
                       class="btn btn-xs btn-icon btn-circle btn-danger"
                       data-dismiss="modal"
                       aria-label="Close">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="modal-body">
            <div class="library-register-shell">
                <div class="library-register-main">

                    <div class="library-register-left">
                        <div class="section-head">
                            <h4 class="section-title">기본정보</h4>
                            <div class="section-sub">문서명은 최대 100자, 문서내용은 최대 1000자까지 입력 가능합니다.</div>
                        </div>

                        <div class="section-body">
                            <form class="form-coupon-search" name="libraryForm" id="libraryForm">
                                <input type="hidden" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" name="insertUserName" value="${sessionScope.sessionKey.userStaffName}">
                                <input type="hidden" name="appCode" value="${sessionScope.sessionKey.appCode}">

                                <div class="admin-panel">
                                    <div class="admin-info-wrap">

                                        <div class="admin-info-row">
                                            <div class="admin-info-label">문서명</div>
                                            <div class="admin-info-value">
                                                <input type="text"
                                                       class="form-control admin-input fileTitle"
                                                       name="fileTitle"
                                                       id="fileTitle"
                                                       maxlength="100"
                                                       placeholder="문서명을 입력해주세요">

                                                <div class="char-row">
                                                    <span>최대 100자</span>
                                                    <span class="char-count" id="fileTitleCount">0 / 100</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="admin-info-row">
                                            <div class="admin-info-label">문서타입</div>
                                            <div class="admin-info-value">
                                                <select class="form-control admin-select fileType"
                                                        id="fileType"
                                                        name="fileType">
                                                    <option value="1">공통</option>
                                                    <option value="2">총판</option>
                                                    <option value="3">사용자</option>
                                                </select>
                                                <div class="select-help-text">
                                                    공통은 전체 대상 자료로 조회됩니다.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="admin-info-row">
                                            <div class="admin-info-label">업종</div>
                                            <div class="admin-info-value">
                                                <select class="form-control admin-select shopType"
                                                        id="shopType"
                                                        name="shopType">
                                                    <option value="1">모두</option>
                                                    <option value="2">음식업</option>
                                                    <option value="3">특산물</option>
                                                </select>
                                                <div class="select-help-text">
                                                    모두는 전체 업종 대상 자료로 조회됩니다.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="admin-info-row body-row">
                                            <div class="admin-info-label">문서내용</div>
                                            <div class="admin-info-value">
                                                <textarea class="form-control admin-input admin-textarea"
                                                          id="fileBody"
                                                          name="fileBody"
                                                          maxlength="1000"
                                                          placeholder="문서내용을 입력해주세요"></textarea>

                                                <div class="char-row">
                                                    <span>최대 1000자</span>
                                                    <span class="char-count" id="fileBodyCount">0 / 1000</span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="library-register-right">
                        <div class="file-toolbar">
                            <div class="file-toolbar-left">
                                <div class="file-tree-header">
                                    <i class="fa fa-folder-open"></i>
                                    <span>첨부파일</span>
                                </div>
                            </div>

                            <div class="file-toolbar-right">
                                <label for="libFile" class="btn btn-sm btn-primary m-0">
                                    <i class="fa fa-paperclip m-r-5"></i> 파일선택
                                </label>

                                <form method="POST"
                                      id="multiForm"
                                      onsubmit="return false;"
                                      enctype="multipart/form-data"
                                      class="m-0">
                                    <input type="file"
                                           id="libFile"
                                           onchange="addFile(this);"
                                           multiple
                                           name="imgFile1"
                                           class="fileBtn d-none"
                                           accept="*">
                                </form>

                                <div class="file-toolbar-hint">선택한 파일이 아래 목록에 추가됩니다.</div>
                            </div>
                        </div>

                        <div class="file-scroll">
                            <table class="table table-striped table-borderless table-sm m-0 text-nowrap file-table">
                                <thead>
                                <tr>
                                    <th class="w-10px ps-10px"></th>
                                    <th class="px-10px">파일명</th>
                                    <th class="px-10px w-100px">크기</th>
                                    <th class="px-10px w-60px text-center"></th>
                                </tr>
                                </thead>
                                <tbody id="file-list" class="file-list">
                                <tr class="none-file">
                                    <td colspan="4" class="file-empty">파일이 존재하지 않습니다.</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="bottom-actions mt-0">
                    <button type="button" class="btn btn-grey libModalCloseBtn" data-dismiss="modal">
                        닫기
                    </button>

                    <button type="button" class="btn btn-info btn_remove insertLibrary">
                        <i class="fa fa-plus-circle m-r-3"></i>
                        등록하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
