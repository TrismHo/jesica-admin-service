<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    ul {
        list-style: none;
        padding: 0 4px;
    }
    .modal-footer {display: block;}
    a.page-link {padding: 5px 10px;}
    .btn-box-r {
        color: #717171!important;
        display: inline-block;
        /* display: inline; */
        zoom: 0;
        text-decoration: none;
        padding: 0px 10px 0px 10px;
        line-height: 26px;
        min-width: 60px;
        text-align: center;
        font-size: 12px;
        border-radius: 5px;
        text-shadow: 0 1px 0 #fff;
        border: 1px solid #e7e7e7;
        cursor: pointer;
    }
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">신청내역</h4>
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
            </div>
            <div class="p-10">
                <table class="table table-condensed table-bordered">
                    <thead>
                        <tr>
                            <th class="width-200">날짜</th>
                            <th>메모</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2021-01-11 04:50:04</td>
                            <td>테스트 내용</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right m-r-5" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>
