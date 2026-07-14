<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<div class="modal-dialog modal-lg badge-register-modal" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse m-0">
            <div class="panel-heading ui-sortable-handle">
                <h4 class="panel-title">뱃지 이미지 수정</h4>
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
            <div class="badge-register-shell">
                <div class="badge-register-main">

                    <div class="badge-register-left">
                        <div class="badge-section-head">
                            <h4 class="badge-section-title">기본정보</h4>
                            <div class="badge-section-sub">
                                뱃지 타입, 사용 여부, 데이터 상태를 수정할 수 있습니다.
                            </div>
                        </div>

                        <div class="badge-section-body">
                            <form class="form-coupon-search"
                                  name="badgeUpdateForm"
                                  id="badgeUpdateForm"
                                  enctype="multipart/form-data">

                                <input type="hidden"
                                       id="updateBadgeFileNo"
                                       name="badgeFileNo">

                                <input type="hidden"
                                       id="updateUserId"
                                       name="userId"
                                       value="${sessionScope.sessionKey.userLoginId}">

                                <input type="hidden"
                                       name="appCode"
                                       value="${sessionScope.sessionKey.appCode}">

                                <div class="badge-admin-panel">
                                    <div class="badge-info-wrap">

                                        <div class="badge-info-row">
                                            <div class="badge-info-label">
                                                뱃지 번호
                                            </div>
                                            <div class="badge-info-value">
                                                <span id="updateBadgeFileNoText">-</span>
                                            </div>
                                        </div>

                                        <div class="badge-info-row">
                                            <div class="badge-info-label">
                                                뱃지 타입 <span class="text-danger">*</span>
                                            </div>
                                            <div class="badge-info-value">
                                                <select class="form-control badge-admin-select"
                                                        id="updateBadgeType"
                                                        name="badgeType">
                                                    <option value="1">공통 뱃지</option>
                                                    <option value="2">개별 뱃지</option>
                                                </select>
                                                <div class="badge-help-text">
                                                    개별 뱃지는 특정 가맹점 코드와 연결할 수 있습니다.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="badge-info-row" id="updateStCodeRow" style="display: none;">
                                            <div class="badge-info-label">
                                                가맹점 코드
                                            </div>
                                            <div class="badge-info-value">
                                                <input type="text"
                                                       class="form-control badge-admin-input"
                                                       id="updateStCode"
                                                       name="stCode"
                                                       maxlength="30"
                                                       placeholder="개별 뱃지 사용 가맹점 코드 입력">
                                            </div>
                                        </div>

                                        <div class="badge-info-row" id="updateUsingYnRow" style="display: none;">
                                            <div class="badge-info-label">
                                                사용 여부 <span class="text-danger">*</span>
                                            </div>
                                            <div class="badge-info-value">
                                                <select class="form-control badge-admin-select"
                                                        id="updateUsingYn"
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
                                                        id="updateDataStatus"
                                                        name="dataStatus">
                                                    <option value="1">정상</option>
                                                    <option value="2">정지</option>
                                                    <option value="0">삭제</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="badge-info-row">
                                            <div class="badge-info-label">
                                                파일명
                                            </div>
                                            <div class="badge-info-value">
                                                <span id="updateOriginalFileName">-</span>
                                            </div>
                                        </div>

                                        <div class="badge-info-row">
                                            <div class="badge-info-label">
                                                등록일
                                            </div>
                                            <div class="badge-info-value">
                                                <span id="updateInsertDate">-</span>
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
                                <label for="updateBadgeFile" class="btn btn-sm btn-primary m-0">
                                    <i class="fa fa-paperclip m-r-5"></i>
                                    이미지 변경
                                </label>

                                <input type="file"
                                       class="badge-file-hidden"
                                       id="updateBadgeFile"
                                       name="badgeFile"
                                       accept="image/*">
                            </div>

                            <div class="badge-preview-hint">
                                이미지를 선택하지 않으면 기존 이미지가 유지됩니다.
                            </div>
                        </div>

                        <div class="badge-preview-area">
                            <div class="badge-preview-card">
                                <div id="updateBadgePreviewBox" class="badge-preview-box">
                                    <span class="badge-preview-empty">NO IMG</span>
                                </div>

                                <div id="updateBadgePreviewFileName" class="badge-preview-file-name">
                                    선택된 이미지가 없습니다.
                                </div>

                                <div id="updateBadgePreviewFileSize" class="badge-preview-file-size"></div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="badge-bottom-actions mt-0">
                    <button type="button" class="btn btn-grey" data-dismiss="modal">
                        닫기
                    </button>

                    <button type="button" class="btn btn-info btn_remove updateBadge">
                        <i class="fa fa-save m-r-3"></i>
                        수정하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
