<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.1" text="배너 상세"/></title>
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
                    <li class="breadcrumb-item"><spring:message code="sidemenu.1" text="게시판 관리"/></li>
                    <li class="breadcrumb-item"><a href="${path}/driver/deliveryman/list"><spring:message code="sidemenu.workgroupmanagement.1" text="배너 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.1" text="배너 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.1" text="배너 상세"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="update_form" id="update_form">
                            <input type="hidden" name="bannerNo" id="bannerNo" value="${tbAppBanner.bannerNo}">
                            <input type="hidden" name="dataStatus" value="1">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="노출서비스"/></td>
                                        <td>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="0" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="메인"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="2" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 2}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="탁송"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="3" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 3}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="맛집"/></span>
                                            </label>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="4" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 4}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="마트"/></span>
                                            </label>
                                            <%--<label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" class="serviceType" value="5" style="margin-right: 5px" <c:if test="${tbAppBanner.serviceType == 5}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="맛집예약"/></span>
                                            </label>--%>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="노출서비스를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="노출여부"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="viewYn" value="0" style="margin-right: 5px" <c:if test="${tbAppBanner.viewYn == 0}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="숨김"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="viewYn" value="1" style="margin-right: 5px" <c:if test="${tbAppBanner.viewYn == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="노출"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="배너 노출여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="게시판 종류"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" class="boardType" value="1" style="margin-right: 5px" <c:if test="${tbAppBanner.boardType == 1}">checked</c:if>>
                                                <span><spring:message code="list.detail.tothewhole" text="이벤트"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="boardType" class="boardType" value="2" style="margin-right: 5px" <c:if test="${tbAppBanner.boardType == 2}">checked</c:if>>
                                                <span><spring:message code="list.detail.affiliate" text="공지"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="게시판 종류를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="배너노출순서"/></td>
                                        <td>
                                            <input type="text" name="viewOrder" class="form-control viewOrder" value="${tbAppBanner.viewOrder}" readonly>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="배너 노출순서를 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="게시글 선택"/></td>
                                        <td>
                                            <input type="hidden" name="boardNo" class="selBoardNo" id="boardNo" value="${tbAppBanner.boardNo}">
                                            <button type="button" data-toggle="modal" data-target="#board_search_modal" class="btn btn-primary board-search-btn">
                                                <span class="fa fa-search m-r-3"></span>
                                                <spring:message code="list.search.noticeregistration" text="게시글 검색"/>
                                            </button>
                                            <span id="board_title" class="m-l-10"></span>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="연결할 게시글을 검색 후 선택해주세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image1" text="배너 이미지"/></td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body1" id="sort_body1">
                                                            <img class="width-full" style="width: 192px; height: 54px" src="/api/img/fileLoad?filePath=${imgFile}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        * 권장 이미지 비율 : 32:9<br><br>
                                                        <div class="deliverymanFileName1"></div>
                                                        <br>
                                                        <div class="deliverymanFileSize1"></div>
                                                    </li>
                                                </ul>
                                                <label for="imgFile">
                                                    <div class="button_base b03_skewed_slide_in btn btn-primary">
                                                        <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                    </div>
                                                </label>
                                                <input type="file" id="imgFile" name="imgFile" class="fileBtn d-none" accept="image/*" >
                                            </div>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.registerapictureofthedeliveryperson1" text="배너 이미지를 등록하세요."/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5" style="display: flex; align-content: center">
                        <span>
                            <button type="button" class="btn btn-primary btn_list m-t-5" style="display: flex; align-items: center">
                                <i class="fa fa-list"></i>
                                <span class="m-l-5"><spring:message code="list.detail.list" text="목록"/></span>
                            </button>
                        </span>
                            <span style="display: flex; align-items: center; margin-left: auto">
                            <button type="button" class="btn btn-primary btn_update m-r-5" style="display: flex; align-items: center">
                                <i class="fa fa-check"></i>
                                <span class="m-l-5"><spring:message code="list.detail.enrollment" text="수정"/></span>
                            </button>
                            <button type="button" class="btn btn-danger btn_remove m-t-5 m-b-5" style="display: flex; align-items: center">
                                <i class="fa fa-trash-alt"></i>
                                <span class="m-l-5"><spring:message code="list.detail.delete" text="삭제"/></span>
                            </button>
                        </span>
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

