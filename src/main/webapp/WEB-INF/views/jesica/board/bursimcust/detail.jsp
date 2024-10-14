<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 고객공지(부르심)수정</title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae | 고객공지(부르심)수정</title>
    </c:if>
    <%@include file="../../../common/include_head.jsp" %>
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
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main5" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main5.sub3" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">고객공지(부르심)수정<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">고객공지(부르심) 수정<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <td class="bg-light">제목<%--<spring:message code="merchandise.insert.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td><input type="text" class="form-control width-full"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">내용<%--<spring:message code="merchandise.insert.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <textarea class="form-control width-full" rows="20"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">노출여부<%--<spring:message code="merchandise.insert.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <label class="m-r-10 font-size-10">
                                        <input type="radio" name="status2" class="align-bottom" checked>노출<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="m-r-10 font-size-10">
                                        <input type="radio" name="status2" class="align-bottom">미노출<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">첨부파일<%--<spring:message code="merchandise.insert.storesalestatus" text="default text"/>--%><%--매장 판매상태--%></td>
                                <td>
                                    <div class="category_sort">
                                        <ul class="sort_list">
                                            <li>
                                                <div class="sort_body" id="sort_body">
                                                    <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                </div>
                                            </li>
                                            <li>
                                                * 권장 이미지 비율 : 984*876<br><br>
                                                <div class="fileName"></div>
                                                <br>
                                                <div class="fileSize"></div>
                                            </li>
                                        </ul>
                                        <label for="imgFile">
                                            <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                <div>파일선택</div>
                                            </div>
                                        </label>
                                        <input type="file" id="imgFile" name="imgFile" class="fileBtn d-none">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="m-l-5">
                        <button type="button" class="btn btn-danger btn_remove float-right m-t-5 m-b-5 m-r-5"><i class="fa fa-trash-alt m-r-3"></i> 삭제<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_update float-right m-t-5 m-b-5 m-r-5"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
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

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/board/bursimcust/list";
        })

        //썸네일
        $(document).on("change", "#imgFile", function (e) {
            e.preventDefault();

            var file = $("#imgFile")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body.innerHTML = '';
                    sort_body.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName').text("변경할 이미지 :" + filename);
            $('.fileSize').text("용량 :" + file.size + " Byte");

            return false;
        });
    });
</script>
</body>
</html>
