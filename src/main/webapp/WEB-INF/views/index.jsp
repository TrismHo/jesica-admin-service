<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:forward page="/contents/lifecycle"/>--%>
<script>
    <c:choose>
        <c:when test="${empty sessionScope.userName}">
            self.location="/login";
        </c:when>
        <c:otherwise>
            self.location="/main";
        </c:otherwise>
    </c:choose>
</script>
