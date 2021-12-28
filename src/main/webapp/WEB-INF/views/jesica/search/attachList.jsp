<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    /*.modal-body {
        background: #e0e0e0;
    }*/
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

    @media (min-width: 992px){
        .modal-lg, .modal-xl {
            max-width: 1030px;
        }
    }
    .offcanvas{transition:none}}.offcanvas-header{display:flex;align-items:center;justify-content:space-between;padding:.9375rem .9375rem}.offcanvas-header .btn-close{padding:.46875rem .46875rem;margin-top:-.46875rem;margin-right:-.46875rem;margin-bottom:-.46875rem}.offcanvas-title{margin-bottom:0;line-height:1.5}.offcanvas-body{flex-grow:1;padding:.9375rem .9375rem;overflow-y:auto}.offcanvas-start{top:0;left:0;width:400px;border-right:0 solid rgba(0,0,0,.2);transform:translateX(-100%)}.offcanvas-end{top:0;right:0;width:400px;border-left:0 solid rgba(0,0,0,.2);transform:translateX(100%)}.offcanvas-top{top:0;right:0;left:0;height:30vh;max-height:100%;border-bottom:0 solid rgba(0,0,0,.2);transform:translateY(-100%)}.offcanvas-bottom{right:0;left:0;height:30vh;max-height:100%;border-top:0 solid rgba(0,0,0,.2);transform:translateY(100%);}.offcanvas.show{transform:none}.clearfix::after{display:block;clear:both;content:""}.link-default{color:#e9ecef}.link-default:focus,.link-default:hover{color:#edf0f2}.link-inverse{color:#2d353c}.link-inverse:focus,.link-inverse:hover{color:#242a30}.link-primary{color:#00acac}.link-primary:focus,.link-primary:hover{color:#33bdbd}
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">가입신청내역</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <form class="store_search_form">
                <div class="row">
                    <div class="col-xl-12 ui-sortable">
                        <div class="panel-body">
                            <div class="nav-wizards-container" style="height: 100px;">
                                <nav class="nav nav-wizards-1 mb-2" style="width: 25%;float: left;">
                                    <table id="user" class="table table-bordered table-panel mb-0">
                                        <tr>
                                            <td><img style="width: 177px;height: 95px;" class="profileImg" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'"></td>
                                        </tr>
                                        <tr>
                                            <td>프로필 사진</td>
                                        </tr>
                                    </table>
                                </nav>
                                <nav class="nav nav-wizards-1 mb-2" style="width: 75%;float: right;">
                                    <div class="nav-item col">
                                        <a class="nav-link completed enrollment_1" href="#">
                                            <div class="nav-no">1</div>
                                            <div class="nav-text">미등록</div>
                                        </a>
                                    </div>
                                    <div class="nav-item col">
                                        <a class="nav-link active enrollment_2" href="#">
                                            <div class="nav-no">2</div>
                                            <div class="nav-text">신청</div>
                                        </a>
                                    </div>
                                    <div class="nav-item col">
                                        <a class="nav-link disabled enrollment_3" href="#">
                                            <div class="nav-no">3</div>
                                            <div class="nav-text">승인</div>
                                        </a>
                                    </div>
                                    <div class="nav-item col">
                                        <a class="nav-link disabled enrollment_4" href="#">
                                            <div class="nav-no">4</div>
                                            <div class="nav-text ">반려</div>
                                        </a>
                                    </div>
                                </nav>
                                <nav class="nav nav-wizards-1 mb-2" style="width: 75%;float: right;">
                                    <div class="nav-item col" style="padding-left: 20px;padding-right: 20px;">
                                        <table id="testTable" class="display table table-bordered w-100 table-striped ">
                                            <thead>
                                            </th>
                                                <th class="text-center" style="width: 10%;">계정생성여부</th>
                                                <th class="text-center" style="width: 8%;">이름</th>
                                                <th class="text-center" style="width: 12%;">SMS수신여부</th>
                                                <th class="text-center" style="width: 12%;">프로필 승인여부</th>
                                                <th class="text-center" style="width: 14%;">경력확인서 승인여부</th>
                                                <th class="text-center" style="width: 14%;">면허증 승인여부</th>
                                            </thead>
                                            <tbody>
                                                <tr class="">
                                                    <td class="text-center signYn"></td>
                                                    <td class="text-center name"></td>
                                                    <td class="text-center smsYn"></td>
                                                    <td class="text-center profileAuthStatus"></td>
                                                    <td class="text-center careerAuthStatus"></td>
                                                    <td class="text-center licenseAuthStatus"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 ui-sortable">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xl-6 ui-sortable">
                                <div class="card">
                                <div class="card-bod">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="user" class="table table-bordered table-panel mb-0">
                                                <tbody>
                                                <tr>
                                                    <td class="bg-light" width="30%;">업종</td>
                                                    <td><span class="serviceType"></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light">주민번호</td>
                                                    <td><span class="residentNum"></span>-*******</td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light">휴대폰번호</td>
                                                    <td><span class="phone"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light">면허증사진</td>
                                                    <td><img style="height: 88px;" class="licenseFile" src="" onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'"></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </div>
                                <div class="col-xl-6 ui-sortable">
                                <div class="card">
                                <div class="card-bod">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="user" class="table table-bordered table-panel mb-0">
                                                <tbody>
                                                <tr>
                                                    <td class="bg-light" width="30%;">면허번호</td>
                                                    <td><span class="licenseNum"></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light">면허종류</td>
                                                    <td><span class="licenseType"></span></td>
                                                </tr>
                                                    <td class="bg-light">면허갱신마감일</td>
                                                    <td><span class="licenseExpDate"></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light" >경력확인서 파일</td>
                                                    <td><span class="careerFileDown m-r-5"></span>
                                                        <a class="careerFile"><i class="fas fa-lg fa-fw me-10px fa-download" style="cursor: pointer;">
                                                        </i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light">등록일시</td>
                                                    <td><span class="insertDate m-r-5"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bg-light">최종승인일</td>
                                                    <td><span class="authDate m-r-5"></span>
                                                    </td>
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
                <div class="panel-body p-t-20">
                    <table id="testTable" class="display table table-bordered w-100 table-striped ">
                        <thead>
                        <th class="text-center" style="width: 50px"><spring:message code="list.word.no" text="순번"/></th>
                        <th class="text-center" style="width: 78px">제출서류구분</th>
                        <th class="text-center" style="width: 80px">승인상태</th>
                        <th class="text-center" style="width: 98px">프로필/면허증 이미지</th>
                        <th class="text-center" style="width: 90px;">승인/반려자</th>
                        <th class="text-center" style="width: 87px;">승인/반려일시</th>
                        <th class="text-center" style="width: 98px;">등록일시</th>
                        <th class="text-center" style="width: 130px;"></th>
                        </thead>
                    </table>
                </div>
                <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e;">
                    <ul class="attachList p-0" >
                    </ul>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right storeModalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>

