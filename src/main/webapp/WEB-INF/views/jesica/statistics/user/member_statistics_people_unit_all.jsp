<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>

    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 회원통계</title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네 | 회원통계</title>
    </c:if>


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

        .page-header-fixed {
            padding-top: 32px;
        }

        /*
         * 검색 영역
         * 주문통계 화면과 동일한 한 줄 관리자형 구성
         */
        .member-search-box {
            padding: 14px 16px;
            margin: 29px 14px 14px;
            background: #f3f4f5;
        }

        .member-search-row {
            display: grid;
            grid-template-columns: 150px minmax(560px, 1fr) auto;
            align-items: end;
            gap: 10px;
            width: 100%;
        }

        .member-search-item {
            min-width: 0;
        }

        .member-search-label {
            display: block;
            margin-bottom: 6px;
            color: #59636e;
            font-size: 11px;
            font-weight: 700;
            line-height: 1;
        }

        .member-search-item .form-control,
        .member-search-select {
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

        .member-search-select {
            cursor: pointer;
            appearance: auto;
            -webkit-appearance: menulist;
            -moz-appearance: menulist;
        }

        .member-search-select:focus,
        .member-search-item .form-control:focus {
            border-color: #348fe2;
            box-shadow: 0 0 0 2px rgba(52, 143, 226, .12);
        }

        .member-search-period {
            display: flex;
            align-items: center;
            gap: 8px;
            min-width: 0;
        }

        .member-search-dates {
            display: flex;
            flex: 0 0 auto;
            align-items: center;
            gap: 5px;
        }

        .member-search-date {
            position: relative;
            width: 108px;
        }

        .member-search-date .form-control {
            padding-right: 28px;
        }

        .member-search-date i {
            position: absolute;
            top: 50%;
            right: 9px;
            color: #98a1ab;
            font-size: 11px;
            pointer-events: none;
            transform: translateY(-50%);
        }

        .member-search-date-divider {
            color: #98a1ab;
            font-size: 11px;
            font-weight: 700;
        }

        .member-search-period-buttons {
            display: flex;
            min-width: 0;
            align-items: center;
            gap: 6px;
        }

        .member-search-period-buttons .btn-group {
            display: inline-flex;
            flex-wrap: nowrap;
        }

        .member-search-period-buttons .btn {
            min-width: 38px;
            height: 34px;
            padding: 0 7px;
            border-color: #d3d8de;
            font-size: 10px;
            line-height: 32px;
            white-space: nowrap;
        }

        .member-search-period-buttons .btn.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
            box-shadow: none;
        }

        .member-search-actions {
            display: flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap;
        }

        .member-search-view-buttons {
            display: inline-flex;
            overflow: hidden;
            height: 34px;
            border: 1px solid #cfd5dc;
            border-radius: 4px;
            background: #fff;
        }

        .member-search-view-btn {
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

        .member-search-view-btn:last-child {
            border-right: 0;
        }

        .member-search-view-btn:hover {
            background: #f2f6fa;
            color: #348fe2;
        }

        .member-search-view-btn.active {
            background: #348fe2;
            color: #fff;
        }

        .member-search-submit {
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

        .member-search-submit:hover,
        .member-search-submit:focus {
            border-color: #2a72b5;
            background: #2a72b5;
            color: #fff;
        }

        /*
         * 회원통계 File Manager 스타일
         */
        .member-stat-manager {
            width: 100%;
            min-height: 620px;
            border: 1px solid #d9dee5;
            background: #fff;
        }

        .member-stat-content {
            width: 100%;
            min-width: 0;
            background: #fff;
        }

        .member-stat-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 62px;
            padding: 10px 14px;
            border-bottom: 1px solid #d9dee5;
            background: #fff;
        }

        .member-stat-toolbar-left {
            display: flex;
            min-width: 0;
            flex: 1;
            align-items: center;
        }

        .member-stat-toolbar-right {
            display: flex;
            flex: 0 0 auto;
            align-items: center;
            gap: 12px;
        }

        .member-stat-summary-buttons {
            display: flex;
            min-width: 0;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .member-stat-summary-btn {
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
        }

        .member-stat-summary-btn.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
            box-shadow: 0 2px 5px rgba(52, 143, 226, .2);
        }

        .member-stat-summary-btn i {
            font-size: 12px;
        }

        .member-stat-summary-btn strong {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 36px;
            height: 20px;
            padding: 0 6px;
            border-radius: 10px;
            background: #eef1f4;
            color: #52606d;
            font-size: 10px;
            font-weight: 700;
            font-variant-numeric: tabular-nums;
        }

        .member-stat-summary-btn.active strong {
            background: rgba(255, 255, 255, .2);
            color: #fff;
        }

        .member-stat-toolbar-btn {
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

        .member-stat-toolbar-btn:hover {
            border-color: #348fe2;
            color: #348fe2;
        }

        .member-stat-current-total {
            color: #67717b;
            font-size: 11px;
            white-space: nowrap;
        }

        .member-stat-current-total strong {
            margin: 0 3px;
            color: #348fe2;
            font-size: 14px;
        }

        .member-stat-sub-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 44px;
            padding: 6px 15px;
            border-bottom: 1px solid #e5e7eb;
            background: #f8fafc;
        }

        .member-stat-path {
            display: flex;
            align-items: center;
            gap: 7px;
            color: #8a939d;
            font-size: 11px;
        }

        .member-stat-path strong {
            color: #2d353c;
        }

        .member-stat-selected-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .member-stat-date-range {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #67717b;
            font-size: 10px;
            white-space: nowrap;
        }

        .member-stat-date-range i {
            color: #348fe2;
        }

        .member-stat-unit-info {
            color: #8a939d;
            font-size: 10px;
            white-space: nowrap;
        }

        .member-stat-unit-info strong {
            margin-left: 3px;
            color: #2d353c;
        }

        .member-stat-table-wrap {
            width: 100%;
            min-height: 470px;
            overflow-x: auto;
        }

        .member-stat-table {
            width: 100% !important;
            min-width: 1180px;
            margin: 0 !important;
            border-collapse: collapse;
            table-layout: auto;
        }

        .member-stat-table th,
        .member-stat-table td {
            padding: 0 10px !important;
            border-top: 0 !important;
            border-right: 0 !important;
            border-bottom: 1px solid #e4e7ea !important;
            border-left: 0 !important;
            color: #2d353c;
            font-size: 12px;
            vertical-align: middle;
        }

        .member-stat-table th {
            height: 42px;
            background: #fff;
            color: #67717b;
            font-weight: 700;
            white-space: nowrap;
        }

        .member-stat-table thead tr:first-child th {
            background: #f8fafc;
        }

        .member-stat-table tbody tr {
            transition: background-color .15s ease;
        }

        .member-stat-table tbody tr:hover {
            background: #f7f9fb;
        }

        .border-right-bold {
            border-right: 1px solid #d7dce2 !important;
        }

        .border-left-bold {
            border-left: 1px solid #d7dce2 !important;
        }

        .member-stat-footer {
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
         * DataTables 기본 UI를 툴바에 맞게 정리
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

        #testTable_wrapper > .dt-buttons {
            display: none;
        }

        #testTable_wrapper .row:first-child {
            margin: 0 !important;
        }

        #testTable_wrapper .row:first-child > div {
            padding: 0 !important;
        }

        .member-stat-excel-area {
            display: flex;
            align-items: center;
        }

        .member-stat-excel-area .dt-buttons {
            display: flex;
            align-items: center;
            margin: 0 !important;
        }

        .member-stat-excel-area .dt-button,
        .member-stat-excel-area .buttons-excel,
        .member-stat-excel-area .buttons-excel-html5 {
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
            color: #59636e !important;
            font-size: 11px !important;
            font-weight: 600 !important;
            line-height: 1 !important;
            box-shadow: none !important;
        }

        .member-stat-excel-area .dt-button:hover,
        .member-stat-excel-area .buttons-excel:hover,
        .member-stat-excel-area .buttons-excel-html5:hover {
            border-color: #188244 !important;
            background: #188244 !important;
            color: #fff !important;
        }

        .member-stat-excel-area .dt-button::before,
        .member-stat-excel-area .buttons-excel::before,
        .member-stat-excel-area .buttons-excel-html5::before {
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            content: "\f1c3";
        }

        /*
         * 그래프 화면
         */
        .member-chart-layout {
            display: grid;
            grid-template-columns:
                minmax(0, 1.6fr)
                minmax(260px, .9fr)
                minmax(260px, .9fr);
            gap: 10px;
            align-items: stretch;
        }

        .member-chart-box {
            border: 1px solid #d9dfe7;
            background: #fff;
            min-width: 0;
        }

        .member-chart-head {
            height: 42px;
            padding: 0 12px;
            border-bottom: 1px solid #d9dfe7;
            background: #f8fafc;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .member-chart-title {
            color: #212529;
            font-size: 13px;
            font-weight: 700;
            white-space: nowrap;
        }

        .member-chart-sub {
            color: #868e96;
            font-size: 11px;
            white-space: nowrap;
        }

        .member-chart-body {
            position: relative;
            height: 340px;
            padding: 12px;
            box-sizing: border-box;
        }

        .member-chart-body canvas {
            display: block;
            width: 100% !important;
            height: 100% !important;
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

        @media (max-width: 1450px) {
            .member-search-row {
                grid-template-columns: 130px minmax(500px, 1fr) auto;
                gap: 7px;
            }

            .member-search-date {
                width: 96px;
            }

            .member-search-period-buttons .btn {
                min-width: 34px;
                padding: 0 5px;
                font-size: 9px;
            }
        }

        @media (max-width: 1200px) {
            .member-search-row {
                grid-template-columns: 1fr;
            }

            .member-search-actions {
                justify-content: flex-end;
            }

            .member-chart-layout {
                grid-template-columns: 1fr 1fr;
            }

            .member-chart-box.is-wide {
                grid-column: 1 / -1;
            }
        }

        @media (max-width: 768px) {
            .member-search-row {
                display: flex;
                align-items: stretch;
                flex-direction: column;
            }

            .member-search-period {
                align-items: stretch;
                flex-direction: column;
            }

            .member-search-period-buttons,
            .member-search-period-buttons .btn-group,
            .member-search-actions,
            .member-search-view-buttons {
                width: 100%;
            }

            .member-search-period-buttons {
                flex-direction: column;
            }

            .member-search-period-buttons .btn,
            .member-search-view-btn,
            .member-search-submit {
                flex: 1;
            }

            .member-search-date {
                flex: 1;
                width: auto;
            }

            .member-stat-toolbar,
            .member-stat-sub-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .member-stat-toolbar-right,
            .member-stat-selected-info {
                width: 100%;
                flex-wrap: wrap;
            }

            .member-chart-layout {
                grid-template-columns: 1fr;
            }

            .member-chart-body {
                height: 300px;
            }
        }

        /*
         * 테이블 내부 셀 디자인
         * 주문통계 목록과 같은 정보 밀도와 시각 계층
         */
        .member-stat-table tbody td {
            height: 48px;
            padding: 0 13px !important;
            background: #fff;
        }

        .member-stat-table tbody tr:hover td {
            background: #f7f9fb;
        }

        .member-stat-date-cell {
            display: flex;
            align-items: center;
            gap: 9px;
            min-width: 132px;
            font-weight: 600;
        }

        .member-stat-date-icon {
            display: flex;
            flex: 0 0 30px;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 4px;
            background: #eef6ff;
            color: #348fe2;
            font-size: 11px;
        }

        .member-stat-date-text {
            display: flex;
            flex-direction: column;
            gap: 2px;
            line-height: 1.15;
        }

        .member-stat-date-main {
            color: #2d353c;
            font-size: 12px;
            font-weight: 700;
        }

        .member-stat-date-sub {
            color: #9aa3ad;
            font-size: 10px;
            font-weight: 500;
        }

        .member-stat-day-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 34px;
            height: 22px;
            padding: 0 7px;
            border-radius: 11px;
            background: #f1f3f5;
            color: #68727d;
            font-size: 10px;
            font-weight: 700;
        }

        .member-stat-number {
            color: #3b4650;
            font-weight: 600;
            font-variant-numeric: tabular-nums;
        }

        .member-stat-number.total {
            color: #2d353c;
            font-weight: 700;
        }

        .member-stat-number.rate {
            color: #7b8793;
            font-size: 11px;
            font-weight: 600;
        }

        .member-stat-number.zero {
            color: #b7bec6;
            font-weight: 400;
        }

        .member-stat-cell-group-start {
            border-left: 1px solid #dfe4e9 !important;
        }

        .member-stat-cell-group-end {
            border-right: 1px solid #dfe4e9 !important;
        }

        .member-stat-table thead th {
            height: 40px;
            padding: 0 10px !important;
            background: #fff;
        }

        .member-stat-table thead tr:first-child th {
            height: 38px;
            background: #f8fafc;
            color: #59636e;
            font-size: 11px;
        }

        .member-stat-table thead tr:last-child th {
            color: #7a848e;
            font-size: 10px;
        }


        .member-stat-summary-btn {
            cursor: pointer;
            transition:
                    border-color .15s ease,
                    background-color .15s ease,
                    color .15s ease,
                    box-shadow .15s ease;
        }

        .member-stat-summary-btn:hover {
            border-color: #348fe2;
            color: #348fe2;
        }

        .member-stat-summary-btn.active:hover {
            color: #fff;
        }

        .member-stat-table tbody tr.member-stat-highlight-row td {
            background: #eef6ff !important;
        }

        .member-stat-table tbody tr.member-stat-highlight-row:hover td {
            background: #e5f1ff !important;
        }

        .member-stat-table tbody tr.member-stat-highlight-row
        .member-stat-date-icon {
            background: #348fe2;
            color: #fff;
        }

        .member-stat-table tbody tr.member-stat-highlight-row
        .member-stat-number.total {
            color: #1769aa;
        }


        /*
         * 그래프 탭 File Manager 스타일
         */
        .member-chart-manager {
            width: 100%;
            min-height: 620px;
            border: 1px solid #d9dee5;
            background: #fff;
        }

        .member-chart-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 62px;
            padding: 10px 14px;
            border-bottom: 1px solid #d9dee5;
            background: #fff;
        }

        .member-chart-toolbar-left {
            display: flex;
            min-width: 0;
            flex: 1;
            align-items: center;
        }

        .member-chart-toolbar-right {
            display: flex;
            flex: 0 0 auto;
            align-items: center;
            gap: 12px;
        }

        .member-chart-view-buttons {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .member-chart-view-btn {
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

        .member-chart-view-btn:hover {
            border-color: #348fe2;
            color: #348fe2;
        }

        .member-chart-view-btn.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
            box-shadow: 0 2px 5px rgba(52, 143, 226, .2);
        }

        .member-chart-sub-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            min-height: 44px;
            padding: 6px 15px;
            border-bottom: 1px solid #e5e7eb;
            background: #f8fafc;
        }

        .member-chart-content {
            padding: 12px;
            background: #f5f7f9;
        }

        .member-chart-layout {
            display: grid;
            grid-template-columns:
                minmax(0, 1.55fr)
                minmax(280px, .8fr)
                minmax(280px, .8fr);
            gap: 12px;
            align-items: stretch;
        }

        .member-chart-box {
            overflow: hidden;
            border: 1px solid #d9dee5;
            background: #fff;
            min-width: 0;
            transition:
                    border-color .15s ease,
                    box-shadow .15s ease;
        }

        .member-chart-box:hover {
            border-color: #bcc7d2;
            box-shadow: 0 3px 10px rgba(45, 53, 60, .06);
        }

        .member-chart-box.chart-panel-hidden {
            display: none;
        }

        .member-chart-box.chart-panel-focused {
            grid-column: 1 / -1;
        }

        .member-chart-head {
            min-height: 54px;
            padding: 9px 12px;
            border-bottom: 1px solid #e5e7eb;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }

        .member-chart-title {
            color: #2d353c;
            font-size: 13px;
            font-weight: 700;
            line-height: 1.25;
        }

        .member-chart-desc {
            margin-top: 3px;
            color: #8a939d;
            font-size: 10px;
            line-height: 1.25;
        }

        .member-chart-head-meta {
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

        .member-chart-body {
            position: relative;
            height: 360px;
            padding: 14px;
            background: #fff;
            box-sizing: border-box;
        }

        .member-chart-body-wide {
            height: 360px;
        }

        .member-chart-box.chart-panel-focused
        .member-chart-body {
            height: 440px;
        }

        .member-chart-body canvas {
            display: block;
            width: 100% !important;
            height: 100% !important;
        }

        @media (max-width: 1450px) {
            .member-chart-layout {
                grid-template-columns: 1fr 1fr;
            }

            .member-chart-box.is-wide {
                grid-column: 1 / -1;
            }
        }

        @media (max-width: 900px) {
            .member-chart-toolbar,
            .member-chart-sub-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .member-chart-toolbar-right,
            .member-chart-view-buttons,
            .member-stat-selected-info {
                width: 100%;
                flex-wrap: wrap;
            }

            .member-chart-view-btn {
                flex: 1;
                justify-content: center;
            }

            .member-chart-layout {
                grid-template-columns: 1fr;
            }

            .member-chart-box,
            .member-chart-box.is-wide,
            .member-chart-box.chart-panel-focused {
                grid-column: auto;
            }

            .member-chart-body,
            .member-chart-body-wide,
            .member-chart-box.chart-panel-focused
            .member-chart-body {
                height: 320px;
            }
        }


        /*
         * 주문통계 화면 기준 세부 보정
         * 달력 아이콘 / 날짜·요일 헤더 / 폰트 크기 통일
         */
        .member-search-date i {
            right: 9px;
            color: #98a1ab;
            font-size: 11px;
            font-weight: 900;
        }

        .member-search-date .form-control {
            height: 34px;
            padding-right: 28px;
            font-size: 11px;
        }

        .member-search-date-divider {
            color: #98a1ab;
            font-size: 11px;
            font-weight: 700;
        }

        .member-stat-table th,
        .member-stat-table td {
            font-size: 13px;
        }

        .member-stat-table thead tr:first-child th,
        .member-stat-table thead tr:last-child th {
            background: #fff !important;
            color: #67717b;
            font-size: 13px;
            font-weight: 700;
        }

        .member-stat-table thead tr:first-child th {
            height: 42px;
            border-bottom: 1px solid #e4e7ea !important;
        }

        .member-stat-table thead tr:last-child th {
            height: 42px;
            border-bottom: 1px solid #e4e7ea !important;
        }

        .member-stat-table tbody td {
            height: 23px;
            font-size: 13px;
        }

        .member-stat-date-main {
            color: #2d353c;
            font-size: 13px;
            font-weight: 600;
        }

        .member-stat-date-sub {
            color: #8a939d;
            font-size: 10px;
            font-weight: 500;
        }

        .member-stat-day-badge {
            min-width: auto;
            height: auto;
            padding: 0;
            border-radius: 0;
            background: transparent;
            color: #59636e;
            font-size: 13px;
            font-weight: 600;
        }

        .member-stat-date-icon {
            width: 30px;
            height: 30px;
            border-radius: 4px;
            background: #eef6ff;
            color: #348fe2;
            font-size: 12px;
        }

        .member-stat-number {
            font-size: 13px;
        }

        .member-stat-number.rate {
            font-size: 12px;
        }

        .member-stat-table tbody tr.member-stat-highlight-row td {
            background: #eef6ff !important;
        }

     /*   .member-stat-table tbody tr.member-stat-highlight-row
        .member-stat-day-badge {
            color: #1769aa;
        }*/

    
        /*
         * 가입 추이 개별 데이터셋 선택
         */
        .member-trend-controls {
            display: inline-flex;
            align-items: center;
            overflow: hidden;
            border: 1px solid #cfd5dc;
            border-radius: 4px;
            background: #fff;
        }

        .member-trend-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 28px;
            padding: 0 9px;
            border: 0;
            border-right: 1px solid #cfd5dc;
            background: #fff;
            color: #59636e;
            font-size: 10px;
            font-weight: 700;
            cursor: pointer;
        }

        .member-trend-btn:last-child {
            border-right: 0;
        }

        .member-trend-btn:hover {
            background: #f2f6fa;
            color: #348fe2;
        }

        .member-trend-btn.active {
            background: #348fe2;
            color: #fff;
        }

        @media (max-width: 900px) {
            .member-trend-controls {
                width: 100%;
                margin-top: 7px;
            }

            .member-trend-btn {
                flex: 1;
            }

            .member-chart-head {
                align-items: flex-start;
                flex-direction: column;
            }
        }

    
        .member-stat-number {
            white-space: nowrap;
        }

        .member-stat-number:not(.rate)::after {
            content: "";
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
                            <spring:message code="side.main4" text="통계"/>
                        </a>
                    </li>

                    <li class="breadcrumb-item active">
                        <spring:message code="side.main4.sub1" text="회원통계"/>
                    </li>
                </ol>

                <h3 class="rix-title">회원통계</h3>
            </div>

            <form name="frmSearch"
                  id="frmSearch"
                  class="formUserList">

                <input type="hidden"
                       name="platformType"
                       value="${searchValue.platformType}">

                <input type="hidden"
                       class="selday"
                       name="selday"
                       value="${empty searchValue.selday ? '30' : searchValue.selday}">

                <input type="hidden"
                       class="dayType"
                       name="dayType"
                       value="${empty searchValue.dayType ? '2' : searchValue.dayType}">

                <div class="member-search-box">
                    <div class="member-search-row">

                        <div class="member-search-item">
                            <label class="member-search-label"
                                   for="appCode">
                                앱코드
                            </label>

                            <c:choose>
                                <c:when test="${empty appCode}">
                                    <select id="appCode"
                                            name="appCode"
                                            class="member-search-select">
                                        <option value="">전체</option>

                                        <c:forEach var="appCodeList"
                                                   items="${appVersionList}">
                                            <option value="${appCodeList.sysCode}"
                                                    <c:if test="${tbNoticePlatform.appCode == appCodeList.sysCode}">
                                                        selected
                                                    </c:if>>
                                                    ${appCodeList.codeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </c:when>

                                <c:otherwise>
                                    <input type="text"
                                           class="form-control"
                                           readonly
                                           value="${sessionScope.sessionKey.appCodeName}">

                                    <input type="hidden"
                                           id="appCode"
                                           class="appCode"
                                           name="appCode"
                                           value="${appCode}">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="member-search-item">
                            <span class="member-search-label">
                                기간
                            </span>

                            <div class="member-search-period">
                                <div class="member-search-dates">
                                    <div class="member-search-date">
                                        <input type="text"
                                               class="form-control startDate background-white"
                                               name="startDate"
                                               value="${searchValue.startDate}"
                                               readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>

                                    <span class="member-search-date-divider">~</span>

                                    <div class="member-search-date">
                                        <input type="text"
                                               class="form-control endDate background-white"
                                               name="endDate"
                                               value="${searchValue.endDate}"
                                               readonly>
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                </div>

                                <div class="member-search-period-buttons">
                                    <div class="btn-group"
                                         role="group"
                                         aria-label="최근 기간">

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '30' || empty searchValue.selday}">active</c:if>"
                                                day="30"
                                                data-day="30">
                                            최근 1개월
                                        </button>

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '180'}">active</c:if>"
                                                day="180"
                                                data-day="180">
                                            최근 6개월
                                        </button>

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '360'}">active</c:if>"
                                                day="360"
                                                data-day="360">
                                            최근 1년
                                        </button>

                                        <button type="button"
                                                class="btn btn-white select-day <c:if test="${searchValue.selday == '720'}">active</c:if>"
                                                day="720"
                                                data-day="720">
                                            최근 2년
                                        </button>
                                    </div>

                                    <div class="btn-group"
                                         role="group"
                                         aria-label="조회 단위">

                                        <button type="button"
                                                class="btn btn-white step-day <c:if test="${searchValue.dayType != '1'}">active</c:if>"
                                                day="2"
                                                data-day-type="2">
                                            1일
                                        </button>

                                        <button type="button"
                                                class="btn btn-white step-day <c:if test="${searchValue.dayType == '1'}">active</c:if>"
                                                day="1"
                                                data-day-type="1">
                                            7일
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="member-search-actions">
                            <div class="member-search-view-buttons"
                                 role="tablist"
                                 aria-label="회원통계 화면 선택">

                                <a href="#default-tab-1"
                                   data-toggle="tab"
                                   class="member-search-view-btn active"
                                   role="tab">
                                    <i class="fa fa-list"></i>
                                    <span>기본정보</span>
                                </a>

                                <a href="#default-tab-2"
                                   data-toggle="tab"
                                   class="member-search-view-btn"
                                   role="tab">
                                    <i class="fa fa-chart-line"></i>
                                    <span>통계그래프</span>
                                </a>
                            </div>

                            <button type="button"
                                    id="searchBtn"
                                    class="member-search-submit searchClick"
                                    onclick="serarchForm()">
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

                    <div class="tab-pane fade active show"
                         id="default-tab-1">

                        <div class="member-stat-manager">
                            <section class="member-stat-content">

                                <div class="member-stat-toolbar">
                                    <div class="member-stat-toolbar-left">
                                        <div class="member-stat-summary-buttons">

                                            <button type="button"
                                                    class="member-stat-summary-btn active"
                                                    data-member-stat-type="total">
                                                <i class="fa fa-users"></i>
                                                <span>전체 가입</span>
                                                <strong id="summaryMemberTotal">-</strong>
                                            </button>

                                            <button type="button"
                                                    class="member-stat-summary-btn"
                                                    data-member-stat-type="android">
                                                <i class="fab fa-android"></i>
                                                <span>Android</span>
                                                <strong id="summaryAndroidTotal">-</strong>
                                            </button>

                                            <button type="button"
                                                    class="member-stat-summary-btn"
                                                    data-member-stat-type="ios">
                                                <i class="fab fa-apple"></i>
                                                <span>iOS</span>
                                                <strong id="summaryIosTotal">-</strong>
                                            </button>

                                            <button type="button"
                                                    class="member-stat-summary-btn"
                                                    data-member-stat-type="male">
                                                <i class="fa fa-male"></i>
                                                <span>남성</span>
                                                <strong id="summaryMaleTotal">-</strong>
                                            </button>

                                            <button type="button"
                                                    class="member-stat-summary-btn"
                                                    data-member-stat-type="female">
                                                <i class="fa fa-female"></i>
                                                <span>여성</span>
                                                <strong id="summaryFemaleTotal">-</strong>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="member-stat-toolbar-right">
                                        <div id="memberStatExcelArea"
                                             class="member-stat-excel-area">
                                        </div>

                                        <button type="button"
                                                id="memberStatReloadBtn"
                                                class="member-stat-toolbar-btn"
                                                title="새로고침">
                                            <i class="fa fa-sync"></i>
                                        </button>

                                        <div class="member-stat-current-total">
                                            조회 결과
                                            <strong id="memberStatTotalRowCount">0</strong>
                                            건
                                        </div>
                                    </div>
                                </div>

                                <div class="member-stat-sub-toolbar">
                                    <div class="member-stat-path">
                                        <i class="fa fa-home"></i>
                                        <span>회원통계</span>
                                        <i class="fa fa-angle-right"></i>
                                        <strong>가입 현황</strong>
                                    </div>

                                    <div class="member-stat-selected-info">
                                        <div class="member-stat-date-range">
                                            <i class="fa fa-calendar-day"></i>
                                            <span id="summaryStartDate">${searchValue.startDate}</span>
                                            <span>~</span>
                                            <span id="summaryEndDate">${searchValue.endDate}</span>
                                        </div>

                                        <div class="member-stat-unit-info">
                                            조회 단위
                                            <strong id="memberStatUnitText">
                                                <c:choose>
                                                    <c:when test="${searchValue.dayType == '1'}">
                                                        7일 단위
                                                    </c:when>
                                                    <c:otherwise>
                                                        1일 단위
                                                    </c:otherwise>
                                                </c:choose>
                                            </strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="member-stat-table-wrap">
                                    <table id="testTable"
                                           class="member-stat-table">
                                        <thead>
                                        <tr class="text-center " >
                                            <th rowspan="2" class="text-left border-right-bold">날짜</th>
                                            <th rowspan="2" class="border-right-bold">요일</th>
                                            <th colspan="11" class="border-left-bold">회원통계</th>
                                        </tr>

                                        <tr class="text-center">
                                            <th>회원가입수</th>
                                            <th class="border-left-bold">Android</th>
                                            <th>%</th>
                                            <th>iOS</th>
                                            <th class="border-right-bold">%</th>
                                            <th>남성회원</th>
                                            <th>%</th>
                                            <th>여성회원</th>
                                            <th class="border-right-bold">%</th>
                                            <th>가맹점추천</th>
                                            <th class="border-right-bold">APP가입</th>
                                        </tr>
                                        </thead>

                                        <tbody id="userTbody"></tbody>
                                    </table>
                                </div>

                                <div class="member-stat-footer">
                                    <div>
                                        <i class="fa fa-info-circle m-r-5"></i>
                                        날짜별 회원가입 통계입니다.
                                    </div>

                                    <div>
                                        앱 및 성별 가입 현황을 함께 표시합니다.
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <div class="tab-pane fade"
                         id="default-tab-2">

                        <div class="member-chart-manager">

                            <div class="member-chart-toolbar">
                                <div class="member-chart-toolbar-left">
                                    <div class="member-chart-view-buttons">

                                        <button type="button"
                                                class="member-chart-view-btn active"
                                                data-chart-target="all">
                                            <i class="fa fa-chart-line"></i>
                                            <span>전체 그래프</span>
                                        </button>

                                        <button type="button"
                                                class="member-chart-view-btn"
                                                data-chart-target="trend">
                                            <i class="fa fa-users"></i>
                                            <span>가입 추이</span>
                                        </button>

                                        <button type="button"
                                                class="member-chart-view-btn"
                                                data-chart-target="os">
                                            <i class="fa fa-mobile-alt"></i>
                                            <span>OS별 가입</span>
                                        </button>

                                        <button type="button"
                                                class="member-chart-view-btn"
                                                data-chart-target="gender">
                                            <i class="fa fa-venus-mars"></i>
                                            <span>성별 가입</span>
                                        </button>
                                    </div>
                                </div>

                                <div class="member-chart-toolbar-right">
                                    <button type="button"
                                            id="memberChartReloadBtn"
                                            class="member-stat-toolbar-btn"
                                            title="그래프 새로고침">
                                        <i class="fa fa-sync"></i>
                                    </button>

                                    <div class="member-stat-current-total">
                                        조회 기간
                                        <strong id="memberChartPeriodText">-</strong>
                                    </div>
                                </div>
                            </div>

                            <div class="member-chart-sub-toolbar">
                                <div class="member-stat-path">
                                    <i class="fa fa-home"></i>
                                    <span>회원통계</span>
                                    <i class="fa fa-angle-right"></i>
                                    <strong id="memberChartCurrentName">
                                        전체 그래프
                                    </strong>
                                </div>

                                <div class="member-stat-selected-info">
                                    <div class="member-stat-date-range">
                                        <i class="fa fa-calendar-day"></i>
                                        <span id="memberChartStartDate">${searchValue.startDate}</span>
                                        <span>~</span>
                                        <span id="memberChartEndDate">${searchValue.endDate}</span>
                                    </div>

                                    <div class="member-stat-unit-info">
                                        조회 단위
                                        <strong id="memberChartUnitText">
                                            <c:choose>
                                                <c:when test="${searchValue.dayType == '1'}">
                                                    7일 단위
                                                </c:when>
                                                <c:otherwise>
                                                    1일 단위
                                                </c:otherwise>
                                            </c:choose>
                                        </strong>
                                    </div>
                                </div>
                            </div>

                            <div class="member-chart-content">
                                <div class="member-chart-layout">

                                    <div class="member-chart-box is-wide"
                                         data-chart-panel="trend">

                                        <div class="member-chart-head">
                                            <div>
                                                <div class="member-chart-title">
                                                    회원가입 추이
                                                </div>
                                                <div class="member-chart-desc">
                                                    기간별 회원가입수, 가맹점추천, APP가입 현황
                                                </div>
                                            </div>

                                            <div class="member-trend-controls">
                                                <button type="button"
                                                        class="member-trend-btn active"
                                                        data-trend-type="all">
                                                    전체
                                                </button>

                                                <button type="button"
                                                        class="member-trend-btn"
                                                        data-trend-type="total">
                                                    회원가입수
                                                </button>

                                                <button type="button"
                                                        class="member-trend-btn"
                                                        data-trend-type="recommend">
                                                    가맹점추천
                                                </button>

                                                <button type="button"
                                                        class="member-trend-btn"
                                                        data-trend-type="app">
                                                    APP가입
                                                </button>
                                            </div>
                                        </div>

                                        <div class="member-chart-body member-chart-body-wide">
                                            <canvas id="line-chart"></canvas>
                                        </div>
                                    </div>

                                    <div class="member-chart-box"
                                         data-chart-panel="os">

                                        <div class="member-chart-head">
                                            <div>
                                                <div class="member-chart-title">
                                                    OS별 가입
                                                </div>
                                                <div class="member-chart-desc">
                                                    Android / iOS 가입 비교
                                                </div>
                                            </div>

                                            <div class="member-chart-head-meta">
                                                <i class="fa fa-mobile-alt"></i>
                                                OS 분석
                                            </div>
                                        </div>

                                        <div class="member-chart-body">
                                            <canvas id="radar-chart"></canvas>
                                        </div>
                                    </div>

                                    <div class="member-chart-box"
                                         data-chart-panel="gender">

                                        <div class="member-chart-head">
                                            <div>
                                                <div class="member-chart-title">
                                                    성별 가입
                                                </div>
                                                <div class="member-chart-desc">
                                                    남성 / 여성 회원 비교
                                                </div>
                                            </div>

                                            <div class="member-chart-head-meta">
                                                <i class="fa fa-venus-mars"></i>
                                                성별 분석
                                            </div>
                                        </div>

                                        <div class="member-chart-body">
                                            <canvas id="radar-chart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="member-stat-footer">
                                <div>
                                    <i class="fa fa-info-circle m-r-5"></i>
                                    검색 조건에 따른 회원가입 통계 그래프입니다.
                                </div>

                                <div id="memberChartFooterUnit">
                                    1일 단위
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade"
                         id="default-tab-3">
                        <div id="map"></div>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${path}/assets/plugins/chart.js/dist/Chart.min_new.js"></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"/>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>

