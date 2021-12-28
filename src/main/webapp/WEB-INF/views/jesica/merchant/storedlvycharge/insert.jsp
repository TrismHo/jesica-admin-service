<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>EATSUDA | 배송원 상세&lt;%&ndash;<spring:message code="merchandise.detail.title" text="default text"/>&ndash;%&gt;</title>
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
                    <li class="breadcrumb-item"><spring:message code="side.main1" text="업무그룹"/></li>
                    <li class="breadcrumb-item"><a href="${path}/workgroup/deliveryman/list"><spring:message code="side.main1.sub2" text="배송원"/></a></li>
                    <li class="breadcrumb-item active">상세정보</li>
                </ol>
                <h3 class="rix-title p-b-5">배송원 상세&lt;%&ndash;<spring:message code="merchandise.detail.title" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품 상세&ndash;%&gt;</h3>
            </div>
           &lt;%&ndash; <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:15%"><strong>업무그룹</strong></td>
                        <td style="width:35%">
                            <span class="text-green">[H${tbUserWorker.headNo}]</span> ${tbUserWorker.head.headName} |
                            <span class="text-green">[B${tbUserWorker.branchNo}]</span> ${tbUserWorker.branch.branchName} |
                            <span class="text-green">[S${tbUserWorker.storeNo}]</span> ${tbUserWorker.store.storeName}
                        </td>
                        <td class="bg-light" style="width:15%"><strong>배송원</strong></td>
                        <td>
                            <span class="text-green">[${tbUserWorker.userNo}]</span> ${tbUserWorker.name}
                        </td>
                    </tr>
                </table>
            </div>&ndash;%&gt;
          <div class="m-t-10">
                <table class="table table-bordered">
                    <td class="bg-light ">소속 업무그룹</td>
                    <td style="">
                        <label>
                            <input type="text" data-toggle="modal" data-target="#head_search_modal"  placeholder="<spring:message code="merchandise.search1.option1" text="제휴본사 선택"/>" class="form-control background-white headName width-150" readonly>
                        </label>
                        <label>
                            <input type="text" data-toggle="" data-target="#branch_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="총판선택"/>" class="form-control background-white branchName width-150" readonly>
                        </label>
                        <label>
                            <input type="text" data-toggle="" data-target="#store_search_modal" placeholder="<spring:message code="merchandise.search1.option2" text="가맹점선택"/>" class="form-control background-white storeName width-150" readonly>
                        </label>
                    </td>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none">배송 관리비&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                        <span class="d-sm-block d-none">배송 관리비&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">가맹점별 요금&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                        <span class="d-sm-block d-none">가맹점별 요금&lt;%&ndash;<spring:message code="merchandise.detail.tab1" text="default text"/>&ndash;%&gt;&lt;%&ndash;기본 정보&ndash;%&gt;</span>
                    </a>
                </li>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">

                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="true">
                        <div class="table-responsive">
                            <form id="insert_form" name="insert_form">
                                <table class="table table-bordered">
                                    <input type="hidden" class="headNo" name="headNo"  value="">
                                    <input type="hidden" class="branchNo" name="branchNo"  value="">
                                    <input type="hidden" class="storeNo" name="storeNo" value="">
                                    <tr>
                                        <td class="bg-light height-50">관리비 정산타입</td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="mngChargeType" value="1" class="align-bottom mngChargeType" checked> <spring:message code="merchandise.insert.option1" text="월차감"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="mngChargeType" value="2" class="align-bottom mngChargeType" > <spring:message code="merchandise.insert.option1" text="일차감"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">배송원 수수료 할인여부를 선택해주세요 </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">관리비 정산대상</td>
                                        <td style="width:60%">
                                            <label class="">
                                                <input type="radio" name="mngTargetType" value="1" class="align-bottom mngTargetType" checked> <spring:message code="merchandise.insert.option1" text="소속총판"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="mngTargetType" value="2" class="align-bottom mngTargetType" > <spring:message code="merchandise.insert.option1" text="소속배송그룹"/>&lt;%&ndash;정상&ndash;%&gt;
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">관리비 정산대상을 선택해주세요 </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">금액</td>
                                        <td><input class="form-control width-200" type="text"  name="mngPrice" value="" numberOnly> 원
                                        </td>
                                        <td class="text-danger-darker">금액을 입력해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">차감시작일</td>
                                        <td><input class="form-control width-200 chargeStartDate" type="text"  name="chargeStartDate" value="" ></td>
                                        <td class="text-danger-darker">차감시작일을 선택해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">차감일</td>
                                        <td>
                                            <select class="form-control chargeDay" name="chargeDay">
                                            <c:forEach begin="00" end="31" var="month">
                                                <c:if test="${month lt 10}"><option value="0${month}">0${month}</c:if> 일</option>
                                                <c:if test="${month gt 9}"><option value="${month}">${month}</c:if> 일</option>
                                            </c:forEach>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker">차감일을 선택해주세요 (월차감 전용)</td>
                                    </tr>
                                </table>
                            </form>

                        </div>
                    </div>
                </div>
                    <!-- end tab-pane -->
                    <!-- begin tab-pane -->
                    <div class="tab-pane fade" id="default-tab-2">
                            <div class="table-responsive">
                                <form id="update_form2" name="update_form2">
                                    <table class="table table-bordered">
                                        <input type="hidden" class="headNo" name="headNo"  value="">
                                        <input type="hidden" class="branchNo" name="branchNo"  value="">
                                        <input type="hidden" class="storeNo" name="storeNo" value="">
                                        <tr>
                                            <td class="bg-light height-50">요금제 구분</td>
                                            <td style="width:60%">
                                                <label class="">
                                                    <input type="radio" name="dlvyChargeType" value="1" class="align-bottom dlvyChargeType" checked> <spring:message code="merchandise.search1.option4" text="거리구간요금제"/>
                                                </label>
                                                <label class="m-l-10 ">
                                                    <input type="radio" name="dlvyChargeType" value="2" class="align-bottom dlvyChargeType" > <spring:message code="merchandise.search1.option4" text="블럭요금제"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker">요금제를 설정해주세요</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50">구간요금제 번호</td>
                                            <td style="width:60%">
                                               <select class="form-control" name="priceChargeNo">
                                               </select>
                                            </td>
                                            <td class="text-danger-darker">관리비 정산대상을 선택해주세요 </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">블럭요금제 번호</td>
                                            <td>
                                                <select class="form-control" name="areaChargeNo">
                                                </select>
                                            </td>
                                            <td class="text-danger-darker">금액을 입력해주세요</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light height-50">눈비할증</td>
                                            <td>
                                                <label class="">
                                                    <input type="radio" name="weatherChargeYn" value="0" class="align-bottom weatherChargeYn"checked> <spring:message code="merchandise.search1.option4" text="미사용"/>
                                                </label>
                                                <label class="m-l-10">
                                                    <input type="radio" name="weatherChargeYn" value="1" class="align-bottom weatherChargeYn" > <spring:message code="merchandise.search1.option4" text="사용"/>
                                                </label>
                                            </td>
                                            <td class="text-danger-darker">차감시작일을 선택해주세요</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light">눈비할증 요금</td>
                                            <td>
                                                <input type="text" name="weatherCharge" value="0" class="form-control align-bottom weatherCharge" numberOnly>
                                            </td>
                                            <td class="text-danger-darker">차감일을 선택해주세요 (월차감 전용)</td>
                                        </tr>
                                    </table>

                                    &lt;%&ndash;<table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light height-50">요금제 구분</td>
                                        <td>
                                            <label class="m-l-10">
                                                <input type="radio" name="dlvyChargeType" value="1" class="align-bottom dlvyChargeType" cheched> <spring:message code="merchandise.search1.option4" text="거리구간요금제"/>
                                            </label>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="dlvyChargeType" value="2" class="align-bottom dlvyChargeType" > <spring:message code="merchandise.search1.option4" text="블럭요금제"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">요금제를 설정해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">구간요금제 선택</td>
                                        <td>
                                            <select class="form-control priceChargeNo" name="priceChargeNo">
                                                <c:forEach begin="00" end="31" var="month">
                                                    <c:if test="${month lt 10}"><option value="0${month}">0${month}</c:if> 일</option>
                                                    <c:if test="${month gt 9}"><option value="${month}">${month}</c:if> 일</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker">구간요금제를 선택해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">블럭요금제 선택</td>
                                        <td>
                                            <select class="form-control areaChargeNo" name="areaChargeNo">
                                                <c:forEach begin="00" end="31" var="month">
                                                    <c:if test="${month lt 10}"><option value="0${month}">0${month}</c:if> 일</option>
                                                    <c:if test="${month gt 9}"><option value="${month}">${month}</c:if> 일</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="text-danger-darker">구간요금제를 선택해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light height-50">눈비할증</td>
                                        <td>
                                            <label class="m-l-10 ">
                                                <input type="radio" name="weatherChargeYn" value="0" class="align-bottom weatherChargeYn"checked> <spring:message code="merchandise.search1.option4" text="미사용"/>
                                            </label>
                                            <label class="m-l-10">
                                                <input type="radio" name="weatherChargeYn" value="1" class="align-bottom weatherChargeYn" > <spring:message code="merchandise.search1.option4" text="사용"/>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker">눈비할증 여부를 선택해주세요</td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light">눈비할증 요금</td>
                                        <td>
                                            <input type="text" name="weatherCharge" value="0" class="form-control align-bottom weatherCharge" numberOnly>
                                        </td>
                                        <td class="text-danger-darker">눈비할증 요금을 입력해주세요</td>
                                    </tr>
                                </table>&ndash;%&gt;
                                </form>
                            </div>
                        </div>
                    <!-- end tab-pane -->
                    <div class="m-t-10">
                        <button type="button" class="btn btn-primary list_btn"><i class="fa fa-list m-r-3"></i> 목록&lt;%&ndash;<spring:message code="merchandise.insert.listbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;목록&ndash;%&gt;</button>
                        <button type="button" class="btn btn-primary btn_update m-l-10"><i class="fa fa-check m-r-3"></i> 등록&lt;%&ndash;<spring:message code="merchandise.insert.insertbutton" text="default text"/>&ndash;%&gt;&lt;%&ndash;등록&ndash;%&gt;</button>
                    </div>
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
    <div class="modal fade" id="head_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="headSearch.jsp" %>
    </div>
    <div class="modal fade" id="branch_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="branchSearch.jsp" %>
    </div>
    <div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
        <%@include file="storeSearch.jsp" %>
    </div>