<div class="modal fade" id="board_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/boardSearch.jsp" %>
</div>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<%--<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>--%>
<script src="${path}/assets/plugins/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${path}/assets/plugins/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${path}/assets/plugins/blueimp-gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-audio.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-video.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-validate.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-ui.js"></script>
<script src="${path}/assets/plugins/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />

<script>
    $(() => {
        let boardType = $("input[type='radio'][name='boardType']:checked").val();
        let boardNo = $("#boardNo").val();
        let originBoardTitle = '';
        $.ajax({
            type: "GET",
            url: "${path}/api/board/search",
            data: {
                boardType,
                boardNo,
            },
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                let boardTitle = data.boardList[0].title + "[" + convertInsertDate(data.boardList[0].insertDate) + "]";
                if (boardType == 1) {
                    boardNo = data.boardList[0].eventNo;
                } else {
                    boardNo = data.boardList[0].noticeNo;
                }
                $('.selBoardNo').val(boardNo);
                $('#board_title').text(boardTitle);
                originBoardTitle = boardTitle;
            }
        });

        //imgFile
        $(document).on("change", "#imgFile", function(e) {
            e.preventDefault();

            let result = chk_file_type(this);
            let file = $("#imgFile")[0].files[0],

            reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                let img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body1.innerHTML = '';
                    sort_body1.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            let filename;
            if (window.FileReader) {
                // modern browser
                filename = file.name;
            } else {
                // old IE
                filename = $("#imgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName1').text("변경할 이미지 :" + filename);
            $('.deliverymanFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });

        $(".btn_list").click(function() {
            location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=";
        });

        $(".boardType").click((e) => {
            let value = e.target.value;

            if (boardType !== value) {
                $("#boardNo").val("");
                $("#board_title").text('');
            } else {
                $("#boardNo").val('${tbAppBanner.boardNo}');
                $("#board_title").text(originBoardTitle);
            }
        });

        $(document).on("click", "#selBoardNoBtn", function() {
            $('#board_title').text('');
            let boardType = $("input[type='radio'][name='boardType']:checked").val();
            let boardTitle = $(this).closest("li").find(".board_text").text();
            let boardNo;
            if (boardType == 1) {
                boardNo = $(this).attr('eventNo');
            } else {
                boardNo = $(this).attr('noticeNo');
            }
            $('.selBoardNo').val(boardNo);
            $('#board_title').text(boardTitle);
            $('.boardModalCloseBtn').click();
        });

        $(document).on("click", ".btn_update", function() {
            let url = "${path}/api/banner/update";
            let _forms = $('#update_form');
            let req = convertFormToObj(_forms);
            let bannerNo = req.bannerNo;

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="수정에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="수정 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";

           if (inputDataCheck(req)) {
                swal({
                    title: confirmmsg,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        let formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbAppBannerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        $.ajax({
                            type: "PUT",
                            url: url,
                            data: formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    location.href = "${path}/board/banner/detail?bannerNo=" + bannerNo;
                                } else {
                                    alert(confirmfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        //게시글 검색
        $(".searchBoardBtn").on("click", () => {
            let noregisteredaffiliateheadquarters = "<spring:message code="list.script.noregisteredaffiliateheadquarters" text="검색된 게시글이 존재하지 않습니다."/>";
            let apply = "<spring:message code="list.script.apply" text="적용"/>";
            // let req = convertFormToObj($('form.board_search_form'));
            let boardType = $("input[type='radio'][name='boardType']:checked").val();
            let keyword = $('#keyword').val();

            $.ajax({
                type: "GET",
                url: "${path}/api/board/search",
                data: {
                    boardType,
                    keyword,
                },
                contentType: "application/json;",
                dataType: "json",
                success: (data) => {
                    resetSearchResult();
                    if(data.boardList.length == 0 || data.boardList == null) {
                        $(".searchBoardList").append(
                            " <li >" +
                            "     <label class=\"b_text\">\n" +
                            noregisteredaffiliateheadquarters+
                            "     </label>\n" +
                            "     <div class=\"float-right \"></div>\n" +
                            " </li>"
                        )
                    } else {
                        for (let i = 0 ; i < data.boardList.length ; i++) {
                            let insertDate = convertInsertDate(data.boardList[i].insertDate);
                            if (boardType == 1) {
                                $(".searchBoardList").append(
                                    " <li >" +
                                    "     <label class=\"board_text\">\n" +
                                    ""+data.boardList[i].title+""+
                                    "<small style=\"color: green;\">["+ insertDate +"]</small>\n" +
                                    "     </label>\n" +
                                    "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBoardNoBtn\" title="+data.boardList[i].title+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" eventNo="+data.boardList[i].eventNo+" value='"+apply+"'></div>\n" +
                                    " </li>"
                                )
                            } else {
                                $(".searchBoardList").append(
                                    " <li >" +
                                    "     <label class=\"board_text\">\n" +
                                    ""+data.boardList[i].title+""+
                                    "<small style=\"color: green;\">["+ insertDate +"]</small>\n" +
                                    "     </label>\n" +
                                    "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBoardNoBtn\" title="+data.boardList[i].title+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" noticeNo="+data.boardList[i].noticeNo+" value='"+apply+"'></div>\n" +
                                    " </li>"
                                )
                            }
                        }
                    }
                }
            });
        });

        $('#keyword').on('keydown', (e) => {
            if (e.keyCode === 13) {
                $('.searchBoardBtn').click();
            }
        });

        $("#board_search_modal").on('show.bs.modal', () => {
            $('.searchBoardBtn').click();
        });

        $(".btn_remove").click(() => {
            let bannerNo = $("#bannerNo").val();
            let url = '${path}/api/banner/delete';
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted" text="삭제되었습니다."/>";

            swal({
                title: doyouwanttodelete,
                icon: 'warning',
                buttons: [
                    cancel,
                    deletemsg,
                ],
                dangerMode: true,
            }).then((isConfirm) => {
                if (isConfirm) {
                    $.ajax({
                        type: 'DELETE',
                        url: url,
                        data: {
                            bannerNo
                        },
                        dataType: 'json',
                        success: (data) => {
                            if (data.result == 200) {
                                alert(deleted);
                                location.href = "${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType=";
                            } else {
                                alert(deletionfailed);
                                return;
                            }
                        }
                    })
                }
            })
        });
    });



    function inputDataCheck(args) {
        if (isNull(args.boardNo)) {
            return alert_focus("board-search-btn", "게시글을 검색후 선택해주세요");
        }
        return true;
    }

    function chk_file_type(obj) {
        let imgmsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="취소"/>";
        let file_kind = obj.value.lastIndexOf('.');
        let file_name = obj.value.substring(file_kind + 1, obj.length);
        let file_type = file_name.toLowerCase();
        let check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp', 'tif'];

        if(check_file_type.indexOf(file_type) == -1) {

            alert(imgmsg);
            let parent_Obj=obj.parentNode;
            let node = parent_Obj.replaceChild(obj.cloneNode(true),obj);

            document.getElementById("imgFile").value = "";    //초기화를 위한 추가 코드
            document.getElementById("imgFile").select();        //초기화를 위한 추가 코드
            document.selection.clear();                          //일부 브라우저 미지원
            return false;
        }
    }

    function convertInsertDate(date) {
        return date.replace("T", " ");
    }

    function resetSearchResult() {
        $(".searchBoardList").html("");
    }
    function getToday() {
        let dateObj = new Date();
        let year = dateObj.getFullYear();
        let month = dateObj.getMonth() + 1 < 10 ? '0' + (dateObj.getMonth() + 1) : (dateObj.getMonth() + 1);
        let date = dateObj.getDate() < 10 ? '0' + dateObj.getDate() : dateObj.getDate();
        return year + '-' + month + '-' + date;
    }
</script>
</body>
</html>
