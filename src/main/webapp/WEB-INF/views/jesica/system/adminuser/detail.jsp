<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jig-Bae | <spring:message code="list.detail.systemproductdetails" text="사용자 관리"/></title>
</head>
<style>
    .background-eee{
        background-color: #eee;
    }
    .background-fff{
        background-color: #fff;
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
    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="${path}/system/master/list"><spring:message code="sidemenu.system1" text="시스템 운영"/></a></li>
                    <li class="breadcrumb-item"><a href="${path}/system/master/detail"><spring:message code="sidemenu.system.systemmerchandise1" text="사용자 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.systemproductdetails1" text="사용자 관리상세"/></li>
                </ol>
                <h3 class="rix-title p-b-5"><spring:message code="list.detail.systemproductdetails1" text="사용자 관리상세"/></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light height-40" style="width:10%"><strong><spring:message code="list.detail.workgroup1" text="등급"/></strong></td>
                        <td style="width:90%">
                            <span class="text-green"><c:if test="${tbUserStaff.roleType == 0}">마스터</c:if>
                            <c:if test="${tbUserStaff.roleType == 1}">통합관리자</c:if>
                            <c:if test="${tbUserStaff.roleType == 2}">앱관리자</c:if>
                            </span>

                        </td>
                    </tr>
                </table>
            </div>
            <!-- end page-header -->
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none"><spring:message code="list.detail.basicInformation" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none"><spring:message code="list.detail.basicInformation" text="기본정보"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <c:if test="${sessionScope.sessionKey.roleType == 0}">
                    <li class="nav-item">
                        <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                            <span class="d-sm-none"><spring:message code="list.detail.deliverymaninformation1" text="메뉴권한"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                            <span class="d-sm-block d-none"><spring:message code="list.detail.deliverymaninformation1" text="메뉴권한"/><%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        </a>
                    </li>
                </c:if>
            </ul>
            <!-- end nav-tabs -->
            <!-- begin tab-content -->
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="false">
                        <div class="table-responsive">
                            <form id="update_form" class="update_form">
                                <input type="hidden" class="userNo" name="userNo" value="${userNo}">
                                <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <td class="bg-light width-150"><spring:message code="list.detail.id" text="아이디"/></td>
                                        <td class="width-500"><input type="text" class="form-control width-full userId upUserId" name="upUserId" value="${tbUserStaff.userId}" placeholder="아이디를 입력해주세요" disabled>
                                            <input type="hidden"class="upUserId" name="userId" value="${tbUserStaff.userId}">
                                        </td>
                                        <td class="text-danger-darker "><spring:message code="list.description.pleaseenteryourid1" text="수정불가"/></td>
                                    </tr>
                                    <%-- <tr>
                                           <td class="bg-light"><spring:message code="list.detail.oldpassword" text="기존 패스워드"/></td>
                                           <td><input type="text" class="form-control width-full userOldPwd" name="userOldPwd" value="" placeholder="<spring:message code="list.detail.pleaseenteranewpassword1" text="기존 패스워드를 입력해주세요"/>" maxlength="60"></td>
                                           <td class="text-danger-darker"><spring:message code="list.description.pleaseenteranewpassword1" text="기존 패스워드를 입력해주세요(기존패스워드가 일치하여야만 정보수정이 가능합니다.)"/> </td>
                                       </tr>--%>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.newpassword1" text="신규 패스워드"/></td>
                                        <td><input type="text" class="form-control width-full userPwd upUserPwd" name="userPwd" value="" placeholder="<spring:message code="list.detail.pleaseenteranewpassword" text="새로운 패스워드를 입력해주세요"/>" maxlength="60"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteranewpassword" text="신규 패스워드를 입력해주세요 (미입력시 기존패스워드로 저장)"/> </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.username" text="사용자 이름"/></td>
                                        <td><input type="text" class="form-control width-full name upName" name="name" value="${tbUserStaff.name}" placeholder="<spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/> " maxlength="20"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourusername" text="사용자 이름을 입력해주세요"/> </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.userphone" text="사용자 전화번호"/></td>
                                        <td><input type="text" class="form-control width-full phone upPhone" name="phone" value="${tbUserStaff.phone}" placeholder="<spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/>" maxlength="20"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber" text="사용자 전화번호를 입력해주세요"/> </td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.status" text="상태"/></td>
                                        <td>
                                            <select class="form-control upDataStatus" name="dataStatus">
                                                <option value="0" <c:if test="${tbUserStaff.dataStatus == 0}">selected</c:if>> <spring:message code="list.detail.delete" text="삭제"/></option>
                                                <option value="1" <c:if test="${tbUserStaff.dataStatus == 1}">selected</c:if>> <spring:message code="list.detail.normal" text="정상"/></option>
                                                <option value="2" <c:if test="${tbUserStaff.dataStatus == 2}">selected</c:if>> <spring:message code="list.detail.stop" text="정지"/></option>
                                            </select>
                                            <label class="m-l-10 blockTypeCodeSel" style="display: <c:if test="${tbUserStaff.dataStatus == 1}" >none</c:if>">
                                                정지/삭제사유 :
                                                <select class="blockTypeCode" name="blockTypeCode">
                                                    <c:forEach var="item" items="${systemCodeList}" varStatus="status">
                                                        <option value="${item.sysCode}" <c:if test="${tbUserStaff.blockTypeCode == item.sysCode}" >selected</c:if> > ${item.codeName} </option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourphonenumber1" text="상태를 선택해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.id1" text="앱코드"/></td>
                                        <td>

                                           <c:if test="${empty tbUserStaff.appCode}">
                                               <input type="text" class="form-control"  readonly value="전체">
                                               <input type="hidden" class="form-control" name="appCode" readonly value="${tbUserStaff.appCode}">
                                            </c:if>
                                            <c:if test="${!empty tbUserStaff.appCode}">
                                                <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                                    <c:if test="${tbUserStaff.appCode == appCodeList.sysCode}">
                                                        <input type="text" class="form-control"  readonly value="${appCodeList.codeName}">
                                                        <input type="hidden" class="form-control" name="appCode" readonly value="${tbUserStaff.appCode}">
                                                    </c:if>
                                                </c:forEach>

                                            </c:if>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenteryourid" text="앱코드를 선택해주세요."/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.memo" text="메모"/></td>
                                        <td><input type="text" class="form-control width-full memo upMemo" name="memo" value="${tbUserStaff.memo}" placeholder="<spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/>" maxlength="200"></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.pleaseenterothernotes" text="기타 메모를 입력해주세요"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.111" text="등록자"/></td>
                                        <td><input type="text" class="form-control width-full "  value="${tbUserStaff.insertUserId}" placeholder="" disabled>
                                        </td>
                                        <td class="text-danger-darker"><spring:message code="list.description.11" text="수정불가"/></td>
                                    </tr>
                                    <tr>
                                        <td class="bg-light"><spring:message code="list.detail.memo2" text="등록일"/></td>
                                        <td><input type="text" class="form-control width-full memo "  value="<javatime:format value="${tbUserStaff.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />" maxlength="200" disabled></td>
                                        <td class="text-danger-darker"><spring:message code="list.description.11" text="수정불가"/></td>
                                    </tr>
                                </table>
                            </form>
                            <div class="m-l-5">
                                <button type="button" class="btn btn-primary btn_list float-left m-t-5 m-b-5 m-r-5"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <c:if test="${sessionScope.sessionKey.roleType == 0}"><button type="button" class="btn btn-primary  float-left m-t-5 m-b-5 m-r-5" onclick="udt_btn()"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button></c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->

                <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive">
                        <form id="update_form2" name="update_form2">
                            <table class="table table-condensed table-bordered">
                                <thead>
                                    <th class="width-50"></th>
                                    <th style="width: 150px;"> 메뉴레벨 1   <br> <span class="text-red">(* 해당 권한이 없으면 하위메뉴를 사용할수 없습니다.)</span></th>
                                    <th style="width: 150px;"> 메뉴레벨 2 <br> &nbsp; </th>
                                </thead>
                                <tr>
                                    <td class="bg-light" rowspan="${tbSiteMenus.size()+1}"><spring:message code="list.detail.accountholder1" text="메뉴별 사용여부"/></td>
                                </tr>
                                <c:forEach var="item" items="${tbSiteMenus}" varStatus="status">

                                    <%-- 관제는 따로 --%>
                                 <%--   <c:if test="${item.menuLevel == 10}">
                                        <tr>
                                            <td class="width-150 " colspan="2">
                                                <div class="checks small m-l-10">
                                                    <input type="checkbox" class="menuUseChk menuLevelOne" menugroup="${item.menuGroup}" id="ex_chk${item.menuNo}"
                                                           value="${item.menuNo}"
                                                    <c:forEach items="${tbSiteAclList}" var="itemChk">
                                                        <c:choose>
                                                            <c:when test="${itemChk.menuNo == item.menuNo}">
                                                                   checked
                                                            </c:when>
                                                            <c:when test="${itemChk == '' || itemChk == null }">
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                    >
                                                    <label for="ex_chk${item.menuNo}"> ${item.menuName}</label><br>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>--%>
                                    <c:if test="${item.menuLevel == 1 && item.menuName != '시스템 운영'}">
                                        <tr>
                                            <td >
                                                <div class="checks small m-l-10">
                                                    <input type="checkbox" class="menuUseChk menuLevelOne" menuNo="${item.menuNo}" menugroup="${item.menuGroup}" id="ex_chk${item.menuNo}"
                                                           value="${item.menuNo}"
                                                    <c:forEach items="${tbSiteAclList}" var="itemChk2">
                                                        <c:choose>
                                                            <c:when test="${(itemChk2.menuNo == item.menuNo) && itemChk2.permission == 1}">
                                                                   checked
                                                            </c:when>
                                                            <c:when test="${itemChk2 == '' || itemChk == null }">
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                    >
                                                    <label for="ex_chk${item.menuNo}"> ${item.menuName}</label>
                                                    <br>
                                                </div>
                                            </td>
                                            <td class="border-right-0  menugroup${item.menuGroup}" menugroup="${item.menuGroup}">
                                                <table>
                                                    <thead>
                                                    <th class="width-50 bg-light">메뉴명 </th>
                                                    <th class="text-center bg-light"> 수정/읽기 권한</th>
                                                    <th class="text-center bg-light"> 다운로드 권한</th>
                                                    </thead>
                                                        <c:forEach var="item2" items="${tbSiteMenus}" varStatus="status">
                                                            <c:if test="${item2.menuLevel == 2 && (item.menuGroup == item2.menuGroup)}">
                                                                <tr class="menuSelectTr" menuNo="${item2.menuNo}">
                                                                    <td class="width-150">
                                                                        <div class="checks m-l-10" menugroup="${item2.menuGroup}" >
                                                                                  ${item2.menuName}
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="checks small m-l-10" menugroup="${item2.menuGroup}" >
                                                                            <select class="form-control permission" menuNo="${item2.menuNo}">
                                                                                <option value="0"
                                                                                        <c:forEach items="${tbSiteAclList}" var="itemChk3">
                                                                                            <c:if test="${(itemChk3.menuNo == item2.menuNo) && itemChk3.permission == 0}">
                                                                                                selected
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                        >권한 없음 </option>
                                                                                <option value="1"
                                                                                        <c:forEach items="${tbSiteAclList}" var="itemChk4">
                                                                                            <c:if test="${(itemChk4.menuNo == item2.menuNo) && itemChk4.permission == 1}">
                                                                                                selected
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                >조회 권한</option>
                                                                                <option value="2"
                                                                                        <c:forEach items="${tbSiteAclList}" var="itemChk5">
                                                                                            <c:if test="${(itemChk5.menuNo == item2.menuNo) && itemChk5.permission == 2}">
                                                                                                selected
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                >업데이트 권한</option>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <div class="checks small m-l-10" menugroup="${item2.menuGroup}" >
                                                                            <select class="form-control downloadAble" name="downloadAble" menuNo="${item2.menuNo}" >
                                                                                <option value="0"
                                                                                        <c:forEach items="${tbSiteAclList}" var="itemChk6">
                                                                                            <c:if test="${(itemChk6.menuNo == item2.menuNo) && itemChk6.downloadAble == 0}">
                                                                                                selected
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                >권한 없음</option>
                                                                                <option value="1"
                                                                                        <c:forEach items="${tbSiteAclList}" var="itemChk7">
                                                                                            <c:if test="${(itemChk7.menuNo == item2.menuNo) && itemChk7.downloadAble == 1}">
                                                                                                selected
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                >다운로드 권한</option>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                </table>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                            <div class="m-t-10">
                                <button type="button" class="btn btn-primary btn_list"><i class="fa fa-list m-r-3"></i> <spring:message code="list.detail.list" text="목록"/></button>
                                <c:if test="${permission == 2}">
                                    <button type="button" class="btn btn-primary btn_update"><i class="fa fa-check m-r-3"></i> <spring:message code="list.detail.update" text="수정"/></button>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- end tab-pane -->
            </div>
        </div>
        <!-- end row -->
    </div>
    <!-- begin #content -->
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<link href="../../../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet">
<script src="../../../assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<%-- Custom JS End--%>

<script>
    $(() => {
        //상위메뉴에 의한 하위메뉴 사용여부
       /* $(".menuUseChk").each(function() {
            var checked = $(this).is(':checked');
            var menuGroup = $(this).attr("menuGroup");
            var menuGroupChk = "menuGroupChk"+menuGroup;
            if(checked) {
                $("."+menuGroupChk).attr("disabled",false);
            } else {
                $("."+menuGroupChk).attr("disabled",true);
            }
        });*/

        /*$(".menuLevelOne").on("click",function(){
            var checked = $(this).is(':checked');
            var menuGroup = $(this).attr("menuGroup");
            var menu = "menugroup"+menuGroup;
            var menuGroupChk = "menuGroupChk"+menuGroup;
            if(checked) {
                //$("."+menu).addClass("background-fff");
                $("."+menuGroupChk).attr("disabled",false);

            }else{
                //$("."+menu).removeClass("background-fff");
                $("."+menuGroupChk).attr("disabled",true);

            }
        });*/

        /*$(".menuUseChk").on("click",function(){
            var checked = $(this).is(':checked');
            let url = checked === true ? "${path}/api/system/menu/insert" : "${path}/api/system/menu/delete" ;
            let menuNo = $(this).val();
            let userNo = "${userNo}";
            $.ajax({
                type: "POST",
                url: url,
                data: {
                    menuNo : menuNo,
                    userNo : userNo
                },
                dataType: "json",
                success: function (data) {
                    if (data.result == 200) {
                        var unique_id = $.gritter.add({
                            // (string | mandatory) the heading of the notification
                            title: checked === true ? '해당 메뉴권한이 추가되었습니다.' : '해당 메뉴권한이 삭제되었습니다.',
                            // (string | mandatory) the text inside the notification
                            text: '',
                            // (string | optional) the image to display on the left
                            image: '',
                            // (bool | optional) if you want it to fade out on its own or just sit there
                            sticky: false,
                            // (int | optional) the time you want it to be alive for before fading out
                            time: '2000',
                            // (string | optional) the class name you want to apply to that specific message
                            class_name: 'my-sticky-class'
                        });
                        let id ="ex_down_chk"+menuNo;
                        if(checked){
                            $(".downChkSpan"+menuNo).html("<input type='checkbox' id="+id+" class='menuDownChk'  value="+menuNo+">(<label for="+id+"> 다운로드 권한</label>)");
                        } else {
                            $(".downChkSpan"+menuNo).html("");
                        }


                        return false;
                    } else {
                        alert("추가에 실패하였습니다.");
                        return;
                    }
                }
            });
        });*/


        $(".upDataStatus").on("change",function (){
            var radioVal = $('.upDataStatus option:selected').val();
            if(radioVal == 1){
                $(".blockTypeCodeSel").css("display","none");
            } else {
                $(".blockTypeCodeSel").css("display","inline");
            }
        });

        /*$("input[name=goodsPrice]").focus(function(){
        }).blur(function(){
            if($(this).val() == ""){
                $(this).val("0");
            }
        });*/

        $(".btn_list").click(function() {
            location.href = "${path}/system/master/list";
        });


        /*let date = new Date();
        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $("#endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker('setDate', date);*/
    });

    $(document).on("click",".menuDownChk",function(){
        let checked = $(this).is(':checked');
        let url = "${path}/api/system/menu/update";
        let menuNo = $(this).val();
        let userNo = "${userNo}";
        $.ajax({
            type: "POST",
            url: url,
            data: {
                menuNo : menuNo,
                userNo : userNo,
                downloadAble : checked === true ? 1 : 0
            },
            dataType: "json",
            success: function (data) {
                if (data.result == 200) {
                    var unique_id = $.gritter.add({
                        // (string | mandatory) the heading of the notification
                        title: checked === true ? '다운로드 권한이 추가되었습니다.' : '다운로드 권한이 삭제되었습니다.',
                        // (string | mandatory) the text inside the notification
                        text: '',
                        // (string | optional) the image to display on the left
                        image: '',
                        // (bool | optional) if you want it to fade out on its own or just sit there
                        sticky: false,
                        // (int | optional) the time you want it to be alive for before fading out
                        time: '2000',
                        // (string | optional) the class name you want to apply to that specific message
                        class_name: 'my-sticky-class'
                    });

                    return false;
                } else {
                    alert("추가에 실패하였습니다.");
                    return;
                }
            }
        });
    });

    //메뉴 권한 수정
    $(document).on("click",".btn_update",function() {
        let url = "${path}/api/system/menu/update";
        let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";
        let correctionwassuccessful = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let _forms = $('.update_form2');
        let req = convertFormToObj(_forms);
        let menuPermissionList = [];
        let levelGroup = $(".menuLevelOne").length;

        for(let i=0; i< levelGroup; i++) {
            let checked = $(".menuLevelOne").eq(i).is(':checked') ? 1 : 0;
            let menuNo = $(".menuLevelOne").eq(i).attr("menuNo");
            let userNo = "${userNo}";
            menuPermissionList.push({menuNo : menuNo, permission : checked, downloadAble : "1", userNo:userNo});
        }

        let grpl = $(".menuSelectTr").length;
        for(let i=0; i< grpl; i++) {
            let menuNo = $(".menuSelectTr").eq(i).attr("menuNo");
            let userNo = "${userNo}";
            let permission = $(".menuSelectTr").eq(i).find(".permission").val();
            let downloadAble = $(".menuSelectTr").eq(i).find(".downloadAble").val();
            console.log(downloadAble)

            menuPermissionList.push({menuNo : menuNo, permission : permission, downloadAble : downloadAble, userNo:userNo});
        }
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
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: JSON.stringify(menuPermissionList),
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            if (data.result == 200) {
                                alert(correctionwassuccessful);
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


    //기본 정보 수정
    function udt_btn() {
        let radioVal = $('.upDataStatus option:selected').val();
        let url = "${path}/api/userStaff/update/action";
        //let url2 = "${path}/api/userStaff/oldpass/confirm";
        let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
        let correctionwassuccessful = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
        let editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
        let update = "<spring:message code="list.script.update" text="수정"/>";

        if(radioVal == 0){
            wouldyouliketoupdate = "삭제하시겠습니까?";
            correctionwassuccessful = "삭제에 성공하였습니다.";
            editfailed = "삭제에 실패하였습니다.";
            update = "삭제";
        } else {
            wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate" text="수정하시겠습니까?"/>";
            correctionwassuccessful = "<spring:message code="list.script.correctionwassuccessful" text="수정에 성공하였습니다."/>";
            editfailed = "<spring:message code="list.script.editfailed" text="수정에 실패하였습니다."/>";
            update = "수정";
        }


        let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
        let _forms = $('.update_form');
        let req = convertFormToObj(_forms);
        if (inputDataCheckStaff(req)) {
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
                    formData.append("tbUserStaffData",  new Blob([JSON.stringify(req)], {type:"application/json"}));
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: formData,
                        dataType: "json",
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            radioVal = $('.upDataStatus option:selected').val();
                            if (data.result == 200) {
                                if(radioVal == 0){
                                    alert("삭제되었습니다.");
                                    location.href = "${path}/system/master/list";
                                } else {
                                    alert(correctionwassuccessful);
                                    location.reload();
                                }
                            } else {
                                alert(editfailed);
                                return;
                            }
                        }
                    });
                    //기존 패스워드 검사
                    /* $.ajax({
                          type: "POST",
                          url: url2,
                          data: formData,
                          dataType: "json",
                          processData: false,
                          contentType: false,
                          success: function (data) {
                              if (data.result == 200) {
                                  $.ajax({
                                      type: "POST",
                                      url: url,
                                      data: formData,
                                      dataType: "json",
                                      processData: false,
                                      contentType: false,
                                      success: function (data) {
                                          if (data.result == 200) {
                                              alert(correctionwassuccessful);
                                              location.reload();
                                          } else {
                                              alert(editfailed);
                                              return;
                                          }
                                      }
                                  });
                              } else {
                                  alert("기존패스워드가 일치하지 않습니다.");
                                  return;
                              }
                          }
                      });*/


                }
            });
        }
    }

    function inputDataCheckStaff(args) {
        if (isNull(args.userId)) {
            return alert_focus("userId", "아이디를 입력해주세요.");
        } /*else if (isNull(args.userOldPwd)) {
            return alert_focus("userOldPwd", "기존 비밀번호를 입력해주세요.");
        } */else if (isNull(args.name)) {
            return alert_focus("name", "이름를 입력해주세요.");
        } else if (isNull(args.phone)) {
            return alert_focus("phone", "전화번호를를 입력해주세요.");
        }
        return true;
    }
    function inputDataCheck(args) {
        return true;
    }


</script>
</body>
</html>
