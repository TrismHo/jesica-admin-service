<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="language.languagesetting1" text="시스템 설정"/><%--<spring:message code="merchandise.title" text="default text"/>--%><%--상품관리--%></title>
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
                                    <th style="width: 3%;"></th>
                                    <th style="width: 20%;"><spring:message code="language.key1" text="장소번호"/></th>
                                    <th style="width: 20%;"><spring:message code="language.value.ko1" text="설정값"/></th>
                                    <th style="width: 30%;"><spring:message code="language.value.kh1" text="메모"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="등록일"/></th>
                                    <th style="width: 15%;"><spring:message code="language.value.en1" text="수정일"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${tbServiceProp}" varStatus="status">
                                    <tr class="language-tr"">
                                        <td class="bg-light" style="background-color:yellow; ">${status.count}</td>
                                        <td class="with-btn">
                                            <div class="btn btn-sm btn-social btn-adn text-left letter-spacing-01 lang-prop-name">${item.propName}</div>
                                        </td>
                                        <td class="lang-prop-value"><code>${item.propValue}</code></td>
                                        <td class="lang-memo" style="text-align: center;">${item.memo}</td>
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
        <div class="custom-row language_insert_panel">
                <div class="vertical-box with-grid inbox bg-light ">
                    <div class="vertical-box-column">
                        <div class="vertical-box">
                            <div class="nav-title p-5 p-l-15 border-bottom">
                                <b class="mr-3"><spring:message code="system.languagename1" text="장소번호"/> :</b>
                                <input type="text" class="form-control edit-lang-prop-name w-50 btn btn-sm btn-social btn-adn text-left letter-spacing-01 edit-lang-prop-name" placeholder="<spring:message code="language.languagename1" text="장소번호"/>" readonly>
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
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col- col-form-label"><spring:message code="language.keyvalue1" text="설정값"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " data-color="rgb(0, 0, 0)" data-color-format="rgb" id="colorpicker-append" data-colorpicker-id="2">
                                                                <input type="text" class="form-control edit-lang-prop-value " placeholder="<spring:message code="language.keyvalue1" text="설정값"/>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-sm-3 col-form-label"><spring:message code="language.korean1" text="메모"/></label>
                                                        <div class="col-xl-9 col-lg-9 col-sm-9 p-10">
                                                            <div class="input-group " data-color="rgb(0, 0, 0)" data-color-format="rgb" id="colorpicker-append" data-colorpicker-id="2">
                                                                <input type="text" class="form-control edit-lang-memo" placeholder="<spring:message code="language.korean1" text="메모"/>" >
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

        $(".edit-lang-prop-value").on("focusout", function() {
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
            $(".language_insert_panel").slideUp(100);
        });

        $(document).on("click" ,".fadeUp" ,function(){
            $(".language_insert_panel").slideDown(100);
        });

        $(document).on("click" ,".edit-lang-btn" ,function(){

            var tslId = $(".edit-lang-id").val();
            var propName = $(".edit-lang-prop-name").val();
            var propValue = $(".edit-lang-prop-value").val();
            var memo = $(".edit-lang-memo").val();
            var langKh = $(".edit-lang-insert-date").val();


            if (propValue == "" || propValue == null) {
                alert("<spring:message code="list.script.enterthekeyvaluetochange" text="변경할 값을 입력해주세요"/>");
                return;
            } else if (memo == "" || memo == null) {
                alert("<spring:message code="list.script.enterthekoreanlanguageyouwanttochange" text="변경할 메모를 입력해주세요"/>");
                return;
            }

            $.ajax({
                type: "GET",
                url: "${path}/api/systemprop/update",
                dataType: "json",
                data : {
                    propName : propName,
                    propValue : propValue,
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

        $(document).on("click" ,".language-tr" ,function(){
            $(".language_insert_panel").slideDown(300);
            var langName = $(this).find(".lang-prop-name").text()
            var langKey = $(this).find(".lang-prop-value").text();
            var updateDate = $(this).find(".lang-update-date").text();
            var memo = $(this).find(".lang-memo").text();
            var insertDate = $(this).find(".lang-insert-date").text();

            $(".edit-lang-prop-name").val(langName);
            $(".edit-lang-prop-value").val(langKey);
            $(".edit-lang-memo").val(memo);
            $(".edit-lang-insert-date").val(insertDate);
            $(".edit-lang-update-date").val(updateDate);
        });
    });
</script>
</body>
</html>
