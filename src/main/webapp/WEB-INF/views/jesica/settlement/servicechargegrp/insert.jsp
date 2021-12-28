<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title"><spring:message code="list.detail.groupregistration" text="그룹 등록"/></h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body">
            <div class="panel-body">
                <div class="col-xl-12 col-md-12">
                    <form class="head_sel_search_form form-horizontal" id="head_sel_search_form">
                        <input type="hidden" class="insertUserId" name="insertUserId" value="${sessionScope.sessionKey.userLoginId}">
                        <table class="table table-condensed table-bordered">
                            <tbody>
                                <tr>
                                    <td class="bg-light" style="min-width: 70px;"><strong><spring:message code="list.detail.managementdistributor" text="관리총판"/></strong></td>
                                    <td style="min-width: 220px;">
                                        <label>
                                                <select class="form-control width-150 selSearchHeadList headNo" name="headNo" readonly="">
                                                </select>
                                        </label>
                                        <label>
                                            <select class="form-control width-150 selSearchBranchList branchNo" name="branchNo" readonly="">
                                                <option value=""><spring:message code="list.detail.pleaseselectadistributor" text="총판을 선택해주세요"/></option>
                                            </select>
                                        </label>
                                    </td>
                                    <td class="bg-light" style="min-width: 80px;"><strong><spring:message code="list.detail.settlementgroupname" text="정산 그룹명"/><%--<spring:message code="merchandise.search9" text="default text"/>--%><%--검색어 입력--%></strong></td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-150 chargeName" name="chargeName" maxlength="75" <%--style="width: 200px;"--%>> <%--<i style="padding: 9px;" class="fas fa-lg fa-fw m-r-15 fa-plus-circle detailOptionBtn"></i>--%>
                                        </label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary save_btn float-right"><spring:message code="list.detail.save" text="저장"/></button>
            <button type="button" class="btn btn-grey float-right m-r-10" data-dismiss="modal"><spring:message code="list.detail.cancel" text="닫기"/></button>
        </div>
    </div>
</div>
