<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<%--
 <%@include file="../../../common/include_head.jsp" %>
  &lt;%&ndash;  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>&ndash;%&gt;--%>
    <title>온동네 | FAQ</title>

    <style>
        * {
            box-sizing: border-box;
        }
        @font-face {
            font-family: 'GmarketSansTTFMedium';
            src: url('../../assets/font/GmarketSansTTFMedium.ttf') format('truetype');
        }
        * {
            font-family: GmarketSansTTFMedium;
        }
        body {
            margin: 0;
            background: #f5f6f8;
            color: #222;
            font-family:
                    -apple-system,
                    BlinkMacSystemFont,
                    "Apple SD Gothic Neo",
                    "Noto Sans KR",
                    sans-serif;
        }

        .mobile-faq-page {
            width: 100%;
            max-width: 720px;
            min-height: 100vh;
            margin: 0 auto;
            background: #fff;
        }

        .mobile-faq-header {
            position: sticky;
            top: 0;
            z-index: 20;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 56px;
            padding: 0 52px;
            border-bottom: 1px solid #eceff3;
            background: rgba(255, 255, 255, .96);
            backdrop-filter: blur(8px);
        }

        .mobile-faq-title {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            letter-spacing: -.4px;
        }

        .mobile-faq-back {
            position: absolute;
            left: 16px;
            top: 50%;
            width: 32px;
            height: 32px;
            padding: 0;
            border: 0;
            background: transparent;
            color: #222;
            font-size: 20px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .mobile-faq-hero {
            padding: 24px 20px 18px;
            background: linear-gradient(180deg, #f7fbff 0%, #fff 100%);
        }

        .mobile-faq-hero strong {
            display: block;
            margin-bottom: 6px;
            font-size: 21px;
            line-height: 1.35;
            letter-spacing: -.7px;
        }

        .mobile-faq-hero p {
            margin: 0;
            color: #737b85;
            font-size: 13px;
            line-height: 1.6;
        }

        .mobile-faq-search {
            position: relative;
            padding: 0 20px 18px;
            background: #fff;
        }

        .mobile-faq-search input {
            width: 100%;
            height: 44px;
            padding: 0 44px 0 14px;
            border: 1px solid #dfe3e8;
            border-radius: 10px;
            outline: none;
            background: #f8fafc;
            color: #222;
            font-size: 14px;
        }

        .mobile-faq-search input:focus {
            border-color: #348fe2;
            background: #fff;
        }

        .mobile-faq-search i {
            position: absolute;
            right: 35px;
            top: 50%;
            color: #8d96a0;
            transform: translateY(-50%);
        }

        .mobile-faq-category-wrap {
            position: sticky;
            top: 56px;
            z-index: 15;
            overflow-x: auto;
            padding: 0 16px;
            border-bottom: 1px solid #eceff3;
            background: #fff;
            scrollbar-width: none;
        }

        .mobile-faq-category-wrap::-webkit-scrollbar {
            display: none;
        }

        .mobile-faq-category-list {
            display: flex;
            gap: 8px;
            width: max-content;
            min-width: 100%;
            margin: 0;
            padding: 12px 4px;
            list-style: none;
        }

        .mobile-faq-category-item {
            flex: 0 0 auto;
            height: 34px;
            padding: 0 14px;
            border: 1px solid #dfe3e8;
            border-radius: 17px;
            background: #fff;
            color: #606873;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
            cursor: pointer;
        }

        .mobile-faq-category-item.active {
            border-color: #348fe2;
            background: #348fe2;
            color: #fff;
        }

        .mobile-faq-section {
            padding: 10px 16px 30px;
        }

        .mobile-faq-count {
            padding: 8px 4px 12px;
            color: #7b8490;
            font-size: 12px;
        }

        .mobile-faq-list {
            border-top: 1px solid #e8ebef;
        }

        .mobile-faq-item {
            border-bottom: 1px solid #e8ebef;
            background: #fff;
        }

        .mobile-faq-question {
            position: relative;
            display: flex;
            align-items: flex-start;
            width: 100%;
            min-height: 64px;
            padding: 18px 42px 18px 8px;
            border: 0;
            background: transparent;
            color: #222;
            text-align: left;
            cursor: pointer;
        }

        .mobile-faq-question-mark {
            flex: 0 0 auto;
            margin-right: 9px;
            color: #348fe2;
            font-size: 15px;
            font-weight: 800;
            line-height: 1.55;
        }

        .mobile-faq-question-text {
            min-width: 0;
            flex: 1;
            font-size: 14px;
            font-weight: 600;
            line-height: 1.55;
            letter-spacing: -.25px;
            word-break: keep-all;
        }

        .mobile-faq-arrow {
            position: absolute;
            top: 50%;
            right: 12px;
            color: #9aa2ab;
            font-size: 13px;
            transform: translateY(-50%) rotate(0deg);
            transition: transform .2s ease;
        }

        .mobile-faq-item.open .mobile-faq-arrow {
            transform: translateY(-50%) rotate(180deg);
        }

        .mobile-faq-answer {
            display: none;
            padding: 0 14px 18px 32px;
        }

        .mobile-faq-answer-inner {
            padding: 15px 16px;
            border-radius: 10px;
            background: #f6f8fa;
            color: #535c66;
            font-size: 13px;
            line-height: 1.7;
            white-space: pre-wrap;
            word-break: break-word;
        }

        .mobile-faq-empty {
            padding: 80px 20px;
            color: #9198a1;
            font-size: 14px;
            text-align: center;
        }

        .mobile-faq-loading {
            padding: 80px 20px;
            color: #9198a1;
            font-size: 14px;
            text-align: center;
        }

        .mobile-faq-loading i {
            display: block;
            margin-bottom: 10px;
            font-size: 22px;
        }

        @media (min-width: 721px) {
            body {
                padding: 24px 0;
            }

            .mobile-faq-page {
                min-height: calc(100vh - 48px);
                border-radius: 14px;
                box-shadow: 0 8px 30px rgba(0, 0, 0, .08);
                overflow: hidden;
            }
        }
    </style>
</head>

<body>
<div class="mobile-faq-page">

    <header class="mobile-faq-header">
        <button type="button"
                class="mobile-faq-back"
                id="mobileFaqBackBtn"
                aria-label="뒤로가기">
            <i class="fa fa-angle-left"></i>
        </button>

        <h1 class="mobile-faq-title">자주 묻는 질문</h1>
    </header>

    <section class="mobile-faq-hero">
        <strong>무엇을 도와드릴까요?</strong>
        <p>
            자주 묻는 질문을 모아두었습니다.<br>
            궁금한 제목을 누르면 답변을 확인할 수 있습니다.
        </p>
    </section>

    <div class="mobile-faq-search">
        <input type="text"
               id="mobileFaqKeyword"
               maxlength="150"
               placeholder="궁금한 내용을 검색해주세요.">
        <i class="fa fa-search"></i>
    </div>

    <nav class="mobile-faq-category-wrap">
        <ul id="mobileFaqCategoryList"
            class="mobile-faq-category-list">
            <li>
                <button type="button"
                        class="mobile-faq-category-item active"
                        data-category-no="">
                    전체
                </button>
            </li>
        </ul>
    </nav>

    <main class="mobile-faq-section">
        <div class="mobile-faq-count">
            총 <strong id="mobileFaqTotalCount">0</strong>건
        </div>

        <div id="mobileFaqList"
             class="mobile-faq-list">
            <div class="mobile-faq-loading">
                <i class="fa fa-spinner fa-spin"></i>
                FAQ를 불러오는 중입니다.
            </div>
        </div>
    </main>
</div>

<%@include file="../../../common/include_common_js.jsp" %>
<%@include file="../../../common/include_custom_js.jsp" %>

<script>
    let mobileFaqList = [];
    let mobileFaqCategoryList = [];
    let currentMobileFaqCategoryNo = "";
    let mobileFaqLoading = false;

    function escapeMobileFaqHtml(value) {
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

    function getMobileFaqCategoryListFromResponse(res) {
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

    function getMobileFaqListFromResponse(res) {
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

    function loadMobileFaqCategoryList() {
        $.ajax({
            url: "${path}/api/system/faq/category/list",
            type: "GET",
            data: {
                useYn: "Y",
                dataStatus: 1
            },

            success: function(res) {
                mobileFaqCategoryList =
                    getMobileFaqCategoryListFromResponse(res);

                renderMobileFaqCategoryList(
                    mobileFaqCategoryList
                );
            },

            error: function(xhr) {
                console.error(xhr);
                mobileFaqCategoryList = [];
                renderMobileFaqCategoryList([]);
            }
        });
    }

    function renderMobileFaqCategoryList(list) {
        let html = "";

        html += ""
            + "<li>"
            + "    <button type='button' "
            + "            class='mobile-faq-category-item"
            + (currentMobileFaqCategoryNo === "" ? " active" : "")
            + "' data-category-no=''>"
            + "        전체"
            + "    </button>"
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

            let activeClass =
                String(currentMobileFaqCategoryNo)
                === String(categoryNo)
                    ? " active"
                    : "";

            html += ""
                + "<li>"
                + "    <button type='button' "
                + "            class='mobile-faq-category-item"
                + activeClass
                + "' data-category-no='"
                + escapeMobileFaqHtml(categoryNo)
                + "'>"
                + escapeMobileFaqHtml(categoryName)
                + "    </button>"
                + "</li>";
        });

        $("#mobileFaqCategoryList").html(html);
    }

    function getMobileFaqSearchParams() {
        let params = {
            useYn: "Y",
            keyword:
                $.trim(
                    $("#mobileFaqKeyword").val() || ""
                )
        };

        if (currentMobileFaqCategoryNo !== "") {
            params.faqCategoryNo =
                Number(currentMobileFaqCategoryNo);
        }

        return params;
    }

    function loadMobileFaqList() {
        if (mobileFaqLoading) {
            return;
        }

        mobileFaqLoading = true;

        $("#mobileFaqList").html(
            "<div class='mobile-faq-loading'>"
            + "    <i class='fa fa-spinner fa-spin'></i>"
            + "    FAQ를 불러오는 중입니다."
            + "</div>"
        );

        $.ajax({
            url: "${path}/api/system/faq/list",
            type: "GET",
            data: getMobileFaqSearchParams(),

            success: function(res) {
                mobileFaqList =
                    getMobileFaqListFromResponse(res);

                renderMobileFaqList(mobileFaqList);
            },

            error: function(xhr) {
                console.error(xhr);

                $("#mobileFaqTotalCount").text("0");

                $("#mobileFaqList").html(
                    "<div class='mobile-faq-empty'>"
                    + "FAQ를 불러오지 못했습니다."
                    + "</div>"
                );
            },

            complete: function() {
                mobileFaqLoading = false;
            }
        });
    }

    function renderMobileFaqList(list) {
        $("#mobileFaqTotalCount")
            .text(list ? list.length : 0);

        if (!list || list.length === 0) {
            $("#mobileFaqList").html(
                "<div class='mobile-faq-empty'>"
                + "등록된 FAQ가 없습니다."
                + "</div>"
            );

            return;
        }

        let html = "";

        $.each(list, function(index, row) {
            let faqNo =
                row.faqNo == null
                    ? index
                    : row.faqNo;

            let faqQ =
                row.faqQ ||
                row.question ||
                row.faqQuestion ||
                "";

            let faqA =
                row.faqA ||
                row.answer ||
                row.faqAnswer ||
                "";

            html += ""
                + "<article class='mobile-faq-item' "
                + "         data-faq-no='"
                + escapeMobileFaqHtml(faqNo)
                + "'>"

                + "    <button type='button' "
                + "            class='mobile-faq-question' "
                + "            aria-expanded='false'>"

                + "        <span class='mobile-faq-question-mark'>"
                + "            Q"
                + "        </span>"

                + "        <span class='mobile-faq-question-text'>"
                + escapeMobileFaqHtml(faqQ)
                + "        </span>"

                + "        <i class='fa fa-chevron-down "
                + "                  mobile-faq-arrow'></i>"

                + "    </button>"

                + "    <div class='mobile-faq-answer'>"
                + "        <div class='mobile-faq-answer-inner'>"
                + escapeMobileFaqHtml(faqA)
                + "        </div>"
                + "    </div>"

                + "</article>";
        });

        $("#mobileFaqList").html(html);
    }

    function toggleMobileFaqItem($item) {
        let isOpen = $item.hasClass("open");

        $(".mobile-faq-item.open")
            .not($item)
            .removeClass("open")
            .find(".mobile-faq-question")
            .attr("aria-expanded", "false");

        $(".mobile-faq-item.open")
            .not($item)
            .find(".mobile-faq-answer")
            .stop(true, true)
            .slideUp(180);

        if (isOpen) {
            $item.removeClass("open");

            $item.find(".mobile-faq-question")
                .attr("aria-expanded", "false");

            $item.find(".mobile-faq-answer")
                .stop(true, true)
                .slideUp(180);

            return;
        }

        $item.addClass("open");

        $item.find(".mobile-faq-question")
            .attr("aria-expanded", "true");

        $item.find(".mobile-faq-answer")
            .stop(true, true)
            .slideDown(180);
    }

    let mobileFaqSearchTimer = null;

    $(() => {
        loadMobileFaqCategoryList();
        loadMobileFaqList();

        $(document).on(
            "click",
            ".mobile-faq-category-item",
            function() {
                $(".mobile-faq-category-item")
                    .removeClass("active");

                $(this).addClass("active");

                currentMobileFaqCategoryNo =
                    String(
                        $(this)
                            .attr("data-category-no")
                        || ""
                    );

                loadMobileFaqList();
            }
        );

        $(document).on(
            "click",
            ".mobile-faq-question",
            function() {
                toggleMobileFaqItem(
                    $(this).closest(".mobile-faq-item")
                );
            }
        );

        $("#mobileFaqKeyword").on(
            "input",
            function() {
                clearTimeout(mobileFaqSearchTimer);

                mobileFaqSearchTimer =
                    setTimeout(function() {
                        loadMobileFaqList();
                    }, 300);
            }
        );

        $("#mobileFaqBackBtn").on(
            "click",
            function() {
                if (
                    window.history &&
                    window.history.length > 1
                ) {
                    window.history.back();
                    return;
                }

                location.href = "${path}/";
            }
        );
    });
</script>
</body>
</html>
