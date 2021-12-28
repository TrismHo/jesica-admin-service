<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<%--<script src="${path}/assets/plugins/jquery-migrate/dist/jquery-migrate.min.js"></script>--%>
<script src="${path}/assets/plugins/x-editable-bs4/dist/bootstrap4-editable/js/bootstrap-editable.min.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->

<script>
    let _$rul;
    let handleEditableFieldConstruct = function(_mode, _type, _url, _params) {
        $.fn.editable.defaults.mode = _mode; //'popup';//'inline';
        $.fn.editable.defaults.ajaxOptions = {contentType: 'application/json', dataType: 'json', type: _type};
        $.fn.editable.defaults.url = _url;
        $.fn.editable.defaults.params = _params;
        $.fn.editable.defaults.send = 'never';
        /*$.fn.editable.defaults.inputclass = 'form-control input-sm';*/
    };
    let addHandleEditable = function(element, type, validateMsg) {
        if (type === 'text') {
            element.editable('option', 'validate', function(v) {
                //콤마 제거
                v = remove_comma_converter(v);
                // console.log("v::{}", v);
                let regex= /[^0-9]/g;

                if (v === null || v === undefined || v === 'NaN' || v === '') {
                    return validateMsg;
                }
                if (typeof v === 'string' && v.search(regex) >= 0) {
                    return validateMsg;
                }
                if (v < 0) {
                    return validateMsg;
                }
                //입력할때 콤마 자동추가
            }).on('shown', function() {
                format().comma($('.form-control.form-control-sm'));
                // $('input').on('keyup keydown', function() {
                //     input_comma_format(this);
                // });
            });
        }
    };

    function submitAjaxHandleEditable(element, _url, _type, _success, _error) {
        _$rul = _url;
        element.on('save', function(e, editable) {
            //editable value에서 콤마 제거
            editable.newValue = remove_comma_converter(editable.newValue);
            editable.submitValue = remove_comma_converter(editable.submitValue);

            e.stopPropagation();
            e.preventDefault();
            let _tagId = $(this).attr("id");
            let beforeValue = $(this).editable("getValue");

            //콤마 제거
            let beforeAmount = remove_comma_converter(beforeValue[Object.keys(beforeValue)[0]]);
            // let beforeAmount = beforeValue[Object.keys(beforeValue)[0]];
            let newAmount = editable.newValue;

            let _obj = setParams(_tagId, beforeAmount, newAmount);
            var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="${path}/img/ajax-loader.gif" />')
                .appendTo(document.body).hide();

            $(window)
                .ajaxStart(function(){
                    loading.show();
                })
                .ajaxStop(function(){
                    loading.hide();
                });
            $(this).editable('submit', {
                ajaxOptions: {
                    url: _$rul,
                    async : true,
                    contentType: 'application/json',
                    type: _type,
                    data: JSON.stringify(_obj)
                }
                ,success: _success
                , error: function(xhr) {
                    _error(xhr)
                }
            },  editable.newValue = beforeAmount, editable.newValue);
        });
    }
    let changeDisabledHandleEditable = function(isDisabled) {
        $.fn.editable.defaults.disabled = isDisabled;
    };
    let FormEditable = function () {
        return {
            init: function (mode, _type, _url, _params) {
                handleEditableFieldConstruct(mode, _type, _url, _params);
            },
            add: function(element, type, validateMsg) {
                addHandleEditable(element, type, validateMsg);
            },
            ajaxInit: function(element, url, type, success, error) {
                submitAjaxHandleEditable(element, url, type, success, error);
            },
            changeURL: function(url) {
                _$rul = url;
            },
            disabled: function(isDisabled) {
                changeDisabledHandleEditable(isDisabled);
            }
        };
    }();
</script>