<script>
    window.maplocation = false;
    window.__SIDO_VALUE_MAP = window.__SIDO_VALUE_MAP || null;

    function renderGeo() {
        if (window.maplocation) return;
        window.maplocation = true;

        if (window.__koreaMap) {
            try {
                window.__koreaMap.remove();
            } catch (e) {}

            window.__koreaMap = null;

            const el = document.getElementById('map');
            if (el) el.innerHTML = '';
        }

        const map = L.map('map', {
            zoomControl: true,
            scrollWheelZoom: true
        }).setView([36.5, 127.9], 7);

        window.__koreaMap = map;

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 18,
            attribution: '&copy; OpenStreetMap'
        }).addTo(map);

        const SIDO_CENTER = {
            '서울특별시': [37.5665, 126.9780],
            '부산광역시': [35.1796, 129.0756],
            '대구광역시': [35.8714, 128.6014],
            '인천광역시': [37.4563, 126.7052],
            '광주광역시': [35.1595, 126.8526],
            '대전광역시': [36.3504, 127.3845],
            '울산광역시': [35.5384, 129.3114],
            '세종특별자치시': [36.4800, 127.2890],
            '경기도': [37.4138, 127.5183],
            '강원특별자치도': [37.8228, 128.1555],
            '충청북도': [36.6357, 127.4914],
            '충청남도': [36.5184, 126.8000],
            '전북특별자치도': [35.7175, 127.1530],
            '전라남도': [34.8679, 126.9910],
            '경상북도': [36.4919, 128.8889],
            '경상남도': [35.4606, 128.2132],
            '제주특별자치도': [33.4996, 126.5312]
        };

        const valueMap = window.__SIDO_VALUE_MAP || {
            '서울특별시': 1200,
            '경기도': 1800,
            '부산광역시': 700,
            '대구광역시': 400,
            '인천광역시': 500,
            '광주광역시': 250,
            '대전광역시': 300,
            '울산광역시': 200,
            '세종특별자치시': 100,
            '강원특별자치도': 220,
            '충청북도': 240,
            '충청남도': 330,
            '전북특별자치도': 210,
            '전라남도': 260,
            '경상북도': 380,
            '경상남도': 540,
            '제주특별자치도': 150
        };

        function radiusByValue(v) {
            const r = Math.sqrt(Math.max(0, Number(v) || 0));
            return Math.max(8, Math.min(28, r));
        }

        Object.keys(SIDO_CENTER).forEach((name) => {
            const latlng = SIDO_CENTER[name];
            const value = valueMap[name] || 0;

            L.circleMarker(latlng, {
                radius: radiusByValue(value),
                fillColor: '#2563eb',
                color: '#1e40af',
                weight: 1,
                fillOpacity: 0.65
            }).addTo(map).bindTooltip(
                String(name) + '<br/><b>' + Number(value).toLocaleString() + '명</b>',
                {
                    sticky: true,
                    direction: 'top',
                    opacity: 0.95
                }
            );

            const divIcon = L.divIcon({
                html:
                    '<div style="'
                    + 'background: rgba(17,18,23,0.92);'
                    + 'color: #fff;'
                    + 'padding: 6px 10px;'
                    + 'font-size: 12px;'
                    + 'font-weight: 700;'
                    + 'line-height: 1.25;'
                    + 'box-shadow: 0 10px 24px rgba(0,0,0,0.20);'
                    + 'white-space: nowrap;'
                    + '">'
                    + String(name) + '<br>' + Number(value).toLocaleString() + '명'
                    + '</div>',
                className: '',
                iconSize: null
            });

            L.marker(latlng, {
                icon: divIcon,
                interactive: true
            }).addTo(map);
        });
    }

    function refreshGeo(nextValueMap) {
        if (nextValueMap) window.__SIDO_VALUE_MAP = nextValueMap;
        window.maplocation = false;
        renderGeo();
    }
