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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting.merchandise" text="상품관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productdetails" text="차량관리 상세"/><%--안심번호 관리--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productdetails" text="안심번호 관리"/><%--안심번호 관리--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <%--<td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.distributormerchantname" text="가맹점명"/></strong></td>
                        <td style="width:35%">
                                <span class="text-green">[S${tbStoreRentalCar.store.storeNo}]</span> ${tbStoreRentalCar.store.storeName} </td>--%>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.carmodel" text="안심번호"/></strong></td>
                        <td ><span class="text-green"></span> ${tbSafenMapping.safenNum}</td>
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
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none"><spring:message code="list.detail.priceinformation" text="안심번호 할당로그"/><%--가격 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.priceinformation" text="안심번호 할당로그"/><%--가격 정보--%></span>
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
                                              ${tbStoreRentalCar.carModel}
                                          </td>
                                            <td class="text-danger-darker width-150"><spring:message code="list.description.345" text="차량의 모델명입니다." /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="번호판" /><%--상품상태--%></td>
                                          <td style="width:40%">
                                              ${tbStoreRentalCar.carNum}
                                          </td>
                                            <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="차량의 번호판입니다." /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light"><spring:message code="list.detail.333" text="상태" /><%--상품상태--%></td>
                                          <td colspan="1">
                                              <c:if test="${tbStoreRentalCar.dataStatus.ordinal() == 0}"> <spring:message code="list.detail.delete" text="삭제"/></c:if>
                                              <c:if test="${tbStoreRentalCar.dataStatus.ordinal() == 1}"><spring:message code="list.detail.normal" text="정상"/></c:if>
                                              <c:if test="${tbStoreRentalCar.dataStatus.ordinal() == 2}"><spring:message code="list.detail.stop" text="정지"/></c:if>
                                          </td>
                                          <td class="text-danger-darker"><spring:message code="list.description.123" text="현재 데이터의 상태입니다." /></td>
                                      </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="매핑여부" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               ${tbSafenMapping.mappingYn}
                                           </td>
                                           <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="차량과의 매핑여부입니다." /></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="매핑 전화번호" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               ${tbSafenMapping.mappingNum}
                                           </td>
                                           <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="매핑된 차량의 전화번호입니다." /></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="매핑시작일" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               <label class="font-size-10">
                                                   <javatime:format value="${tbSafenMapping.startDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                               </label>
                                           </td>
                                           <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="매핑이 시작된 날짜입니다." /></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="매핑종료일" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               <label class="font-size-10">
                                                   <javatime:format value="${tbSafenMapping.endDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                               </label>
                                           </td>
                                           <td class="text-danger-darker width-150"><spring:message code="list.description.343" text="매핑이 종료된 날짜입니다." /></td>
                                       </tr>
                                    </table>
                                    <div class="m-t-10">
                                        <button type="button" class="btn btn-primary btn_list m-l-10"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <div class="tab-pane fade" id="default-tab-2">
                        <div class="panel-body p-t-20">
                            <table id="testTable" class="display table table-bordered w-100 table-striped ">
                                <thead>
                                <th class="text-center" style="width: 50px"><spring:message code="list.word.no" text="순번"/></th>
                                <th class="text-center" style="width: 78px">안심번호</th>
                                <th class="text-center" style="width: 80px">매핑전화번호</th>
                                <th class="text-center" style="width: 98px">요청일</th>
                                <th class="text-center" style="width: 90px;">만료일</th>
                                <th class="text-center" style="width: 87px;">처리일</th>
                                <th class="text-center" style="width: 98px;">처리결과</th>
                                </thead>
                            </table>
                        </div>
                        <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e;">
                            <ul class="attachList p-0" style="margin-bottom:0px;" >
                                 <li >
                                     <div class="panel-body">
                                         <table id="" class="display table table-bordered w-100 table-striped ">
                                            <tbody>
                                            <c:choose>
                                                <c:when test="${tbSafenMappingLog.size() > 0}">
                                                    <c:forEach items="${tbSafenMappingLog}" var="item" varStatus="status" step="1">
                                                        <tr class="" >
                                                            <td style="width:50px;" class="text-center">${status.index + 1}</td>
                                                            <td style="width:78px;" class="text-center">${item.safenNum}</td>
                                                            <td style="width:80px;" class="text-center">${item.mappingNum}</td>
                                                            <td style="width:98px;" class="text-center"><javatime:format value="${item.sendDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                            <td style="width:90px;" class="text-center"><javatime:format value="${item.limitedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                            <td style="width:87px;" class="text-center"><javatime:format value="${item.returnDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                                            <td style="width:98px;" class="text-center">${item.result}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                        <tr class="" >
                                                            <td colspan="8" class="text-center"> 데이터가 없습니다. </td>
                                                        </tr>
                                                </c:otherwise>
                                            </c:choose>

                                           </tbody>
                                        </table>
                                     </div>
                                 </li>
                            </ul>
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
        location.href = "${path}/merchant/car/list";
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
