<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
    let _params = {};
    let _labels = [];
    let _names = [];
    // let _widths = [];
    let _types = [];
    let table = {};
    let _rowList = [10, 20, 50, 100];

    $.fn.dataTable.ext.errMode = 'info';
    //$.fn.dataTable.moment('YYYY/MM/DD HH:mm:ss');
    //Dialog 드래그 가능하게변경
    $(".modal-content").draggable({});

    //add에 남아있는 데이터 지우기
    $(".modal").on('hide.bs.modal', (e) => {
        $('#add_modal form').each(function() {
            this.reset();
        });
    });

    // search 엔터로 리스트조회 하는 것 방지
    $('.preventEnter').keydown(function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            searchFunc();
            return false;
        }
    });

    $('.lifecyclePreventEnter').keydown(function (e) {
        let keyword = $("#lifecycleKeyword").val();
        if (e.keyCode === 13) {
            if(keyword == '') {
                swal_alert("품종을 검색해주세요.", "warning");
            } else {
                e.preventDefault();
                searchBvName();
                searchFunc();
                return false;
            }
        }
    });

    $('.lifecycle_search_btn').on('click', function(e) {
        searchBvName();
        searchFunc();
       /* let keyword = $("#lifecycleKeyword").val();
        if(keyword == '') {
            swal_alert("품종을 검색해주세요.", "warning");
        } else {

        }*/
    });

    $('.lifecarePreventEnter').keydown(function (e) {
        let keyword = $("#bvName").val();
        if (e.keyCode === 13) {
            if(keyword == '') {
                swal_alert("품종을 검색해주세요.", "warning");
            } else {
                e.preventDefault();
                searchFunc();
                return false;
            }
        }
    });

    $('.lifecare_search_btn').on('click', function(e) {
        let keyword = $("#bvName").val();
        if(keyword == '') {
            swal_alert("품종을 검색해주세요.", "warning");
        } else {
            searchFunc();
        }
    });

    //Search
    $('.search_btn').on('click', function() {
        searchFunc();
    });

    //searchBvName
    function searchBvName() {
        let blBvId = $(".search_val").val();
        $.ajax({
            type: "get",
            url: "${path}/contents/lifecycle/getBvName?blBvId="+blBvId,
            dataType: "json",
            success: function(data) {
                $("#bvName").text(data.bvName);
            }
        });
    }

    function searchFunc() {
        //셀렉조건
        //alert($('.search_val').val());
        //alert($('.select_val').val());
        let varietiesSearchVal = $('.varietiesSearch').val();
        let contentsSearchVal = $('.contentsSearch').val();
        let blCycleVal = $(".blCycleVal").val();
        let detailBlCycleVal = $('.detailBlCycleVal').val();
        let detailBlBvIdVal = $('.detailBlBvIdVal').val();
        let searchVal = $('.search_val').val();
        let hospitalAdminSearchVal = $('.hospital_search_val').val();
        let hospitalSearchVal = $('.hospitalsSelect').val();
        let chkSelectVal = $('.select_val option:selected').val();
        let chkSearchVal = $('.search_val option:selected').val();
        let chkBlCycleDetailVal = $('.blCycleDetail_val').val();
        let optionVal = $(".option_val option:selected").val();
        let bcBsIdVal = $(".bcBsId option:selected").val();
        let bcTypeVal = $(".bcType option:selected").val();
        let bcBccIdVal = $(".bccId option:selected").val();
        let contentsKeyword = $(".contentsKeyword").val();
        let bpsBsIdVal = $(".bpsBsId option:selected").val();
        let bprDivisionVal = $(".bprDivision option:selected").val();
        let conditionVal = $(".condition option:selected").val();
        let keyword = $(".keyword").val();
        /*if (chkSearchVal === "-1") {
            return alert_focus("selectValue", "품종을 선택해주세요.");
        } else if (chkSelectVal === "-1") {
            return alert_focus("selectValue", "분류를 선택해주세요.");
        } else {*/
        let val;
        if (chkBlCycleDetailVal != null && chkBlCycleDetailVal != "" ) {
            val = [searchVal, blCycleVal ,chkBlCycleDetailVal];
        } else if(optionVal != null && optionVal != "") {
            val = [chkSelectVal, optionVal, searchVal]
        } else if(contentsSearchVal != null && contentsSearchVal != "") {
            val = [chkSelectVal, searchVal, contentsSearchVal]
        } else if (hospitalSearchVal != null && hospitalSearchVal != "") {
            val = [chkSelectVal, hospitalSearchVal];
        } else if (varietiesSearchVal != null && varietiesSearchVal != "") {
            //console.log(varietiesSearchVal);
            val = [chkSelectVal, varietiesSearchVal];
        } else if (detailBlBvIdVal != null && detailBlBvIdVal != "" && detailBlCycleVal != "" && detailBlCycleVal != null ) {
            //console.log(detailBlBvIdVal);
            val = [detailBlBvIdVal, detailBlCycleVal];
        } else if (hospitalAdminSearchVal != null && hospitalAdminSearchVal != "") {
            val = [chkSelectVal, hospitalAdminSearchVal];
        } else if (searchVal != null && searchVal != "") {
            val = [chkSelectVal, searchVal];
        } else {
            val = [chkSelectVal, chkSearchVal];
        }

        if(bcBsIdVal != null) {
            val = [bcBsIdVal, bcTypeVal, bcBccIdVal, contentsKeyword];
        }

        if(bpsBsIdVal != null) {
            val = [bpsBsIdVal, bprDivisionVal, conditionVal, keyword];
        }
        table.search(val).draw();
    }

