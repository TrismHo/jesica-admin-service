<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
<link link rel="shortcut icon" href="${path}/assets/img/icon/icon.png"/>


<link href="${path}/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.css" rel="stylesheet" />
<!-- begin #header -->
<!-- end #header -->

<!-- end #sidebar -->
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
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
    body {
        overflow-x: hidden;
        overflow-y: hidden;
    }
</style>

<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%--modal add end--%>
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-body" style="padding: 5px; height: 500px;">
            <form class="safen_search_form" style="height: 432px;">
                <%-- <div style="width: 100%;">
                     &lt;%&ndash;<select class="form-control searchHeadSelect">
                         <option value="name">명칭</option>
                         <option value="code">코드</option>
                     </select>&ndash;%&gt;
                    검색어입력: <input type="text" class="form-control searchSafenText ml-2" name="headName" style="width: 55%;" placeholder="<spring:message code="list.description.1" text="안심번호를 입력해주세요."/>" maxlength="150">
                 </div>--%>
                <div class="list" style="">
                    <table id="testTable" class="display table table-bordered w-100 table-striped">
                        <thead>
                        <%--<th><input type="checkbox"></th>--%>
                        <th class="text-center"><spring:message code="list.word.no1" text="그룹명"/></th>
                        <th class="text-center"><spring:message code="list.word.storename1" text=""/></th>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${groupType == 1}">
                                <c:forEach var="item"  items="${tbHead}"  varStatus="status">
                                    <tr class="" headNo="${item.headNo}">
                                        <td class="text-center">${item.headName}</td>
                                        <td class="text-center"> <input type="button" class="btn btn-primary selectGroup" selectName="${item.headName}" no="${item.headNo}"  style="height: 20px; line-height: 0px;margin-top: -5px;"value="적용"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:when test="${groupType == 2}">
                                <c:forEach var="item"  items="${tbBranch}"  varStatus="status">
                                    <tr class="" headNo="${item.branchNo}">
                                        <td class="text-center">${item.branchName}</td>
                                        <td class="text-center"> <input type="button" class="btn btn-primary selectGroup" selectName="${item.branchName}" no="${item.branchNo}"  style="height: 20px; line-height: 0px;margin-top: -5px;"value="적용"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:when test="${groupType == 3}">
                                <c:forEach var="item"  items="${tbStore}"  varStatus="status">
                                    <tr class="" headNo="${item.storeNo}">
                                        <td class="text-center">${item.storeName}</td>
                                        <td class="text-center"> <input type="button" class="btn btn-primary selectGroup" selectName="${item.storeName}" no="${item.storeNo}"  style="height: 20px; line-height: 0px;margin-top: -5px;"value="적용"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:when test="${groupType == 4}">
                                <c:forEach var="item"  items="${tbUserWorker}"  varStatus="status">
                                    <tr class="" headNo="${item.userNo}">
                                        <td class="text-center">${item.name}</td>
                                        <td class="text-center"> <input type="button" class="btn btn-primary selectGroup" selectName="${item.name}" no="${item.userNo}"  style="height: 20px; line-height: 0px;margin-top: -5px;"value="적용"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise></c:otherwise>

                        </c:choose>

                        </tbody>
                    </table>

                    <%--  <ul class="searchSafenList">--%>
                    <%-- <c:forEach var="item" items="${tbSafenMapping}">
                         <li>
                             <label class="head_text">
                                 ${item.safenNum}
                             </label>
                             <div class="float-right ">
                                 <input type="button" class="btn btn-primary" safenNum="${item.safenNum}" id="selSafenNoBtn" style="height: 25px; line-height: 0px;margin-top: -5px;"value="적용">
                             </div>
                         </li>
                     </c:forEach>--%>
                    <%--</ul>--%>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <%--<div style="margin-left: 190px;">
                <ul class="pagination">
                    <li class="paginate_button page-item disabled">
                        <a class="page-link" href="#">이전</a>
                    </li>
                    <c:forEach begin="1" end="5" varStatus="idx">
                        <c:choose>
                            <c:when test="${idx.index == '1'}">
                                <li class="paginate_button page-item active">
                                    <a href="#" class="page-link" style="">${idx.index}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="paginate_button page-item">
                                    <a href="#" class="page-link" style="">${idx.index}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <li class="paginate_button page-item">
                        <a class="page-link" href="#">다음</a>
                    </li>
                </ul>
            </div>--%>
            <button type="button" class="btn btn-grey float-right modalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
<script>
    $("#testTable").DataTable({
        language : lang_set, //or lang_eng
    });

    $(() => {

        $(document).on("click",".modalCloseBtn",function(){
            window.close();
        });
        $(document).on("click",".selectGroup",function(){
            var no = $(this).attr("no");
            var selectName = $(this).attr("selectName");
            opener.setName(no,selectName);
            window.close();
        });
    });
</script>