</div>

&lt;%&ndash;modal insertRental start&ndash;%&gt;
&lt;%&ndash;modal insertRental end&ndash;%&gt;

&lt;%&ndash;modal add end&ndash;%&gt;

&lt;%&ndash;modal edit start&ndash;%&gt;
&lt;%&ndash;<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>&ndash;%&gt;
&lt;%&ndash;modal edit end&ndash;%&gt;
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
&lt;%&ndash;<%@include file="../../../common/include_datatables.jsp" %>&ndash;%&gt;
<!-- ================== END BASE JS ================== -->
&lt;%&ndash; Custom JS Start&ndash;%&gt;
<%@include file="../../../common/include_custom_js.jsp" %>
&lt;%&ndash; Custom JS End&ndash;%&gt;
&lt;%&ndash;<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />&ndash;%&gt;
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
&lt;%&ndash;<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>&ndash;%&gt;
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
<%@include file="../../../common/include_number_only_js.jsp" %>

<script>
    $(() => {
        //제휴본사 검색
        $(".searchHeadBtn").on("click",function(){
            let req = convertFormToObj($('form.head_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/head/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchHeadList").html("");
                    for(var i = 0 ; i < data.searchHeadList.length ; i++){
                        $(".searchHeadList").append(
                            " <li >" +
                            "     <label class=\"head_text\">\n" +
                            ""+data.searchHeadList[i].headName+""+
                            "<small style=\"color: green;\">["+data.searchHeadList[i].headNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selHeadNoBtn\" headName="+data.searchHeadList[i].headName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\" headNo="+data.searchHeadList[i].headNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });


        //총판 선택
        $(".searchBranchBtn").on("click",function(){
            let headNo = $(".headNo").val();
            $(".selHeadNo").val(headNo);
            let req = convertFormToObj($('form.branch_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/branch/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchBranchList").html("");
                    for(var i = 0 ; i < data.searchBranchList.length ; i++){
                        $(".searchBranchList").append(
                            " <li >" +
                            "     <label class=\"branch_text\">\n" +
                            ""+data.searchBranchList[i].branchName+""+
                            "<small style=\"color: green;\">["+data.searchBranchList[i].branchNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName="+data.searchBranchList[i].branchName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo="+data.searchBranchList[i].branchNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });

        //가맹점 선택
        $(".searchStoreBtn").on("click",function(){
            let branchNo = $(".branchNo").val();
            $(".selBranchNo").val(branchNo);
            let req = convertFormToObj($('form.store_search_form'));
            $.ajax({
                type: "POST",
                url: "${path}/api/search/store/list",
                data: JSON.stringify(req),
                contentType: "application/json;",
                dataType: "json",
                success: function(data) {
                    $(".searchStoreList").html("");
                    for(var i = 0 ; i < data.searchStoreList.length ; i++){
                        $(".searchStoreList").append(
                            " <li >" +
                            "     <label class=\"store_text\">\n" +
                            ""+data.searchStoreList[i].storeName+""+
                            "<small style=\"color: green;\">["+data.searchStoreList[i].storeNo+"]</small>\n" +
                            "     </label>\n" +
                            "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selStoreNoBtn\" storeName="+data.searchStoreList[i].storeName+" style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  storeNo="+data.searchStoreList[i].storeNo+" value='적용'></div>\n" +
                            " </li>"
                        )
                    }
                }
            });
        });

        $(document).on("click",".branchName",function(){
            let headNo = $(".headNo").val();
            if(headNo == null || headNo =='') {
                swal({
                    title: "제휴본사를 선택해주세요.",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '확인'
                    ],
                    dangerMode: true,
                });
            } else {
                $(".searchBranchBtn").click();
            }

        });

        $(document).on("click",".storeName",function(){
            let headNo = $(".headNo").val();
            let branchNo = $(".branchNo").val();

            if(headNo == null || headNo =='') {
                swal({
                    title: "제휴본사를 선택해주세요.",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '확인'
                    ],
                    dangerMode: true,
                });
            }  else {
                if(branchNo == null || branchNo =='') {
                    swal({
                        title: "총판을 선택해주세요.",
                        icon: "warning",
                        buttons: [
                            '취소',
                            '확인'
                        ],
                        dangerMode: true,
                    });
                } else {
                    $(".searchStoreBtn").click();
                }
            }
        });

        $(document).on("click","#selHeadNoBtn",function(){
            $(".headNo").val($(this).attr("headNo"));
            $(".headName").val($(this).closest("li").find(".head_text").text());
            $(".branchName").attr("data-toggle","modal");
            $(".branchName").val("");
            $(".storeName").val("");
            $(".searchBranchList").html("");
            $(".searchStoreList").html("");
            $(".headModalCloseBtn").click();
        });

        $(document).on("click","#selBranchNoBtn",function(){
            $(".branchNo").val($(this).attr("branchNo"));
            $(".branchName").val($(this).closest("li").find(".branch_text").text());
            $(".storeName").attr("data-toggle","modal");
            $(".storeName").val("");
            $(".searchStoreList").html("");
            $(".branchModalCloseBtn").click();
        });

        $(document).on("click","#selStoreNoBtn",function(){
            $(".storeNo").val($(this).attr("storeNo"));
            $(".storeName").val($(this).closest("li").find(".store_text").text());
            $(".searchClick").click();
            $(".storeModalCloseBtn").click();
        });


        $(".list_btn").click(function () {
            location.href = "${path}/workgroup/deliveryman/list";
        });






        $(document).on("click",".btn_update",function() {
            let url = "${path}/api/deliveryman/update/action";

            let joinDate = replaceAll($(".joinDate").val(),"-","");
            $(".joinDate").val(joinDate);

            let retireDate = replaceAll($(".retireDate").val(),"-","");
            $(".retireDate").val(retireDate);

            let _forms = $('#update_form, #update_form2');
            let req = convertFormToObj(_forms);
            /*let req2 = convertFormToObj(_forms2);*/
            if (inputDataCheck(req)) {
                swal({
                    title: "수정 하시겠습니까",
                    icon: "warning",
                    buttons: [
                        '취소',
                        '수정'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var formData = new FormData(document.getElementById('update_form'));
                        formData.append("tbUserWorkerData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("imgFile", $("#imgFile")[0].files[0]);
                        /*formData.append("tbUserWorker",  new Blob([JSON.stringify(req2)], {type:"application/json"}));*/
                        $.ajax({
                            type: "POST",
                            url: url,
                            data:  formData,
                            dataType: "json",
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if (data.result == 200) {
                                    /*location.href = "${path}/workgroup/deliveryman/list"*/
                                    alert("수정에 성공하였습니다.");
                                    location.reload();
                                } else {
                                    alert("수정에 실패하였습니다.");
                                    return;
                                }
                            }
                        });
                    }
                });
            }
        });

        let date = new Date();
        $(".chargeStartDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyymmdd",
            language: "kr",
        });
        $(".chargeStartDate").datepicker('setDate', new Date());


    });

    function inputDataCheck(args) {
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@#$%&\\\=\(\'\"]/gi;

        /* if(regExp.test(args.LoginId)){
             return alert_focus("LoginId", "로그인ID에는 특수문자를 사용할수없습니다.");
             s        }

         if (isNull(args.bmLoginId)) {
             return alert_focus("LoginId", "로그인ID를 입력해주세요.");
         } else if (isNull(args.LoginPwd)) {
             return alert_focus("LoginPwd", "비밀번호를 입력해주세요");
         } else if (isNull(args.Name)) {
             return alert_focus("Name", "이름을 입력해주세요");
         } else if(!pwCheck) {
             return alert_focus("LoginPwd", "비밀번호는 8자리 이상, 영문+숫자+특수문자로 조합하여 설정해주세요.");
         }*/
        return true;
    }

    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }


</script>
</body>
</html>
--%>
