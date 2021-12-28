<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    /*.category_sort .sort_list {
        overflow: hidden;
        list-style: none;
        padding-left: 0px;
    }

    .category_sort .sort_list > li:first-child {
        margin-left: 0;
        list-style: none;
        padding-left: 0px;
    }

    .category_sort .sort_list > li {
        float: left;
        width: 515px;
        margin-left: 26px;
        line-height: 11px;
    }

    .category_sort .sort_list .header {
        padding: 15px 0;
        background-color: #65717c;
        font-size: 14px;
        color: #fff;
        text-align: center
    }

    .category_sort .sort_body {
        overflow: auto;
        height: 250px;
        width: 330px;
        border: 1px solid #ccc;
        list-style: none;
        padding-left: 0px;
        background-color: #f9f9fc;
    }

    .category_sort .sort_body .active {
        background-color: #0a6ebd;
    }

    .category_sort .sort_body_list li:first-child {
        border-top: 0
    }

    .category_sort .sort_body_list li {
        padding: 2px 18px;
        border-top: 1px solid #e1e1e1;
        list-style: none;
    }

    .category_sort .sort_body_list li .sort_content {
        overflow: hidden;
    }

    .category_sort .sort_body_list li:hover {
        background-color: #d3e3f2;
    }
    !*       .category_sort ._active {
               background-color: #d3e3f2;
           }*!

    .category_sort .sort_body_list li:hover .category_num {
        !*background-color: #ff004d;*!
    }

    .category_sort .sort_body_list .category_title {
        float: left;
        padding: 4px 0
    }

    .category_sort .sort_body_list .category_right {
        float: right
    }

    .category_sort .sort_body_list .category_num {
        display: inline-block;
        width: 26px;
        height: 26px;
        !*background-color: black;*!
        background-color: #455663;
        line-height: 26px;
        color: #fff;
        text-align: center
    }
    .category_sort .sort_body_list .category_num_after {
        display: inline-block;
        width: 26px;
        height: 26px;
        border-radius: 100%;
        !*background-color: #455663;*!
        line-height: 26px;
        !*color: #fff;*!
        text-align: center
    }

    .category_sort .sort_ag .asc, .category_sort .sort_ag .desc {
        float: left;
        width: 26px;
        height: 26px;
        background: url(../../img/bg_psn_attr.png) 100% 0 no-repeat;
        text-indent: -9999px
    }

    .category_sort .sort_ag .desc {
        background-position: 100% 100%
    }

    .category_sort .sort_ag .sort_order {
        position: absolute;
        top: 4px;
        right: 22px;
        width: 103px;
        padding: 3px 0;
        border: 1px solid #ccc;
        background-color: #1f2b5d;
        font-weight: bold;
        color: #fff;
        text-align: center
    }*/
    ul {
        list-style: none;
        padding: 0 4px;
    }
    /*.modal-body {
        background: #e0e0e0;
    }*/
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
