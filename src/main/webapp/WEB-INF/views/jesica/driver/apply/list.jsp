<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | 승인요청관리 </title>
</head>
<style>
    .modal_img {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 10000; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content_img {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */
    }
    @media (max-width:1920px) {
        .modal-content {
            width: 100%;
        }
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

    <!-- begin #content -->
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">

            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item">드라이버 관리</li>
                    <li class="breadcrumb-item active">승인요청관리</li>
                </ol>
                <h3 class="rix-title">
                    승인요청관리
                </h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->
            <form name="frmSearch" id="frmSearch">
                <input type="hidden" name="insertDate" value="insertDate">
                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                                <style>
                                    .form-control-test {
                                        width: 100%;
                                        height: 30px;
                                        font-size: 11px;
                                        display: inline;
                                        border-radius: 0px;
                                        border: 1px solid #d5dbe0;;
                                    }
                                </style>
                                <div class="col-xl-12 col-md-12">
                                    <form class="brand_search_form"></form>
                                        <table class="table table-condensed table-bordered">
                                            <tbody>
                                            <tr>
                                               <%-- <td class="bg-light" style="width:10%">
                                                    <strong><spring:message code="list.search.brand" text="브랜드"/>&lt;%&ndash;가맹점선택&ndash;%&gt;</strong>
                                                </td>
                                                <td style="width:30%">

                                                </td>--%>
                                                <td class="bg-light" style="width:10%"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                                <td style="width:90%;" colspan="3">
                                                    <label>
                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                    </label>
                                                    <label>
                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="bg-light" style="width:20%;"><strong>승인상태</strong></td>
                                                <td style="width:30%;">
                                                    <div class="row">
                                                    </div>
                                                    <label>
                                                        <select class="form-control selAuthStatus" name="authStatus">
                                                            <option value="9999" <c:if test="${searchValue.authStatus == '9999'}">selected</c:if>>전체</option>
                                                            <option value="0" <c:if test="${searchValue.authStatus == 0}">selected</c:if>>미등록</option>
                                                            <option value="1" <c:if test="${searchValue.authStatus == 1}">selected</c:if>>신청</option>
                                                            <option value="2" <c:if test="${searchValue.authStatus == 2}">selected</c:if>>승인</option>
                                                            <option value="3" <c:if test="${searchValue.authStatus == 3}">selected</c:if>>반려</option>

                                                        </select>
                                                    </label>
                                                </td>
                                                <td class="bg-light" ><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                                <td>
                                                    <label>
                                                        <select class="form-control">
                                                            <option>이름</option>
                                                        </select>
                                                    </label>
                                                    <label>
                                                        <input type="text" name="name" value="${searchValue.name}" class="form-control width-150" maxlength="50">
                                                    </label>
                                                    <label>
                                                        <span class="btn-group  bg-black-transparent-2 rounded">
                                                            <a href="/driver/apply/list?dataStatus=&startDate=2021-01-01&endDate=${now}" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                                                                <i class="fas fa-lg fa-fw m-r-10 fa-sync-alt"></i><spring:message code="list.search.searchreset" text="검색 초기화"/>
                                                            </a>
                                                        </span>
                                                    </label>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div class="col-xl-12 col-md-12 m-t-10">
                                        <div class="">
                                            <button class="btn-box-r bgGray float-right line-height-25 width-100 p-5"><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="panel-body p-15">
                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                    <thead>
                      <%--  <th class="text-center" width="3%;">
                            <input type="checkbox" name="checked_all" id="select0" class="d-none">
                            <label for="select0" class="input-label "> <i class="fa fa-square check_all_i"></i></label>
                        </th>--%>
                        <th class="text-center" width="3%;"><spring:message code="list.word.no" text="순번"/></th>
                        <th class="text-center" width="10%;">프로필 이미지</th>
                        <th class="text-center" width="5%;">이름</th>
                        <th class="text-center" width="8%;">최종승인</th>
                        <th class="text-center" width="10%;">프로필 승인상태</th>
                        <th class="text-center" width="10%;">면허증 승인상태</th>
                        <th class="text-center" width="10%;">경력확인서 승인상태</th>
                        <th class="text-center" width="8%;">등록일</th>
                        <th class="text-center" width="8%;">수정일</th>
                        <th class="text-center" width="8%;">최종승인일</th>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${workList}" varStatus="status">
                        <tr class="detailRow"
                                applyNo="${item.applyNo}"
                                authStatus="${item.authStatus}"
                                serviceType="${item.serviceType}"
                                branchNo="${item.branchNo}"
                                workerNo="${item.workerNo}"
                                name="${item.name}"
                                residentNum="${item.residentNum}"
                                phone="${item.phone}"
                                smsYn="${item.smsYn}"
                                signYn="${item.signYn}"
                                profileAuthStatus="${item.profileAuthStatus}"
                                profileFile="${item.profileFile}"
                                profileFileSmall="${item.profileFileSmall}"
                                licenseAuthStatus="${item.licenseAuthStatus}"
                                licenseFile="${item.licenseFile}"
                                licenseNum="${item.licenseNum}"
                                licenseType="${item.licenseType}"
                                licenseExpDate="${item.licenseExpDate}"
                                careerAuthStatus="${item.careerAuthStatus}"
                                careerFile="${item.careerFile}"
                                insertDate="<javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />"
                            authDate="<javatime:format value="${item.authDate}" pattern="yyyy-MM-dd HH:mm:ss" />"
                            data-toggle="modal"
                            data-target="#attach_list">
                            <td class="text-center">${status.index + 1}</td>
                            <td class="text-center">
                                <img style="width: 100px;" class="storeImg" src="/api/img/fileLoad?filePath=${item.profileFileSmall}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'" >
                            </td>
                            <td class="text-center">${item.name}</td>
                            <td class="text-center">
                                <c:if test="${item.authStatus == 0}">
                                    미등록
                                </c:if>
                                <c:if test="${item.authStatus == 1}">
                                    신청
                                </c:if>
                                <c:if test="${item.authStatus == 2}">
                                    <span class="text-green">승인</span>
                                </c:if>
                                <c:if test="${item.authStatus == 3}">
                                    <span class="text-red" >반려</span>
                                </c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.profileAuthStatus == 0}">
                                    미등록
                                </c:if>
                                <c:if test="${item.profileAuthStatus == 1}">
                                    신청
                                </c:if>
                                <c:if test="${item.profileAuthStatus == 2}">
                                    <span class="text-green">승인</span>
                                </c:if>
                                <c:if test="${item.profileAuthStatus == 3}">
                                    <span class="text-red" >반려</span>
                                </c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.licenseAuthStatus == 0}">
                                    미등록
                                </c:if>
                                <c:if test="${item.licenseAuthStatus == 1}">
                                    신청
                                </c:if>
                                <c:if test="${item.licenseAuthStatus == 2}">
                                    <span class="text-green">승인</span>
                                </c:if>
                                <c:if test="${item.licenseAuthStatus == 3}">
                                    <span class="text-red" >반려</span>
                                </c:if>
                            </td>
                            <td class="text-center">
                                <c:if test="${item.careerAuthStatus == 0}">
                                    미등록
                                </c:if>
                                <c:if test="${item.careerAuthStatus == 1}">
                                    신청
                                </c:if>
                                <c:if test="${item.careerAuthStatus == 2}">
                                    <span class="text-green">승인</span>
                                </c:if>
                                <c:if test="${item.careerAuthStatus == 3}">
                                    <span class="text-red" >반려</span>
                                </c:if>
                            </td>
                           <%-- <td class="text-center">
                                <c:if test="${item.serviceType == 1}">
                                    렌터카
                                </c:if>
                                <c:if test="${item.serviceType == 2}">
                                    탁송
                                </c:if>
                                <c:if test="${item.serviceType == 3}">
                                    맛집
                                </c:if>
                                <c:if test="${item.serviceType == 4}">
                                    마트
                                </c:if>
                            </td>--%>
                            <td class="text-center"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td class="text-center"><javatime:format value="${item.authDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- end panel -->
    </div>

    <!-- end #content -->
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>
<!-- The Modal -->
<div id="myModal" class="modal_img" onClick="close_pop();">

    <!-- Modal content -->
    <div class="modal-content_img"  style="text-align: right;">
        <p style="text-align: center;" >
            <i class="fa fa-times" style="position: absolute"  onClick="close_pop();" ></i>
            <img style="width: 100%;" class="modal_img_src" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'"></p>
        <p>
    </div>

