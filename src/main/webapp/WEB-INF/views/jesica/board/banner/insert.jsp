<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.1" text="배너 등록"/></title>
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
                    <li class="breadcrumb-item active"><spring:message code="list.detail.1" text="배너 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.1" text="배너 등록"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="insert_form" id="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" name="dataStatus" value="1">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="노출여부"/></td>
                                        <td>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" value="2" style="margin-right: 5px" checked>
                                                <span><spring:message code="list.detail.tothewhole" text="숨김"/></span>
                                            </label>
                                            <label class="m-r-10 " style="display: inline-flex; align-items: center">
                                                <input type="radio" name="serviceType" value="3" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate" text="노출"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="배너 노출여부를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="노출서비스"/></td>
                                        <td>
                                            <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                <input type="radio" name="validityType" class="serviceType" value="0" style="margin-right: 5px" checked>
                                                <span><spring:message code="list.detail.tothewhole" text="메인"/></span>
                                            </label>
                                            <label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="validityType" class="serviceType" value="2" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate" text="탁송"/></span>
                                            </label>
                                            <label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="validityType" class="serviceType" value="3" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate" text="맛집"/></span>
                                            </label>
                                            <label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="validityType" class="serviceType" value="4" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate" text="마트"/></span>
                                            </label>
                                            <label style="display: inline-flex; align-items: center">
                                                <input type="radio" name="validityType" class="serviceType" value="5" style="margin-right: 5px">
                                                <span><spring:message code="list.detail.affiliate" text="맛집예약"/></span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="유효기간 방식을 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr id="expireDate-form">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="만료일자"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control expireDate background-white"  name="expireDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰의 만료일자를 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr id="validDay-form" style="display: none">
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="유효일수"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control validDay background-white"  name="validDay">
                                                <span>일 후 만료</span>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰의 유효일수를 작성하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="발급가능 기간"/></td>
                                        <td>
                                            <label>
                                                <input type="text" class="form-control publishStartDate background-white"  name="publishStartDate" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                            </label>
                                            <label>
                                                <input type="text" class="form-control publishEndDate background-white" name="publishEndDate" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰의 발급가능기간을 선택하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.postclassification" text="할인방식"/></td>
                                        <td>
                                            <div style="display: flex; align-items: center">
                                            <span class="m-r-20">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="dcRateType" class="dcRateType" value="1" style="margin-right: 5px" checked>
                                                    <span><spring:message code="list.detail.tothewhole" text="할인금액"/></span>
                                                </label>
                                                <label style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="dcRateType" class="dcRateType" value="2" style="margin-right: 5px">
                                                    <span><spring:message code="list.detail.affiliate" text="할인율"/></span>
                                                </label>
                                            </span>

                                                <span>
                                                <input type="text" class="form-control dcAmt text-right" name="dcAmt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                <span id="amt-form">원</span>
                                                <span id="rate-form" style="display: none">%</span>
                                            </span>
                                            </div>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰의 할인방식을 선택 후 값 또는 비율을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.title" text="최대할인금액"/></td>
                                        <td>
                                            <input type="text" name="maxDcAmt" class="form-control maxDcAmt text-right"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                            <span>원</span>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="할인 가능한 최대금액을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.title" text="최소결제금액"/></td>
                                        <td>
                                            <input type="text" name="minPayAmt" class="form-control minPayAmt text-right"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                            <span>원</span>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰 사용에 필요한 최소결제금액을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.title" text="최대발급개수"/></td>
                                        <td>
                                            <input type="text" name="maxPublishCount" class="form-control maxPublishCount text-right"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                            <span>개</span>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰의 최대발급 가능 개수를 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.title" text="동일고객 중복발급가능개수"/></td>
                                        <td>
                                            <input type="text" name="multiPublishCount" class="form-control multiPublishCount text-right"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                            <span>개</span>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="한 고객당 발급 가능한 최대 개수를 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.title" text="쿠폰코드"/></td>
                                        <td><input type="text" name="couponCode" class="form-control width-full couponCode" maxlength="150"></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰코드를 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.title" text="쿠폰명"/></td>
                                        <td><input type="text" name="title" class="form-control width-full title" maxlength="150"></td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰명을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                        <td>
                                            <textarea name="body" class="form-control width-full body" rows="10"></textarea>
                                        </td>
                                        <td class="text-danger-darker" style="width:25%">
                                            <spring:message code="list.description.entertherepresentativebasemessage" text="쿠폰 설명을 입력하세요."/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light" rowspan="1"><spring:message code="list.detail.image1" text="배너 이미지"/></td>
                                        <td>
                                            <div class="category_sort">
                                                <ul class="sort_list">
                                                    <li>
                                                        <div class="sort_body1" id="sort_body1">
                                                            <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        * 권장 이미지 비율 : 984*876<br><br>
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
                    <div class="m-l-5">
                        <c:if test="${sessionScope.sessionKey.userRole == 0}">
                            <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> <spring:message code="list.detail.enrollment" text="등록"/></button>
                        </c:if>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
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

<div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/headSearch.jsp" %>
</div>
<div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/branchSearch.jsp" %>
</div>
<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/storeSearch.jsp" %>
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
        //imgFile
        $(document).on("change", "#imgFile", (e) => {
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
            if (window.FileReader) {
                // modern browser
                let filename = file.name;
            } else {
                // old IE
                let filename = $("#imgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.deliverymanFileName1').text("변경할 이미지 :" + filename);
            $('.deliverymanFileSize1').text("용량 :" + file.size + " Byte");

            return false;
        });

        $(".btn_list").click(function() {
            location.href = "${path}/board/banner/list";
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/deliveryman/insert/action";
            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);

            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let duplicatemsg = "<spring:message code="list.script.duplicateaccount" text="계정이 중복되었습니다."/>";

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
                        let formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbUserWorkerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        formData.append("imgFile2", $("#imgFile2")[0].files[0]);
                        $.ajax({
                            type: "POST",
                            url: url,
                            data:  formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    location.href = "${path}/driver/deliveryman/list";
                                } else if (data.result == 500) {
                                    alert(duplicatemsg);
                                    return;
                                }else {
                                    alert(confirmfailmsg);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });
    });



    function inputDataCheck(args) {
       if (isNull(args.name)) {
            return alert_focus("name", " 드라이버 이름을 입력해주세요");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "드라이버 연락처를 입력해주세요");
        } else if (isNull(args.storeNo)) {
            return alert_focus("storeNo", "가맹점을 선택해주세요");
        }
        return true;
    }

    function chk_file_type(obj) {
        let imgmsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="취소"/>";
        let file_kind = obj.value.lastIndexOf('.');
        let file_name = obj.value.substring(file_kind+1,obj.length);
        let file_type = file_name.toLowerCase();
        let check_file_type = new Array();
        check_file_type = ['jpg','gif','png','jpeg','bmp','tif'];

        if(check_file_type.indexOf(file_type) == -1) {
            alert(imgmsg);

            document.getElementById("imgFile").value = "";    //초기화를 위한 추가 코드
            document.getElementById("imgFile").select();        //초기화를 위한 추가 코드
            document.selection.clear();                          //일부 브라우저 미지원
            return false;
        }
    }
</script>
</body>
</html>
