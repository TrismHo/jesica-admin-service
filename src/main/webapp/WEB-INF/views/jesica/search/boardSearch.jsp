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
        <div class="panel panel-inverse" style="margin-bottom: 5px">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title"><spring:message code="list.search.storesearch" text="게시글검색"/></h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
<%--            <form class="board_search_form">--%>
                <div style="width: 100%; display: flex; align-items: center">
                    <input type="text" class="form-control keyword ml-2" name="keyword" id="keyword" style="width: 55%;" placeholder="<spring:message code="list.description.pleaseenterthestorename" text="게시글 제목을 입력해주세요."/>" maxlength="150">
                    <input type="hidden" class="form-control ml-2 boardNo" name="boardNo" value="${searchValue.boardNo}">
                    <input type="button" class="btn btn-primary searchBoardBtn ml-2" value="<spring:message code="list.search.search" text="검색"/>">
                </div>
                <div class="list m-t-10" style="background-color: #e4e4e4;">
                    <ul class="searchBoardList">
                    </ul>
                </div>
<%--            </form>--%>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right boardModalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
