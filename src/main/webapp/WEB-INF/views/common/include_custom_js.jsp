<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
    $(() => {


        $(document).on("click",".lang_btn",function(){
            let lang = $(this).attr("lang");
            let search ="";
            let searchNew = "${servletPath}";
            if(location.search == '' || (location.search.indexOf('?lang=') !== -1)){
                search = "${servletPath}?lang="+lang;
                location.href=search;
            } else {
                let array = location.search.split('&');
                for ( var i in array ) {
                    if(i == 0){
                        if(array[i].indexOf('lang=') == -1){
                            searchNew = searchNew + array[i]
                        }
                    } else {
                        if(array[i].indexOf('lang=') == -1){
                            console.log(array[i]);
                            searchNew = searchNew +"&"+ array[i]
                        }
                    }
                }
                location.href=searchNew +  "&lang="+lang;
            }
        })
        $(document).on("click",".company_btn",function(){
            let company = $(this).attr("company");
                $.ajax({
                    type: "POST",
                    url: "${path}/api/company/change",
                    data: {
                        company : company
                    },
                    dataType: "json",
                    success: function(data) {
                        location.href="${path}/main";
                    }
                });
        })
    });
    //날짜 사이 계산
    function getDateDiff(d1, d2) {
        const date1 = new Date(d1);
        const date2 = new Date(d2);
        const diffDate = date1.getTime() - date2.getTime();
        return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
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

    function modalHide(val) {
        val.modal('hide');
    }

    function tableReload(table) {
        table.ajax.reload();
    }

    function isNull(v) {
        return v === undefined || v === null || v === "";
    }

    function alert_focus(className, msg) {
        let _$class = $('.' + className);
        swal({
            title: msg,
            icon: "info",
        }).then((confirm) => {
            if (confirm) {
                _$class.focus();
            }
        });
        return false;

    }


    function swal_alert(title, type) {
        swal({
            title: title,
            icon: type === undefined || type === null ? 'error' : type
        });
    }

    function swal_confirm_default(title, text, icon, btnNames, isConfirm) {
        swal({
            title: title,
            text: text,
            icon: icon,
            buttons: btnNames,
        }).then(isConfirm);
    }

    function swal_confirm(title, btnName, url, method, req, table, modal) {
        swal({
            title: title,
            icon: "warning",
            buttons: [
                '취소',
                btnName
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                executeAjax(url, method, JSON.stringify(req), table, modal);
            }
        });
    }

    function swal_confirm_move_location(title, btnName, url, method, req, hrefPage) {
        swal({
            title: title,
            icon: "warning",
            buttons: [
                '취소',
                btnName
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                executeAjaxMoveLocation(url, method, JSON.stringify(req), hrefPage);
            }
        });
    }

    function swal_confirmMultiPart(title, btnName, url, method, formData, _modal) {
        swal({
            title: title,
            icon: "warning",
            buttons: [
                '취소',
                btnName
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                executeMultipartAjax(url, method, formData, _modal);
            } else {
            }
        });
    }

    function swal_confirm_customAjax(title, btnName, url, method, req, ajaxSuccess, ajaxFailed) {
        swal({
            title: title,
            // text: "데이터가 수정됩니다.!",
            icon: "warning",
            buttons: [
                '취소',
                btnName
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                // console.log("req::{}", JSON.stringify(req));
                let promise = AjaxFunction.execute(url, method, JSON.stringify(req));
                promise.done(ajaxSuccess);
                promise.fail(ajaxFailed);
            } else {
                /*        swal({
                            title: '취소',
                            icon: 'error'
                        })*/
            }
        });
    }


    //분류명 불러오기
    function load_category_groups(selectName) {
        $.get("${path}/api/v1/catgroups/list", function (result) {
            let list = result.data;
            // console.log("list::{}", list);
            let _$groupName = $('select[name="' + selectName + '"]');
            _$groupName.find("option").remove();
            if (!isNull(list)) {
                _$groupName.append('<option value="">Select</option>');
                $.each(list, (idx, item) => {
                    let content = '<option value="' + item.categoryGroupId + '">' + item.groupName + '</option>';
                    _$groupName.append(content);
                });
            }
            _$groupName.selectpicker("refresh");
        });
    }


    function select_data_init(list, selectName) {
        // console.log("list::{}", list);
        let _$selectBox = $('select[name="' + selectName + '"]');
        if (list === null || list === undefined) {
             _$selectBox.find("option").remove();
             _$selectBox.append('<option value="">Select</option>');
        }

        if (!isNull(list)) {
            $.each(list, (idx, item) => {
                let content = '<option value="' + item.id + '">' + item.name + '</option>';
                _$selectBox.append(content);
            });
        }
        select_picker_refresh();
    }


    function option_disabled(className) {
        $('.' + className + ' ' + 'option:not(:selected)').attr('disabled', true);
    }


    //TODO 설명필요. subValue 가 무엇인지?? -> select box 가져와야할 리스트가 2개이상일때 한번에 편하게 담아오기위해 구현. 주로 id값 들어감
    function appendSelectOption(list, className, subValue) {
        let selBox = $('select[name="' + className + '"]');
        // console.log("list::{}", list);
        selBox.find("option").remove();
        if (list !== null && list !== undefined) {
            selBox.append('<option value="">Select</option>');
            for (let data of list) {
                // console.log("data.subValue::{}", data);
                if (subValue !== undefined && data.subValue !== undefined) {
                    if (data.subValue === subValue) {
                        selBox.append('<option value="' + data.value + '">' + data.name + '</option>');
                        // selBox.append('<option value="' + data.id + '">' + data.name + '</option>');
                    }
                } else {
                    selBox.append('<option value="' + data.value + '">' + data.name + '</option>');
                    // selBox.append('<option value="' + data.id + '">' + data.name + '</option>');
                }
            }
        }
        selBox.selectpicker("refresh");
    }

    function appendSelectOptionIsNotSelBox(list, className, subValue) {
        let selBox = $('select[name="' + className + '"]');
        selBox.find("option").remove();
        if (list !== null && list !== undefined) {
            for (let data of list) {
                if (subValue !== undefined && data.subValue !== undefined) {
                    if (data.subValue === subValue) {
                        selBox.append('<option value="' + data.value + '">' + data.name + '</option>');
                    }
                } else {
                    selBox.append('<option value="' + data.value + '">' + data.name + '</option>');
                }
            }
        }
        selBox.selectpicker("refresh");
    }


    function convertEditButton(row) {
        // return '<div class="text-center"><a class="btn btn-info btn-xs" href=#/' + row[0] + '>' + 'Edit' + '</a></div>';
        // return '<a class="btn btn-info btn-xs" href=/' + row.userId + '>' + 'Edit' + '</a>';
        let html = "";
        if (row.processingStatus === 'UNCOMPLETED') {
            html =
                '<div class="checkbox checkbox-css checkbox-inverse checkbox-inline">' +
                    '<input type="checkbox" name="check_update" class="check_update" id= "' + row.userId + '" value="' + row.userId + '">' +
                    '<label for="' + row.userId + '">&zwnj;</label>' +
                '</div>';
        } else if (row.processingStatus === 'COMPLETED') {
            html =
                '<div class="checkbox checkbox-css checkbox-inverse checkbox-inline">' +
                    '<input type="checkbox" name="check_update" class="check_update" id= "' + row.userId + '" value="' + row.userId + '" disabled>' +
                    '<label for="' + row.userId + '">&zwnj;</label>' +
                '</div>';
        }
        return html;
    }

    function autoComplete_validation(className, modal, url, successCallback) {
        $('.' + className).autocomplete({
            source: function (req, res) {
                let term = $.trim(req.term);
                AjaxFunction.ExecuteAjaxGlobalFalse(url, "GET", "term=" + term, successCallback,
                    function (fail) {
                        // console.log("fail::{}", fail);
                        swal_alert(fail.message);
                    });
            },
            minLength: 1,
        });
    }

    function autoComplete(element, url, hiddenElement) {
        console.log("element=", element)
        element.autocomplete({
            source: function (req, res) {
                AjaxFunction.executeAjaxCallback(url, "GET", "term=" + req.term,
                    function (success) {
                        res($.map(success.data, function (item) {
                            return {
                                id: item.id,
                                value: item.name
                            }
                        }));
                    },
                    function (fail) {
                        // console.log("fail::{}", fail);
                        swal_alert(fail.responseJSON.error);
                    });
            },
            minLength: 1,
            delay: 0,
            focus: function (event, ui) {
                return (event.keyCode === 40 || event.keyCode === 38) ? false : ui;
            },
            select: function (e, selected) {
                // $('.shopkeeperId').val(selected.item.id);
                hiddenElement.val(selected.item.id);
            }
        });
    }

    //value 삽입
    function add_value($modal, params) {
        for (let key in params) {
            let keySelector = $modal.find($('.' + key));
            if (params.hasOwnProperty(key)) {
                //값이 null일때 공백으로 치환
                if (params[key] === null || params[key].length === 0) {
                    params[key] = "";
                }
                if (keySelector.length === 0) {
                    // console.log("length::0", key);
                    // continue;
                } else {
                    keySelector.val(params[key]);
                }
            }
        }
        select_picker_refresh();
    }

    function column_hide(column) {
        // console.log("column::{}", column);
        table.columns(column).visible(false);
    }

    function is_invalid(element, msg) {
        let _$class = element;
        if (_$class.hasClass('is-valid')) {
            $('.valid-feedback').remove();
            _$class.removeClass('is-valid');
        }
        if (_$class.hasClass('is-invalid')) {
            return false;
        }
        _$class.addClass('is-invalid');
        _$class.parent().append('<div class="invalid-feedback">' + msg + '</div>');
        _$class.focus();
    }

    function validation_remove(modal) {
        // console.log("remove");
        modal.find('.is-valid').removeClass('is-valid');
        modal.find('.is-invalid').removeClass('is-invalid');
        modal.parent().find('.valid-feedback').remove();
        modal.parent().find('.invalid-feedback').remove();
        modal.removeClass("is-valid");
        modal.removeClass("is-invalid");
    }

    function is_valid(element, msg) {
        let _$class = element;
        if (_$class.hasClass('is-invalid')) {
            $('.invalid-feedback').remove();
            _$class.removeClass('is-invalid');
        }
        if (_$class.hasClass('is-valid')) {
            return false;
        }
        _$class.addClass('is-valid');
        _$class.parent().append('<div class="valid-feedback">' + msg + '</div>');
        _$class.focus();
    }


    let tagItHandler = function () {
        return {
            init: function (element, readOnly) {
                return element.tagit({
                    availableTags: ["c++", "java", "php", "javascript", "ruby", "python", "c"],
                    readOnly: readOnly
                });
            },
            editAutoComplete: function (element, url, fieldName, tagLimit, categories) {
                // categoryResult, dataList, init 변수 전역변수로 설정필요
                let initIndex = 0;
                let resultList = [];
                let limit = tagLimit === undefined ? 3 : tagLimit;
                if (categories === undefined || categories.length === 0) {
                    init = true;
                }
                if (init === false && categories.length !== 0) {
                    resultList = categoryResult;
                }

                element.tagit({
                    fieldName: fieldName,
                    select: true,
                    tagLimit: limit,
                    beforeTagRemoved: function (e, ui) {
                        for (let key in resultList) {
                            if (resultList[key].name === ui.tagLabel) {
                                delete resultList[key];
                                resultList.length--;
                            }
                        }
                    },
                    beforeTagAdded: function (e, ui) {
                        // console.log("ui::{}", ui);
                        if (init === false && categories.length !== 0) {
                            initIndex++;
                            if (categories.length === initIndex) {
                                init = true;
                            }
                            return true;
                        }
                        if (dataList[0] !== undefined && init === true) {
                            for (let data of dataList[0]) {
                                // console.log("data::{}", data);
                                if (data.name === ui.tagLabel) {
                                    // console.log("data::{}",data);
                                    resultList.push(data);
                                    return true;
                                }
                            }
                        }
                        // console.log("return false");
                        return false;
                    },
                    onTagLimitExceeded: function (event, callback) {
                        swal_alert(limit + " 개까지만 등록가능합니다.");
                        $(".tagit-new .ui-autocomplete-input").val("");
                    },
                    tagSource: function (req, res) {
                        AjaxFunction.ExecuteAjaxGlobalFalse(url, "GET", "term=" + req.term,
                            function (success) {
                                dataList = [];
                                dataList.push(success.data);
                                // console.log("tagSource dataList::{}", dataList);
                                res($.map(success.data, function (item) {
                                    return item.name
                                }));
                            })
                    },
                    autocomplete: {
                        delay: 0,
                        minLength: 1,
                        source: this.tagSource,
                        autoFocus: true,
                        focus: function (event, ui) {
                            // console.log("auto focus ui::{}", ui);
                            return (event.keyCode === 40 || event.keyCode === 38) ? false : ui;
                        }
                    }
                });
                return resultList;
            },
            autocomplete: function (element, url, fieldName, tagLimit) {
                let dataList = [];
                let resultList = [];
                let limit = tagLimit === undefined ? 3 : tagLimit;
                element.tagit({
                    availableTags: ["c++", "java", "php", "javascript", "ruby", "python", "c"],
                    fieldName: fieldName,
                    select: true,
                    tagLimit: limit,
                    triggerKeys: ['comma', 'enter', 'space', 'semicolon', 'tab'],
                    beforeTagAdded: function (e, ui) {
                        for (let data of dataList[0]) {
                            if (data.name === ui.tagLabel) {
                                // console.log("data=",data);
                                resultList.push(data);
                                return true;
                            }
                        }
                        return false;
                    },
                    onTagLimitExceeded: function (event, callback) {
                        swal({title: limit + ' 개까지만 등록가능합니다.', icon: "info"});
                        // $(".ui-autocomplete-input").val("");
                        $(".tagit-new .ui-autocomplete-input").val("");
                    },
                    beforeTagRemoved: function (event, ui) {
                        // console.log("beforeTagRemoved : ", ui);
                        for (let key in resultList) {
                            if (resultList[key].name === ui.tagLabel) {
                                // console.log("beforeTagRemoved : ", ui);
                                delete resultList[key];
                                resultList.length--;
                            }
                        }
                    },
                    tagSource: function (req, response) {
                        $.ajax({
                            url: url,
                            //ajax 로딩바 제거
                            global: false,
                            data: "term=" + req.term,
                            success: function (data) {
                                dataList = [];
                                dataList.push(data.data);
                                return response($.map(data.data, function (item, key) {
                                    //dataList.push(item.name);
                                    return item.name;
                                }));
                            }
                        });
                    },
                    autocomplete: {
                        delay: 0,
                        minLength: 1,
                        source: this.tagSource,
                        autoFocus: true,
                        focus: function (event, ui) {
                            return (event.keyCode === 40 || event.keyCode === 38) ? false : ui;
                        }
                    }
                });
                return resultList;
            },
            removeAll: function (element) {
                element.tagit("removeAll");
            },
            addTag: function (element, data) {
                element.tagit("createTag", data);
            }
        }
    }();


    function getTagItList(url, element, dataName) {
        let promise = AjaxFunction.execute(url, "get");
        promise.done(ajaxSuccessCategories);

        function ajaxSuccessCategories(result) {
            // console.log("result.data::{}", result.data);
            if (result.status === 200) {
                let dataList = result.data;
                if (dataList === null || dataList === undefined || dataList.length === 0) {
                    tagItHandler.addTag(element, "");
                } else {
                    for (let data of dataList) {
                        tagItHandler.addTag(element, data[dataName]);
                    }
                }
            } else {
                alert(result.message);
            }
        }
    }

    function initDateTimePicker(element) {
        element.datetimepicker({
            stepping: 30,
            useCurrent: false,
            format: 'YYYY-MM-DD HH:mm',
            collapse: false
        }).on('dp.change', function (e) {
            //something to do
        });
    }

    function initDatepicker(element) {
        element.datepicker({
            format: 'yyyy-mm-dd',
            todayHighlight: true,
            autoclose: true,
            startDate: '+1d'
        });
    }


    function findBySearchDataOrAdd(_$list, data, element) {
        if (_$list === null || _$list === undefined) {
            return null;
        }
        if (data === null && data === undefined && data === "") {
            return null;
        }

        for (let _find of _$list) {
            if (_find.value === data) {
                if (element !== null && element !== undefined) {
                    element.val(_find.name);
                }
                // console.log("subValue::", _find.subValue);
                return _find.subValue;
            }
        }
    }


    function column_select(element) {
        $('tr.selected').removeClass('selected');
        $(element).addClass('selected');
        _params = table.row($(element)).data();
    }

    function select_picker_refresh() {
        $('.selectpicker').selectpicker('refresh');
    }

    function input_comma_format(_this) {
        // element.val = comma(remove_comma(element.val));
        _this.value = comma(remove_comma(_this.value));
    }

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function remove_comma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    function remove_comma_converter(str) {
        // return parseFloat(str.replace(/,/gi, ""));
        let result = parseFloat(str.replace(/,/gi, ""));
        if (isNaN(result)) {
            return "";
        }
        return result;
    }

    function setCookie(name, value, exp) {
        let date = new Date();
        date.setTime(date.getTime() + exp*24*60*60*1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    }

    function getCookie(name) {
        let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    }

    function deleteCookie(name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }

    function getPageUrl(servletPath) {
        return servletPath.split("/")[1];
    }

    function nullChk(data) {
        if(data === "") { // 함수로 사용
            // 맞을 경우
            return null;
        } else {
            // 안맞을 경우
            return data;
        }
    }
    $(".new-control-btn").on("click",function(){
        windowPopup();
    });
  /*  function windowPopup() {
        var popUrl = "${path}/system/control/view";
        window.open(popUrl, '관제', 'status=no,toolbar=no,scrollbars=no,location=no, fullscreen=yes');
    }*/


    function windowPopup(Option) {

        var screenSizeWidth,screenSizeHeight;
        if (self.screen) {
            screenSizeWidth = screen.width ;
            screenSizeHeight = screen.height;
        }

        <%--documentURL = "${path}/system/control/view";    //팝업창에 출력될 페이지 URL--%>
        const documentURL = "http://192.168.0.24:15001/control";    //local 관제
        //const documentURL = "http://ctl-d.jesicar.co.kr:15000/control";    //개발서버 관제 URL
        //const documentURL = "https://ctl.jesicar.co.kr/control";    //운영서버 관제 URL


        windowname = "관제";
        intWidth = screenSizeWidth;
        intHeight = screenSizeHeight;
        intYOffset = 0 ;
        let obWindow;
        if(Option){
            obWindow = window.open(documentURL,windowname, "fullscreen=yes, toolbar=no, location=no, directories=no, status=no, menubar=no,scrollbars=no,resizable=no") ;
        } else {
            obWindow = window.open(documentURL,windowname, " toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes,resizable=no") ;
            obWindow.resizeTo(intWidth, intHeight) ;
            obWindow.moveTo(0, intYOffset);
        }
        window.addEventListener('message', (e) => {
            if (e.data === 'ctlLoadComplete') {
                const accessToken = '${sessionScope.accessToken}';
                const clientId = '${cookie.clientId.value}';
                const code = '${cookie.code.value}';
                const refreshToken = '${cookie.refreshToken.value}';
                const data = {
                    type: 'authInfo',
                    clientId,
                    code,
                    accessToken,
                    refreshToken,
                }

                obWindow.postMessage(data, documentURL);
            }
        });
    }

    function phoneNumber(value) {
        value = value.replace(/[^0-9]/g, "");
        return value.replace(
            /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,
            "$1-$2-$3"
        );
    }

    function dateFormat(dateFormat) {
        if(dateFormat){
            let date = new Date(dateFormat);

            let month = date.getMonth() + 1;
            let day = date.getDate();
            let hour = date.getHours();
            let minute = date.getMinutes();
            let second = date.getSeconds();

            month = month >= 10 ? month : '0' + month;
            day = day >= 10 ? day : '0' + day;
            hour = hour >= 10 ? hour : '0' + hour;
            minute = minute >= 10 ? minute : '0' + minute;
            second = second >= 10 ? second : '0' + second;

            return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
        } else {
            return "-";

        }
    }



    function dateFormat000000(dateFormat) {
        let date = new Date(dateFormat);

        let month = date.getMonth() + 1;
        let day = date.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day  + " 00:00:00";
    }

    function dateFormatYYYYMMDD(dateFormat) {
        let date = new Date(dateFormat);

        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day;
    }

    function countString (code, str) {

        if(code || code == 0){
            return code + " "+str;
        } else {
            return "";
        }

    }
    function useYn (data){
        if (data) {
            if (data == 'Y') {
                return "사용";
            } else if (data == 'N') {
                return "미사용";
            } else {
                return "-";
            }
        } else {
            return "";
        }
    }

    function useYnLimit (data){
        if(data){
            let now = new Date();

            let month = now.getMonth() + 1;
            let day = now.getDate();

            month = month >= 10 ? month : '0' + month;
            day = day >= 10 ? day : '0' + day;

            let nowNumber = Number(now.getFullYear()+""+month+""+day)
            let limitDate = Number(data.validateTo.replaceAll("-","").replaceAll("-",""))

            if(nowNumber > limitDate && data.useYn == 'N') {
                return "만료";
            } else {
                if (data.useYn) {
                    if (data.useYn == 'Y') {
                        return "사용";
                    } else if (data.useYn == 'N') {
                        return "미사용";
                    } else {
                        return "-";
                    }
                } else {
                    return "";
                }
            }
        } else {
            return "";
        }
    }

    function enumString (code) {
        let enumStr = {}
        if(code){
            for(let i = 0 ; i < code.length() ; i++ ){
                enumStr.push({})
            }

        }

    }

    function orderType(code) {
        switch (code) {
            case "1":
                return "배달";
                break;
            case "2":
                return "포장";
                break;
            case "3":
                return "대기";
                break;
            case "4":
                return "예약";
                break;
            case "5":
                return "테이블";
                break;
            default:
                return "-";
        }
    }

    function orderStatus(code) {
        switch (code) {
            case 1:
                return "접수요청";
                break;
            case 2:
                return "접수완료";
                break;
            case 3:
                return "조리중";
                break;
            case 4:
                return "배달중";
                break;
            case 5:
                return "완료";
                break;
            case 6:
                return "조리완료";
                break;
            case 7:
                return "테이블 주문접수";
                break;
            case 8:
                return "대기";
                break;
            case 9:
                return "호출";
                break;
            case 10:
                return "입장완료";
                break;
            case 11:
                return "예약요청";
                break;
            case 12:
                return "예약확정";
                break;
            case 13:
                return "취소";
                break;
            case 14:
                return "노쇼";
                break;
            case 15:
                return "배차";
                break;
            default:
                return "-";
        }
    }

    function phoneHyphen(data) {
        if(data) {
            if(data.substring(0,2) == '02'){
                return data.substring(0, 2) + "-" +data.substring(2, 6) + "-" + data.substring( 6, 11);
            } else {
                if(data.substring(0,3) == '010'){
                    return data.substring(0, 3) + "-" +data.substring(3, 7) + "-" + data.substring( 7, 12);
                } else {
                    return data.substring(0, 3) + "-" +data.substring(3, 6) + "-" + data.substring( 6, 11);
                }
            }
        } else {
            return "";
        }
    }

    function objectifyForm(formArray) {
        //serialize data function
        var returnArray = {};
        for (var i = 0; i < formArray.length; i++){
            returnArray[formArray[i]['name']] = formArray[i]['value'];
        }
        return returnArray;
    }
    function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }

        return str;
    }

    function maxLengthCheck(id, title, maxLength){
        var obj = $("#"+id);
        if(maxLength == null) {
            maxLength = obj.attr("maxLength") != null ? obj.attr("maxLength") : 1000;
        }

        if(Number(byteCheck(obj)) > Number(maxLength)) {
            alert(title + "이(가) 입력가능문자수를 초과하였습니다.\n(영문, 숫자, 일반 특수문자 : "+maxLength+"/한글,한자,기타특수문자:"+parseInt(maxLength/2,10)+").");
            obj.focus();
            return false;
        }else{
            return true;
        }
    }
    function byteCheck(el){
        var codeByte = 0;
        for(var idx = 0; idx <el.val().length; idx++) {
            var oneChar = escape(el.val().charAt(idx));
            if ( oneChar.length == 1 ){
                codeByte ++;
            } else if(oneChar.indexOf("%u")!=-1){
                codeByte += 2;
            } else if (oneChar.indexOf("%") != -1){
                codeByte++;
            }
        }
        return codeByte;
    }

    let checkPageUrl = (function(currentPage, table) {
        currentPage = getPageUrl(currentPage);
        let prePage = getCookie("url");

        if (performance.navigation.type == 1) {
            table.state.clear();
            table.ajax.reload();
            if($(".search_btn") != null) {
                $(".search_btn").click();
            }
        }

        if(prePage != null && prePage != '' && currentPage != prePage) {
            table.state.clear();
            table.ajax.reload();
            if($(".search_btn") != null) {
                $(".search_btn").click();
            }
        }
        deleteCookie("url");
        setCookie("url", currentPage, 1);
    })('${servletPath}', $("#dataTable").DataTable());
</script>
