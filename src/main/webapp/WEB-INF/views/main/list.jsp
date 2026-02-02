<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title></title>
    <%@include file="../common/include_head.jsp" %>
    <style>
        .switcher label:before {
            content: '';
            display: block;
            width: 46px;
            height: 20px;
            background: #d5dbe0;
            border: 1px solid #d5dbe0;
            -webkit-border-radius: 46px;
            border-radius: 46px;
            -webkit-transition: all .2s linear;
            -moz-transition: all .2s linear;
            -ms-transition: all .2s linear;
            -o-transition: all .2s linear;
            transition: all .2s linear;
        }

        .switcher label:after {
            content: '';
            height: 15px;
            width: 24px;
            position: absolute;
            left: 2px;
            top: 2px;
            background: #fff;
            -webkit-border-radius: 24px;
            border-radius: 24px;
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,.15);
            box-shadow: 0 1px 3px rgba(0,0,0,.15);
            -webkit-transition: all .2s linear;
            -moz-transition: all .2s linear;
            -ms-transition: all .2s linear;
            -o-transition: all .2s linear;
            transition: all .2s linear;
        }
        .switcher label {
            display: block;
            margin: 0;
            width: 46px;
            height: 15px;
            position: relative;
        }
        .table td, .table th {
            padding: 4px;
            vertical-align: top;
            border-top: 1px solid #e4e7ea;
        }
        .btn-sm {
            padding: 4px;
        }
    </style>
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <%@include file="../common/include_header.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="../common/include_sidebar.jsp" %>
    <!-- end #sidebar -->

    <!-- begin #content -->
    <div id="content" class="content">
        <!-- begin panel -->
        <div class="panel panel-inverse">
            <div class="panel-heading">
                <h1 class="panel-title">
                </h1>
                <div class="panel-heading-btn">
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i
                            class="fa fa-expand"></i></a>
                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i
                            class="fa fa-redo"></i></a>
                </div>
            </div>
            <!-- begin page-header -->
            <div class="col-xs-auto">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="javascript:;">기초정보관리</a></li>
                    <li class="breadcrumb-item active">기초예방접종리스트</li>
                </ol>
                <h1 class="m-t-15 rix-title">기초예방접종</h1>
            </div>
            <!-- end page-header -->
            <!--Begin Search-->
            <div class="row">
                <div class="col-12">
                    <div class="col-xs-auto">
                        <form role="form" class="form-inline pull-right search_form">
                            <div class="form-group m-r-10">
                                <%--                                <select class="form-control selectpicker width-150">--%>
                                <select class="form-control select_val" name="select_val">
                                    <option value="-1">종(선택)</option>
                                </select>
                            </div>
                            <div class="form-group m-r-10">
                                <%--   <select id="varietiesSelect" class="selectpicker varietiesSelect" data-live-search="true" data-style="btn-white" data-size="10">
                                    </select>--%>
                                <input type="text" name="varietiesSearch"  id="varietiesSearch" value="" class="select_val form-control varietiesSearch preventEnter" data-live-search="true" data-style="btn-white" data-size="10">
                            </div>
                            <div class="form-group">
                                <button type="button" class="search_btn btn btn-purple"><span
                                        class="fa fa-search">&nbsp;검색</span></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--End Search-->
            <div class="panel-body">
                <table id="dataTable"
                       class="display table table-bordered w-100 table-striped">
                </table>
                <!-- Begin add button-->
                <div class="row">
                    <div class="col-12">
                        <div class="pull-left col-xs-auto col-sm-auto">
                            <div class="pull-left col-xs-auto col-sm-auto">
                                <button type="button"
                                        data-toggle="modal"
                                        data-target="#add_modal"
                                        class="add_disease btn btn-primary form-control">
                                    <span class="fa fa-plus">&nbsp;등록</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End add button-->
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end #content -->
    <%--modal add start--%>
   <%-- <div class="modal fade" id="prevention_edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="update.jsp" %>
    </div>
    &lt;%&ndash;modal add end&ndash;%&gt;

    &lt;%&ndash;modal add start&ndash;%&gt;
    <div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="insert.jsp" %>
    </div>--%>
    <%--modal add end--%>


    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../common/include_common_js.jsp" %>
<%@include file="../common/include_datatables.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    $(document).ready(function(){
        appendSpeciesOption($(".select_val"));
        appendSpeciesOption($(".bprBsId"));
        _$tbody.on('click', '.update_row' , function (event) {
            column_select($(this).parents('td').parents('tr'));

            //console.log("_params::{}",  table.row(this));
            //edit
            let _$modal_Prevention_Edit = $('#prevention_edit_modal');
            let _$form = _$modal_Prevention_Edit.find('form');
            add_value(_$form, _params);
            //console.log("_params=", _params);
            _$modal_Prevention_Edit.modal().show();

            _$modal_Prevention_Edit.on('shown.bs.modal', function (event) {
                $('.update_btn').on('click', () => {
                    let req = convertFormToObj($('form.edit_form'));
                    let table = $("#dataTable").DataTable();
                    // console.log("req:::{}", req);
                    if (inputDataCheck(req)) {
                        swal_confirm(
                            '수정 하시겠습니까?',
                            '수정',
                            "${path}/api/prevention/update/",
                            "PUT",
                            req,
                            table,
                            _$modal_Prevention_Edit);
                    }
                });
            });
        });

        let _$modalAdd = $('#add_modal');
        _$modalAdd.on('show.bs.modal', function (event) {
            //등록
            $('.add_btn').on('click', function () {
                let table = $("#dataTable").DataTable();
                let _forms = _$modalAdd.find($('form.add_dialog'));
                let req = convertFormToObj(_forms);
                if (inputDataCheck(req)) {
                    swal_confirm(
                        '등록 하시겠습니까?',
                        '등록',
                        "${path}/api/prevention/insert",
                        "PUT",
                        req,
                        table,
                        _$modalAdd
                    );
                }
            });
        });
    });

    function changeActive(bprId, checkValue) {
        let dataTable = $("#dataTable").DataTable();
        let curValue = checkValue.value;
        let bprActive = 1;
        if(curValue == 1) bprActive = 0;
        let type = 'GET';
        let url = "${path}/api/prevention/updateStatus?bprId="+bprId+"&bprActive="+bprActive;
        executeAjax(url, type, null, dataTable, null);
    }

    function inputDataCheck(args, verify) {
        // console.log("args::{}", args);
        if (isNull(args.bprName)) {
            return alert_focus("bprName", "예방접종명을 입력해주세요.");
        } else if (isNull(args.bprInterval)) {
            return alert_focus("bprInterval", "주기간격(월)을 입력해주세요");
        } else if (isNull(args.bprContent)) {
            return alert_focus("bprContent", "예방접종상세를 입력해주세요.");
        }

        return true;
    }


</script>
</body>
</html>
