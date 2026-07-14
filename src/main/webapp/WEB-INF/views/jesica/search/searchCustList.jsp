<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }

    .dataTables_paginate li {
        padding: 0;
        background: #F9F9F9;
    }

    .modal-footer {
        display: block;
    }

    a.page-link {
        padding: 5px 10px;
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(45, 53, 60, .15);
        border-radius: 4px;
    }

    @media (min-width: 992px) {
        .modal-lg,
        .modal-xl {
            max-width: 1280px;
        }
    }

    @media (max-width: 1920px) {
        .modal-content {
            width: 100%;
        }
    }

    .modal-body {
        padding: 5px;
    }

    .cust-list th,
    .cust-list td {
        padding: 5px 2px 5px 10px;
    }

    table.table-bordered.dataTable tbody th,
    table.table-bordered.dataTable tbody td {
        border-bottom-width: 1px;
    }

    .dataTables_scrollBody {
        background-color: #e4e4e4;
    }

    .coupon-main-layout {
        display: grid;
        grid-template-columns: minmax(0, 80%) minmax(240px, 20%);
        gap: 12px;
        align-items: stretch;
        width: 100%;
    }

    .coupon-left-area {
        min-width: 0;
    }

    .coupon-right-area {
        min-width: 0;
        margin-top: 17px;
        margin-right: 17px;
    }

    .coupon-right-card {
        height: 597px;
        border: 1px solid #dbe3ee;
        background: #fbfcfe;
        display: flex;
        flex-direction: column;
    }

    .coupon-right-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 12px;
        border-bottom: 1px solid #e7edf5;
        background: #f4f7fb;
        color: #374151;
        font-size: 13px;
        font-weight: 600;
    }

    .coupon-right-head strong {
        color: #348fe2;
        margin-left: 3px;
        font-size: 15px;
    }

    .coupon-right-desc {
        padding: 8px 12px;
        border-bottom: 1px solid #edf1f7;
        color: #8b95a1;
        font-size: 12px;
        line-height: 18px;
        background: #fff;
    }

    .keyword-side-control {
        padding: 10px;
        border-bottom: 1px solid #edf1f7;
        background: #fff;
        display: flex;
    }

    .keyword-side-control .keywordPopType {
        width: 50%;
        height: 32px;
    }

    .keyword-side-body {
        flex: 1 1 auto;
        min-height: 0;
        padding: 10px;
        display: flex;
        flex-direction: column;
    }

    .keywordPopTextarea {
        width: 100%;
        flex: 1 1 auto;
        min-height: 0;
        height: 100%;
        resize: none;
        overflow-y: auto;

        line-height: 20px;
        font-size: 13px;
        padding: 10px;
        white-space: pre-wrap;

        border: 1px solid #cfd6df;
        background: #fff;
        color: #2d353c;
    }

    .keywordPopTextarea:focus {
        outline: none;
        border-color: #348fe2;
        box-shadow: 0 0 0 2px rgba(52, 143, 226, .12);
    }

    .keyword-side-footer {
        padding: 8px 10px;
        border-top: 1px solid #edf1f7;
        background: #fff;
        font-size: 12px;
        color: #6b7280;
    }

    .keyword-side-footer strong {
        color: #348fe2;
        font-size: 14px;
    }

    .search-inline-bar {
        display: flex;
        gap: 8px;
        flex-wrap: nowrap;
        align-items: flex-end;
    }

    .search-field {
        display: flex;
        flex-direction: column;
        gap: 4px;
        flex: 0 0 auto;
    }

    .search-label {
        font-size: 12px;
        color: #4b5563;
        font-weight: 600;
    }

    .search-control-group {
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .search-field.search-date {
        flex: 0 0 auto;
    }

    .search-actions {
        flex: 0 0 auto;
        display: flex;
        align-items: flex-end;
    }

    .keyword-guide {
        margin: 8px 0 0;
        font-size: 12px;
        color: #ff0050;
    }

    .coupon-count-bar {
        display: flex;
        align-items: center;
        padding: 4px 12px;
        border: 1px solid #e3e8ef;
        background: #fff;
        flex-direction: row-reverse;
        justify-content: space-between;
    }

    .coupon-count-info {
        font-size: 13px;
    }

    .coupon-count-info strong {
        color: #348fe2;
        font-size: 15px;
        margin: 0 2px;
    }

    .count-divider {
        margin: 0 8px;
        color: #c2c8d0;
    }

    .list {
        height: 550px;
        overflow-y: auto;
    }

    .coupon-list-wrap {
        margin-top: 5px;
    }

    .coupon-list-wrap .panel-body {
        padding-left: 0;
        padding-right: 0;
    }

    .coupon-table-empty {
        text-align: center;
        background-color: #e4e4e4;
        height: 451px;
        vertical-align: middle;
    }

    .date-input-wrap {
        position: relative;
    }

    .date-input-wrap i {
        position: absolute;
        right: 9px;
        top: 50%;
        transform: translateY(-50%);
        color: #8b95a1;
        pointer-events: none;
    }

    .date-input-wrap input {
        padding-right: 28px;
    }

    .date-separator {
        color: #8b95a1;
        font-size: 12px;
    }

    @media (max-width: 1400px) {
        .coupon-main-layout {
            grid-template-columns: minmax(0, 76%) minmax(240px, 24%);
        }

        .search-inline-bar {
            flex-wrap: wrap;
        }
    }

    @media (max-width: 992px) {
        .coupon-main-layout {
            grid-template-columns: 1fr;
        }

        .coupon-right-area {
            margin-top: 0;
        }

        .coupon-right-card {
            height: 300px;
        }
    }
    .table thead tr th {
        vertical-align: baseline;
    }
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle">
                <h4 class="panel-title">쿠폰일괄지급</h4>
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
            <div class="coupon-main-layout">

                <!-- 왼쪽 80% 영역 -->
                <div class="coupon-left-area">
                    <div class="panel-body">
                        <div style="width: 100%;">
                            <form id="couponSearchForm" class="form-coupon-search">
                                <div class="search-box search-box-inline">
                                    <div class="inner-search-box">
                                        <div class="search-inline-bar">
                                            <div class="search-field">
                                                <div class="search-label">지급할 쿠폰</div>
                                                <div class="search-control-group">
                                                    <select class="form-control width-250 selectCoupon">
                                                        <option>쿠폰을 선택해주세요.</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="search-field">
                                                <div class="search-label">이용횟수</div>
                                                <div class="search-control-group">
                                                    <select class="form-control maxMin" name="maxMin">
                                                        <option value="" <c:if test="${searchValue.maxMin == ''  || searchValue.maxMin == null}">selected</c:if>>전체</option>
                                                        <option value="1" <c:if test="${searchValue.maxMin == '1'}">selected</c:if>>이상만 조회</option>
                                                        <option value="2" <c:if test="${searchValue.maxMin == '2'}">selected</c:if>>이하만 조회</option>
                                                        <option value="3" <c:if test="${searchValue.maxMin == '3'}">selected</c:if>>동일만 조회</option>
                                                    </select>

                                                    <input type="text"
                                                           name="useCount"
                                                           class="form-control numberOnly useCount"
                                                           value="${searchValue.useCount == '' || searchValue.useCount == null ? 0 : searchValue.useCount}"
                                                           numberOnly>

                                                    <span class="text-muted" style="font-size:12px;">건</span>
                                                </div>
                                            </div>

                                            <div class="search-field search-date">
                                                <div class="search-label">가입기간</div>
                                                <div class="search-control-group">
                                                    <div class="date-input-wrap">
                                                        <input type="text"
                                                               class="form-control startDate custStartDate background-white"
                                                               name="custStartDate"
                                                               value="${searchValue.startDate}"
                                                               readonly>
                                                        <i class="fas fa-calendar-alt"></i>
                                                    </div>

                                                    <span class="date-separator">~</span>

                                                    <div class="date-input-wrap">
                                                        <input type="text"
                                                               class="form-control endDate custEndDate background-white"
                                                               name="custEndDate"
                                                               value="${searchValue.endDate}"
                                                               readonly>
                                                        <i class="fas fa-calendar-alt"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="search-field search-date">
                                                <div class="search-label"></div>
                                                <div class="search-control-group">
                                                    <div class="coupon-count-bar">
                                                        <div class="coupon-count-info">
                                                            조회 <strong id="searchCustTotalCount">0</strong>명
                                                            <span class="count-divider">|</span>
                                                            선택 <strong id="selectedCustTotalCount">0</strong>명
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   <%-- <div class="d-flex justify-content-between">
                                        <div class="keyword-guide badge-code">
                                            * 휴대폰번호/이름 조회시 오른쪽 검색어 입력 영역에 한 줄에 한 개씩 입력해 주세요.
                                        </div>
                                        <div class="coupon-count-bar">
                                            <div class="coupon-count-info">
                                                조회 <strong id="searchCustTotalCount">0</strong>명
                                                <span class="count-divider">|</span>
                                                선택 <strong id="selectedCustTotalCount">0</strong>명
                                            </div>
                                        </div>
                                    </div>--%>

                                </div>
                            </form>
                        </div>
                        <div class="list coupon-list-wrap">
                            <div class="col-xl-12 ui-sortable">
                                <div class="panel-body">
                                    <div class="row">

                                        <div class="col-xl-6 ui-sortable">
                                            <div class="card">
                                                <div class="card-bod">
                                                    <div class="panel-body ">
                                                        <table id="searchCustTable"
                                                               class="display table table-bordered w-100 table-striped cust-list">
                                                            <thead>
                                                            <tr>
                                                                <th class="text-center" style="width: 50px;">회원번호</th>
                                                                <th class="text-center" style="width: 150px;">
                                                                    <spring:message code="list.word.no1" text="이름"/>
                                                                </th>
                                                                <th class="text-center" style="width: 150px;">
                                                                    <spring:message code="list.word.no1" text="연락처"/>
                                                                </th>
                                                                <th class="text-center" style="width: 70px;"> <input type="button" class="btn btn-info" id="couponAllRightBtn" value="일괄선택"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="cust-none-select">
                                                            <tr>
                                                                <td colspan="4" class="coupon-table-empty">
                                                                    검색된 데이터가 없습니다.
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xl-6 ui-sortable">
                                            <div class="card">
                                                <div class="card-bod">
                                                    <div class="panel-body ">
                                                        <table id="testTable"
                                                               class="display table table-bordered w-100 table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th class="text-center" style="width: 50px;">
                                                                    <spring:message code="list.word.no1" text="번호"/>
                                                                </th>
                                                                <th class="text-center" style="width: 150px;">
                                                                    <spring:message code="list.word.no1" text="이름"/>
                                                                </th>
                                                                <th class="text-center">
                                                                    <spring:message code="list.word.no1" text="쿠폰이 지급될 리스트"/>
                                                                </th>
                                                                <th class="text-center" style="width: 70px;"> <input type="button" class="btn btn-danger" id="couponAllLeftBtn" value="일괄해제"></th>
                                                            </tr>
                                                            </thead>
                                                        </table>
                                                    </div>

                                                    <div class="list m-t-0" style="background-color: #e4e4e4; height: 451px;">
                                                        <ul class="attachList p-0">
                                                            <li class="p-0">
                                                                <div class="panel-body">
                                                                    <table class="display table w-100 table-striped cust-list">
                                                                        <tbody id="cust-select">
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- 오른쪽 20% 검색어 입력 영역 -->
                <div class="coupon-right-area">
                    <div class="coupon-right-card">
                        <div class="coupon-right-head">
                            <div>
                                검색어 입력
                                <strong class="keywordPreviewTotal">0</strong>건
                            </div>
                        </div>

                        <div class="coupon-right-desc">
                            엑셀에서 복사한 이름 또는 휴대폰번호를 한 줄에 한 개씩 붙여넣어 주세요.
                        </div>

                        <div class="keyword-side-control">
                            <select class="form-control keywordPopType"
                                    name="keywordPopType"
                                    form="couponSearchForm">
                                <option value="custName" <c:if test="${searchValue.keywordPopType == 'custName'}">selected</c:if>>이름</option>
                                <option value="custTel" <c:if test="${searchValue.keywordPopType == 'custTel'}">selected</c:if>>전화번호</option>
                            </select>
                            <div class="search-actions">
                                <button type="button"
                                        class="btn btn-search-inline searchCustCouponList">
                                    <i class="fa fa-search"></i>
                                    검색
                                </button>
                            </div>
                        </div>

                        <div class="keyword-side-body">
                            <textarea
                                    class="form-control keywordPopTextarea"
                                    name="keywordPop"
                                    form="couponSearchForm"
                                    maxlength="5000"
                                    placeholder="예)
01012345678
01098765432
">${searchValue.keywordPop}</textarea>
                        </div>

                        <div class="keyword-side-footer">
                            입력 <strong class="keywordPreviewTotal">0</strong>건
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal-footer">
            <button type="button"
                    data-toggle="modal"
                    data-target="#select_push_template"
                    class="btn btn-info couponAlarmOpenBtn"
                    style="width: 115px; cursor: pointer;"
                    data-cpn-no=""
                    data-coupon-title="">
                    <span class="fa fa-plus">
                        &nbsp;지급알림발송
                    </span>
            </button>

            <button type="button"
                    class="btn btn-info btn_remove float-right m-l-5 cpnAllBtn">
                <i class="fa fa-plus-circle m-r-3"></i>
                <spring:message code="list.detail.delete" text="쿠폰일괄지급"/>
            </button>

            <button type="button"
                    class="btn btn-grey float-right storeModalCloseBtn"
                    data-dismiss="modal">
                닫기
            </button>
        </div>
    </div>
</div>

<script>
</script>
