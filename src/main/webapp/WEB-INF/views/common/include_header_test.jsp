<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- begin #header -->
<script>
    /*let prevScrollpos = window.pageYOffset;
    window.onscroll = function() {
        let currentScrollPos = window.pageYOffset;
        if (prevScrollpos > currentScrollPos) {
            $("#top-menu").css("top", "50px");
        } else {
            $("#top-menu").css("top", "0px");
        }
        prevScrollpos = currentScrollPos;
    }*/
</script>
<%--<div id="top-menu" class="top-menu">
    <div id="header" class="header navbar-default">
        <!-- begin navbar-header -->
        <div class="navbar-header">
            <a href="${path}/" class="navbar-brand" style="padding: 10px 0px; padding-left: 20px;"><span class="navbar-logo"></span> &lt;%&ndash;<b>PetView</b>&ndash;%&gt;
                <span class="logo"></span> <b>MAN<span style="color:#ffa200;">NA</span></b>
            </a>
            <a href="${path}/" class="navbar-brand" style="padding: 10px 0px;"> &lt;%&ndash;<b>PetView</b>&ndash;%&gt;
                <small><spring:message code="main.logo1" text="default text"/>, <span style="font-size:20px;color:#ffa200;"><spring:message code="main.logo2" text="default text"/></span><spring:message code="main.logo3" text="default text"/></small>
            </a>
            <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- end navbar-header -->
        <!-- begin header-nav -->
        <ul class="navbar-nav navbar-right">
            <li class="navbar-form">
                <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a href="${path}/language/list" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark"><i class="fas fa-lg fa-fw m-r-10 fa-language"></i></i><spring:message code="header.language" text="언어설정"/></a>
                </span>
            </li>
            <li class="dropdown navbar-language">
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="kr" data-toggle="dropdown" >
                    <span class="flag-icon flag-icon-kr" title="kr"></span>
                    <span class="name d-none d-sm-inline">KR</span> <b class="caret"></b>
                </a>
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="en" data-toggle="dropdown" style="display: none;">
                    <span class="flag-icon flag-icon-us" title="us"></span>
                    <span class="name d-none d-sm-inline">EN</span> <b class="caret"></b>
                </a>
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="la" data-toggle="dropdown" style="display: none;">
                    <span class="flag-icon flag-icon-la" title="la"></span>
                    <span class="name d-none d-sm-inline">LAO</span> <b class="caret"></b>
                </a>
                <div class="dropdown-menu">
                    <a href="${servletPath}?lang=ko" class="dropdown-item"><span class="flag-icon flag-icon-kr" title="kr"></span> <spring:message code="translate.korean" text="default text"/></a>
                    <a href="${servletPath}?lang=en" class="dropdown-item"><span class="flag-icon flag-icon-us" title="us"></span> <spring:message code="translate.english" text="default text"/></a>
                    <a href="${servletPath}?lang=lao" class="dropdown-item"><span class="flag-icon flag-icon-la" title="lao"></span> <spring:message code="translate.lao" text="default text"/></a>
                    &lt;%&ndash;<div class="dropdown-divider"></div>
                    <a href="javascript:;" class="dropdown-item text-center">more options</a>&ndash;%&gt;
                </div>
            </li>
            <li class="dropdown navbar-user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="d-none d-md-inline">${sessionScope.sessionKey.userStaffName}마스터관리자님</span> <b class="caret"></b>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <span class="dropdown-item">
                        권한 : 마스터 등급
                        <span id="SideRoleType">
                            <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                마스터 등급
                            </c:if>
                            <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                병원메인 등급
                            </c:if>
                            <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                병원서브 등급
                            </c:if>
                        </span>
                    </span>
                    <sec:authorize access="isAuthenticated()">
                        <a href="javascript:;" onclick="document.getElementById('logout-form').submit();" class="dropdown-item">
                            <i class="fa fa-power-off" style="vertical-align: middle;margin-right: 5px;"></i>
                            로그아웃</a>
                        <form id="logout-form" action='<c:url value='/logout'/>' method="POST">
                            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                        </form>
                    </sec:authorize>
                </div>
            </li>
           <head>
               <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
               <title></title>
           </head>
        </ul>
        <!-- end header navigation right -->
    </div>
    <!-- end #header -->
    <!-- begin #top-menu -->

    <!-- begin top-menu nav -->
    &lt;%&ndash;<ul class="nav">
        <li class="has-sub <c:if test="${fn:contains(servletPath,'workgroup') }">active</c:if>">
            <a href="javascript:;">
                <i class="fa fa-chart-bar"></i>
                <span><spring:message code="side.main1" text="default text"/></span>
                <b class="caret"></b>
            </a>
            <ul class="sub-menu">
                <li class=<c:if test="${fn:contains(servletPath,'workgroup/affiliated') }">"active"</c:if>><a href="${path}/workgroup/affiliated/list"><spring:message code="side.main1.sub1" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'distributor') }">"active"</c:if>><a href="${path}/workgroup/distributor/list"><spring:message code="side.main1.sub2" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'affilfranch') }">"active"</c:if>><a href="${path}/workgroup/affilfranch/list"><spring:message code="side.main1.sub3" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'businessfranch') }">"active"</c:if>><a href="${path}/workgroup/businessfranch/list"><spring:message code="side.main1.sub4" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'deiliveryman') }">"active"</c:if>><a href="${path}/workgroup/deiliveryman/list"><spring:message code="side.main1.sub7" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'deiliverygrp') }">"active"</c:if>><a href="${path}/workgroup/deiliverygrp/list"><spring:message code="side.main1.sub5" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'shrdeiligrp') }">"active"</c:if>><a href="${path}/workgroup/shrdeiligrp/list"><spring:message code="side.main1.sub6" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'intradeiligrp') }">"active"</c:if>><a href="${path}/workgroup/intradeiligrp/list"><spring:message code="side.main1.sub8" text="default text"/></a></li>
            </ul>
        </li>

        <li class="has-sub <c:if test="${fn:contains(servletPath,'merchant') }">active</c:if>">
            <a href="javascript:;">
                <i class="fa fa-user"></i>
                <span><spring:message code="side.main2" text="default text"/></span>
                <b class="caret"></b>
            </a>
            <ul class="sub-menu">
                <li class=<c:if test="${fn:contains(servletPath,'merchandise')}">"active"</c:if> > <a href="${path}/merchant/merchandise/list"><spring:message code="side.main2.sub1" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'merchanext')}">"active"</c:if> > <a href="${path}/merchant/merchanext/list"><spring:message code="side.main2.sub2" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'merchangroup') }">"active"</c:if> > <a href="${path}/merchant/merchangroup/list"><spring:message code="side.main2.sub3" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'merchancopy') }">"active"</c:if> > <a href="${path}/merchant/merchancopy/list"><spring:message code="side.main2.sub4" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'uploadexcel') }">"active"</c:if> > <a href="${path}/merchant/uploadexcel/list"><spring:message code="side.main2.sub5" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'multifrchi')}">"active"</c:if> > <a href="${path}/merchant/multifrchi/list"><spring:message code="side.main2.sub6" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'othgrpset') }">"active"</c:if> > <a href="${path}/merchant/othgrpset/list"><spring:message code="side.main2.sub7" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'onlineevent') }">"active"</c:if> > <a href="${path}/merchant/onlineevent/list"><spring:message code="side.main2.sub8" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'ratemgt') }">"active"</c:if> > <a href="${path}/merchant/ratemgt/list"><spring:message code="side.main2.sub9" text="default text"/></a></li>
            </ul>
        </li>
        <li class="has-sub <c:if test="${fn:contains(servletPath,'settlement') }">active</c:if>">
            <a href="javascript:;">
                <i class="fa fa-calculator"></i>
                <span><spring:message code="side.main3" text="default text"/></span>
                <b class="caret"></b>
            </a>
            <ul class="sub-menu">
                <li class=<c:if test="${fn:contains(servletPath,'salpurstate') }">"active"</c:if>><a href="${path}/settlement/salpurstate/list"><spring:message code="side.main3.sub1" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'feesettleratio') }">"active"</c:if>><a href="${path}/settlement/feesettleratio/list"><spring:message code="side.main3.sub2" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'mannashopgrp') }">"active"</c:if>><a href="${path}/settlement/mannashopgrp/list"><spring:message code="side.main3.sub3" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'transsettle') }">"active"</c:if>><a href="${path}/settlement/transsettle/list"><spring:message code="side.main3.sub4" text="default text"/></a></li>
            </ul>
        </li>
        <li class="has-sub <c:if test="${fn:contains(servletPath,'statistics') }">active</c:if>">
            <a href="javascript:;">
                <i class="fa fa-chart-pie"></i>
                <span><spring:message code="side.main4" text="default text"/></span>
                <b class="caret"></b>
            </a>
            <ul class="sub-menu">
                <li class=<c:if test="${fn:contains(servletPath,'bycallcnt') }">"active"</c:if>><a href="${path}/statistics/bycallcnt/list"><spring:message code="side.main4.sub1" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'byfranchise') }">"active"</c:if>><a href="${path}/statistics/byfranchise/list"><spring:message code="side.main4.sub2" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'bydeliver') }">"active"</c:if>><a href="${path}/statistics/bydeliver/list"><spring:message code="side.main4.sub3" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'byregion') }">"active"</c:if>><a href="${path}/statistics/byregion/list"><spring:message code="side.main4.sub4" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'platform') }">"active"</c:if>><a href="${path}/statistics/platform/list"><spring:message code="side.main4.sub5" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'performance') }">"active"</c:if>><a href="${path}/statistics/performance/list"><spring:message code="side.main4.sub6" text="default text"/></a></li>
            </ul>
        </li>
        <li class="has-sub <c:if test="${fn:contains(servletPath,'board') }">active</c:if>">
            <a href="javascript:;">
                <i class="fa fa-clipboard"></i>
                <span><spring:message code="side.main5" text="default text"/></span>
                <b class="caret"></b>
            </a>
            <ul class="sub-menu">
                <li class=<c:if test="${fn:contains(servletPath,'platform/list') || fn:contains(servletPath,'platform/detail') || fn:contains(servletPath,'platform/insert') }">"active"</c:if>><a href="${path}/board/platform/list"><spring:message code="side.main5.sub1" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'platforminquiry') }">"active"</c:if>><a href="${path}/board/platforminquiry/list"><spring:message code="side.main5.sub2" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'bursimcust') }">"active"</c:if>><a href="${path}/board/bursimcust/list"><spring:message code="side.main5.sub3" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'affiliate') }">"active"</c:if>><a href="${path}/board/affiliate/list"><spring:message code="side.main5.sub4" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'deliver') }">"active"</c:if>><a href="${path}/board/deliver/list"><spring:message code="side.main5.sub5" text="default text"/></a></li>
            </ul>
        </li>
        <li class="has-sub <c:if test="${fn:contains(servletPath,'system') }">active</c:if>">
            <a href="javascript:;">
                <i class="fa fa-cogs"></i>
                <span><spring:message code="side.main6" text="default text"/></span>
                <b class="caret"></b>
            </a>
            <ul class="sub-menu">
                <li class=<c:if test="${fn:contains(servletPath,'coopcompany') }">"active"</c:if>><a href="${path}/system/coopcompany/list"><spring:message code="side.main6.sub1" text="default text"/></a></li>
                <li class=<c:if test="${fn:contains(servletPath,'sysmerchan') }">"active"</c:if>><a href="${path}/system/sysmerchan/list"><spring:message code="side.main6.sub2" text="default text"/></a></li>
            </ul>
        </li>
        <li class="menu-control menu-control-left">
            <a href="javascript:;" data-click="prev-menu"><i class="fa fa-angle-left"></i></a>
        </li>
        <li class="menu-control menu-control-right">
            <a href="javascript:;" data-click="next-menu"><i class="fa fa-angle-right"></i></a>
        </li>
    </ul>&ndash;%&gt;
    <!-- end top-menu nav -->
</div>--%>
<!-- end #top-menu -->