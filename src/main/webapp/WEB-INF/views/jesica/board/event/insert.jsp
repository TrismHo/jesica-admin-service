<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.eventnoticeregistration" text="이벤트 공지"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네  | <spring:message code="list.detail.eventnoticeregistration" text="이벤트 공지"/></title>
    </c:if>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement1" text="앱 관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.eventnotice1" text="이벤트 공지"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.eventnoticeregistration" text="이벤트 등록"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.eventnoticeregistration" text="이벤트 등록"/></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="insert_form" id="insert_form" class="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" name="eventId" value="">
                            <input type="hidden" name="dataStatus" value="1">
                            <input type="hidden" name="platformType" value="2">
                            <table class="table table-bordered">
                                <tbody>
                                <%--<tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification" text="플랫폼 구분"/></td>
                                    <td>
                                        &lt;%&ndash;<label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="0" class="m-t-1 m-r-3" checked>
                                            <span><spring:message code="list.detail.affiliate1" text="사용안함"/></span>
                                        </label>&ndash;%&gt;
                                            <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3" checked>
                                                    <span><spring:message code="list.detail.deliveryman1" text="직배"/></span>
                                                </label>
                                            </c:if>
                                            <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                <label class="m-r-10" style="display: inline-flex; align-items: center">
                                                    <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" checked>
                                                    <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                                </label>
                                            </c:if>
                                      &lt;%&ndash;  <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="1" class="m-t-1 m-r-3" checked>
                                            <span><spring:message code="list.detail.deliveryman1" text="제시카"/></span>
                                        </label>
                                        <label class="m-r-10" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="2" class="m-t-1 m-r-3">
                                            <span><spring:message code="list.detail.deliveryman1" text="양파오더"/></span>
                                        </label>
                                        <label class="" style="display: inline-flex; align-items: center">
                                            <input type="radio" name="platformType" value="3" class="m-t-1 m-r-3">
                                            <span><spring:message code="list.detail.deliveryman1" text="세날"/></span>
                                        </label>&ndash;%&gt;
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.checkexposure" text="노출여부"/></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="0" class="align-bottom" > <spring:message code="list.detail.hide" text="숨김"/>
                                        </label>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="1" class="align-bottom" checked> <spring:message code="list.detail.exposure" text="노출"/>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="앱코드"/></td>
                                    <td>
                                        <c:if test="${empty appCode}">
                                            <select name="appCode" class="form-control w-25" >
                                                <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                    <option value="${appCodeList.sysCode}">${appCodeList.codeName}</option>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                        <c:if test="${!empty appCode}">
                                            <input type="text" class="form-control" name="appCode" readonly value="${appCode}">
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.postclassification1" text="서비스지역"/></td>
                                    <td>
                                        <select name="serviceNo" class="form-control w-25" >
                                            <%-- <option value="">전체</option>--%>
                                            <c:forEach var="serviceList" items="${appServiceList}" varStatus="status">
                                                <option value="${serviceList.serviceNo}" <c:if test="${serviceList.serviceNo == 1}"> selected</c:if>>${serviceList.serviceName}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.checkexposure1" text="시작일/종료일"/></td>
                                    <td>

                                        <label >
                                            <input type="text"  value="0" class="form-control align-bottom startDate" >
                                        </label>
                                         ~
                                        <label >
                                            <input type="text"  value="0" class="form-control align-bottom endDate" >
                                        </label>
                                    </td>
                                </tr>




                                <%--<tr>
                                    <td class="bg-light"><spring:message code="list.detail.attachments" text="첨부파일"/></td>
                                    <td>
                                        <div class="category_sort">
                                            <ul class="sort_list">
                                                <li>
                                                    <div class="sort_body" id="sort_body">
                                                        <img class="width-full" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                    </div>
                                                </li>
                                                <li>
                                                    * <spring:message code="list.detail.recommendedimageratio" text="권장 이미지 비율"/> : 984*876<br><br>
                                                    <div class="fileName"></div>
                                                    <br>
                                                    <div class="fileSize"></div>
                                                </li>
                                            </ul>
                                            <label for="imgFileSmall">
                                                <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                    <div><spring:message code="list.detail.selectfile" text="파일선택"/></div>
                                                </div>
                                            </label>
                                            <input type="file" id="imgFileSmall" name="imgFileSmall" class="fileBtn d-none">
                                        </div>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="bg-light"><spring:message code="list.detail.title" text="제목"/></td>
                                   <td>
                                        <input type="text" name="title" value="${tbNoticePlatform.title}" class="form-control width-200 title" maxlength="150">
                                       <%--      <button type="button" class="btn btn-primary insert_coupon float-right "> 이벤트 이미지 템플릿등록</button>
                                            <input type="text"  value="" class="form-control width-80 couponNoCode float-right" numberonly placeholder="쿠폰코드/No">
                                            <select class="form-control width-70 sType float-right">
                                                <option value="2">탁송</option>
                                                <option value="3">맛집</option>
                                                <option value="4">마트</option>
                                                <option value="5">맛집예약</option>
                                            </select>
                                            <select class="form-control width-90 couponSelect float-right">
                                                <option value="code">쿠폰코드</option>
                                                <option value="no">쿠폰No</option>
                                            </select>

                                        </td>--%>
                                </tr>
                                <tr >
                                    <td class="bg-light"><spring:message code="list.detail.contents" text="내용"/></td>
                                    <td>
                                        <textarea  id="body"  class="form-control width-full  ckeditor" rows="40" style="height: 500px"></textarea>
                                        <input type="hidden" name="body" class="body" value="">
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i>  <spring:message code="list.detail.enrollment" text="등록"/></button>
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

    CKEDITOR.replace('body', { filebrowserUploadUrl: '${path}/api/file/upload/event',
        font_names: '맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana',
        font_defaultLabel: '맑은 고딕/Malgun Gothic',
        fontSize_defaultLabel: '12',
        allowedContent : true,
        language: 'ko',
    });


    $(() => {
        let date = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', '2020-01-01');
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

        /*date.setMonth(date.getMonth() + 1, 1);*/
        $(".endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        if(endDate == ""){
            $(".endDate").datepicker('setDate', date);
        } else {
            $(".endDate").datepicker('setDate', endDate);
        }

        $(".btn_list").click(function() {
            location.href = "${path}/board/event/list";
        })

        $(".insert_coupon").click(function(){
            let couponNoCode = $(".couponNoCode").val(); //쿠폰번호/코드
            let sType = $(".sType").val();
            let coupon = "";
            let couponSelect = $(".couponSelect").val();

            if(couponSelect == "no") {
                coupon = "coupon("+couponNoCode+","+sType+")";
            } else if (couponSelect == "code") {
                coupon = "couponCode("+couponNoCode+","+sType+")";
            }

            let couponList  = "<p><img alt='' onclick="+coupon+" src='' style='width:100%;' /></p>";
            CKEDITOR.instances["body"].setData(couponList);

        })

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/board/event/insert";
            var value = CKEDITOR.instances['body'].getData();
            $(".body").val(value);
            let startDate = $(".startDate").val();
            let endDate = $(".endDate").val();
            $(".startDate").val(startDate);
            $(".endDate").val(endDate);
            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);


            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";
            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let registrationwassuccessful = "<spring:message code="list.script.registrationwassuccessful" text="등록에 성공하였습니다."/>";

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
                        var formData = new FormData(document.getElementById('insert_form'));
                        formData.append("tbEvent",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                        formData.append("startDate", startDate);
                        formData.append("endDate",  endDate);
                        /*formData.append("imgFileSmall",_forms.find('#imgFileSmall')[0]);*/
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
                                    alert(registrationwassuccessful);
                                    location.href="${path}/board/event/list"
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
        //썸네일
        $(document).on("change", "#imgFileSmall", function (e) {
            e.preventDefault();
            chk_file_type(this);
            var file = $("#imgFileSmall")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body.innerHTML = '';
                    sort_body.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#imgFileSmall").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.fileName').text("변경할 이미지 :" + filename);
            $('.fileSize').text("용량 :" + file.size + " Byte");

            return false;
        });
    });

    function inputDataCheck(args) {
        console.log(args);
        let entertitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요."/>";
        let entersubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요."/>";
        if (isNull(args.title)) {
            return alert_focus("title", entertitle);
        } else if (isNull(args.body)) {
            return alert_focus("goodsPrice", entersubject);
        }
        return true;
    }

    function chk_file_type(obj) {
        let imgfilemsg = "<spring:message code="list.script.onlyimagefilescanbeuploaded" text="이미지 파일만 업로드 가능합니다."/>";

        var file_kind = obj.value.lastIndexOf('.');
        var file_name = obj.value.substring(file_kind+1,obj.length);
        var file_type = file_name.toLowerCase();
        var check_file_type = new Array();
        check_file_type = ['jpg','gif','png','jpeg','bmp','tif'];

        if(check_file_type.indexOf(file_type)==-1) {

            alert(imgfilemsg);
            var parent_Obj=obj.parentNode;
            var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);

            document.getElementById("imgFile").value = "";    //초기화를 위한 추가 코드
            document.getElementById("imgFile").select();        //초기화를 위한 추가 코드
            document.selection.clear();                          //일부 브라우저 미지원
            return false;
        }
    }
</script>
</body>
</html>
