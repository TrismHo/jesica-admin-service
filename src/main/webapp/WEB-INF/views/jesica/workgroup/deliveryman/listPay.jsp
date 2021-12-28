<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">페이내역</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <div class="p-10">
                <label>
                    <input type="text" class="form-control startDate" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw fa-calendar-alt date"></i>
                </label>
                ~
                <label>
                    <input type="text" class="form-control endDate" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                </label>
                <label>
                    <button class="btn-box-r">검색</button>
                </label>
                <label>
                    <button class="btn-box-r">엑셀다운</button>
                </label>
            </div>
            <div class="p-10">
                <table class="table table-condensed table-bordered">
                    <thead>
                        <tr>
                            <th>날짜</th>
                            <th>메모</th>
                            <th>입/출금 금액</th>
                            <th>남은 금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2021-01-11 04:50:04</td>
                            <td>일별 마감잔액</td>
                            <td>0원</td>
                            <td>1000000원</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-footer d-block">
            <button type="button" class="btn btn-grey float-right m-r-5" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
