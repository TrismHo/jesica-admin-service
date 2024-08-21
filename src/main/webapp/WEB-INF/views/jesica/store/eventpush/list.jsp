<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | <spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 발송내역"/></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Pick-Order | <spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 발송내역"/></title>
    </c:if>
</head>
<style>
    .buttons-excel {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    div.dataTables_wrapper div.dataTables_processing {
        position: absolute;
        z-index: 2;
        /* top: 264%; */
        margin-top: 100px;
        /* left: 10%; */
        /* width: 200px; */
        /* margin-left: -397px; */
        /* margin-top: -26px; */
        text-align: center;
        padding: 2em 0;
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
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="sidemenu.boardmanagement" text="가맹점"/></a></li>
                    <li class="breadcrumb-item active"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 발송내역"/></li>
                </ol>
                <h3 class="rix-title"><spring:message code="sidemenu.boardmanagement.eventnotice" text="이벤트 발송내역"/><%--<spring:message code="side.main2.sub5" text="default text"/>--%></h3>
            </div>
            <!-- end page-header -->
            <!-- begin row -->

                <div class="search-box">
                    <div class="inner-search-box p-15">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 ">
                                <form name="frmSearch" id="frmSearch">
                                <table class="table table-condensed table-bordered">
                                        <tbody>
                                        <tr >
                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="이벤트 배달구분"/></strong></td>
                                            <td >
                                                <label>
                                                    <select class="form-control param1" name="param1">
                                                        <option value="" <c:if test="${searchValue.param1 == ''  || searchValue.param1 == null}">selected</c:if>><spring:message code="list.search.all1" text="전체"/></option>
                                                        <option value="1" <c:if test="${searchValue.param1 == '1'}">selected</c:if>><spring:message code="list.search.all1" text="0원배달"/></option>
                                                        <option value="2" <c:if test="${searchValue.param1 == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="0순위배달"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.stateofuse" text="이벤트 주문구분"/></strong></td>
                                            <td>
                                                <div class="row">
                                                </div>
                                                <label>
                                                    <select class="form-control evOrdType" name="evOrdType">
                                                        <option value="" <c:if test="${searchValue.evOrdType == ''  || searchValue.evOrdType == null}">selected</c:if>><spring:message code="list.search.all" text="전체"/></option>
                                                        <option value="1" <c:if test="${searchValue.evOrdType == '1'}">selected</c:if>><spring:message code="list.search.normal1" text="배달"/></option>
                                                        <option value="2" <c:if test="${searchValue.evOrdType == '2'}">selected</c:if>><spring:message code="list.search.stop1" text="포장"/></option>
                                                        <option value="3" <c:if test="${searchValue.evOrdType == '3'}">selected</c:if>><spring:message code="list.search.stop1" text="대기"/></option>
                                                        <option value="4" <c:if test="${searchValue.evOrdType == '4'}">selected</c:if>><spring:message code="list.search.stop1" text="예약"/></option>
                                                        <option value="5" <c:if test="${searchValue.evOrdType == '5'}">selected</c:if>><spring:message code="list.search.stop1" text="테이블"/></option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bg-light"><strong><spring:message code="list.search.registrationperiod" text="등록기간"/><%--등록기간--%></strong></td>
                                            <td>
                                                <label>
                                                    <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                </label>
                                                <label>
                                                    <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                </label>
                                            </td>
                                            <td class="bg-light"><strong><spring:message code="list.search.searchword" text="검색어"/><%--검색어 입력--%></strong></td>
                                            <td>
                                                <label>
                                                    <select class="form-control">
                                                        <%--<option>선택&lt;%&ndash;<spring:message code="merchandise.search9.option1" text="default text"/>&ndash;%&gt;&lt;%&ndash;상품명&ndash;%&gt;</option>--%>
                                                        <option><spring:message code="list.search.title" text="제목"/><%--<spring:message code="merchandise.search9.option2" text="default text"/>--%><%--바코드--%></option>
                                                        <%--<option>내용&lt;%&ndash;<spring:message code="merchandise.search9.option2" text="default text"/>&ndash;%&gt;&lt;%&ndash;바코드&ndash;%&gt;</option>--%>
                                                    </select>
                                                    <input type="text" class="form-control width-150 evTitle" name="evTitle" value="" maxlength="150">
                                                </label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="col-xl-12 col-md-12 m-t-10">
                                <div class="">
                                    <%--<button type="button" data-toggle="modal" data-target="#add_modal" class="insert_btn btn btn-primary float-left m-b-10">
                                        <span class="fa fa-plus"><spring:message code="list.word.eventregistration" text="이벤트 등록"/>&lt;%&ndash;<spring:message code="merchandise.registerbutton" text="default text"/>&ndash;%&gt;</span>
                                    </button>--%>
                                        <button type="button" class="btn-box-r bgGray float-right line-height-25 width-100 p-5 searchClick" onclick="searchForm()"><i class="fa fa-search grayicon"></i> 검색 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="panel-body">
                <table id="testTable" class="listTable display table table-bordered w-100 table-striped">
                    <thead>
                    <tr class="text-center">
                        <th width="5%"><spring:message code="list.word.no" text="번호"/></th>
                        <th><spring:message code="list.detail.title1" text="일련번호"/></th>
                        <th ><spring:message code="list.word.status" text="이벤트 일련번호"/></th>
                        <th ><spring:message code="list.word.contents1" text="그룹코드"/></th>
                        <th ><spring:message code="list.word.status1" text="그룹명"/></th>
                        <th ><spring:message code="list.word.status1" text="발송대상"/></th>
                        <th ><spring:message code="list.word.status1" text="발송대상 주문건수"/></th>
                        <th ><spring:message code="list.word.status1" text="발송건수"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 시작일"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 종료일"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 제목"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 할인"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 할인금액"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 할인금액 최대"/></th>
                        <th ><spring:message code="list.word.status1" text="이벤트 주문구분"/></th>
                        <th ><spring:message code="list.word.registrationdate1" text="이벤트 배달구분"/></th>
                        <th ><spring:message code="list.word.serviceclassification1" text="입력일시"/></th>
                    </tr>
                    </thead>
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

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>


<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<%--<%@include file="../../../common/include_datatables.jsp" %>--%>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<script>
    var table;
    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            }
            else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    var newExportAction = function (e, dt, button, config) {
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;

        dt.one('preXhr', function (e, s, data) {
            // Just this once, load all data from the server...
            data.start = 0;
            data.length = 2147483647;

            dt.one('preDraw', function (e, settings) {
                // Call the original action function
                oldExportAction(self, e, dt, button, config);

                dt.one('preXhr', function (e, s, data) {
                    // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                    // Set the property to what it was before exporting.
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });

                // Reload the grid with the original page. Otherwise,
                // API functions like table.cell(this) don't work properly.
                setTimeout(dt.ajax.reload, 0);

                // Prevent rendering of the full data to the DOM
                return false;
            });
        });

        // Requery the server with the new one-time export settings
        dt.ajax.reload();
    };

    $(() => {
        dateSetting(7);
        //상세
        $("#testTable").on('click','tbody td', function() {
            var row = $("#testTable").DataTable().row($(this).parents("tr")).data();
            if($(this)[0]._DT_CellIndex.column != 17){
                location.href = "${path}/store/eventpush/detail?logNo=" + row.logNo;
            }
        });


        let allChkStatus ="${searchValue.ordType}";

        if(allChkStatus == "" )  {
            $("#ex_chk_all_status").click();
        }

        $("#ex_chk_all_status").click(function () {
            $(".ordType").prop('checked', this.checked);
        });

        table = $('#testTable').ajaxDataTable("frmSearch", "${path}/api/eventpush/list", "A2","2",{

            columns : [
                {data: "listIndex"},
                {data: "logNo"},
                {data: "evntSeqNo"},
                {data: "grCode"},
                {data: "grName"},
                {data: "param1"},
                {data: "param2"},
                {data: "sendCnt"},
                {data: "evStartDate"},
                {data: "evEndDate"},
                {data: "evTitle"},
                {data: "evType"},
                {data: "evPrice"},
                {data: "evPriceMax"},
                {data: "evOrdType"},
                {data: "evDvryType"},
                {data: "insertDate"}
            ],
            columnDefs: [
                {targets: "_all", className: "text-center"},
                {
                    targets: 5,
                    render: function(data){
                        if(data) {
                            if(data == 1) {
                                return "내가게 픽한회원";
                            } else if(data == 2) {
                                return "내가게 주문회원";
                            } else if(data == 3) {
                                return "우리동네 픽한회원";
                            } else {
                                return "";
                            }
                        } else {
                            return "";
                        }
                    }
                },
                {
                    targets: [6,7],
                    render:function(data){
                        return countString(data, "건");
                    }
                },
                {
                    targets: [8,9,16],
                    render: function(data){
                        return dateFormat(data);
                    },
                },
                {
                    targets: 11,
                    render: function(data){
                        if(data) {
                            if(data == 1) {
                                return "정액";
                            } else if(data == 2) {
                                return "정률";
                            } else if(data == 3) {
                                return "횟수제한정액";
                            } else if(data == 4) {
                                return "횟수제한정률";
                            } else {
                                return "";
                            }
                        } else {
                            return "";
                        }
                    },
                },
                {
                    targets: [12,13],
                    render: $.fn.dataTable.render.number(',')
                },

                {
                    targets: 11,
                    render: function(data){
                        if(data) {
                            if(data == 1) {
                                return "정액";
                            } else if(data == 2) {
                                return "정률";
                            } else if(data == 3) {
                                return "횟수제한정액";
                            } else if(data == 4) {
                                return "횟수제한정률";
                            } else {
                                return "";
                            }
                        } else {
                            return "";
                        }
                    },
                },
                {
                    targets: 14,
                    render: function(data){
                        if(data) {
                            if(data == 1) {
                                return "배달";
                            } else if(data == 2) {
                                return "포장";
                            } else if(data == 3) {
                                return "대기";
                            } else if(data == 4) {
                                return "예약";
                            } else if(data == 5) {
                                return "테이블";
                            } else {
                                return "";
                            }
                        } else {
                            return "";
                        }
                    },
                },
                {
                    targets: 15,
                    render: function(data){
                        if(data) {
                            if(data == 1) {
                                return "0원배달";
                            } else if(data == 2) {
                                return "0순위배달";
                            } else {
                                return "";
                            }
                        } else {
                            return "";
                        }
                    },
                },
            ],
        });


        $(".insert_btn").click(function() {
            location.href = '${path}/store/event/insert';
        });

    });


    function searchForm() {
        let startDate = $(".startDate").val()
        let endDate = $(".endDate").val()
       /* if(getDateDiff(startDate, endDate) > 31) {
            alert("날짜범위는 최대 31일까지 가능합니다.");
            return;
        } else {

        }*/

        var numCols = table.columns().nodes().length;

        for(var i=0; i<numCols; i++) {table.column(i).search(''); }
        var searchType = $("#searchType").val();
       /*   var searchValue = $("#searchValue").val();*/
        table.column().draw();
    }
</script>
</body>
</html>