</script>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    let table = null;

    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            } else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    var newExportAction = function (e, dt, button, config) {
        let startDate = $(".startDate").val();
        let endDate = $(".endDate").val();

        if (getDateDiff(startDate, endDate) > 31) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        }

        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;

        dt.one('preXhr', function (e, s, data) {
            data.start = 0;
            data.length = 2147483647;

            dt.one('preDraw', function (e, settings) {
                oldExportAction(self, e, dt, button, config);

                dt.one('preXhr', function (e, s, data) {
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });

                setTimeout(dt.ajax.reload, 0);
                return false;
            });
        });

        dt.ajax.reload();
    };

    let label = [];
    let totalCnt = [];
    let iosTotal = [];
    let iosCnt = 0;
    let maleCnt = [];
    let femaleCnt = [];
    let extRecommStCodeCntF = [];
    let extAppUserCntF = [];
    let totalMaleCnt = [];
    let totalFemaleCnt = [];
    let androidTotal = [];
    let androidCnt = 0;
    let phoneTotal = [];
    let pointSize = 4;

    let lineChart = null;
    let radarChart = null;
    let radarChart2 = null;

    let selectedMemberTrendType = 'all';

    const MEMBER_TREND_TYPE_MAP = {
        all: {
            name: '전체',
            datasetIndexes: [0, 1, 2]
        },
        total: {
            name: '회원가입수',
            datasetIndexes: [0]
        },
        recommend: {
            name: '가맹점추천',
            datasetIndexes: [1]
        },
        app: {
            name: 'APP가입',
            datasetIndexes: [2]
        }
    };

    Chart.defaults.color = COLOR_DARK_LIGHTER;
    Chart.defaults.font.family = 'Nanum Gothic',"나눔 고딕",'NanumGothic',"나눔고딕",'Malgun Gothic','맑은 고딕','MalgunGothic','맑은고딕';
    Chart.defaults.font.weight = 500;

    function createCharts() {
        var genderCtx = document.getElementById('radar-chart2').getContext('2d');
        radarChart = new Chart(genderCtx, {
            type: 'bar',
            data: {
                labels: ['성별 구분'],
                datasets: [{
                    label: '남성회원',
                    borderColor: [COLOR_AQUA_TRANSPARENT_7],
                    pointRadius: 4,
                    borderWidth: 2,
                    pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                    backgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                    data: totalMaleCnt
                }, {
                    label: '여성회원',
                    borderColor: [COLOR_GREEN_TRANSPARENT_7],
                    pointRadius: 4,
                    borderWidth: 2,
                    pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                    backgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                    data: totalFemaleCnt
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                resizeDelay: 100,
                layout: {
                    padding: {
                        top: 4,
                        right: 4,
                        bottom: 0,
                        left: 0
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            },
                            boxWidth: 12,
                            padding: 10
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';

                                if (label) {
                                    label += ': ';
                                }

                                if (context.parsed.y !== null) {
                                    label += Number(context.parsed.y).toLocaleString() + '명';
                                }

                                return label;
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
                            font: {
                                size: 11
                            }
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            font: {
                                size: 11
                            },
                            callback: function(value) {
                                return Number(value).toLocaleString() + '명';
                            }
                        }
                    }
                }
            }
        });

        var osCtx = document.getElementById('radar-chart').getContext('2d');
        radarChart2 = new Chart(osCtx, {
            type: 'bar',
            data: {
                labels: ['OS별 구분'],
                datasets: [{
                    label: 'iOS',
                    borderColor: [COLOR_AQUA_TRANSPARENT_7],
                    pointRadius: 4,
                    borderWidth: 2,
                    pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                    backgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                    data: iosTotal
                }, {
                    label: 'Android',
                    borderColor: [COLOR_GREEN_TRANSPARENT_7],
                    pointRadius: 4,
                    borderWidth: 2,
                    pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                    backgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                    data: androidTotal
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                resizeDelay: 100,
                layout: {
                    padding: {
                        top: 4,
                        right: 4,
                        bottom: 0,
                        left: 0
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            },
                            boxWidth: 12,
                            padding: 10
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';

                                if (label) {
                                    label += ': ';
                                }

                                if (context.parsed.y !== null) {
                                    label += Number(context.parsed.y).toLocaleString() + '명';
                                }

                                return label;
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
                            font: {
                                size: 11
                            }
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            font: {
                                size: 11
                            },
                            callback: function(value) {
                                return Number(value).toLocaleString() + '명';
                            }
                        }
                    }
                }
            }
        });

        var lineCtx = document.getElementById('line-chart').getContext('2d');
        lineChart = new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: label,
                datasets: [{
                    label: '회원가입수',
                    borderColor: COLOR_GREY,
                    pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                    pointRadius: pointSize,
                    borderWidth: 2,
                    backgroundColor: COLOR_GREY_TRANSPARENT_1,
                    tension: 0,
                    data: totalCnt
                }, {
                    label: '가맹점추천',
                    borderColor: COLOR_AQUA,
                    pointBackgroundColor: COLOR_AQUA_TRANSPARENT_6,
                    pointRadius: pointSize,
                    borderWidth: 2,
                    backgroundColor: COLOR_AQUA_TRANSPARENT_1,
                    tension: 0,
                    data: extRecommStCodeCntF
                }, {
                    label: 'APP가입',
                    borderColor: COLOR_RED_LIGHTER,
                    pointBackgroundColor: COLOR_RED_TRANSPARENT_6,
                    pointRadius: pointSize,
                    borderWidth: 2,
                    backgroundColor: COLOR_RED_TRANSPARENT_1,
                    tension: 0,
                    data: extAppUserCntF
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                resizeDelay: 100,
                layout: {
                    padding: {
                        top: 4,
                        right: 8,
                        bottom: 0,
                        left: 0
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            },
                            boxWidth: 12,
                            padding: 10
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';

                                if (label) {
                                    label += ': ';
                                }

                                if (context.parsed.y !== null) {
                                    label += Number(context.parsed.y).toLocaleString() + '명';
                                }

                                return label;
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
                            font: {
                                size: 10
                            },
                            autoSkip: true,
                            maxTicksLimit: 8,
                            maxRotation: 45,
                            minRotation: 45,
                            callback: function(value, index) {
                                const labelValue = this.getLabelForValue(value);

                                // 7일 단위: "2026-06-01 ~ 2026-06-07" 형태면 앞 날짜만 짧게 표시
                                if (String(labelValue).indexOf('~') > -1) {
                                    const startDate = String(labelValue).split('~')[0].trim();
                                    return startDate.substring(5); // "06-01"
                                }

                                // 1일 단위: "2026-06-01" -> "06-01"
                                if (String(labelValue).length >= 10) {
                                    return String(labelValue).substring(5);
                                }

                                return labelValue;
                            }
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            font: {
                                size: 11
                            },
                            callback: function(value) {
                                return Number(value).toLocaleString() + '명';
                            }
                        }
                    }
                }
            }
        });

        applySelectedMemberTrendType();
    }

    function applySelectedMemberTrendType() {
        if (
            !lineChart
            || !lineChart.data
            || !Array.isArray(lineChart.data.datasets)
        ) {
            return;
        }

        const typeInfo =
            MEMBER_TREND_TYPE_MAP[
                selectedMemberTrendType
            ] || MEMBER_TREND_TYPE_MAP.all;

        lineChart.data.datasets.forEach(
            function(dataset, index) {
                dataset.hidden =
                    typeInfo.datasetIndexes
                        .indexOf(index) < 0;
            }
        );

        lineChart.update();
    }

    $(document).on(
        'click',
        '.member-trend-btn',
        function() {
            selectedMemberTrendType =
                $(this).attr('data-trend-type')
                || 'all';

            $('.member-trend-btn')
                .removeClass('active');

            $(this).addClass('active');

            applySelectedMemberTrendType();
        }
    );

    function resizeCharts() {
        setTimeout(function () {
            if (lineChart) {
                lineChart.resize();
                lineChart.update();
            }

            if (radarChart) {
                radarChart.resize();
                radarChart.update();
            }

            if (radarChart2) {
                radarChart2.resize();
                radarChart2.update();
            }
        }, 100);
    }

    function searchUserList() {
        let req = convertFormToObj($('form.formUserList'));

        label = [];
        totalCnt = [];
        maleCnt = [];
        femaleCnt = [];
        extRecommStCodeCntF = [];
        extAppUserCntF = [];
        totalMaleCnt = [];
        totalFemaleCnt = [];
        iosTotal = [];
        iosCnt = 0;
        androidCnt = 0;
        androidTotal = [];

        $.ajax({
            type: "POST",
            url: "${path}/api/user/chart/list",
            contentType: "application/json;",
            async: false,
            data: JSON.stringify(req),
            dataType: "json",
            success: function(data) {
                let totalMaleCntF = 0;
                let totalFemaleCntF = 0;
                let dayType = $(".dayType").val();

                for (var i = 0; i < data.timeList.length; i++) {
                    if (dayType == "1") {
                        label.push(data.timeList[i].start + " ~ " + data.timeList[i].end);
                    } else {
                        label.push(data.timeList[i].yyyymmdd);
                    }

                    totalCnt.push(data.timeList[i].totalCnt);
                    maleCnt.push(data.timeList[i].maleCnt);
                    femaleCnt.push(data.timeList[i].femaleCnt);
                    extRecommStCodeCntF.push(data.timeList[i].extRecommStCodeCnt);
                    extAppUserCntF.push(data.timeList[i].extAppUserCnt);

                    totalMaleCntF = totalMaleCntF + data.timeList[i].maleCnt;
                    totalFemaleCntF = totalFemaleCntF + data.timeList[i].femaleCnt;

                    iosCnt = iosCnt + data.timeList[i].iosCnt;
                    androidCnt = androidCnt + data.timeList[i].androidCnt;
                }

                totalMaleCnt.push(totalMaleCntF);
                totalFemaleCnt.push(totalFemaleCntF);
                iosTotal.push(iosCnt);
                androidTotal.push(androidCnt);

                if (data.timeList.length > 40) {
                    pointSize = 0;
                } else {
                    pointSize = 4;
                }

                if (!lineChart || !radarChart || !radarChart2) {
                    createCharts();
                }

                radarChart.data = {
                    labels: ['성별 구분'],
                    datasets: [{
                        label: '남성회원',
                        borderColor: [COLOR_AQUA_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                        backgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                        data: totalMaleCnt
                    }, {
                        label: '여성회원',
                        borderColor: [COLOR_GREEN_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                        backgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                        data: totalFemaleCnt
                    }]
                };

                radarChart2.data = {
                    labels: ['OS별 구분'],
                    datasets: [{
                        label: 'iOS',
                        borderColor: [COLOR_AQUA_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                        backgroundColor: [COLOR_AQUA_TRANSPARENT_3],
                        data: iosTotal
                    }, {
                        label: 'Android',
                        borderColor: [COLOR_GREEN_TRANSPARENT_7],
                        pointRadius: 4,
                        borderWidth: 2,
                        pointBackgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                        backgroundColor: [COLOR_GREEN_TRANSPARENT_3],
                        data: androidTotal
                    }]
                };

                lineChart.data = {
                    labels: label,
                    datasets: [{
                        label: '회원가입수',
                        borderColor: COLOR_GREY,
                        pointBackgroundColor: COLOR_GREY_TRANSPARENT_6,
                        pointRadius: pointSize,
                        borderWidth: 2,
                        backgroundColor: COLOR_GREY_TRANSPARENT_1,
                        tension: 0,
                        data: totalCnt
                    }, {
                        label: '가맹점추천',
                        borderColor: COLOR_AQUA,
                        pointBackgroundColor: COLOR_AQUA_TRANSPARENT_6,
                        pointRadius: pointSize,
                        borderWidth: 2,
                        backgroundColor: COLOR_AQUA_TRANSPARENT_1,
                        tension: 0,
                        data: extRecommStCodeCntF
                    }, {
                        label: 'APP가입',
                        borderColor: COLOR_RED_LIGHTER,
                        pointBackgroundColor: COLOR_RED_TRANSPARENT_6,
                        pointRadius: pointSize,
                        borderWidth: 2,
                        backgroundColor: COLOR_RED_TRANSPARENT_1,
                        tension: 0,
                        data: extAppUserCntF
                    }]
                };

                applySelectedMemberTrendType();
                resizeCharts();
            }
        });
    }

    function serarchForm() {
        if (lineChart) {
            lineChart.data.labels = [];
            lineChart.data.datasets.forEach((dataset) => {
                dataset.data = [];
            });
        }

        if (radarChart) {
            radarChart.data.labels = [];
            radarChart.data.datasets.forEach((dataset) => {
                dataset.data = [];
            });
        }

        if (radarChart2) {
            radarChart2.data.labels = [];
            radarChart2.data.datasets.forEach((dataset) => {
                dataset.data = [];
            });
        }

        searchUserList();

        var numCols = table.columns().nodes().length;
        for (var i = 0; i < numCols; i++) {
            table.column(i).search('');
        }

        table.column().draw();

        if (typeof refreshGeo === 'function') {
            refreshGeo();
        }
    }

    function lastWeek() {
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth - 7);
        return getDateStr(d);
    }

    function lastMonth() {
        var d = new Date();
        var monthOfYear = d.getMonth();
        d.setMonth(monthOfYear - 1);
        return getDateStr(d);
    }

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        resizeCharts();

        if ($(e.target).attr('href') === '#default-tab-3' && !maplocation) {
            renderGeo();
        }
    });

    $(() => {
        let hideDw = {};

        if ($(".dayType").val() == "1") {
            hideDw = {
                targets: [1],
                visible: false
            };
        } else {
            hideDw = {
                targets: [1],
                visible: true
            };
        }

        let downloadAble = `${downloadAble}`;
        let roleType = `${sessionScope.sessionKey.roleType}`;
        let downloadChk = "1";

        if (roleType != 0) {
            if (downloadAble == 1) {
                downloadChk = "";
            }
        } else {
            downloadChk = "";
        }

        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/user/chart/page", "A6", downloadChk, false, {
            columns: [
                {data: "yyyymmdd"},
                {data: "dw"},
                {data: "totalCnt"},
                {data: "androidCnt"},
                {data: "androidPer"},
                {data: "iosCnt"},
                {data: "iosPer"},
                {data: "maleCnt"},
                {data: "malePer"},
                {data: "femaleCnt"},
                {data: "femalePer"},
                {data: "extRecommStCodeCnt"},
                {data: "extAppUserCnt"}
            ],
            columnDefs: [
                {
                    targets: "_all",
                    className: "text-center"
                },
                hideDw,
                {
                    targets: [2, 3, 7, 11],
                    visible: true,
                    className: "border-left-bold"
                },
                {
                    targets: [2, 3, 5, 7, 9, 11, 12],
                    render: function (data) {
                        if (data) {
                            return data + "명";
                        } else {
                            return "0 명";
                        }
                    }
                },
                {
                    targets: [1],
                    render: function (data) {
                        if (data == "1") {
                            return '일요일';
                        } else if (data == "2") {
                            return '월요일';
                        } else if (data == "3") {
                            return '화요일';
                        } else if (data == "4") {
                            return '수요일';
                        } else if (data == "5") {
                            return '목요일';
                        } else if (data == "6") {
                            return '금요일';
                        } else if (data == "7") {
                            return '토요일';
                        }

                        return "";
                    }
                },
                {
                    targets: [4, 6, 8, 10],
                    render: function (data) {
                        if (data) {
                            return data + "%";
                        } else {
                            return "0%";
                        }
                    }
                },
                {
                    targets: [12],
                    className: "border-right-bold"
                }
            ]
        });

        $("#testTable_filter").text("");

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

        $(".select-day").on("click", function() {
            $(".select-day").removeClass("active");

            var day = $(this).attr("day");
            var d = new Date();
            var dayOfMonth = d.getDate();

            d.setDate(dayOfMonth - day);

            $(".startDate").datepicker('setDate', d);
            $(".selday").val(day);
            $(this).addClass("active");
        });

        $(".step-day").on("click", function() {
            $(".step-day").removeClass("active");

            $(".dayType").val($(this).attr("day"));
            $(this).addClass("active");

            if ($(".dayType").val() == "1") {
                table.columns(1).visible(false);
            } else {
                table.columns(1).visible(true);
            }

            var numCols = table.columns().nodes().length;
            for (var i = 0; i < numCols; i++) {
                table.column(i).search('');
            }

            table.column().draw();

            if (lineChart) {
                lineChart.data.labels = [];
                lineChart.data.datasets.forEach((dataset) => {
                    dataset.data = [];
                });
            }

            if (radarChart) {
                radarChart.data.labels = [];
                radarChart.data.datasets.forEach((dataset) => {
                    dataset.data = [];
                });
            }

            if (radarChart2) {
                radarChart2.data.labels = [];
                radarChart2.data.datasets.forEach((dataset) => {
                    dataset.data = [];
                });
            }

            searchUserList();
        });

        var day = $(".selday").val();

        if (!day) {
            day = 30;
        }

        let date = new Date();
        let yesterDay = new Date();
        var d = new Date();
        var dayOfMonth = d.getDate();

        d.setDate(dayOfMonth - day);
        yesterDay.setDate(yesterDay.getDate() - 1);

        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";

        if (startDate == "") {
            $(".startDate").datepicker('setDate', d);
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

        if (endDate == "") {
            $(".endDate").datepicker('setDate', yesterDay);
        } else {
            $(".endDate").datepicker('setDate', endDate);
        }

        $(".detailRow").click(function() {
            location.href = "${path}/settlement/mannashopgrp/detail";
        });

        $(".excel_form_btn").click(function() {
            location.href = "${path}/merchant/uploadexcel/excelform";
        });

        searchUserList();
    });