/*    $('.rix-title').on('click', function () {
        dataTablesReload();
    });*/

    <c:forEach var="name" items="${dataParam.col_names}">_names.push('${name}');
    </c:forEach>
    <c:forEach var="label" items="${dataParam.col_labels}">
        <c:choose>
            <c:when test="${label eq '동물 정보 동의'}">
                _labels.push('${label}' + "(O: " + ${countAgree.bhaPet} + ", X: " + "${countAgree.bhaPetDisagree}" + ")");
            </c:when>
            <c:when test="${label eq '검사 결과 동의'}">
                _labels.push('${label}' + "(O: " + ${countAgree.bhaScan} + ", X: " + "${countAgree.bhaScanDisagree}" + ")");
            </c:when>
            <c:when test="${label eq '영수증 동의'}">
                _labels.push('${label}' + "(O: " + ${countAgree.bhaReceipt} + ", X: " + "${countAgree.bhaReceiptDisagree}" + ")");
            </c:when>
            <c:when test="${label eq '예약 동의'}">
                _labels.push('${label}' + "(O: " + ${countAgree.bhaReserv} + ", X: " + "${countAgree.bhaReservDisagree}" + ")");
            </c:when>
            <c:otherwise>
                _labels.push('${label}');
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:forEach var="type" items="${dataParam.col_types}">_types.push('${type}');
    </c:forEach>


    let $grid = $('#dataTable');
    let columnData = [{"title": " ", "data": null,  "mData": null}];

    $("#bcTypeSelector").one("preInit.dt", function () {
        $sel = $("<select></select>");
        $sel.html("<option value='-1'>Select Column</option>");
        $.each(columns, function (i, opt) {

            $sel.append("<option value='" + opt.title + "'>" + opt.title + "</option>");
        });
        $("#example_ddl").append($sel);
    });

    $.each(_names, function (idx) {
        let columns = {
            "title": _labels[idx],
            "data": _names[idx],
            "render": function (data, type, row, meta) {
                if (_types.indexOf('selector1') === idx) {
                    var editLink = '<a href="#" id="edit_'+ data+'"  class="btn btn-primary btn-sm 1rdBtn"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    data = editLink ;
                    return data;
                } else if (_types.indexOf('hospitalAddress') === idx) {
                    //console.log(row.bhAddress);
                    if(row.bhAddress != null && row.bhAddressDetail != null) {
                        data = row.bhAddress + " " + row.bhAddressDetail;
                    } else if(row.bhAddressDetail == null) {
                        data = row.bhAddress;
                    } else {
                        data = "";
                    }
                    return data;
                } else if (_types.indexOf('bpsindex') === idx) {
                    data += '차';
                    return data;
                } else if (_types.indexOf('bpsweek') === idx) {
                    data += '주차';
                    return data;
                } else if (_types.indexOf('bmictype') === idx) {
                    if(data == 1) data = '건강지수';
                    else if(data == 2) data = '정보지수';
                    else if(data == 3) data = '공감지수';
                    return data;
                } else if (_types.indexOf('bmicindextype') === idx) {
                    if(data == 0) data = '제한없음';
                    else if(data == 1) data = '무조건 한번';
                    else if(data == 2) data = '일일 한번';
                    return data;
                } else if (_types.indexOf('bprDivision') === idx) {
                    if(data == 0) data = '기타';
                    else if(data == 1) data = '예방접종';
                    else if(data == 2) data = '심장사상충';
                    else if(data == 3) data = '구충제';
                    return data;
                } else if (_types.indexOf('bprBsId') === idx) {
                    if(data == 1) data = '개';
                    else if(data == 2) data = '고양이';
                    return data;
                } else if (_types.indexOf('bprType') === idx) {
                    if(data == 1) data = '기간';
                    else if(data == 2) data = '차수';
                    return data;
                } else if (_types.indexOf('brmtype') === idx) {
                    if(data == 1) data = '보호중';
                    else if(data == 2) data = '찾는중';
                    return data;
                } else if (_types.indexOf('brmstatus') === idx) {
                    if(data == 0) data = '진행중';
                    else if(data == 1) data = '완료';
                    return data;
                } else if (_types.indexOf('bprInterval') === idx) {
                     data = data + "월";
                    return data;
                } else if (_types.indexOf('brccshow') === idx) {
                    if(data == 0) data = '숨김';
                    else if(data == 1) data = '노출';
                    return data;
                } else if (_types.indexOf('bpadivisiontype') === idx) {
                    if(data == 1) data = '예방접종';
                    else if(data == 2) data = '심장사상충';
                    else if(data == 3) data = '구충제';
                    return data;
                } else if (_types.indexOf('bpacalendar') === idx) {
                    if(data == 0) data = '당일';
                    else if(data > 0) data += '일 후';
                    else data = -data + '일 전';
                    return data;
                } else if (_types.indexOf('userAccType') === idx) {
                    if(data == 1) data = '펫뷰';
                    else if(data == 2) data = '왈';
                    else if(data == 3) data = '신규가입';
                    return data;
                } else if (_types.indexOf('hctype') === idx) {
                    if(data == 0) data = '기타';
                    else if(data == 1) data = '행동이상';
                    else if(data == 2) data = '질병/증상';
                    else if(data == 3) data = '영양';
                    else if(data == 4) data = '수술';
                    else if(data == 5) data = '예방접종';
                    return data;
                } else if (_types.indexOf('bhapet') === idx) {
                    if(data == 0) data = 'X';
                    else if(data == 1) data = 'O';
                    return data;
                } else if (_types.indexOf('bhascan') === idx) {
                    if(data == 0) data = 'X';
                    else if(data == 1) data = 'O';
                    return data;
                } else if (_types.indexOf('bhareceipt') === idx) {
                    if(data == 0) data = 'X';
                    else if(data == 1) data = 'O';
                    return data;
                } else if (_types.indexOf('bhareserv') === idx) {
                    if(data == 0) data = 'X';
                    else if(data == 1) data = 'O';
                    return data;
                } else if (_types.indexOf('hcstatus') === idx) {
                    if(data == 0) data = '상담대기';
                    else if(data == 1) data = '상담완료';
                    return data;
                } else if (_types.indexOf('hcactive') === idx) {
                    if(data == 0) data = '사용중지';
                    else if(data == 1) data = '사용';
                    return data;
                } else if (_types.indexOf('hatype') === idx) {
                    if (data == 1) {
                        data = "진료";
                    } else if (data == 2) {
                        data = "미용";
                    } else if (data == 3) {
                        data = "호텔";
                    }
                    return data;
                } else if (_types.indexOf('status') === idx) {
                    if (data == 0) {
                        data = '';
                        let checkBox = '<div class="custom-control custom-switch"><input type="checkbox" class="custom-control-input haStatus" id="customSwitch' + row.haId + '" disabled><label class="custom-control-label" for="customSwitch' + row.haId + '"></label></div>';
                        data = checkBox;
                        data += "<div class='d-inline'>취소</div>";
                    } else if (data == 1) {
                        let checkBox = '<div class="custom-control custom-switch"><input type="checkbox" value="'+ row.haStatus +'" onchange="changeStatus(' + row.haId + ', this)" class="custom-control-input haStatus" id="customSwitch' + row.haId + '"><label class="custom-control-label" for="customSwitch' + row.haId + '"></label></div>';
                        data = checkBox;
                        data += "<div class='d-inline m-b-10'>예약</div>";
                    } else if (data == 2) {
                        let checkBox = '<div class="custom-control custom-switch"><input type="checkbox" value="'+ row.haStatus +'" onchange="changeStatus(' + row.haId + ', this)" class="custom-control-input haStatus" id="customSwitch' + row.haId + '" checked><label class="custom-control-label" for="customSwitch' + row.haId + '"></label></div>';
                        data = checkBox;
                        data += "<div class='d-inline m-b-10'>확정</div>";
                    }
                    return data;
                } else if (_types.indexOf('huwactive') === idx) {
                    let removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="conversionUser('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-undo-alt" aria-hidden="true" > 전환</i> </div>';
                    data = "";
                    data += removeLink ;
                    return data;
                } else if (_types.indexOf('appointmentDetail') === idx) {
                    var detailLink = '<div id="detail_'+ data+'" style="cursor:pointer;" onclick="detailRow('+data+')"  class="btn btn-aqua btn-sm"><i class="fa fa-list" aria-hidden="true" > 예약조회</i> </div>';
                    data = "";
                    data += detailLink ;
                    return data;
                } else if (_types.indexOf('hospitalBoardTitle') === idx) {
                    var detailLink = '<a href="#" id="edit_' + data + '" onclick="detailRow(' + row.brhId + ')"  class="">' + data + '</a>';
                    data = "";
                    data += detailLink ;
                    return data;
                } else if (_types.indexOf('eventTitle') === idx) {
                    var detailLink = '<a href="#" id="edit_' + data + '" onclick="detailRow(' + row.breId + ')"  class="">' + data + '</a>';
                    data = "";
                    data += detailLink ;
                    return data;
                } else if (_types.indexOf('noticeTitle') === idx) {
                    var detailLink = '<a href="#" id="edit_' + data + '" onclick="detailRow(' + row.brnId + ')"  class="">' + data + '</a>';
                    data = "";
                    data += detailLink ;
                    return data;
                } else if (_types.indexOf('faqTitle') === idx) {
                    var detailLink = '<a href="#" id="edit_' + data + '" onclick="detailRow(' + row.brfId + ')"  class="">' + data + '</a>';
                    data = "";
                    data += detailLink ;
                    return data;
                } else if (_types.indexOf('userManagement') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" onclick="detailRow(' + data + ')"  class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="userWithdrawal('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 탈퇴</i> </div>';
                    data = "";
                    data = editLink;
                    data += removeLink ;
                    return data;
                } else if (_types.indexOf('openStatus') === idx) {
                    if(data == 1) data = "공개";
                    else if(data == 0) data = "비공개";
                    return data;
                } else if (_types.indexOf('selector2') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" onclick="updateInfoRow(' + data + ')"  class="btn btn-primary btn-sm 2rdBtn"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    data = "";
                    data += editLink ;
                    return data;
                } else if (_types.indexOf('selector3') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" 3rdVal= "'+data+'" class="btn btn-primary btn-sm 3rdBtn"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    data = "";
                    data += editLink ;
                    return data;
                } else if (_types.indexOf('selector4') === idx) {
                    var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';
                    data = "";
                    data += removeLink ;
                    return data;
                } else if (_types.indexOf('password') === idx) {
                    var changePwdLink = '<div id="password_'+ data+'" style="cursor:pointer;" onclick="initPassword('+data+')"  class="btn btn-warning btn-sm"><i class="fa fa-undo-alt" aria-hidden="true" > 초기화</i> </div>';
                    data = "";
                    data += changePwdLink ;
                    return data;
                } else if (_types.indexOf('update') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" onclick="updateHospital(' + data + ')" class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    data = "";
                    data += editLink ;
                    return data;
                } else if (_types.indexOf('selector') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';
                    data = "";
                    data = editLink;
                    data += removeLink ;
                    return data;
                } else if (_types.indexOf('hospitaladminselector') === idx) {
                    var editLink = '';
                    var removeLink = '';
                    if(${sessionScope.sessionKey.userRole != 0}) {
                        if(row.userRole != 1) {
                            editLink = '<a href="#" id="edit_' + data + '" class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                            removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';
                            data = "";
                            data = editLink;
                            data += removeLink ;
                        } else {
                            data = "";
                        }
                    } else {
                        editLink = '<a href="#" id="edit_' + data + '" class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                        removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';
                        data = "";
                        data = editLink;
                        data += removeLink ;
                    }
                    return data;
                } else if (_types.indexOf('disease') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" class="btn btn-primary btn-sm" onclick="updateRow('+data+')"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                  /*  var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';*/
                    data = "";
                    data = editLink;
                  /*  data += removeLink ;*/
                    return data;
                } else if (_types.indexOf('detailList') === idx) {
                    var detailLink = '<div id="detail_'+ data+'" style="cursor:pointer;" onclick="detailRow('+data+')"  class="btn btn-aqua btn-sm"><i class="fa fa-list" aria-hidden="true" > 상세주기</i> </div>';
                    data = "";
                    data += detailLink ;
                    return data;
                } else if (_types.indexOf('contentsSelector') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" onclick="updateRow(' + data + ')"  class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';
                    data = "";
                    data = editLink;
                    data += removeLink ;
                    return data;
                } else if (_types.indexOf('counselDetail') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" onclick="updateRow(' + data + ')"  class="btn btn-primary btn-sm"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    /*var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';*/
                    data = "";
                    data = editLink;
                   /* data += removeLink ;*/
                    return data;
                } else if (_types.indexOf('bprActive') === idx) {
                        if (data == 0) {
                            data = '';
                            var checkBox = '<div class="switcher">' +
                                '<input type="checkbox" name="switcher_checkbox_1" onchange="changeActive(' + row.bprId + ', this)" id="customSwitch' + row.bprId + '"  value="0">' +
                             '<label  for="customSwitch' + row.bprId + '"></label>' +
                              '</div>';
                            data = checkBox;
                        } else if (data == 1) {
                            var checkBox = '<div class="switcher">' +
                                '<input type="checkbox" name="switcher_checkbox_1" onchange="changeActive(' + row.bprId + ', this)" id="customSwitch' + row.bprId + '"  value="1" checked>' +
                                '<label  for="customSwitch' + row.bprId + '"></label>' +
                                '</div>';
                            data =  checkBox;
                            data = data;
                        }
                        return data;
                } else if (_types.indexOf('breId') === idx) {
                    var removeLink = '<div id="del_'+ data+'" style="cursor:pointer;" onclick="deleteRow('+data+')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-alt" aria-hidden="true" > 삭제</i> </div>';
                    data = "";
                    data += removeLink ;
                    return data;
                }  else if (_types.indexOf('bprButton') === idx) {
                    var editLink = '<a href="#" id="edit_' + data + '" onclick="updateRow(' + data + ')"  class="btn btn-primary btn-sm update_row"><i class="fa fa-pencil-alt" aria-hidden="true" > 수정</i> </a>';
                    data = "";
                    data = editLink;
                    /!* data += removeLink ;*!/
                    return data;
                } else if (_types.indexOf("bpvtype") === idx) {
                    if (data == "1") {
                        data = "이용약관";
                    } else if (data == "2") {
                        data = "개인정보취급방침";
                    } else if (data == "3") {
                        data = "회원탈퇴";
                    } else if (data == "4") {
                        data = "알림푸시 및 문자수신";
                    } else if (data == "5") {
                        data = "마케팅 정보 수신";
                    }
                    return data;
                } else if (_types.indexOf("baseCycle") === idx) {
                    if (data == "1") {
                        data = "유아기";
                    } else if (data == "2") {
                        data = "아동기";
                    } else if (data == "3") {
                        data = "청년기";
                    } else if (data == "4") {
                        data = "성년기";
                    } else if (data == "5") {
                        data = "노년기";
                    } else if (data == "6") {
                        data = "황금기";
                    }
                    return data;
                }  else if (_types.indexOf("bmRoleTxt") === idx) {
                    if (data == 0) {
                        data = "마스터";
                    } else if (data == 1) {
                        data = "병원메인";
                    } else if (data == 2) {
                        data = "병원서브";
                    }
                    return data;
                }  else if (_types.indexOf("bmActiveTxt") === idx) {
                    if (data == "0") {
                        data = "사용중지";
                    } else if (data == "1") {
                        data = "사용";
                    }
                    return data;
                } else if (_types.indexOf("lifeCareBaseCycle") === idx) {
                   if(data.charAt(0) == "1"){
                       data = data.replace(data.charAt(0), "유아기");
                   } else if(data.charAt(0) == "2"){
                       data = data.replace(data.charAt(0), "아동기");
                   } else if(data.charAt(0) == "3"){
                       data = data.replace(data.charAt(0), "청년기");
                   } else if(data.charAt(0) == "4"){
                       data = data.replace(data.charAt(0), "성년기");
                   } else if(data.charAt(0) == "5") {
                       data = data.replace(data.charAt(0), "노년기");
                   } else if(data.charAt(0) == "6"){
                       data = data.replace(data.charAt(0), "황금기");
                   }
                    return data;
                } else if (_types.indexOf("contentsType") === idx) {
                    if(data == 1) {
                        data = "질병";
                    } else if(data == 2) {
                        data = "생활";
                    } else if(data == 3) {
                        data = "예절교육";
                    } else if(data == 4) {
                        data = "예방접종";
                    }
                    return data;
                } else if (_types.indexOf("blStartTxt") === idx) {
                    data = data.replace('Y','년');
                    data = data.replace('M','월');
                    data = data.replace('W','주');
                    return data;
                } else if (_types.indexOf("blEndTxt") === idx) {
                    data = data.replace('Y','년');
                    data = data.replace('M','월');
                    data = data.replace('W','주');
                    return data;
                } else if (_types.indexOf("bcType") === idx) {
                    if(data == "1") {
                        data = "질병";
                    } else if(data == "2") {
                        data = "생활";
                    } else if(data == "3") {
                        data = "예절교육";
                    } else if(data == "4") {
                        data = "예방접종";
                    } else if(data == "5") {
                        data = "다빈도질환";
                    }
                    return data;
                } else if (_types.indexOf("bcInsertDtm") === idx) {
                    return data;
                } else {
                    return data;
                }
            }
        };

        // console.log("columns::{}", columns);
        columnData.push(columns);
    });
    // console.log("columnData::{}", columnData);
    let initData = {"data": []};
    let _servletPath = '${servletPath}';
    let isEnablePaging = (!(_servletPath === '/'));
    table = $grid.DataTable({
        "dom": 'lrtip',
        "serverSide": true,
        "processing": false,
        "stateSave": true,
        "oLanguage" : {
            "sEmptyTable" : "조회된 데이터가 없습니다.",
            "oPaginate" : {
                "sPrevious" : "이전",
                "sNext" : "다음"
            },
            "sInfo": "전체 _TOTAL_ea (_START_ to _END_)",
            "sInfoEmpty": ""
        },
        //"order": [[1, 'asc']],
        "ajax": {
            "url": '${path}' + '${servletPath}',
            "type": "POST",
            "headers": {
                // 'CSRFToken': _csrf_token //replace by your name/value
            },
            "contentType": "application/json",
            "data": function (_args) {
                let _splitSearch = _args.search.value.split(",");
                let params = {
                    draw: _args.draw
                    , order: {
                        column : _args.columns[_args.order[0].column].data,
                        order : _args.order[0].dir}
                    , start: _args.start
                    , length: _args.length
                    , search: {
                        key: _splitSearch[0],
                        value: _splitSearch[1]
                    }
                    , subSearch: {
                        key: _splitSearch[0],
                        option: _splitSearch[1],
                        value: _splitSearch[2]
                    }
                    , contentsSearch: {
                        bcBsId: _splitSearch[0],
                        bcType: _splitSearch[1],
                        bcBccId: _splitSearch[2],
                        keyword: _splitSearch[3]
                    }
                    , bpsSearch: {
                        bpsBsId: _splitSearch[0],
                        bprDivision: _splitSearch[1],
                        condition: _splitSearch[2],
                        keyword: _splitSearch[3]
                    }
                };
                // console.log("result : ", params);
                return JSON.stringify(params);
            },
            "dataSrc": function (res) {
                let data = res.data;
                return data;
            }
        },
        "columns": columnData, //열 속성 정의
        "lengthMenu": _rowList,
        "language": {
            "lengthMenu": "_MENU_",
        }
        ,"paging": isEnablePaging
        , "info":  isEnablePaging
    });
    //테이블 인덱스 추가
    table.on('draw.dt', function () {
        let info = table.page.info();
        // table.column(0, {search: 'applied', order: 'applied', page: 'applied'}).nodes().each(function (cell, i) {
        table.column(0, {}).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + info.start;
        });
    });

    //테이블 조작하기위한 변수설정
    let _$tbody = $('#dataTable tbody');


    /*function init() {
        $("#dataTable_wrapper input[type='search']").off();
    }*/


    function dataTablesReload() {
        //console.log("dataTablesReload::{}");
    }

    function searchDateRange(colName) {
        let beforeSelectSearch;
        $("#selectSearch").change(function(e) {
            let searchData = $(this).val();
            if (searchData === colName) {
                beforeSelectSearch = searchData;
                $("input[name='search_val']").daterangepicker({
                    opens: 'right',
                    locale: {
                        format: 'YYYY/MM/DD',
                        separator: '-'
                    },
                    startDate: moment().subtract('days', 7),
                    endDate: moment(),
                    autoClose: true,
                }, function (start, end) {
                    $("input[name='search_val']").val(start.format('YYYY/MM/DD') + '-' + end.format('YYYY/MM/DD'));
                    searchFunc();
                });
            } else {
                if (beforeSelectSearch === 'startAdDate') {
                    beforeSelectSearch = null;
                    $("input[name='search_val']").data('daterangepicker').remove();
                    $("input[name='search_val']").val("");
                }
            }
        });
    }

    $("a[data-click='panel-reload']").click(function() {
        dataTablesReload();
    });

    /*function statusClear() {
        $("#dataTable").DataTable().state.clear();
        $(".search_btn").click();
    }*/
</script>