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
                        ${sessionScope.sessionKey.userStaffName} &nbsp;<a href="/newPassWord" onclick="window.open(this.href, '_blank', 'width=500, height=280'); return false;"><i class="fas fa-fw m-r-10 fa-key" style="font-size: 5px"></i></a>
                        <small>
                            <c:if test="${sessionScope.sessionKey.roleType == 1}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.master1" text="마스터"/>
                            </c:if>
                            <c:if test="${sessionScope.sessionKey.roleType == 2}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.master1" text="사용자"/>
                            </c:if>
                           <%-- <c:if test="${sessionScope.sessionKey.userRole == 0}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.master1" text="마스터"/>
                            </c:if>
                            <c:if test="${sessionScope.sessionKey.userRole == 1}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.affiliated" text="제휴본사"/>
                            </c:if>
                            <c:if test="${sessionScope.sessionKey.userRole == 2}">
                                <spring:message code="sidemenu.role" text="등급"/> : <spring:message code="sidemenu.role.distributor" text="총판"/>
                            </c:if>--%>
                            <form id="logout-form" action='<c:url value='/logout'/>' method="POST">
                                <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                            </form>

                        </small>
                    </div>
            </li>
        </ul>
        <!-- begin sidebar nav -->
        <ul class="nav">
                <li class="has-sub <c:if test="${fn:contains(servletPath,'workgroup') }">active</c:if>">
                    <a href="javascript:;">
                        <b class="caret"></b>
                        <i class="fa fa-sitemap"></i>
                        <span><spring:message code="sidemenu.workgroupmanagement" text="업무그룹"/></span>
                    </a>
                    <ul class="sub-menu">
                        <c:if test="${sessionScope.sessionKey.userRole == 0 || sessionScope.sessionKey.userRole == 1}">
                            <li class=<c:if test="${fn:contains(servletPath,'workgroup/affiliated') }">"active"</c:if>><a href="${path}/workgroup/affiliated/list?brandNo=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&headName="><spring:message code="sidemenu.workgroupmanagement.affiliatedheadquarters" text="제휴본사"/></a></li>
                        </c:if>
                        <li class=<c:if test="${fn:contains(servletPath,'distributor') }">"active"</c:if>><a href="${path}/workgroup/distributor/list?headNo=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&branchName="><spring:message code="sidemenu.workgroupmanagement.exclusivedistributor" text="총판"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'affilfranch') }">"active"</c:if>><a href="${path}/workgroup/affilfranch/list?headNoText=&headNo=&headNoText=&branchNo=&branchNoText=&branchNoText=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&storeName="><spring:message code="sidemenu.workgroupmanagement.affiliatedfranchise1" text="가맹점"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'deliverygrp') }">"active"</c:if>><a href="${path}/workgroup/deliverygrp/list?headNoText=&headNo=&headNoText=&branchNo=&branchNoText=&branchNoText=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&dlvyName="><spring:message code="sidemenu.workgroupmanagement.deiliverygroup1" text="배송그룹"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'deliveryshare') }">"active"</c:if>><a href="${path}/workgroup/deliveryshare/list"><spring:message code="sidemenu.workgroupmanagement.sharedeiliverygroup" text="배송그룹 공유"/></a></li>
                    </ul>
                </li>
            <li class="has-sub <c:if test="${fn:contains(servletPath,'driver')}">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-building"></i>
                    <span><spring:message code="sidemenu.merchantsetting정11" text="차량배달"/></span>
                </a>
                <ul class="sub-menu">
                    <li class=<c:if test="${fn:contains(servletPath,'driver/deliveryman') }">"active"</c:if>><a href="${path}/driver/deliveryman/list??headNoText=&headNo=&headNoText=&branchNo=&branchNoText=&storeNo=&branchNoText=&storeNoText=&startDate=2020-01-01&endDate=${now}&dataStatus=OK&name="><spring:message code="sidemenu.workgroupmanagement.deiliveryman1" text="드라이버 관리"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'driver/apply') }">"active"</c:if>><a href="${path}/driver/apply/list?insertDate=insertDate&startDate=2020-01-01&endDate=${now}&authStatus=1"><spring:message code="list.detail.articleapprovalmanagement1" text="드라이버 승인관리"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'driver/consignment') }">"active"</c:if>><a href="${path}/driver/consignment/list?storeNo=100000"><spring:message code="sidemenu.orderhistory.123" text="과거주문내역"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'driver/rentcar') }">"active"</c:if>><a href="${path}/driver/rentcar/list?startDate=${yesterDayStr}&endDate=${now}"><spring:message code="sidemenu.orderhistory.123" text="안심번호 할당정보"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'driver/car') }">"active"</c:if>><a href="${path}/driver/car/list?startDate=2020-01-01&endDate=${now}"><spring:message code="sidemenu.orderhistory.carservice" text="렌터카 관리"/></a></li>

                </ul>
            </li>
            <li class="has-sub <c:if test="${fn:contains(servletPath,'board') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-clipboard"></i>
                    <span><spring:message code="sidemenu.boardmanagement리1" text="앱 관리"/></span>
                </a>
                <ul class="sub-menu">
                    <li class=<c:if test="${fn:contains(servletPath,'board/platform') || fn:contains(servletPath,'platform/detail') || fn:contains(servletPath,'platform/insert') }">"active"</c:if>><a href="${path}/board/platform/list??roupType=&dataStatus=OK&startDate=2020-01-01&endDate=${now}&title="><spring:message code="sidemenu.boardmanagement.platformannouncement" text="플랫폼 공지"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'board/event') }">"active"</c:if>><a href="${path}/board/event/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&title="><spring:message code="sidemenu.boardmanagement.eventnotice2" text="이벤트 관리"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'board/banner') }">"active"</c:if>><a href="${path}/board/banner/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&serviceType=0&boardType="><spring:message code="sidemenu.boardmanagement.eventnotice2" text="배너 관리"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'board/management') || fn:contains(servletPath,'board/management/detail') || fn:contains(servletPath,'board/management/insert') }">"active"</c:if>><a href="${path}/board/management/list?serviceType=&dataStatus=&startDate=2020-01-01&endDate=${now}&title="><spring:message code="sidemenu.couponmanagement.coupon" text="쿠폰관리"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'board/cust') }">"active"</c:if>><a href="${path}/board/cust/list?isMember=&dataStatus=&startDate=2020-01-01&endDate=${now}&custName=&custTel="><spring:message code="sidemenu.orderhistory.123" text="회원 관리"/></a></li>
                </ul>
            </li>
           <li class="has-sub <c:if test="${fn:contains(servletPath,'settlement') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-calculator"></i>
                    <span><spring:message code="sidemenu.settlement" text="정산"/></span>
                </a>
                <ul class="sub-menu">
                    <li class=<c:if test="${fn:contains(servletPath,'settlement/cashwithdraw') }">"active"</c:if>><a href="${path}/settlement/cashwithdraw/list?insertDate=insertDate&startDate=2020-01-01&endDate=${now}&withdrawStatus=0"><spring:message code="sidemenu.orderhistory.123" text="출금 신청관리"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'settlement/cashlog') }">"active"</c:if>><a href="${path}/settlement/cashlog/list?insertDate=insertDate&startDate=2020-01-01&endDate=${now}&withdrawStatus=0"><spring:message code="sidemenu.orderhistory.123" text="입출금 로그"/></a></li>
                </ul>
            </li>
           <%-- <li class="has-sub <c:if test="${fn:contains(servletPath,'driver') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    &lt;%&ndash;<i class="fa fa-address-book"></i>&ndash;%&gt;
                    <i class="fa fa-address-card"></i>
                    <span><spring:message code="sidemenu.detail.articleapprovalmanagement1" text="드라이버 관리"/></span>
                </a>
                <ul class="sub-menu">

                </ul>
            </li>--%>

          <%--  <li class="has-sub <c:if test="${fn:contains(servletPath,'order') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-cash-register"></i>
                    <span><spring:message code="sidemenu.orderhistory" text="주문관리"/></span>
                </a>
                <ul class="sub-menu">

                </ul>
            </li>--%>
            <c:if test="${sessionScope.sessionKey.userRole == 0}">
                <%--<li class="has-sub <c:if test="${fn:contains(servletPath,'coupon') }">active</c:if>">
                    <a href="javascript:;">
                        <b class="caret"></b>
                        <i class="fa fa-ticket-alt"></i>
                        <span><spring:message code="sidemenu.couponmanagement" text="쿠폰 관리"/></span>
                    </a>
                    <ul class="sub-menu">

                    </ul>
                </li>--%>
               <%-- <li class="has-sub <c:if test="${fn:contains(servletPath,'user' )}">active</c:if>">
                    <a href="javascript:;">
                        <b class="caret"></b>
                        <i class="fa fa-users"></i>
                        <span><spring:message code="sidemenu.11" text="사용자 관리"/></span>
                    </a>
                    <ul class="sub-menu">

                            &lt;%&ndash;<li class=<c:if test="${fn:contains(servletPath,'user/outcust') }">"active"</c:if>><a href="${path}/user/outcust/list?dataStatus=&startDate=2020-01-01&endDate=${now}="><spring:message code="sidemenu.orderhistory.123" text="탈퇴회원 관리"/></a></li>&ndash;%&gt;
                    </ul>
                </li>--%>
                <%--<li class="has-sub <c:if test="${fn:contains(servletPath,'statistics') }">active</c:if>">
                    <a href="javascript:;">
                        <b class="caret"></b>
                        <i class="fa fa-chart-pie"></i>
                        <span><spring:message code="sidemenu.statistics" text="통계"/></span>
                    </a>
                    <ul class="sub-menu">
                        <li class=<c:if test="${fn:contains(servletPath,'bycallcnt') }">"active"</c:if>><a href="${path}/statistics/bycallcnt/list"><spring:message code="sidemenu.statistics.bycallcount" text="콜수별"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'byfranchise') }">"active"</c:if>><a href="${path}/statistics/byfranchise/list"><spring:message code="sidemenu.statistics.bymerchant" text="가맹점별"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'bydeliver') }">"active"</c:if>><a href="${path}/statistics/bydeliver/list"><spring:message code="sidemenu.statistics.bydeliverman" text="드라이버원별"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'byregion') }">"active"</c:if>><a href="${path}/statistics/byregion/list"><spring:message code="sidemenu.statistics.byregion" text="지역별 통계"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'platform') }">"active"</c:if>><a href="${path}/statistics/platform/list"><spring:message code="sidemenu.statistics.platformrevenue" text="플랫폼 매출"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'performance') }">"active"</c:if>><a href="${path}/statistics/performance/list"><spring:message code="sidemenu.statistics.performance" text="실적"/></a></li>
                    </ul>
                </li>--%>
                <li class="has-sub <c:if test="${fn:contains(servletPath,'system' ) || fn:contains(servletPath,'extralink') || fn:contains(servletPath,'release' || fn:contains(servletPath,'safe')) }">active</c:if>">
                    <a href="javascript:;">
                        <b class="caret"></b>
                        <i class="fa fa-cogs"></i>
                        <span><spring:message code="sidemenu.11" text="시스템 운영"/></span>
                    </a>
                    <ul class="sub-menu">

                        <li class=<c:if test="${fn:contains(servletPath,'system/master/list') }">"active"</c:if>><a href="${path}/system/master/list"><spring:message code="sidemenu.orderhistory.123" text="사용자 관리"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'system/release') }">"active"</c:if>><a href="${path}/system/release/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&title="><spring:message code="sidemenu.boardmanagement.release11" text="업데이트 내역"/></a></li>
                        <li class=<c:if test="${fn:contains(servletPath,'system/systemprop') }">"active"</c:if>><a href="${path}/system/systemprop/list?dataStatus=OK&startDate=2020-01-01&endDate=${now}&title="><spring:message code="sidemenu.boardmanagement.release11" text="시스템 설정"/></a></li>
                            <%--<li class=<c:if test="${fn:contains(servletPath,'coopcompany') }">"active"</c:if>><a href="${path}/system/coopcompany/list"><spring:message code="sidemenu.systemoperation.cooperativecompany" text="협력사"/></a></li>--%>
                            <%--<li class=<c:if test="${fn:contains(servletPath,'systemgoods') }">"active"</c:if>><a href="${path}/system/systemgoods/list"><spring:message code="sidemenu.system.systemmerchandise" text="상품관리"/></a></li>--%>
                            <%--<li class=<c:if test="${fn:contains(servletPath,'number') }">"active"</c:if>><a href="${path}/system/number/list"><spring:message code="sidemenu.system.safenum" text="안심번호"/></a></li>--%>
                    </ul>
                </li>
            </c:if>
