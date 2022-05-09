<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productregistration" text="렌터카 등록"/></title>
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="../../../common/include_sidebar.jsp" %>
    <!-- end #sidebar -->

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <div class="col-xl-12 p-b-20">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/driver/car/list"><spring:message code="sidemenu.merchantsetting.222" text="렌터카"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productregistration1" text="렌터카 엑셀등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productregistration1" text="렌터카 엑셀등록"/></h3>
            </div>
<%--            <div class="tab-content">--%>
                <!-- begin tab-pane -->
<%--                <div class="tab-pane fade active show" id="default-tab-1">--%>
                    <div class="" data-scrollbar="true">
                        <div class="">
                            <div class="row">

                                <main role="main" class="col-md-12">
                                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                                    </div>
                                    <div class="well well-lg align-top">
                                        엑셀파일로 렌터카 일괄 등록이 가능합니다<br><br>
                                        주의사항<br>
                                        1) 파일 샘플과 같이 헤더정보가 반드시 존재해야 합니다<br><br>
                                        2) 필수입력 정보는 다음과 같습니다<br>
                                        * <b>차량번호 </b>, <b>모델명</b>, <b>안심번호</b><br><br>
                                        3) 엑셀등록 시 승인상태는 “사용상태” 로 자동등록 됩니다.<br>
                                        <%--3) 등록상태: "등록대기" 또는 "등록완료" <br>
                                        4) 결제상품: 학회 메뉴에서 등록한 '결제상품명' 입력<br>
                                        5) 결제수단: "무통장입금", "카드", "계좌이체" 중 선택<br>
                                        6) 결제상태: "미결제" 또는 "결제완료"<br>--%>
                                    </div>

                                    파일 샘플 &nbsp; <a id="sampleFileDown" href="#">다운로드</a>
                                    <div style="width: 1320px;">
                                        <div id="grid"></div>
                                    </div>
                                    <br>
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light" style="width:10%;background-color: #fff;"><strong><spring:message code="list.search.franchiseselection" text="가맹점 선택"/><%--<spring:message code="merchandise.search1" text="default text"/>--%><%--가맹점선택--%></strong></td>
                                            <td style="width:30%;background-color: #fff;">
                                                <select class="form-control width-150" name="storeNo" id="selectOption">
                                                    <c:forEach var="item"  items="${tbStoreLIst}"  varStatus="status">
                                                        <option value="${item.storeNo}"<c:if test="${item.storeNo == searchValue.storeNo}">selected</c:if>>${item.storeName} [${item.storeNo}]</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="bg-light" style="width:10%;background-color: #fff;">
                                                <label for="fileBtn" class="btn btn-sm btn-info">파일선택<span class="ico download"></span></label>
                                            </td>
                                            <td style="width:30%;background-color: #fff;">
                                                <input type="text" class="form-control " id="fileNameTxt">
                                                <input type="button" class="btn btn-sm btn-info " id="uploadBtn"  style="display:none" value="업로드">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                    <form name="excelUpForm" id="excelUpForm" method="post" enctype="multipart/form-data" action="/driver/car/Excelupload" >
                                        <input type="file" id="fileBtn" name="excelFile" style="position: absolute;width: 1px;height: 1px;padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;">
                                        <input type="hidden" id="submitStoreNo" name="storeNo" value="">
                                    </form>
                                    <div class="m-t-20 ">
                                        <button type="button" class="btn btn-primary list_btn float-left m-t-5 m-l-5"><i class="fa fa-list m-록r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                    </div>
                                    <div id="grid"></div>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
<%--modal search end--%>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<%--<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>--%>

<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<!--[if (gte IE 8)&(lt IE 10)]>
<![endif]-->
<%@include file="../../../common/include_number_only_js.jsp" %>
<style>
    .tui-grid-row-odd>td {
        background-color: #d7d7d7;
    }

    .well {
        padding: 10px;
        background-color: #faf0f0;
        margin-bottom: 20px;
        font-size: 14px;
    }
</style>
<script>
    $("#fileBtn").on('change', function() {
        if (window.FileReader) {
            // modern browser
            var filename = $(this)[0].files[0].name;
            $("#fileNameTxt").val(filename)
            $("#uploadBtn").css("display", "");
        } else {
            // old IE
            var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 } // 추출한 파일명 삽입
            $("#fileNameTxt").val(filename)
            $("#uploadBtn").css("display", "");
        }
    });
    $("#uploadBtn").on("click",function(){
        $("#submitStoreNo").val($("#selectOption option:selected").val());
        $("#excelUpForm").submit();
    })




    $(() => {
        $(".list_btn").click(function() {
            location.href = "${path}/driver/car/list";
        });
        $("#sampleFileDown").on("click",function(){
            location.href = "${path}/api/car/sampleDownload";
        });
    });


    const gridData = [
        {
            c1: '차량번호',
            c2: '모델명',
            c3: '안심번호',
        },
        {
            c1: '37허1234',
            c2: '아반떼',
            c3: '07011112222',
        },
        {
            c1: '37허1234',
            c2: 'K5',
            c3: '07011112222',
        }
    ];

    const grid = new tui.Grid({
        el: document.getElementById('grid'),
        scrollX: false,
        scrollY: false,
        rowHeight: 35,
        rowHeaders: ['rowNum'],
        header: {
            height: 40
        },
        columns: [
            {header: 'A', name: 'c1', width: '60'},
            {header: 'B', name: 'c2', width: '100'},
            {header: 'C', name: 'c3', width: '100'},
            {header: 'D', name: 'c4', width: '100'},
            {header: 'E', name: 'c5', width: '100'},
            {header: 'F', name: 'c6', width: '100'},
            {header: 'G', name: 'c7', width: '100'}
        ],
        data: gridData
    });

    tui.Grid.applyTheme('striped', {
        cell: {
            head: {
                background: '#eef'
            }
        }
    });

</script>
</body>
</html>
