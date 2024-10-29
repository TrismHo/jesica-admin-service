<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    /*.modal-body {
        background: #e0e0e0;
    }*/
    .dataTables_paginate li {
        padding: 0px;
        background: #F9F9F9;
    }
    .list {height: 550px; overflow-y: auto;}
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
    @media (min-width: 992px){
        .modal-lg, .modal-xl {
            max-width: 1030px;
        }
    }
    @media (max-width: 1920px) {
        .modal-content {
            width: 100%;
        }
    }
    .cust-list th ,
    .cust-list td {
        padding: 5px 2px 5px 10px;
    }
    .icon-arrow {
        border: 1px solid #ddd;
        padding: 5px 27px 5px 16px;
        background-color: azure;
        border-radius: 5px;
        cursor: pointer;
    }
    .icon-arrow:hover {
        color: #ddd;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td {
        border-bottom-width: 1px;
    }

    .offcanvas{transition:none}}.offcanvas-header{display:flex;align-items:center;justify-content:space-between;padding:.9375rem .9375rem}.offcanvas-header .btn-close{padding:.46875rem .46875rem;margin-top:-.46875rem;margin-right:-.46875rem;margin-bottom:-.46875rem}.offcanvas-title{margin-bottom:0;line-height:1.5}.offcanvas-body{flex-grow:1;padding:.9375rem .9375rem;overflow-y:auto}.offcanvas-start{top:0;left:0;width:400px;border-right:0 solid rgba(0,0,0,.2);transform:translateX(-100%)}.offcanvas-end{top:0;right:0;width:400px;border-left:0 solid rgba(0,0,0,.2);transform:translateX(100%)}.offcanvas-top{top:0;right:0;left:0;height:30vh;max-height:100%;border-bottom:0 solid rgba(0,0,0,.2);transform:translateY(-100%)}.offcanvas-bottom{right:0;left:0;height:30vh;max-height:100%;border-top:0 solid rgba(0,0,0,.2);transform:translateY(100%);}.offcanvas.show{transform:none}.clearfix::after{display:block;clear:both;content:""}.link-default{color:#e9ecef}.link-default:focus,.link-default:hover{color:#edf0f2}.link-inverse{color:#2d353c}.link-inverse:focus,.link-inverse:hover{color:#242a30}.link-primary{color:#00acac}.link-primary:focus,.link-primary:hover{color:#33bdbd}
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">자료등록</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <div class="row">
                <div class="col-xl-12 ui-sortable">
                    <div class="panel-body">
                        <div style="width: 100%;">
                            <form class="form-coupon-search" name="libraryForm">
                                <div class="search-box">
                                    <div class="inner-search-box p-15">
                                        <div class="row">
                                            <div class="col-xl-12 col-md-12 ">
                                                <input type="hidden" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                                                <input type="hidden" name="insertUserName" value="${sessionScope.sessionKey.userStaffName}">
                                                <input type="hidden" name="appCode" value="${sessionScope.sessionKey.appCode}">
                                                <table  class="table table-condensed table-bordered">
                                                    <tbody>
                                                        <tr >
                                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification1" text="문서명"/></strong></td>
                                                            <td colspan="">
                                                                <input type="text" class="form-control width-250 fileTitle" name="fileTitle" placeholder="문서명을 입력해주세요">
                                                            </td>
                                                            <td class="bg-light"><strong><spring:message code="list.search.postclassification1" text="문서타입"/></strong></td>
                                                            <td colspan="">
                                                                <label>
                                                                    <select class="form-control fileType" id="fileType" name="fileType">
                                                                        <option value="1">공통</option>
                                                                        <option value="2">총판</option>
                                                                        <option value="3">사용자</option>
                                                                    </select>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                       <tr>
                                                           <td class="bg-light"><strong><spring:message code="list.search.postclassification1" text="문서내용"/></strong></td>
                                                            <td colspan="3">
                                                                <textarea class="w-100 form-control" id="fileBody" name="fileBody" placeholder="문서내용을 입력해주세요"></textarea>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="m-l-15">
                            <label for="libFile">
                                <div class="button_base b03_skewed_slide_in btn btn-primary">
                                    <div> <spring:message code="list.detail.selectfile" text="파일선택"/> </div>
                                </div>
                            </label>
                            <form method="POST" id="multiForm" onsubmit="return false;" enctype="multipart/form-data">
                                <input type="file" id="libFile" onchange="addFile(this);" multiple  name="imgFile1" class="fileBtn d-none" accept="*"  >
                            </form>
                            <%--<input type="button" class="btn btn-danger" id="deleteFile" value="선택파일 삭제">--%>
                            <div class="insert">

                                   <%-- <input type="file" onchange="addFile(this);" multiple />--%>
                                   <%-- <div class="file-list"></div>--%>

                            </div>

                        </div>
                        <div class="list m-t-5">
                                <div class="col-xl-12 ui-sortable">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xl-6 ui-sortable">
                                                <div class="card">
                                                    <div class="card-bod">
                                                        <div class="panel-body p-t-20">
                                                            <table id="searchCustTable" class="display table table-bordered w-100 table-striped cust-list ">
                                                                <thead>
                                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="파일명"/></th>
                                                                    <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no1" text="파일크기"/></th>
                                                                    <th class="text-center" style="width: 30px;" ></th>
                                                                </thead>
                                                                <tbody id="file-list" class="file-list" style="">
                                                                   <%-- <tr><td colspan="4" style="text-align: center; background-color: #e4e4e4; border:1px solid #9e9e9e; height: 498px;">파일이 없습니다.</td> </tr>--%>
                                                                    <tr class="none-file">
                                                                        <td colspan="4" class="text-center ">파일이 존재하지 않습니다.</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <%--<input type="button" class="btn btn-info m-r-15 float-right" id="cpnAlarmBtn" value="지급알림발송">--%>
            <button type="button" class="btn btn-info btn_remove float-right m-l-5 insertLibrary" ><i class="fa fa-plus-circle m-r-3"></i> <spring:message code="list.detail.delete" text="등록하기"/></button>
            <button type="button" class="btn btn-grey float-right libModalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>


