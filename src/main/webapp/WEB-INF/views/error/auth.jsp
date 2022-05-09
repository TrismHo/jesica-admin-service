<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Jesicar | 404 Error</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="${path}/assets/css/default/app.min.css" rel="stylesheet" />
    <!-- ================== END BASE CSS STYLE ================== -->
</head>
<body class="pace-top">
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade">
    <!-- begin error -->
    <div class="error">
        <div class="error-code">1001</div>
        <div class="error-content">
            <div class="error-message"> 해당메뉴에 대한 접근권한이 없습니다.</div>
            <div class="error-desc mb-3 mb-sm-4 mb-md-5">
                이전화면으로 이동해주세요. <br />
            </div>
            <div>
                <a id="refererBtn" class="btn btn-success p-l-20 p-r-20">이전 화면으로</a>
            </div>
        </div>
    </div>
    <!-- end error -->
</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="${path}/assets/js/app.min.js"></script>
<script src="${path}/assets/js/theme/default.min.js"></script>
<!-- ================== END BASE JS ================== -->

<script>
    let referer = '${header.referer}';
    if (referer.includes("login")) {
        referer = referer.replace("login", "${path}");
    } else if (referer.includes('NaN')) {
        referer = referer.replace("NaN", "${path}");
    }

    //$("#refererBtn").prop("href", referer);
    $("#refererBtn").click(function(){
       history.back();
    });

</script>
</body>
</html>