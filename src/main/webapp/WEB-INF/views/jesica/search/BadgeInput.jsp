<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>
    .badge-register-modal .modal-content {
        border: 0;
        border-radius: 0;
        background: #fff;
        width: 100%;
    }

    .badge-register-modal .modal-body {
        padding: 0;
        background: #f7f8fa;
    }

    .badge-register-shell {
        background: #fff;
        border: 1px solid #cfd6dd;
    }

    .badge-register-main {
        display: flex;
        align-items: stretch;
        min-height: 430px;
    }

    .badge-register-left {
        width: 58%;
        background: #fff;
    }

    .badge-register-right {
        flex: 1;
        min-width: 0;
        border-left: 1px solid #d9dee3;
        background: #fbfbfc;
    }

    .badge-section-head {
        padding: 10px 12px;
        border-bottom: 1px solid #d9dee3;
        background: #f1f3f5;
    }

    .badge-section-title {
        margin: 0;
        font-size: 14px;
        font-weight: 700;
        color: #222;
    }

    .badge-section-sub {
        margin-top: 4px;
        font-size: 12px;
        color: rgba(0,0,0,.5);
    }

    .badge-section-body {
        padding: 14px;
    }

    .badge-admin-panel {
        border: 1px solid #cfd6dd;
        background: #fff;
    }

    .badge-info-wrap {
        background: #fff;
    }

    .badge-info-row {
        display: table;
        width: 100%;
        table-layout: fixed;
        border-bottom: 1px solid #d9dee3;
    }

    .badge-info-row:last-child {
        border-bottom: 0;
    }

    .badge-info-label,
    .badge-info-value {
        display: table-cell;
        vertical-align: middle;
    }

    .badge-info-label {
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

    .badge-info-value {
        padding: 12px;
        background: #fff;
        color: #222;
        font-size: 13px;
        line-height: 1.6;
        min-width: 0;
    }

    .badge-admin-input {
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

    .badge-admin-input:focus {
        border-color: #7ea6d9 !important;
        box-shadow: inset 0 0 0 1px #7ea6d9 !important;
    }

    .badge-admin-select {
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

    .badge-admin-select:focus {
        border-color: #7ea6d9 !important;
        box-shadow: inset 0 0 0 1px #7ea6d9 !important;
    }

    .badge-help-text {
        margin-top: 5px;
        font-size: 12px;
        color: rgba(0,0,0,.45);
    }

    .badge-preview-toolbar {
        padding: 14px 12px;
        border-bottom: 1px solid #d9dee3;
        background: #f7f8fa;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 8px;
        flex-wrap: wrap;
    }

    .badge-preview-title {
        font-size: 13px;
        color: #444;
        display: flex;
        align-items: center;
        gap: 8px;
        font-weight: 700;
    }

    .badge-preview-title .fa-image {
        color: #4b8fd9;
    }

    .badge-preview-hint {
        font-size: 12px;
        color: rgba(0,0,0,.45);
    }

    .badge-file-hidden {
        display: none !important;
    }

    .badge-preview-area {
        padding: 18px 14px;
        background: #fff;
    }

    .badge-preview-card {
        width: 100%;
        min-height: 250px;
        border: 1px dashed #cfd6dd;
        background: #fafbfc;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        gap: 10px;
    }

    .badge-preview-box {
        width: 112px;
        height: 112px;
        border: 1px solid #d9dee3;
        background: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        border-radius: 4px;
        padding: 8px;
    }

    .badge-preview-box img {
        max-width: 100%;
        max-height: 100%;
        display: block;
        object-fit: contain;
    }

    .badge-preview-empty {
        color: rgba(0,0,0,.35);
        font-size: 12px;
        font-weight: 700;
    }

    .badge-preview-file-name {
        max-width: 260px;
        color: #555;
        font-size: 12px;
        line-height: 1.4;
        text-align: center;
        word-break: break-all;
    }

    .badge-preview-file-size {
        color: rgba(0,0,0,.45);
        font-size: 12px;
    }

    .badge-bottom-actions {
        padding: 12px 14px;
        border-top: 1px solid #d9dee3;
        background: #fff;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
    }

    .badge-bottom-actions .btn {
        min-width: 84px;
        border-radius: 0 !important;
        font-weight: 600;
        box-shadow: none !important;
    }

    @media (min-width: 992px) {
        .modal-lg.badge-register-modal,
        .modal-xl.badge-register-modal {
            max-width: 920px;
        }
    }

    @media (max-width: 992px) {
        .badge-register-main {
            flex-direction: column;
        }

        .badge-register-left {
            width: 100%;
        }

        .badge-register-right {
            width: 100%;
            border-left: 0;
            border-top: 1px solid #d9dee3;
        }

        .badge-preview-card {
            min-height: 210px;
        }
    }

    @media (max-width: 768px) {
        .badge-info-row,
        .badge-info-label,
        .badge-info-value {
            display: block;
            width: 100%;
        }

        .badge-info-label {
            border-right: 0;
            border-bottom: 1px solid #d9dee3;
        }

        .badge-admin-select {
            width: 100% !important;
        }

        .badge-preview-box {
            width: 92px;
            height: 92px;
        }
    }

    html.dark-mode .badge-register-modal .modal-content,
    html.dark-mode .badge-register-shell,
    html.dark-mode .badge-register-left,
    html.dark-mode .badge-info-wrap,
    html.dark-mode .badge-info-value,
    html.dark-mode .badge-preview-area,
    html.dark-mode .badge-bottom-actions {
        background: #2d353c;
        color: #d7dde4;
    }

    html.dark-mode .badge-register-right,
    html.dark-mode .badge-preview-card {
        background: #20252a;
    }

    html.dark-mode .badge-section-head,
    html.dark-mode .badge-preview-toolbar,
    html.dark-mode .badge-info-label {
        background: #20252a;
        color: #d7dde4;
    }

    html.dark-mode .badge-register-shell,
    html.dark-mode .badge-register-right,
    html.dark-mode .badge-section-head,
    html.dark-mode .badge-preview-toolbar,
    html.dark-mode .badge-admin-panel,
    html.dark-mode .badge-info-row,
    html.dark-mode .badge-info-label,
    html.dark-mode .badge-preview-card,
    html.dark-mode .badge-preview-box,
    html.dark-mode .badge-bottom-actions {
        border-color: #3b4650;
    }

    html.dark-mode .badge-section-title,
    html.dark-mode .badge-preview-title {
        color: #fff;
    }

    html.dark-mode .badge-section-sub,
    html.dark-mode .badge-help-text,
    html.dark-mode .badge-preview-hint,
    html.dark-mode .badge-preview-file-name,
    html.dark-mode .badge-preview-file-size {
        color: #9aa5b1;
    }

    html.dark-mode .badge-preview-box {
        background: #2d353c;
    }
</style>

<div class="modal-dialog modal-lg badge-register-modal" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse m-0">
            <div class="panel-heading ui-sortable-handle">
                <h4 class="panel-title">뱃지 이미지 등록</h4>
                <div class="panel-heading-btn">
                    <a href="javascript:;"
                       class="btn btn-xs btn-icon btn-circle btn-danger badgeModalCloseBtn"
                       data-dismiss="modal"
                       aria-label="Close">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="modal-body">
            <div class="badge-register-shell">
                <div class="badge-register-main">

                    <div class="badge-register-left">
                        <div class="badge-section-head">
                            <h4 class="badge-section-title">기본정보</h4>
                            <div class="badge-section-sub">
                                뱃지 타입, 사용 여부, 데이터 상태를 선택하고 이미지를 등록해주세요.
                            </div>
                        </div>

                        <div class="badge-section-body">
                            <form class="form-coupon-search" name="badgeInsertForm" id="badgeInsertForm" enctype="multipart/form-data">
                                <input type="hidden" id="badgeUserId" name="userId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <input type="hidden" name="insertUserName" value="${sessionScope.sessionKey.userStaffName}">
                                <input type="hidden" name="appCode" value="${sessionScope.sessionKey.appCode}">

                                <div class="badge-admin-panel">
                                    <div class="badge-info-wrap">

                                        <div class="badge-info-row">
                                            <div class="badge-info-label">
                                                뱃지 타입 <span class="text-danger">*</span>
                                            </div>
                                            <div class="badge-info-value">
                                                <select class="form-control badge-admin-select"
                                                        id="insertBadgeType"
                                                        name="badgeType">
                                                    <option value="1">공통 뱃지</option>
                                                    <option value="2">개별 뱃지</option>
                                                </select>
                                                <div class="badge-help-text">
                                                    공통 뱃지는 여러 가맹점에서 사용할 수 있고, 개별 뱃지는 특정 가맹점용입니다.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="badge-info-row" id="stCodeRow" style="display: none;">
                                            <div class="badge-info-label">
                                                가맹점 코드
                                            </div>
                                            <div class="badge-info-value">
                                                <input type="text"
                                                       class="form-control badge-admin-input"
                                                       id="insertStCode"
                                                       name="stCode"
                                                       maxlength="30"
                                                       placeholder="개별 뱃지 사용 가맹점 코드 입력">
                                                <div class="badge-help-text">
                                                    개별 뱃지를 사용중으로 등록할 때 입력해주세요.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="badge-info-row" id="insertUsingYnRow" style="display: none;">
                                            <div class="badge-info-label">
                                                사용 여부 <span class="text-danger">*</span>
                                            </div>
                                            <div class="badge-info-value">
                                                <select class="form-control badge-admin-select"
                                                        id="insertUsingYn"
                                                        name="usingYn">
                                                    <option value="N">미사용</option>
                                                    <option value="Y">사용중</option>
                                                </select>
                                                <div class="badge-help-text">
                                                    개별 뱃지만 사용 여부를 선택합니다.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="badge-info-row">
                                            <div class="badge-info-label">
                                                데이터 상태 <span class="text-danger">*</span>
                                            </div>
                                            <div class="badge-info-value">
                                                <select class="form-control badge-admin-select"
                                                        id="insertDataStatus"
                                                        name="dataStatus">
                                                    <option value="1">정상</option>
                                                    <option value="2">정지</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="badge-register-right">
                        <div class="badge-preview-toolbar">
                            <div class="badge-preview-title">
                                <i class="fa fa-image"></i>
                                <span>뱃지 이미지</span>
                            </div>

                            <div>
                                <label for="insertBadgeFile" class="btn btn-sm btn-primary m-0">
                                    <i class="fa fa-paperclip m-r-5"></i> 이미지 선택
                                </label>

                                <input type="file"
                                       class="badge-file-hidden"
                                       id="insertBadgeFile"
                                       name="badgeFile"
                                       accept="image/*">
                            </div>

                            <div class="badge-preview-hint">
                                JPG, PNG, GIF 등 이미지 파일만 등록할 수 있습니다.
                            </div>
                        </div>

                        <div class="badge-preview-area">
                            <div class="badge-preview-card">
                                <div id="badgePreviewBox" class="badge-preview-box">
                                    <span class="badge-preview-empty">NO IMG</span>
                                </div>

                                <div id="badgePreviewFileName" class="badge-preview-file-name">
                                    선택된 이미지가 없습니다.
                                </div>

                                <div id="badgePreviewFileSize" class="badge-preview-file-size"></div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="badge-bottom-actions mt-0">
                    <button type="button" class="btn btn-grey badgeModalCloseBtn" data-dismiss="modal">
                        닫기
                    </button>

                    <button type="button" class="btn btn-info btn_remove insertBadge">
                        <i class="fa fa-plus-circle m-r-3"></i>
                        등록하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
