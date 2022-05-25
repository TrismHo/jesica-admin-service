<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div id="topbar">
    <div id="header" class="header navbar-default">
        <div class="navbar-header" style="background-color: #2d353c;">
         <%--   <a href="${path}/main" class="navbar-brand" style="padding: 10px 0px; padding-left: 20px;">
                <img src="${path}/assets/img/logo/itsuda_one_color2.png">
                <b>잇수다</b>
                &lt;%&ndash;<span class="logo"></span> <b><span style="color:#ffa200;">O2O Delivery Flatform</span></b>&ndash;%&gt;
            </a>--%>
            <a href="${path}/main" class="navbar-brand" > <%--<b>PetView</b>--%>
                <small>
                    <img class="m-l-20 m-r-20 " style="width: 120px;" src="${path}<spring:message code="header.logoimg" text="/assets/img/logo/140x35.png"/>">
                   <%-- <spring:message code="main.logo1" text="default text"/>,
                    <span style="font-size:20px;color:#ffa200;"><spring:message code="main.logo2" text="default text"/></span>
                    <spring:message code="main.logo3" text="default text"/>
                    <spring:message code="header.title" text=""/>--%>
                </small>
            </a>
            <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <ul class="navbar-nav navbar-right">
            <li class="navbar-form">
                <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a href="${path}/language/list" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                        <i class="fas fa-lg fa-fw m-r-10 fa-language"></i><spring:message code="header.language.setting" text="Language"/>
                    </a>
                </span>

               <c:if test="${sessionScope.sessionKey.roleType == 1}">
                    <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a class="btn btn-sm btn-white btn-white-without-border new-control-btn" data-change="widget-theme" data-theme="dark"><spring:message code="list.detail.control" text="관제 바로가기"/></a>
                      </a>
                    </span>
                </c:if>
                <c:if test="${sessionScope.sessionKey.roleType == 2}">
                    <c:forEach var="item" items="${tbSiteMenuAclList}" varStatus="status">
                       <c:if test="${item.menuLevel == 10}">
                        <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                            <a class="btn btn-sm btn-white btn-white-without-border new-control-btn" data-change="widget-theme" data-theme="dark">${item.menuName}</a>
                            </a>
                        </span>
                        </c:if>
                    </c:forEach>
                </c:if>
            </li>
            <li class="dropdown navbar-language">
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="ko" data-toggle="dropdown" >
                    <span class="flag-icon flag-icon-kr" title="ko"></span>
                    <span class="name_ d-none d-sm-inline">KR</span> <b class="caret"></b>
                </a>
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="en" data-toggle="dropdown" style="display: none;">
                    <span class="flag-icon flag-icon-us" title="us"></span>
                    <span class="name_ d-none d-sm-inline">EN</span> <b class="caret"></b>
                </a>
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="kh" data-toggle="dropdown" style="display: none;">
                    <span class="flag-icon flag-icon-kh" title="kh"></span>
                    <span class="name_ d-none d-sm-inline">KH</span> <b class="caret"></b>
                </a>
<%--
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="la" data-toggle="dropdown" style="display: none;">
                    <span class="flag-icon flag-icon-la" title="la"></span>
                    <span class="name d-none d-sm-inline">LA</span> <b class="caret"></b>
                </a>
--%>
                <div class="dropdown-menu">
                    <%--<a href="${servletPath}?lang=ko" class="dropdown-item"><span class="flag-icon flag-icon-kr" title="kr"></span> 한국어</a>
                    <a href="${servletPath}?lang=en" class="dropdown-item"><span class="flag-icon flag-icon-us" title="us"></span> English</a>
                    <a href="${servletPath}?lang=lao" class="dropdown-item"><span class="flag-icon flag-icon-la" title="la"></span> ພາສາລາວ</a>
--%>
                   <a href="#" class="dropdown-item lang_btn" lang="ko"><span class="flag-icon flag-icon-kr" title="ko"></span> 한국어</a>
                    <a href="#" class="dropdown-item lang_btn" lang="en"><span class="flag-icon flag-icon-us" title="en"></span> English</a>
                    <%--<a href="#" class="dropdown-item lang_btn" lang="lao"><span class="flag-icon flag-icon-la" title="la"></span> ພາສາລາວ</a>--%>
                    <a href="#" class="dropdown-item lang_btn" lang="kh"><span class="flag-icon flag-icon-kh" title="kh"></span>ប ្រទេសកម្ពុជា </a>
                </div>
            </li>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title></title>
            </head>
        </ul>
    </div>
</div>
<script>

</script>
