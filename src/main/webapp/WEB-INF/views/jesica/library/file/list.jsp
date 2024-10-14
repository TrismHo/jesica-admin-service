<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="관리자 자료"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae | <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="관리자 자료"/></title>
    </c:if>

</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-excel:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    div.dataTables_wrapper div.dataTables_processing {
        border: 1px solid #eee;
        z-index: 1;
        /* position: absolute;
         top: 264%;
         left: 10%;
         width: 200px;
         !* margin-left: -397px; *!
         !* margin-top: -26px; *!
         text-align: center;
         padding: 1em 0;*/

    }
    .active-on {
        opacity: 1;
    }
    .active-off {
        opacity: 0.5;
    }

    input[type="checkbox"]{
        display: none;
    }
    input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
    }
    input[id="check1"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
    }

</style>
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
    <form name="frmSearch" id="frmSearch">
        <!-- begin #content -->
        <div id="content" class="content p-0">
            <!-- begin panel -->
            <div class="panel panel-inverse m-t-1">
                <!-- begin page-header -->
                <div class="col-xs-auto p-t-20 p-b-0">
                    <ol class="breadcrumb float-xl-right">
                        <li class="breadcrumb-item"><a href="${path}/board/cust/list"><spring:message code="sidemenu.boardmanagement12" text="자료실"/></a></li>
                        <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="관리자 자료"/></li>
                    </ol>
                    <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="관리자 자료"/></h3>
                </div>
                <!-- end page-header -->
                <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch1">
                                    <input type="hidden" name="platformType" value="2">
                                    <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.registrationperiod1" text="등록기간"/><%--등록기간--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                </label>
                                                <label>
                                                    <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                            <td style="border-right: none">
                                                <label>
                                                    <select class="form-control searchOp" name="keywordType" style="width: 110px">
                                                        <option value="fileName" <c:if test="${searchValue.keywordType == 'custName'}">selected</c:if>><spring:message code="list.search.title1" text="파일명"/></option>
                                                        <option value="fileTitle" <c:if test="${searchValue.keywordType == 'custTel'}">selected</c:if>><spring:message code="list.search.title2" text="문서명"/></option>
                                                    </select>
                                                    <input type="text" class="form-control width-150" name="keyword" value="${searchValue.keyword}" maxlength="150">
                                                </label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <button type="button" data-toggle="modal" data-target="#give_coupon_all" class="btn btn-info add-library-btn" style="width: 115px;cursor: auto;" ><span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="자료등록"/></span></button>
                                    </button>
                                    <button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                        <thead>
                        <tr class="text-center">
                            <th width="3%"><spring:message code="list.word.no1" text="번호"/></th>
                            <th width="15%"><spring:message code="list.detail.title1" text="문서명"/></th>
                            <th width=""><spring:message code="list.word.contents1" text="파일명"/></th>
                            <th width="15%"><spring:message code="list.word.contents1" text="문서타입"/></th>
                            <th width="15%"><spring:message code="list.word.status12" text="등록자"/></th>
                            <th width="%"><spring:message code="list.word.contents1" text="등록일"/></th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <!-- end panel -->
        </div>
        <!-- end #content -->
    </form>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<%--<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/searchStore.jsp" %>
