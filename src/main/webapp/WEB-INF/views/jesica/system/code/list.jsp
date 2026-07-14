<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>온동네 | <spring:message code="language.languagesetting1" text="시스템 코드설정"/><%--<spring:message code="merchandise.title" text="default text"/>--%><%--상품관리--%></title>
</head>

<style>
    @media (min-width: 992px) {
        .vertical-box {
            display: table;
            table-layout: fixed;
            border-spacing: 0;
            height: 335px;
            width: 100%;
        }
        .vertical-box-row {
            display: block;
            height: 325px;
        }
    }
    .panel-table-height {
        height: 90vh;
        overflow: auto;
        margin-bottom: 0px;
    }
    .code_panel {
        z-index: 4;
        bottom: 0;
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
                                    <th style="width: 3%;"></th>
                                    <th style="width: 20%;"><spring:message code="language.key1" text="분류_구분"/></th>
                                    <th style="width: 20%;"><spring:message code="language.value.ko1" text="분류_코드"/></th>
                                    <th style="width: 30%;"><spring:message code="language.value.kh1" text="분류_명"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="코드_이름"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="코드_상세값"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="메모"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="등록일"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="수정일"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${tbServiceCode}" varStatus="status">
                                    <tr class="code-tr">
                                        <td class="bg-light" style="background-color:yellow; ">${status.count}</td>
                                        <td class="with-btn">
                                            <div class="btn btn-sm btn-social btn-adn text-left letter-spacing-01 sys-type">${item.sysType}</div>
                                        </td>
                                        <td>
                                            <div class="btn btn-sm btn-social btn-adn text-left letter-spacing-01 sys-code">${item.sysCode}</div>
                                        </td>
                                        <td>
                                            <div class="btn btn-sm btn-social btn-adn text-left letter-spacing-01 sys-name">${item.sysName}</div>
                                        </td>
                                        <td class="code-name"><code>${item.codeName}</code></td>
                                        <td class="code-value"><code>${item.codeValue}</code></td>
                                        <td class="memo" style="text-align: center;">${item.memo}</td>
                                        <td class="lang-insert-date" style="text-align: center;"><javatime:format value="${item.insertDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                        <td class="lang-update-date" style="text-align: center;"><javatime:format value="${item.updateDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
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
        <div class="custom-row code_panel">
                <div class="vertical-box with-grid inbox bg-light ">
                    <div class="vertical-box-column">
                        <div class="vertical-box">
                            <div class="nav-title p-5 p-l-15 border-bottom">
                                <b class="mr-3"><spring:message code="system.languagename1" text="분류구분"/> :</b>
                                <input type="text" class="form-control w-30 btn btn-sm btn-social btn-adn text-left letter-spacing-01 edit-sys-type" placeholder="<spring:message code="language.languagename1" text=""/>" readonly>
                                <input type="text" class="form-control w-30 btn btn-sm btn-social btn-adn text-left letter-spacing-01 edit-sys-code" placeholder="<spring:message code="language.languagename1" text=""/>" readonly>
                                <input type="text" class="form-control w-50 btn btn-sm btn-social btn-adn text-left letter-spacing-01 edit-sys-name" placeholder="<spring:message code="language.languagename1" text=""/>" readonly>
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
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col- col-form-label"><spring:message code="language.keyvalue1" text="코드 이름"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " >
                                                                <input type="text" class="form-control edit-code-name " placeholder="<spring:message code="language.keyvalue1" text="설정값"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col- col-form-label"><spring:message code="language.keyvalue1" text="코드 상세"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group ">
                                                                <input type="text" class="form-control edit-code-value" placeholder="<spring:message code="language.korean1" text="메모"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.korean1" text="메모"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " >
                                                                <input type="text" class="form-control edit-memo" placeholder="<spring:message code="language.korean1" text="메모"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.english1" text="등록일"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group ">
                                                                <input type="text" class="form-control edit-insert-date" placeholder="<spring:message code="language.english1" text="등록일"/>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.english1" text="등록일"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " >
                                                                <input type="text" class="form-control edit-insert-date" placeholder="<spring:message code="language.english1" text="등록일"/>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.kh1" text="수정일"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group ">
                                                                <input type="text" class="form-control edit-update-date" placeholder="<spring:message code="language.kh1" text="수정일"/>" readonly>
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
                            <button type="submit" class="btn btn-white p-l-40 p-r-40 m-r-5"><spring:message code="list.search.cancel" text="취소"/></button>
                            <button type="submit" class="btn btn-primary p-l-40 p-r-40 edit-lang-btn"><spring:message code="list.search.update" text="수정"/></button>
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

        // 입력을 제한 할 특수문자의 정규식
        var replaceId  = /[\{\}\[\]\/?,;:"|\)*~'!^\-_+<>@\#$%&\\\=\(\'\''ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi;

        $(".edit-sys-name").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceId)) {
                    x = x.replace(replaceId, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceId, ""));
        });

        $(document).on("click" ,".fadeDown" ,function(){
            $(".code_panel").slideUp(100);
        });

        $(document).on("click" ,".fadeUp" ,function(){
            $(".code_panel").slideDown(100);
        });

        $(document).on("click" ,".edit-lang-btn" ,function(){

            var sysType = $(".edit-sys-type").val();
            var sysCode = $(".edit-sys-code").val();
            var sysName = $(".edit-sys-name").val();
            var codeName = $(".edit-code-name").val();
            var codeValue = $(".edit-code-value").val();
            var memo = $(".edit-memo").val();


            if (codeName == "" || codeName == null) {
                alert("<spring:message code="list.script.enterthekeyvaluetochange" text="변경할 값을 입력해주세요"/>");
                return;
            } else if (codeValue == "" || codeValue == null) {
                alert("<spring:message code="list.script.enterthekoreanlanguageyouwanttochange" text="변경할 값을 입력해주세요"/>");
                return;
            } /*else if (memo == "" || memo == null) {
                alert("<spring:message code="list.script.enterthekoreanlanguageyouwanttochange" text="변경할 값을 입력해주세요"/>");
                return;
            }*/

            $.ajax({
                type: "GET",
                url: "${path}/api/system/code/update",
                dataType: "json",
                data : {
                    sysCode : sysCode,
                    sysName : sysName,
                    codeName : codeName,
                    codeValue : codeValue,
                    sysType : sysType,
                    memo : memo
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

        $(document).on("click" ,".code-tr" ,function(){
            $(".code_panel").slideDown(300);
            var sysType = $(this).find(".sys-type").text()
            var sysCode = $(this).find(".sys-code").text();
            var sysName = $(this).find(".sys-name").text();
            var codeName = $(this).find(".code-name").text();
            var codeValue = $(this).find(".code-value").text();
            var memo = $(this).find(".memo").text();
            var updateDate = $(this).find(".update-date").text();
            var insertDate = $(this).find(".insert-date").text();

            $(".edit-sys-type").val(sysType);
            $(".edit-sys-code").val(sysCode);
            $(".edit-sys-name").val(sysName);
            $(".edit-code-name").val(codeName);
            $(".edit-code-value").val(codeValue);
            $(".edit-memo").val(memo);
            $(".edit-insert-date").val(insertDate);
            $(".edit-update-date").val(updateDate);
        });
    });
</script>
</body>
</html>
