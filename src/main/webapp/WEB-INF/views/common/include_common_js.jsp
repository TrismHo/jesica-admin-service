<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- ================== BEGIN BASE JS ================== -->
<script src="${path}/assets/js/app.min.js"></script>
<script src="${path}/assets/js/theme/transparent.min.js"></script>
<script src="${path}/assets/js/theme/default.min.js"></script>
<!-- ================== END BASE JS ================== -->
<script src="${path}/js/AjaxFunc.js"></script>
<script src="${path}/js/CustomUtils.js"></script>
<script src="${path}/js/mustache.js"></script>
<script src="${path}/js/colResizable-1.6.js"></script>
<!--Begin bootstrap, jquery, datatables-->
<script src="${path}/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
<%--<script src="${path}/js/dataTables.bootstrap4.min.js"></script>--%>
<script src="${path}/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${path}/assets/plugins/bootstrap-select/dist/js/bootstrap-select.js"></script>
<script src="${path}/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script src="${path}/assets/plugins/moment/min/moment.min.js"></script>
<script src="${path}/assets/plugins/tag-it/js/tag-it.min.js"></script>
<script src="${path}/assets/plugins/datetimepicker-master/jquery.datetimepicker.js"></script>
<script src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>
<!--End bootstrap, jquery, datatables-->

<%--<script src="${path}/assets/plugins/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>--%>
<script src="${path}/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${path}/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${path}/assets/plugins/jquery.maskedinput/src/jquery.maskedinput.js"></script>
<script src="${path}/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${path}/assets/plugins/apexcharts/dist/apexcharts.min.js"></script>

<script src="${path}/assets/plugins/flot/jquery.flot.js"></script>
<script src="${path}/assets/plugins/flot/jquery.flot.resize.js"></script>
<%--<script src="${path}/assets/js/demo/dashboard.js"></script>--%>


<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/ckeditor/ckeditor.js"></script>
<script src="${path}/assets/plugins/bootstrap3-wysihtml5-bower/dist/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${path}/assets/js/demo/form-wysiwyg.demo.js"></script>

<script src="${path}/assets/plugins/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/plugins/jszip/dist/jszip.min.js"></script>
<script src="${path}/assets/plugins/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${path}/assets/plugins/datatables.net-buttons/js/buttons.print.min.js"></script>

<!-- ================== END PAGE LEVEL JS ================== -->
<%--<script src="${path}/assets/demo/lang.js"></script>--%>
<!-- 로딩바 -->
<div class="modal fade" id="loadMe" tabindex="-1" role="dialog" aria-labelledby="loadMeLabel">
    <div class="modal-dialog modal-sm" role="document">
        <%--<div class="modal-content">
        <div class="modal-body text-center">
            <div class="loader" data-progress-text="100%" data-progress="99"></div>
            <div clas="loader-txt" >
            <p>Check out this slick bootstrap spinner modal. <br><br><small>We are addicted to Bootstrap... #love</small></p>
            </div>
        </div>
        </div>--%>
    </div>
</div>


<%--loading --%>
<script>
    /*$('#content').css('height', $('#sidebar .slimScrollDiv').height() + 'px');

    let loading = {};
    let ajaxLoadingImg = $('<img alt="loading" id="ajaxLoadingImg" src="${path}/img/ajax-loader.gif">')
        .appendTo(document.body).hide();
    //ajax loading mask
    let ajaxBackgroundMask = $('<div id="mask"></div>').appendTo(document.body);

    loading.show = function() {
        $("#loadMe").modal({
            backdrop: "static", //remove ability to close modal with click
            keyboard: false, //remove option to close with keyboard
            show: true //Display loader!
        });
    };
    loading.hide = function() {
        $("#loadMe").modal("hide");
    };
    loading.show();

    Pace.on('hide', function() {
        loading.hide();
        //ajax loading image
        ajax_loader(ajaxLoadingImg, ajaxBackgroundMask);
     /!*   Pace.start = {
            ajax: false,
            restartOnRequestAfter: true
        }*!/
    });




    <%--ajax load--%>
    function ajax_loader(_loadingImg, _mask) {
        $(window)
            .ajaxStart(function() {
                _loadingImg.show(); //ajax실행시 loading bar show
                wrapWindowByMask(_mask);
            })
            .ajaxStop(function(){
                _loadingImg.hide(); //ajax loading bar hide
                _mask.hide();
            });
    }

    function wrapWindowByMask(_mask) {
        //screen max width and height
        let maskHeight = $(document).height();
        let maskWidth = $(window).width();

        //마스크를 가득 채움
        _mask.css({'width':maskWidth,'height':maskHeight});
        //불투명 80%
        _mask.fadeTo("slow",0.6);
    }*/
