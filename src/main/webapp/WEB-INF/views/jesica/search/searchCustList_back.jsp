<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    /*.modal-body {
        background: #e0e0e0;
    }*/
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
    .offcanvas{transition:none}}.offcanvas-header{display:flex;align-items:center;justify-content:space-between;padding:.9375rem .9375rem}.offcanvas-header .btn-close{padding:.46875rem .46875rem;margin-top:-.46875rem;margin-right:-.46875rem;margin-bottom:-.46875rem}.offcanvas-title{margin-bottom:0;line-height:1.5}.offcanvas-body{flex-grow:1;padding:.9375rem .9375rem;overflow-y:auto}.offcanvas-start{top:0;left:0;width:400px;border-right:0 solid rgba(0,0,0,.2);transform:translateX(-100%)}.offcanvas-end{top:0;right:0;width:400px;border-left:0 solid rgba(0,0,0,.2);transform:translateX(100%)}.offcanvas-top{top:0;right:0;left:0;height:30vh;max-height:100%;border-bottom:0 solid rgba(0,0,0,.2);transform:translateY(-100%)}.offcanvas-bottom{right:0;left:0;height:30vh;max-height:100%;border-top:0 solid rgba(0,0,0,.2);transform:translateY(100%);}.offcanvas.show{transform:none}.clearfix::after{display:block;clear:both;content:""}.link-default{color:#e9ecef}.link-default:focus,.link-default:hover{color:#edf0f2}.link-inverse{color:#2d353c}.link-inverse:focus,.link-inverse:hover{color:#242a30}.link-primary{color:#00acac}.link-primary:focus,.link-primary:hover{color:#33bdbd}
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">쿠폰일괄지급</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <form class="form-coupon-search">
                <div class="row">
                    <div class="col-xl-12 ui-sortable">
                        <div class="panel-body">
                            <div class="m-l-15">
                                사용할 쿠폰


                                <%--<input type="text" class="form-control width-250" readonly placeholder="사용할 쿠폰을 선택해주세요.">--%>
                                <label class=" m-l-10">
                                    <select class="form-control width-250 selectCoupon">
                                        <option>쿠폰을 선택해주세요.</option>
                                    </select>
                                    <%--<button type="button" data-toggle="modal" data-target="#select_coupon_list" class="insert_btn btn btn-primary">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="쿠폰검색"/></span>
                                    </button>--%>
                                    <%--<button type="button" data-toggle="modal" data-target="#select_coupon_list" class="insert_btn btn btn-primary">
                                        <span class="fa fa-plus">&nbsp;<spring:message code="list.search.noticeregistration1" text="쿠폰검색"/></span>
                                    </button>--%>
                                </label>

                            </div>

                                <div style="width: 100%;">
                                    <div class="search-box">
                                        <div class="inner-search-box p-15">
                                            <div class="row">
                                                <div class="col-xl-12 col-md-12 ">
                                                        <table class="table table-condensed table-bordered">
                                                            <tbody>
                                                            <tr >
                                                                <td class="bg-light"><strong><spring:message code="list.search.postclassification1" text="회원여부"/></strong></td>
                                                                <td>
                                                                    <label>
                                                                        <select class="form-control" name="isMember">
                                                                            <%--<option value="" <c:if test="${searchValue.isMember == ''  || searchValue.isMember == null}">selected</c:if>><spring:message code="list.search.all12" text="전체"/></option>--%>
                                                                            <option value="1" <c:if test="${searchValue.isMember == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters12" text="회원"/></option>
                                                                            <option value="0" <c:if test="${searchValue.isMember == '0'}">selected</c:if>><spring:message code="list.search.deliverymanname12" text="비회원"/></option>
                                                                        </select>
                                                                    </label>
                                                                </td>
                                                                <td class="bg-light"><strong><spring:message code="list.search.postclassification" text="플랫폼 구분"/></strong></td>
                                                                <td style="width: 400px">
                                                                    <label>
                                                                        <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                                                                            <select class="form-control" name="platformType">
                                                                                <option value="1" <c:if test="${searchValue.platformType == '1'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="제시카"/></option>
                                                                            </select>
                                                                        </c:if>
                                                                        <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                                                                            <select class="form-control" name="platformType">
                                                                                <option value="2" <c:if test="${searchValue.platformType == '2'}">selected</c:if>><spring:message code="list.search.affiliatedheadquarters1" text="PICK오더"/></option>
                                                                            </select>
                                                                        </c:if>
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="bg-light"><strong><spring:message code="list.search.registrationperiod1" text="가입기간"/><%--등록기간--%></strong></td>
                                                                <td>
                                                                    <label>
                                                                        <input type="text" class="form-control startDate background-white"  name="startDate" value="${searchValue.startDate}" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i> ~ &nbsp;
                                                                    </label>
                                                                    <label>
                                                                        <input type="text" class="form-control endDate background-white" name="endDate" value="${searchValue.endDate}" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                                                                    </label>
                                                                </td>
                                                                <td class="bg-light"><strong><spring:message code="list.search.searchword1" text="검색어 입력"/><%--검색어 입력--%></strong></td>
                                                                <td style="border-right: none">
                                                                    <label>
                                                                        <select class="form-control searchOp" name="keywordType" style="width: 110px">
                                                                            <option value="custName" <c:if test="${searchValue.keywordType == 'custName'}">selected</c:if>><spring:message code="list.search.title1" text="이름"/></option>
                                                                            <option value="custTel" <c:if test="${searchValue.keywordType == 'custTel'}">selected</c:if>><spring:message code="list.search.title2" text="전화번호"/></option>
                                                                        </select>
                                                                        <input type="text" class="form-control width-150" name="keyword" value="${searchValue.keyword}" maxlength="150">
                                                                        <input type="button" class="btn btn-primary searchCustCouponList" style="margin-bottom: 3px;" value="검색">
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="list m-t-10">
                                    <div class="col-xl-12 ui-sortable">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xl-6 ui-sortable">
                                                    <div class="card">
                                                        <div class="card-bod">
                                                            <div class="panel-body p-t-20">
                                                                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                                                                    <thead>
                                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no" text="이름"/></th>
                                                                        <th class="text-center" ><spring:message code="list.word.no" text="연락처"/></th>
                                                                        <th class="text-center" style="width: 70px"></th>
                                                                    </thead>
                                                                </table>
                                                            </div>
                                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e; height: 500px;">
                                                                <ul class=" p-0" >
                                                                    <li class="p-0">
                                                                        <div class="panel-body">
                                                                            <table class="display table  w-100 table-striped cust-list ">
                                                                                <tbody id="cust-none-select">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 ui-sortable">
                                                    <div class="card">
                                                        <div class="card-bod">
                                                            <div class="panel-body p-t-20">
                                                                <table id="testTable" class="display table table-bordered w-100 table-striped ">
                                                                    <thead>
                                                                        <th class="text-center" style="width: 150px;" ><spring:message code="list.word.no" text="이름"/></th>
                                                                        <th class="text-center" ><spring:message code="list.word.no" text="쿠폰이 지급될 리스트"/></th>
                                                                        <th class="text-center" style="width: 70px"></th>
                                                                    </thead>
                                                                </table>
                                                            </div>
                                                            <div class="list m-t-0" style="background-color: #e4e4e4; border:1px solid #9e9e9e; height: 500px;">
                                                                <ul class="attachList p-0" >
                                                                    <li class="p-0">
                                                                        <div class="panel-body">
                                                                            <table  class="display table  w-100 table-striped cust-list ">
                                                                                <tbody id="cust-select">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </li>
                                                                </ul>
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
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-info btn_remove float-right m-l-5 cpnAllBtn" ><i class="fa fa-plus-circle m-r-3"></i> <spring:message code="list.detail.delete" text="쿠폰일괄지급"/></button>
            <button type="button" class="btn btn-grey float-right storeModalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>


