<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<!-- 하루전 -->
<c:set var="yesterDay" value="<%=new Date(new Date().getTime() - 60*60*24*1000*1)%>"/>
<fmt:formatDate value="${yesterDay}" pattern="yyyy-MM-dd" var="yesterDayStr"/>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>

<%  //한달 전 날짜 구하기
    DecimalFormat df = new DecimalFormat("00");
    Calendar currentCalendar = Calendar.getInstance();
    currentCalendar.add(currentCalendar.DATE, -30);
    String strYear31   = Integer.toString(currentCalendar.get(Calendar.YEAR));
    String strMonth31  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    String strDay31   = df.format(currentCalendar.get(Calendar.DATE));
    String strDate31 = strYear31 +"-"+ strMonth31 +"-"+ strDay31;
%>
<!-- 한달전 -->
<c:set var="month" value='<%=strDate31%>' />
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="now"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="yearStart"><fmt:formatDate value="${date}" pattern="yyyy" /></c:set>
<c:set var="thisMonth"><fmt:formatDate value="${date}" pattern="MM" /></c:set>
    <%--GoogleMapTestKey--%>
<c:set var="imgUrlPath" value="https://jesicar.co.kr/" />
<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANWaKymkYvONhGDsRjCd7pwNHO_ygW3Og&libraries=drawing,places&v=weekly"defer></script>--%>

<!--kakaoMapTestKey-->
<%--<c:set var="appkey" value="94f23e0f25ea704e6e4a26359fb10b86&libraries=services"/>--%>
<%--<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94f23e0f25ea704e6e4a26359fb10b86&libraries=services"></script>--%>
<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANWaKymkYvONhGDsRjCd7pwNHO_ygW3Og&callback=initMap&libraries=drawing&v=weekly"defer></script>--%>

<!--kakaoMapRealKey-->
<%--<c:set var="appkey" value="94f23e0f25ea704e6e4a26359fb10b86&libraries=services"/>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94f23e0f25ea704e6e4a26359fb10b86&libraries=services"></script>--%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="servletPath" value="${requestScope['javax.servlet.forward.servlet_path']}"/>

<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
<meta property="og:title" content="온동네 | 앱관리자" />
<meta property="og:description" content="온동네 앱 관리자 사이트" />
<meta property="og:type" content="website" />

<%--<meta name="_csrf" id="_csrf" content="${_csrf.token}"/>--%>
<%--<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}"/>--%>
<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
<%--<link href="${path}/css/jquery.dataTables.min.css" rel="stylesheet"/>--%>
<link href="${path}/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
<link href="${path}/assets/css/default/app.min.css" rel="stylesheet"/>
<link href="${path}/css/custom.css" rel="stylesheet" >
<link href="${path}/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="${path}/assets/plugins/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->
<link href="${path}/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="${path}/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />
<%--<link href="${path}/assets/plugins/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">--%>
<link href="${path}/assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet" />
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<link href="${path}/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
<%--<link rel="icon" href="${path}/assets/img/icon/icon.png"/>--%>

<%--운영--%>
<c:set var="documentURL" value="${requestScope['javax.servlet.forward.servlet_path']}"/>

<%--태스트--%>
<c:set var="servletPath" value="${requestScope['javax.servlet.forward.servlet_path']}"/>

<link rel="icon" href="/ondongne_pavicon.ico" />
<link href="${path}/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link href="${path}/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.css" rel="stylesheet" />

<%--<c:set var="session" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication}"/>--%>
