<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">렌탈등록</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body p-5">
            <div class="p-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light">종류</td>
                        <td>
                            <select class="form-control">
                                <option>리스비</option>
                                <option>미수금</option>
                                <option>수리비</option>
                                <option>가불</option>
                                <option>기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light">일비차감시점</td>
                        <td>
                            <label class="font-size-10">
                                <input type="radio" name="status14" class="align-bottom" checked>정산시<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                            </label>
                            <label class="m-l-10 font-size-10">
                                <input type="radio" name="status14" class="align-bottom">출근시<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light">기간</td>
                        <td>
                            <label>
                                <input type="text" class="form-control startDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                            </label>
                            ~
                            <label>
                                <input type="text" class="form-control endDate background-white" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light">금액</td>
                        <td>
                            <input type="text" class="form-control">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="modal-footer d-block">
            <button type="button" class="btn btn-grey float-right m-r-5" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary insert_rental_btn float-right m-r-5" data-dismiss="modal">등록</button>
        </div>
    </div>
</div>
