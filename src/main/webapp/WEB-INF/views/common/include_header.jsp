<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div id="topbar">
    <div id="header" class="header navbar-default">
        <div class="navbar-header">
         <%--   <a href="${path}/main" class="navbar-brand" style="padding: 10px 0px; padding-left: 20px;">
                <img src="${path}/assets/img/logo/itsuda_one_color2.png">h

                &lt;%&ndash;<span class="logo"></span> <b><span style="color:#ffa200;">O2O Delivery Flatform</span></b>&ndash;%&gt;
            </a>--%>
           <%-- <a href="${path}/main" class="navbar-brand" > &lt;%&ndash;<b>PetView</b>&ndash;%&gt;
            </a>--%>

                <small>
                    <li class="dropdown navbar-language" style="font-size: 17px;">
                        <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
                            <a href="${path}/main">
                                <img  style="width: 50px; margin-left: 20px;" src="${path}<spring:message code="header.logoimg" text="/assets/img/logo/top_title_png.png"/>">
                                <%--<b style="text-shadow: -1px 0 #8f98ff, 0 1px #8f98ff, 1px 0 #8f98ff, 0 -1px #8f98ff;
                                font-size: 14px;">Manager</b>--%>
                            </a>
                            <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="yangpa" data-toggle="dropdown" style="text-decoration: none; color: white;" >
                                <%--<b style="font-size: 15px;"></b>&nbsp;
                                <b class="caret"></b>--%>
                            </a>
                        </c:if>
                       <%-- <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
                            <a href="${path}/main">
                                <img  style="width: 100px; margin-left: 40px;" src="${path}<spring:message code="header.logoimg" text="/assets/img/logo/140x35.png"/>">
                            </a>
                            <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="jesicar" data-toggle="dropdown" style="text-decoration: none; color: white;">
                                <b style="font-size: 15px;"></b>&nbsp;
                                <b class="caret"></b>
                            </a>
                        </c:if>--%>


                        <%--
                                        <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="la" data-toggle="dropdown" style="display: none;">
                                            <span class="flag-icon flag-icon-la" title="la"></span>
                                            <span class="name d-none d-sm-inline">LA</span> <b class="caret"></b>
                                        </a>
                        --%>

                        <div class="dropdown-menu" style="margin:19px 0px 0px -140px; width: 217px; background-color: #2e353c; border-radius: 0px">
                            <%--<a href="${servletPath}?lang=ko" class="dropdown-item"><span class="flag-icon flag-icon-kr" title="kr"></span> 한국어</a>
                            <a href="${servletPath}?lang=en" class="dropdown-item"><span class="flag-icon flag-icon-us" title="us"></span> English</a>
                            <a href="${servletPath}?lang=lao" class="dropdown-item"><span class="flag-icon flag-icon-la" title="la"></span> ພາສາລາວ</a>
            --%>

                            <%--<div class="dropdown-item company_btn" company="jesicar" style="cursor: pointer;" > <i class="fas fa-lg fa-fw m-r-10 fa-caret-right" style="color: #acaeb2;"></i> <b style="font-size: 15px;color: #acaeb2;">제시카</b>&nbsp;</div><hr style="margin-top: 5px;margin-bottom: 5px;">카--%>
                            <div class="dropdown-item company_btn" company="yangpa" style="cursor: pointer;"> <i class="fas fa-lg fa-fw m-r-10 fa-caret-right" style="color: #acaeb2;"></i></span> <b style="font-size: 15px;color: #acaeb2;">온동네</b>&nbsp;</div>
                        </div>

                    </li>

                   <%-- <spring:message code="main.logo1" text="default text"/>,
                    <span style="font-size:20px;color:#ffa200;"><spring:message code="main.logo2" text="default text"/></span>
                    <spring:message code="main.logo3" text="default text"/>
                    <spring:message code="header.title" text=""/>--%>

                </small>

         <%--   <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>--%>
        </div>

        <ul class="navbar-nav navbar-right">

            <li class="navbar-form">

                <%--<span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a href="${path}/language/list" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                       총판:  ${sessionScope.sessionKey.appCodeName}
                    </a>
                </span>--%>
               <%-- <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a  class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                       <c:if test="${sessionScope.sessionKey.appCode != ''}">
                           총판:  ${sessionScope.sessionKey.appCodeName}
                       </c:if>
                       <c:if test="${sessionScope.sessionKey.appCode == ''}">
                           슈퍼마스터
                       </c:if>
                    </a>
                </span>--%>

              <%-- <c:if test="${sessionScope.sessionKey.roleType == 0}">
                 <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a href="${path}/language/list" class="btn btn-sm btn-white btn-white-without-border" data-change="widget-theme" data-theme="dark">
                        <i class="fas fa-lg fa-fw m-r-10 fa-language"></i><spring:message code="header.language.setting" text="Language"/>
                    </a>
                </span>
                    <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                    <a class="btn btn-sm btn-white btn-white-without-border new-control-btn" data-change="widget-theme" data-theme="dark"><spring:message code="list.detail.control" text="관제 바로가기"/></a>
                      </a>
                    </span>
                </c:if>--%>
                <c:if test="${sessionScope.sessionKey.roleType != 1}">
                    <c:if test="${sessionScope.sessionKey.userType == 1 || sessionScope.sessionKey.userType == 2 || sessionScope.sessionKey.userType == 3 ||sessionScope.sessionKey.userType == 4 ||sessionScope.sessionKey.userType == 5}">
                     <%-- <span class="btn-group pull-right m-l-20 p-1 bg-black-transparent-2 rounded">
                        <a class="btn btn-sm btn-white btn-white-without-border new-control-btn" data-change="widget-theme" data-theme="dark"><spring:message code="list.detail.control" text="관제 바로가기"/></a>
                         </a>
                    </span>--%>
                    </c:if>
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
            <%--<li class="dropdown navbar-language">
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
&lt;%&ndash;
                <a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="la" data-toggle="dropdown" style="display: none;">
                    <span class="flag-icon flag-icon-la" title="la"></span>
                    <span class="name d-none d-sm-inline">LA</span> <b class="caret"></b>
                </a>
