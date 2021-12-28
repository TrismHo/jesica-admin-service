<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:forward page="/contents/lifecycle"/>--%>
<script>
    <c:choose>
        <c:when test="${empty sessionScope.userName}">
            self.location="http://192.168.0.54:11101";
        </c:when>
        <c:otherwise>
            self.location="http://192.168.0.54:11101";
        </c:otherwise>
    </c:choose>
</script>
