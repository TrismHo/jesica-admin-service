<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
    .sidebar .sub-menu>li>a {
        padding: 3px 20px 3px 15px;
        display: block;
        color: rgba(255,255,255,.6);
        text-decoration: none;
        position: relative;
        font-size: 16px;
    }
    .sidebar .nav>li>a>span {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        font-size: 16px;
        line-height: 1.5;
    }
</style>

<div id="sidebar" class="sidebar">
    <!-- begin sidebar scrollbar -->
    <div data-scrollbar="true" data-height="100%">
        <!-- begin sidebar user -->
        <ul class="nav">
            <li class="nav-profile">
                    <div class="cover with-shadow"></div>
                  <%--  <div class="image">
                        <img src="../assets/img/user/user.jpg" alt="">
                    </div>--%>
                    <div class="info">
                        <b class="caret_ pull-right"></b>
                        <a href="#" onclick="document.getElementById('logout-form').submit();" class="pull-right text-center">
                        <i class="fa fa-power-off" style="margin-right: 5px;"></i>
                            <small>Log out</small>
                        </a>
                        ${sessionScope.sessionKey.userStaffName} &nbsp;<a href="/newPassWord" onclick="window.open(this.href, '_blank', 'width=500, height=280'); return false;"><i class="fas fa-fw m-r-10 fa-key" style="font-size: 10px"></i></a>
                        <small>
                            <c:if test="${sessionScope.sessionKey.roleType == 1}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.master1" text="마스터"/>
                            </c:if>
                            <c:if test="${sessionScope.sessionKey.roleType == 2}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.master1" text="사용자"/>
                            </c:if>
                            <form id="logout-form" action='<c:url value='/logout'/>' method="POST">
                                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                            </form>

                        </small>
                    </div>
            </li>
        </ul>
        <!-- begin sidebar nav -->
        <ul class="nav">
            <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                <c:if test="${sessionScope.sessionKey.roleType == 2}">
                    <c:forEach var="item" items="${tbSiteMenuAclList}" varStatus="status">
                        <c:if test="${item.menuLevel == 1 && item.permission != 0 && (item.menuName == '앱 관리'
                        || item.menuName == '통계'
                        || item.menuName == '가맹점'
                        )  }">
                            <li class="has-sub">
                                <a href="javascript:;">
                                    <b class="caret"></b>
                                    <i class="fa ${item.menuIcon}"></i>
                                    <span>${item.menuName}</span>
                                </a>
                                <ul class="sub-menu">
                                    <c:forEach var="item2" items="${tbSiteMenuAclList}" varStatus="status">
                                        <c:if test="${item2.menuLevel == 2 && item2.permission != 0 && (item.menuGroup == item2.menuGroup)
                                         && (item2.menuName == '회원통계'
                                         || item2.menuName == '주문통계'
                                         || item2.menuName == '회원통계(지역)'
                                         || item2.menuName == '플랫폼 공지'
                                         || item2.menuName == '이벤트 공지'
                                         || item2.menuName == '배너 관리'
                                         || item2.menuName == '회원 관리'
                                         || item2.menuName == '픽오더주문내역' )}">
                                            <li><a href="${path}/${item2.menuUrl}/list">${item2.menuName}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.sessionKey.roleType == 1}">
                    <c:forEach var="item" items="${tbSiteMenus}" varStatus="status">
                        <c:if test="${item.menuLevel == 1 && (item.menuName == '앱 관리'
                        || item.menuName == '통계'
                        || item.menuName == '가맹점'
                        || item.menuName == '회원 관리'
                        || item.menuName == '시스템 운영') }">
                            <li class="has-sub">
                                <a href="javascript:;">
                                    <b class="caret"></b>
                                    <i class="fa ${item.menuIcon}"></i>
                                    <span>${item.menuName}</span>
                                </a>
                                <ul class="sub-menu">
                                    <c:forEach var="item2" items="${tbSiteMenus}" varStatus="status">
                                        <c:if test="${item2.menuLevel == 2 && (item.menuGroup == item2.menuGroup)
                                         && (item2.menuName == '회원통계'
                                         || item2.menuName == '주문통계'
                                         || item2.menuName == '회원통계(지역)'
                                         || item2.menuName == '사용자 관리'
                                         || item2.menuName == '플랫폼 공지'
                                         || item2.menuName == '이벤트'
                                         || item2.menuName == '이벤트 공지'
                                         || item2.menuName == '이벤트 관리'
                                         || item2.menuName == '배너 관리'
                                         || item2.menuName == '회원 관리'
                                         || item2.menuName == '쿠폰 관리'
                                         || item2.menuName == '픽오더주문내역'
                                         || item2.menuName == '시스템 설정'
                                         || item2.menuName == '이벤트 발송내역'
                                         || item2.menuName == '총판코드 설정'
                                         || item2.menuName == '발송횟수설정'
                                         || item2.menuName == '업데이트 내역')}">
                                            <li class=""><a href="${path}/${item2.menuUrl}/list">${item2.menuName}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                <c:if test="${sessionScope.sessionKey.roleType == 2}">
                    <c:forEach var="item" items="${tbSiteMenuAclList}" varStatus="status">
                        <c:if test="${item.menuLevel == 1 && item.permission != 0 && item.menuName != '맛집'  }">
                            <li class="has-sub <c:if test="${fn:contains(servletPath,item.menuName) }">active</c:if>">
                                <a href="javascript:;">
                                    <b class="caret"></b>
                                    <i class="fa ${item.menuIcon}"></i>
                                    <span>${item.menuName}</span>
                                </a>
                                <ul class="sub-menu">
                                    <c:forEach var="item2" items="${tbSiteMenuAclList}" varStatus="status">
                                        <c:if test="${item2.menuLevel == 2 && item2.permission != 0 && (item.menuGroup == item2.menuGroup) && (item2.menuName != '주문통계')}">
                                            <li class=<c:if test="${fn:contains(servletPath,item2.menuUrl) }">"active"</c:if>><a href="${path}/${item2.menuUrl}/list">${item2.menuName}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${sessionScope.sessionKey.roleType == 1}">
                    <c:forEach var="item" items="${tbSiteMenus}" varStatus="status">
                        <c:if test="${item.menuLevel == 1 && item.menuName != '맛집' }">
                            <li class="has-sub <c:if test="${fn:contains(servletPath,item.menuName) }">active</c:if>">
                                <a href="javascript:;">
                                    <b class="caret"></b>
                                    <i class="fa ${item.menuIcon}"></i>
                                    <span>${item.menuName}</span>
                                </a>
                                <ul class="sub-menu">
                                    <c:forEach var="item2" items="${tbSiteMenus}" varStatus="status">
                                        <c:if test="${item2.menuLevel == 2 && (item.menuGroup == item2.menuGroup) && (item2.menuName != '주문통계')}">
                                            <li class=<c:if test="${fn:contains(servletPath,item2.menuUrl) }">"active"</c:if>><a href="${path}/${item2.menuUrl}/list">${item2.menuName}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- end sidebar minify button -->
            <!-- begin sidebar minify button -->
            <li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i
                    class="fa fa-angle-double-left"></i></a></li>
            <!-- end sidebar minify button -->
        </ul>
    </div>
    <!-- end sidebar scrollbar -->
</div>

<div class="sidebar-bg"></div>
