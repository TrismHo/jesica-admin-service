<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="list.detail.productoptiondetail" text="상품옵션 상세"/></title>
</head>
<style>
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <!-- begin nav-tabs -->
            <!-- begin page-header -->
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.merchantsetting" text="가맹점 설정"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="/merchant/merchanext/list"><spring:message code="sidemenu.merchantsetting.merchandise.option" text="상품옵션"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.productoptiondetail" text="상품옵션 상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.productoptiondetail" text="상품옵션 상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong><spring:message code="list.detail.workgroupmanagement" text="업무그룹"/></strong></td>
                        <td style="width:35%">
                            <span class="text-green">[H${tbStore.head.headNo}]</span> ${tbStore.head.headName} &nbsp;|&nbsp;
                            <span class="text-green">[B${tbStore.branch.branchNo}]</span> ${tbStore.branch.branchName}
                        </td>
                        <td class="bg-light" style="width:15%"><strong><spring:message code="list.detail.franchiseeheadquarters" text="가맹점명"/></strong></td>
                        <td>
                            <span class="text-green" style="width:35%">[S${tbStore.storeNo}]</span> ${tbStore.storeName}
                        </td>
                    </tr>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicinformation" text="기본 정보"/><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicinformation" text="기본 정보"/><%--기본 정보--%></span>
                    </a>
                </li>
            </ul>

            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="table-responsive" style="overflow: hidden;">

                        <table class="table table-condensed table-bordered">
                            <form id="update_form">
                                <input type="hidden" id="storeOptNo" name="storeOptNo" value="${tbStoreOptionDetail.storeOptNo}">
                                <input type="hidden" name="storeNo" value="${tbStoreOptionDetail.storeNo}">
                                <tr>
                                    <td class="border-0 bg-light" style="width:15%"><spring:message code="list.detail.optionname" text="옵션명칭"/><%--정상 판매가--%></td>
                                    <td style="width: 60%"><input type="text" name="optName" class="form-control width-200 optName"  value="${tbStoreOptionDetail.optName}" maxlength="85"><%--KRW--%></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.enteranoptionname" text="옵션 이름을 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.optionclassification" text="옵션구분"/><%--검색 단어--%></td>
                                    <td>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="mandatoryYn" value="true" class="align-bottom mandatoryYn" <c:if test="${tbStoreOptionDetail.mandatoryYn == true}">checked</c:if>><spring:message code="list.detail.requiredoption" text="필수옵션"/><%--정지(품절표시)--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="mandatoryYn" value="false" class="align-bottom mandatoryYn" <c:if test="${tbStoreOptionDetail.mandatoryYn == false}">checked</c:if>><spring:message code="list.detail.selectoption" text="선택옵션"/><%--정지(품절표시)--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.selectrequiredoptionminmessage" text="필수/선택 옵션 여부를 선택하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.minimumrequirednumberofchoices" text="최소 필수선택개수"/><%--1회 주문제한 수량--%></td>
                                    <td><input type="text" name="minSelectCnt" class="form-control width-200 minSelectCnt" numberOnly value="${tbStoreOptionDetail.minSelectCnt}" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.entertherequiredminimumnumbertoselect" text="필수로 선택할 최소 개수를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.maximumnumberofchoices" text="최대 선택가능개수"/><%--1일 주문제한 수량--%></td>
                                    <td><input type="text" name="maxSelectCnt" class="form-control width-200 maxSelectCnt" numberOnly value="${tbStoreOptionDetail.maxSelectCnt}" maxlength="7"><spring:message code="list.detail.piece" text="개"/><%--개--%></td>
                                    <td class="text-danger-darker"><spring:message code="list.description.maximumnumberselectmessage" text="선택 가능한 최대 개수를 입력하세요."/></td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.optionstatus" text="옵션 상태"/><%--정상 판매가--%></td>
                                    <td>
                                        <label class="">
                                            <input type="radio" name="dataStatus" value="0" class="align-bottom dataStatus" <c:if test="${tbStoreOptionDetail.dataStatus.ordinal() == 0}">checked</c:if>> <spring:message code="list.detail.delete" text="삭제"/><%--정상--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="1" class="align-bottom dataStatus" <c:if test="${tbStoreOptionDetail.dataStatus.ordinal() == 1}">checked</c:if>><spring:message code="list.detail.normal" text="정상"/><%--정지(품절표시)--%>
                                        </label>
                                        <label class="m-l-10 ">
                                            <input type="radio" name="dataStatus" value="2" class="align-bottom dataStatus" <c:if test="${tbStoreOptionDetail.dataStatus.ordinal() == 2}">checked</c:if>><spring:message code="list.detail.stop" text="정지"/><%--정지(품절표시)--%>
                                        </label>
                                    </td>
                                    <td class="text-danger-darker"><spring:message code="list.description.chooseyourstatus" text="상태를 선택하세요."/></td>
                                </tr>
                            </form>
                            <tr id="basicOptionYnView" >
                                <td colspan="2" class="p-0">
                                    <div class="tab-pane fade active show" >
                                        <form id="update_form2" style="width: 100%;" class="p-0">
                                            <div class="panel panel-inverse">
                                                <div class="height-300 overflow-auto border">
                                                    <input type="hidden"  class="viewOrder" value="">
                                                    <table class="table table-bordered border-bottom text-center border-0 tbStoreOptionItemTable">
                                                        <thead>
                                                        <tr>
                                                            <th class="bg-light" style="width:40%"><spring:message code="list.detail.itemname" text="아이템 명"/></th>
                                                            <th class="bg-light" style="width:20%"><spring:message code="list.detail.salesstatus" text="판매상태"/></th>
                                                            <th class="bg-light" style="width:20%"><spring:message code="list.detail.price" text="금액"/></th>
                                                            <th class="bg-light"></th>
                                                        </tr>
                                                        <tr class="border-0 border-bottom-0">
                                                            <td class="border-bottom bg-light"><input type="text" class="form-control width-full itemName" placeholder="<spring:message code="list.detail.pleaseenteryourname" text="이름을 입력하세요"/>" maxlength="75"></td>
                                                            <td class="border-bottom bg-light">
                                                                <select class="form-control itemStatus">
                                                                    <option value="0"><spring:message code="list.detail.notforsale" text="판매안함"/></option>
                                                                    <option value="1" selected><spring:message code="list.detail.sale" text="판매중"/></option>
                                                                    <option value="2"><spring:message code="list.detail.soldout" text="품절"/></option>
                                                                </select>
                                                            </td>
                                                            <td class="border-bottom bg-light">
                                                                <input class="form-control itemPrice" type="text" numberOnly placeholder="<spring:message code="list.detail.price" text="금액"/>" maxlength="7">
                                                            </td>
                                                            <td class="border-right-0 border-bottom bg-light"><button type="button" class="btn btn-primary add_group_ptn"><spring:message code="list.detail.enrollment" text="등록"/></button></td>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="tbStoreOptionItemBody">
                                                        <c:choose>
                                                            <c:when test="${tbStoreOptionDetail.storeOptions.size() > 0}">
                                                                <c:forEach var="item"  items="${tbStoreOptionDetail.storeOptions}" varStatus="status">
                                                                    <tr  viewOrder="${item.viewOrder}" optItemNo="${item.optItemNo}">
                                                                        <td class="border-left-0">
                                                                            <input type="text" class="form-control width-full form-control itemNameText" value="${item.itemName}" maxlength="75"></td>
                                                                        <td class="border-top-0">
                                                                            <select class="form-control itemStatusText">
                                                                                <option value="0" <c:if test="${item.itemStatus.ordinal() == 0}">selected</c:if>><spring:message code="list.detail.notforsale" text="판매안함"/></option>
                                                                                <option value="1" <c:if test="${item.itemStatus.ordinal() == 1}">selected</c:if>><spring:message code="list.detail.sale" text="판매중"/></option>
                                                                                <option value="2" <c:if test="${item.itemStatus.ordinal() == 2}">selected</c:if>><spring:message code="list.detail.soldout" text="품절"/></option>
                                                                            </select>
                                                                        </td>
                                                                        <td class="border-top-0"><input type="text" class="form-control itemPriceText" value="${item.itemPrice}" maxlength="7" numberOnly></td>
                                                                        <td class="border-top-0 border-right-0">
                                                                            <button type="button" class="btn btn-danger removeOptionBtn" optItemNo="${item.optItemNo}"><spring:message code="list.detail.delete" text="삭제"/></button>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <tr class="noneItemOption">
                                                                    <td colspan="4" class="text-center"><spring:message code="list.description.registeradditionalproducts" text="추가상품을 등록해주세요"/></td>
                                                                </tr>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                                <td class="text-danger-darker"><spring:message code="list.description.registeralistofproductoptions" text="상품 옵션 목록을 등록하세요."/></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="m-t-10">
                            <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/><%--목록--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                            <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/><%--수정--%><%--<spring:message code="merchandisecont.merchandisedetail.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        </div>
                    </div>
                </div>
            </div>

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

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
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
<script>
    //인스턴스 자동생성 방지
    Dropzone.autoDiscover = false;

    $(() => {
        $(".list_btn").click(function() {
            location.href = "${path}/merchant/merchanext/list";
        });

        let deleteIdList = [];
        let list = [];
        $(document).on("click", ".removeOptionBtn", function () {
            let index = $(this).parents().parents().index();
            let length = $(".tbStoreOptionItemTable tr").length;
            $(".tbStoreOptionItemTable tr").eq(index+2).remove();
            deleteIdList.push($(this).attr("optItemNo"));
        });

        $(document).on("click", ".btn_update", function () {
            let url = "${path}/api/merchanext/update/action";
            let _forms = $('#update_form');
            let _forms2 = $('#update_form2');

            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let update = "<spring:message code="list.script.update" text="수정"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";

            list = [];
            $(".tbStoreOptionItemTable #tbStoreOptionItemBody tr").each(function(){
                if($(this).attr("optItemNo") != "undefined"){
                    pushList = {
                        optItemNo : $(this).attr("optItemNo"),
                        itemName : $(this).find(".itemNameText").val(),
                        itemStatus : $(this).find(".itemStatusText").val(),
                        itemPrice : $(this).find(".itemPriceText").val(),
                        storeOptNo : $("#storeOptNo").val(),
                        viewOrder : $(this).attr("viewOrder")
                    }
                    list.push(pushList);
                }
            });

            let req = convertFormToObj(_forms);
            let req2 = convertFormToObj(_forms2);
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
                        formData.append("tbStoreOptionData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("tbStoreOptionItemData",  new Blob([JSON.stringify(list)], {type:"application/json"}));
                        formData.append("deleteIdList",  new Blob([JSON.stringify(deleteIdList)], {type:"application/json"}));
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

        let optItemNo = ${maxNo+1};
        $(document).on("click", ".add_group_ptn", function () {

            let itemStatus = $(".itemStatus").val();
            let itemName = $(".itemName").val();
            let itemPrice = $(".itemPrice").val();
            let viewOrder = $(".viewOrder").val();
            let optionText = "";

            let enterproductname = "<spring:message code="list.script.enteranadditionalproductname" text="추가상품이름을 입력해주세요"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let confirm = "<spring:message code="list.script.confirm" text="확인"/>";
            let pleaseenteraprice = "<spring:message code="list.script.pleaseenteraprice" text="가격을 입력해주세요"/>";

            let stopselling = "<spring:message code="list.script.stopselling" text="판매중지"/>";
            let sale = "<spring:message code="list.script.sale" text="판매중"/>";
            let soldout = "<spring:message code="list.script.soldout" text="품절"/>";
            let deletemsg = "<spring:message code="list.script.delete" text="삭제"/>";
            if(itemName == "") {
                swal({
                    title: enterproductname,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                })
                return;
            } else if(itemPrice == "") {
                swal({
                    title: pleaseenteraprice,
                    icon: "warning",
                    buttons: [
                        cancel,
                        confirm
                    ],
                    dangerMode: true,
                })
                return;
            }
            if(itemStatus == 0) {
                optionText =    "                  <option value=\"0\" selected>"+stopselling+"</option>\n" +
                    "                  <option value=\"1\">"+sale+"</option>\n" +
                    "                  <option value=\"2\">"+soldout+"</option>\n";
            } else if(itemStatus == 1) {
                optionText =    "                  <option value=\"0\" >"+stopselling+"</option>\n" +
                    "                  <option value=\"1\" selected>"+sale+"</option>\n" +
                    "                  <option value=\"2\">"+soldout+"</option>\n";
            } else if(itemStatus == 2) {
                optionText =    "                  <option value=\"0\" >"+stopselling+"</option>\n" +
                    "                  <option value=\"1\" >"+sale+"</option>\n" +
                    "                  <option value=\"2\" selected>"+soldout+"</option>\n";
            }

            $(".noneItemOption").remove();


            $("#tbStoreOptionItemBody").append(" <tr optItemNo="+optItemNo+" viewOrder="+optItemNo+">\n" +
                "          <td class=\"border-left-0\"><input type=\"text\" class=\"form-control width-full itemNameText\" value='"+itemName+"' maxlength=\"75\"></td>\n" +
                "          <td class=\"border-top-0\">\n" +
                "              <select class=\"form-control itemStatusText\">\n" +
                optionText +
                "              </select>\n" +
                "          </td>\n" +
                "          <td class=\"border-top-0\"><input type=\"text\" class=\"form-control itemPriceText\" value="+itemPrice+" maxlength=\"7\" numberonly></td>\n" +
                "          <td class=\"border-top-0 border-right-0\">\n" +
                "              <button type=\"button\" class=\"btn btn-danger removeOptionBtn\" optItemNo="+optItemNo+" >"+deletemsg+"</button>\n" +
                "          </td>\n" +
                "      </tr>");
            optItemNo++;
        });

        $(document).on("click", ".mandatoryYn", function () {
            if ($(this).val() == 'true') {
                $(".minSelectCnt").val("1");
            } else {
                $(".minSelectCnt").val("0");
            }
        });
    });






    function inputDataCheck(args) {
        let pleaseentertheproductname = "<spring:message code="list.script.pleaseentertheproductname" text="상품명을 입력해주세요"/>";
        let enterminrequirednumbermsg = "<spring:message code="list.script.enterminrequirednumbermsg" text="최소 필수선택 개수를 입력해주세요"/>";
        let entermaxrequirednumbermsg = "<spring:message code="list.script.entermaxrequirednumbermsg" text="최대 선택가능 개수를 입력해주세요"/>";
        if (isNull(args.optName)) {
            return alert_focus("optName", pleaseentertheproductname);
        } else if (isNull(args.minSelectCnt)) {
            return alert_focus("minSelectCtn", enterminrequirednumbermsg);
        } else if (isNull(args.maxSelectCnt)) {
            return alert_focus("minSelectCtn", entermaxrequirednumbermsg);
        }
        return true;
    }
</script>
</body>
</html>
