<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$("input:text[numberOnly] , input:password[numberOnly]").on("focus", function() {
    var x = $(this).val();
    x = removeCommas(x);
    $(this).val(x);
}).on("focusout", function() {
    var x = $(this).val();
    if(x && x.length > 0) {
    if(!$.isNumeric(x)) {
    x = x.replace(/[^0-9]/g,"");
    }
    $(this).val(x);
}
}).on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
</script>
