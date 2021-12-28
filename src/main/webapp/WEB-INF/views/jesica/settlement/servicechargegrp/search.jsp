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
                <div class="panel-heading-btn">
                    <a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <div style="width: 100%;">
                <select class="form-control">
                    <option>명칭</option>
                    <option>코드</option>
                </select>
                <input type="text" class="form-control" style="width: 75%;">
            </div>
            <div class="list m-t-10">
                <ul>
                    <c:forEach begin="1" end="10" varStatus="idx">
                        <li>
                            <label>
                                테스트본사${idx.index}
                                <small style="color: green;">[a12345]</small>
                            </label>
                            <div class="float-right"><button type="button" class="btn btn-primary" style="height: 25px; line-height: 9px;">적용</button></div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
