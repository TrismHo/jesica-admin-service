<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<style>
    .list li {
        padding: 8px;
        margin-top: 10px;
        background: #F9F9F9;
    }
    .list {height: 55px; overflow-y: auto;}
    .modal-footer {display: block;}
    a.page-link {padding: 5px 10px;}
    @media (max-width: 1920px) {
        .modal-content {
            width: 100%;
        }
    }
</style>

<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="panel panel-inverse">
            <div class="panel-heading ui-sortable-handle"><h4 class="panel-title">주문취소</h4>
                <div class="panel-heading-btn"><a href="javascript:;"
                                                  class="btn btn-xs btn-icon btn-circle btn-danger"
                                                  data-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times"></i></a></div>
            </div>
        </div>
        <div class="modal-body" style="padding: 5px;">
            <input type="hidden" >
          <%--  <div style="width: 100%;">
                <select class="form-control">
                    &lt;%&ndash;<option>부분취소</option>&ndash;%&gt;
                    <option>전체취소</option>
                </select>
            </div>--%>
            <div class="list m-t-10">
                <form class="cancelForm" id="cancelForm">
                    <input type="hidden" class="calcelOrderNo" value="${tbPayApproval.orderNo}">
                    <c:if test='${tbOrder != ""}'>
                        <input type="hidden" class="orderStatusCode" value="${tbOrder.orderStatusCode}">
                    </c:if>
                    <c:if test='${tbOrder == ""}'>
                        <input type="hidden" class="orderStatusCode" value="">
                    </c:if>

                    <table class="table table-condensed table-bordered">
                        <input type="hidden" value="${sessionScope.sessionKey.userRole}" class="userType" name="userType">
                        <input type="hidden" value="${sessionScope.sessionKey.userStaffNo}" class="userNo" name="userNo">
                     <%--   <tr>
                            <td class="bg-light width-250">주문변경상태</td>
                            <td><input type="text" value="RECEPTION" class="orderStatus" name="orderStatus"></td>
                        </tr>--%>
                        <c:if test='${tbOrder == ""}'><input type="hidden" value="0" class="scn" name="scn"></c:if>
                        <c:if test='${tbOrder != ""}'><input type="hidden" value="${tbOrder.updateScn}" class="scn" name="scn"></c:if>
                        <tr>
                            <td class="bg-light">취소메모</td>
                            <td><input type="text" class="form-control background-white width-full" value="" class="cancelMemo" name="cancelMemo"></td>
                        </tr>
                       <%-- <tr>
                            <td class="bg-light">배치요청여부</td>
                            <td><input type="text" value=false  class="isBatch" name="isBatch"></td>
                        </tr>--%>
                    </table>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-grey float-right m-l-5" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary float-right m-l-5 cancel-pay-action-btn" >주문취소</button>
        </div>
    </div>
</div>
