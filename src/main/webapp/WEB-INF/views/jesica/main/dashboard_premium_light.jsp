<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>

    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <%@include file="common/include_head.jsp" %>

    <c:choose>
        <c:when test="${sessionScope.sessionKey.company == 'jesicar'}">
            <title>
                Jesicar |
                <spring:message
                        code="dashboard.normalaffiliateheadquarters"
                        text="대시보드"
                />
            </title>
        </c:when>

        <c:when test="${sessionScope.sessionKey.company == 'yangpa'}">
            <title>
                온동네 |
                <spring:message
                        code="dashboard.normalaffiliateheadquarters"
                        text="대시보드"
                />
            </title>
        </c:when>

        <c:otherwise>
            <title>
                관리자 |
                <spring:message
                        code="dashboard.normalaffiliateheadquarters"
                        text="대시보드"
                />
            </title>
        </c:otherwise>
    </c:choose>

    <style>
        :root {
            --db-bg: #f2f4f7;
            --db-surface: #ffffff;
            --db-surface-2: #f8f9fb;
            --db-line: #dde2e8;
            --db-line-strong: #cbd2da;
            --db-ink: #1f2933;
            --db-ink-2: #53606d;
            --db-muted: #8a96a3;
            --db-blue: #2176d2;
            --db-cyan: #079a9a;
            --db-amber: #d88a12;
            --db-violet: #6658b8;
            --db-red: #d94b52;
            --db-shadow: 0 6px 18px rgba(31, 41, 51, 0.055);
        }

        html,
        body {
            height: 100%;
        }

        body {
            overflow: hidden;
            background: var(--db-bg);
        }

        #page-container {
            height: 100vh;
            overflow: hidden;
        }

        #content.premium-dashboard {
            display: flex;
            flex-direction: column;
            height: calc(100vh - 54px);
            min-height: 0;
            padding: 14px 18px 12px;
            overflow: hidden;
            background:
                linear-gradient(180deg, #f7f8fa 0, var(--db-bg) 160px);
        }

        .pd-shell {
            display: grid;
            flex: 1 1 auto;
            grid-template-rows: auto auto minmax(0, 1fr) minmax(150px, 0.48fr);
            gap: 10px;
            min-height: 0;
        }

        /* header */
        .pd-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
            min-height: 54px;
        }

        .pd-heading {
            min-width: 0;
        }

        .pd-title-line {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .pd-title-mark {
            width: 4px;
            height: 22px;
            background: var(--db-blue);
        }

        .pd-title {
            margin: 0;
            color: var(--db-ink);
            font-size: 21px;
            font-weight: 800;
            letter-spacing: -0.6px;
        }

        .pd-live-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            height: 22px;
            padding: 0 8px;
            border: 1px solid rgba(7, 154, 154, 0.24);
            background: rgba(7, 154, 154, 0.07);
            color: var(--db-cyan);
            font-size: 9px;
            font-weight: 800;
        }

        .pd-live-dot {
            width: 5px;
            height: 5px;
            background: var(--db-cyan);
            animation: pdPulse 1.8s ease-in-out infinite;
        }

        @keyframes pdPulse {
            0%, 100% { opacity: 0.35; }
            50% { opacity: 1; }
        }

        .pd-description {
            margin-top: 5px;
            color: var(--db-muted);
            font-size: 10px;
            font-weight: 600;
        }

        .pd-actions {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .pd-field {
            display: flex;
            align-items: center;
            height: 34px;
            border: 1px solid var(--db-line);
            background: var(--db-surface);
        }

        .pd-field-label {
            padding: 0 9px;
            border-right: 1px solid var(--db-line);
            color: var(--db-muted);
            font-size: 9px;
            font-weight: 800;
            white-space: nowrap;
        }

        .pd-brand-select {
            width: 160px;
            height: 32px;
            padding: 2px 8px;
            border: 0;
            border-radius: 0;
            background: transparent;
            color: var(--db-ink);
            font-size: 10px;
            font-weight: 700;
        }

        .pd-brand-select:focus {
            box-shadow: none;
        }

        .pd-period {
            display: flex;
            align-items: center;
            gap: 7px;
            height: 34px;
            padding: 0 11px;
            border: 1px solid var(--db-line);
            background: var(--db-surface);
            color: var(--db-ink-2);
            font-size: 10px;
        }

        .pd-period i {
            color: var(--db-blue);
        }

        .pd-period strong {
            color: var(--db-ink);
            font-weight: 800;
        }

        .pd-refresh {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            height: 34px;
            padding: 0 13px;
            border: 1px solid #1d68b7;
            border-radius: 0;
            background: var(--db-blue);
            color: #fff;
            font-size: 10px;
            font-weight: 800;
        }

        .pd-refresh:hover,
        .pd-refresh:focus {
            background: #1d68b7;
            color: #fff;
        }

        .pd-refresh.is-loading i {
            animation: pdSpin 0.8s linear infinite;
        }

        @keyframes pdSpin {
            to { transform: rotate(360deg); }
        }

        .pd-error {
            display: none;
            padding: 8px 10px;
            border: 1px solid rgba(217, 75, 82, 0.28);
            background: rgba(217, 75, 82, 0.06);
            color: #b63c43;
            font-size: 10px;
            font-weight: 700;
        }

        .pd-error.is-visible {
            display: block;
        }

        /* KPI */
        .pd-kpi-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 8px;
        }

        .pd-kpi {
            position: relative;
            display: grid;
            grid-template-columns: 40px minmax(0, 1fr) auto;
            align-items: center;
            min-width: 0;
            min-height: 76px;
            padding: 10px 12px;
            border: 1px solid var(--db-line);
            background: var(--db-surface);
            box-shadow: var(--db-shadow);
        }

        .pd-kpi::after {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            height: 2px;
            content: '';
            background: var(--accent);
            transform: scaleX(0.24);
            transform-origin: left;
            transition: transform 0.22s ease;
        }

        .pd-kpi:hover::after {
            transform: scaleX(1);
        }

        .pd-kpi.blue { --accent: var(--db-blue); --soft: rgba(33, 118, 210, 0.09); }
        .pd-kpi.cyan { --accent: var(--db-cyan); --soft: rgba(7, 154, 154, 0.09); }
        .pd-kpi.amber { --accent: var(--db-amber); --soft: rgba(216, 138, 18, 0.10); }
        .pd-kpi.violet { --accent: var(--db-violet); --soft: rgba(102, 88, 184, 0.09); }

        .pd-kpi-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            border: 1px solid color-mix(in srgb, var(--accent) 30%, transparent);
            background: var(--soft);
            color: var(--accent);
            font-size: 13px;
        }

        .pd-kpi-copy {
            min-width: 0;
        }

        .pd-kpi-label {
            color: var(--db-ink-2);
            font-size: 9px;
            font-weight: 800;
        }

        .pd-kpi-value {
            margin-top: 4px;
            color: var(--db-ink);
            font-size: 22px;
            font-weight: 800;
            line-height: 1;
            letter-spacing: -0.7px;
        }

        .pd-kpi-unit {
            margin-left: 2px;
            color: var(--db-muted);
            font-size: 9px;
            font-weight: 700;
        }

        .pd-kpi-meta {
            color: var(--db-muted);
            font-size: 8px;
            font-weight: 700;
            text-align: right;
            white-space: nowrap;
        }

        /* main content */
        .pd-main-grid {
            display: grid;
            grid-template-columns: minmax(0, 1.55fr) minmax(330px, 0.75fr);
            gap: 10px;
            min-height: 0;
        }

        .pd-panel {
            min-width: 0;
            min-height: 0;
            overflow: hidden;
            border: 1px solid var(--db-line);
            background: var(--db-surface);
            box-shadow: var(--db-shadow);
        }

        .pd-panel-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            min-height: 45px;
            padding: 7px 11px;
            border-bottom: 1px solid var(--db-line);
            background: linear-gradient(180deg, #ffffff, #fbfcfd);
        }

        .pd-panel-title-wrap {
            min-width: 0;
        }

        .pd-panel-title {
            display: flex;
            align-items: center;
            gap: 7px;
            margin: 0;
            color: var(--db-ink);
            font-size: 11px;
            font-weight: 800;
        }

        .pd-panel-title i {
            color: var(--db-blue);
            font-size: 10px;
        }

        .pd-panel-sub {
            margin-top: 2px;
            color: var(--db-muted);
            font-size: 8px;
            font-weight: 600;
        }

        .pd-link {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: var(--db-muted);
            font-size: 8px;
            font-weight: 800;
            text-decoration: none;
        }

        .pd-link:hover {
            color: var(--db-blue);
            text-decoration: none;
        }

        /* chart studio */
        .pd-chart-studio {
            display: grid;
            grid-template-rows: auto minmax(0, 1fr);
            min-height: 0;
        }

        .pd-chart-tabs {
            display: flex;
            align-items: center;
            gap: 18px;
            min-height: 34px;
            padding: 0 12px;
            border-bottom: 1px solid var(--db-line);
            background: var(--db-surface-2);
        }

        .pd-chart-tab {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--db-muted);
            font-size: 9px;
            font-weight: 800;
        }

        .pd-chart-tab::before {
            width: 6px;
            height: 6px;
            content: '';
            background: currentColor;
        }

        .pd-chart-tab.order { color: var(--db-blue); }
        .pd-chart-tab.user { color: var(--db-cyan); }

        .pd-chart-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            min-height: 0;
        }

        .pd-chart-block {
            display: flex;
            flex-direction: column;
            min-width: 0;
            min-height: 0;
            border-right: 1px solid var(--db-line);
        }

        .pd-chart-block:last-child {
            border-right: 0;
        }

        .pd-chart-block-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 9px 11px 0;
        }

        .pd-chart-block-title {
            color: var(--db-ink-2);
            font-size: 9px;
            font-weight: 800;
        }

        .pd-chart-highlight {
            color: var(--db-ink);
            font-size: 13px;
            font-weight: 800;
        }

        .pd-chart-highlight small {
            margin-left: 2px;
            color: var(--db-muted);
            font-size: 8px;
        }

        .pd-chart-area {
            position: relative;
            flex: 1 1 auto;
            min-height: 0;
            padding: 5px 7px 7px;
        }

        .pd-chart-area canvas {
            width: 100% !important;
            height: 100% !important;
        }

        .pd-chart-loading {
            position: absolute;
            z-index: 5;
            inset: 0;
            display: none;
            align-items: center;
            justify-content: center;
            background: rgba(255,255,255,0.88);
            color: var(--db-blue);
            font-size: 9px;
            font-weight: 800;
        }

        .pd-chart-loading.is-visible {
            display: flex;
        }

        /* insight rail */
        .pd-insight-panel {
            display: flex;
            flex-direction: column;
        }

        .pd-insight-body {
            display: grid;
            flex: 1 1 auto;
            grid-template-rows: repeat(2, minmax(0, 1fr));
            min-height: 0;
        }

        .pd-insight-section {
            display: grid;
            grid-template-columns: 1.05fr 0.95fr;
            min-height: 0;
            border-bottom: 1px solid var(--db-line);
        }

        .pd-insight-section:last-child {
            border-bottom: 0;
        }

        .pd-insight-main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 12px;
            border-right: 1px solid var(--db-line);
            background: #fbfcfd;
        }

        .pd-insight-eyebrow {
            display: flex;
            align-items: center;
            gap: 6px;
            color: var(--db-muted);
            font-size: 8px;
            font-weight: 800;
        }

        .pd-insight-eyebrow i {
            color: var(--accent);
        }

        .pd-insight-value {
            margin-top: 7px;
            color: var(--db-ink);
            font-size: 27px;
            font-weight: 800;
            line-height: 1;
            letter-spacing: -0.8px;
        }

        .pd-insight-value small {
            margin-left: 2px;
            color: var(--db-muted);
            font-size: 9px;
        }

        .pd-insight-period {
            margin-top: 6px;
            color: var(--db-muted);
            font-size: 8px;
            font-weight: 600;
        }

        .pd-insight-section.order { --accent: var(--db-blue); }
        .pd-insight-section.user { --accent: var(--db-cyan); }

        .pd-insight-stats {
            display: grid;
            grid-template-rows: repeat(2, minmax(0, 1fr));
            min-height: 0;
        }

        .pd-insight-stat {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
            padding: 8px 10px;
            border-bottom: 1px solid var(--db-line);
        }

        .pd-insight-stat:last-child {
            border-bottom: 0;
        }

        .pd-insight-stat-label {
            display: flex;
            align-items: center;
            gap: 6px;
            color: var(--db-ink-2);
            font-size: 8px;
            font-weight: 800;
        }

        .pd-insight-stat-label span {
            width: 5px;
            height: 5px;
            background: var(--dot);
        }

        .pd-insight-stat.max { --dot: var(--db-amber); }
        .pd-insight-stat.min { --dot: var(--db-violet); }

        .pd-insight-stat strong {
            color: var(--db-ink);
            font-size: 12px;
            font-weight: 800;
        }

        /* boards */
        .pd-board-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 10px;
            min-height: 0;
        }

        .pd-board-panel {
            display: flex;
            flex-direction: column;
        }

        .pd-count {
            min-width: 24px;
            padding: 2px 6px;
            border: 1px solid var(--db-line);
            background: var(--db-surface);
            color: var(--db-blue);
            font-size: 8px;
            font-weight: 800;
            text-align: center;
        }

        .pd-board-list {
            flex: 1 1 auto;
            min-height: 0;
            margin: 0;
            padding: 0;
            overflow-y: auto;
            list-style: none;
        }

        .pd-board-item {
            border-bottom: 1px solid #edf0f3;
        }

        .pd-board-item:last-child {
            border-bottom: 0;
        }

        .pd-board-link {
            display: grid;
            grid-template-columns: 30px minmax(0, 1fr) auto;
            align-items: center;
            gap: 9px;
            min-height: 38px;
            padding: 5px 10px;
            color: inherit;
            text-decoration: none;
            transition: background 0.15s ease, padding-left 0.15s ease;
        }

        .pd-board-link:hover {
            padding-left: 13px;
            background: #f7f9fb;
            color: inherit;
            text-decoration: none;
        }

        .pd-board-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 27px;
            height: 27px;
            border: 1px solid rgba(33, 118, 210, 0.2);
            background: rgba(33, 118, 210, 0.07);
            color: var(--db-blue);
            font-size: 9px;
        }

        .pd-board-icon.event {
            border-color: rgba(216, 138, 18, 0.22);
            background: rgba(216, 138, 18, 0.08);
            color: var(--db-amber);
        }

        .pd-board-copy {
            min-width: 0;
        }

        .pd-board-title {
            display: block;
            overflow: hidden;
            color: var(--db-ink);
            font-size: 9px;
            font-weight: 800;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .pd-board-type {
            display: block;
            margin-top: 2px;
            color: var(--db-muted);
            font-size: 7px;
            font-weight: 600;
        }

        .pd-board-date {
            color: var(--db-muted);
            font-size: 8px;
            font-weight: 700;
            white-space: nowrap;
        }

        .pd-empty {
            display: flex;
            flex: 1 1 auto;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: var(--db-muted);
            text-align: center;
        }

        .pd-empty i {
            margin-bottom: 6px;
            color: #c7ced5;
            font-size: 19px;
        }

        .pd-empty p {
            margin: 0;
            font-size: 8px;
            font-weight: 700;
        }

        .pd-board-list::-webkit-scrollbar {
            width: 4px;
        }

        .pd-board-list::-webkit-scrollbar-thumb {
            background: #cbd2d9;
        }

        @media (max-height: 760px) and (min-width: 992px) {
            #content.premium-dashboard {
                padding-top: 8px;
                padding-bottom: 8px;
            }

            .pd-shell {
                gap: 6px;
                grid-template-rows: auto auto minmax(0, 1fr) minmax(118px, 0.42fr);
            }

            .pd-header {
                min-height: 44px;
            }

            .pd-description {
                display: none;
            }

            .pd-kpi {
                min-height: 62px;
            }

            .pd-kpi-meta {
                display: none;
            }

            .pd-panel-head {
                min-height: 38px;
            }

            .pd-chart-tabs {
                min-height: 28px;
            }

            .pd-insight-value {
                font-size: 22px;
            }

            .pd-board-link {
                min-height: 31px;
            }
        }

        @media (max-width: 1100px) {
            body,
            #page-container {
                overflow: auto;
                height: auto;
            }

            #content.premium-dashboard {
                height: auto;
                min-height: calc(100vh - 54px);
                overflow: visible;
            }

            .pd-shell {
                display: block;
            }

            .pd-header,
            .pd-kpi-grid,
            .pd-main-grid,
            .pd-board-grid {
                margin-bottom: 10px;
            }

            .pd-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .pd-actions {
                flex-wrap: wrap;
            }

            .pd-kpi-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .pd-main-grid {
                grid-template-columns: 1fr;
            }

            .pd-chart-studio,
            .pd-insight-panel {
                min-height: 310px;
            }
        }

        @media (max-width: 640px) {
            .pd-kpi-grid,
            .pd-chart-grid,
            .pd-board-grid {
                grid-template-columns: 1fr;
            }

            .pd-field,
            .pd-period,
            .pd-refresh {
                width: 100%;
            }

            .pd-brand-select {
                flex: 1;
                width: auto;
            }

            .pd-chart-block {
                min-height: 210px;
                border-right: 0;
                border-bottom: 1px solid var(--db-line);
            }
        }
    </style>