</div>--%>
<div class="modal fade" id="give_coupon_all" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/FileInput.jsp" %>
</div>
<%--modal add end--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<%-- Custom JS End--%>
<script>
    let couponAddList = [];
    let searchCustList = [];
    let tablePop = null;

    var newExportAction = function (e, dt, button, config) {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("엑셀 날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {
            var self = this;
            var oldStart = dt.settings()[0]._iDisplayStart;

            dt.one('preXhr', function (e, s, data) {
                // Just this once, load all data from the server...
                data.start = 0;
                data.length = 2147483647;

                dt.one('preDraw', function (e, settings) {
                    // Call the original action function
                    oldExportAction(self, e, dt, button, config);

                    dt.one('preXhr', function (e, s, data) {
                        // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                        // Set the property to what it was before exporting.
                        settings._iDisplayStart = oldStart;
                        data.start = oldStart;
                    });

                    // Reload the grid with the original page. Otherwise,
                    // API functions like table.cell(this) don't work properly.
                    setTimeout(dt.ajax.reload, 0);

                    // Prevent rendering of the full data to the DOM
                    return false;
                });
            });

            // Requery the server with the new one-time export settings
            dt.ajax.reload();
        }
    };

    $(() => {
        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/library/file/list","A2","1", {
            columns: [
                {data: "listIndex"},
                {data: "fileTitle"},
                {data: "fileName"},
                {data: "fileType"},
                {data: "insertUserName"},
                {data: "insertDate"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {
                    targets: 0,
                    width: '30px'
                },
                {
                    targets: 3,
                    width: '60px',
                    render: function(data){
                        if(data == 1){
                            return "공통";
                        } else if(data == 2){
                            return "총판";
                        } else if(data == 3){
                            return "사용자";
                        }
                    }
                },
                {
                    targets: [5],
                    render: function(data){
                        return dateFormat(data);
                    },
                },
            ],
        });

        $("#testTable_filter").text("");

        dateSetting();

        $(".searchOp").change(function(e) {
            let option = e.target.value;
            let nameForm = document.getElementById("custName");
            let telForm = document.getElementById("custTel");

            nameForm.value = '';
            telForm.value = '';

            switch (option) {
                case 'custName':
                    nameForm.style.display = 'inline';
                    telForm.style.display = 'none';
                    break;
                case 'custTel':
                    nameForm.style.display = 'none';
                    telForm.style.display = 'inline';
                    break;
            }
        });



        //상세
        $("#testTable").on('click','tbody td', function() {
            var row = $("#testTable").DataTable().row($(this).parents("tr")).data();
            if($(this)[0]._DT_CellIndex.column != 15){
                location.href = "${path}/library/file/detail?libNo=" + row.libNo;
            }
        });
    });


    var fileNo = 0;
    var filesArr = new Array();

    /* 첨부파일 추가 */
    function addFile(obj){
        var maxFileCnt = 5;   // 첨부파일 최대 개수
        var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
        var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
        var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

        // 첨부파일 개수 확인
        if (curFileCnt > remainFileCnt) {
            alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
        }

        for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

            const file = obj.files[i];

            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                };
                reader.readAsDataURL(file)

                // 목록 추가
                let htmlData = '';
                htmlData += '<tr id="file' + fileNo + '" class="filebox">';
                htmlData += '   <td class="fileName">' + file.name + '</td>';
                htmlData += '   <td class="fileSize">' + file.name + '</td>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
                htmlData += '</tr>';
                $('.file-list').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }
        // 초기화
        document.querySelector("input[type=file]").value = "";
    }

    /* 첨부파일 검증 */
    function validation(obj){
        const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
        if (obj.name.length > 100) {
            alert("파일명이 100자 이상인 파일은 제외되었습니다.");
            return false;
        } else if (obj.size > (100 * 1024 * 1024)) {
            alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
            return false;
        } else if (obj.name.lastIndexOf('.') == -1) {
            alert("확장자가 없는 파일은 제외되었습니다.");
            return false;
        } else if (!fileTypes.includes(obj.type)) {
            alert("첨부가 불가능한 파일은 제외되었습니다.");
            return false;
        } else {
            return true;
        }
    }

    /* 첨부파일 삭제 */
    function deleteFile(num) {
        document.querySelector("#file" + num).remove();
        filesArr[num].is_delete = true;
    }

    /* 폼 전송 */
    function submitForm() {
        // 폼데이터 담기
        var form = document.querySelector("form");
        var formData = new FormData(form);
        for (var i = 0; i < filesArr.length; i++) {
            // 삭제되지 않은 파일만 폼데이터에 담기
            if (!filesArr[i].is_delete) {
                formData.append("attach_file", filesArr[i]);
            }
        }

        $.ajax({
            method: 'POST',
            url: '/register',
            dataType: 'json',
            data: formData,
            async: true,
            timeout: 30000,
            cache: false,
            headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
            success: function () {
                alert("파일업로드 성공");
            },
            error: function (xhr, desc, err) {
                alert('에러가 발생 하였습니다.');
                return;
            }
        })
    }

    /*$(document).on("change", "#libFile", function (e) {
        e.preventDefault();
        let file = $("#libFile")[0].files[0],
            reader = new FileReader();
            reader.readAsDataURL(file);
        //파일명 삽입
        let fileName = "";
        if (window.FileReader) {
            // modern browser
            fileName = file.name;
        } else {
            // old IE
            fileName = $("#imgFile").val().split('/').pop().split('\\').pop();
        } // 추출한 파일명 삽입

        $('.fileName').text("변경할 이미지 :" + fileName);
        $('.fileSize').text("용량 :" + file.size + " Byte");

        return false;
    });*/


    function serarchForm() {
        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) {table.column(i).search(''); }

        table.column().draw();
    }

    function inputDataCheck(args) {
        if (isNull(args.fileName)) {
            return alert_focus("userId", "변경할 비밀번호를 입력해주세요.");
        }
        return true;
    }

</script>
</body>
</html>
