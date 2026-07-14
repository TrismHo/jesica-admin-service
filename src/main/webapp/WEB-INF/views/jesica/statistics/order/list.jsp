<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <%@include file="../../../common/include_head.jsp" %>

    <c:choose>
        <c:when test="${sessionScope.sessionKey.company == 'jesicar'}">
            <title>Jesicar | 주문통계</title>
        </c:when>

        <c:when test="${sessionScope.sessionKey.company == 'yangpa'}">
            <title>온동네 | 주문통계</title>
        </c:when>

        <c:otherwise>
            <title>주문통계</title>
        </c:otherwise>
    </c:choose>

    <style>
        .buttons-csv,
        .buttons-copy,
        .buttons-excel,
        .buttons-print {
            color: #fff;
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .buttons-csv:hover,
        .buttons-copy:hover,
        .buttons-excel:hover,
        .buttons-print:hover {
            color: #ddd;
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
            display: block;
        }

        .dataTables_wrapper.dt-bootstrap4
        .dataTables_filter label .form-control {
            width: 150px;
            height: 23px;
            border: 1px solid #ddd;
        }

        .search-field-period {
            align-self: stretch;
        }

        .search-control-group-period {
            display: block;
            width: 100%;
        }

        .period-ui {
            display: flex;
            justify-content: space-between;
            gap: 12px;
            width: 100%;
        }

        .period-ui__dates {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .period-ui__actions {
            display: flex;
            align-items: center;
            gap: 8px 12px;
            flex-wrap: wrap;
        }

        .period-ui__quick,
        .period-ui__step {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }

        .date-field {
            position: relative;
            display: inline-flex;
            align-items: center;
        }

        .date-field .form-control {
            width: 140px;
            height: 32px;
            padding-right: 28px;
            font-size: 12px;
        }

        .date-field i {
            position: absolute;
            right: 9px;
            color: #98a1ab;
            font-size: 12px;
            pointer-events: none;
        }

        .date-tilde {
            color: #98a1ab;
            font-weight: 700;
        }

        .period-btns .btn,
        .period-ui__step .btn {
            white-space: nowrap;
        }

        /*
         * 주문통계 File Manager 스타일
         */
        .order-stat-manager {
            width: 100%;
            min-height: 620px;
            border: 1px solid #d9dee5;
            background: #fff;
        }

        .order-stat-content {
            width: 100%;
            min-width: 0;
            background: #fff;
        }

        /*
         * 상단 유형 선택 툴바
         */
        .order-stat-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 62px;
            padding: 10px 14px;
            border-bottom: 1px solid #d9dee5;
            background: #fff;
        }

        .order-stat-toolbar-left {
            display: flex;
            min-width: 0;
            flex: 1;
            align-items: center;
        }

        .order-stat-toolbar-right {
            display: flex;
            flex: 0 0 auto;
            align-items: center;
            gap: 12px;
        }

        .order-stat-type-buttons {
            display: flex;
            min-width: 0;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .order-stat-type-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            min-height: 36px;
            padding: 0 11px;
            border: 1px solid #cfd5dc;
            background: #fff;
            color: #59636e;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition:
                    border-color .15s ease,
                    background-color .15s ease,
                    color .15s ease,
                    box-shadow .15s ease;
        }

        .order-stat-type-btn:hover {
            border-color: #348fe2;
            color: #348fe2;
        }

        .order-stat-type-btn.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
            box-shadow: 0 2px 5px rgba(52, 143, 226, .2);
        }

        .order-stat-type-btn i {
            font-size: 12px;
        }

        .order-stat-type-btn strong {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 27px;
            height: 20px;
            padding: 0 6px;
            border-radius: 10px;
            background: #eef1f4;
            color: #52606d;
            font-size: 10px;
            font-weight: 700;
            font-variant-numeric: tabular-nums;
        }

        .order-stat-type-btn.active strong {
            background: rgba(255, 255, 255, .2);
            color: #fff;
        }

        .order-stat-toolbar-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            min-height: 36px;
            padding: 0 12px;
            border: 1px solid #cfd5dc;
            border-radius: 4px;
            background: #fff;
            color: #2d353c;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
        }

        .order-stat-toolbar-btn:hover {
            border-color: #348fe2;
            color: #348fe2;
        }

        .order-stat-toolbar-btn.loading i {
            animation: order-stat-spin .8s linear infinite;
        }

        @keyframes order-stat-spin {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        .order-stat-current-total {
            color: #67717b;
            font-size: 11px;
            white-space: nowrap;
        }

        .order-stat-current-total strong {
            margin: 0 3px;
            color: #348fe2;
            font-size: 14px;
        }

        /*
         * 선택 유형 정보
         */
        .order-stat-sub-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 44px;
            padding: 6px 15px;
            border-bottom: 1px solid #e5e7eb;
            background: #f8fafc;
        }

        .order-stat-path {
            display: flex;
            align-items: center;
            gap: 7px;
            color: #8a939d;
            font-size: 11px;
        }

        .order-stat-path strong {
            color: #2d353c;
        }

        .order-stat-selected-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .order-stat-date-range {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #67717b;
            font-size: 10px;
            white-space: nowrap;
        }

        .order-stat-date-range i {
            color: #348fe2;
        }

        .order-stat-rate-info {
            color: #8a939d;
            font-size: 10px;
            white-space: nowrap;
        }

        .order-stat-rate-info strong {
            margin-left: 3px;
            color: #2d353c;
        }

        .order-stat-progress {
            width: 90px;
            height: 5px;
            overflow: hidden;
            border-radius: 5px;
            background: #e5e9ed;
        }

        .order-stat-progress-bar {
            width: 100%;
            height: 100%;
            border-radius: 5px;
            background: #348fe2;
            transition: width .2s ease;
        }

        /*
         * 주문 통계 테이블
         */
        .order-stat-table-wrap {
            width: 100%;
            min-height: 470px;
            overflow-x: auto;
        }

        .order-stat-table {
            width: 100% !important;
            min-width: 850px;
            margin: 0 !important;
            border-collapse: collapse;
            table-layout: fixed;
        }


        .order-stat-table th,
        .order-stat-table td {
            padding: 0px 13px !important;
            border-top: 0 !important;
            border-right: 0 !important;
            border-bottom: 1px solid #e4e7ea !important;
            border-left: 0 !important;
            color: #2d353c;
            font-size: 13px;
            vertical-align: middle;
        }

        .order-stat-table th {
            height: 42px;
            background: #fff;
            color: #67717b;
            font-weight: 700;
            white-space: nowrap;
        }

        .order-stat-table tbody tr {
            transition: background-color .15s ease;
        }

        .order-stat-table tbody td {
            background: #fff;
        }

        .order-stat-table tbody tr:hover td {
            background: #f7f9fb;
        }

        .order-stat-table tbody tr.stat-highlight-row td {
            background: #eef6ff !important;
        }

        .order-stat-table tbody tr.stat-highlight-row:hover td {
            background: #e5f1ff !important;
        }

        .order-stat-table tbody tr.stat-highlight-row
        .order-stat-date-icon {
            background: #348fe2;
            color: #fff;
        }

        .order-stat-table tbody tr.stat-highlight-row
        .order-stat-number.total {
            color: #1769aa;
        }

        .order-stat-date-cell {
            display: flex;
            align-items: center;
            gap: 9px;
            font-weight: 600;
        }

        .order-stat-date-icon {
            display: flex;
            flex: 0 0 30px;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 4px;
            background: #eef6ff;
            color: #348fe2;
        }

        .order-stat-number {
            font-weight: 600;
            font-variant-numeric: tabular-nums;
        }

        .order-stat-number.total {
            color: #2d353c;
            font-weight: 700;
        }

        .order-stat-number.zero {
            color: #adb5bd;
            font-weight: 400;
        }

        .order-stat-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 45px;
            padding: 0 15px;
            border-top: 1px solid #d9dee5;
            background: #f8fafc;
            color: #67717b;
            font-size: 11px;
        }

        /*
         * DataTables 기본 UI 숨김
         */
        #testTable_wrapper .dataTables_length,
        #testTable_wrapper .dataTables_filter,
        #testTable_wrapper .dataTables_info,
        #testTable_wrapper .dataTables_paginate {
            display: none !important;
        }

        #testTable_wrapper {
            width: 100%;
        }

        /*
         * 그래프
         */
        .chart-wrap {
            position: relative;
            width: 100%;
            min-height: 430px;
        }

        #line-chart {
            display: block;
            width: 100% !important;
            height: 430px !important;
        }

        .nav.nav-tabs + .tab-content {
            padding: 0;
            margin-bottom: 20px;
            border: 0;
            border-radius: 0 0 4px 4px;
            background: #fff;
        }

        @media (max-width: 1200px) {
            .search-field-period {
                min-width: 100% !important;
            }

            .period-ui {
                align-items: flex-start;
                flex-direction: column;
            }
        }

        @media (max-width: 1100px) {
            .order-stat-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .order-stat-toolbar-right {
                width: 100%;
                justify-content: flex-end;
            }
        }

        @media (max-width: 768px) {
            .date-field .form-control {
                width: 120px;
            }

            .period-ui__actions {
                align-items: flex-start;
                flex-direction: column;
            }

            .order-stat-type-buttons {
                display: grid;
                width: 100%;
                grid-template-columns:
                        repeat(2, minmax(0, 1fr));
            }

            .order-stat-type-btn {
                width: 100%;
                justify-content: flex-start;
            }

            .order-stat-type-btn strong {
                margin-left: auto;
            }

            .order-stat-sub-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .order-stat-selected-info {
                width: 100%;
                flex-wrap: wrap;
            }

            .order-stat-progress {
                min-width: 100px;
                flex: 1;
            }

            .chart-wrap {
                min-height: 340px;
            }

            #line-chart {
                height: 340px !important;
            }
        }

        @media (max-width: 480px) {
            .order-stat-type-buttons {
                grid-template-columns: 1fr;
            }
        }

        .order-stat-excel-area {
            display: flex;
            align-items: center;
        }

        .order-stat-excel-area .dt-buttons {
            display: flex;
            align-items: center;
            margin: 0 !important;
        }

        .order-stat-excel-area .dt-button,
        .order-stat-excel-area .buttons-excel,
        .order-stat-excel-area .buttons-excel-html5 {
            display: inline-flex !important;
            align-items: center;
            justify-content: center;
            gap: 6px;
            min-height: 36px;
            margin: 0 !important;
            padding: 0 12px !important;
            border: 1px solid #d3d6d9 !important;
            border-radius: 4px !important;
            background: #fff !important;
            color: #59636e;
            font-size: 11px !important;
            font-weight: 600 !important;
            line-height: 1 !important;
            box-shadow: none !important;
        }

        .order-stat-excel-area .dt-button:hover,
        .order-stat-excel-area .buttons-excel:hover,
        .order-stat-excel-area .buttons-excel-html5:hover {
            border-color: #188244 !important;
            background: #188244 !important;
            color: #fff !important;
        }

        .order-stat-excel-area .dt-button:focus,
        .order-stat-excel-area .buttons-excel:focus,
        .order-stat-excel-area .buttons-excel-html5:focus {
            outline: 0 !important;
            box-shadow: 0 0 0 2px rgba(31, 157, 85, .18) !important;
        }

        .order-stat-excel-area .dt-button::before,
        .order-stat-excel-area .buttons-excel::before,
        .order-stat-excel-area .buttons-excel-html5::before {
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            content: "\f1c3";
        }

        .order-stat-excel-area .dt-buttons > button + button {
            margin-left: 6px !important;
        }

        /*
         * DataTables가 기본 위치에 생성하는 버튼 영역 때문에
         * 상단 레이아웃이 밀리지 않도록 정리
         */
        #testTable_wrapper > .dt-buttons {
            display: none;
        }

        #testTable_wrapper .row:first-child {
            margin: 0 !important;
        }

        #testTable_wrapper .row:first-child > div {
            padding: 0 !important;
        }

        @media (max-width: 768px) {
            .order-stat-toolbar-right {
                width: 100%;
                flex-wrap: wrap;
            }

            .order-stat-excel-area {
                order: 1;
            }

            #orderStatReloadBtn {
                order: 2;
            }

            .order-stat-current-total {
                order: 3;
                margin-left: auto;
            }
        }

        .order-stat-view-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            min-height: 32px;
            padding: 0 12px;
            border-right: 1px solid #cfd5dc;
            background: #fff;
            color: #59636e;
            font-size: 11px;
            font-weight: 600;
            line-height: 1;
            text-decoration: none !important;
            white-space: nowrap;
            transition: background-color .15s ease, color .15s ease;
        }

        .order-stat-view-btn:last-child {
            border-right: 0;
        }

        .order-stat-view-btn:hover {
            background: #f2f6fa;
            color: #348fe2;
        }

        .order-stat-view-btn.active {
            background: #348fe2;
            color: #fff;
        }

        .order-stat-view-btn i {
            font-size: 11px;
        }

        .panel-body > .tab-content {
            padding: 0;
            margin: 0;
            border: 0;
            background: transparent;
        }

        .panel-body > .tab-content > .tab-pane {
            padding: 0;
        }


        @media (max-width: 768px) {

            .order-stat-view-btn {
                flex: 1;
            }

            .order-stat-search-actions #searchBtn {
                flex: 0 0 auto;
            }
        }


        .search-inline-bar > .search-field,
        .search-inline-bar > .search-actions {
            min-width: 0;
            margin: 0 !important;
        }


        .date-field .form-control {
            width: 112px;
        }

        .period-btns .btn,
        .period-ui__step .btn {
            padding-right: 7px;
            padding-left: 7px;
            font-size: 10px;
        }

        .order-stat-view-btn {
            padding-right: 9px;
            padding-left: 9px;
        }

        @media (max-width: 1280px) {

            .date-field .form-control {
                width: 100px;
            }

            .period-btns .btn,
            .period-ui__step .btn {
                padding-right: 5px;
                padding-left: 5px;
                font-size: 9px;
            }

            .order-stat-view-btn {
                gap: 4px;
                padding-right: 7px;
                padding-left: 7px;
            }
        }


        .order-search-box {
            padding: 14px 16px;
            margin: 29px 14px 14px;
            /* border: 1px solid #e5e9ed; */
            /* border-bottom: 1px solid #d9dee5; */
            background: #f3f4f5;
        }

        .order-search-row {
            display: grid;
            grid-template-columns: 140px 105px 105px minmax(560px, 1fr) auto;
            align-items: end;
            gap: 10px;
            width: 100%;
        }

        .order-search-item {
            min-width: 0;
        }

        .order-search-label {
            display: block;
            margin-bottom: 6px;
            color: #59636e;
            font-size: 11px;
            font-weight: 700;
            line-height: 1;
        }

        .order-search-item .form-control,
        .order-search-select {
            width: 100%;
            height: 34px;
            padding: 5px 10px;
            border: 1px solid #d3d8de;
            background-color: #fff;
            color: #2d353c;
            font-size: 11px;
            line-height: 22px;
            outline: none;
            box-shadow: none;
        }

        .order-search-select {
            cursor: pointer;
            appearance: auto;
            -webkit-appearance: menulist;
            -moz-appearance: menulist;
        }

        .order-search-select:focus {
            border-color: #348fe2;
            box-shadow: 0 0 0 2px rgba(52, 143, 226, .12);
        }

        .order-search-period {
            display: flex;
            align-items: center;
            gap: 8px;
            min-width: 0;
        }

        .order-search-dates {
            display: flex;
            flex: 0 0 auto;
            align-items: center;
            gap: 5px;
        }

        .order-search-date {
            position: relative;
            width: 108px;
        }

        .order-search-date .form-control {
            padding-right: 28px;
        }

        .order-search-date i {
            position: absolute;
            top: 50%;
            right: 9px;
            color: #98a1ab;
            font-size: 11px;
            pointer-events: none;
            transform: translateY(-50%);
        }

        .order-search-date-divider {
            color: #98a1ab;
            font-size: 11px;
            font-weight: 700;
        }

        .order-search-period-buttons {
            display: flex;
            min-width: 0;
            align-items: center;
            gap: 6px;
        }

        .order-search-period-buttons .btn-group {
            display: inline-flex;
            flex-wrap: nowrap;
        }

        .order-search-period-buttons .btn {
            min-width: 38px;
            height: 34px;
            padding: 0 7px;
            border-color: #d3d8de;
            font-size: 10px;
            line-height: 32px;
            white-space: nowrap;
        }

        .order-search-period-buttons .btn.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
            box-shadow: none;
        }

        .order-search-actions {
            display: flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap;
        }

        .order-search-view-buttons {
            display: inline-flex;
            overflow: hidden;
            height: 34px;
            border: 1px solid #cfd5dc;
            border-radius: 4px;
            background: #fff;
        }

        .order-search-view-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            height: 32px;
            padding: 0 10px;
            border-right: 1px solid #cfd5dc;
            background: #fff;
            color: #59636e;
            font-size: 10px;
            font-weight: 700;
            text-decoration: none !important;
        }

        .order-search-view-btn:last-child {
            border-right: 0;
        }

        .order-search-view-btn:hover {
            background: #f2f6fa;
            color: #348fe2;
        }

        .order-search-view-btn.active {
            background: #348fe2;
            color: #fff;
        }

        .order-search-submit {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            min-width: 68px;
            height: 34px;
            padding: 0 13px;
            border: 1px solid #348fe2;
            border-radius: 4px;
            background: #348fe2;
            color: #fff;
            font-size: 11px;
            font-weight: 700;
        }

        .order-search-submit:hover,
        .order-search-submit:focus {
            border-color: #2a72b5;
            background: #2a72b5;
            color: #fff;
        }

        @media (max-width: 1450px) {
            .order-search-row {
                grid-template-columns: 120px 90px 90px minmax(500px, 1fr) auto;
                gap: 7px;
            }

            .order-search-date {
                width: 96px;
            }

            .order-search-period-buttons .btn {
                min-width: 34px;
                padding: 0 5px;
                font-size: 9px;
            }

            .order-search-view-btn {
                padding: 0 7px;
            }
        }

        @media (max-width: 1180px) {
            .order-search-row {
                grid-template-columns: repeat(3, minmax(100px, 1fr));
            }

            .order-search-item-period,
            .order-search-actions {
                grid-column: 1 / -1;
            }

            .order-search-actions {
                justify-content: flex-end;
            }
        }

        @media (max-width: 768px) {
            .order-search-row {
                display: flex;
                align-items: stretch;
                flex-direction: column;
            }

            .order-search-period {
                align-items: stretch;
                flex-direction: column;
            }

            .order-search-period-buttons,
            .order-search-period-buttons .btn-group,
            .order-search-actions,
            .order-search-view-buttons {
                width: 100%;
            }

            .order-search-period-buttons {
                flex-direction: column;
            }

            .order-search-period-buttons .btn,
            .order-search-view-btn,
            .order-search-submit {
                flex: 1;
            }

            .order-search-date {
                flex: 1;
                width: auto;
            }
        }

        /*
         * 주문통계 그래프 관리자형 스타일
         */
        .order-chart-manager {
            width: 100%;
            min-height: 620px;
            border: 1px solid #d9dee5;
            background: #fff;
        }

        .order-chart-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 62px;
            padding: 10px 14px;
            border-bottom: 1px solid #d9dee5;
            background: #fff;
        }

        .order-chart-toolbar-left {
            display: flex;
            min-width: 0;
            flex: 1;
            align-items: center;
        }

        .order-chart-toolbar-right {
            display: flex;
            flex: 0 0 auto;
            align-items: center;
            gap: 12px;
        }

        .order-chart-type-buttons {
            display: flex;
            min-width: 0;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .order-chart-type-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            min-height: 36px;
            padding: 0 11px;
            border: 1px solid #cfd5dc;
            background: #fff;
            color: #59636e;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition:
                    border-color .15s ease,
                    background-color .15s ease,
                    color .15s ease,
                    box-shadow .15s ease;
        }

        .order-chart-type-btn:hover {
            border-color: #348fe2;
            color: #348fe2;
        }

        .order-chart-type-btn.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
            box-shadow: 0 2px 5px rgba(52, 143, 226, .2);
        }

        .order-chart-sub-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 44px;
            padding: 6px 15px;
            border-bottom: 1px solid #e5e7eb;
            background: #f8fafc;
        }

        .order-chart-content {
            padding: 12px;
            background: #f5f7f9;
        }

        .order-chart-box {
            overflow: hidden;
            border: 1px solid #d9dee5;
            background: #fff;
        }

        .order-chart-head {
            min-height: 54px;
            padding: 9px 12px;
            border-bottom: 1px solid #e5e7eb;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }

        .order-chart-title {
            color: #2d353c;
            font-size: 13px;
            font-weight: 700;
            line-height: 1.25;
        }

        .order-chart-desc {
            margin-top: 3px;
            color: #8a939d;
            font-size: 10px;
            line-height: 1.25;
        }

        .order-chart-head-meta {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            min-height: 24px;
            padding: 0 8px;
            border-radius: 12px;
            background: #eef6ff;
            color: #348fe2;
            font-size: 10px;
            font-weight: 700;
            white-space: nowrap;
        }

        .order-chart-body {
            position: relative;
            height: 440px;
            padding: 14px;
            background: #fff;
            box-sizing: border-box;
        }

        .order-chart-body canvas {
            display: block;
            width: 100% !important;
            height: 100% !important;
        }

        @media (max-width: 900px) {
            .order-chart-toolbar,
            .order-chart-sub-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .order-chart-toolbar-right,
            .order-chart-type-buttons,
            .order-stat-selected-info {
                width: 100%;
                flex-wrap: wrap;
            }

            .order-chart-type-btn {
                flex: 1;
                justify-content: center;
            }

            .order-chart-body {
                height: 340px;
            }
        }

    </style>
</head>

<body>
<div id="page-loader" class="fade show">
    <span class="spinner"></span>
</div>

<div id="page-container"
     class="fade page-sidebar-fixed page-header-fixed">

    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <%@include file="../../../common/include_sidebar.jsp" %>

    <div id="content" class="content p-0">
        <div class="panel panel-inverse m-t-1">

            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item">
                        <a href="javascript:;">
                            <spring:message
                                    code="side.main4"
                                    text="통계"/>
                        </a>
                    </li>

                    <li class="breadcrumb-item active">
                        <spring:message
                                code="side.main4.sub1"
                                text="주문통계"/>
                    </li>
                </ol>

                <h3 class="rix-title">주문통계</h3>
            </div>

            <!-- 검색 영역 -->
            <form name="frmSearch"
                  id="frmSearch"
                  class="formUserList">

                <c:choose>
                    <c:when test="${sessionScope.sessionKey.company == 'jesicar'}">
                        <input type="hidden"
                               name="platformType"
                               value="1">
                    </c:when>

                    <c:when test="${sessionScope.sessionKey.company == 'yangpa'}">
                        <input type="hidden"
                               name="platformType"
                               value="2">
                    </c:when>

                    <c:otherwise>
                        <input type="hidden"
                               name="platformType"
                               value="${searchValue.platformType}">
                    </c:otherwise>
                </c:choose>

                <input type="hidden"
                       class="selday"
                       name="selday"
                       value="${empty searchValue.selday ? '30' : searchValue.selday}">

                <input type="hidden"
                       class="dayType"
                       name="dayType"
                       value="${empty searchValue.dayType ? '2' : searchValue.dayType}">

                <div class="order-search-box">
                    <div class="order-search-row">

                        <!-- 앱코드 -->
                        <div class="order-search-item">
                            <label class="order-search-label"
                                   for="brandTypeCd">
                                앱코드
                            </label>

                            <c:choose>
                                <c:when test="${empty appCode}">
                                    <select id="brandTypeCd"
                                            name="brandTypeCd"
                                            class="order-search-select">

                                        <option value=""
                                                <c:if test="${empty searchValue.brandTypeCd}">
                                                    selected
                                                </c:if>>
                                            전체
                                        </option>

                                        <c:forEach var="appCodeItem"
                                                   items="${appVersionList}">
                                            <option value="${appCodeItem.codeValue}"
                                                    <c:if test="${searchValue.brandTypeCd == appCodeItem.codeValue || searchValue.appCode == appCodeItem.sysCode}">
                                                        selected
                                                    </c:if>>
                                                    ${appCodeItem.codeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="appCodeItem"
                                               items="${appVersionList}">
                                        <c:if test="${appCode == appCodeItem.sysCode}">
                                            <input type="hidden"
                                                   id="brandTypeCd"
                                                   name="brandTypeCd"
                                                   value="${appCodeItem.codeValue}">

                                            <input type="text"
                                                   class="form-control"
                                                   value="${appCodeItem.codeName}"
                                                   disabled>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- 완료/취소 -->
                        <div class="order-search-item">
                            <label class="order-search-label"
                                   for="ordStatus">
                                완료/취소
                            </label>
                            <select id="ordStatus"
                                    name="ordStatus"
                                    class="order-search-select">
                                <option value=""
                                        <c:if test="${empty searchValue.ordStatus}">
                                            selected
                                        </c:if>>
                                    전체
                                </option>

                                <option value="5"
                                        <c:if test="${'5' == searchValue.ordStatus}">
                                            selected
                                        </c:if>>
                                    완료
                                </option>

                                <option value="13"
                                        <c:if test="${'13' == searchValue.ordStatus}">
                                            selected
                                        </c:if>>
                                    취소
                                </option>
                            </select>
                        </div>

                        <!-- 주문타입 -->
                        <div class="order-search-item">
                            <label class="order-search-label"
                                   for="ordType">
                                주문타입
                            </label>

                            <select id="ordType"
                                    name="ordType"
                                    class="order-search-select">
                                <option value=""
                                        <c:if test="${empty searchValue.ordType}">
                                            selected
                                        </c:if>>
                                    전체
                                </option>

                                <option value="1"
                                        <c:if test="${'1' == searchValue.ordType}">
                                            selected
                                        </c:if>>
                                    배달
                                </option>

                                <option value="2"
                                        <c:if test="${'2' == searchValue.ordType}">
                                            selected
                                        </c:if>>
                                    포장
                                </option>

                                <option value="6"
                                        <c:if test="${'6' == searchValue.ordType}">
                                            selected
                                        </c:if>>
                                    직거래
                                </option>
                            </select>
                        </div>

                        <!-- 기간 -->
                        <div class="order-search-item order-search-item-period">
                <span class="order-search-label">
                    기간
                </span>

                            <div class="order-search-period">
                                <div class="order-search-dates">
                                    <div class="order-search-date">
                                        <input type="text"
                                               class="form-control startDate background-white"
                                               name="startDate"
                                               value="${searchValue.startDate}"
                                               readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>

                                    <span class="order-search-date-divider">~</span>

                                    <div class="order-search-date">
                                        <input type="text"
                                               class="form-control endDate background-white"
                                               name="endDate"
                                               value="${searchValue.endDate}"
                                               readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                </div>

                                <div class="order-search-period-buttons">
                                    <div class="btn-group"
                                         role="group"
                                         aria-label="최근 기간">
                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '30' || empty searchValue.selday}">active</c:if>"
                                                data-day="30">
                                            최근 1개월
                                        </button>

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '180'}">active</c:if>"
                                                data-day="180">
                                            최근 6개월
                                        </button>

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '360'}">active</c:if>"
                                                data-day="360">
                                            최근 1년
                                        </button>

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '720'}">active</c:if>"
                                                data-day="720">
                                            최근 2년
                                        </button>
                                    </div>

                                    <div class="btn-group"
                                         role="group"
                                         aria-label="조회 단위">
                                        <button type="button"
                                                class="btn btn-white step-day <c:if test="${searchValue.dayType != '1'}">active</c:if>"
                                                data-day-type="2">
                                            1일
                                        </button>

                                        <button type="button"
                                                class="btn btn-white step-day <c:if test="${searchValue.dayType == '1'}">active</c:if>"
                                                data-day-type="1">
                                            7일
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 화면 전환 및 검색 -->
                        <div class="order-search-actions">
                            <div class="order-search-view-buttons"
                                 role="tablist"
                                 aria-label="통계 화면 선택">
                                <a href="#default-tab-1"
                                   data-toggle="tab"
                                   class="order-search-view-btn order-stat-view-btn active"
                                   role="tab">
                                    <i class="fa fa-list"></i>
                                    <span>기본정보</span>
                                </a>

                                <a href="#default-tab-2"
                                   data-toggle="tab"
                                   class="order-search-view-btn order-stat-view-btn"
                                   role="tab">
                                    <i class="fa fa-chart-line"></i>
                                    <span>통계그래프</span>
                                </a>
                            </div>

                            <button type="button"
                                    id="searchBtn"
                                    class="order-search-submit searchClick">
                                <i class="fa fa-search"></i>
                                <spring:message code="merchandise.searchbutton"
                                                text="검색"/>
                            </button>
                        </div>
                    </div>
                </div>
            </form>

            <div class="panel-body">

                <div class="tab-content">

                    <!-- 기본정보 -->
                    <div class="tab-pane fade active show"
                         id="default-tab-1">

                        <div class="order-stat-manager">

                            <section class="order-stat-content">

                                <!-- 주문 유형 버튼 -->
                                <div class="order-stat-toolbar">

                                    <div class="order-stat-toolbar-left">

                                        <div class="order-stat-type-buttons">

                                            <button type="button"
                                                    class="order-stat-type-btn active"
                                                    data-stat-type="totalCnt">

                                                <i class="fa fa-shopping-cart"></i>

                                                <span>전체 주문</span>

                                                <strong id="summaryTotalCnt">
                                                    0
                                                </strong>
                                            </button>

                                            <button type="button"
                                                    class="order-stat-type-btn"
                                                    data-stat-type="delivery">

                                                <i class="fa fa-motorcycle"></i>

                                                <span>배달</span>

                                                <strong id="summaryDeliveryCnt">
                                                    0
                                                </strong>
                                            </button>

                                            <button type="button"
                                                    class="order-stat-type-btn"
                                                    data-stat-type="takeout">

                                                <i class="fa fa-store"></i>

                                                <span>포장</span>

                                                <strong id="summaryTakeoutCnt">
                                                    0
                                                </strong>
                                            </button>

                                            <button type="button"
                                                    class="order-stat-type-btn"
                                                    data-stat-type="parcel">

                                                <i class="fa fa-box"></i>

                                                <span>직거래</span>

                                                <strong id="summaryParcelCnt">
                                                    0
                                                </strong>
                                            </button>

                                            <%-- <button type="button"
                                                     class="order-stat-type-btn"
                                                     data-stat-type="todayDelivery">

                                                 <i class="fa fa-shipping-fast"></i>

                                                 <span>오늘배송</span>

                                                 <strong id="summaryTodayDeliveryCnt">
                                                     0
                                                 </strong>
                                             </button>--%>
                                        </div>

                                    </div>

                                    <div class="order-stat-toolbar-right">

                                        <div id="orderStatExcelArea"
                                             class="order-stat-excel-area">
                                        </div>

                                        <button type="button"
                                                id="orderStatReloadBtn"
                                                class="order-stat-toolbar-btn">

                                            <i class="fa fa-sync"></i>
                                        </button>

                                        <div class="order-stat-current-total">
                                            조회 결과

                                            <strong id="orderStatTotalRowCount">
                                                0
                                            </strong>

                                            건
                                        </div>
                                    </div>
                                </div>

                                <!-- 현재 선택 정보 -->
                                <div class="order-stat-sub-toolbar">

                                    <div class="order-stat-path">
                                        <i class="fa fa-home"></i>

                                        <span>주문통계</span>

                                        <i class="fa fa-angle-right"></i>

                                        <strong id="currentStatTypeName">
                                            전체 주문
                                        </strong>
                                    </div>

                                    <div class="order-stat-selected-info">

                                        <div class="order-stat-date-range">
                                            <i class="fa fa-calendar-alt"></i>

                                            <span id="summaryStartDate">-</span>

                                            <span>~</span>

                                            <span id="summaryEndDate">-</span>
                                        </div>

                                        <div class="order-stat-rate-info">
                                            전체 대비

                                            <strong id="summarySelectedRate">
                                                100%
                                            </strong>
                                        </div>

                                        <div class="order-stat-progress">
                                            <div class="order-stat-progress-bar"
                                                 id="summaryProgressBar">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 테이블 -->
                                <div class="order-stat-table-wrap">

                                    <table id="testTable"
                                           class="order-stat-table">
                                        <%--
                                                                                <colgroup>
                                                                                    <col style="width:145px;">
                                                                                    <col style="width:90px;">
                                                                                    <col style="width:125px;">
                                                                                    <col style="width:115px;">
                                                                                    <col style="width:115px;">
                                                                                    <col style="width:115px;">
                                                                                    <col style="width:115px;">
                                                                                </colgroup>--%>

                                        <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th class="text-center">요일</th>
                                            <th class="text-center">총 주문량</th>
                                            <th class="text-center">배달</th>
                                            <th class="text-center">포장</th>
                                            <th class="text-center">직거래</th>
                                            <%-- <th class="text-center">오늘배송</th>--%>
                                        </tr>
                                        </thead>

                                        <tbody id="restaurantBody"></tbody>
                                    </table>
                                </div>

                                <div class="order-stat-footer">
                                    <div>
                                        <i class="fa fa-info-circle m-r-5"></i>
                                        날짜별 주문 통계입니다.
                                    </div>

                                    <div id="orderStatUnitText">
                                        1일 단위
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <!-- 통계 그래프 -->
                    <div class="tab-pane fade"
                         id="default-tab-2">

                        <div class="order-chart-manager">

                            <div class="order-chart-toolbar">
                                <div class="order-chart-toolbar-left">
                                    <div class="order-chart-type-buttons">

                                        <button type="button"
                                                class="order-chart-type-btn active"
                                                data-chart-type="all">
                                            <i class="fa fa-chart-line"></i>
                                            <span>전체 그래프</span>
                                        </button>

                                        <button type="button"
                                                class="order-chart-type-btn"
                                                data-chart-type="totalCnt">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>전체 주문</span>
                                        </button>

                                        <button type="button"
                                                class="order-chart-type-btn"
                                                data-chart-type="delivery">
                                            <i class="fa fa-motorcycle"></i>
                                            <span>배달</span>
                                        </button>

                                        <button type="button"
                                                class="order-chart-type-btn"
                                                data-chart-type="takeout">
                                            <i class="fa fa-store"></i>
                                            <span>포장</span>
                                        </button>

                                        <button type="button"
                                                class="order-chart-type-btn"
                                                data-chart-type="parcel">
                                            <i class="fa fa-box"></i>
                                            <span>직거래</span>
                                        </button>
                                    </div>
                                </div>

                                <div class="order-chart-toolbar-right">
                                    <button type="button"
                                            id="orderChartReloadBtn"
                                            class="order-stat-toolbar-btn"
                                            title="그래프 새로고침">
                                        <i class="fa fa-sync"></i>
                                    </button>

                                    <div class="order-stat-current-total">
                                        조회 기간
                                        <strong id="orderChartPeriodText">-</strong>
                                    </div>
                                </div>
                            </div>

                            <div class="order-chart-sub-toolbar">
                                <div class="order-stat-path">
                                    <i class="fa fa-home"></i>
                                    <span>주문통계</span>
                                    <i class="fa fa-angle-right"></i>
                                    <strong id="currentOrderChartName">
                                        전체 그래프
                                    </strong>
                                </div>

                                <div class="order-stat-selected-info">
                                    <div class="order-stat-date-range">
                                        <i class="fa fa-calendar-day"></i>
                                        <span id="orderChartStartDate">-</span>
                                        <span>~</span>
                                        <span id="orderChartEndDate">-</span>
                                    </div>

                                    <div class="order-stat-rate-info">
                                        조회 단위
                                        <strong id="orderChartUnitText">
                                            1일 단위
                                        </strong>
                                    </div>
                                </div>
                            </div>

                            <div class="order-chart-content">
                                <div class="order-chart-box">
                                    <div class="order-chart-head">
                                        <div>
                                            <div class="order-chart-title">
                                                주문 추이
                                            </div>
                                            <div class="order-chart-desc"
                                                 id="orderChartDescription">
                                                전체 주문 / 배달 / 포장 / 직거래
                                            </div>
                                        </div>

                                        <div class="order-chart-head-meta">
                                            <i class="fa fa-chart-line"></i>
                                            주문 분석
                                        </div>
                                    </div>

                                    <div class="order-chart-body">
                                        <canvas id="line-chart"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="order-stat-footer">
                                <div>
                                    <i class="fa fa-info-circle m-r-5"></i>
                                    선택한 주문 유형의 기간별 추이를 표시합니다.
                                </div>

                                <div id="orderChartFooterUnit">
                                    1일 단위
                                </div>
                            </div>
                        </div>
                    </div>
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

