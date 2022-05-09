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
    .optionTable td {padding: 10px; font-size: 11px;}
    .optionTable input[type=radio] {vertical-align: middle; margin-right: 2px;}
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">검색옵션</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <div class="col-xl-12 col-md-12">
                <table class="table table-condensed table-bordered optionTable">
                    <tbody>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search2" text="default text"/></strong></td>
                        <td>
                            <input type="radio" name="1" checked><spring:message code="merchandise.search2.option1" text="default text"/>
                            <input type="radio" name="1"><spring:message code="merchandise.search2.option2" text="default text"/>
                            <input type="radio" name="1"><spring:message code="merchandise.search2.option3" text="default text"/>
                            <input type="radio" name="1"><spring:message code="merchandise.search2.option4" text="default text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search3" text="default text"/></strong></td>
                        <td>
                            <input type="radio" name="2" checked><spring:message code="merchandise.search3.option1" text="default text"/>
                            <input type="radio" name="2"><spring:message code="merchandise.search3.option2" text="default text"/>
                            <input type="radio" name="2"><spring:message code="merchandise.search3.option3" text="default text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search4" text="default text"/></strong></td>
                        <td>
                            <input type="radio" name="3" checked><spring:message code="merchandise.search4.option1" text="default text"/>
                            <input type="radio" name="3"><spring:message code="merchandise.search4.option2" text="default text"/>
                            <input type="radio" name="3"><spring:message code="merchandise.search4.option3" text="default text"/>
                            <input type="radio" name="3"><spring:message code="merchandise.search4.option4" text="default text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search5" text="default text"/></strong></td>
                        <td>
                            <input type="radio" name="4" checked><spring:message code="merchandise.search5.option1" text="default text"/>
                            <input type="radio" name="4"><spring:message code="merchandise.search5.option2" text="default text"/>
                            <input type="radio" name="4"><spring:message code="merchandise.search5.option3" text="default text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search6" text="default text"/></strong></td>
                        <td>
                            <input type="radio" name="5" checked><spring:message code="merchandise.search6.option1" text="default text"/>
                            <input type="radio" name="5"><spring:message code="merchandise.search6.option2" text="default text"/>
                            <input type="radio" name="5"><spring:message code="merchandise.search6.option3" text="default text"/>
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search7" text="default text"/></strong></td>
                        <td>
                            <input type="radio" name="6" checked><spring:message code="merchandise.search7.option1" text="default text"/>
                            <input type="radio" name="6"><spring:message code="merchandise.search7.option2" text="default text"/>
                            <input type="radio" name="6"><spring:message code="merchandise.search7.option3" text="default text"/>
                            <input type="radio" name="6"><spring:message code="merchandise.search7.option4" text="default text"/>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search2" text="default text"/></strong></td>
                        <td>
                            <label>
                                <select class="form-control">
                                    <option><spring:message code="merchandise.search2.option1" text="default text"/></option>
                                    <option><spring:message code="merchandise.search2.option2" text="default text"/></option>
                                    <option><spring:message code="merchandise.search2.option3" text="default text"/></option>
                                    <option><spring:message code="merchandise.search2.option4" text="default text"/></option>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search3" text="default text"/></strong></td>
                        <td>
                            <label>
                                <select class="form-control">
                                    <option><spring:message code="merchandise.search3.option1" text="default text"/></option>
                                    <option><spring:message code="merchandise.search3.option2" text="default text"/></option>
                                    <option><spring:message code="merchandise.search3.option3" text="default text"/></option>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light"><strong><spring:message code="merchandise.search4" text="default text"/></strong></td>
                        <td>
                            <label>
                                <select class="form-control">
                                    <option><spring:message code="merchandise.search4.option1" text="default text"/></option>
                                    <option><spring:message code="merchandise.search4.option2" text="default text"/></option>
                                    <option><spring:message code="merchandise.search4.option3" text="default text"/></option>
                                    <option><spring:message code="merchandise.search4.option4" text="default text"/></option>
                                </select>
                            </label>
                        </td>
                    </tr>--%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary float-right m-r-5" data-dismiss="modal">적용</button>
        </div>
    </div>
</div>
