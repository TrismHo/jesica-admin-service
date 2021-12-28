<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jesicar |배송원 공지등록</title>
    <%@include file="../../../common/include_head.jsp" %>
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main5" text="게시판관리"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main5.sub1" text="배송원 공지"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">등록<%--<spring:message code="merchandise.insert.title" text="default text"/>--%><%--상품등록--%></li>
                </ol>
                <h3 class="rix-title p-b-5">배송원 공지등록<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="row width-full p-5">
                <div class="panel panel-inverse width-full">
                    <div class="table-responsive m-l-5">
                        <form name="insert_form" id="insert_form" class="insert_form">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="insertUserName" name="insertUserName" value="${sessionScope.sessionKey.userStaffName}">
                            <input type="hidden" name="noticeNo" value="">
                            <input type="hidden" name="dataStatus" value="1">
                            <input type="hidden" name="headNo" class="headNo" value="">
                            <input type="hidden" name="branchNo" class="branchNo" value="">
                            <input type="hidden" name="viewYn" value="1">
                            <table class="table table-condensed table-bordered">
                                <tbody>
                                <tr>
                                    <td class="bg-light ">그룹구분</td>
                                    <td>
                                        <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                          <label class="m-r-10 ">
                                              <input type="radio"  name="groupType" class="groupType"  value="1" class="align-bottom" checked> 본사
                                          </label>
                                          <label class="m-r-10 ">
                                              <input type="radio"  name="groupType" class="groupType"  value="2" class="align-bottom" > 총판
                                          </label>
                                        </c:if>
                                        <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                            <label class="m-r-10 " style="display: none;">
                                                <input type="radio"  name="groupType" class="groupType"  value="2" class="align-bottom" checked>
                                            </label>
                                            총판
                                            <%--<label class="m-r-10 ">
                                                <input type="radio"  value="1" class="align-bottom" checked > 본사&lt;%&ndash;<spring:message code="merchandise.search1.option4" text="default text"/>&ndash;%&gt;
                                            </label>
                                            <label class="m-r-10 ">
                                                <input type="radio"  value="2" class="align-bottom" > 총판&lt;%&ndash;<spring:message code="merchandise.search1.option5" text="default text"/>&ndash;%&gt;
                                            </label>--%>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">그룹선택</td>
                                    <td>
                                        <%-- ${sessionScope}
                                             <span class="orangeColor">[S${tbNoticeCompany.storeNo}]</span>
                                             <span class="orangeColor">[D${tbNoticeCompany.dlvyNo}]</span>
                                         <select class="form-control width-200 brandNo" name="brandNo">
                                             <c:forEach var="item" items="${tbBrandList}" varStatus="status">
                                                 <option value="${item.brandNo}"> ${item.brandName}</option>
                                             </c:forEach>
                                         </select>--%>
                                        <%--${tbNoticeCompany.groupName--%>

                                        <select class="form-control width-200 selGroup " >
                                        </select>

                                        <input type="hidden" class="groupName" name="groupName" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">노출여부<%--<spring:message code="merchandise.insert.affiliates" text="default text"/>--%><%--가맹점--%></td>
                                    <td>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="0" class="align-bottom" checked> 비노출<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-r-10 ">
                                            <input type="radio" name="viewYn" value="1" class="align-bottom" > 노출<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light ">제목<%--<spring:message code="merchandise.insert.merchanname" text="default text"/>--%><%--상품명--%></td>
                                    <td><input type="text" class="form-control width-full title" name="title" value="" maxlength="150"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">내용<%--<spring:message code="merchandise.insert.merchanstatus" text="default text"/>--%><%--상품상태--%></td>
                                    <td>
                                        <textarea class="form-control width-full body" name="body" rows="10"></textarea>
                                    </td>
                                </tr>
                                <%-- <tr>
                                     <td class="bg-light text-center">첨부파일&lt;%&ndash;<spring:message code="merchandise.insert.storesalestatus" text="default text"/>&ndash;%&gt;&lt;%&ndash;매장 판매상태&ndash;%&gt;</td>
                                     <td>
                                         <div class="category_sort">
                                             <ul class="sort_list">
                                                 <li>
                                                     <div class="sort_body" id="sort_body">
                                                         <img style="width: 100%;" src="data:image/png;base64,${thumbNail}" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                                     </div>
                                                 </li>
                                                 <li>
                                                     * 권장 이미지 비율 : 984*876<br><br>
                                                     <div class="fileName"></div>
                                                     <br>
                                                     <div class="fileSize"></div>
                                                 </li>
                                             </ul>
                                             <label for="imgFile">
                                                 <div id="button_base" class="button_base b03_skewed_slide_in btn btn-primary">
                                                     <div>파일선택</div>
                                                 </div>
                                             </label>
                                             <input type="file" id="imgFile" name="imgFile" class="fileBtn" style="display: none;">
                                         </div>
                                     </td>
                                 </tr>--%>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="m-l-5">
                        <button type="button" class="btn btn-primary btn_add float-right m-t-5 m-r--5"><i class="fa fa-plus m-r-3"></i> 등록<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                        <button type="button" class="btn btn-primary btn_list float-left m-t-5"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
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
    $(() => {
        let basicList = "${sessionScope.sessionKey.userRole}";
        if(basicList == 1){
            selHeadList();
        } else {
            selBranchList();
        }

        $(".btn_list").click(function() {
            location.href = "${path}/board/worker/list";
        });

        $(document).on("change","input[name=groupType]",function(){
            let groupType = $(this).val();
            if(groupType == 1) {
                selHeadList();
            } else if (groupType == 2) {
                selBranchList()
            }
        });

        $(document).on("click",".btn_add",function() {
            let url = "${path}/api/board/worker/insert";

            let groupType = $("input[name=groupType]:checked").val();
            let groupName = $(".selGroup option:selected").attr("groupName");
            let gruopNo = $(".selGroup option:selected").val();

            let confirmmsg = "<spring:message code="list.script.wouldyouliketoregister" text="등록 하시겠습니까?"/>";
            let confirm = "<spring:message code="list.script.enrollment" text="등록"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let registrationwassuccessful = "<spring:message code="list.script.registrationwassuccessful" text="등록에 성공하였습니다."/>";
            let confirmfailmsg = "<spring:message code="list.script.registrationfailed" text="등록에 실패하였습니다."/>";


            if(groupType == 1) {
                $(".headNo").val(gruopNo);
                $(".groupName").val(groupName);
                $(".branchNo").val("")
            } else if (groupType == 2) {
                $(".headNo").val("");
                $(".groupName").val(groupName);
                $(".branchNo").val(gruopNo)
            }
            let _forms = $('#insert_form');
            let req = convertFormToObj(_forms);



            console.log(req)
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
                    formData.append("tbNoticeWorker",  new Blob([JSON.stringify(req)], {type:"application/json"}));
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
                                    location.href="${path}/board/worker/list"
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
    });
    function selHeadList() {
        let thegroupdoesnotexist = "<spring:message code="list.script.thegroupdoesnotexist" text="그룹이 존재하지 않습니다."/>";
        let headNo = Number("${sessionScope.sessionKey.headNo}");
        $.ajax({
            type: "POST",
            url: "${path}/api/search/head/list",
            data:JSON.stringify ({
                headNo : headNo
            }),
            contentType: "application/json;",
            success: function (data) {
                let resultList = data.searchHeadList;
                $(".selGroup").html("");
                if(resultList == null || resultList.length == 0) {
                    $(".selGroup").append("<option value=''>"+thegroupdoesnotexist+"</option>")
                } else {
                    for(var i = 0 ; i < resultList.length ; i++) {
                        $(".selGroup").append("<option value="+resultList[i].headNo+" groupName="+resultList[i].headName+">"+resultList[i].headName+"</option>")
                    }
                }

            }
        });
    }

    function selBranchList() {
        let thegroupdoesnotexist = "<spring:message code="list.script.thegroupdoesnotexist" text="그룹이 존재하지 않습니다."/>";
        let headNo = Number("${sessionScope.sessionKey.headNo}");
        $.ajax({
            type: "POST",
            url: "${path}/api/search/branch/list",
            data:JSON.stringify ({
                headNo : headNo
            }),
            contentType: "application/json;",
            success: function (data) {
                let resultList = data.searchBranchList;
                $(".selGroup").html("");
                if(resultList == null || resultList.length == 0) {
                    $(".selGroup").append("<option value=''>"+thegroupdoesnotexist+"</option>")
                } else {
                    let basicList = "${sessionScope.sessionKey.userRole}";
                    let branchNo = "${sessionScope.sessionKey.branchNo}";
                    if(basicList == 1) {
                        for(var i = 0 ; i < resultList.length ; i++) {
                            $(".selGroup").append("<option value="+resultList[i].branchNo+" groupName="+resultList[i].branchName+" >"+resultList[i].branchName+"</option>")
                        }
                    } else if (basicList == 2) {
                        for(var i = 0 ; i < resultList.length ; i++) {
                            if(resultList[i].branchNo == branchNo){
                                $(".selGroup").append("<option value="+resultList[i].branchNo+" groupName="+resultList[i].branchName+" >"+resultList[i].branchName+"</option>")
                            }
                        }
                    }

                }

            }
        });
    }

    function inputDataCheck(args) {
        let entertitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요."/>";
        let entersubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요."/>";
        if (isNull(args.title)) {
            return alert_focus("title", entertitle);
        } else if (isNull(args.body)) {
            return alert_focus("goodsPrice", entersubject);
        }
        return true;
    }
</script>
</body>
</html>