<%--
            <li class="has-sub <c:if test="${fn:contains(servletPath,'settlement') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-calculator"></i>
                    <span><spring:message code="sidemenu.settlement" text="정산"/></span>
                </a>
                <ul class="sub-menu">
                    <li class=<c:if test="${fn:contains(servletPath,'salpurstate') }">"active"</c:if>><a href="${path}/settlement/salpurstate/list"><spring:message code="sidemenu.settlement.salespurchasestatement" text="매출매입계산서"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'feesettleratio') }">"active"</c:if>><a href="${path}/settlement/feesettleratio/list"><spring:message code="sidemenu.settlement.feesettlementratio" text="수수료 정산비율"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'mannashopgrp') }">"active"</c:if>><a href="${path}/settlement/mannashopgrp/list"><spring:message code="sidemenu.settlement.manashopgroup" text="만나샵 그룹"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'transsettle') }">"active"</c:if>><a href="${path}/settlement/transsettle/list"><spring:message code="sidemenu.settlement.transfersettlement" text="이동정산"/></a></li>
                </ul>
            </li>
--%>


        <%--    <li class="has-sub <c:if test="${fn:contains(servletPath,'system') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fas fa-lg fa-fw me-10px fa-map"></i>
                    <span><spring:message code="sidemenu.detail.controlsystem" text="관제시스템"/></span>
                </a>
                <ul class="sub-menu">
                    <li class=<c:if test="${fn:contains(servletPath,'system/control') }">"active"</c:if>><a href="${path}/system/control/view"><spring:message code="list.detail.control" text="관제"/></a></li>
                </ul>
            </li>--%>
<%--            <li class="has-sub <c:if test="${fn:contains(servletPath,'safe') }">active</c:if>">--%>
<%--                <a href="javascript:;">--%>
<%--                    <b class="caret"></b>--%>
<%--                    <i class="fas fa-lg fa-fw me-10px fa-map"></i>--%>
<%--                    <span><spring:message code="sidemenu.detail.234" text="안심번호관리"/></span>--%>
<%--                </a>--%>
<%--                <ul class="sub-menu">--%>
<%--                    <li class=<c:if test="${fn:contains(servletPath,'safe/number') }">"active"</c:if>><a href="${path}/safe/number/list"><spring:message code="list.detail.safenum" text="안심번호관리"/></a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>

         <%--   <li class="has-sub <c:if test="${fn:contains(servletPath,'coupon') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-ticket-alt"></i>
                    <span><spring:message code="sidemenu.coupon" text="쿠폰관리"/></span>
                </a>
                <ul class="sub-menu">
                    &lt;%&ndash;<li class=<c:if test="${fn:contains(servletPath,'order/day/list') }">"active"</c:if>><a href="${path}/order/day/list"><spring:message code="sidemenu.orderhistory.todayorderhistory" text="금일 주문내역"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'order/old/list') }">"active"</c:if>><a href="${path}/order/old/list"><spring:message code="sidemenu.orderhistory.pastorderhistory" text="과거 주문내역"/></a></li>&ndash;%&gt;
                    <li class=<c:if test="${fn:contains(servletPath,'coupon/consignment/list') }">"active"</c:if>><a href="#"><spring:message code="sidemenu.orderhistory.123" text="쿠폰리스트"/></a></li>
                </ul>
            </li>--%>

        <%--    <li class="has-sub <c:if test="${fn:contains(servletPath,'extralink') }">active</c:if>">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-cash-register"></i>
                    <span><spring:message code="extralink" text="외부연동"/></span>
                </a>
                <ul class="sub-menu">
                    &lt;%&ndash;<li class=<c:if test="${fn:contains(servletPath,'order/day/list') }">"active"</c:if>><a href="${path}/order/day/list"><spring:message code="sidemenu.orderhistory.todayorderhistory" text="금일 주문내역"/></a></li>
                    <li class=<c:if test="${fn:contains(servletPath,'order/old/list') }">"active"</c:if>><a href="${path}/order/old/list"><spring:message code="sidemenu.orderhistory.pastorderhistory" text="과거 주문내역"/></a></li>&ndash;%&gt;
                    <li class=<c:if test="${fn:contains(servletPath,'extralink/rentcar') }">"active"</c:if>><a href="${path}/extralink/rentcar/list"><spring:message code="sidemenu.orderhistory.123" text="렌터카 API"/></a></li>
                </ul>
            </li>--%>
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