<script src="${path}/assets/plugins/chart.js/dist/Chart.min_new.js"></script>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    let table = null;
    let lineChart = null;
    let isChartLoading = false;

    let selectedOrderStatType =
        "totalCnt";

    let selectedOrderChartType =
        "all";

    const DAY_NAME_MAP = {
        "1": "일요일",
        "2": "월요일",
        "3": "화요일",
        "4": "수요일",
        "5": "목요일",
        "6": "금요일",
        "7": "토요일"
    };

    const ORDER_STAT_TYPE_MAP = {
        totalCnt: {
            name: "전체 주문",
            columnIndex: 2,
            summarySelector:
                "#summaryTotalCnt"
        },

        delivery: {
            name: "배달",
            columnIndex: 3,
            summarySelector:
                "#summaryDeliveryCnt"
        },

        takeout: {
            name: "포장",
            columnIndex: 4,
            summarySelector:
                "#summaryTakeoutCnt"
        },

        parcel: {
            name: "직거래",
            columnIndex: 5,
            summarySelector:
                "#summaryParcelCnt"
        },

        /*      todayDelivery: {
                  name: "오늘배송",
                  columnIndex: 6,
                  summarySelector:
                      "#summaryTodayDeliveryCnt"
              }*/
    };

    const ORDER_CHART_TYPE_MAP = {
        all: {
            name: "전체 그래프",
            description:
                "전체 주문 / 배달 / 포장 / 직거래",
            datasetIndexes: [0, 1, 2, 3]
        },

        totalCnt: {
            name: "전체 주문",
            description:
                "기간별 전체 주문 추이",
            datasetIndexes: [0]
        },

        delivery: {
            name: "배달",
            description:
                "기간별 배달 주문 추이",
            datasetIndexes: [1]
        },

        takeout: {
            name: "포장",
            description:
                "기간별 포장 주문 추이",
            datasetIndexes: [2]
        },

        parcel: {
            name: "직거래",
            description:
                "기간별 직거래 주문 추이",
            datasetIndexes: [3]
        }
    };


    $(function() {
        initializeDatePicker();
        initializeChart();
        initializeDataTable();
        initializeEvents();
        initializeOrderStatEvents();
        initializeOrderChartEvents();

        searchOrderList();
    });

    /**
     * 날짜 선택기 초기화
     */
    function initializeDatePicker() {
        const searchStartDate =
            "${searchValue.startDate}";

        const searchEndDate =
            "${searchValue.endDate}";

        const selectedDay =
            Number(
                $(".selday").val()
                || 30
            );

        $(".startDate, .endDate")
            .datepicker({
                calendarWeeks: false,
                todayHighlight: true,
                autoclose: true,
                format: "yyyy-mm-dd",
                language: "kr"
            });

        if (searchStartDate) {
            $(".startDate").datepicker(
                "setDate",
                searchStartDate
            );
        } else {
            const startDate =
                new Date();

            startDate.setDate(
                startDate.getDate()
                - selectedDay
            );

            $(".startDate").datepicker(
                "setDate",
                startDate
            );
        }

        if (searchEndDate) {
            $(".endDate").datepicker(
                "setDate",
                searchEndDate
            );
        } else {
            const endDate =
                new Date();

            endDate.setDate(
                endDate.getDate() - 1
            );

            $(".endDate").datepicker(
                "setDate",
                endDate
            );
        }

        updateDayTypeButton();
        updateSearchPeriodText();
        updateUnitText();
    }

    /**
     * 차트 초기화
     */
    function initializeChart() {
        Chart.defaults.color =
            typeof COLOR_DARK_LIGHTER
            !== "undefined"
                ? COLOR_DARK_LIGHTER
                : "#6c757d";

        Chart.defaults.font.family =
            "'Nanum Gothic', "
            + "'나눔 고딕', "
            + "'NanumGothic', "
            + "'Malgun Gothic', "
            + "'맑은 고딕', "
            + "sans-serif";

        Chart.defaults.font.weight =
            500;

        const canvas =
            document.getElementById(
                "line-chart"
            );

        if (!canvas) {
            return;
        }

        lineChart = new Chart(
            canvas.getContext("2d"),
            {
                type: "line",

                data: {
                    labels: [],

                    datasets: [
                        {
                            label:
                                "전체 주문",

                            borderColor:
                                "rgba(108, 117, 125, 1)",

                            pointBackgroundColor:
                                "rgba(108, 117, 125, .7)",

                            backgroundColor:
                                "rgba(108, 117, 125, .08)",

                            pointRadius: 4,
                            pointHoverRadius: 6,
                            borderWidth: 2,
                            fill: false,
                            tension: 0,
                            cubicInterpolationMode: "default",
                            data: []
                        },
                        {
                            label:
                                "배달",

                            borderColor:
                                "rgba(52, 143, 226, 1)",

                            pointBackgroundColor:
                                "rgba(52, 143, 226, .7)",

                            backgroundColor:
                                "rgba(52, 143, 226, .08)",

                            pointRadius: 4,
                            pointHoverRadius: 6,
                            borderWidth: 2,
                            fill: false,
                            tension: 0,
                            cubicInterpolationMode: "default",
                            data: []
                        },
                        {
                            label:
                                "포장",

                            borderColor:
                                "rgba(0, 172, 172, 1)",

                            pointBackgroundColor:
                                "rgba(0, 172, 172, .7)",

                            backgroundColor:
                                "rgba(0, 172, 172, .08)",

                            pointRadius: 4,
                            pointHoverRadius: 6,
                            borderWidth: 2,
                            fill: false,
                            tension: 0,
                            cubicInterpolationMode: "default",
                            data: []
                        },
                        {
                            label:
                                "직거래",

                            borderColor:
                                "rgba(245, 156, 26, 1)",

                            pointBackgroundColor:
                                "rgba(245, 156, 26, .7)",

                            backgroundColor:
                                "rgba(245, 156, 26, .08)",

                            pointRadius: 4,
                            pointHoverRadius: 6,
                            borderWidth: 2,
                            fill: false,
                            tension: 0,
                            cubicInterpolationMode: "default",
                            data: []
                        }
                    ]
                },

                options: {
                    responsive: true,
                    maintainAspectRatio: false,

                    interaction: {
                        mode: "index",
                        intersect: false
                    },

                    animation: {
                        duration: 250
                    },

                    elements: {
                        line: {
                            tension: 0
                        }
                    },

                    plugins: {
                        legend: {
                            display: true,
                            position: "top",
                            align: "start",

                            labels: {
                                usePointStyle: true,
                                boxWidth: 10,
                                boxHeight: 10,
                                padding: 14,

                                font: {
                                    size: 12,
                                    weight: "500"
                                }
                            }
                        },

                        tooltip: {
                            callbacks: {
                                label: function(
                                    context
                                ) {
                                    const datasetLabel =
                                        context.dataset
                                            .label
                                        || "";

                                    const value =
                                        context.parsed.y
                                        == null
                                            ? 0
                                            : Number(
                                                context
                                                    .parsed.y
                                            );

                                    return datasetLabel
                                        + ": "
                                        + value
                                            .toLocaleString()
                                        + "회";
                                }
                            }
                        }
                    },

                    scales: {
                        x: {
                            display: true,

                            grid: {
                                display: false
                            },

                            ticks: {
                                autoSkip: true,
                                maxRotation: 0,
                                minRotation: 0,
                                font: {
                                    size: 11
                                }
                            }
                        },

                        y: {
                            beginAtZero: true,

                            grid: {
                                color: "rgba(108, 117, 125, .12)"
                            },

                            ticks: {
                                precision: 0,
                                font: {
                                    size: 11
                                },

                                callback: function(
                                    value
                                ) {
                                    return Number(
                                            value
                                        ).toLocaleString()
                                        + " 회";
                                }
                            }
                        }
                    }
                }
            }
        );
    }

    /**
     * DataTable 초기화
     */
    function initializeDataTable() {
        const downloadAble =
            "${downloadAble}";

        const roleType =
            "${sessionScope.sessionKey.roleType}";

        let downloadCheck =
            "1";

        if (
            String(roleType) === "0"
            || String(downloadAble) === "1"
        ) {
            downloadCheck = "";
        }

        table = $("#testTable").ajaxDataTable(
            "frmSearch",
            "${path}/api/mannaorder/chart/page",
            "A6",
            downloadCheck,
            false,
            {
                columns: [
                    {
                        data: "yyyymmdd",
                        defaultContent: "-"
                    },
                    {
                        data: "dw",
                        defaultContent: "-"
                    },
                    {
                        data: "totalCnt",
                        defaultContent: 0
                    },
                    {
                        data: "delivery",
                        defaultContent: 0
                    },
                    {
                        data: "takeout",
                        defaultContent: 0
                    },
                    {
                        data: "parcel",
                        defaultContent: 0
                    },
                    /*    {
                            data: "todayDelivery",
                            defaultContent: 0
                        }*/
                ],

                columnDefs: [
                    {
                        targets: 0,

                        render: function(data, type) {
                            if (
                                type === "sort" ||
                                type === "type"
                            ) {
                                return data || "";
                            }

                            return ""
                                + "<div class='order-stat-date-cell'>"
                                + "    <span class='order-stat-date-icon'>"
                                + "        <i class='fas fa-calendar-alt'></i>"
                                + "    </span>"
                                + "    <span>"
                                + escapeHtml(data || "-")
                                + "    </span>"
                                + "</div>";
                        }
                    },
                    {
                        targets: 1,
                        className: "text-center",

                        render: function(data) {
                            return getDayName(data);
                        }
                    },
                    {
                        targets: [2, 3, 4, 5],
                        className: "text-center",

                        render: function(
                            data,
                            type,
                            row,
                            meta
                        ) {
                            const value =
                                toNumber(data);

                            if (
                                type === "sort" ||
                                type === "type"
                            ) {
                                return value;
                            }

                            const totalClass =
                                meta.col === 2
                                    ? " total"
                                    : "";

                            const zeroClass =
                                value === 0
                                    ? " zero"
                                    : "";

                            return ""
                                + "<span class='order-stat-number"
                                + totalClass
                                + zeroClass
                                + "'>"
                                + value.toLocaleString()
                                + " 회"
                                + "</span>";
                        }
                    }
                ],

                drawCallback: function() {
                    setTimeout(
                        function() {
                            updateSummaryFromTable();
                            highlightSelectedStatRows();
                        },
                        0
                    );
                }
            }
        );

        moveExcelButtonToToolbar();

        $("#testTable_filter")
            .empty();

        $("#testTable").on(
            "draw.dt",
            function() {
                updateSummaryFromTable();
            }
        );

        updateDayColumnVisibility();
    }

    /**
     * 기본 이벤트
     */
    function initializeEvents() {
        $("#searchBtn").on(
            "click",
            function() {
                searchForm();
            }
        );

        $("#frmSearch").on(
            "submit",
            function(event) {
                event.preventDefault();
                searchForm();
            }
        );

        $(".select-day").on(
            "click",
            function() {
                const day =
                    Number(
                        $(this).attr(
                            "data-day"
                        ) || 30
                    );

                const startDate =
                    new Date();

                startDate.setDate(
                    startDate.getDate()
                    - day
                );

                $(".select-day")
                    .removeClass("active");

                $(this)
                    .addClass("active");

                $(".selday").val(day);

                $(".startDate")
                    .datepicker(
                        "setDate",
                        startDate
                    );

                updateSearchPeriodText();
            }
        );

        $(".step-day").on(
            "click",
            function() {
                const dayType =
                    String(
                        $(this).attr(
                            "data-day-type"
                        ) || "2"
                    );

                $(".step-day")
                    .removeClass("active");

                $(this)
                    .addClass("active");

                $(".dayType")
                    .val(dayType);

                updateDayColumnVisibility();
                updateUnitText();
                reloadStatistics();
            }
        );

        $(".startDate, .endDate").on(
            "changeDate",
            function() {
                $(".select-day")
                    .removeClass("active");

                $(".selday").val("");

                updateSearchPeriodText();
            }
        );

        $(document).on(
            "shown.bs.tab",
            ".order-stat-view-btn[data-toggle='tab']",
            function(event) {
                const $currentButton =
                    $(event.target);

                const target =
                    $currentButton.attr("href");

                $(".order-stat-view-btn")
                    .removeClass("active");

                $currentButton
                    .addClass("active");

                if (
                    target === "#default-tab-2"
                    && lineChart
                ) {
                    setTimeout(
                        function() {
                            updateOrderChartMeta();
                            applySelectedOrderChartType();
                            lineChart.resize();
                        },
                        50
                    );
                }
            }
        );
    }

    /**
     * 주문 유형 버튼 이벤트
     */
    function initializeOrderStatEvents() {
        $(document).on(
            "click",
            ".order-stat-type-btn",
            function() {
                selectedOrderStatType =
                    $(this).attr(
                        "data-stat-type"
                    ) || "totalCnt";

                $(".order-stat-type-btn")
                    .removeClass("active");

                $(this)
                    .addClass("active");

                const typeInfo =
                    ORDER_STAT_TYPE_MAP[
                        selectedOrderStatType
                        ];

                $("#currentStatTypeName")
                    .text(typeInfo.name);

                updateSelectedStatRate();
                highlightSelectedStatRows();
            }
        );

        $("#orderStatReloadBtn").on(
            "click",
            function() {
                reloadStatistics();
            }
        );
    }

    /**
     * 주문 그래프 유형 버튼 이벤트
     */
    function initializeOrderChartEvents() {
        $(document).on(
            "click",
            ".order-chart-type-btn",
            function() {
                selectedOrderChartType =
                    $(this).attr(
                        "data-chart-type"
                    ) || "all";

                $(".order-chart-type-btn")
                    .removeClass("active");

                $(this)
                    .addClass("active");

                applySelectedOrderChartType();
            }
        );

        $("#orderChartReloadBtn").on(
            "click",
            function() {
                reloadStatistics();
            }
        );
    }

    /**
     * 선택한 주문 그래프만 표시
     */
    function applySelectedOrderChartType() {
        if (
            !lineChart
            || !lineChart.data
            || !Array.isArray(
                lineChart.data.datasets
            )
        ) {
            return;
        }

        const typeInfo =
            ORDER_CHART_TYPE_MAP[
                selectedOrderChartType
                ] || ORDER_CHART_TYPE_MAP.all;

        const visibleIndexes =
            typeInfo.datasetIndexes;

        lineChart.data.datasets
            .forEach(
                function(dataset, index) {
                    dataset.hidden =
                        visibleIndexes
                            .indexOf(index) < 0;
                }
            );

        $("#currentOrderChartName")
            .text(typeInfo.name);

        $("#orderChartDescription")
            .text(typeInfo.description);

        updateOrderChartMeta();
        lineChart.update();
    }

    /**
     * 그래프 기간/단위 표시
     */
    function updateOrderChartMeta() {
        const startDate =
            $(".startDate").val() || "-";

        const endDate =
            $(".endDate").val() || "-";

        const dayType =
            String(
                $(".dayType").val()
                || "2"
            );

        const unitText =
            dayType === "1"
                ? "7일 단위"
                : "1일 단위";

        $("#orderChartStartDate")
            .text(startDate);

        $("#orderChartEndDate")
            .text(endDate);

        $("#orderChartPeriodText")
            .text(
                startDate
                + " ~ "
                + endDate
            );

        $("#orderChartUnitText")
            .text(unitText);

        $("#orderChartFooterUnit")
            .text(unitText);
    }

    /**
     * 검색 실행
     */
    function searchForm() {
        if (!validateSearchDate()) {
            return;
        }

        reloadStatistics();
    }

    /**
     * 테이블과 그래프 재조회
     */
    function reloadStatistics() {
        updateSearchPeriodText();

        $("#orderStatReloadBtn")
            .addClass("loading")
            .prop("disabled", true);

        searchOrderList();

        if (!table) {
            $("#orderStatReloadBtn")
                .removeClass("loading")
                .prop("disabled", false);

            return;
        }

        table.columns().every(
            function() {
                this.search("");
            }
        );

        table.ajax.reload(
            function() {
                $("#orderStatReloadBtn")
                    .removeClass("loading")
                    .prop("disabled", false);

                updateSummaryFromTable();
            },
            true
        );
    }

    /**
     * 그래프 조회
     */
    function searchOrderList() {
        if (
            isChartLoading
            || !validateSearchDate()
        ) {
            return;
        }

        isChartLoading = true;

        const requestData =
            convertFormToObj(
                $("#frmSearch")
            );

        $.ajax({
            type: "POST",

            url:
                "${path}/api/manna/order/list",

            contentType:
                "application/json; charset=UTF-8",

            data:
                JSON.stringify(
                    requestData
                ),

            dataType: "json",

            success: function(
                response
            ) {
                const resultList =
                    response
                    && Array.isArray(
                        response.timeList
                    )
                        ? response.timeList
                        : [];

                updateOrderChart(
                    resultList
                );
            },

            error: function(xhr) {
                console.error(
                    "주문 통계 그래프 조회 오류",
                    xhr
                );

                clearOrderChart();

                alert(
                    "주문 통계 그래프를 불러오지 못했습니다."
                );
            },

            complete: function() {
                isChartLoading = false;
            }
        });
    }

    /**
     * 그래프 갱신
     */
    function updateOrderChart(
        resultList
    ) {
        if (
            !lineChart
            || !lineChart.data
            || !Array.isArray(
                lineChart.data.datasets
            )
            || lineChart.data.datasets
                .length < 4
        ) {
            return;
        }

        const dayType =
            String(
                $(".dayType").val()
                || "2"
            );

        const labels = [];
        const totalData = [];
        const deliveryData = [];
        const takeoutData = [];
        const parcelData = [];

        $.each(
            resultList || [],
            function(index, item) {
                if (
                    dayType === "1"
                    && item.start
                    && item.end
                ) {
                    labels.push(
                        item.start
                        + " ~ "
                        + item.end
                    );
                } else {
                    labels.push(
                        item.yyyymmdd
                        || "-"
                    );
                }

                totalData.push(
                    toNumber(
                        item.totalCnt
                    )
                );

                deliveryData.push(
                    toNumber(
                        item.delivery
                    )
                );


                takeoutData.push(
                    toNumber(
                        item.takeout
                    )
                );

                parcelData.push(
                    toNumber(
                        item.parcel
                    )
                );
            }
        );

        const pointRadius =
            resultList.length > 40
                ? 0
                : 4;

        lineChart.data.labels =
            labels;

        lineChart.data.datasets[0].data =
            totalData;

        lineChart.data.datasets[1].data =
            deliveryData;

        lineChart.data.datasets[2].data =
            takeoutData;

        lineChart.data.datasets[3].data =
            parcelData;

        lineChart.data.datasets
            .forEach(
                function(dataset) {
                    dataset.pointRadius =
                        pointRadius;
                }
            );

        applySelectedOrderChartType();
    }

    /**
     * 그래프 초기화
     */
    function clearOrderChart() {
        if (
            !lineChart
            || !lineChart.data
        ) {
            return;
        }

        lineChart.data.labels = [];

        lineChart.data.datasets
            .forEach(
                function(dataset) {
                    dataset.data = [];
                }
            );

        lineChart.update();
    }

    /**
     * 테이블 데이터 기준 요약
     */
    function updateSummaryFromTable() {
        if (!table) {
            return;
        }

        const rows =
            table.rows()
                .data()
                .toArray();

        let totalCnt = 0;
        let deliveryCnt = 0;
        let takeoutCnt = 0;
        let parcelCnt = 0;
        let todayDeliveryCnt = 0;

        $.each(
            rows || [],
            function(index, row) {
                totalCnt +=
                    toNumber(
                        row.totalCnt
                    );

                deliveryCnt +=
                    toNumber(
                        row.delivery
                    );

                takeoutCnt +=
                    toNumber(
                        row.takeout
                    );

                parcelCnt +=
                    toNumber(
                        row.parcel
                    );

                todayDeliveryCnt +=
                    toNumber(
                        row.todayDelivery
                    );
            }
        );

        $("#summaryTotalCnt")
            .text(
                totalCnt
                    .toLocaleString()
            );

        $("#summaryDeliveryCnt")
            .text(
                deliveryCnt
                    .toLocaleString()
            );

        $("#summaryTakeoutCnt")
            .text(
                takeoutCnt
                    .toLocaleString()
            );

        $("#summaryParcelCnt")
            .text(
                parcelCnt
                    .toLocaleString()
            );

        $("#summaryTodayDeliveryCnt")
            .text(
                todayDeliveryCnt
                    .toLocaleString()
            );

        $("#orderStatTotalRowCount")
            .text(
                rows.length
                    .toLocaleString()
            );

        updateSearchPeriodText();
        updateUnitText();
        updateSelectedStatRate();
        highlightSelectedStatRows();
    }

    /**
     * 선택 유형 비율 갱신
     */
    function updateSelectedStatRate() {
        const total =
            parseCountText(
                $("#summaryTotalCnt")
                    .text()
            );

        const typeInfo =
            ORDER_STAT_TYPE_MAP[
                selectedOrderStatType
                ];

        const selectedCount =
            parseCountText(
                $(
                    typeInfo
                        .summarySelector
                ).text()
            );

        let rate = 0;

        if (total > 0) {
            rate =
                selectedOrderStatType
                === "totalCnt"
                    ? 100
                    : selectedCount
                    / total
                    * 100;
        }

        $("#summarySelectedRate")
            .text(
                rate.toFixed(1)
                + "%"
            );

        $("#summaryProgressBar")
            .css(
                "width",
                Math.min(
                    rate,
                    100
                ) + "%"
            );
    }

    /**
     * 선택 유형 값이 있는 행 강조
     */
    function highlightSelectedStatRows() {
        if (!table) {
            return;
        }

        $("#testTable tbody tr")
            .removeClass(
                "stat-highlight-row"
            );

        $("#testTable tbody tr")
            .each(
                function() {
                    const rowData =
                        table.row(this)
                            .data();

                    if (!rowData) {
                        return;
                    }

                    const value =
                        toNumber(
                            rowData[
                                selectedOrderStatType
                                ]
                        );

                    if (value > 0) {
                        $(this).addClass(
                            "stat-highlight-row"
                        );
                    }
                }
            );
    }

    /**
     * 기간 표시
     */
    function updateSearchPeriodText() {
        $("#summaryStartDate")
            .text(
                $(".startDate").val()
                || "-"
            );

        $("#summaryEndDate")
            .text(
                $(".endDate").val()
                || "-"
            );

        updateOrderChartMeta();
    }

    /**
     * 조회 단위 표시
     */
    function updateUnitText() {
        const dayType =
            String(
                $(".dayType").val()
                || "2"
            );

        $("#orderStatUnitText")
            .text(
                dayType === "1"
                    ? "7일 단위"
                    : "1일 단위"
            );

        updateOrderChartMeta();
    }

    /**
     * 주별 조회 시 요일 숨김
     */
    function updateDayColumnVisibility() {
        if (!table) {
            return;
        }

        const dayType =
            String(
                $(".dayType").val()
                || "2"
            );

        table.column(1)
            .visible(
                dayType !== "1",
                false
            );

        table.columns
            .adjust()
            .draw(false);
    }

    /**
     * 조회 단위 버튼 표시
     */
    function updateDayTypeButton() {
        const dayType =
            String(
                $(".dayType").val()
                || "2"
            );

        $(".step-day")
            .removeClass("active");

        $(
            ".step-day"
            + "[data-day-type='"
            + dayType
            + "']"
        ).addClass("active");
    }

    /**
     * 날짜 검증
     */
    function validateSearchDate() {
        const startDate =
            $.trim(
                $(".startDate").val()
                || ""
            );

        const endDate =
            $.trim(
                $(".endDate").val()
                || ""
            );

        if (!startDate) {
            alert(
                "시작일을 선택해주세요."
            );

            return false;
        }

        if (!endDate) {
            alert(
                "종료일을 선택해주세요."
            );

            return false;
        }

        if (
            new Date(startDate)
            > new Date(endDate)
        ) {
            alert(
                "시작일은 종료일보다 늦을 수 없습니다."
            );

            return false;
        }

        return true;
    }

    /**
     * 요일 이름
     */
    function getDayName(value) {
        const key =
            value == null
                ? ""
                : String(value);

        return DAY_NAME_MAP[key]
            || key
            || "-";
    }

    /**
     * 숫자 변환
     */
    function toNumber(value) {
        if (
            value == null
            || value === ""
        ) {
            return 0;
        }

        const numberValue =
            Number(value);

        return Number.isNaN(
            numberValue
        )
            ? 0
            : numberValue;
    }

    /**
     * 숫자 문자열 변환
     */
    function parseCountText(value) {
        return Number(
            String(value || "0")
                .replace(/,/g, "")
        ) || 0;
    }

    /**
     * HTML Escape
     */
    function escapeHtml(value) {
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

    function lastWeek() {
        const date =
            new Date();

        date.setDate(
            date.getDate() - 7
        );

        return getDateStr(date);
    }

    function lastMonth() {
        const date =
            new Date();

        date.setMonth(
            date.getMonth() - 1
        );

        return getDateStr(date);
    }
    function moveExcelButtonToToolbar() {
        const $target =
            $("#orderStatExcelArea");

        if ($target.length === 0) {
            return;
        }

        /*
         * ajaxDataTable 내부에서 Buttons 생성이 늦게 될 수 있으므로
         * 약간 뒤에 찾아서 이동
         */
        setTimeout(
            function() {
                let $buttons =
                    $("#testTable_wrapper")
                        .find(".dt-buttons")
                        .first();

                /*
                 * wrapper 밖에 생성되는 경우까지 대응
                 */
                if ($buttons.length === 0) {
                    $buttons =
                        $(".dt-buttons")
                            .first();
                }

                if ($buttons.length === 0) {
                    console.warn(
                        "DataTables Excel 버튼을 찾지 못했습니다."
                    );

                    return;
                }

                $target.empty();
                $buttons.appendTo($target);

                const $excelButton =
                    $target.find(
                        ".buttons-excel, "
                        + ".buttons-excel-html5"
                    );

                $excelButton
                    .removeClass(
                        "btn-secondary "
                        + "btn-default "
                        + "btn-sm"
                    )
                    .addClass(
                        "order-stat-excel-btn"
                    );

                /*
                 * 공통 설정에서 버튼 텍스트가 길게 잡힌 경우
                 */
                $excelButton.each(
                    function() {
                        const $button =
                            $(this);

                        if (
                            $.trim(
                                $button.text()
                            ) === ""
                        ) {
                            $button.text(
                                "엑셀 다운로드"
                            );
                        }
                    }
                );
            },
            100
        );
    }
</script>
</body>
</html>
