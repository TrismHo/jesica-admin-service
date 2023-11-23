<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 플랫폼문의상세</title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | 플랫폼문의상세</title>
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

    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main5" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main5.sub2" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">플랫폼문의상세<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">플랫폼문의상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>구분명</th>
                                    <th>구분값</th>
                                    <th>문의내용</th>
                                    <th>답변내용</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="bg-light">게시물상태</td>
                                <td>
                                    <select class="form-control width-100">
                                        <option value="0">답변대기</option>
                                        <option value="1">답변완료</option>
                                    </select>
                                </td>
                                <td rowspan="10">
                                    <textarea rows="19" class="form-control width-full background-white" readonly></textarea>
                                </td>
                                <td rowspan="10">
                                    <textarea rows="19" class="form-control width-full" placeholder="답변내용을 입력해주세요"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">문의작성자</td>
                                <td>

                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">문의제목</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="bg-light">첨부파일</td>
                                <td>첨부파일없음</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="m-t-5 m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_list"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
            location.href = "${path}/board/platforminquiry/list";
        });
    });
</script>
</body>
</html>
