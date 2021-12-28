let AjaxFunction = {
    execute: function (url, method, data) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: "application/json"
        })
    },
    executeAjax: function (url, method, data, _modal) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: "application/json"
        })
            .done(function(_success) {
                if (_success.status === 200) {
                    swal(_success.message);
                    modalHide(_modal);
                    dataTablesReload();
                } else {
                    swal(_success.message);
                }
            })
            .fail(function(xhr) {
                let result = JSON.parse(xhr.responseText);
                if(result.errors === undefined || result.errors === null || result.errors.length <= 0) {
                    swal(result.message);
                } else {
                    swal(result.errors[0].reason);
                }
            });
           /* .done(successCallback)
            .fail(failCallBack);*/
    },
    ExecuteAjaxGlobalFalse: function (url, method, data, successCallback, failCallback) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            global: false,
            contentType: "application/json"
        })
            .done(successCallback)
            .fail(failCallback);
    },
    executeAjaxCallback: function (url, method, data, successCallback, failCallback) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: "application/json"
        })
            .done(successCallback)
            .fail(failCallback);
    },
    executeCallback: function (url, method, data, successCallback, failCallBack, errorCallBack) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: "application/json",
            success: successCallback,
            fail: failCallBack,
            error: errorCallBack
        })
    },
    executeMultipart: function (url, method, data) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: false,
            cache: false,
            enctype: 'multipart/form-data',
            processData: false
        })
    },
    executeMultipartCallback: function (url, method, data, successCallback, failCallback) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: false,
            cache: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: successCallback,
            fail: failCallback
        })
    },
    executeAjaxMultipartCallback: function (url, method, data, successCallback, failCallback) {
        return $.ajax({
            url: url,
            type: method,
            data: data,
            contentType: false,
            cache: false,
            enctype: 'multipart/form-data',
            processData: false
        }).done(successCallback)
            .fail(failCallback);
    }
};