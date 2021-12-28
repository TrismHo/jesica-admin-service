<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jesicar | 엑셀양식</title>
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
                    <li class="breadcrumb-item active">엑셀양식<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">엑셀양식<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive">
                        <table id="user" class="table table-condensed table-bordered">
                            <tbody>
                            <tr>
                                <td class="bg-light">일괄등록(배민양식)<%--<spring:message code="merchandise.insert.affiliates" text="default text"/>--%><%--가맹점--%></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>파일다운로드</button>
                                    <label class="col-form-label">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나샵 일괄등록 양식<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">상품그룹<%--<spring:message code="merchandise.insert.merchanname" text="default text"/>--%><%--상품명--%></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>파일다운로드</button>
                                    <label class="col-form-label">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나샵 상품그룹 양식<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">상품<%--<spring:message code="merchandise.insert.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>파일다운로드</button>
                                    <label class="col-form-label">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나샵 상품 양식<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">상품옵션<%--<spring:message code="merchandise.insert.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>파일다운로드</button>
                                    <label class="col-form-label">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나샵 상품옵션 양식<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">추가상품 그룹<%--<spring:message code="merchandise.insert.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>파일다운로드</button>
                                    <label class="col-form-label">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나샵 추가상품 그룹 양식<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">추가상품<%--<spring:message code="merchandise.insert.onlinesalestatus" text="default text"/>--%><%--온라인 판매상태--%></td>
                                <td>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-check m-r-5"></i>파일다운로드</button>
                                    <label class="col-form-label">
                                        <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                            <strong class="font-size-10">만나샵 추가상품 양식<%--<spring:message code="merchandise.insert.affiliates.warning" text="default text"/>--%><%--[등록 후 변경불가] 상품을 등록할 가맹점을 선택합니다.--%> </strong>
                                        </i>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- end table-responsive -->
                    <button type="button" class="btn btn-primary btn_list float-right m-t-5 m-b-5 m-r-5"><i class="fa fa-list m-r-3"></i> <spring:message code="merchandise.insert.listbutton" text="default text"/><%--목록--%></button>
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
            location.href = "/merchant/uploadexcel/list";
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
    });
    /*function initPassword(bhId){
        let initPassword = document.createElement('span');
        initPassword.innerHTML = '비밀번호를 초기화 하시겠습니까?<br>초기화 비밀번호 : 1234';
        swal({
            content: initPassword,
            icon: "warning",
            buttons: [
                '취소',
                '초기화'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: "GET",
                    url: "${path}/usermanagement/initPassword?bhId="+bhId,
                    success: function() {
                        swal({
                            title: "초기화가 성공되었습니다.",
                            icon: "success",
                            button: '확인'
                        })
                    }
                });
            }
        });
    }

    /!*----------------------리스트 - 자동완성 검색 기능 시작----------------------*!/
    $(".hospitalName").autocomplete({
        //자동완성의 대상
        source: function (req, res) {
            let term = escapeHtml(req.term).trim().replaceAll("&quot;","").replace("선택된 데이터가 없습니다.","").trim();
            $.ajax({
                type: 'get',
                url: "${path}/hospitalmanagement/autolist",
                dataType: "json",
                data: {"term":term},
                success: function(data) {
                    data = data.autoList;
                    //서버에서 json 데이터 response 후 목록에 추가
                    res(
                        $.map(data, function(item) {
                            let address = new Array();
                            let addressStr = '';
                            if(item.bhAddress != null && item.bhAddress != "") {
                                address = item.bhAddress.split(" ");
                                addressStr = address[0] + " " + address[1];
                            }
                            return {
                                label: item.bhName + "(" + addressStr + ")",
                                item : item.bhId,
                                id : item.bhId,
                            }
                        })
                    );
                }
            });
        },
        minLength: 1,
        delay: 0,
        focus: function (event, ui) {
            return (event.keyCode === 40 || event.keyCode === 38) ? false : ui;
        },
        select: function (event, selected) {
            if(event.keyCode === 13) {
                $(".bmBhId").val(selected.item.id);
            }
            $(".bmBhId").val(selected.item.id);
        }
    });
    /!*----------------------리스트 - 자동완성검색 기능 끝----------------------*!/

    $(".hospital_search_val").on("keydown", function(event) {
        if(event.keyCode != 13)
            $(".bmBhId").val('');
    });

    function deleteRow(bmId) {
        let dataTable = $('#dataTable').DataTable();
        swal({
            title: "삭제하시겠습니까?",
            // text: "데이터가 수정됩니다.!",
            icon: "warning",
            buttons: [
                '취소',
                '삭제'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: "GET",
                    url: "/usermanagement/masterDelete?bmId="+bmId,
                    dataType: "json",
                    success: function() {
                        dataTable.ajax.reload();
                    }
                });
            }
        });
    }
    let _$modalAdd = $('#add_modal');
    let _$modalEdit = $('#edit_modal');

    _$modalAdd.on('show.bs.modal', function () {
        $("#bmBhId").val("");
        $('.save_btn').on('click', function () {
            let table = $("#dataTable").DataTable();
            let _forms = _$modalAdd.find($('.add_form'));
            let req = convertFormToObj(_forms);
            if (insertDataCheck(req)) {
                swal_confirm(
                    '등록 하시겠습니까?',
                    '등록',
                    "${path}/usermanagement/masterInsert/",
                    "POST",
                    req,
                    table,
                    _$modalAdd
                );
            }
        });
    });

    _$modalEdit.on('shown.bs.modal', function (event) {
        $('.update_btn').on('click', function () {
            let table = $("#dataTable").DataTable();
            let _forms = _$modalEdit.find($('form.edit_form'));
            let req = convertFormToObj(_forms);
            if (updateDataCheck(req)) {
                swal_confirm(
                    '수정 하시겠습니까?',
                    '수정',
                    "${path}/usermanagement/masterUpdate/",
                    "POST",
                    req,
                    table,
                    _$modalEdit
                );
            }
        });
    });

    _$tbody.on('click', 'a', function (event) {
        column_select($(this).parents('td').parents('tr'));

        let bmId = _params.bmId;
        let bmBhId = _params.bmBhId;
        let bhName = _params.bhName;
        let bmLoginId = _params.bmLoginId;
        let bmName = _params.bmName;
        let bmRole = _params.bmRole;

        $("#edit_bmId").val(bmId);
        $("#edit_bmBhId").val(bmBhId);
        $("#edit_search_val").val(bhName);
        $("#edit_bmLoginId").val(bmLoginId);
        $("#edit_bmName").val(bmName);
        $("#edit_bmRole").val(bmRole);
        $("#hp_edit_bmId").val(bmId);
        $("#hp_edit_bmBhId").val(bmBhId);
        $("#hp_edit_search_val").val(bhName);
        $("#hp_edit_bmLoginId").val(bmLoginId);
        $("#hp_edit_bmName").val(bmName);
        $("#hp_edit_bmRole").val(bmRole);
        _$modalEdit.modal().show();
    });

    function insertDataCheck(args) {
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        if (isNull(args.bmLoginId)) {
            return alert_focus("bmLoginId", "로그인ID를 입력해주세요.");
        } else if (isNull(args.bmLoginPwd)) {
            return alert_focus("bmLoginPwd", "비밀번호를 입력해주세요");
        } <c:if test="${sessionScope.sessionKey.bmRole == 0}"> else if (isNull(args.bmBhId)) {
            return alert_focus("search_val", "병원 검색 후 선택해주세요");
        }</c:if> else if (isNull(args.bmName)) {
            return alert_focus("bmName", "이름을 입력해주세요");
        } else if(!pwCheck) {
            return alert_focus("bmLoginPwd", "비밀번호는 8자리 이상, 영문+숫자+특수문자로 조합하여 설정해주세요.");
        }
        return true;
    }

    function updateDataCheck(args) {
        if (isNull(args.bmLoginId)) {
            return alert_focus("bmLoginId", "로그인ID를 입력해주세요.");
        } else if (isNull(args.bmName)) {
            return alert_focus("bmName", "이름을 입력해주세요");
        } <c:if test="${sessionScope.sessionKey.bmRole == 0}">else if (isNull(args.bmBhId)) {
            return alert_focus("search_val", "병원 검색 후 선택해주세요");
        }</c:if>
        return true;
    }*/
</script>
</body>
</html>