</script>
</body>
</html>

<script>
    $(document).on('shown.bs.tab', 'a[data-toggle="tab"]', function () {
        $('.member-search-view-btn').removeClass('active');
        $(this).addClass('active');
    });

    $(document).on('click', '#memberStatReloadBtn', function () {
        serarchForm();
    });

    $(document).on('click', '.select-day', function () {
        const day = $(this).attr('day') || $(this).data('day');
        $('.selday').val(day);
        $('.select-day').removeClass('active');
        $(this).addClass('active');
    });

    $(document).on('click', '.step-day', function () {
        const dayType = $(this).attr('day') || $(this).data('day-type');
        $('.dayType').val(dayType);
        $('.step-day').removeClass('active');
        $(this).addClass('active');

        $('#memberStatUnitText').text(
            String(dayType) === '1' ? '7일 단위' : '1일 단위'
        );

        window.setTimeout(function () {
            decorateMemberStatTable();
            updateMemberStatSummary();
        }, 80);
    });

    function syncMemberStatHeader() {
        $('#summaryStartDate').text(
            $('.startDate').val() || '-'
        );

        $('#summaryEndDate').text(
            $('.endDate').val() || '-'
        );

        var rowCount = 0;

        try {
            /*
             * DataTables가 초기화된 경우 현재 조회 결과 수 사용
             */
            if (
                $.fn.DataTable
                && $.fn.DataTable.isDataTable('#testTable')
            ) {
                var dataTable =
                    $('#testTable').DataTable();

                rowCount = Number(
                    dataTable
                        .rows({ search: 'applied' })
                        .count() || 0
                );
            } else {
                /*
                 * 초기화 전이거나 별도 방식으로 tbody를 만든 경우
                 * 빈 행을 제외한 실제 행 수 사용
                 */
                rowCount = $('#testTable tbody tr').filter(
                    function () {
                        return (
                            $(this).children('td').length > 1
                            && !$(this).find(
                                '.dataTables_empty'
                            ).length
                        );
                    }
                ).length;
            }
        } catch (e) {
            console.warn(
                '회원통계 조회 건수 계산 오류:',
                e
            );

            rowCount = $('#testTable tbody tr').filter(
                function () {
                    return (
                        $(this).children('td').length > 1
                        && !$(this).find(
                            '.dataTables_empty'
                        ).length
                    );
                }
            ).length;
        }

        $('#memberStatTotalRowCount').text(
            Number(rowCount).toLocaleString()
        );

        var $buttons =
            $('#testTable_wrapper .dt-buttons');

        if (
            $buttons.length
            && !$buttons.parent()
                .is('#memberStatExcelArea')
        ) {
            $('#memberStatExcelArea')
                .empty()
                .append($buttons);

            $buttons.show();
        }
    }

    $(document).ajaxComplete(function () {
        window.setTimeout(syncMemberStatHeader, 50);
    });

    $(document).ready(function () {
        window.setTimeout(syncMemberStatHeader, 300);
    });
