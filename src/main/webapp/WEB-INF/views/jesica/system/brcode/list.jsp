<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="language.languagesetting1" text="총판코드 설정"/><%--<spring:message code="merchandise.title" text="default text"/>--%><%--상품관리--%></title>
</head>

<style>
    @media (min-width: 992px) {
        .vertical-box {
            display: table;
            table-layout: fixed;
            border-spacing: 0;
            height: 259px;
            width: 100%;
        }
        .vertical-box-row {
            display: block;
            height: 218px;
        }
    }

</style>
<body class="language-body">
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
        <div class="custom-row">
            <div class="col-xl-12-padding-0 ui-sortable">
                <div class="panel panel-inverse panel-table-height">

                       <table class="table table-sort table-striped table-condensed table-hover table-bordered margin-bottom-200 border-bottom">
                            <thead >
                                <tr class="sticky">
                                    <th style="width: 5%;"></th>
                                    <th style="width: 15%;"><spring:message code="language.key1" text="총판코드"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.ko1" text="총판명"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.ko1" text="사용여부"/></th>
                                    <th style="width: 10%;"><spring:message code="language.value.kh1" text="등록자"/></th>
                                    <th style="width: 10%;"><spring:message code="language.value.en1" text="수정자"/></th>
                                    <th style="width: 10%;"><spring:message code="language.value.en1" text="등록일"/></th>
                                    <th style="width: 10%;"><spring:message code="language.value.en1" text="수정일"/></th>
                                    <th style="width: 15%;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${brCodeList}" varStatus="status">
                                    <tr class="language-tr">
                                        <td class="bg-light" style="background-color:yellow; ">${status.count}</td>
                                        <td class="with-btn">
                                            <div class="btn btn-sm btn-social btn-adn text-left letter-spacing-01 lang-prop-name">${item.brCode}</div>
                                        </td>
                                        <td class="lang-prop-value" style="text-align: center;" >
                                            <input type="text" class="form-control brNameTxt" style=" width: 90%" value="${item.brName}">
                                        </td>
                                        <td style="text-align: center;">
                                           <select name="useYn" class="form-control useYn" style=" width: 90%">
                                               <option <c:if test="${item.useYn == 'Y'}">selected</c:if> value="Y">사용</option>
                                               <option <c:if test="${item.useYn == 'N'}">selected</c:if> value="N">미사용</option>
                                           </select>
                                        </td>
                                        <td class="lang-memo" style="text-align: center;">${item.putUserId}</td>
                                        <td class="lang-memo" style="text-align: center;">${item.modUserId}</td>
                                        <td class="lang-memo" style="text-align: center;">${item.putDate}</td>
                                        <td class="lang-memo" style="text-align: center;">${item.modDate}</td>
                                        <td class="lang-memo" style="text-align: center;">
                                            <span class="btn-group p-1 bg-black-transparent-2 rounded" style="width: 40%;">
                                               <a class="btn btn-sm btn-white btn-white-without-border updateCodeName" brCode="${item.brCode}">수정</a>
                                            </span>
                                           <span class="btn-group p-1 bg-black-transparent-2 rounded" style="width: 40%;">
                                               <a class="btn btn-sm btn-white btn-white-without-border deleteCodeName" brCode="${item.brCode}">삭제</a>
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
        <div class=" nav-title fadein-div">
            <%--<b>언어수정</b>--%>
            <a href="#"  class="btn btn-sm btn-white btn-white-without-border fadeUp" data-change="widget-theme" data-theme="dark"><i class="fas fa-lg fa-fw m-r-5 fa-arrow-alt-circle-up"></i><spring:message code="language.viewlanguagecorrection1" text="설정값수정 보기"/></a>
        </div>
        <div class="custom-row language_insert_panel">
                <div class="vertical-box with-grid inbox bg-light ">
                    <div class="vertical-box-column">
                        <div class="vertical-box">
                            <div class="nav-title p-5 p-l-15 border-bottom">
                               <input type="text" class="form-control w-50 btn btn-sm btn-social btn-adn text-left letter-spacing-01"  value="총판코드 등록" readonly>
                                <a href="#"  class="btn btn-sm btn-white btn-white-without-border fadeDown float-right" data-change="widget-theme" data-theme="dark"><i class="fas fa-lg fa-fw m-r-10 fa-arrow-alt-circle-down"></i><spring:message code="language.hide1" text="숨김"/></a>
                            </div>
                            <div class="vertical-box-row bg-white">
                                <div class="vertical-box-cell">
                                    <div class="vertical-box-inner-cell">
                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;">
                                            <div class="panel-body panel-form">
                                                <form class="form-horizontal form-bordered">
                                                    <input type="hidden" class="edit-lang-id" value="">
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col- col-form-label"><spring:message code="language.keyvalue1" text="총판코드"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " data-color="rgb(0, 0, 0)" data-color-format="rgb" id="colorpicker-append" data-colorpicker-id="2">
                                                                <input type="text" class="form-control edit-lang-br-code " placeholder="<spring:message code="language.keyvalue1" text="총판코드"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.korean1" text="총판명"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " data-color="rgb(0, 0, 0)" data-color-format="rgb" id="colorpicker-append" data-colorpicker-id="2">
                                                                <input type="text" class="form-control edit-lang-br-name" placeholder="<spring:message code="language.korean1" text="총판명"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.english1" text="등록일"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " data-color="rgb(0, 0, 0)" data-color-format="rgb" id="colorpicker-append" data-colorpicker-id="2">
                                                                <input type="text" class="form-control edit-lang-insert-date" placeholder="<spring:message code="language.english1" text="등록일"/>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.kh1" text="수정일"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " data-color="rgb(0, 0, 0)" data-color-format="rgb" id="colorpicker-append" data-colorpicker-id="2">
                                                                <input type="text" class="form-control edit-lang-update-date" placeholder="<spring:message code="language.kh1" text="수정일"/>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 412.589px;"></div>
                                        <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wrapper text-left border-top" style="background-color: #f0f0f0;">
                            <button type="button" class="btn btn-primary p-l-40 p-r-40 insert-brcode"><spring:message code="list.search.update" text="등록"/></button>
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

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script src="../../assets/js/demo/jquery.tablesorter.min.js"></script>
<script src="../../assets/js/demo/jquery.tablesorter.js"></script>
<%-- Custom JS End--%>
<script>
    window.onload = function() {
        setTimeout (function () {
            scrollTo(0,0);
        },100);
    }

    $(() => {
        $(".table-sort").tablesorter();
        $(".table-sort").colResizable();

        $(document).on("click" ,".fadeDown" ,function(){
            $(".language_insert_panel").slideUp(100);
        });

        $(document).on("click" ,".fadeUp" ,function(){
            $(".language_insert_panel").slideDown(100);
        });

        $(document).on("click" ,".insert-brcode" ,function(){
            var brCode = $(".edit-lang-br-code").val();
            var brName = $(".edit-lang-br-name").val();
            let putUserId = `${sessionScope.sessionKey.userLoginId}`;
            if (brCode == "" || brCode == null) {
                alert("<spring:message code="list.script.enterthekeyvaluetochange" text="총판코드를 입력해주세요"/>");
                return;
            } else if (brName == "" || brName == null) {
                alert("<spring:message code="list.script.enterthekoreanlanguageyouwanttochange" text="총판명 입력해주세요"/>");
                return;
            }

            $.ajax({
                type: "GET",
                url: "${path}/api/brcode/insert",
                dataType: "json",
                data : {
                    brCode : brCode,
                    brName : brName,
                    putUserId : putUserId
                },
                success: function(data) {
                    var result = data.result;
                    if(result == 1) {
                        alert("<spring:message code="list.script.changewassuccessful" text="등록에 성공하였습니다"/>");
                        location.reload();
                    } else {
                        alert("<spring:message code="list.script.changefailed" text="등록에 실패하였습니다"/>");
                        location.reload();
                    }
                }
            });
        });

        $(document).on("click" ,".updateCodeName" ,function(){

            let userLoginId = `${sessionScope.sessionKey.userLoginId}`;
            $.ajax({
                type: "GET",
                url: "${path}/api/brcode/update",
                dataType: "json",
                data : {
                    brCode : $(this).attr("brCode"),
                    brName : $(this).parents("tr").find(".brNameTxt").val(),
                    useYn : $(this).parents("tr").find(".useYn").val(),
                    modUserId : userLoginId
                },
                success: function(data) {
                    var result = data.result;
                    if(result == 1) {
                        alert("<spring:message code="list.script.changewassuccessful" text="변경에 성공하였습니다"/>");
                        location.reload();
                    } else {
                        alert("<spring:message code="list.script.changefailed" text="변경에 실패하였습니다"/>");
                        location.reload();
                    }
                }
            });
        });

        $(document).on("click" ,".deleteCodeName" ,function(){

            $.ajax({
                type: "GET",
                url: "${path}/api/brcode/delete",
                dataType: "json",
                data : {
                    brCode : $(this).attr("brCode"),
                },
                success: function(data) {
                    var result = data.result;
                    if(result == 1) {
                        alert("<spring:message code="list.script.changewassuccessful" text="삭제에 성공하였습니다"/>");
                        location.reload();
                    } else {
                        alert("<spring:message code="list.script.changefailed" text="삭제에 실패하였습니다"/>");
                        location.reload();
                    }
                }
            });
        });
      /*  $(document).on("click" ,".language-tr" ,function(){
            $(".language_insert_panel").slideDown(300);
            var langName = $(this).find(".lang-prop-name").text()
            var langKey = $(this).find(".lang-prop-value").text();
            var updateDate = $(this).find(".lang-update-date").text();
            var memo = $(this).find(".lang-memo").text();
            var insertDate = $(this).find(".lang-insert-date").text();

            $(".edit-lang-br-code").val(langName);
            $(".edit-lang-br-code").val(langKey);
            $(".edit-lang-br-name").val(memo);
            $(".edit-lang-insert-date").val(insertDate);
            $(".edit-lang-update-date").val(updateDate);
        });*/
    });
</script>
</body>
</html>