</script>
<%-- end loading--%>


<%--ajax loading start--%>

<%-- ajax loadin end--%>
<script>
    let lang_eng = {
        "sDecimal" : "",
        "sEmptyTable" : "No data available in table",
        "sInfo" : "Showing _START_ to _END_ of _TOTAL_ entries",
        "infoEmpty" : "Showing 0 to 0 of 0 entries",
        "infoFiltered" : "(filtered from _MAX_ total entries)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "Show _MENU_ entries",
        "loadingRecords" : "Loading...",
        "processing" : "Processing...",
        "search" : "Search : ",
        "zeroRecords" : "No matching records found",
        "paginate" : {
            "first" : "First",
            "last" : "Last",
            "next" : "Next",
            "previous" : "Previous"
        },
        "aria" : {
            "sortAscending" : " :  activate to sort column ascending",
            "sortDescending" : " :  activate to sort column descending"
        }
    };

    // Korean
    let lang_kor = {
        "decimal" : "",
        "sEmptyTable" : "데이터가 없습니다.",
        "sInfo" : "_START_ - _END_ (총 _TOTAL_ 명)",
        "infoEmpty" : "0명",
        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };

    let lang_set = "<spring:message code="language.langset" text="Lang_kor"/>";
    if(lang_set == "Lang_kor") {
        lang_set = lang_kor;
    } else if(lang_set == "Lang_eng"){
        lang_set = lang_eng;
    } else if(lang_set == "Lang_kh"){
        lang_set = lang_eng;
    }

    // let _csrf_header = $('meta[name="_csrf_header"]').attr("content");
    // let _csrf_token = $('meta[name="_csrf"]').attr("content");
    ajaxSetup();

    let langParam = '${pageContext.response.locale}';

    if(langParam == 'ko') {
        $("#ko").show();
        $("#en").hide();
        $("#kh").hide();
    } else if(langParam == 'en') {
        $("#ko").hide();
        $("#en").show();
        $("#kh").hide();
    } else if(langParam == 'kh') {
        $("#ko").hide();
        $("#en").hide();
        $("#kh").show();
    }

    // head태그의 title에서 메뉴명을 가져와 active시킨다
    let headTitle = $('head title').html().split('|')[1].trim();
    if (headTitle !== null || headTitle !== undefined || headTitle !== '') {
        $('.has-sub a').each(function () {
            if ($(this).find('span').html() === headTitle) {
                $(this).closest('.has-sub').addClass('active');
                $(this).closest('li').addClass('active');
            } else if ($(this).html().trim() === headTitle) {
                $(this).closest('.has-sub').addClass('active');
                $(this).closest('li').addClass('active');
            }
        });
    }

    function ajaxSetup() {
        $.ajaxSetup({
            beforeSend: function (xhr) {
                xhr.setRequestHeader("AJAX", true);
                //for csrf
                // xhr.setRequestHeader(_csrf_header, _csrf_token);
            },
            error: function (xhr, status, err) {
                if (xhr.status === 401 || xhr.status === 403) {
                    swal({
                        title: "인증에 실패 했습니다. 로그인 페이지로 이동합니다.",
                        icon: 'error'
                    }).then(function (isConfirm) {
                        if(isConfirm) {
                            location.href = "/${path}/login";
                        }
                    });
                }
            }
        });
    }

    function appendSpeciesOption(menu) {
        $.ajax({
            type: "POST",
            url: "/baseinfo/species",
            dataType: "json",
            success: function(data) {
                if(data.length > 0) {
                    for(let i = 0; i < data.length; i++) {
                        menu.append("<option value='" + data[i].bsId + "'>" + data[i].bsName + "</option>");
                    }
                }
            }
        });
    }

    function executeMultipartAjax(url, method, _formData, _modal) {

        AjaxFunction.executeAjaxMultipartCallback(url, method, _formData,
            function (_success) {
                console.log("ajax _success::{}", _success);

                if (_success.status === 200) {
                    swal({
                        title: _success.message,
                        icon: 'success'
                    });
                    modalHide(_modal);
                    dataTablesReload();
                } else {
                    swal({
                        title: _success.message,
                        icon: 'success'
                    });
                }
            }, function (xhr) {
                let result = JSON.parse(xhr.responseText);
                // console.log("result fail ajax ", result);
                if (result.errors === undefined || result.errors === null || result.errors.length <= 0) {
                    swal({
                        title: result.message,
                        icon: 'error'
                    });
                } else {
                    swal({
                        title: result.errors[0].reason,
                        icon: 'error'
                    });
                }
            });
    }

    function executeAjax(url, method, data, _table, _modal) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: "application/json"
        })
            .done(function (result) {
                if (result.result == "200") {
                    if(result.message != null) {
                        swal({
                            title: result.message,
                            icon: 'success'
                        });
                    }
                    if(_modal != null) modalHide(_modal);
                    if(_table != null) tableReload(_table);
                } else {
                    if(result.message != null) {
                        swal({
                            title: result.message,
                            icon: 'warning'
                        });
                    }
                    //let table = $('#dataTable').DataTable();
                    //if(table != null) table.ajax.reload();
                    //if(_modal != null) modalHide(_modal);
                }
            })
            .fail(function (xhr) {
                let result = JSON.parse(xhr.responseText);
                // console.log("result::{}", result);
                if (result.errors === undefined || result.errors === null || result.errors.length <= 0) {
                    swal({
                        title: result.message,
                        icon: 'error'
                    });
                } else {
                    swal({
                        title: result.errors[0].reason,
                        icon: 'error'
                    });
                }
            });
    }

    function executeAjaxMoveLocation(url, method, data, hrefPage) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: "application/json"
        })
            .done(function (result) {
                if (result.result == "200") {
                    if(result.message != null) {
                        swal({
                            title: result.message,
                            icon: 'success'
                        }).then((confirm) => {
                            if(confirm) {
                                location.href = hrefPage;
                            } else {
                                location.href = hrefPage;
                            }
                        });
                    }
                } else {
                    if(result.message != null) {
                        swal({
                            title: result.message,
                            icon: 'warning'
                        });
                    }
                    //let table = $('#dataTable').DataTable();
                    //if(table != null) table.ajax.reload();
                    //if(_modal != null) modalHide(_modal);
                }
            })
            .fail(function (xhr) {
                let result = JSON.parse(xhr.responseText);
                // console.log("result::{}", result);
                if (result.errors === undefined || result.errors === null || result.errors.length <= 0) {
                    swal({
                        title: result.message,
                        icon: 'error'
                    });
                } else {
                    swal({
                        title: result.errors[0].reason,
                        icon: 'error'
                    });
                }
            });
    }

    function AjaxDefaultFunction(url, method, reqParam, _modal) {
        //ajaxSetup();
        let promise = AjaxFunction.execute(url, method, JSON.stringify(reqParam));
        promise.done(ajaxDefaultResultSuccess);
        promise.fail(ajaxDefaultResultFail);

        function ajaxDefaultResultSuccess(result) {
            // console.log("success result::{}", result);
            if (result.status === 200) {
                alert(result.message);
                modalHide(_modal);
                dataTablesReload();
            } else {
                alert(result.message);
            }
        }
    }

    function ajaxDefaultResultFail(xhr, ajaxOptions, thrownError) {
        // console.log(xhr);
        // console.log(thrownError);
        let result = JSON.parse(xhr.responseText);

        //console.log("fail result::{}", result);

        if(result.errors === undefined || result.errors === null || result.errors.length <= 0) {
            swal({
                title: result.message,
                icon: 'error'
            });
        } else {
            swal({
                title: result.errors[0].reason,
                icon: 'error'
            });
        }


   /*     if(result.errors === undefined || result.errors === null || result.errors.length <= 0) {
            alert(result.message);
        } else {
            alert(result.errors[0].reason);
        }*/
    }

    function dataSrcFunction(res, type) {
        var data= res.data;
        if(type == "A2"){
            // 리스트번호
            for (let i = 0; i < data.length; i++) {
                data[i].listIndex = i + 1
                data[i]["number"] = i;
            }
        }  else if(type == "A1"){
        var a1= res.a1;
        var a2= res.a2;

        for (let i = 0; i < data.length; i++) {
            data[i].listIndex = i + 1;
            data[i]["number"] = i;

            // 기본값: 일반회원
            data[i]["memberType"] = { type: 1, custNo: data[i].custNo };

            // snsList 기준으로 snsType 판별
            let snsType = null;
            if (data[i]["snsList"] && data[i]["snsList"].length > 0) {
                for (let s = 0; s < data[i]["snsList"].length; s++) {
                    const sns = data[i]["snsList"][s];

                    if (sns && sns["snsType"] == 3) {
                        snsType = 3;   // Apple 우선
                        break;
                    } else if (sns && sns["snsType"] == 2) {
                        snsType = 2;   // Kakao
                    }
                }
            }

            if (snsType == 3) {
                // Apple회원
                data[i]["memberType"] = { type: 2 };
            } else if (snsType == 2) {
                // Kakao회원
                data[i]["memberType"] = { type: 3 };
            } else {
                // 그 외는 일반회원
                data[i]["memberType"] = { type: 1, custNo: data[i].custNo };
            }

            if(data[i]["recommCust"]){
                data[i]["recommCustName"] =
                    data[i]["recommCust"]["custName"] + "(" + phoneHyphen(data[i]["recommCust"]["custTel"]) + ")";
            }

            if(data[i]["custLocation"]) {
                for(var j = 0; j < a1.length ; j++) {
                    if(data[i]["custLocation"]["addr1"] == a1[j].sysCode) {
                        data[i]["custLocation"]["addr1"] = a1[j].codeName;
                    }
                }
                for(var h = 0; h < a2.length ; h++) {
                    if(data[i]["custLocation"]["addr2"] == a2[h].sysCode) {
                        data[i]["custLocation"]["addr2"] = a2[h].codeName;
                    }
                }
            } else {
                data[i]["custLocation"] = {addr1 : "", addr2: ""};
            }
         }
        }else if(type == "A3"){
            for (let i = 0; i < data.length; i++) {
                data[i].listIndex = i + 1
                data[i]["number"] = i;
                if(data[i].totalRegistMax && data[i].mannaCouponRegist) {
                    if(Number(data[i].totalRegistMax) - Number(data[i].mannaCouponRegist.length) < 0){
                        data[i]["useAbleCnt"] = Number("0")
                    } else {
                        data[i]["useAbleCnt"] = Number(data[i].totalRegistMax) - Number(data[i].mannaCouponRegist.length);
                    }
                } else if (data[i].totalRegistMax && !data[i].mannaCouponRegist){
                    data[i]["useAbleCnt"] = Number(data[i].totalRegistMax);
                } else {
                    data[i]["useAbleCnt"] = 0;
                }
                data[i]["cpnCodePublishNo"] = {cpnCode : data[i]["cpnCode"] , publishNo : data[i]["publishNo"]};

            }
        } else if(type == "A4"){
            for (let i = 0; i < data.length; i++) {
                data[i].listIndex = i + 1
                data[i]["number"] = i;
                data[i]["custName"] = data[i].cust.custName
            }
        } else if(type == "A5"){
            for (let i = 0; i < data.length; i++) {
                data[i].listIndex = i + 1
                data[i]["number"] = i;
                data[i]["startEnd"] = dateFormatYYYYMMDD(data[i]["startDate"]) +" ~ "+dateFormatYYYYMMDD(data[i]["endDate"]);
            }
        } else if(type == "A6"){
            for (let i = 0; i < data.length; i++) {
                data[i].listIndex = i + 1
                data[i]["number"] = i;
                if($(".dayType").val() == "1"){
                    data[i]["yyyymmdd"] = dateFormatYYYYMMDD(data[i]["start"]) +" ~ "+dateFormatYYYYMMDD(data[i]["end"]);
                }
            }
        } else if(type == "A7"){
            for (let i = 0; i < data.length; i++) {
                data[i].listIndex = i + 1
                data[i]["number"] = i;
            }
        }
        return data;
    }


    function getToday(){
        var date = new Date();
        var year = date.getFullYear();
        var month = ("0" + (1 + date.getMonth())).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + month + day;
    }

    function dateSetting() {
        let date = new Date();
        let date2 = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";
        var month30 = new Date(date2.setDate(date2.getDate() - 30));

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            $(".startDate").datepicker('setDate', month30);
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

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
    }

    function dateSetting(dataSet) {
        let date = new Date();
        let date2 = new Date();
        let startDate = "${searchValue.startDate}";
        let endDate = "${searchValue.endDate}";
        let month30 = new Date(date2.setDate(date2.getDate() - Number(dataSet)));
        let defaultMonth = new Date("2020-01-01");

        $(".startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });

        if(startDate == ""){
            if(dataSet == 2020) {
                $(".startDate").datepicker('setDate', defaultMonth);
            }else {
                $(".startDate").datepicker('setDate', month30);
            }
        } else {
            $(".startDate").datepicker('setDate', startDate);
        }

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
    }

   /* let buttonsss =
        { extend: 'excel',
            text: '&nbsp; 엑셀 다운로드',
            className: 'btn-sm fa fa-file-excel'
            ,filename: '엑셀출력_'+moment().format('YYYYMMDDhhmm')
            ,title: ''
            ,action: newExportAction
        }*/

    //datatables 공통화
    $.fn.ajaxDataTable = function (dataId, url,  dataSrcType, excelType, pageAble , init, error = null) {
        let button = [
            /* { extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },
             { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
            { extend: 'excel',
                text: '&nbsp; 엑셀 다운로드',
                className: 'btn-sm fa fa-file-excel'
                ,filename: '엑셀출력_'+moment().format('YYYYMMDDhhmm')
                ,title: ''
                ,action: newExportAction
            },
            /*{ extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
        ]
        if(excelType == "1"){
            button = [];
        }
        if(excelType == "3"){
            button = [
                /* { extend: 'copy', text: ' 복사', className: 'btn-sm fa fa-copy' },
                 { extend: 'csv', text: ' &nbsp;CSV 다운로드', className: 'btn-sm fa fa-file-csv' },*/
                { extend: 'excel',
                    text: '&nbsp; 엑셀 다운로드',
                    className: 'btn-sm fa fa-file-excel'
                    ,filename: '엑셀출력_'+moment().format('YYYYMMDDhhmm')
                    ,title: ''
                    ,action: newExportAction,
                    exportOptions: {
                        format: {
                            body: function (data, row, column, node) {
                                // if it is select
                                if (column == 2) {
                                    return $(data).find("option:selected").text()
                                } else if(column == 5){
                                    return $(data).is("input") ? $(data).val(): data;
                                } else if(column == 6){
                                    return $(data).is("input") ? $(data).val(): data;
                                } else if(column == 7){
                                    return $(data).is("input") ? $(data).val(): data;
                                } else return data
                            }
                        }
                    }
                },
                /*{ extend: 'print',text: ' 프린트', className: 'btn-sm fa fa-print' },*/
            ]
        }


        var setting = {
            language :  {
                lang_set,
                "processing": "데이터 불러오는 중...",
                "info": " _PAGE_ - _PAGES_ (총 _MAX_ 건)",
            },
            /*   pagingType : "full_numbers",*/
            lengthMenu : [ [ 10, 20, 30 ,40], [ 10, 20, 30, 40] ],
            responsive: true,
            processing:true,
            bAutoWidth: false,
            bPaginate : pageAble,
            ordering: true,
            serverSide: true,
            /*"bInfo": false,
            "bLengthChange": true, // n개씩보기
            "lengthMenu": [[10, 20, 30], ["10개 보기", "20개 보기", "30개 보기"]], // 10/20/30 개씩보기
            "order": [[0, "desc"]],
            "searching": false,*/
            dom: '<"row"<"col-sm-12"l B><"col-sm-12"fr>>t<"row"<"col-sm-12"i><"col-sm-12"p>>',
            //dom: '<"row"<"col-sm-2"l><"col-sm-3"B><"col-sm-7"fr>><"row"<"col-sm-5"i><"col-sm-7"p>>',
            buttons: button,
            "ajax": {
                url: url,
                type: "POST",
                data : function(res){
                    let id = "#"+dataId
                    var formData = objectifyForm($(id).serializeArray());
                    var param = formData;

                    param["draw"] = res.draw;
                    param["length"] = res.length;
                    param["start"] = res.start;
                    return param;
                },
                "dataSrc": function (res) {
                    return dataSrcFunction(res,dataSrcType);
                },
                error: function(xhr, status, err) {
                    if (error) {
                        error(status);
                    } else {
                        alert('통신 실패!!!');
                        console.log(err);
                        console.log(xhr);
                        console.log(status);
                    }
                }
            },
        };

        var val = $.extend(true, setting, init);
        return $(this).DataTable(val);
    };
    /**
     * DataTables 기본 Excel / Print 원본 액션
     */
    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            } else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        }
    };

    /**
     * 일반 DataTables 전체 엑셀 다운로드
     *
     * 사용:
     * {
     *   extend: 'excel',
     *   action: newExportAction
     * }
     */
    var newExportAction = function (e, dt, button, config) {
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;

        var startDate = $(".startDate").val() || $(".periodS").val();
        var endDate = $(".endDate").val() || $(".periodE").val();

        if (startDate && endDate && typeof getDateDiff === "function") {
            if (getDateDiff(startDate, endDate) > 120) {
                alert("엑셀 날짜범위는 최대 120일까지 가능합니다.");
                return;
            }
        }

        dt.one('preXhr', function (e, s, data) {
            var exportLength = 2147483647;

            data.start = 0;
            data.length = exportLength;

            // 서버에서 pageSize/pageNo를 기준으로 페이징하는 화면 대응
            data.pageNo = 1;
            data.pageSize = exportLength;

            // 일부 화면에서 length select name 값으로 pageSize를 만드는 경우 대응
            data.testTable_length = exportLength;

            // 서버에서 엑셀 여부 분기할 수 있게 추가
            data.excelDownloadYn = "Y";

            dt.one('preDraw', function (e, settings) {
                oldExportAction(self, e, dt, button, config);

                dt.one('preXhr', function (e, s, data) {
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;

                    // 원래 화면 페이지 복구
                    data.pageNo = oldStart / dt.page.len() + 1;
                    data.pageSize = dt.page.len();
                    data.length = dt.page.len();
                    data.testTable_length = dt.page.len();

                    delete data.excelDownloadYn;
                });

                setTimeout(function () {
                    dt.ajax.reload();
                }, 0);

                return false;
            });
        });

        dt.ajax.reload();
    };

    // 오타로 쓰는 화면 호환

    /**
     * 기존 화면 중 오타로 newExprortAction 을 쓰는 곳이 있으면 호환 처리
     */
    var newExprortAction = newExportAction;


    /**
     * 값 없을 때 엑셀 기본 표시값
     */
    function excelEmptyValue(value, emptyText) {
        if (emptyText === undefined || emptyText === null) {
            emptyText = "-";
        }

        if (value === null || value === undefined || value === "") {
            return emptyText;
        }

        return String(value);
    }


    /**
     * SheetJS 기반 XLSX 다운로드 공통
     *
     * 주의:
     * XLSX 라이브러리가 필요함.
     * include_common_js.jsp 또는 include_custom_js.jsp에 xlsx.full.min.js 로드 필요.
     */
    function downloadCommonXlsx(options) {
        if (typeof XLSX === "undefined") {
            alert("엑셀 라이브러리가 로드되지 않았습니다.");
            return;
        }

        var headers = options.headers || [];
        var rows = options.rows || [];
        var sheetName = options.sheetName || "Sheet1";
        var fileName = options.fileName || ("엑셀출력_" + moment().format("YYYYMMDDHHmm") + ".xlsx");
        var cols = options.cols || [];

        var workbook = XLSX.utils.book_new();
        var worksheet = XLSX.utils.aoa_to_sheet([headers].concat(rows));

        if (cols.length > 0) {
            worksheet["!cols"] = cols;
        }

        XLSX.utils.book_append_sheet(workbook, worksheet, sheetName);
        XLSX.writeFile(workbook, fileName);
    }


    /**
     * 서버 페이징을 돌면서 전체 데이터 XLSX 다운로드
     *
     * 사용처:
     * - 서버에서 length 값을 제한하는 화면
     * - DataTables exportAll 로는 전체 데이터가 안 내려오는 화면
     */
    function downloadCommonPagedXlsx(options) {
        var pageSize = Number(options.pageSize || 1000);
        var pageNo = 1;
        var allList = [];
        var totalCount = 0;

        var $btn = $(options.buttonSelector || ".btn-excel-download");
        var originalHtml = $btn.html();

        var loadingText = options.loadingText || "엑셀 생성중...";
        var emptyMessage = options.emptyMessage || "엑셀 다운로드할 데이터가 없습니다.";
        var failMessage = options.failMessage || "엑셀 다운로드 중 오류가 발생했습니다.";

        function setLoading() {
            if ($btn.length > 0) {
                $btn.prop("disabled", true)
                    .html('<i class="fa fa-spinner fa-spin"></i><span>' + loadingText + '</span>');
            }
        }

        function finish() {
            if ($btn.length > 0) {
                $btn.prop("disabled", false).html(originalHtml);
            }
        }

        function fetchNextPage() {
            options.requestPage(pageNo, pageSize)
                .done(function (res) {
                    var list = options.getList(res) || [];

                    if (typeof options.getTotalCount === "function") {
                        totalCount = Number(options.getTotalCount(res) || 0);
                    }

                    if (list.length > 0) {
                        allList = allList.concat(list);
                    }

                    var isLast =
                        list.length === 0 ||
                        (totalCount > 0 && allList.length >= totalCount) ||
                        (totalCount === 0 && list.length < pageSize);

                    if (isLast) {
                        if (allList.length === 0) {
                            alert(emptyMessage);
                            finish();
                            return;
                        }

                        var rows = options.makeRows(allList);

                        downloadCommonXlsx({
                            headers: options.headers,
                            rows: rows,
                            sheetName: options.sheetName,
                            fileName: options.fileName,
                            cols: options.cols
                        });

                        finish();
                        return;
                    }

                    pageNo++;
                    fetchNextPage();
                })
                .fail(function () {
                    alert(failMessage);
                    finish();
                });
        }

        setLoading();
        fetchNextPage();
    }


</script>