</script>


<script>
    function memberStatNumberHtml(value, type) {
        var numberValue = Number(value || 0);
        var className = 'member-stat-number';
        var suffix = '명';

        if (type === 'rate') {
            className += ' rate';
            suffix = '%';
        } else if (type === 'total') {
            className += ' total';
        }

        if (numberValue === 0) {
            className += ' zero';
        }

        var displayValue =
            type === 'rate'
                ? numberValue.toLocaleString()
                : numberValue.toLocaleString();

        return ''
            + '<span class="' + className + '">'
            + displayValue
            + suffix
            + '</span>';
    }

    function memberStatDateHtml(value) {
        if (!value) {
            return '<span class="member-stat-number zero">-</span>';
        }

        var text = String(value);
        var parts = text.split('-');
        var subText = parts.length === 3
            ? parts[0] + '년'
            : '';

        return ''
            + '<div class="member-stat-date-cell">'
            + '  <span class="member-stat-date-icon">'
            + '    <i class="fas fa-calendar-alt"></i>'
            + '  </span>'
            + '  <span class="member-stat-date-text">'
            + '    <span class="member-stat-date-main">' + text + '</span>'
            + '    <span class="member-stat-date-sub">' + subText + '</span>'
            + '  </span>'
            + '</div>';
    }

    function memberStatDayHtml(value) {
        return '<span class="member-stat-day-badge">'
            + (value || '-')
            + '</span>';
    }

    /*
     * 기존 DataTables 생성 후 셀 내용만 관리자형 스타일로 보정
     */
    function decorateMemberStatTable() {
        var isWeekly = String($('.dayType').val()) === '1';
        var $rows = $('#testTable tbody tr');

        $rows.each(function () {
            var $cells = $(this).children('td');

            /*
             * 1일 단위: 요일 포함 13개
             * 7일 단위: 요일 숨김 12개
             */
            if (
                (!isWeekly && $cells.length < 13)
                || (isWeekly && $cells.length < 12)
            ) {
                return;
            }

            var dateIndex = 0;
            var dayIndex = isWeekly ? -1 : 1;
            var firstNumberIndex = isWeekly ? 1 : 2;

            if (
                !$cells.eq(dateIndex)
                    .find('.member-stat-date-cell').length
            ) {
                $cells.eq(dateIndex).html(
                    memberStatDateHtml(
                        $cells.eq(dateIndex).text().trim()
                    )
                );
            }

            if (
                dayIndex >= 0
                && !$cells.eq(dayIndex)
                    .find('.member-stat-day-badge').length
            ) {
                $cells.eq(dayIndex).html(
                    memberStatDayHtml(
                        $cells.eq(dayIndex).text().trim()
                    )
                );
            }

            $cells.each(function (visibleIndex) {
                if (visibleIndex < firstNumberIndex) {
                    return;
                }

                var $cell = $(this);

                if ($cell.find('.member-stat-number').length) {
                    return;
                }

                var raw = $cell.text()
                    .replace(/,/g, '')
                    .replace(/명/g, '')
                    .replace(/%/g, '')
                    .trim();

                var value = Number(raw || 0);

                /*
                 * 표시 중인 열 기준 상대 인덱스
                 * 0 totalCnt
                 * 1 androidCnt
                 * 2 androidPer
                 * 3 iosCnt
                 * 4 iosPer
                 * 5 maleCnt
                 * 6 malePer
                 * 7 femaleCnt
                 * 8 femalePer
                 * 9 extRecomm
                 * 10 appJoin
                 */
                var dataIndex =
                    visibleIndex - firstNumberIndex;

                var type = 'number';

                if ([2, 4, 6, 8].indexOf(dataIndex) >= 0) {
                    type = 'rate';
                } else if (dataIndex === 0) {
                    type = 'total';
                }

                $cell.html(
                    memberStatNumberHtml(value, type)
                );
            });

            /*
             * OS 그룹 / 성별 그룹 구분선
             * 요일 열 숨김 여부에 따라 보이는 인덱스가 1칸 이동
             */
            var androidStart = firstNumberIndex + 1;
            var iosEnd = firstNumberIndex + 4;
            var maleStart = firstNumberIndex + 5;
            var femaleEnd = firstNumberIndex + 8;

            $cells.eq(androidStart)
                .addClass('member-stat-cell-group-start');

            $cells.eq(iosEnd)
                .addClass('member-stat-cell-group-end');

            $cells.eq(maleStart)
                .addClass('member-stat-cell-group-start');

            $cells.eq(femaleEnd)
                .addClass('member-stat-cell-group-end');
        });
    }

    function parseMemberStatNumber(value) {
        var normalized = String(value == null ? '' : value)
            .replace(/,/g, '')
            .replace(/명/g, '')
            .replace(/%/g, '')
            .replace(/[^0-9.-]/g, '')
            .trim();

        var numberValue = Number(normalized);

        return Number.isFinite(numberValue)
            ? numberValue
            : 0;
    }


    var selectedMemberStatType = 'total';

    var MEMBER_STAT_COLUMN_OFFSET = {
        total: 0,
        android: 1,
        ios: 3,
        male: 5,
        female: 7
    };

    function highlightSelectedMemberRows() {
        var isWeekly =
            String($('.dayType').val()) === '1';

        var firstNumberIndex =
            isWeekly ? 1 : 2;

        var dataOffset =
            MEMBER_STAT_COLUMN_OFFSET[
                selectedMemberStatType
                ];

        $('#testTable tbody tr')
            .removeClass('member-stat-highlight-row');

        $('#testTable tbody tr').each(function () {
            var $cells = $(this).children('td');

            if (
                (!isWeekly && $cells.length < 13)
                || (isWeekly && $cells.length < 12)
            ) {
                return;
            }

            var value = parseMemberStatNumber(
                $cells.eq(
                    firstNumberIndex + dataOffset
                ).text()
            );

            if (value > 0) {
                $(this).addClass(
                    'member-stat-highlight-row'
                );
            }
        });
    }

    $(document).on(
        'click',
        '.member-stat-summary-btn',
        function () {
            selectedMemberStatType =
                $(this).attr(
                    'data-member-stat-type'
                ) || 'total';

            $('.member-stat-summary-btn')
                .removeClass('active');

            $(this).addClass('active');

            highlightSelectedMemberRows();
        }
    );

    function updateMemberStatSummary() {
        var isWeekly =
            String($('.dayType').val()) === '1';

        var firstNumberIndex =
            isWeekly ? 1 : 2;

        var totals = {
            total: 0,
            android: 0,
            ios: 0,
            male: 0,
            female: 0
        };

        $('#testTable tbody tr').each(function () {
            var $cells = $(this).children('td');

            if (
                (!isWeekly && $cells.length < 13)
                || (isWeekly && $cells.length < 12)
            ) {
                return;
            }

            totals.total += parseMemberStatNumber(
                $cells.eq(firstNumberIndex).text()
            );

            totals.android += parseMemberStatNumber(
                $cells.eq(firstNumberIndex + 1).text()
            );

            totals.ios += parseMemberStatNumber(
                $cells.eq(firstNumberIndex + 3).text()
            );

            totals.male += parseMemberStatNumber(
                $cells.eq(firstNumberIndex + 5).text()
            );

            totals.female += parseMemberStatNumber(
                $cells.eq(firstNumberIndex + 7).text()
            );
        });

        $('#summaryMemberTotal').text(
            totals.total.toLocaleString() + '명'
        );

        $('#summaryAndroidTotal').text(
            totals.android.toLocaleString() + '명'
        );

        $('#summaryIosTotal').text(
            totals.ios.toLocaleString() + '명'
        );

        $('#summaryMaleTotal').text(
            totals.male.toLocaleString() + '명'
        );

        $('#summaryFemaleTotal').text(
            totals.female.toLocaleString() + '명'
        );

        highlightSelectedMemberRows();
    }


    $(document).on('draw.dt', '#testTable', function () {
        decorateMemberStatTable();
        updateMemberStatSummary();
        syncMemberStatHeader();
    });

    $(document).ajaxComplete(function () {
        window.setTimeout(function () {
            decorateMemberStatTable();
            updateMemberStatSummary();
        }, 60);
    });

    $(document).ready(function () {
        window.setTimeout(function () {
            decorateMemberStatTable();
            updateMemberStatSummary();
        }, 350);
    });
