<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<head>
    <meta charset="utf-8"/>
    <%@include file="../../common/include_head.jsp" %>
    <title>Jesicar | <spring:message code="dashboard.normalaffiliateheadquarters11" text="가상계좌번호 할당"/></title>
</head>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    .list li {
        padding: 5px;
        background: #F9F9F9;
    }
    .list {height: 360px; overflow-y: auto;}
    .modal-footer {display: block;}
    a.page-link {padding: 5px 10px;}

.nav-item .nav-link{color:rgba(255,255,255,.65)}.nav.nav-tabs.nav-tabs-inverse .nav-item .nav-link:focus,.nav.nav-tabs.nav-tabs-inverse .nav-item .nav-link:hover{color:#fff}.nav.nav-tabs.nav-tabs-inverse .nav-item .nav-link.active{color:#2d353c}.nav.nav-pills .nav-item .nav-link{padding:.61875rem .9375rem;font-weight:600;color:#6f8293}.nav.nav-pills .nav-item .nav-link:focus,.nav.nav-pills .nav-item .nav-link:hover{color:#2d353c}.nav.nav-pills .nav-item .nav-link.active{color:#fff}@media (max-width:767.98px){.nav-wizards-container{overflow:scroll}.nav-wizards-container .nav.nav-wizards-1,.nav-wizards-container .nav.nav-wizards-2,.nav-wizards-container .nav.nav-wizards-3{min-width:600px}}.nav.nav-wizards-1{-webkit-flex-wrap:nowrap;-ms-flex-wrap:nowrap;flex-wrap:nowrap}.nav.nav-wizards-1 .nav-item{padding:0}.nav.nav-wizards-1 .nav-item .nav-link{position:relative;color:#495057}.nav.nav-wizards-1 .nav-item .nav-link .nav-no{width:40px;height:40px;margin:0 auto;font-weight:600;background:0 0;border:2px solid #ced4da;position:relative;z-index:10;font-size:.875rem;border-radius:40px;display:-webkit-box;display:-ms-flexbox;display:flex;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center;-webkit-transition:all .2s linear;-moz-transition:all .2s linear;-ms-transition:all .2s linear;-o-transition:all .2s linear;transition:all .2s linear}.nav.nav-wizards-1 .nav-item .nav-link .nav-text{text-align:center;margin-top:.46875rem;font-weight:600;font-size:.75rem}.nav.nav-wizards-1 .nav-item .nav-link.active,.nav.nav-wizards-1 .nav-item .nav-link.completed{color:#348fe2}.nav.nav-wizards-1 .nav-item .nav-link.active .nav-no,.nav.nav-wizards-1 .nav-item .nav-link.completed .nav-no{border-color:#348fe2;color:#348fe2}.nav.nav-wizards-1 .nav-item .nav-link.active:after,.nav.nav-wizards-1 .nav-item .nav-link.active:before,.nav.nav-wizards-1 .nav-item .nav-link.completed:after,.nav.nav-wizards-1 .nav-item .nav-link.completed:before{background:#348fe2}.nav.nav-wizards-1 .nav-item .nav-link.active:after,.nav.nav-wizards-1 .nav-item .nav-link.completed:after{width:calc(50% - 20px)}.nav.nav-wizards-1 .nav-item .nav-link.active .nav-no{-webkit-box-shadow:0 0 0 5px rgba(52,143,226,.2);box-shadow:0 0 0 5px rgba(52,143,226,.2)}.nav.nav-wizards-1 .nav-item .nav-link.disabled{color:#adb5bd}.nav.nav-wizards-1 .nav-item .nav-link:after,.nav.nav-wizards-1 .nav-item .nav-link:before{content:'';position:absolute;top:1.6875rem;height:2px;background:#ced4da;left:0;right:calc(50% + 20px)}.nav.nav-wizards-1 .nav-item .nav-link:after{left:calc(50% + 20px);right:0;-webkit-transition:all .2s linear;-moz-transition:all .2s linear;-ms-transition:all .2s linear;-o-transition:all .2s linear;transition:all .2s linear}.nav.nav-wizards-1 .nav-item:first-child .nav-link:after,.nav.nav-wizards-1 .nav-item:first-child .nav-link:before{left:calc(50% + 20px)}.nav.nav-wizards-1 .nav-item:last-child .nav-link:before{right:calc(50% + 20px)}.nav.nav-wizards-1 .nav-item:last-child .nav-link.active:before,.nav.nav-wizards-1 .nav-item:last-child .nav-link.completed:before{background:#348fe2}.nav.nav-wizards-1 .nav-item:last-child .nav-link:after{display:none}.nav.nav-wizards-2{-webkit-flex-wrap:nowrap;-ms-flex-wrap:nowrap;flex-wrap:nowrap}.nav.nav-wizards-2 .nav-item{padding:0 1rem}.nav.nav-wizards-2 .nav-item .nav-link{position:relative;color:#2d353c;background:#e9ecef;border-radius:60px}.nav.nav-wizards-2 .nav-item .nav-link .nav-text{text-align:center;font-weight:600;font-size:.75rem;position:relative;z-index:10;background:inherit;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.nav.nav-wizards-2 .nav-item .nav-link:after,.nav.nav-wizards-2 .nav-item .nav-link:before{content:'';position:absolute;left:-1rem;right:-1rem;height:2px;top:50%;margin-top:-1px;background-color:#e9ecef;-webkit-transition:all .2s linear;-moz-transition:all .2s linear;-ms-transition:all .2s linear;-o-transition:all .2s linear;transition:all .2s linear}.nav.nav-wizards-2 .nav-item .nav-link:after{width:0%;background:#348fe2}.nav.nav-wizards-2 .nav-item .nav-link.disabled{color:#ced4da}.nav.nav-wizards-2 .nav-item .nav-link.active,.nav.nav-wizards-2 .nav-item .nav-link.completed{background:#348fe2;color:#fff}.nav.nav-wizards-2 .nav-item .nav-link.active:after,.nav.nav-wizards-2 .nav-item{}
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0px solid rgba(45,53,60,.15);
        border-radius: 4px;
    }

    .timeline-body {
        min-width: 0 !important;
    }
    .modal-content {
        width: 100%;
        height: 100%;
         margin: 0rem;
    }
    .modal-dialog {
        position: relative;
        width: auto;
        margin: 0rem;
        pointer-events: none;
    }
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title"><spring:message code="list.detail.update1" text="가상계좌번호 변경"/></h4>
                <div class="panel-heading-btn">
                </div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <div class="timeline-body">
                <div style="margin-left: 5px">
                    <form id="update_pwd_form" class="update_pwd_form d-inline">
                        <strong><spring:message code="list.detail.update1" text="은행명"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</strong>
                        <select class="form-control width-200 m-r-10 cybankTypeCode"  name="cybankTypeCode">
                        </select>
                        <br>
                        <br>
                        <strong><spring:message code="list.detail.update1" text="예금주명"/>&nbsp :</strong>
                        <input type="text" class="form-control width-200 cybankOwner m-r-10" name="cybankOwner">
                    </form>
                    <button type="button" class="btn btn-primary cyBankReset"><spring:message code="list.detail.update1" text="가상계좌 신규할당"/></button>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right cyBanckAccountCloseBtn" data-dismiss="modal"><spring:message code="list.detail.update1" text="닫기"/></button>
        </div>
    </div>