&ndash;%&gt;
                <div class="dropdown-menu">
                    &lt;%&ndash;<a href="${servletPath}?lang=ko" class="dropdown-item"><span class="flag-icon flag-icon-kr" title="kr"></span> 한국어</a>
                    <a href="${servletPath}?lang=en" class="dropdown-item"><span class="flag-icon flag-icon-us" title="us"></span> English</a>
                    <a href="${servletPath}?lang=lao" class="dropdown-item"><span class="flag-icon flag-icon-la" title="la"></span> ພາສາລາວ</a>
&ndash;%&gt;
                   <a href="#" class="dropdown-item lang_btn" lang="ko"><span class="flag-icon flag-icon-kr" title="ko"></span> 한국어</a>
                    &lt;%&ndash;<a href="#" class="dropdown-item lang_btn" lang="en"><span class="flag-icon flag-icon-us" title="en"></span> English</a>&ndash;%&gt;
                    &lt;%&ndash;<a href="#" class="dropdown-item lang_btn" lang="lao"><span class="flag-icon flag-icon-la" title="la"></span> ພາສາລາວ</a>&ndash;%&gt;
                    &lt;%&ndash;<a href="#" class="dropdown-item lang_btn" lang="kh"><span class="flag-icon flag-icon-kh" title="kh"></span>ប ្រទេសកម្ពុជា </a>&ndash;%&gt;
                </div>
            </li>--%>
            <li class="nav-item d-flex align-items-center" style="margin-right: 10px;">
                <a href="/member/list" class="nav-link d-flex align-items-center" style="gap:8px;">
                    <i class="far fa-clock fa-icon-set"></i>
                    <span id="sessionTimer"
                          style="
                display:inline-flex;
                align-items:center;
                justify-content:center;
                min-width:78px;
                height: 20px;
                padding:0px 10px;
                border:1px solid rgba(255,255,255,.25);
                border-radius:999px;
                background:rgb(76 82 87);
                color:#fff;
                font-size:12px;
                line-height:1;
              ">
        </span>
                </a>
            </li>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title></title>
            </head>
        </ul>
    </div>
</div>
<script>
    const expiresAt = ${sessionScope.SESSION_EXPIRES_AT};
    let expired = false;
    let timerId = null;

    function updateTimer() {
        if (expired) return;

        const remain = Math.floor((expiresAt - Date.now()) / 1000);

        if (remain <= 0) {
            expired = true;
            clearInterval(timerId);

            alert("세션이 만료되었습니다.");
            location.href = "/login";
            return;
        }

        const min = Math.floor(remain / 60);
        const sec = remain % 60;

        document.getElementById("sessionTimer").innerText =
            min + "분 " + sec + "초";
    }

    timerId = setInterval(updateTimer, 1000);
    updateTimer();

    function logOut() {
        $.ajax({
            url: '/logout',
            type: 'POST',
            success: function(res) {
                if (res.result === "200") {
                    location.href = '/' + res.url;
                }
            }
        });
    }
</script>