</div>
<!--End Modal-->

<%--modal add start--%>
<div class="modal fade" id="attach_list" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/attachList.jsp" %>
</div>
<%--modal add end--%>
<%--modal add start--%>
<%--modal add end--%>
<%--modal add start--%>
<%--<div class="modal fade" id="searchOption_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="searchOption.jsp" %>
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
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>

    $(() => {
        //기사가입신청 리스트
        $("#testTable").DataTable({
            language : lang_set //or lang_eng
        });

        //check all
        $( "#select0").click( function (){
            if ($("input[name=checked_all]:checkbox").is( ":checked")){
                $( "input[name=chk]:checkbox" ).attr( "checked", "checked" );
                $(".check_all_i").addClass("checked_true");
            } else {
                $( "input[name=chk]:checkbox" ).removeAttr( "checked");
                $(".check_all_i").removeClass("checked_true");
            }
        });

        $(".checkbox_label").click(function (){
            if ( $(this).closest("td").find(".checkbox").is( ":checked")){
                $(this).closest("input[type=checked]").removeAttr( "checked");
                $(this).find("i").addClass("checked_true");
            } else {
                $(this).parents("td").find("input[type=checked]").attr( "checked", "checked" );
                $(this).find("i").removeClass("checked_true");
            }
        });

        $(".detailOptionBtn1").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-55');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownWide").hide();
                $(".detailOptionBtnUpWide").show();
            } else {
                $(".detailOptionBtnDownWide").show();
                $(".detailOptionBtnUpWide").hide();
            }
        });

        $(".detailOptionBtn2").click(function(e) {
            e.preventDefault();
            $(".searchOptionZone").toggleClass('act-height-55');
            if($(".searchOptionZone").css("visibility") == 'visible') {
                $(".detailOptionBtnDownNarrow").hide();
                $(".detailOptionBtnUpNarrow").show();
            } else {
                $(".detailOptionBtnDownNarrow").show();
                $(".detailOptionBtnUpNarrow").hide();
            }
        });


        $(document).on("click",".systemImg ,.licenseFile ,.profileImg",function(){

            let src = $(this).attr("src");
            /*$(".modal_img_src").attr("src",src);
            $('#myModal').show();*/

            fnImgPop(src);
        });

        function fnImgPop(url){
            var img=new Image();
            img.src=url;
            var img_width=img.width;
            var win_width=img.width+25;
            var img_height=img.height;
            var win=img.height+30;
            var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
            OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
        }


        function removeClass(){
            $(".enrollment_1").removeClass("disabled");
            $(".enrollment_1").removeClass("completed");
            $(".enrollment_1").removeClass("active");
            $(".enrollment_2").removeClass("disabled");
            $(".enrollment_2").removeClass("completed");
            $(".enrollment_2").removeClass("active");
            $(".enrollment_3").removeClass("disabled");
            $(".enrollment_3").removeClass("completed");
            $(".enrollment_3").removeClass("active");
            $(".enrollment_4").removeClass("disabled");
            $(".enrollment_4").removeClass("completed");
            $(".enrollment_4").removeClass("active");
        }

       $(document).on("click",".careerFile",function(){
           let careerFile = $(this).attr("careerFile");
           let url = "${path}/api/file/download?filePath="+encodeURI(careerFile);
          //location.href="/api/file/download?filePath='"+careerFile+"'";
          location.href=url;
       });
       $(document).on("click",".detailRow",function(){

          let applyNo = $(this).attr("applyNo");
          let authStatus = $(this).attr("authStatus");
          let serviceType = $(this).attr("serviceType");
          let branchNo = $(this).attr("branchNo");
          let workerNo = $(this).attr("workerNo");
          let name = $(this).attr("name");
          let residentNum = $(this).attr("residentNum");
          let phone = $(this).attr("phone");
          let smsYn = $(this).attr("smsYn");
          let signYn = $(this).attr("signYn");
          let profileAuthStatus = $(this).attr("profileAuthStatus");
          let profileFile = $(this).attr("profileFile");
          let profileFileSmall = $(this).attr("profileFileSmall");
          let licenseAuthStatus = $(this).attr("licenseAuthStatus");
          let licenseFile = $(this).attr("licenseFile");
          let licenseNum = $(this).attr("licenseNum");
          let licenseType = $(this).attr("licenseType");
          let licenseExpDate = $(this).attr("licenseExpDate");
          let careerAuthStatus = $(this).attr("careerAuthStatus");
          let careerFile = $(this).attr("careerFile");
          let insertDate = $(this).attr("insertDate");
          let authDate = $(this).attr("authDate");
           if(serviceType == 1){
               serviceType = "렌터카";
           } else if(serviceType == 2) {
               serviceType = "탁송";
           } else if(serviceType == 3) {
               serviceType = "맛집";
           } else if(serviceType == 4) {
               serviceType = "마트";
           }

          if(profileAuthStatus == 0){
              profileAuthStatus = "미승인";
          } else if(profileAuthStatus == 1){
              profileAuthStatus = "신청";
          } else if(profileAuthStatus == 2){
              profileAuthStatus = "승인";
          } else if(profileAuthStatus == 3){
              profileAuthStatus = "반려";
          }

           if(careerAuthStatus == 0){
               careerAuthStatus = "미승인";
           } else if(careerAuthStatus == 1){
               careerAuthStatus = "신청";
           } else if(careerAuthStatus == 2){
               careerAuthStatus = "승인";
           } else if(careerAuthStatus == 3){
               careerAuthStatus = "반려";
           }

           if(licenseAuthStatus == 0){
               licenseAuthStatus = "미승인";
           } else if(licenseAuthStatus == 1){
               licenseAuthStatus = "신청";
           } else if(licenseAuthStatus == 2){
               licenseAuthStatus = "승인";
           } else if(licenseAuthStatus == 3){
               licenseAuthStatus = "반려";
           }

          if(smsYn == 0){
              smsYn = "거부";
          } else {
              smsYn = "동의";
          }

          if(signYn == 0){
              signYn = "미생성";
          } else {
              signYn = "생성";
          }

           let img = "/api/img/fileLoad?filePath="+encodeURI(profileFileSmall);
           let img2 = "/api/img/fileLoad?filePath="+encodeURI(licenseFile);
            $(".profileImg").attr("src",img);
            $(".licenseFile").attr("src",img2);

           $(".applyNo").text(applyNo);
           $(".authStatus").text(authStatus);
           $(".serviceType").text(serviceType);
           $(".branchNo").text(branchNo);
           $(".workerNo").text(workerNo);
           $(".name").text(name);
           $(".residentNum").text(residentNum);
           $(".phone").text(phone);
           $(".smsYn").text(smsYn);
           $(".signYn").text(signYn);
           $(".profileAuthStatus").text(profileAuthStatus);
           $(".profileFile").text(profileFile);
           $(".profileFileSmall").text(profileFileSmall);
           $(".licenseAuthStatus").text(licenseAuthStatus);
           $(".licenseNum").text(licenseNum);
           $(".licenseType").text(licenseType);
           $(".licenseExpDate").text(licenseExpDate);
           $(".careerAuthStatus").text(careerAuthStatus);
           $(".insertDate").text(insertDate);
           $(".authDate").text(authDate);
           let file = decodeURI($(this).attr("careerFile"));
           let filename = file.split('/').pop().split('\\').pop().split('%2F').pop();
           $(".careerFile").attr("careerFile",careerFile);
           $(".careerFileDown").text(filename);

           $.ajax({
               type: "POST",
               url: "${path}/api/driver/attach/list",
               data: {
                   applyNo : applyNo
               },
               dataType: "json",
               success: function(data) {
                   var tbWorkerApplyAttchList = data.tbWorkerApplyAttchList;
                   if(authStatus == 0) {
                       removeClass();
                       $(".enrollment_1").addClass("active");
                       $(".enrollment_2").addClass("disabled");
                       $(".enrollment_3").addClass("disabled");
                       $(".enrollment_4").addClass("disabled");

                   } else if (authStatus == 1){
                       removeClass();
                       $(".enrollment_1").addClass("completed");
                       $(".enrollment_2").addClass("active");
                       $(".enrollment_3").addClass("disabled");
                       $(".enrollment_4").addClass("disabled");

                   } else if (authStatus == 2){
                       removeClass();
                       $(".enrollment_1").addClass("completed");
                       $(".enrollment_2").addClass("completed");
                       $(".enrollment_3").addClass("active");
                       $(".enrollment_4").addClass("disabled");

                   } else if (authStatus == 3){
                       removeClass();
                       $(".enrollment_1").addClass("disabled");
                       $(".enrollment_2").addClass("disabled");
                       $(".enrollment_3").addClass("disabled");
                       $(".enrollment_4").addClass("active");
                   }

                   $(".attachList").html("");
                   if(tbWorkerApplyAttchList.length == 0 || tbWorkerApplyAttchList == null){
                       $(".attachList").append(
                           " <li >" +
                           "     <label class=\"store_text\">\n" +
                           "신청내역이 없습니다."+
                           "     </label>\n" +
                           "     <div class=\"float-right \"></div>\n" +
                           " </li>"
                       )
                   }else {
                       for (var i = 0; i < tbWorkerApplyAttchList.length; i++) {
                           let applyAttachType = "";
                           let statusColor = "";
                           if (tbWorkerApplyAttchList[i].applyAttachType == 0) {
                               applyAttachType = "기타";
                           } else if (tbWorkerApplyAttchList[i].applyAttachType == 1) {
                               applyAttachType = "프로필사진";
                           } else if (tbWorkerApplyAttchList[i].applyAttachType == 2) {
                               applyAttachType = "면허증";
                           } else if (tbWorkerApplyAttchList[i].applyAttachType == 3) {
                               applyAttachType = "경력확인서";
                           }
                           let inputBtn = "<div style='width:125px;'>" +
                               "<input  type=\"button\"  uploadFile=" + tbWorkerApplyAttchList[i].uploadFile + " param1=" + tbWorkerApplyAttchList[i].param1 + " param2=" + tbWorkerApplyAttchList[i].param2 + " param3=" + tbWorkerApplyAttchList[i].param3 + "  applyNo=" + tbWorkerApplyAttchList[i].applyNo + " applyAttachType=" + tbWorkerApplyAttchList[i].applyAttachType + " attachNo=" + tbWorkerApplyAttchList[i].attachNo + " class=\"btn-sm btn-primary btn-approval\" value=\"승인\">" +
                               "<input  type=\"button\"  uploadFile=" + tbWorkerApplyAttchList[i].uploadFile + " param1=" + tbWorkerApplyAttchList[i].param1 + " param2=" + tbWorkerApplyAttchList[i].param2 + " param3=" + tbWorkerApplyAttchList[i].param3 + " applyNo=" + tbWorkerApplyAttchList[i].applyNo + " applyAttachType=" + tbWorkerApplyAttchList[i].applyAttachType + " attachNo=" + tbWorkerApplyAttchList[i].attachNo + " class=\"btn-sm btn-danger btn-companion\" value=\"반려\"></div>";
                           //최종승인이면서 프로필/면허증인경우 수정불가
                         /*  if (authStatus == 1) {
                           } else if (authStatus == 2) {
                               if(tbWorkerApplyAttchList[i].applyAttachType == 1 )  {
                                   inputBtn =  "<div style='width:125px;'>반려되었습니다.</div>"
                               } else if(tbWorkerApplyAttchList[i].applyAttachType == 2) {
                                   inputBtn =  "<div style='width:125px;'>최종승인되었습니다.</div>"
                               } else if(tbWorkerApplyAttchList[i].applyAttachType == 3) {
                               }
                           } else if (authStatus == 3) {
                           }*/


                           if(tbWorkerApplyAttchList[i].applyAttachType == 1 && tbWorkerApplyAttchList[i].authStatus == 2)  {
                               inputBtn =  "<div style='width:125px;'>최종승인되었습니다.</div>"
                           } else if(tbWorkerApplyAttchList[i].applyAttachType == 2 && tbWorkerApplyAttchList[i].authStatus == 2) {
                               inputBtn =  "<div style='width:125px;'>최종승인되었습니다.</div>"
                           } else if(tbWorkerApplyAttchList[i].applyAttachType == 3 && tbWorkerApplyAttchList[i].authStatus == 2) {
                               inputBtn =  "<div style='width:125px;'>최종승인되었습니다.</div>"
                           }

                           if(tbWorkerApplyAttchList[i].applyAttachType == 3 && tbWorkerApplyAttchList[i].authStatus == 3) {
                               inputBtn = "<div style='width:125px;'>반려되었습니다.</div>"
                           } else if(tbWorkerApplyAttchList[i].applyAttachType == 1 && tbWorkerApplyAttchList[i].authStatus == 3) {
                               inputBtn =  "<div style='width:125px;'>반려되었습니다.</div>"
                           } else if(tbWorkerApplyAttchList[i].applyAttachType == 2 && tbWorkerApplyAttchList[i].authStatus == 3) {
                               inputBtn =  "<div style='width:125px;'>반려되었습니다.</div>"
                           }

                           let authStatusTxt = "";
                           if(tbWorkerApplyAttchList[i].authStatus == 1) {
                               authStatusTxt = "신청";
                               statusColor = "";
                           } else if(tbWorkerApplyAttchList[i].authStatus == 2) {
                               authStatusTxt = "승인";
                               statusColor = "style='background-color:'";
                           } else if(tbWorkerApplyAttchList[i].authStatus == 3) {
                               authStatusTxt = "반려";
                               statusColor = "style='background-color:#c6c6c6'"
                           }
                           var updateTime = "";
                           var insertTime = "";
                           var userId = "";
                           var param1 = "";
                           var param2 = "";
                           var param3 = "";

                           if(tbWorkerApplyAttchList[i].updateDate != null){
                               updateTime = (tbWorkerApplyAttchList[i].updateDate).substring(0,10)+" "+(tbWorkerApplyAttchList[i].updateDate).substring(11,19)
                           }
                           if(tbWorkerApplyAttchList[i].updateDate != null){
                               insertTime = (tbWorkerApplyAttchList[i].insertDate).substring(0,10)+" "+(tbWorkerApplyAttchList[i].insertDate).substring(11,19)
                           }
                           if(tbWorkerApplyAttchList[i].updateUserId != null){
                               userId = tbWorkerApplyAttchList[i].updateUserId
                           }
                           if(tbWorkerApplyAttchList[i].param1 != null){
                               param1 = "면허번호 : <span class='text-green'>"+ tbWorkerApplyAttchList[i].param1+"</span>"
                           }
                           if(tbWorkerApplyAttchList[i].param2 != null){
                               param2 = "면허종류 : "+ tbWorkerApplyAttchList[i].param2
                           }
                           if(tbWorkerApplyAttchList[i].param3 != null){
                               param3 = "만료일 : &nbsp;&nbsp;&nbsp;"+ tbWorkerApplyAttchList[i].param3
                           }

                           let imgPath = "/api/img/fileLoad?filePath="+tbWorkerApplyAttchList[i].uploadFile;
                           $(".attachList").append(
                               " <li >" +
                               "     <div class=\"panel-body\">" +
                               "         <table id=\"testTable\" class=\"display table table-bordered w-100 table-striped \">"+
                               "            <tbody>"+
                               "             <tr class=\"\" attachNo="+tbWorkerApplyAttchList[i].attachNo+" "+statusColor+">" +
                               "                <td style=\"width:60px;\">"+(i+1)+"</td>" +
                               "                <td style=\"width:101px;\">"+applyAttachType+"</td>" +
                               "                <td style=\"width:67px;\">"+authStatusTxt+"</td>" +
                               "                <td style=\"width:129px;\"><img style=\"width: 100px;height :53px;\" class=\"systemImg\" src="+imgPath+" onerror=\"this.src='${path}/assets/img/logo/logo-noimg.gif'\"></td>" +
                               "                <td style=\"width:78px;\">"+userId+"</td>" +
                               "                <td style=\"width:160px;\">"+param1+" <br>"+param2+"<br>"+param3+"</td>" +
                               "                <td style=\"width:120px;\">"+updateTime+"</td>" +
                               "                <td style=\"width:120px;\">"+insertTime+"</td>" +
                               "                <td style=\"width:120px;\" class=\"text-center\">" +
                               inputBtn+
                               "                </td>" +
                               "             </tr>" +
                               "           </tbody>" +
                               "        </table>"+
                               "     </div>" +
                               " </li>"
                           )

                         /*  $(".attachList").append(
                               " <li >" +
                               "     <label class=\"branch_text\">\n" +
                               "" + data.searchBranchList[i].branchName + "" +
                               "<small style=\"color: green;\">[" + data.searchBranchList[i].branchNo + "]</small>\n" +
                               "     </label>\n" +
                               "     <div class=\"float-right \"><input type=\"button\" class=\"btn btn-primary \" id=\"selBranchNoBtn\" branchName=" + data.searchBranchList[i].branchName + " style=\"height: 25px; line-height: 0px;margin-top: -5px;\"  branchNo=" + data.searchBranchList[i].branchNo + " value='"+apply+"'></div>\n" +
                               " </li>"
                           )*/
                       }
                   }
               }
           });

        });

        $(document).on("click",".btn-approval", function () {
            let attachNo = $(this).attr("attachNo");
            let applyAttachType = $(this).attr("applyAttachType");
            let param1 = $(this).attr("param1");
            let param2 = $(this).attr("param2");
            let param3 = $(this).attr("param3");
            let applyNo = $(this).attr("applyNo");
            let uploadFile = $(this).attr("uploadFile");
            let authStatus = 2;
            let updateUserId = "${sessionScope.sessionKey.userLoginId}";

            swal({
                title: "승인 하시겠습니까",
                icon: "warning",
                buttons: [
                    '취소',
                    '승인'
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: "/api/driver/attach/apporval",
                        data: {
                            attachNo : attachNo,
                            authStatus : authStatus,
                            param1 : param1,
                            param2 : param2,
                            param3 : param3,
                            applyNo : applyNo,
                            uploadFile : uploadFile,
                            applyAttachType : applyAttachType,
                            updateUserId : updateUserId
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 1) {
                                alert("승인되었습니다.");
                                location.reload();
                            } else {
                                alert("승인에 실패하였습니다.");
                                return;
                            }
                        }
                    });
                }
            });
        });
        $(document).on("click",".btn-companion", function () {
            let attachNo = $(this).attr("attachNo");
            let applyAttachType = $(this).attr("applyAttachType");
            let param1 = $(this).attr("param1");
            let param2 = $(this).attr("param2");
            let param3 = $(this).attr("param3");
            let uploadFile = $(this).attr("uploadFile");
            let applyNo = $(this).attr("applyNo");
            let authStatus = 3;
            let updateUserId = 1;
            swal({
                title: "반려 하시겠습니까",
                icon: "warning",
                buttons: [
                    '취소',
                    '반려'
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: "/api/driver/attach/apporval",
                        data: {
                            attachNo : attachNo,
                            authStatus : authStatus,
                            param1 : param1,
                            param2 : param2,
                            param3 : param3,
                            applyAttachType : applyAttachType,
                            uploadFile : uploadFile,
                            applyNo : applyNo,
                            updateUserId : updateUserId
                        },
                        /*contentType: "application/json;",*/
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 1) {
                                alert("반려되었습니다.");
                                location.reload();
                            } else {
                                alert("반려에 실패하였습니다.");
                                return;
                            }
                        }
                    });
                }
            });
        });


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
    });
    function close_pop(flag) {
        $('#myModal').hide();
    };
</script>
</body>
</html>
