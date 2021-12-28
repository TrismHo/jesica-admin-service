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
        padding: 8px;
        margin-top: 4px;
        background: #F9F9F9;
    }
    .list {height: 370px; overflow-y: auto;}
    .modal-footer {display: block;}
    a.page-link {padding: 5px 10px;}
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">총판검색</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <form class="branch_search_form">
                <div style="width: 100%;">
                    <%--<select class="form-control searchHeadSelect">
                        <option value="name">명칭</option>
                        <option value="code">코드</option>
                    </select>--%>
                    <input type="text" class="form-control searchBranchText ml-2" name="branchName" style="width: 55%;" placeholder="총판명을 입력해주세요.">
                    <input type="hidden" class="form-control ml-2 selHeadNo" name="headNo" value="${searchValue.headNoText}">
                    <input type="button" class="btn btn-primary searchBranchBtn" style="margin-bottom: 3px;" value="검색">
                </div>
                <div class="list m-t-10" style="background-color: #e4e4e4;">
                    <ul class="searchBranchList">
                    </ul>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right branchModalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
