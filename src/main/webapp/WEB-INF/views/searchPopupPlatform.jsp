<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
<%--<link href="${path}/css/jquery.dataTables.min.css" rel="stylesheet"/>--%>
<link href="${path}/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
<link href="${path}/assets/css/default/app.min.css" rel="stylesheet"/>
<link href="${path}/css/custom.css" rel="stylesheet" >
<link href="${path}/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="${path}/assets/plugins/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->
<link href="${path}/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="${path}/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${path}/assets/plugins/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="${path}/assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet" />
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<link href="${path}/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
<link rel="shortcut icon" href="${path}/static/assets/img/icon/icon.png"/>


<link href="${path}/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.css" rel="stylesheet" />
<!-- begin #header -->
<!-- end #header -->

<!-- end #sidebar -->
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="./common/include_common_js.jsp" %>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    /*.modal-body {
        background: #e0e0e0;
    }*/
    .list li {
        padding: 8px;
        margin-top: 4px;
        background: #F9F9F9;
    }
    .list {height: 370px; overflow-y: auto;}
    .modal-footer {display: block;}
    a.page-link {padding: 5px 10px;}
    @media (max-width: 1920px)
    {
        .modal-content {
            width: 100%;
        }

    }
    .modal-dialog {
        position: initial;
        /* width: auto; */
        margin: 0rem;
        pointer-events: none;
    }
    .list {
        height: 370px;
        overflow-y: initial;
    }
    .dataTables_wrapper.dt-bootstrap .dataTables_length, .dataTables_wrapper.dt-bootstrap4 .dataTables_length {
        display: none;
    }
    #testTable_filter {
        display: initial;
    }
    .pagination li {
        margin : 0px;
        padding : 0px;
    }
    .modal-content {
        width: 100%;
    }
    @media (min-width: 576px){
        .modal-dialog {
            max-width: 1200px;
            margin: 0rem auto;
        }
    }
    #cke_1_contents {
        height: 600px;
    }
</style>

<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%--modal add end--%>
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-body" style="padding: 5px;height: 672px;">
            <form class="safen_search_form" style="height: 432px;">
                <%-- <div style="width: 100%;">
                     &lt;%&ndash;<select class="form-control searchHeadSelect">
                         <option value="name">명칭</option>
                         <option value="code">코드</option>
                     </select>&ndash;%&gt;
                    검색어입력: <input type="text" class="form-control searchSafenText ml-2" name="headName" style="width: 55%;" placeholder="<spring:message code="list.description.1" text="안심번호를 입력해주세요."/>" maxlength="150">
                 </div>--%>
                <div class="list" style="">
                    <table class="table table-condensed table-bordered">
                        <tbody>
                        <tr>
                            <td class="bg-light ">제목</td>
                            <td><input type="text" class="form-control width-full title" name="title" value="${tbNoticePlatform.title}" maxlength="150" readonly></td>
                        </tr>
                        <tr>
                            <td class="bg-light">내용</td>
                            <td style="height: 600px;">
                            <textarea style="height: 600px;" id="flatformBody" class="form-control width-full body ckeditor" name="body" rows="10" readonly>
                                ${tbNoticePlatform.body}
                            </textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right newpassModalCloseBtn" data-dismiss="modal"><spring:message code="list.detail.update1" text="닫기"/></button>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(() => {
        $(document).on("click",".newpassModalCloseBtn",function(){
            window.close();
        })
    });
    CKEDITOR.replace('flatformBody', {
        height:520,
        toolbar : [
            { name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
            { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
        ]

    });
</script>
