<%--주문 리스트--%>
<%--real--%>
<%--<iframe class="frame" style="display:none;"  src="https://ctl.jesicar.co.kr/calls?accessToken=${sessionScope.accessToken}" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;"></iframe>--%>
<%--test--%>
<%--<iframe class="frame" style="display:none;"  src="http://ctl-d.jesicar.co.kr:15000/calls?accessToken=${sessionScope.accessToken}" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;"></iframe>--%>
<%--local--%>
<iframe class="frame1" style="display:none;" src="http://192.168.0.90:15000/calls?accessToken=${sessionScope.accessToken}" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;"></iframe>

<%--문의 리스트--%>
<iframe class="frame2" style="display:none;" src="http://192.168.0.90:15000/inquiries" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;"></iframe>