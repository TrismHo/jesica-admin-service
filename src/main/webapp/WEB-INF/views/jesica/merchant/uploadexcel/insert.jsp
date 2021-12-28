<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jesicar | 엑셀등록</title>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main2.sub5" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">엑셀등록<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">엑셀등록<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive">
                        <table id="user" class="table table-condensed table-bordered">
                            <tbody>
                            <tr>
                                <td class="bg-light text-center">등록 종류<%--<spring:message code="merchandise.insert.affiliates" text="default text"/>--%><%--가맹점--%></td>
                                <td>
                                    <select class="form-control">
                                        <option>만나샵</option>
                                    </select>
                                    <label class="m-l-10">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">등록할 서비스를 선택하세요<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center">파일 양식<%--<spring:message code="merchandise.insert.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td>
                                    <select class="form-control width-170">
                                        <option>일괄등록(배민양식)</option>
                                        <option>샹품그룹</option>
                                        <option>상품</option>
                                        <option>상품옵션</option>
                                        <option>추가상품그룹</option>
                                        <option>추가상품</option>
                                    </select>
                                    <label class="m-l-10">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">업로드할 파일 양식을 선택하세요<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center">소속 업무그룹<%--<spring:message code="merchandise.insert.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <label>
                                        <label class="font-size-10 m-r-5">
                                            <input type="radio" name="status1" class="align-middle" checked><spring:message code="merchandise.search1.option4" text="default text"/>
                                        </label>
                                        <label class="font-size-10 m-r-5">
                                            <input type="radio" name="status1" class="align-middle"><spring:message code="merchandise.search1.option5" text="default text"/>
                                        </label>
                                    </label>
                                    <label>
                                        <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/>" class="form-control background-white" readonly>
                                    </label>
                                    <label>
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/>" class="form-control background-white" readonly>
                                    </label>
                                    <label class="m-l-10">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">제휴본사/총판/가맹점을 모두 선택해야 업로드 가능합니다<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light text-center">엑셀 업로드<%--<spring:message code="merchandise.insert.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <label for="excelFile" class="width-100 height-30 text-center background-gray line-height-30">파일업로드</label>
                                    <div class="d-inline-block align-bottom width-150 height-30 border overflow-hidden line-height-25 white-space-nowrap text-overflow-ellipsis">
                                        <span class="fileName1"></span>
                                    </div>
                                    <label class="m-l-10">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">업로드할 파일 양식을 선택하세요<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                    <input type="file" class="d-none" id="excelFile">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- end table-responsive -->
                    <div class="m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> 등록<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
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
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
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
            location.href = "${path}/merchant/uploadexcel/list";
        })
        /*$("#dataTable").dataTable({
            "paging" : true,
            "ordering" : true,
            "info" : true,
            "filter" : true,
            "lengthChange" : true,
            "order" : [[0, "desc"]]
        });*/
        let date = new Date();
        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $("#endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker('setDate', date);

        //사업자등록증
        $(document).on("change", "#excelFile", function (e) {
            e.preventDefault();

            let file = $("#excelFile")[0].files[0],
                reader = new FileReader();
            reader.readAsDataURL(file);
            let filename;
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                filename = file.name;
            } else {
                // old IE
                filename = $("#excelFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName1').text(filename);

            return false;
        });
    });
</script>
</body>
</html>
