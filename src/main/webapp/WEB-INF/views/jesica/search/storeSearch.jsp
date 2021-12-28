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
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title"><spring:message code="list.search.storesearch" text="가맹점검색"/></h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <form class="store_search_form">
                <div style="width: 100%;">
                    <%--<select class="form-control searchHeadSelect">
                        <option value="name">명칭</option>
                        <option value="code">코드</option>
                    </select>--%>
                    <input type="text" class="form-control searchStoreText ml-2" name="storeName" style="width: 55%;" placeholder="<spring:message code="list.description.pleaseenterthestorename" text="가맹점명을 입력해주세요."/>" maxlength="150">
                    <%--<c:if test="${sessionScope.sessionKey.userRole == 0}">--%>
                        <input type="hidden" class="form-control ml-2 selHeadNo" name="headNo" value="${searchValue.headNo}">
                        <input type="hidden" class="form-control ml-2 selBranchNo" name="branchNo" value="${searchValue.branchNo}">
                        <input type="button" class="btn btn-primary searchStoreBtn" style="margin-bottom: 3px;" value="<spring:message code="list.search.search" text="검색"/>">
                    <%--</c:if>--%>
                    <c:if test="${sessionScope.sessionKey.userRole == 1}">
                        <input type="hidden" class="form-control ml-2 selHeadNo" name="headNo" value="${sessionScope.sessionKey.headNo}">
                        <input type="hidden" class="form-control ml-2 selBranchNo" name="branchNo" value="${searchValue.branchNo}">
                        <input type="button" class="btn btn-primary searchStoreBtn" style="margin-bottom: 3px;" value="<spring:message code="list.search.search" text="검색"/>">
                    </c:if>
                    <c:if test="${sessionScope.sessionKey.userRole == 2}">
                        <input type="hidden" class="form-control ml-2 selHeadNo" name="headNo" value="${sessionScope.sessionKey.headNo}">
                        <input type="hidden" class="form-control ml-2 selBranchNo" name="branchNo" value="${sessionScope.sessionKey.branchNo}">
                        <input type="button" class="btn btn-primary searchStoreBtn" style="margin-bottom: 3px;" value="<spring:message code="list.search.search" text="검색"/>">
                    </c:if>

                </div>
                <div class="list m-t-10" style="background-color: #e4e4e4;">
                    <ul class="searchStoreList">
                    </ul>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <%--<div style="margin-left: 190px;">
                <ul class="pagination">
                    <li class="paginate_button page-item disabled">
                        <a class="page-link" href="#">이전</a>
                    </li>
                    <c:forEach begin="1" end="5" varStatus="idx">
                        <c:choose>
                            <c:when test="${idx.index == '1'}">
                                <li class="paginate_button page-item active">
                                    <a href="#" class="page-link" style="">${idx.index}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="paginate_button page-item">
                                    <a href="#" class="page-link" style="">${idx.index}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <li class="paginate_button page-item">
                        <a class="page-link" href="#">다음</a>
                    </li>
                </ul>
            </div>--%>
            <button type="button" class="btn btn-grey float-right storeModalCloseBtn" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
