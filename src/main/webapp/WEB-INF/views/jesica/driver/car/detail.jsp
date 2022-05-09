<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productdetails" text="차량관리 상세"/></title>
</head>
<style>


</style>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
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
            <!-- begin nav-tabs -->
            <!-- begin page-header -->
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/driver/car/list"><spring:message code="sidemenu.merchantsetting.123" text="렌터카"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.123" text="렌터카 상세"/><%--차량관리 상세--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.123" text="렌터카 상세"/><%--차량관리 상세--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.distributormerchantname" text="가맹점명"/></strong></td>
                        <td style="width:35%">
                                <span class="text-green">[S${tbStoreRentalCar.store.storeNo}]</span> ${tbStoreRentalCar.store.storeName} </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.carmodel" text="차량명"/></strong></td>
                        <td ><span class="text-green"></span>${tbStoreRentalCar.carModel}</td>
                    </tr>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본 정보"/><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본 정보"/><%--기본 정보--%></span>
                    </a>
                </li>
            </ul>

            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="" >
                        <div class="table-responsive" >
                            <form id="update_form">
                                <input type="hidden" name="storeNo" value="${tbStoreRentalCar.store.storeNo}">
                                <input type="hidden" id="rentalCarNo" name="rentalCarNo" value="${tbStoreRentalCar.rentalCarNo}">
                                   <table class="table table-condensed table-bordered">
                                        <tr>
                                          <td class="bg-light" style="width:15%"><spring:message code="list.detail.carmodel" text="모델명" /><%--상품상태--%></td>
                                          <td style="width:40%">
                                              <label class="font-size-10">
                                                  <input type="text" class="form-control width-200 carModel" name="carModel" value="${tbStoreRentalCar.carModel}" maxlength="20">
                                              </label>
                                          </td>
                                            <td class="text-danger-darker width-150"><spring:message code="list.description.345" text="모델명을 입력해주세요." /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="번호판" /><%--상품상태--%></td>
                                          <td style="width:40%">
                                              <label class="font-size-10">
                                                  <input type="text" class="form-control width-200 carNum" name="carNum" value="${tbStoreRentalCar.carNum}" maxlength="8">
                                              </label>
                                          </td>
                                            <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="번호판을 입력해주세요." /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="안심번호" /><%--상품상태--%></td>
                                          <td style="width:40%">
                                              <label class="font-size-10">
                                                  <input type="text" class="form-control width-200 safenNumTxt" value="${tbStoreRentalCar.safenNum}" readonly>
                                                  <input type="hidden" class="form-control width-200 safenNum" name="safenNum" value="${tbStoreRentalCar.safenNum}">
                                              </label>
                                          </td>
                                            <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="변경불가" /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light"><spring:message code="list.detail.333" text="상태" /><%--상품상태--%></td>
                                          <td colspan="1">
                                              <label class="">
                                                  <input type="radio" name="dataStatus" value="0" class="align-bottom" <c:if test="${tbStoreRentalCar.dataStatus.ordinal() == 0}">checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/><%--정상--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="dataStatus" value="1" class="align-bottom" <c:if test="${tbStoreRentalCar.dataStatus.ordinal() == 1}">checked</c:if>><spring:message code="list.detail.normal" text="정상"/><%--정지--%>
                                              </label>
                                              <label class="m-l-10 ">
                                                  <input type="radio" name="dataStatus" value="2" class="align-bottom" <c:if test="${tbStoreRentalCar.dataStatus.ordinal() == 2}">checked</c:if>><spring:message code="list.detail.stop" text="정지"/><%--정지--%>
                                              </label>
                                          </td>
                                          <td class="text-danger-darker"><spring:message code="list.description.123" text="상태를 선택해주세요" /></td>
                                      </tr>
                                    </table>
                                    <div class="m-t-10">
                                        <button type="button" class="btn btn-primary btn_list m-l-10"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                        <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
              <%--  <!-- end tab-pane -->
                <div class="m-t-10">
                    <button type="button" class="btn btn-primary btn_add float-right"><i class="fa fa-check m-r-3"></i> <spring:message code="button.update" text="수정"/>&lt;%&ndash;수정&ndash;%&gt;&lt;%&ndash;<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                    <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="button.list" text="목록"/>&lt;%&ndash;목록&ndash;%&gt;&lt;%&ndash;<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                </div>--%>
            </div>
            <!-- end tab-content -->
            <!-- begin nav-pills -->
            <!-- end nav-pills -->
            <!-- begin tab-content -->
            <!-- end tab-content -->
        </div>
        <!-- end row -->
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


<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
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
<script src="${path}/assets/plugins/dropzone/dist/dropzone.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/ui-tree.demo.js" type="text/javascript"></script>
<script src="${path}/assets/plugins/jstree/dist/jstree.js" type="text/javascript"></script>
<link href="${path}/assets/plugins/dropzone/dist/dropzone.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/jstree.css" />
<%@include file="../../../common/include_number_only_js.jsp" %>

<%--<script src="../../assets/js/demo/jquery.tablesorter.min.js"></script>
<script src="../../assets/js/demo/jquery.tablesorter.js"></script>--%>
<script>
    $(".btn_list").click(function() {
        location.href = "${path}/driver/car/list";
    });
        $(document).on("click", ".btn_update", function () {
            let url = "${path}/api/car/update/action";
            let _forms = $('#update_form');

            let req = convertFormToObj(_forms);

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            if (inputDataCheck(req)) {
                swal({
                    title: wouldyouliketoupdate,
                    icon: "warning",
                    buttons: [
                        cancel,
                        update
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbStoreRentalCarData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: formData,
                            /*contentType: "application/json;",*/
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    alert(updatesussmsg);
                                    location.reload();
                                } else {
                                    alert(editfailed);
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        function inputDataCheck(args) {
            let carModelmsg = "<spring:message code="list.script.23" text="차랑모델을 입력해주세요."/>";
            let carNummsg = "<spring:message code="list.script.12" text="차량번호를 입력해주세요."/>";
            let selstoremsg = "<spring:message code="list.script.12" text="가맹점을 선택해주세요."/>";
            if (isNull(args.carModel)) {
                return alert_focus("carModel", carModelmsg);
            } else if (isNull(args.carNum)) {
                return alert_focus("carNum", carNummsg);
            } else if (isNull(args.storeNo)) {
                return alert_focus("storeNo", selstoremsg);
            }
            return true;
        }
</script>
</body>
</html>
