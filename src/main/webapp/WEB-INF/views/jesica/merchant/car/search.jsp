<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    .list li {
        padding: 8px;
        margin-top: 10px;
        background: #F9F9F9;
    }
    .list {height: 370px; overflow-y: auto;}
    .modal-footer {display: block;}
    a.page-link {padding: 5px 10px;}
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">제휴본사검색</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body p-5">
            <div class="width-full">
                <select class="form-control">
                    <option>명칭</option>
                    <option>코드</option>
                </select>
                <input type="text" class="form-control w-75">
            </div>
            <div class="list m-t-10">
                <ul>
                    <c:forEach begin="1" end="10" varStatus="idx">
                        <li>
                            <label>
                                테스트본사${idx.index}
                                <small class="text-green">[a12345]</small>
                            </label>
                            <div class="float-right"><button type="button" class="btn btn-primary height-25 line-height-9">적용</button></div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
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
            <button type="button" class="btn btn-grey float-right" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