</script>


<script>
    function updateMemberChartMeta() {
        var startDate = $('.startDate').val() || '-';
        var endDate = $('.endDate').val() || '-';
        var dayType = String($('.dayType').val());
        var unitText = dayType === '1'
            ? '7일 단위'
            : '1일 단위';

        $('#memberChartStartDate').text(startDate);
        $('#memberChartEndDate').text(endDate);
        $('#memberChartPeriodText').text(
            startDate + ' ~ ' + endDate
        );
        $('#memberChartUnitText').text(unitText);
        $('#memberChartFooterUnit').text(unitText);
    }

    function resizeMemberCharts() {
        window.setTimeout(function () {
            if (
                window.lineChart
                && typeof window.lineChart.resize === 'function'
            ) {
                window.lineChart.resize();
            }

            if (
                window.radarChart
                && typeof window.radarChart.resize === 'function'
            ) {
                window.radarChart.resize();
            }

            if (
                window.radarChart2
                && typeof window.radarChart2.resize === 'function'
            ) {
                window.radarChart2.resize();
            }
        }, 80);
    }

    $(document).on(
        'click',
        '.member-chart-view-btn',
        function () {
            var target =
                $(this).attr('data-chart-target')
                || 'all';

            $('.member-chart-view-btn')
                .removeClass('active');

            $(this).addClass('active');

            $('.member-chart-box')
                .removeClass(
                    'chart-panel-hidden chart-panel-focused'
                );

            if (target !== 'all') {
                $('.member-chart-box').each(function () {
                    var panel =
                        $(this).attr('data-chart-panel');

                    if (panel === target) {
                        $(this).addClass(
                            'chart-panel-focused'
                        );
                    } else {
                        $(this).addClass(
                            'chart-panel-hidden'
                        );
                    }
                });
            }

            var currentName =
                $(this).find('span').text().trim();

            $('#memberChartCurrentName')
                .text(currentName);

            resizeMemberCharts();
        }
    );

    $(document).on(
        'click',
        '#memberChartReloadBtn',
        function () {
            serarchForm();
        }
    );

    $(document).on(
        'shown.bs.tab',
        'a[href="#default-tab-2"]',
        function () {
            updateMemberChartMeta();
            resizeMemberCharts();
        }
    );

    $(document).ajaxComplete(function () {
        updateMemberChartMeta();
    });

    $(document).ready(function () {
        updateMemberChartMeta();
    });
</script>