</head>

<body>
<div
        id="page-loader"
        class="fade show"
>
    <span class="spinner"></span>
</div>

<div
        id="page-container"
        class="fade page-sidebar-fixed page-header-fixed"
>
    <%@include file="common/include_header.jsp" %>
    <%@include file="common/include_header_test.jsp" %>
    <%@include file="common/include_sidebar.jsp" %>

    <div
            id="content"
            class="content premium-dashboard"
    >
        <div class="pd-shell">
            <header class="pd-header">
                <div class="pd-heading">
                    <div class="pd-title-line">
                        <span class="pd-title-mark"></span>
                        <h1 class="pd-title">
                            <spring:message code="dashboard.normalaffiliateheadquarters" text="대시보드"/>
                        </h1>
                        <span class="pd-live-badge">
                            <span class="pd-live-dot"></span>
                            DATA READY
                        </span>
                    </div>
                    <div class="pd-description">
                        주문 흐름과 신규 고객 변화를 현재 월 기준으로 확인합니다.
                        <span id="dashboardLastUpdated"></span>
                    </div>
                </div>

                <div class="pd-actions">
                    <div class="pd-field">
                        <span class="pd-field-label">브랜드</span>
                        <c:choose>
                            <c:when test="${empty appCode}">
                                <select id="brandTypeCd" name="brandTypeCd" class="form-control pd-brand-select">
                                    <option value="">전체</option>
                                    <c:forEach var="appCodeItem" items="${appVersionList}">
                                        <option value="${appCodeItem.codeValue}"
                                                <c:if test="${searchValue.appCode == appCodeItem.sysCode}">selected</c:if>>
                                                ${appCodeItem.codeName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </c:when>
                            <c:otherwise>
                                <select id="brandTypeCd" name="brandTypeCd" class="form-control pd-brand-select" disabled>
                                    <c:forEach var="appCodeItem" items="${appVersionList}">
                                        <c:if test="${appCode == appCodeItem.sysCode}">
                                            <option value="${appCodeItem.codeValue}" selected>${appCodeItem.codeName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="pd-period">
                        <i class="fa fa-calendar-alt"></i>
                        <strong id="dashboardCurrentPeriod">-</strong>
                    </div>

                    <button type="button" id="dashboardRefreshButton" class="pd-refresh">
                        <i class="fa fa-sync-alt"></i>
                        새로고침
                    </button>
                </div>
            </header>

            <div id="dashboardErrorMessage" class="pd-error">
                <i class="fa fa-exclamation-circle m-r-5"></i>
                <span>대시보드 데이터를 불러오지 못했습니다.</span>
            </div>

            <section class="pd-kpi-grid">
                <article class="pd-kpi blue">
                    <div class="pd-kpi-icon"><i class="fa fa-shopping-bag"></i></div>
                    <div class="pd-kpi-copy">
                        <div class="pd-kpi-label">월 총 주문수</div>
                        <div class="pd-kpi-value"><span id="orderTotalKpi">0</span><span class="pd-kpi-unit">건</span></div>
                    </div>
                    <div class="pd-kpi-meta">MONTHLY<br/>ORDERS</div>
                </article>

                <article class="pd-kpi cyan">
                    <div class="pd-kpi-icon"><i class="fa fa-user-plus"></i></div>
                    <div class="pd-kpi-copy">
                        <div class="pd-kpi-label">월 신규 가입수</div>
                        <div class="pd-kpi-value"><span id="userTotalKpi">0</span><span class="pd-kpi-unit">명</span></div>
                    </div>
                    <div class="pd-kpi-meta">NEW<br/>CUSTOMERS</div>
                </article>

                <article class="pd-kpi amber">
                    <div class="pd-kpi-icon"><i class="fa fa-chart-line"></i></div>
                    <div class="pd-kpi-copy">
                        <div class="pd-kpi-label">일 최대 주문수</div>
                        <div class="pd-kpi-value"><span id="orderMaxKpi">0</span><span class="pd-kpi-unit">건</span></div>
                    </div>
                    <div class="pd-kpi-meta">DAILY<br/>PEAK</div>
                </article>

                <article class="pd-kpi violet">
                    <div class="pd-kpi-icon"><i class="fa fa-users"></i></div>
                    <div class="pd-kpi-copy">
                        <div class="pd-kpi-label">일 최대 가입수</div>
                        <div class="pd-kpi-value"><span id="userMaxKpi">0</span><span class="pd-kpi-unit">명</span></div>
                    </div>
                    <div class="pd-kpi-meta">SIGN-UP<br/>PEAK</div>
                </article>
            </section>

            <main class="pd-main-grid">
                <section class="pd-panel pd-chart-studio">
                    <div>
                        <div class="pd-panel-head">
                            <div class="pd-panel-title-wrap">
                                <h2 class="pd-panel-title"><i class="fa fa-chart-line"></i> 월간 흐름 분석</h2>
                                <div class="pd-panel-sub">현재 월 주문량과 신규 가입자 변화</div>
                            </div>
                            <span class="pd-live-badge"><span class="pd-live-dot"></span> CURRENT MONTH</span>
                        </div>
                        <div class="pd-chart-tabs">
                            <span class="pd-chart-tab order">주문량</span>
                            <span class="pd-chart-tab user">신규 고객</span>
                        </div>
                    </div>

                    <div class="pd-chart-grid">
                        <article class="pd-chart-block">
                            <div class="pd-chart-block-head">
                                <div class="pd-chart-block-title">일별 주문 변화</div>
                                <div class="pd-chart-highlight"><span id="orderMonthSummary">0</span><small>건 누적</small></div>
                            </div>
                            <div class="pd-chart-area">
                                <div id="orderChartLoading" class="pd-chart-loading"><i class="fa fa-spinner"></i> 조회 중</div>
                                <canvas id="orderLineChart"></canvas>
                            </div>
                        </article>

                        <article class="pd-chart-block">
                            <div class="pd-chart-block-head">
                                <div class="pd-chart-block-title">일별 신규 가입</div>
                                <div class="pd-chart-highlight"><span id="userMonthSummary">0</span><small>명 누적</small></div>
                            </div>
                            <div class="pd-chart-area">
                                <div id="userChartLoading" class="pd-chart-loading"><i class="fa fa-spinner"></i> 조회 중</div>
                                <canvas id="userLineChart"></canvas>
                            </div>
                        </article>
                    </div>
                </section>

                <aside class="pd-panel pd-insight-panel">
                    <div class="pd-panel-head">
                        <div class="pd-panel-title-wrap">
                            <h2 class="pd-panel-title"><i class="fa fa-gauge-high"></i> 월간 핵심 지표</h2>
                            <div class="pd-panel-sub">누적 실적과 최고·최저 기록</div>
                        </div>
                    </div>

                    <div class="pd-insight-body">
                        <section class="pd-insight-section order">
                            <div class="pd-insight-main">
                                <div class="pd-insight-eyebrow"><i class="fa fa-shopping-cart"></i> ORDER PERFORMANCE</div>
                                <div class="pd-insight-value"><span id="orderMonthSummaryMirror">0</span><small>건</small></div>
                                <div id="orderSummaryPeriod" class="pd-insight-period">-</div>
                            </div>
                            <div class="pd-insight-stats">
                                <div class="pd-insight-stat max">
                                    <span class="pd-insight-stat-label"><span></span>주문량 최고</span>
                                    <strong id="orderMaxSummary">0건</strong>
                                </div>
                                <div class="pd-insight-stat min">
                                    <span class="pd-insight-stat-label"><span></span>주문량 최저</span>
                                    <strong id="orderMinSummary">0건</strong>
                                </div>
                            </div>
                        </section>

                        <section class="pd-insight-section user">
                            <div class="pd-insight-main">
                                <div class="pd-insight-eyebrow"><i class="fa fa-user-check"></i> CUSTOMER GROWTH</div>
                                <div class="pd-insight-value"><span id="userMonthSummaryMirror">0</span><small>명</small></div>
                                <div id="userSummaryPeriod" class="pd-insight-period">-</div>
                            </div>
                            <div class="pd-insight-stats">
                                <div class="pd-insight-stat max">
                                    <span class="pd-insight-stat-label"><span></span>가입수 최고</span>
                                    <strong id="userMaxSummary">0명</strong>
                                </div>
                                <div class="pd-insight-stat min">
                                    <span class="pd-insight-stat-label"><span></span>가입수 최저</span>
                                    <strong id="userMinSummary">0명</strong>
                                </div>
                            </div>
                        </section>
                    </div>
                </aside>
            </main>

            <c:if test="${sessionScope.sessionKey.company == 'jesicar' || sessionScope.sessionKey.roleType != 2}">
                <section class="pd-board-grid">
                    <article class="pd-panel pd-board-panel">
                        <div class="pd-panel-head">
                            <div class="pd-panel-title-wrap">
                                <h2 class="pd-panel-title"><i class="fa fa-bullhorn"></i> 플랫폼 공지</h2>
                                <div class="pd-panel-sub">최근 플랫폼 운영 안내</div>
                            </div>

                            <c:set var="platformNoticeCount" value="0"/>
                            <c:forEach var="item" items="${updatePlatList}">
                                <c:if test="${(sessionScope.sessionKey.company == 'jesicar' && item.platformType == 1 && item.programType == 1) || (sessionScope.sessionKey.company == 'yangpa' && item.platformType == 2)}">
                                    <c:set var="platformNoticeCount" value="${platformNoticeCount + 1}"/>
                                </c:if>
                            </c:forEach>
                            <span class="pd-count">${platformNoticeCount}</span>
                        </div>

                        <ul class="pd-board-list">
                            <c:set var="hasPlatformNotice" value="false"/>
                            <c:forEach var="item" items="${updatePlatList}">
                                <c:if test="${(sessionScope.sessionKey.company == 'jesicar' && item.platformType == 1 && item.programType == 1) || (sessionScope.sessionKey.company == 'yangpa' && item.platformType == 2)}">
                                    <c:set var="hasPlatformNotice" value="true"/>
                                    <li class="pd-board-item">
                                        <a href="/notice/platform/${item.noticeNo}" class="pd-board-link"
                                           <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">onclick="openDashboardPopup(this.href); return false;"</c:if>>
                                            <span class="pd-board-icon"><i class="fa fa-bullhorn"></i></span>
                                            <span class="pd-board-copy">
                                                <span class="pd-board-title"><c:out value="${item.title}"/></span>
                                                <span class="pd-board-type">PLATFORM NOTICE</span>
                                            </span>
                                            <span class="pd-board-date"><c:out value="${fn:substring(item.insertDate, 0, 10)}"/></span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${!hasPlatformNotice}">
                                <li class="pd-empty"><i class="fa fa-inbox"></i><p>등록된 플랫폼 공지가 없습니다.</p></li>
                            </c:if>
                        </ul>
                    </article>

                    <article class="pd-panel pd-board-panel">
                        <div class="pd-panel-head">
                            <div class="pd-panel-title-wrap">
                                <h2 class="pd-panel-title"><i class="fa fa-calendar-check"></i> 이벤트 내역</h2>
                                <div class="pd-panel-sub">최근 이벤트 및 프로모션</div>
                            </div>
                            <span class="pd-count"><c:out value="${fn:length(updateEventList)}"/></span>
                        </div>

                        <ul class="pd-board-list">
                            <c:choose>
                                <c:when test="${not empty updateEventList}">
                                    <c:forEach var="item" items="${updateEventList}">
                                        <li class="pd-board-item">
                                            <a href="/notice/event/${item.eventNo}" class="pd-board-link"
                                               <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">onclick="openDashboardPopup(this.href); return false;"</c:if>>
                                                <span class="pd-board-icon event"><i class="fa fa-gift"></i></span>
                                                <span class="pd-board-copy">
                                                    <span class="pd-board-title"><c:out value="${item.title}"/></span>
                                                    <span class="pd-board-type">EVENT & PROMOTION</span>
                                                </span>
                                                <span class="pd-board-date"><c:out value="${fn:substring(item.insertDate, 0, 10)}"/></span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <li class="pd-empty"><i class="fa fa-calendar-times"></i><p>등록된 이벤트가 없습니다.</p></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </article>
                </section>
            </c:if>
        </div>
    </div>
</div>

<!-- 공통 JS -->
<%@include file="common/include_common_js.jsp" %>
<%@include file="common/include_datatables.jsp" %>
<%@include file="common/include_custom_js.jsp" %>

<!-- Chart.js는 하나만 사용 -->
<script src="${path}/assets/plugins/chart.js/dist/Chart.min_new.js"></script>

<script>
    (function () {
        'use strict';

        const DASHBOARD_PATH = '${path}';
        const SESSION_APP_CODE = '${sessionScope.sessionKey.appCode}';

        let orderChart = null;
        let userChart = null;
        let dashboardLoading = false;

        const currentPeriod = createCurrentPeriod();

        const chartCommonOptions = {
            responsive: true,
            maintainAspectRatio: false,

            layout: {
                padding: {
                    top: 3,
                    right: 4,
                    bottom: 0,
                    left: 0
                }
            },

            interaction: {
                intersect: false,
                mode: 'index'
            },

            animation: {
                duration: 250
            },

            plugins: {
                legend: {
                    display: false
                },

                tooltip: {
                    backgroundColor: 'rgba(38, 45, 52, 0.96)',
                    titleColor: '#ffffff',
                    bodyColor: '#ffffff',
                    borderColor: 'rgba(255, 255, 255, 0.12)',
                    borderWidth: 1,
                    padding: 7,
                    displayColors: true
                }
            },

            scales: {
                x: {
                    grid: {
                        display: false
                    },

                    ticks: {
                        color: '#858d96',
                        font: {
                            size: 8,
                            weight: '600'
                        },
                        maxRotation: 0,
                        autoSkip: true,
                        maxTicksLimit: 8
                    }
                },

                y: {
                    beginAtZero: true,

                    grid: {
                        color: '#e9edf1',
                        drawBorder: false
                    },

                    ticks: {
                        color: '#858d96',
                        precision: 0,
                        maxTicksLimit: 4,
                        font: {
                            size: 8,
                            weight: '600'
                        }
                    }
                }
            }
        };

        $(document).ready(function () {
            initializeChartDefaults();
            initializeCurrentPeriod();
            bindDashboardEvents();
            loadDashboardData();
        });

        function createCurrentPeriod() {
            const today = new Date();

            const year = today.getFullYear();
            const monthNumber = today.getMonth() + 1;
            const month = String(monthNumber).padStart(2, '0');

            const lastDay = new Date(
                year,
                monthNumber,
                0
            ).getDate();

            return {
                year: year,
                month: month,

                apiSearchDate:
                    year +
                    '/' +
                    month +
                    '/01',

                startDate:
                    year +
                    '-' +
                    month +
                    '-01',

                endDate:
                    year +
                    '-' +
                    month +
                    '-' +
                    String(lastDay).padStart(2, '0'),

                displayText:
                    year +
                    '년 ' +
                    month +
                    '월',

                shortText:
                    year +
                    '.' +
                    month
            };
        }

        function initializeCurrentPeriod() {
            $('#dashboardCurrentPeriod').text(
                currentPeriod.displayText
            );

            $('#orderSummaryPeriod').text(
                currentPeriod.displayText + ' 기준'
            );

            $('#userSummaryPeriod').text(
                currentPeriod.displayText + ' 기준'
            );

            updateDetailLinks();
        }

        function initializeChartDefaults() {
            if (typeof Chart === 'undefined') {
                showError(
                    'Chart.js 라이브러리를 불러오지 못했습니다.'
                );

                return;
            }

            Chart.defaults.color = '#69717a';

            Chart.defaults.font.family =
                'Nanum Gothic, 나눔 고딕, NanumGothic, ' +
                'Malgun Gothic, 맑은 고딕, sans-serif';

            Chart.defaults.font.weight = '500';
        }

        function bindDashboardEvents() {
            $('#dashboardRefreshButton').on(
                'click',
                function () {
                    loadDashboardData();
                }
            );

            $('#brandTypeCd').on(
                'change',
                function () {
                    loadDashboardData();
                }
            );
        }

        async function loadDashboardData() {
            if (dashboardLoading) {
                return;
            }

            setLoading(true);
            hideError();

            try {
                const results = await Promise.all([
                    requestOrderData(),
                    requestChartData()
                ]);

                const orderResponse = results[0] || {};
                const chartResponse = results[1] || {};

                const orderData = normalizeOrderData(
                    orderResponse
                );

                const userData = normalizeUserData(
                    chartResponse.getUserCount
                );

                renderOrderChart(orderData);
                renderUserChart(userData);

                updateSummaryData(
                    orderData,
                    userData
                );

                updateLastReceivedAt();
            } catch (error) {
                console.error(
                    '대시보드 조회 오류:',
                    error
                );

                const emptyData = createEmptyChartData();

                renderOrderChart(emptyData);
                renderUserChart(emptyData);

                updateSummaryData(
                    emptyData,
                    emptyData
                );

                showError(
                    error && error.message
                        ? error.message
                        : '대시보드 데이터를 불러오지 못했습니다.'
                );
            } finally {
                setLoading(false);
            }
        }

        function requestOrderData() {
            return new Promise(function (resolve, reject) {
                $.ajax({
                    type: 'POST',

                    url:
                        DASHBOARD_PATH +
                        '/api/manna/order/main',

                    dataType: 'json',

                    data: {
                        brandTypeCd: getSelectedBrandCode()
                    },

                    success: function (data) {
                        resolve(data || {});
                    },

                    error: function (xhr) {
                        reject(
                            new Error(
                                getAjaxErrorMessage(
                                    xhr,
                                    '주문 현황을 불러오지 못했습니다.'
                                )
                            )
                        );
                    }
                });
            });
        }

        function requestChartData() {
            const appCode = getChartAppCode();

            return new Promise(function (resolve, reject) {
                $.ajax({
                    type: 'POST',

                    url:
                        DASHBOARD_PATH +
                        '/api/main/chart/list' +
                        '?appCode=' +
                        encodeURIComponent(appCode) +
                        '&searchDate=' +
                        encodeURIComponent(
                            currentPeriod.apiSearchDate
                        ),

                    contentType:
                        'application/json; charset=UTF-8',

                    dataType: 'json',

                    success: function (data) {
                        resolve(data || {});
                    },

                    error: function (xhr) {
                        reject(
                            new Error(
                                getAjaxErrorMessage(
                                    xhr,
                                    '가입 현황을 불러오지 못했습니다.'
                                )
                            )
                        );
                    }
                });
            });
        }

        function normalizeOrderData(response) {
            const timeList = Array.isArray(response.timeList)
                ? response.timeList
                : [];

            const labels = [];
            const values = [];

            timeList.forEach(function (item) {
                labels.push(
                    formatChartLabel(item.yyyymmdd)
                );

                values.push(
                    toNumber(item.totalCnt)
                );
            });

            if (labels.length === 0) {
                return createEmptyChartData();
            }

            return createChartData(
                labels,
                values
            );
        }

        function normalizeUserData(userCountList) {
            const list = Array.isArray(userCountList)
                ? userCountList
                : [];

            const sortedList = list
                .slice()
                .sort(function (a, b) {
                    return (
                        toComparableDay(a.dayDate) -
                        toComparableDay(b.dayDate)
                    );
                });

            const labels = [];
            const values = [];

            sortedList.forEach(function (item) {
                labels.push(
                    formatDayLabel(item.dayDate)
                );

                values.push(
                    toNumber(item.cnt)
                );
            });

            if (labels.length === 0) {
                return createEmptyChartData();
            }

            return createChartData(
                labels,
                values
            );
        }

        function createChartData(labels, values) {
            const safeLabels =
                Array.isArray(labels) &&
                labels.length > 0
                    ? labels
                    : ['데이터 없음'];

            const safeValues =
                Array.isArray(values) &&
                values.length > 0
                    ? values.map(toNumber)
                    : [0];

            const total = safeValues.reduce(
                function (sum, value) {
                    return sum + value;
                },
                0
            );

            return {
                labels: safeLabels,
                values: safeValues,
                total: total,
                max: Math.max.apply(null, safeValues),
                min: Math.min.apply(null, safeValues)
            };
        }

        function createEmptyChartData() {
            return {
                labels: ['데이터 없음'],
                values: [0],
                total: 0,
                max: 0,
                min: 0
            };
        }

        function renderOrderChart(chartData) {
            const canvas =
                document.getElementById(
                    'orderLineChart'
                );

            if (
                !canvas ||
                typeof Chart === 'undefined'
            ) {
                return;
            }

            if (orderChart) {
                orderChart.destroy();
            }

            orderChart = new Chart(
                canvas.getContext('2d'),
                {
                    type: 'line',

                    data: {
                        labels: chartData.labels,

                        datasets: [
                            {
                                label: '주문량',
                                data: chartData.values,

                                borderColor: '#348fe2',

                                backgroundColor:
                                    'rgba(52, 143, 226, 0.05)',

                                pointBackgroundColor:
                                    '#ffffff',

                                pointBorderColor:
                                    '#348fe2',

                                pointBorderWidth: 1.5,

                                pointRadius:
                                    getPointRadius(
                                        chartData.values.length
                                    ),

                                pointHoverRadius: 3.5,
                                borderWidth: 1.7,
                                fill: true,
                                tension: 0.25
                            }
                        ]
                    },

                    options: mergeChartOptions({
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return (
                                            ' 주문량: ' +
                                            numberFormat(
                                                context.parsed.y
                                            ) +
                                            '건'
                                        );
                                    }
                                }
                            }
                        },

                        scales: {
                            y: {
                                ticks: {
                                    callback: function (value) {
                                        return (
                                            numberFormat(value) +
                                            '건'
                                        );
                                    }
                                }
                            }
                        }
                    })
                }
            );
        }

        function renderUserChart(chartData) {
            const canvas =
                document.getElementById(
                    'userLineChart'
                );

            if (
                !canvas ||
                typeof Chart === 'undefined'
            ) {
                return;
            }

            if (userChart) {
                userChart.destroy();
            }

            userChart = new Chart(
                canvas.getContext('2d'),
                {
                    type: 'line',

                    data: {
                        labels: chartData.labels,

                        datasets: [
                            {
                                label: '신규 고객',
                                data: chartData.values,

                                borderColor: '#00a8a8',

                                backgroundColor:
                                    'rgba(0, 168, 168, 0.05)',

                                pointBackgroundColor:
                                    '#ffffff',

                                pointBorderColor:
                                    '#00a8a8',

                                pointBorderWidth: 1.5,

                                pointRadius:
                                    getPointRadius(
                                        chartData.values.length
                                    ),

                                pointHoverRadius: 3.5,
                                borderWidth: 1.7,
                                fill: true,
                                tension: 0.25
                            }
                        ]
                    },

                    options: mergeChartOptions({
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return (
                                            ' 신규 고객: ' +
                                            numberFormat(
                                                context.parsed.y
                                            ) +
                                            '명'
                                        );
                                    }
                                }
                            }
                        },

                        scales: {
                            y: {
                                ticks: {
                                    callback: function (value) {
                                        return (
                                            numberFormat(value) +
                                            '명'
                                        );
                                    }
                                }
                            }
                        }
                    })
                }
            );
        }

        function updateSummaryData(
            orderData,
            userData
        ) {
            setText(
                '#orderTotalKpi',
                numberFormat(orderData.total)
            );

            setText(
                '#userTotalKpi',
                numberFormat(userData.total)
            );

            setText(
                '#orderMaxKpi',
                numberFormat(orderData.max)
            );

            setText(
                '#userMaxKpi',
                numberFormat(userData.max)
            );

            setText(
                '#orderMonthSummary',
                numberFormat(orderData.total)
            );

            setText(
                '#orderMonthSummaryMirror',
                numberFormat(orderData.total)
            );

            setText(
                '#orderMaxSummary',
                numberFormat(orderData.max) + '건'
            );

            setText(
                '#orderMinSummary',
                numberFormat(orderData.min) + '건'
            );

            setText(
                '#userMonthSummary',
                numberFormat(userData.total)
            );

            setText(
                '#userMonthSummaryMirror',
                numberFormat(userData.total)
            );

            setText(
                '#userMaxSummary',
                numberFormat(userData.max) + '명'
            );

            setText(
                '#userMinSummary',
                numberFormat(userData.min) + '명'
            );
        }

        function updateLastReceivedAt() {
            const now = new Date();
            const formatted = new Intl.DateTimeFormat('ko-KR', {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: true
            }).format(now);

            $('#dashboardLastUpdated').text(' · 최근 조회 ' + formatted);
        }

        function updateDetailLinks() {
            const orderUrl =
                DASHBOARD_PATH +
                'statistics/order/list' +
                '?startDate=' +
                encodeURIComponent(
                    currentPeriod.startDate
                ) +
                '&endDate=' +
                encodeURIComponent(
                    currentPeriod.endDate
                ) +
                '&selday=' +
                '&platformType=2';

            const userUrl =
                DASHBOARD_PATH +
                'statistics/user/list' +
                '?startDate=' +
                encodeURIComponent(
                    currentPeriod.startDate
                ) +
                '&endDate=' +
                encodeURIComponent(
                    currentPeriod.endDate
                ) +
                '&selday=' +
                '&platformType=2';

            $('#orderDetailLink').attr(
                'href',
                orderUrl
            );

            $('#userDetailLink').attr(
                'href',
                userUrl
            );
        }

        function mergeChartOptions(customOptions) {
            return $.extend(
                true,
                {},
                chartCommonOptions,
                customOptions || {}
            );
        }

        function getSelectedBrandCode() {
            return $('#brandTypeCd').val() || '';
        }

        function getChartAppCode() {
            const selectedBrandCode =
                getSelectedBrandCode();

            if (selectedBrandCode) {
                return selectedBrandCode;
            }

            return SESSION_APP_CODE || '';
        }

        function formatChartLabel(value) {
            if (
                value === null ||
                value === undefined ||
                value === ''
            ) {
                return '-';
            }

            const text = String(value).trim();

            if (/^\d{8}$/.test(text)) {
                return (
                    text.substring(4, 6) +
                    '.' +
                    text.substring(6, 8)
                );
            }

            if (
                /^\d{4}-\d{2}-\d{2}/.test(text)
            ) {
                return text
                    .substring(5, 10)
                    .replace('-', '.');
            }

            return text;
        }

        function formatDayLabel(value) {
            if (
                value === null ||
                value === undefined ||
                value === ''
            ) {
                return '-';
            }

            const text = String(value).trim();

            if (/^\d{8}$/.test(text)) {
                return (
                    text.substring(4, 6) +
                    '.' +
                    text.substring(6, 8)
                );
            }

            if (
                /^\d{4}-\d{2}-\d{2}/.test(text)
            ) {
                return text
                    .substring(5, 10)
                    .replace('-', '.');
            }

            if (/^\d{1,2}$/.test(text)) {
                return (
                    text.padStart(2, '0') +
                    '일'
                );
            }

            return text;
        }

        function toComparableDay(value) {
            if (
                value === null ||
                value === undefined ||
                value === ''
            ) {
                return 0;
            }

            const text = String(value)
                .replace(/[^0-9]/g, '');

            return toNumber(text);
        }

        function getPointRadius(length) {
            if (length > 40) {
                return 0;
            }

            if (length > 25) {
                return 1;
            }

            return 2;
        }

        function numberFormat(value) {
            return toNumber(value).toLocaleString(
                'ko-KR'
            );
        }

        function toNumber(value) {
            const parsed = Number(value);

            return Number.isFinite(parsed)
                ? parsed
                : 0;
        }

        function setText(selector, value) {
            $(selector).text(value);
        }

        function setLoading(isLoading) {
            dashboardLoading = isLoading;

            $('#orderChartLoading').toggleClass(
                'is-visible',
                isLoading
            );

            $('#userChartLoading').toggleClass(
                'is-visible',
                isLoading
            );

            $('#dashboardRefreshButton')
                .prop('disabled', isLoading)
                .toggleClass(
                    'is-loading',
                    isLoading
                );
        }

        function showError(message) {
            $('#dashboardErrorMessage span').text(
                message
            );

            $('#dashboardErrorMessage').addClass(
                'is-visible'
            );
        }

        function hideError() {
            $('#dashboardErrorMessage').removeClass(
                'is-visible'
            );
        }

        function getAjaxErrorMessage(
            xhr,
            defaultMessage
        ) {
            if (!xhr) {
                return defaultMessage;
            }

            if (xhr.responseJSON) {
                return (
                    xhr.responseJSON.message ||
                    xhr.responseJSON.msg ||
                    defaultMessage
                );
            }

            return defaultMessage;
        }

        window.openDashboardPopup = function (url) {
            window.open(
                url,
                '_blank',
                'width=1000,' +
                'height=740,' +
                'resizable=yes,' +
                'scrollbars=yes'
            );
        };
    })();
</script>
</body>
</html>
