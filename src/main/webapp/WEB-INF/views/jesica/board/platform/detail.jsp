<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="list.detail.platformnoticedetail" text="플랫폼 공지"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네  | <spring:message code="list.detail.platformnoticedetail" text="플랫폼 공지"/></title>
    </c:if>
</head>
<style >
    .compact-table th {
        width: 140px;
        background: #fcfcfd;
        color: #6b7280;
        font-weight: 700;
    }

    .compact-table td {
        color: #222;
        font-weight: 500;
        background: #fff;
    }
    .panel-box {
        background: #fff;
        border: 1px solid #ddd;
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
    <div id="content" class="content p-20">
        <div class="notice-detail-page">
            <div class="notice-detail-header">
                <ol class="breadcrumb float-xl-right p-r-10 m-b-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="게시판 관리"/></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement.platformannouncement" text="플랫폼 공지"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="list.detail.platformnoticedetail" text="플랫폼 공지 상세"/></li>
                </ol>
                <h3 class="notice-detail-title"><spring:message code="list.detail.platformnoticedetail" text="플랫폼 공지 상세"/></h3>
            </div>

            <div class="detail-shell">
                <div class="detail-section">
                    <div class="section-head">
                        <h4 class="section-title">공지 기본 정보</h4>
                    </div>

                    <div class="section-body">
                        <form name="update_form" id="update_form" class="update_form">
                            <input type="hidden" class="updateUserId" name="updateUserId" value="${sessionScope.sessionKey.userLoginId}">
                            <input type="hidden" class="insertUserId" name="insertUserId" value="${tbNoticePlatform.insertUserId}">
                            <input type="hidden" name="noticeNo" value="${tbNoticePlatform.noticeNo}">
                            <input type="hidden" name="dataStatus" value="${tbNoticePlatform.dataStatus}">
                            <input type="hidden" name="platformType" value="${tbNoticePlatform.platformType}">
                            <input type="hidden" name="groupType" value="${tbNoticePlatform.groupType}">

                            <div class="main-grid">
                                <div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">노출 및 서비스 설정</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>앱코드</th>
                                                <td>
                                                    <c:if test="${empty appCode}">
                                                        <select name="appCode" class="form-control" style="max-width: 240px;">
                                                            <c:forEach var="appCodeList" items="${appVersionList}">
                                                                <option value="${appCodeList.sysCode}" <c:if test="${tbNoticePlatform.appCode == appCodeList.sysCode}">selected</c:if>>
                                                                        ${appCodeList.codeName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${!empty appCode}">
                                                        <input type="text" class="form-control" name="appCode" readonly value="${tbNoticePlatform.appCode}" style="max-width: 240px;">
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>서비스지역</th>
                                                <td>
                                                    <select name="serviceNo" class="form-control" style="max-width: 240px;">
                                                        <c:forEach var="serviceList" items="${appServiceList}">
                                                            <option value="${serviceList.serviceNo}" <c:if test="${tbNoticePlatform.serviceNo == serviceList.serviceNo}">selected</c:if>>
                                                                    ${serviceList.serviceName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>제목</th>
                                                <td>
                                                    <input type="text" name="title" value="${tbNoticePlatform.title}" class="form-control width-full title" maxlength="150">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div>
                                    <div class="panel-box">
                                        <div class="panel-box-head">등록 정보</div>
                                        <table class="compact-table">
                                            <tbody>
                                            <tr>
                                                <th>등록 사용자</th>
                                                <td class="meta-text">
                                                    ${tbNoticePlatform.insertUserId}
                                                    (<javatime:format value="${tbNoticePlatform.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />)
                                                </td>
                                            </tr>
                                            <c:if test="${tbNoticePlatform.updateDate != null && tbNoticePlatform.updateDate != ''}">
                                                <tr>
                                                    <th>수정 사용자</th>
                                                    <td class="meta-text">
                                                            ${tbNoticePlatform.updateUserId}
                                                        (<javatime:format value="${tbNoticePlatform.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />)
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <tr>
                                                <th>공지번호</th>
                                                <td>${tbNoticePlatform.noticeNo}</td>
                                            </tr>
                                            <tr>
                                                <th>노출여부</th>
                                                <td>
                                                    <div class="radio-group">
                                                        <label>
                                                            <input type="radio" name="viewYn" value="0" <c:if test="${tbNoticePlatform.viewYn == 0}">checked</c:if>>
                                                            <span>숨김</span>
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="viewYn" value="1" <c:if test="${tbNoticePlatform.viewYn == 1}">checked</c:if>>
                                                            <span>노출</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-box" style="margin-top: 10px;">
                                <div class="panel-box-head">공지 내용</div>
                                <table class="compact-table">
                                    <tbody>
                                    <tr>
                                        <td class="p-0">
                                            <textarea id="body" class="form-control width-full ckeditor" rows="20">${tbNoticePlatform.body}</textarea>
                                            <textarea style="display:none;" name="body" class="body" rows="10">${tbNoticePlatform.body}</textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>

                        <div class="bottom-actions">
                            <div>
                                <button type="button" class="btn btn-primary btn_list">
                                    <i class="fa fa-list m-r-3"></i> 목록
                                </button>
                            </div>

                            <div class="action-right">
                                <c:if test="${permission == 2}">
                                    <button type="button" class="btn btn-blue btn_push" noticeNo="${tbNoticePlatform.noticeNo}">
                                        <i class="fa fa-caret-right m-r-3"></i> 푸시발송(전체)
                                    </button>
                                    <button type="button" class="btn btn-primary btn_up">
                                        <i class="fa fa-check m-r-3"></i> 수정
                                    </button>
                                    <button type="button" class="btn btn-danger btn_remove" noticeNo="${tbNoticePlatform.noticeNo}">
                                        <i class="fa fa-trash-alt m-r-3"></i> 삭제
                                    </button>
                                </c:if>
                            </div>
                        </div>
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
<%-- Custom JS End--%>

<script>
    CKEDITOR.replace('body', { filebrowserUploadUrl: '${path}/api/file/upload/platform',
        font_names: '맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana',
        font_defaultLabel: '맑은 고딕/Malgun Gothic',
        fontSize_defaultLabel: '12',
        allowedContent : true,
        language: 'ko',
    });
    $(() => {
        $(".btn_list").click(function() {
            location.href = "${path}/board/platform/list?groupType=&dataStatus=OK&title=&startDate=2020-01-01&endDate=${now}";
        })
        $(".btn_remove").click(function() {
            let url = "${path}/api/board/platform/delete";
            let noticeNo = $(this).attr("noticeNo");
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete" text="삭제 하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg" text="삭제"/>";
            let deletionfailed = "<spring:message code="list.script.deletionfailed" text="삭제에 실패하였습니다."/>";
            let deleted = "<spring:message code="list.script.deleted" text="삭제되었습니다."/>";

            swal({
                title: doyouwanttodelete,
                icon: "warning",
                buttons: [
                    cancel,
                    deletemsg
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            noticeNo : noticeNo
                        },
                        /*contentType: "application/json;",*/
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 200) {
                                alert(deleted);
                                location.href="${path}/board/platform/list";
                            } else {
                                alert(deletionfailed);
                                return;
                            }
                        }
                    });
                }
            });
        })

        $(".btn_push").click(function() {
            let url = "${path}/api/send/message/type";
            let eventNo = $(this).attr("eventNo");
            let pushTitle = $(".title").val();
            let pushContents = $(".body").val();
            let appCode = `${sessionScope.sessionKey.appCode}`;
            let doyouwanttodelete = "<spring:message code="list.script.doyouwanttodelete1" text="전송하시겠습니까?"/>";
            let cancel = "<spring:message code="list.script.cancel" text="취소"/>";
            let deletemsg = "<spring:message code="list.script.deletemsg1" text="전송"/>";

            swal({
                title: doyouwanttodelete,
                icon: "warning",
                buttons: [
                    cancel,
                    deletemsg
                ],
                dangerMode: true,
            }).then(function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            pushTitle : pushTitle,
                            pushContents : pushContents,
                            appCode: appCode,
                            type: 1
                        },
                        /*contentType: "application/json;",*/
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 200) {
                                alert("전송되었습니다.");
                                //location.href="${path}/board/event/list?dataStatus=OK";
                            } else {
                                alert("전송에 실패하였습니다.");
                                return;
                            }
                        }
                    });
                }
            });
        });

        $(document).on("click",".btn_up",function() {
            let url = "${path}/api/board/platform/update";
            var value = CKEDITOR.instances['body'].getData();
            $(".body").val(value);
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
                        formData.append("tbNoticePlatform", new Blob([JSON.stringify(req)], {type: "application/json"}));
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
    });

    function inputDataCheck(args) {
        let pleaseenterantitle = "<spring:message code="list.script.pleaseenterantitle" text="제목을 입력해주세요"/>";
        let pleaseenteransubject = "<spring:message code="list.script.pleaseenteransubject" text="내용을 입력해주세요"/>";
        if (isNull(args.title)) {
            return alert_focus("title", pleaseenterantitle);
        } else if (isNull(args.body)) {
            return alert_focus("goodsPrice",pleaseenteransubject);
        }
        return true;
    }

    function convertFormToObj(_forms) {

        let resultObj = {};
        //console.log("_forms::{})", _forms);
        $.each(_forms.serializeArray(), function (idx, item) {
            /*console.log("resultObj[item.name]::{}", idx);
            console.log("item.value[" + idx + "]::{}", item.value);*/
            resultObj[item.name] = item.value;
        });
        // console.log("resultObj::{}", resultObj);
        return resultObj;
    }

    function isNull(v) {
        return v === undefined || v === null || v === "";
    }
</script>
</body>
</html>
