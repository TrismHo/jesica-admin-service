<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productdetails" text="출금 신청관리상세"/></title>
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
        <form id="update_form">
        <div class="col-xl-12">
            <!-- begin nav-tabs -->
            <!-- begin page-header -->
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="정산"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting.merchandise" text="출금 신청관리"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productdetails" text="출금 신청관리상세"/><%--안심번호 관리--%></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productdetails" text="출금 신청관리상세"/><%--안심번호 관리--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <%--<td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.distributormerchantname" text="가맹점명"/></strong></td>
                        <td style="width:35%">
                                <span class="text-green">[S${tbStoreRentalCar.store.storeNo}]</span> ${tbStoreRentalCar.store.storeName} </td>--%>
                        <td class="bg-light" style="width:15%;"><strong><spring:message code="list.detail.carmodel" text="사용자타입"/></strong></td>
                        <td style="width:35%;">
                            <c:if test="${tbCashWithdraw.groupType == '1'}" >제휴본사</c:if>
                            <c:if test="${tbCashWithdraw.groupType == '2'}" >총판</c:if>
                            <c:if test="${tbCashWithdraw.groupType == '3'}" >가맹점</c:if>
                            <c:if test="${tbCashWithdraw.groupType == '4'}" >배송원</c:if>
                            <input type="hidden" value="${tbCashWithdraw.groupType}" name="groupType">
                        </td>
                        <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="출금상태" /><%--상품상태--%></td>
                        <td style="width:35%;">
                            <c:if test="${tbCashWithdraw.withdrawStatus == '0'}">출금대기</c:if>
                            <c:if test="${tbCashWithdraw.withdrawStatus == '1'}">처리중</c:if>
                            <c:if test="${tbCashWithdraw.withdrawStatus == '2'}">출금완료(<javatime:format value="${tbCashWithdraw.withdrawDate}" pattern="yyyy-MM-dd HH:mm:ss" />)</c:if>
                            <c:if test="${tbCashWithdraw.withdrawStatus == '3'}">실패</c:if>
                            <input type="hidden" class="withdrawStatus" value="${tbCashWithdraw.withdrawStatus}">
                            <input type="hidden" class="form-control width-200 withdrawDate"  value="<javatime:format value="${tbCashWithdraw.withdrawDate}" pattern="yyyy-MM-dd HH:mm:ss" />">
                        </td>
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

                                <input type="hidden" name="withdrawNo" value="${tbCashWithdraw.withdrawNo}">
                                   <table class="table table-condensed table-bordered">

                                        <tr>
                                          <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="그룹명" /><%--상품상태--%></td>
                                          <td style="width:40%">
                                              <input type="text" class="form-control groupName" name="groupName" value="${tbCashWithdraw.groupName}" readonly>
                                          </td>
                                            <td class="text-danger-darker width-200"><spring:message code="list.description.343" text="수정불가" /></td>
                                        </tr>
                                        <tr>
                                          <td class="bg-light"><spring:message code="list.detail.333" text="연락처" /><%--상품상태--%></td>
                                          <td colspan="1">
                                              <input type="text" class="form-control phone" name="phone" value="${tbCashWithdraw.phone}" readonly>
                                          </td>
                                          <td class="text-danger-darker" ><spring:message code="list.description.123" text="수정불가" /></td>
                                      </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="요청액" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               <label class="font-size-10">
                                                   <input type="text" class="form-control numberOnly width-200 reqAmount" name="reqAmount" value="${tbCashWithdraw.reqAmount}" numberOnly <c:if test="${tbCashWithdraw.withdrawStatus != '0'}">readonly</c:if>> 원
                                               </label>
                                           </td>
                                           <td class="text-danger-darker width-200"><spring:message code="list.description.343" text="요청액을 입력해주세요." /></td>
                                       </tr>

                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="수수료" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               <label class="font-size-10">
                                                   <input type="text" class="form-control width-200 numberOnly fee" name="fee" value="${tbCashWithdraw.fee}" numberOnly <c:if test="${tbCashWithdraw.withdrawStatus != '0'}">readonly</c:if>> 원
                                               </label>
                                           </td>
                                           <td class="text-danger-darker width-200"><spring:message code="list.description.343" text="수수료를 입력해주세요." /></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%"><spring:message code="list.detail.carNum" text="출금액" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               <label class="font-size-10">
                                                   <input type="text" class="form-control numberOnly width-200 cash" name="cash" value="${tbCashWithdraw.cash}" readonly> 원
                                               </label>
                                           </td>
                                           <td class="text-danger-darker width-200"><spring:message code="list.description.343" text="수정불가" /></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light"><spring:message code="list.detail.withdrawalaccount" text="출금계좌"/></td>
                                           <td class="p-0 border-0">
                                               <table class="width-full border-0">
                                                   <tr>
                                                       <td class="border-left-0 border-top-0 width-200"><spring:message code="list.detail.bank" text="은행"/></td>
                                                       <td class="border-top-0 border-right-0"><input type="text" name="bankTypeCode" class="form-control width-200 "  value="${tbCashWithdraw.bankName}" readonly>
                                                           <input type="hidden" class="form-control numberOnly fee" name="bankCode" value="${tbCashWithdraw.bankCode}" numberOnly>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.accountnumber" text="계좌번호"/></td>
                                                       <td class="border-right-0">
                                                           <input type="text" class="form-control width-200 " value="${accountNo}" readonly>
                                                           <input type="hidden" class="form-control width-200 accountNo" name="accountNo" value="${tbCashWithdraw.accountNo}" readonly>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td class="border-left-0 border-bottom-0"><spring:message code="list.detail.accountholder" text="예금주"/></td>
                                                       <td class="border-right-0 border-bottom-0">
                                                           <input type="text" class="form-control width-200"  value="${accountName}" readonly>
                                                           <input type="hidden" class="form-control width-200 accountName" name="accountName" value="${tbCashWithdraw.accountName}" readonly>
                                                       </td>
                                                   </tr>
                                               </table>
                                           </td>
                                           <td class="text-danger-darker"><spring:message code="list.description.cannotbemodified" text="수정불가"/></td>
                                       </tr>
                                       <tr>
                                           <td class="bg-light" style="width:15%;"><spring:message code="list.detail.carNum" text="메모" /><%--상품상태--%></td>
                                           <td style="width:40%">
                                               <label class="font-size-10">
                                                   <input type="text" class="form-control width-500 memo" name="memo" value="${tbCashWithdraw.memo}" <c:if test="${tbCashWithdraw.withdrawStatus != '0'}">readonly</c:if>>
                                               </label>
                                           </td>
                                           <td class="text-danger-darker width-200" ><spring:message code="list.description.343" text="메모를 입력해주세요(출금완료 후 변경불가)"/></td>
                                       </tr>
                                    </table>
                                    <input type="hidden" class="withdrawStatusHidden" name="withdrawStatus" value="${tbCashWithdraw.withdrawStatus}">
                                    <div class="m-t-10">
                                        <button type="button" class="btn btn-primary btn_list m-l-10"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                        <c:if test="${tbCashWithdraw.withdrawStatus == '0'}"><button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-cash-register m-r-3"></i> <spring:message code="list.detail.list" text="출금완료처리"/></button></c:if>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- end row -->
    </div>
    <!-- end #content -->

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>



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
        location.href = "${path}/settlement/cashwithdraw/list?startDate=2020-01-01&endDate=${now}";
    });
    $(".reqAmount").keyup(function() {

        $(".cash").val($(this).val() - $(".fee").val());
    });
    $(".fee").keyup(function() {
        $(".cash").val($(".reqAmount").val() - $(".fee").val());
    });
    $(".withdrawDate").datetimepicker({
        format:'YYYY-MM-DD HH:mm:ss',
    });
        $(document).on("click", ".btn_update", function () {
            $(".withdrawStatusHidden").val(2);
            let url = "${path}/api/cashwithdraw/update/action";
            let _forms = $('#update_form');
            let withdrawDate = $(".withdrawDate").val();
            let req = convertFormToObj(_forms);
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="출금완료처리 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update1" text="출금완료처리"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="출금완료처리에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="출금완료처리에 실패하였습니다."/>";
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
                        formData.append("tbCashWithdraw",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("withdrawDate",  withdrawDate);
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
            if (isNull(args.groupName)) {
                return alert_focus("carModel", "그룹명을 입력해주세요.");
            } else if (isNull(args.phone)) {
                return alert_focus("phone", "연락처를 입력해주세요.");
            }
            return true;
        }
</script>
</body>
</html>