</div>
<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../common/include_common_js.jsp" %>
<%@include file="../../common/include_datatables.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../common/include_custom_js.jsp" %>
<script type="text/javascript">
    $(() => {
        $(document).on("click",".cyBanckAccountCloseBtn",function(){
            window.close();
        });
        $(document).on("click",".cyBankReset",function(){
            var cybankTypeCodeVal = $(".cybankTypeCode").val();
            var cybankOwner = $(".cybankOwner").val();
            var cybankTypeCodeTxt = $(".cybankTypeCode option:selected").text();

            if(cybankOwner == "" || cybankOwner == null){
                alert("가상계좌 예금주명을 입력해주세요.");
                return;
            } else {
                //가상계좌정보
                $.ajax({
                    type: "POST",
                    url: "${path}/api/workGroup/cybankAccount/reset",
                    data: {
                        cybankTypeCode : cybankTypeCodeVal,
                        owner : cybankOwner,
                        no : "${no}",
                        type : "${type}",
                        oldBankCode : "${oldBankCode}",
                        oldNo : "${oldNo}"
                    },
                    /*contentType: "application/json;",*/
                    dataType: "json",
                    success: function(data) {
                        if (data.result == 200) {
                            alert("가상계좌가 입력되었습니다.");
                            opener.$(".cybankTypeCode").val(cybankTypeCodeVal);
                            opener.$(".cybankTypeCodeTxt").val(cybankTypeCodeTxt);
                            opener.$(".cybankOwner").val(cybankOwner);
                            opener.$(".cybankAccount").val(data.cybankAccount);
                            window.close();
                        } else {
                            alert("가상계좌할당에 실패하였습니다.");
                            /*  opener.$(".cybankTypeCode").val("");
                              opener.$(".cybankTypeCodeTxt").val("");
                              opener.$(".cybankAccount").val("");*/
                        }

                    }
                });
            }
        });
        //가상계좌(입금)
        $.ajax({
            type: "POST",
            url: "${path}/api/system/code/list",
            data: {sysType : "CBT"},
            /*contentType: "application/json;",*/
            dataType: "json",
            success: function(data) {
                let list = data.systemCodeList;
                $(".cyBankTypeCode").html("");
                for(var i = 0 ; i < list.length ; i++){
                    $(".cyBankTypeCode").append(
                        "<option value="+list[i].sysCode+">"+list[i].codeName+"</option>"
                    )
                }
            }
        });

    });



</script>
