<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="회원 관리"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>온동네  | <spring:message code="sidemenu.boardmanagement.platformannouncement12" text="회원 관리"/></title>
    </c:if>

</head>
<style>
    .dataTables_wrapper.dt-bootstrap4 .dataTables_filter {
        display: block;
    }
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .buttons-excel:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    .active-on {
        opacity: 1;
    } div.dataTables_wrapper div.dataTables_processing {
          border: 1px solid #eee;
          z-index: 1;
          /* position: absolute;
           top: 264%;
           left: 10%;
           width: 200px;
           !* margin-left: -397px; *!
           !* margin-top: -26px; *!
           text-align: center;
           padding: 1em 0;*/

      }
    .active-off {
        opacity: 0.5;
    }

    input[type="checkbox"]{
        display: none;
    }
    input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
    }
    input[id="check1"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        position: absolute;
        left: 0;
        top:0;
    }
    .btn {
        padding: 2px .45rem;
        font-size: .75rem;
        line-height:  unset;
    }
    table#testTable td, table#testTable th {
        padding: 5px;
        vertical-align: middle;
        border-top: 0px solid #e4e7ea;
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
    <form name="frmSearch" id="frmSearch">
    <!-- begin #content -->
    <div id="content" class="content p-0">
        <!-- begin panel -->
        <div class="panel panel-inverse m-t-1">
            <!-- begin page-header -->
            <div class="col-xs-auto p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right">
                    <li class="breadcrumb-item"><a href="${path}/board/cust/list"><spring:message code="sidemenu.boardmanagement12" text="사용자 관리"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="회원 관리"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.platformannouncement12" text="회원 관리"/></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

            <div class="search-box search-box-inline">
                <div class="inner-search-box">
                    <div class="search-inline-bar">
                        <input type="hidden" name="platformType" value="2">

                        <div class="search-field">
                            <div class="search-label">앱구분</div>
                            <div class="search-control-group">
                                <c:if test="${empty appCode}">
                                    <select id="appCode" name="appCode" class="form-control">
                                        <option value="" selected>전체</option>
                                        <c:forEach var="appCodeList" items="${appVersionList}" varStatus="status">
                                            <option value="${appCodeList.sysCode}" <c:if test="${searchValue.appCode == appCodeList.sysCode}">selected</c:if>>
                                                    ${appCodeList.codeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </c:if>
                                <c:if test="${!empty appCode}">
                                    <input type="text" class="form-control appCode" name="appCode" readonly value="${sessionScope.sessionKey.appCodeName}">
                                    <input type="hidden" class="form-control appCode" name="appCode" readonly value="${appCode}">
                                </c:if>
                            </div>
                        </div>

                        <div class="search-field">
                            <div class="search-label">사용상태</div>
                            <div class="search-control-group">
                                <select class="form-control dataStatus" name="dataStatus">
                                    <option value="OK" <c:if test="${searchValue.dataStatus == 'OK'}">selected</c:if>>정상</option>
                                    <option value="DELETE" <c:if test="${searchValue.dataStatus == 'DELETE'}">selected</c:if>>탈퇴</option>
                                </select>
                            </div>
                        </div>

                        <div class="search-field search-date">
                            <div class="search-label">가입기간</div>
                            <div class="search-control-group">
                                <div class="date-input-wrap">
                                    <input type="text"
                                           class="form-control startDate background-white"
                                           name="startDate"
                                           value="${searchValue.startDate}"
                                           readonly>
                                    <i class="fas fa-calendar-alt"></i>
                                </div>

                                <span class="date-separator">~</span>

                                <div class="date-input-wrap">
                                    <input type="text"
                                           class="form-control endDate background-white"
                                           name="endDate"
                                           value="${searchValue.endDate}"
                                           readonly>
                                    <i class="fas fa-calendar-alt"></i>
                                </div>
                            </div>
                        </div>

                        <div class="search-field search-keyword">
                            <div class="search-label">검색어</div>
                            <div class="search-control-group search-keyword-group">
                                <select class="form-control searchOp" name="keywordType">
                                    <option value="custName" <c:if test="${searchValue.keywordType == 'custName'}">selected</c:if>>이름</option>
                                    <option value="custTel" <c:if test="${searchValue.keywordType == 'custTel'}">selected</c:if>>전화번호</option>
                                </select>
                                <input type="text"
                                       class="form-control width-150"
                                       name="keyword"
                                       value="${searchValue.keyword}"
                                       maxlength="150"
                                       placeholder="검색어 입력">
                            </div>
                        </div>

                        <div class="search-actions">
                            <button type="button"
                                    class="btn btn-search-inline searchClick"
                                    onClick="serarchForm()">
                                <i class="fa fa-search"></i>
                                검색
                            </button>

                            <c:if test="${permission == 2}">
                                <button type="button"
                                        data-toggle="modal"
                                        data-target="#give_coupon_all"
                                        class="btn btn-search-inline ml-1 giveAllbtn"
                                        custno="">
                                    <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="쿠폰일괄지급"/></span>
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="panel-box table-panel-box">
                    <div class="table-scroll-wrap">
                        <table id="testTable" class="table compact-table table-striped" >
                            <thead>
                            <tr class="text-center">
                                <th width="3%"><spring:message code="list.word.no1" text="번호"/></th>
                                <th width="3%"><spring:message code="list.word.no1" text="앱구분"/></th>
                                <th width="5%"><spring:message code="list.detail.title1" text="이름"/></th>
                                <th width="6%"><spring:message code="list.word.contents1" text="휴대폰번호"/></th>
                                <th width="5%"><spring:message code="list.word.status12" text="누적주문횟수"/></th>
                                <th width="3%"><spring:message code="list.word.contents1" text="시/도"/></th>
                                <th width="4%"><spring:message code="list.word.contents1" text="시/군/구"/></th>
                                <th width="5%"><spring:message code="list.word.status12" text="성별"/></th>
                                <th width="8%"><spring:message code="list.word.serviceclassification1" text="로그인ID"/></th>
                                <th width="6%"><spring:message code="list.word.serviceclassification1" text="총판코드"/></th>
                                <th width="6%"><spring:message code="list.word.serviceclassification1" text="마스터가맹점"/></th>
                                <th width="6%"><spring:message code="list.word.serviceclassification1" text="가맹점코드"/></th>
                                <th width=""><spring:message code="list.word.serviceclassification1" text="추천가맹점"/></th>
                                <th width=""><spring:message code="list.word.serviceclassification1" text="추천인(전화번호)"/></th>
                                <th width=""><spring:message code="list.word.serviceclassification1" text="친구수"/></th>
                                <%--<th width="10%"><spring:message code="list.word.status1" text="캐쉬"/></th>
                                <th width="8%"><spring:message code="list.word.status12" text="마일리지"/></th>--%>
                                <th width="8%"><spring:message code="list.word.registrationdate1" text="가입일"/></th>
                                <th width="8%"><spring:message code="list.word.registrationdate1" text="탈퇴일"/></th>
                                <th width="8%"><spring:message code="list.word.modifieddate1" text="비밀번호"/></th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- end panel -->
    </div>
    <!-- end #content -->
    </form>
    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->
</div>

<%--modal add start--%>
<div class="modal fade" id="password_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="passwordManagement.jsp" %>
</div>
<%--<div class="modal fade" id="store_search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/searchStore.jsp" %>
</div>--%>
<div class="modal fade" id="give_coupon_all" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/searchCustList.jsp" %>
</div>

<div class="modal modal_2 fade" id="select_push_template" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="../../search/searchPushTemplate.jsp" %>
</div>
<%--modal add end--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%@include file="../../../common/include_number_only_js.jsp" %>
<%-- Custom JS End--%>
<script>
    let couponAddList = [];
    let searchCustList = [];
    let tablePop = null;
    $(".storeSel").on("click",function(){
        var storeNo = $(this).attr("storeNo");
        var storeName = $(this).attr("storeName");
        $("input[name=storeNo]").val(storeNo);
        $(".storeTxt").val(storeName+" ["+storeNo+"]");
        $(".storeModalCloseBtn").click();
    });
    $('.filterText').keyup(function(event) {
        var val = $(this).val();
        if (val == "") {
            $('.filterUL li').hide();
        } else {
            $('.filterUL li').hide();
            $(".filterUL li:contains('"+val+"')").show();
        }
    });

    $(document).on("click",".btn-pwd",function() {
        let custNo = $(this).attr("custno");
        $("#custNo").val(custNo);
        $("#loginPwd").val('');
    });


    $(() => {
       /* $("#testTable").DataTable({
            language : lang_set, //or lang_eng
        });*/
        let downloadAble = `${downloadAble}`;
        let roleType = `${sessionScope.sessionKey.roleType}`;
        let downloadChk = "1";
        if(roleType != 0){
            if(downloadAble == 1){
                downloadChk = "";
            }
        } else {
            downloadChk = ""
        }
        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/cust/list","A1",downloadChk, true,{
            responsive: false,
            "sScrollX": "100%",
            "sScrollXInner": "100%",
            "bScrollCollapse": true,
            autoWidth : true,
            "fnInitComplete": function(oSettings) {
                $( window ).resize();
            },

            "fnDrawCallback": function(oSettings) {
                $( window ).trigger('resize');
            },
            columns: [
                {data: "listIndex"},
                {data: "appName"},
                {data: "custName"},
                {data: "custTel"},
                {data: "useCount" ,
                    render: function(data){
                        return data + " 회";
                    }},
                {data: "custLocation.addr1"},
                {data: "custLocation.addr2"},
                {data: "gender"},
                {data: "loginId"},
                {data: "extBrCode"},
                {data: "extMasterStCode"},
                {data: "extRecommStCode"},
                {data: "extRecommStName"},
                {data: "recommCustName"},
                {data: "recommCount"},
                {data: "insertDate"},
                {data: "updateDate"},
                {data: "memberType"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {
                    targets: 0,
                    width: '30px'
                },
                {
                    targets: 7,
                    width: '60px',
                    render: function(data){
                        if(data == "M"){
                            return "남";
                        } else if(data == "F"){
                            return "여";
                        } else if(data == "N"){
                            return "알수없음";
                        }
                    }
                },
                {
                    targets: 3,
                    render: function(data){
                        return phoneHyphen(data);
                    }
                },
                {
                    targets: 14,
                    width: '50px',
                    render: function(data){
                        return data + " 명";
                    },
                },
                {
                    targets: [15],
                    render: function(data){
                        return data ? dateFormat(data) : "-";
                    },
                },
                {
                    targets: [16],
                    render: function(data, type, row){
                        if (row.dataStatus === "DELETE") {
                            return data ? dateFormat(data) : "탈퇴";
                        }
                        return "-";
                    },
                },
                {
                    targets: 17,
                    width: '120px',
                    render: function(data){
                        var button;
                        let permission = `${permission}`
                        let roleType = `${sessionScope.sessionKey.roleType}`

                        if(data.type == 0){
                            button =  "<button type='button'   class='btn btn-info btn-pwd' style='width: 115px;cursor: auto;'>"+
                                "<span style='display: flex; align-items: center'>"+
                                "<i class='fa fa-window-close'></i>"+
                                "<span class='m-l-5'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="list.detail.list1" text="비회원"/></span>"+
                                "</span>"+
                                "</button>";
                        } else if(data.type == 1 && permission == 2 && roleType == 0){
                            button =  "<button type='button'  data-toggle='modal' data-target='#password_modal'  class='btn btn-warning btn-pwd' style='width: 115px;cursor: auto;' custNo="+data.custNo+">"+
                                "<span style='display: flex; align-items: center'>"+
                                "<i class='fa fa-lock'></i>"+
                                "<span class='m'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="list.detail.list1" text="비밀번호변경"/></span>"+
                                "</span>"+
                                "</button>";
                        } else if(data.type == 2){
                            button =  "<button type='button'   class='btn btn-info btn-pwd' style='width: 115px;cursor: auto;'>"+
                                "<span style='display: flex; align-items: center'>"+
                                "<i class='fa fa-window-close'></i>"+
                                "<span class=''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="list.detail.list1" text="Apple회원"/></span>"+
                                "</span>"+
                                "</button>";
                        } else if(data.type == 3){
                            button =  "<button type='button'   class='btn btn-info btn-pwd' style='width: 115px;cursor: auto;'>"+
                                "<span style='display: flex; align-items: center'>"+
                                "<i class='fa fa-window-close'></i>"+
                                "<span class=''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="list.detail.list1" text="Kakao회원"/></span>"+
                                "</span>"+
                                "</button>";
                        } else {
                            return "-"
                        }

                        return button;
                    },
                },
            ],
        });



        $("#testTable_filter").text("");
        //$("#testTable_filter").append('<button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onClick=serarchForm() ><i class="fa fa-search grayicon"></i> <spring:message code="merchandise.searchbutton" text="검색"/> </button>');

        dateSetting();
        /*getToday();*/

        $(".searchOp").change(function(e) {
            let option = e.target.value;
            let nameForm = document.getElementById("custName");
            let telForm = document.getElementById("custTel");

            nameForm.value = '';
            telForm.value = '';

            switch (option) {
                case 'custName':
                    nameForm.style.display = 'inline';
                    telForm.style.display = 'none';
                    break;
                case 'custTel':
                    nameForm.style.display = 'none';
                    telForm.style.display = 'inline';
                    break;
            }
        });

        $(document).on("click",".update_pwd_btn",function() {
            let wouldyouliketoupdate = "<spring:message code="list.script.wouldyouliketoupdate1" text="수정하시겠습니까?"/>";
            let update = "<spring:message code="list.script.update1" text="수정"/>";
            let cancel = "<spring:message code="list.script.cancel1" text="취소"/>";
            let updatesussmsg = "<spring:message code="list.script.correctionwassuccessful1" text="수정 되었습니다."/>";
            let editfailed = "<spring:message code="list.script.editfailed1" text="수정에 실패하였습니다."/>";

            let url = "${path}/api/user/cust/updatePwd";
            let _forms = $('.update_pwd_form');
            let req = convertFormToObj(_forms);

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
                            type: "PUT",
                            url,
                            data: JSON.stringify(req),
                            contentType: "application/json",
                            dataType: "json",
                            success: function (data) {
                                if (data.result == 200) {
                                    modalHide($('#password_modal'));
                                    alert(updatesussmsg);
                                } else {
                                    alert(editfailed);
                                    return;
                                }
                            }
                        });
                    }
                })
            }
        });

        //상세
        $("#testTable").on('click', 'tbody td', function() {
            var row = $("#testTable").DataTable().row($(this).parents("tr")).data();
            var colIdx = $(this)[0]._DT_CellIndex.column;

            // 탈퇴일(16), 비밀번호(17) 클릭 시 상세 이동 막기
            if (colIdx === 16 || colIdx === 17) {
                return;
            }

            location.href = "${path}/board/cust/detail?custNo=" + row.custNo;
        });

        $.ajax({
            type: "GET",
            /*url:"http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/list",*/
            /*url:"https://frapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/list",*/
            url:"<spring:eval expression="@environment.getProperty('file.momPosServer.server')" />/v1/coupon-manage/list",
            data: {
                ordPathCd : 1105,
                searchType : "R",
                cpnStatus : "Y",
                periodS : "20200101",
                periodE : getToday(),
                pageNo : 1,
                pageSize : 300
            },
            contentType: "application/json",
            dataType: "json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            },
            success: function (data) {
                const $selectCoupon = $(".selectCoupon");

                $selectCoupon.empty();

                if (!data || data.resCode !== "0000") {
                    renderEmptyCouponOption("쿠폰 목록 조회에 실패했습니다.");
                    return;
                }

                const couponList =
                    data.data && Array.isArray(data.data.infoData)
                        ? data.data.infoData
                        : [];

                const availableCouponList = couponList
                    .filter(function (coupon) {
                        return isAvailableCoupon(coupon);
                    })
                    .filter(function (coupon, index, array) {
                        return array.findIndex(function (item) {
                            return String(item.cpnNo) === String(coupon.cpnNo);
                        }) === index;
                    })
                    .sort(function (a, b) {
                        return String(a.cpnTitle || "").localeCompare(
                            String(b.cpnTitle || ""),
                            "ko"
                        );
                    });

                if (availableCouponList.length === 0) {
                    renderEmptyCouponOption("사용 가능한 쿠폰이 없습니다.");
                    return;
                }

                $selectCoupon.append(
                    $("<option>", {
                        value: "",
                        text: "쿠폰을 선택해주세요.",
                        selected: true,
                        disabled: true
                    })
                );

                availableCouponList.forEach(function (coupon) {
                    let optionText = coupon.cpnTitle;

                 /*   if (coupon.discountAmt) {
                        optionText += " / " + coupon.discountAmt;
                    }

                    if (coupon.usePeriod) {
                        optionText += " / " + coupon.usePeriod;
                    }*/

                    $selectCoupon.append(
                        $("<option>", {
                            value: coupon.cpnNo,
                            text: optionText
                        })
                            .attr("data-cpn-title", coupon.cpnTitle || "")
                            .attr("data-issued-type", coupon.issuedType || "")
                            .attr("data-issued-condition", coupon.issuedCondition || "")
                            .attr("data-issued-date", coupon.issuedDate || "")
                            .attr("data-discount-amt", coupon.discountAmt || "")
                            .attr("data-use-period", coupon.usePeriod || "")
                            .attr("data-status", coupon.dataStatus || "")
                    );
                });
            }
        });



        $(document).on("click",".cpnAllBtn",function(){

            if(couponAddList.length <= 0){
                alert("보낼대상을 최소 1명이상 선택해주세요.");
            } else {
                let cpnNo = $(".selectCoupon").val();
                $.ajax({
                    type: "POST",
                    traditional: true,
                    url: "${path}/api/coupon/give",
                    contentType: "application/json",
                    dataType: "json",
                    data: {
                        cpnNo : Number(cpnNo),
                        ordPathCd : "<spring:eval expression="@environment.getProperty('file.ordPathCd.pickOrder')" />",
                        custNo : [],
                        extCustNo : couponAddList,
                        cpnReason: "관리자 일괄지급"
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                        //xhr.setRequestHeader("Content-type","application/json");
                    },
                    success: function (data) {
                        if (data.resCode == '0000') {
                            alert( couponAddList.length +"명에게 쿠폰이 지급되었습니다.");
                            /* location.reload();*/
                        } else if (data.resCode == '0002') {
                            alert(data.resMsg);
                        } else {
                            alert("쿠폰 일괄지급에 실패하였습니다.");
                            /*location.reload();*/
                        }
                    }
                });
            }

           /* let startDate = $(".custStartDate").val()
            let endDate = $(".custEndDate").val()
            if(getDateDiff(startDate, endDate) > 14) {
                alert("날짜범위는 최대 14일까지 가능합니다.");
                return;
            } else {

            }*/
        });

        $(".searchCustCouponList").on("click", function() {
            renderKeywordPreview();
            if(!tablePop){
                tablePop = $("#searchCustTable").DataTable({
                    language :  {
                        lang_set,
                        processing: "데이터 불러오는 중...",
                        info: " _PAGE_ - _PAGES_ (총 _MAX_ 건)",
                    }, //or lang_eng
                    /*   pagingType: "full_numbers",*/
                    /*   pagingType : "full_numbers",*/
                    lengthMenu : [ [ 20], [ 20] ],
                    responsive: true,
                    processing:true,
                    ordering: true,
                    scrollY: '450px',
                    backgroundColor: "black",
                    serverSide: true,
                    columns: [
                        {
                            data: "custNo",
                            'createdCell': function (td, cellData, rowData, row, col) {
                                $(td).parents("tr").attr("extCustNo", rowData.extCustNo);
                                if (couponAddList.includes(Number(rowData.extCustNo))) {
                                    $(td).parents("tr").addClass('active-off');
                                } else {
                                    $(td).parents("tr").addClass('active-on');
                                }
                            }
                        },
                        {data: "custName"},
                        {data: "custTel", render: function (data) {
                                if (data) {
                                  return  phoneHyphen(data);
                                } else {
                                    return "";
                                }
                            }
                        },
                        {data: "listIndex" ,
                            render: function (data) {
                                if (data) {
                                    return "<i class=\"fas fa-lg fa-fw icon-arrow fa-angle-double-right move-right \"  extCustNo=" + data.extCustNo + " custName=" + data.custName + " custTel=" + data.custTel + "  custNo=" + data.custNo + "></i>";
                                }
                            }
                        }
                    ],
                    columnDefs: [
                        {targets: "_all", className: "text-center"},
                        {targets: 0, className: "width-50"},
                    ],
                    ajax : {
                        url:"${path}/api/cust/list/pop",
                        type: "POST",
                        data: function (res) {

                            var formData = objectifyForm($("#form-coupon-search").serializeArray());
                            var param = formData;


                            param["draw"] = res.draw;
                            param["length"] = res.length;
                            param["start"] = res.start;


                            param["useCount"] = $("input[name=useCount]").val();
                            param["maxMin"] = $("select[name=maxMin]").val();
                            param["keywordPopType"] = $("select[name=keywordPopType]").val();
                            param["keywordPop"] = $("textarea[name=keywordPop]").val();
                            param["custStartDate"] = $("input[name=custStartDate]").val();
                            param["custEndDate"] = $("input[name=custEndDate]").val();
                            return param;
                        },
                        dataSrc: function(res) {
                            var data = res.data || [];

                            const totalCount = res.recordsFiltered || res.recordsTotal || data.length;
                            updateCouponCount(totalCount);

                            // 리스트번호
                            for (let i = 0; i < data.length; i++) {
                                data[i].listIndex = {
                                    custName: data[i].custName,
                                    custTel: data[i].custTel,
                                    extCustNo: data[i].extCustNo,
                                    custNo: data[i].custNo
                                };

                                data[i]["number"] = i;

                                if (data[i]["recommCust"]) {
                                    data[i]["recommCustName"] =
                                        data[i]["recommCust"]["custName"] + "(" + phoneHyphen(data[i]["recommCust"]["custTel"]) + ")";
                                }
                            }

                            return data;
                        },
                        statusCode: {
                            200: (response) => {
                                //console.log(response)
                                // TODO
                            },
                            400: (response) => {
                                //console.log(response)
                                // TODO
                            },
                            500: (response) => {
                                //console.log(response)
                                // TODO
                            }
                        }
                    },
                    layout: {
                        top1: {
                            searchBuilder: {
                                liveSearch: true
                            }
                        }
                    },
                    lengthChange: false,
                    ordering:false,
                    paging: true,
                    searching: false,
                    responsive: true,
                    pagingType: "full_numbers",
                    info:false,
                    dom: '<"top"i>rt<"bottom"flp><"clear">'
                });
            }

            var numCols = tablePop.columns().nodes().length;
            for(var i=0; i<numCols; i++) {tablePop.column(i).search(''); }
            /*  var searchType = $("#searchType").val();
              var searchValue = $("#searchValue").val();*/

            tablePop.column().draw();
        });
    });
    $(document).on("click","#couponAllLeftBtn",function() {
        couponAddList = [];
        $("#cust-select").html("");
        updateCouponCount(0);
        $(".searchCustCouponList").click();
    });

    //쿠폰 일괄지급
    $(document).on("click","#couponAllRightBtn",function() {
        let _forms = $('.form-coupon-search');
        let req = convertFormToObj(_forms);
        $.ajax({
        url: "${path}/api/cust/all",
            type: "POST",
            data: req,
            dataType: "json",
            success: function (data) {
            if (data.resultCode == 200) {
                let custList = data.resultList;
                $("#cust-none-select").html("");
                if(custList.length == 0 || custList == null){

                    $("#cust-none-select").append(
                        "             <tr class=\"p-0\">" +
                        "                <td colspan='4' class=\"text-center\">조회된 정보가 없습니다.</td>" +
                        "             </tr>");
                } else {
                   /* searchCustList =[];*/
                    for (var i = 0; i < custList.length; i++) {
                        if(custList[i].extCustNo){
                            if(!couponAddList.includes(custList[i].extCustNo)){
                                couponAddList.push(custList[i].extCustNo);

                                $("#cust-select").append(
                                    "             <tr class=\"p-0\" extCustNo="+custList[i].extCustNo+" custNo="+custList[i].custNo+" >" +
                                    "                <td class=\"text-center custNo\" style=\"width:50px;\">"+custList[i].custNo+"<i class=\"\"></i></td>" +
                                    "                <td class=\"text-center\" style=\"width:150px;\">"+custList[i].custName+"<i class=\"\"></i></td>" +
                                    "                <td class=\"text-center\">("+  phoneHyphen(custList[i].custTel)+")<i class=\"\"></i></td>" +
                                    "                <td class=\"text-center\" style=\"width:67px;\" ><i class=\"fas fa-lg fa-fw icon-arrow fa fa-solid fa-minus move-left\" extCustNo="+custList[i].extCustNo+" custName="+custList[i].custName+" custTel="+custList[i].custTel+" custNo="+custList[i].custNo+"></i>" +
                                    "                </td>" +
                                    "             </tr>");
                            }
                        }
                    }
                    updateCouponCount();
                    $(".searchCustCouponList").click();
                }
            } else {
                alert("조회에 실패하였습니다.")
                return;
            }
        }
    });


    });

    /*알람발송시 cpnno세팅*/
    $(document).on("click", ".couponAlarmOpenBtn", function (event) {
        const cpnNo = $(".selectCoupon").val();
        const couponTitle = $(".selectCoupon option:selected").text().trim();

        if (!cpnNo) {
            event.preventDefault();
            event.stopImmediatePropagation();

            alert("쿠폰을 선택해주세요.");
            return false;
        }

        if (couponAddList.length <= 0) {
            event.preventDefault();
            event.stopImmediatePropagation();

            alert("보낼 대상을 최소 1명 이상 선택해주세요.");
            return false;
        }

        $(this)
            .attr("data-cpn-no", cpnNo)
            .attr("data-coupon-title", couponTitle);

        $("#select_push_template")
            .data("cpn-no", cpnNo)
            .data("coupon-title", couponTitle);
    });
    //지급결과 알람
    $(document).on("click","#cpnAlarmBtn",function() {
        let custList = [];
        let count = 0;

        $("#cust-select > tr").each(function() {
            var $row = $(this).attr("custNo");
            custList.push($row);
            count++;
        });
        const cpnNo = $(".selectCoupon").val();
        let couponText = $(".selectCoupon option:selected").text();
        let pushTitle = $(".push-title").val();
        let pushContents = $(".push-contents").val();
        if(couponAddList.length <= 0){
            alert("보낼대상을 최소 1명이상 선택해주세요.");
        } else {
            $.ajax({
                type: "POST",
                traditional: true,
                url: "${path}/api/send/message",
                contentType: "application/json",
                dataType: "json",
                data: {
                    cpnNo: Number(cpnNo),
                    custList : custList,
                    couponText: couponText,
                    pushTitle: pushTitle,
                    pushContents: pushContents
,                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authKey", "<spring:eval expression="@environment.getProperty('file.momPosServer.authKey')" />");
                    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                    //xhr.setRequestHeader("Content-type","application/json");
                },
                success: function (data) {
                    if(data.result == "200"){
                        alert( count +"명에게 푸시가 발송되었습니다.");
                        $(".pushModalCloseBtn").click();
                    } else {
                        alert("푸시가 발송에 실패하였습니다.");
                    }
                },
                error: function (data){

                }
            });
        }
    });

    $(document).on("click", ".move-right", function() {
        let extCustNo = $(this).attr("extCustNo");
        let custName = $(this).attr("custName");
        let custTel = $(this).attr("custTel");
        let custNo = $(this).attr("custNo");

        if(!couponAddList.includes(Number(extCustNo))) {
            couponAddList.push(Number(extCustNo));
            updateCouponCount();
            $(this).parents("tr").addClass("active-off")
            $(this).parents("tr").removeClass("active-on")
            $("#cust-select").append(
                "             <tr class=\"p-0\" extCustNo="+extCustNo+" custNo="+custNo+" >" +
                "                <td class=\"text-center custNo\" style=\"width:50px;\">"+custNo+"<i class=\"\"></i></td>" +
                "                <td class=\"text-center\" style=\"width:150px;\">"+custName+"<i class=\"\"></i></td>" +
                "                <td class=\"text-center\">("+ phoneHyphen(custTel)+")<i class=\"\"></i></td>" +
                "                <td style=\"width:67px;\" ><i class=\"fas fa-lg fa-fw icon-arrow fa fa-solid fa-minus move-left\" extCustNo="+extCustNo+" custName="+custName+" custTel="+custTel+" custNo="+custNo+"></i>" +
                "                </td>" +
                "             </tr>");
            //$(this).parents("tr").remove();
        }
    });

    $(document).on("click", ".move-left", function() {
        let extCustNo = $(this).attr("extCustNo");
        $('.active-off').each(function() {
           if($(this).attr("extcustNo") == extCustNo){
               $(this).removeClass("active-off");
               $(this).addClass("active-on");
           }
        });

        if(couponAddList.includes(Number(extCustNo))){
            let filtered = couponAddList.filter((element) => element !== Number(extCustNo));
            couponAddList = filtered;

            updateCouponCount();
            $(this).parents("tr").remove();
        }
    });


    function serarchForm() {
        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) {table.column(i).search(''); }
        /*  var searchType = $("#searchType").val();
          var searchValue = $("#searchValue").val();*/

        table.column().draw();
        /*let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
        if(getDateDiff(startDate, endDate) > 31) {
            alert("날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {

        }*/
    }

    function inputDataCheck(args) {
        if (isNull(args.loginPwd)) {
            return alert_focus("userId", "변경할 비밀번호를 입력해주세요.");
        }
        return true;
    }


    function updateCouponCount(searchCount) {
        if (searchCount !== undefined && searchCount !== null) {
            $("#searchCustTotalCount").text(Number(searchCount).toLocaleString());
        }

        $("#selectedCustTotalCount").text(couponAddList.length.toLocaleString());
    }

    function getKeywordPopList() {
        const value = $(".form-coupon-search [name=keywordPop]").val() || "";

        return value
            .split(/\r\n|\n|\r|,|\t/)
            .map(function(item) {
                return item.trim();
            })
            .filter(function(item) {
                return item !== "";
            });
    }

    function renderKeywordPreview() {
        const keywordList = getKeywordPopList();
        const $list = $(".keyword-preview-list");

        $(".keywordPreviewCount").text(keywordList.length);
        $(".keywordPreviewTotal").text(keywordList.length);

        $list.empty();

        if (keywordList.length === 0) {
            $list.append('<div class="keyword-preview-empty">입력된 검색어가 없습니다.</div>');
            return;
        }

        keywordList.forEach(function(keyword, index) {
            $list.append(
                '<span class="keyword-preview-item">' +
                (index + 1) + '. ' + keyword +
                '</span>'
            );
        });
    }

    $(document).on("input", ".keywordPopTextarea", function() {
        renderKeywordPreview();
    });

    $(document).on("click", ".btn-keyword-preview", function() {
        renderKeywordPreview();
        $(".keyword-preview-panel").slideToggle(120);
    });

    $(document).on("click", ".btn-keyword-preview-close", function() {
        $(".keyword-preview-panel").slideUp(120);
    });

    function getKeywordPreviewList() {
        var rawText = $('.keywordPopTextarea').val() || '';

        return rawText
            .split(/\r?\n/)
            .map(function (item) {
                return $.trim(item);
            })
            .filter(function (item) {
                return item !== '';
            });
    }

    function updateKeywordPreviewCount() {
        var count = getKeywordPreviewList().length;
        $('.keywordPreviewTotal').text(count);
    }

    $(document).on('input', '.keywordPopTextarea', function () {
        updateKeywordPreviewCount();
    });

    $(document).ready(function () {
        updateKeywordPreviewCount();
    });

    /**
     * 현재 지급 가능한 쿠폰인지 확인
     */
    function isAvailableCoupon(coupon) {
        if (!coupon) {
            return false;
        }

        if (
            coupon.cpnNo === null ||
            coupon.cpnNo === undefined ||
            String(coupon.cpnTitle || "").trim() === ""
        ) {
            return false;
        }

        const dataStatus = String(coupon.dataStatus || "").trim();

        // 실제 응답값이 "정상"인 쿠폰만 노출
        if (dataStatus !== "정상") {
            return false;
        }

        return isAvailableUsePeriod(coupon);
    }

    /**
     * 쿠폰 사용기간 유효 여부 확인
     *
     * 지원 형식
     * 1. 발급일로부터 1일
     * 2. 발급일로부터 30일
     * 3. 2026-04-21 ~ 2026-04-30
     */
    function isAvailableUsePeriod(coupon) {
        const usePeriod = String(coupon.usePeriod || "").trim();

        if (!usePeriod) {
            return false;
        }

        const today = getTodayDateOnly();

        /*
         * "발급일로부터 XX일"
         * putDate를 시작일로 계산
         */
        const periodDays = getIssuedPeriodDays(usePeriod);

        if (periodDays !== null) {
            const putDate = parseCouponDate(coupon.putDate);

            if (!putDate) {
                console.warn(
                    "쿠폰 등록일을 해석할 수 없습니다.",
                    coupon.cpnNo,
                    coupon.putDate
                );

                return false;
            }

            const expiredDate = new Date(putDate);

            /*
             * 사용기간 1일이면 등록 당일까지만 유효
             * 사용기간 30일이면 등록일 포함 30일간 유효
             */
            expiredDate.setDate(
                expiredDate.getDate() + periodDays - 1
            );

            return today >= putDate && today <= expiredDate;
        }

        /*
         * "2026-04-21 ~ 2026-04-30"
         */
        const periodRange = parseCouponPeriodRange(usePeriod);

        if (!periodRange) {
            console.warn(
                "해석할 수 없는 쿠폰 사용기간입니다.",
                coupon.cpnNo,
                usePeriod
            );

            return false;
        }

        return (
            today >= periodRange.startDate &&
            today <= periodRange.endDate
        );
    }
    /**
     * "발급일로부터 N일" 형식인지 확인
     */
    function isIssuedDateBasedPeriod(usePeriod) {
        const periodText = String(usePeriod || "")
            .replace(/\s/g, "")
            .trim();

        return /^발급일로부터\d+일$/.test(periodText);
    }

    /**
     * "발급일로부터 XX일"에서 일수 추출
     *
     * 예:
     * 발급일로부터 1일  -> 1
     * 발급일로부터 30일 -> 30
     */
    function getIssuedPeriodDays(usePeriod) {
        const normalized = String(usePeriod || "")
            .replace(/\s/g, "")
            .trim();

        const matched = normalized.match(
            /^발급일로부터(\d+)일$/
        );

        if (!matched) {
            return null;
        }

        const days = Number(matched[1]);

        if (!Number.isInteger(days) || days < 0) {
            return null;
        }

        return days;
    }

    /**
     * 고정 날짜 범위 파싱
     *
     * 지원:
     * 2026-04-21 ~ 2026-04-30
     * 20260421 ~ 20260430
     * 2026.04.21 ~ 2026.04.30
     * 2026/04/21 ~ 2026/04/30
     */
    function parseCouponPeriodRange(usePeriod) {
        const periodText = String(usePeriod || "").trim();

        const dateMatches = periodText.match(
            /\d{4}[-./]?\d{2}[-./]?\d{2}/g
        );

        if (!dateMatches || dateMatches.length < 2) {
            return null;
        }

        const startDate = parseCouponDate(dateMatches[0]);
        const endDate = parseCouponDate(dateMatches[1]);

        if (!startDate || !endDate) {
            return null;
        }

        if (startDate > endDate) {
            return null;
        }

        return {
            startDate: startDate,
            endDate: endDate
        };
    }

    /**
     * 날짜 문자열을 시간 없는 Date 객체로 변환
     *
     * 지원:
     * 2026-05-22
     * 20260522
     * 2026.05.22
     * 2026/05/22
     */
    function parseCouponDate(dateValue) {
        if (!dateValue) {
            return null;
        }

        const normalized = String(dateValue)
            .replace(/\D/g, "");

        if (normalized.length !== 8) {
            return null;
        }

        const year = Number(normalized.substring(0, 4));
        const month = Number(normalized.substring(4, 6));
        const day = Number(normalized.substring(6, 8));

        const date = new Date(
            year,
            month - 1,
            day
        );

        // 2026-02-31 같은 잘못된 날짜 방지
        if (
            date.getFullYear() !== year ||
            date.getMonth() !== month - 1 ||
            date.getDate() !== day
        ) {
            return null;
        }

        return date;
    }

    /**
     * 오늘 날짜를 00:00:00 기준으로 반환
     */
    function getTodayDateOnly() {
        const today = new Date();

        return new Date(
            today.getFullYear(),
            today.getMonth(),
            today.getDate()
        );
    }

    /**
     * 오늘 날짜를 00:00:00 기준으로 반환
     */
    function getTodayDateOnly() {
        const today = new Date();

        return new Date(
            today.getFullYear(),
            today.getMonth(),
            today.getDate()
        );
    }

    /**
     * 사용 가능한 쿠폰이 없을 때 option 표시
     */
    function renderEmptyCouponOption(message) {
        $(".selectCoupon")
            .empty()
            .append(
                $("<option>", {
                    value: "",
                    text: message,
                    selected: true,
                    disabled: true
                })
            );
    }
</script>
</body>
</html>
