<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<%--<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">--%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<%@include file="../../../common/include_head.jsp" %>
	<link href="${path}/assets/css/app.min.css" rel="stylesheet"/>
	<title><spring:message code="list.controll.control" text="관제"/> | <spring:message code="list.controll.controlsystem" text="관제시스템"/></title>
	<%@include file="../../../common/include_common_js.jsp" %>
	<meta name="description" content="">
	<style>
		/*.app-sidebar-minify-btn {
            margin: 10px 0;
            padding: 5px 20px 5px 10px !important;
            background: #242b30;
            color: #fff;
            border-radius: 20px 0 0 20px;
        }*/
		@media (min-width: 992px){
			.mailbox .mailbox-sidebar {
				width: 155px;
				display: -webkit-box;
				display: -ms-flexbox;
				display: flex;
				-webkit-box-orient: vertical;
				-webkit-box-direction: normal;
				-ms-flex-direction: column;
				flex-direction: column;
				-webkit-box-flex: 0 0 155px;
				-ms-flex: 0 0 155px;
				flex: 0 0 155px;
			}
		}
		@media (min-width: 992px) {
			.mailbox .mailbox-content {
				/*max-width: calc(100% - 100px);*/
				max-width: calc(100%);
				border-left: 1px solid #ced4da;
			}
		}
		.map_wrap, .map_wrap * {margin:0; padding:0;font-size:12px;}
		.map_wrap {position:relative;width:100%;height:100%;}
		#mapwrap{position:relative;overflow:hidden;}
		.category, .category *{margin:0;padding:0;color:#000;}
		.category_sub {
			top: 10px;
			right: 10px;
			border-radius: 5px;
			box-shadow: 0 1px 1px rgb(0 0 0 / 40%);
			overflow: hidden;
			position:absolute;overflow:hidden;top:70px;right:10px;width:102px;height:50px;z-index:10;border:1px solid #909090;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
		.category {position:absolute;overflow:hidden;top:10px;right:10px;width:102px;height:55px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
		.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;}
		.category li{list-style:none;float:left;width:50px;height:55px;padding-top:5px;cursor:pointer;}
		.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;}
		.category .ico_coffee {background-position:-10px 0;}
		.category .ico_store {background-position:-10px -36px;}
		.category .ico_carpark {background-position:-10px -72px;}

		.map_wrap, .map_wrap * {margin:0;padding:0;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:100%;}
		#menu_wrap1,#menu_wrap2 { overflow-x: hidden;position:absolute;top:0;left:220px;bottom:50%;width:320px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.6);z-index: 1;font-size:12px;border-radius: 1px;}
		#menu_wrap_left {position:absolute;top:0;left:0;bottom:0;width:200px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.6);z-index: 1;font-size:12px;border-radius: 1px;}
		.bg_white {background:#fff;}
		#menu_wrap1 hr,#menu_wrap2 hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap_left hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap1 .option, #menu_wrap2 .option{text-align: left;}
		#menu_wrap_leftoption{text-align: left;}
		#menu_wrap1 .option p,#menu_wrap2 .option p {margin:10px 0;}
		#menu_wrap_left .option p {margin:10px 0;}
		#menu_wrap1 .option button,#menu_wrap2 .option button {margin-left:5px;}
		#menu_wrap_left .option button {margin-left:5px;}
		#placesList li, #placesList2 li  {list-style: none;}
		#placesList .item, #placesList2 .item {border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 46px;}
		#placesList2 .item span {display: block; width:60px; float: right; right: 7px;position: absolute;}
		#placesList .item h5, #placesList .item .info, #placesList2 .item h5, #placesList2 .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;     width: 100px;float: left;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
		.wrap {position: absolute;left: 0;bottom: -33px;width: 288px;height: 132px;margin-left: -68px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		.wrap * {padding: 0;margin: 0;}
		.wrap .info_ {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		.wrap .info_:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		.info_ .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		.info_ .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		.info_ .close:hover {cursor: pointer;}
		.info_ .body {position: relative;overflow: hidden;}
		.info_ .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
		.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		.info_ .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		.info_:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.info_ .link {color: #5085BB;}

		.side_menu {
			width: 100%;
			height: 30px;
			vertical-align: middle;
			padding-top: 5px;
			border-radius: 0px;
			border-color: #fff;
		}
		.fa-rotate-back:before, .fa-rotate-backward:before, .fa-rotate-left:before, .fa-undo-alt:before {
			content: "\f2ea";
		}
		.reload {
			cursor: pointer;
			position: absolute;
			z-index: 999;
			top: 21px;
			right: 360px;
		}

		.mapList {
			left : 0px;
		}
		#category {position:absolute;top:10px;right:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
		#category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
		#category li.on {background: #eee;}
		#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
		#category li:last-child{margin-right:0;border-right:0;}
		#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
		#category li .category_bg {background:url(../../assets/img/control/control_img.png) no-repeat;}
		#category li .bank {background-position: -10px 0;}
		#category li .mart {background-position: -10px -36px;}
		#category li .pharmacy {background-position: -10px -72px;}
		#category li .oil {background-position: -10px -108px;}
		#category li .cafe {background-position: -10px -144px;}
		#category li .store {background-position: -10px -180px;}
		#category li.on .category_bg {background-position-x:-46px;}
		.placeinfo_wrap {position:absolute;bottom:28px;left:-86px;width:172px;}
		.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
		.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
		.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
		.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050;}
		.placeinfo .tel {color:#0f7833;}
		.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
		/*#keyword {
			width: 100%;
			border: 0;
			border-radius: 2px;
			font-size: .93em;
			line-height: 16px;
			background-color: transparent;
			color: #000;
			vertical-align: top;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}*/
		#boxSearch {
			height: 30px;
			padding: 6px 6px 0;
			border: 1px solid #D3D4D6;
			border-radius: 5px;
			width: 311px;
			background-color: #fff;
		}
		#boxSearch .tf_query {
			width: 100%;
			outline: none;
			border: 0;
			border-radius: 2px;
			font-size: .93em;
			line-height: 16px;
			background-color: transparent;
			color: #000;
			vertical-align: top;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		#boxSearch .btn_dummy_search .ico_sch {
			display: block;
			width: 17px;
			height: 17px;
			margin: 13px 0px 6px;
			background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/search_icon.png) 0 1px no-repeat;
		}
		#boxSearch .btn_dummy_search {
			position: absolute;
			top: -1px;
			right: -2px;
			display: block;
			float: left;
			width: 30px;
			height: 30px;
			border: 0;
			font-size: 0;
			line-height: 0;
			background-color: transparent;
			cursor: default;
			text-align: center;
		}
		.all_sex_btn {
			width: 33%;
			height: 34px;
			border-top: 0px;
			padding-top: 7px;
			background: url(../../assets/img/control/all_btn_white.png) no-repeat;
		}
		.male_btn {
			width: 33%;
			height: 34px;
			border-top: 0px;
			padding-top: 7px;
			background: url(../../assets/img/control/male_btn_white.png) no-repeat;
		}
		.female_btn {
			width: 33%;
			height: 34px;
			border: 0px;
			padding-top: 7px;
			background: url(../../assets/img/control/female_btn_white.png) no-repeat;
		}
		.salary_all {
			width: 33%;
			height: 34px;
			border: 0px;
			padding-top: 7px;
			background: url(../../assets/img/control/all_btn_white.png) no-repeat;
		}
		.salary_month {
			width: 33%;
			height: 34px;
			border-top: 0px;
			padding-top: 7px;
			background: url(../../assets/img/control/month_btn_white.png) no-repeat;
		}
		.salary_day {
			width: 33%;
			height: 34px;
			border-top: 0px;
			border-left: 0px;
			padding-top: 7px;
			background: url(../../assets/img/control/day_btn_white.png) no-repeat;
		}
		.btn-white:not(:disabled):not(.disabled).active, .btn-white:not(:disabled):not(.disabled):active, .show>.btn-white.dropdown-toggle {
			color: #43505A;
			background-color: #43505A;
			border-color: #43505A;
		}

		.bg_all_white {
			background: url(../../assets/img/control/all_btn_black.png) no-repeat;
		}
		.bg_all_black {
			background: url(../../assets/img/control/all_btn_white.png) no-repeat;
		}
		.bg_male_white {
			background: url(../../assets/img/control/male_btn_white.png) no-repeat;
		}
		.bg_female_white {
			background: url(../../assets/img/control/female_btn_white.png) no-repeat;
		}
		.bg_male_black{
			background: url(../../assets/img/control/male_btn_black.png) no-repeat;
		}
		.bg_female_black {
			background: url(../../assets/img/control/female_btn_black.png) no-repeat;
		}
		.bg_day_white {
			background: url(../../assets/img/control/day_btn_white.png) no-repeat;
		}
		.bg_month_white {
			background: url(../../assets/img/control/month_btn_white.png) no-repeat;
		}
		.bg_day_black {
			background: url(../../assets/img/control/day_btn_black.png) no-repeat;
		}
		.bg_month_black{
			background: url(../../assets/img/control/month_btn_black.png) no-repeat;
		}
		.btn.btn-icon.btn-xs {
			width: 12px;
			height: 12px;
			font-size: 8px;
			line-height: 9px;
		}

	</style>
</head>

<!-- Modal -->
<body>
<div class="mailbox">

	<div class="mailbox-sidebar" style="display:none;">
		<div class="mailbox-sidebar-header d-flex justify-content-center">
			<%--<a href="" data-bs-toggle="collapse" class="btn btn-inverse btn-sm me-auto d-block d-lg-none">
				<div class="invoice-from">
					<i class="fa fa-cog"></i>
					<strong class="text-inverse1" style="color:#fff;">MENU</strong><br>
				</div>
			</a>--%>

			<div class="panel-heading ui-sortable-handle btn btn-inverse btn-sm me-auto d-block d-lg-none">
				<i class="fa fa-cog  drop-action-btn"></i>
				<strong class="text-inverse1  drop-action-btn" style="color:#fff;"> <spring:message code="list.controll.menu" text="MENU"/></strong><br>
				<div class="btn-group my-n1">
					<div class="dropdown-menu dropdown-menu-end" data-popper-placement="bottom-end" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(-36px, 12px);">
						<ul class="nav nav-inbox">
							<li class="active active-li"><a class="control-1" style="cursor: pointer;"><i class="fas fa-lg fa-fw me-10px fa-car "></i> <spring:message code="list.controll.rent" text="렌트"/> <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px viewer"><spring:message code="list.controll.displaying" text="표시중"/></span></a></li>
							<%--<li class="active-li"><a class="control-2" style="cursor: pointer;" url="https://ctl-d.jesicar.co.kr/orders?accessToken=${sessionScope.accessToken}"><i class="fas fa-lg fa-fw me-10px fa-user"></i> <spring:message code="list.controll.consignment" text="탁송"/> <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px viewer" style="display: none;"><spring:message code="list.controll.displaying" text="표시중"/></span></a></li>--%>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<%--<div class="mailbox-sidebar-content collapse d-lg-block" id="emailNav">

			<div data-scrollbar="true" data-height="100%" data-skip-mobile="true" class="ps" data-init="true" style="height: 100%;">
				<div class="nav-title"><b><spring:message code="list.controll.controlsystem" text="관제 리스트"/></b></div>
				<ul class="nav nav-inbox">
					<li class="active active-li"><a class="control-1" style="cursor: pointer;"><i class="fas fa-lg fa-fw me-10px fa-car "></i>  <spring:message code="list.controll.driver1" text="드라이버"/><span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px viewer"><spring:message code="list.controll.displaying" text="표시중"/></span></a></li>
					<li class="active-li"><a class="control-2" style="cursor: pointer;" ><i class="fas fa-lg fa-fw me-10px fa-user"></i>  <spring:message code="list.controll.consignment1" text="차량배달"/><span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px viewer" style="display: none;"><spring:message code="list.controll.displaying" text="표시중"/></span></a></li>
				</ul>
				&lt;%&ndash;<div class="menu-item d-flex">
					<a href="javascript:;" class="app-sidebar-minify-btn ms-auto" data-toggle="app-sidebar-minify"><i class="fa fa-angle-double-left"></i></a>
				</div>&ndash;%&gt;
			</div>
		</div>--%>
	</div>


	<div class="mailbox-content">
		<div class="mailbox-content-header">
			<div class="btn-toolbar">
				<div class="btn-group me-2">
					<a href="" class="btn btn-inverse ps-15px pe-15px btn-sm">
						<div class="invoice-from">
							<i class="fas fa-lg fa-fw me-10px fa-map " style="color:#fff;"></i>
							<strong class="text-inverse1" style="color:#fff;"><spring:message code="list.controll.controlsystem" text="관제시스템"/></strong><br>
						</div>
					</a>
					<ul class="nav nav-inbox m-l-20" >
						<li class="active active-li"><a class="control-1" style="cursor: pointer;"><i class="fas fa-lg fa-fw me-10px fa-car "></i>  <spring:message code="list.controll.driver1" text="드라이버 관제"/>
							<%--<span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px viewer"><spring:message code="list.controll.displaying" text="표시중"/></span>--%>
						</a></li>
					</ul>
					<ul class="nav nav-inbox">
						<li class="active-li"><a class="control-2" style="cursor: pointer;" ><i class="fas fa-lg fa-fw me-10px fa-user"></i>  <spring:message code="list.controll.consignment1" text="차량배달 현황"/>
							<%--<span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px viewer" style="display: none;"><spring:message code="list.controll.displaying" text="표시중"/></span>--%>
						</a></li>
					</ul>
				</div>


				<div class="btn-group ms-auto me-2">
				</div>
				<div class="btn-group me-2">
					<a href="javascript:;" onclick="openFullScreenMode();" class="btn btn-sm btn-white ">
						<i class="fa  fa-window-maximize t-plus-1 fa-fw fa-lg" ></i> <spring:message code="list.controll.fullscreen" text="전체화면"/></a>
					<a href="javascript:;"  onclick="closeFullScreenMode();" class="btn btn-sm btn-white ">
						<i class="fa  fa-window-restore t-plus-1 fa-fw fa-lg"></i> <spring:message code="list.controll.unfullscreen" text="전체화면 해제"/></a>
				</div>
				<div class="btn-group">
					<a href="javascript:;" class="btn btn-sm btn-white" onclick="finish_vote();">
						<i class="fa  fa-window-close t-plus-1 text-danger fa-fw fa-lg "></i> <spring:message code="list.controll.endofcontrol" text="관제종료"/>
					</a>
				</div>
			</div>
		</div>
		<div class="mailbox-content-body"><i class="fas fa-lg fa-fw me-10px fa-arrow-rotate-left"></i>
			<div data-scrollbar="true" data-height="100%" data-skip-mobile="true" class="ps" data-init="true" style="height: 100%;">
				<%@include file="../../../common/include_iframe_setting.jsp" %>
				<%--<iframe class="frame" style="display:none;"  src="https://ctl.jesicar.co.kr/orders?accessToken=${sessionScope.accessToken}" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;">--%>
				<%--<iframe class="frame" style="display:none;"  src="http://ctl-d.jesicar.co.kr:15000/orders?accessToken=${sessionScope.accessToken}" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;">--%>
				<%--<iframe class="frame" style="display:none;"  src="http://192.168.0.90:22201/orders?accessToken=${sessionScope.accessToken}" width="100%;" height="100%;" style="border: 1px solid #ddd; float: left;">--%>
				<%--</iframe>--%>
				<div class="map_wrap" >
					<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					<ul id="category" class="category">
						<li id="waiting" class="first_search " status="waiting" data-order="0">
							<span class="category_bg bank"></span>
							대기중
						</li>
						<li id="driving" class="" status="driving" data-order="1">
							<span class="category_bg mart"></span>
							운행중
						</li>
						<%--<li id="test1" class="" status="test1" data-order="2">
							<span class="category_bg oil"></span>
							테스트1
						</li>
						<li id="test2" class="" status="test2" data-order="3">
							<span class="category_bg cafe"></span>
							테스트2
						</li>--%>
					</ul>
					<div class="category_sub" style="top: 72px; height: 34px;" >
						<div class="btn-group me-2" style="width: 100%;height: 34px;">
							<a href="javascript:;" onclick="" class="btn btn-sm all_sex_btn btn-white selelctSex active"  value="all" >
							</a>
							<a href="javascript:;" onclick="" class="btn btn-sm male_btn btn-white selelctSex" value="male" >
								<%--<i class="fas fa-lg fa-fw fa-male" style="font-size: 20px;color: #6b6bff;"></i>--%>
							</a>
							<a href="javascript:;" onclick="" class="btn btn-sm female_btn btn-white selelctSex" value="female" >
								<%--<i class="fas fa-lg fa-fw fa-female" style="font-size: 20px;color: #f56363;"></i>--%>
							</a>
						</div>
					</div>
					<div class="category_sub" style="top: 114px; height: 34px;" >
						<div class="btn-group me-2" style="width: 100%;height: 34px;">
							<a href="javascript:;" onclick="" class="btn btn-sm salary_all btn-white selectSalary active" value="all"  >
								 </a>
							<a href="javascript:;" onclick="" class="btn btn-sm salary_month btn-white selectSalary" value="month" >
							<a href="javascript:;" onclick="" class="btn btn-sm salary_day btn-white selectSalary" value="day" >
								<%--<i class="fas fa-lg fa-fw fa-user-ninja" style="font-size: 17px;"></i>--%></a>
						</div>
					</div>
					<%--<div class="category_sub" style="top: 125px; height: 40px;" >
						<div class="btn-group me-2" style="width: 100%;">
							<a href="javascript:;" onclick="openFullScreenMode();" class="btn btn-sm btn-white active" style="width: 33%;border-left:0px;border-top: 0px;">
								 전체</a>
							<a href="javascript:;" onclick="closeFullScreenMode();" class="btn btn-sm btn-white " style="width: 33%;border-top: 0px;">
								 급여</a>
							<a href="javascript:;" onclick="closeFullScreenMode();" class="btn btn-sm btn-white " style="width: 33%;border-right:0px;border-top: 0px;">
								 수수료</a>
						</div>



						&lt;%&ndash;<ul>
							<li>
								<a href="javascript:;"  class="btn btn-sm btn-white side_menu ">
									<spring:message code="list.controll.driverllist" text="리스트"/> <span class="onOff" style="color: #009900;">on</span>
								</a>
							</li>
						</ul>&ndash;%&gt;
					</div>--%>
					<div class="category_sub refresh" style="top: 156px; cursor: pointer;height: 30px;">
						<div style="margin-top:5px;font-weight:600">
							<spring:message code="list.controll.driverllist" text="새로고침"/> <i class="fa fa-rotate-left" style="color: #009900;transform: scaleX(-1);"></i></i></i>
						</div>
					</div>
				<%--	<div class="category_sub refresh" style="top: 130px; cursor: pointer;">
						<ul>
							<li>
								<a href="javascript:;"  class="btn btn-sm btn-white side_menu ">
									<spring:message code="list.controll.driverllist" text="리스트"/> <span class="onOff" style="color: #009900;">on</span>
								</a>
							</li>
						</ul>
					</div>--%>

					<div id="menu_wrap1" class="bg_white " style="height: 41px;overflow-y: hidden;">
						<div class="option">
							<div>
								<form onsubmit="searchPlaces2(); return false;">
									<div class="panel_search">
										<div id="boxSearch">
											<input type="text" id="keyword" class="tf_query" title="검색어 입력" placeholder="지역을 입력해주세요." name="" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">
											<button type="button" class="btn_reset">
											<span class="ico_del">
											</span>
											</button>
												<div type="submit" class="btn_dummy_search">
												<span class="ico_sch">
												</span>
											</div>
										</div>
									</div>
								<%--	<spring:message code="list.controll.search" text="지역"/> : <input type="text" value="" id="keyword" size="15">
									<button type="submit"><spring:message code="list.controll.search" text="검색하기"/></button>--%>
								</form>
							</div>
						</div>
						<hr>
					</div>
					<div id="menu_wrap2" class="bg_white menu_text" style="top:43px; display: none;">
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>

					<div id="menu_wrap_left" class="bg_white">
						<%--<div style="padding: 5px; background-color: aliceblue;">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"></a>  위치정보없음,
							<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse" data-bs-original-title="" title="" data-tooltip-init="true"></a>  정상
						</div>--%>
						<div class="option">
							<ul id="placesList2"></ul>
							<div id="pagination2"></div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>
</body>
<!-- services 라이브러리 불러오기 -->
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<%@include file="../../../common/include_kakao_map_js.jsp" %>
<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c1a125dbfc0b31fb5f601512a4e58d0&libraries=services,clusterer,drawing"></script>--%>
<script type="text/javascript">

	let waiting = [];
	let waitingUpdate = [];
	let running = [];
	let runningUpdate = [];
	let gender = "all";
	let workerPayType = "all";
/*	let add_test3 = [];
	let add_test4 = [];*/

	function reload() {
		$.ajax({
			type: "GET",
			url: "${path}/api/location/getLocation",
			data: {
				type : "GO_TO_WORK"
			},
			async: false,
			contentType: "application/json;",
			dataType: "json",
			success: function (data) {
				let list = data.body.data;
				waiting =[];
				if(data.body.serviceStatus == "OK") {
					for(var i = 0 ; i < list.length ; i++){
						let lastText = "";
						if(list[i].lastUpdateDtm != null){
							let lastUpdateDtmText = list[i].lastUpdateDtm;
							let nowDate = new Date();
							let lastDate = new Date(lastUpdateDtmText);
							let updateTimelate = nowDate.getTime() - lastDate.getTime();

							let now = updateTimelate / 1000 / 60 / 60 / 24; // 2
							lastText = Math.floor(Number(now)) + " 일 경과";
							if(now < 1){
								let nowTime = updateTimelate / 1000 / 60 / 60 // 2
								lastText = Math.floor(Number(nowTime)) + " 시간 경과";
								if(nowTime < 1) {
									let nowSecond = updateTimelate / 1000 / 60 // 2과
									if(Math.floor(Number(nowSecond)) == 0) {
										lastText = "위치정보최신"
									}else {
										lastText = +Math.floor(Number(nowSecond)) + " 분 경과";
									}
								}
							}
						} else {
							lastText = " 위치정보없음";
						}

						let push = {
							distance: "",
							userNo: list[i].userNo,
							phone: list[i].phone,
							name: list[i].name,
							branchName : list[i].branchName,
							x: list[i].lng,
							y: list[i].lat,
							gender: list[i].gender, // N 모름 ,M 남자, F 여자
							workerPayType: list[i].workerPayType, // 1 급여 ,2 수수료
							lastUpdateDtm : lastText //최근 업데이트일
						}
							if(gender == "all"){
								if(workerPayType == "all"){
									waiting.push(push);
								} else if(workerPayType == "month") {
									if(push.workerPayType == 1){
										waiting.push(push);
									}
								} else if(workerPayType == "day") {
									if(push.workerPayType == 2){
										waiting.push(push);
									}
								}
							} else if(gender == "male") {
								if(workerPayType == "all"){
									if(push.gender == "M"){
										waiting.push(push);
									}
								} else if(workerPayType == "month") {
									if(push.workerPayType == 1 && push.gender == "M" ){
										waiting.push(push);
									}
								} else if(workerPayType == "day") {
									if(push.workerPayType == 2 && push.gender == "M"){
										waiting.push(push);
									}
								}
							} else if(gender == "female") {
								if(workerPayType == "all"){
									if(push.gender == "F"){
										waiting.push(push);
									}
								} else if(workerPayType == "month") {
									if(push.workerPayType == 1 && push.gender == "F" ){
										waiting.push(push);
									}
								} else if(workerPayType == "day") {
									if(push.workerPayType == 2 && push.gender == "F"){
										waiting.push(push);
									}
								}
							}
					}
				} else {
					alert(data.body.data.desc);
					return;
				}
			}
		});
		$.ajax({
			type: "GET",
			url: "${path}/api/location/getLocation",
			data: {
				type : "RUNNING"
			},
			async: false,
			contentType: "application/json;",
			dataType: "json",
			success: function (data) {
				let list = data.body.data;
				running =[];
				if(data.body.serviceStatus == "OK") {
					for(var i = 0 ; i < list.length ; i++){
						let lastText = "";
						if(list[i].lastUpdateDtm != null){
							let lastUpdateDtmText = list[i].lastUpdateDtm;
							let nowDate = new Date();
							let lastDate = new Date(lastUpdateDtmText);
							let updateTimelate = nowDate.getTime() - lastDate.getTime();

							let now = updateTimelate / 1000 / 60 / 60 / 24; // 2
							lastText = Math.floor(Number(now)) + " 일 경과";
							if(now < 1){
								let nowTime = updateTimelate / 1000 / 60 / 60 // 2
								lastText = Math.floor(Number(nowTime)) + " 시간 경과";
								if(nowTime < 1) {
									let nowSecond = updateTimelate / 1000 / 60 // 2
									lastText = Math.floor(Number(nowSecond)) + " 분 경과";
								}
							}
						} else {
							lastText = " 위치정보없음";
						}
						let push = {
							distance: "",
							phone: list[i].phone,
							name: list[i].name,
							branchName : data.body.data.branchName,
							x: list[i].lng,
							y: list[i].lat,
							gender: list[i].gender, // N 모름 ,M 남자, F 여자
							workerPayType: list[i].workerPayType, // 1 급여 ,2 수수료
							lastUpdateDtm : lastText //최근 업데이트일
						}
							if(gender == "all"){
								if(workerPayType == "all"){
									running.push(push);
								} else if(workerPayType == "month") {
									if(push.workerPayType == 1){
										running.push(push);
									}
								} else if(workerPayType == "day") {
									if(push.workerPayType == 2){
										running.push(push);
									}
								}
							} else if(gender == "male") {
								if(workerPayType == "all"){
									if(push.gender == "M"){
										running.push(push);
									}
								} else if(workerPayType == "month") {
									if(push.workerPayType == 1 && push.gender == "M" ){
										running.push(push);
									}
								} else if(workerPayType == "day") {
									if(push.workerPayType == 2 && push.gender == "M"){
										running.push(push);
									}
								}
							} else if(gender == "female") {
								if(workerPayType == "all"){
									if(push.gender == "F"){
										running.push(push);
									}
								} else if(workerPayType == "month") {
									if(push.workerPayType == 1 && push.gender == "F" ){
										running.push(push);
									}
								} else if(workerPayType == "day") {
									if(push.workerPayType == 2 && push.gender == "F"){
										running.push(push);
									}
								}
							}
					}

				} else {
					alert(data.body.data.desc);
					return;
				}
			}
		});
	}

	$(document).ready(function(){
		//
		reload();
		reload2();
		$(".first_search").click();
		/*searchPlaces2();
		$("#menu_wrap2").css("display","none");
		placesSearchCB();*/
		$(".refresh").on("click",function(){
			reload();
			reload2();
			searchPlaces();
			/*searchPlaces2();*/
			$("#menu_wrap2").css("display","none");
			/*openFullScreenMode();*/
/*			searchPlaces2();
			$("#menu_wrap2").css("display","none");*/
		});
	});

	$(document).on("click",".selelctSex",function(){

		let value = $(this).attr("value");
		if(value == 'all') {
			$('.all_sex_btn').removeClass('bg_all_white').addClass('bg_all_black');
			$('.male_btn').removeClass('bg_male_black').addClass('bg_male_white');
			$('.female_btn').removeClass('bg_female_black').addClass('bg_female_white');
		} else if (value == 'male') {
			$('.all_sex_btn').removeClass('bg_all_black').addClass('bg_all_white');
			$('.male_btn').removeClass('bg_male_white').addClass('bg_male_black');
			$('.female_btn').removeClass('bg_female_black').addClass('bg_female_white');
		} else if (value == 'female') {
			$('.all_sex_btn').removeClass('bg_all_black').addClass('bg_all_white');
			$('.male_btn').removeClass('bg_male_black').addClass('bg_male_white');
			$('.female_btn').removeClass('bg_female_white').addClass('bg_female_black');
		}

		$(".selelctSex").removeClass("active");
		$(this).addClass("active");
		gender = $(this).attr("value");
		reload();
		searchPlaces();
		/*searchPlaces2();*/
		$("#menu_wrap2").css("display","none");
	});

	$(document).on("click",".selectSalary",function(){
		let value = $(this).attr("value");
		if(value == 'all') {
			$('.salary_all').removeClass('bg_all_white').addClass('bg_all_black');
			$('.salary_month').removeClass('bg_month_black').addClass('bg_month_white');
			$('.salary_day').removeClass('bg_day_black').addClass('bg_day_white');
		} else if (value == 'day') {
			$('.salary_all').removeClass('bg_all_black').addClass('bg_all_white');
			$('.salary_month').removeClass('bg_month_black').addClass('bg_month_white');
			$('.salary_day').removeClass('bg_day_white').addClass('bg_day_black');
		} else if (value == 'month') {
			$('.salary_all').removeClass('bg_all_black').addClass('bg_all_white');
			$('.salary_month').removeClass('bg_month_white').addClass('bg_month_black');
			$('.salary_day').removeClass('bg_day_black').addClass('bg_day_white');
		}
		//건당 / 급여 / 전체

		$(".selectSalary").removeClass("active");
		$(this).addClass("active");
		workerPayType = $(this).attr("value");
		reload();
		searchPlaces();
		/*searchPlaces2();*/
		$("#menu_wrap2").css("display","none");
	});

	var markers = [];

	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}),
			contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
			markers = [], // 마커를 담을 배열입니다
			currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 9 // 지도의 확대 레벨
			};

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);




	// 마커 클러스터러를 생성합니다
	// 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
	// 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
	// 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
	// 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
	/*var clusterer = new kakao.maps.MarkerClusterer({
		map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
		averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
		minLevel: 10, // 클러스터 할 최소 지도 레벨
		disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	});

	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	$.get("/download/web/data/chicken.json", function(data) {
		// 데이터에서 좌표 값을 가지고 마커를 표시합니다
		// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		var markers = $(data.positions).map(function(i, position) {
			return new kakao.maps.Marker({
				position : new kakao.maps.LatLng(position.lat, position.lng)
			});
		});

		// 클러스터러에 마커들을 추가합니다
		clusterer.addMarkers(markers);
	});

	// 마커 클러스터러에 클릭이벤트를 등록합니다
	// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
	kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

		// 현재 지도 레벨에서 1레벨 확대한 레벨
		var level = map.getLevel()-1;

		// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
		map.setLevel(level, {anchor: cluster.getCenter()});
	});*/







	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map);

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
		if (target.addEventListener) {
			target.addEventListener(type, callback);
		} else {
			target.attachEvent('on' + type, callback);
		}
	}

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces2() {
		$("#menu_wrap2").css("display","block");
		var jejukey = "제주특별자치도 ";
		var keyword = document.getElementById('keyword').value;
		keyword = jejukey + keyword;
		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB2);
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
		if (!currCategory) {
			return;
		}

		// 커스텀 오버레이를 숨깁니다
		placeOverlay.setMap(null);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		/*ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true});*/
		placesSearchCB(waiting);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data){

		let list = waiting;
		if($("#waiting").hasClass("on")){
			list = waiting;
		} else if($("#driving").hasClass("on")){
			list = running;
		} /*else if($("#test1").hasClass("on")){
			list = add_test3;
		} else if($("#test2").hasClass("on")){
			list = add_test4;
		}*/

		var bounds = new kakao.maps.LatLngBounds();
		displayPlaces(list);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB2(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces2(data);

			// 페이지 번호를 표출합니다
			displayPagination2(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 지도에 마커를 표시하는 함수입니다
	/*function displayMarker(place) {

		// 마커를 생성하고 지도에 표시합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(place.y, place.x)
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			infowindow.open(map, marker);
		});
	}*/

	/*kakao.maps.event.addListener(map, "center_changed", function() {
		//do something..
		//reload();
		var neLat = this.getBounds().getNorthEast().getLat(); //북동 위도
		var neLng = this.getBounds().getNorthEast().getLng(); //북동 경도
		var swLat = this.getBounds().getSouthWest().getLat(); //남서 위도
		var swLng = this.getBounds().getSouthWest().getLng(); //남서 경도


		var newWaiting = [];
		var newRunning = [];
		for(var i = 0 ; i < waiting.length ; i++){
			if( waiting[i].x == null || waiting[i].y == null) {
				//지도에 존재(좌표가 없는사람도 담음)
				newWaiting.push(waiting[i]);
			}
			if(swLng < waiting[i].x && waiting[i].x < neLng) {
				if(swLat < waiting[i].y &&  waiting[i].y < neLat) {
					//지도에 존재
					newWaiting.push(waiting[i]);
				}else {
					//지도에 없음
				}
			} else {
				//지도에 없음
			}
		}


		for(var i = 0 ; i < running.length ; i++){
			if( running[i].x == null || running[i].y == null) {
				//지도에 존재(좌표가 없는사람도 담음)
				newWaiting.push(running[i]);
			}
			if(swLng < running[i].x && running[i].x < neLng) {
				if(swLat < running[i].y &&  running[i].y < neLat) {
					//지도에 존재
					newRunning.push(running[i])
				}else {
					//지도에 없음
				}
			} else {
				//지도에 없음
			}
		}

		//다담은뒤 재배열
		waiting = [];
		running = [];
		waiting = newWaiting;
		running = newRunning;
		console.log(newWaiting);
		console.log(newRunning);
	});*/

	function reload2(){
		//do something..
		//reload();
		var neLat = map.getBounds().getNorthEast().getLat(); //북동 위도
		var neLng = map.getBounds().getNorthEast().getLng(); //북동 경도
		var swLat = map.getBounds().getSouthWest().getLat(); //남서 위도
		var swLng = map.getBounds().getSouthWest().getLng(); //남서 경도


		var newWaiting = [];
		var newRunning = [];
		for(var i = 0 ; i < waiting.length ; i++){
			if( waiting[i].x == null || waiting[i].y == null) {
				//지도에 존재(좌표가 없는사람도 담음)
				newWaiting.push(waiting[i]);
			}
			if(swLng < waiting[i].x && waiting[i].x < neLng) {
				if(swLat < waiting[i].y &&  waiting[i].y < neLat) {
					//지도에 존재
					newWaiting.push(waiting[i]);
				}else {
					//지도에 없음
				}
			} else {
				//지도에 없음
			}
		}


		for(var i = 0 ; i < running.length ; i++){
			if( running[i].x == null || running[i].y == null) {
				//지도에 존재(좌표가 없는사람도 담음)
				newWaiting.push(running[i]);
			}
			if(swLng < running[i].x && running[i].x < neLng) {
				if(swLat < running[i].y &&  running[i].y < neLat) {
					//지도에 존재
					newRunning.push(running[i])
				}else {
					//지도에 없음
				}
			} else {
				//지도에 없음
			}
		}

		//다담은뒤 재배열
		waiting = [];
		running = [];
		waiting = newWaiting;
		running = newRunning;
		console.log(newWaiting);
		console.log(newRunning);
	}



	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces2(places) {

		var listEl = document.getElementById('placesList'),
				menuEl = document.getElementById('menu_wrap2'),
				fragment = document.createDocumentFragment(),
				bounds = new kakao.maps.LatLngBounds(),
				listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for ( var i=0; i<places.length; i++ ) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
					marker = addMarker2(placePosition, i),
					itemEl = getListItem2(i, places[i]); // 검색 결과 항목 Element를 생성합니다


			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover =  function () {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout =  function () {
					infowindow.close();
				};
			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		var order = document.getElementById(currCategory).getAttribute('data-order');
		var listEl = document.getElementById('placesList2'),
				menuEl = document.getElementById('menu_wrap_left'),
				fragment = document.createDocumentFragment(),
				bounds = new kakao.maps.LatLngBounds(),
				listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);
		for ( var i=0; i<places.length; i++ ) {
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
			// 마커를 생성하고 지도에 표시합니다
			var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order),
					itemEl = getListItem(i, places[i]);
			bounds.extend(placePosition);
			// 마커와 검색결과 항목을 클릭 했을 때
			// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			(function(marker, place) {
				kakao.maps.event.addListener(marker, 'click', function() {
					displayPlaceInfo(place);
				});

				//kakao.maps.event.addListener(marker, 'mouseover', function() {
					//displayInfowindow(marker, place.place_name);
					//displayPlaceInfo(place);
				//});

				//kakao.maps.event.addListener(marker, 'mouseout', function() {
					//displayPlaceInfoClose(place);
				//});

				itemEl.onmouseover =  function () {
					//displayInfowindow(marker, place.place_name);
					displayPlaceInfo(place);
				};

				//itemEl.onmouseout =  function () {
					//displayPlaceInfoClose(place);
				//};
				// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				listEl.appendChild(fragment);

				menuEl.scrollTop = 0;
			})(marker, places[i]);
			listEl.appendChild(itemEl);
		}
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker2(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
				imgOptions =  {
					spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
					spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				},
				markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				marker = new kakao.maps.Marker({
					position: position, // 마커의 위치
					image: markerImage
				});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		return marker;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
		var imageSrc = '../../assets/img/control/control_img.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
				imgOptions =  {
					spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
					spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				},
				markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				marker = new kakao.maps.Marker({
					position: position, // 마커의 위치
					image: markerImage
				});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for ( var i = 0; i < markers.length; i++ ) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
		let branchName ="";
		if(place.branchName == null) {
			branchName = "없음";
		} else {
			branchName = place.branchName;
		}
		var gender = "";
		var workerPayType = "";

		if(place.gender == "M") {
			 gender = "남"
		} else if (place.gender == "F"){
			 gender = "여"
		} else if (place.gender == "N"){
			 gender = "알수없음"
		}

		if(place.workerPayType == 1) {
			workerPayType = "급여"
		} else if (place.workerPayType == 2){
			workerPayType = "수수료"
		}

		var content = '<div class="placeinfo">' +
				'   <div class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '"> ' +place.name+" <r style='font-size: 12px'> ("+gender+" / " + workerPayType +  ")</r>"+ '</div>';
		content +='<span  title="' + place.address_name + '"></span>'
		content += '    <span title="' + place.road_address_name + '">' +"<i class='fa fa-phone-square fa-fw fa-l'></i> : &nbsp;"+ phoneNumber(place.phone) + '</span>' +
				'  <span class="" title="' + place.address_name + '"><i class="fa fa-building fa-fw fa-l"></i> : &nbsp;' + branchName + '</span>'+
				'  <span class="" title="' + place.address_name + '"><i class="fa fa-map-marked-alt fa-fw fa-lg"></i> : &nbsp;' + place.lastUpdateDtm + '</span>';

		content +=
				'</div>' +
				'<div class="after"></div>';

		contentNode.innerHTML = content;
		placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		placeOverlay.setMap(map);
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfoClose (place) {
		var content = '';

		contentNode.innerHTML = content;
		placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		placeOverlay.setMap(map);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		var statusText = "";
		var locationText = "";
		var gender = "";
		var workerPayType = "";

		/*if(places.x == null){
			locationText = "<a href='javascript:;' class='btn btn-xs btn-icon btn-danger' data-toggle='panel-remove'></a>";
		} else {
			locationText = "<a href='javascript:;' class='btn btn-xs btn-icon btn-warning' data-toggle='panel-collapse' data-bs-original-title='' title='' data-tooltip-init='true'></a>"
		}*/
		if($("#waiting").hasClass("on")){
			statusText = "대기중";
		}else {
			statusText = "운행중";
		}

		if(places.gender == "M") {
			gender = '남'
		} else if (places.gender == "F"){
			gender = '여'
		} else if (places.gender == "N"){
			gender = "알수없음"
		}

		if(places.workerPayType == 1) {
			workerPayType = "급여"
		} else if (places.workerPayType == 2){
			workerPayType = "수수료"
		}
		let lastUpdateDtm = "";
		if(places.lastUpdateDtm != ""){
			console.log(places)
			if(places.x == null || places.y == null ){
				lastUpdateDtm = '<i style="color:red;letter-spacing: 1px;" class="fa fa-map-marked-alt fa-fw fa-lg">&nbsp;&nbsp;위치정보없음</i>&nbsp;&nbsp;';
			} else {
				lastUpdateDtm = '<i class="fa fa-map-marked-alt fa-fw fa-lg"></i>&nbsp;&nbsp;' +
						places.lastUpdateDtm +"";
			}

		}

		var el = document.createElement('li'),
				itemStr =
						'<div class="info">' +
						'   <div style="margin:5px;line-height: 19px;">  <r style="white-space: nowrap; font-weight: bold;">' + places.name + "</r> ("+gender +' / '+ workerPayType +')  '+ locationText+
						'<span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px " ' +
						'style="background-color:#9dbad1;">'+statusText+'</span><br><i class="fa fa-phone-square fa-fw fa-l"></i> &nbsp;' + phoneNumber(places.phone)  + '<br>' +
						lastUpdateDtm+
						'</div>';

		itemStr += '' +
				'</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem2(index, places) {

		var el = document.createElement('li'),
				itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
						'<div class="info">' +
						'   <h5>' + places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>' +
					'   <br><span class="jibun gray">' +  places.address_name  + '</span>';
		} else {
			itemStr += '    <span>' +  places.address_name  + '</span>';
		}

		itemStr += '  <span class="tel">' + phoneNumber(places.phone)  + '</span>' +
				'</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {

		var category = document.getElementById('category'),
				children = category.children;
		for (var i=0; i<children.length; i++) {
			children[i].onclick = onClickCategory;
		}
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
		var id = this.id,
				className = this.className;
		placeOverlay.setMap(null);

		if (className === 'on') {
		/*	currCategory = '';
			changeCategoryClass();
			removeMarker();*/
		} else {
			currCategory = id;
			changeCategoryClass(this);
			searchPlaces();
		}
	}
/*	$(document).on("click","#waiting,#driving",function(){
		if($(this).hasClass("on")){
		}else {
			$(this).addClass("on");
		}
	});*/
	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
		var category = document.getElementById('category'),
				children = category.children,
				i;

		for ( i=0; i<children.length; i++ ) {
			children[i].className = '';
		}

		if (el) {
			el.className = 'on';
		}
	}


	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination2'),
				fragment = document.createDocumentFragment(),
				i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild (paginationEl.lastChild);
		}

		for (i=1; i<=pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i===pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination2(pagination) {
		var paginationEl = document.getElementById('pagination'),
				fragment = document.createDocumentFragment(),
				i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild (paginationEl.lastChild);
		}

		for (i=1; i<=pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i===pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}



	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild (el.lastChild);
		}
	}

	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	$(document).on("click","#placesList",function(){
		$("#menu_wrap2").css("display","none");
	});

	$(document).on("click",".app-sidebar-minify-btn",function(){
		$(".mailbox-sidebar").css("flex","0 0 0px;");
	});

	$(document).on("click",".side_menu",function(){

		let visible = $("#menu_wrap_left").is(":visible");
		if(visible == true) {
			$(".onOff").text("off");
			$("#menu_wrap_left").hide();

		}else {
			$(".onOff").text("on");
			$("#menu_wrap_left").show();
		}
	});
	$(document).on("click",".drop-action-btn",function(){
		if($(".dropdown-menu").hasClass("show")){
			$(".dropdown-menu").removeClass("show");
		}else{
			$(".dropdown-menu").addClass("show");
		}
	});

	$("#menu_wrap2").css("display","none");


	function finish_vote() {
		if (confirm('관제를 종료하시겠습니까?')) {
			window.close();
		}
	}

	$(document).on("click",".control-1,.control-2",function(){
		let thisClass = $(this).attr("class");
		$(".active-li").removeClass("active");
		$("."+thisClass).parents("li").addClass("active");
		$(".viewer").hide();
		$("."+thisClass).find(".viewer").show();

		if(thisClass =='control-1'){
			$(".frame").css("display","none");
            //$(".frame").attr("src","");
			$(".map_wrap").css("display","block");
			reload();
			$("#menu_wrap2").css("display","none");
		} else if (thisClass == 'control-2') {
			$(".frame").css("display","block");
			$("#menu_wrap2").css("display","none");
		}


	});
	var docV = document.documentElement;
	// 전체화면 설정
	function openFullScreenMode() {
		if (docV.requestFullscreen)
			docV.requestFullscreen();
		else if (docV.webkitRequestFullscreen) // Chrome, Safari (webkit)
			docV.webkitRequestFullscreen();
		else if (docV.mozRequestFullScreen) // Firefox
			docV.mozRequestFullScreen();
		else if (docV.msRequestFullscreen) // IE or Edge
			docV.msRequestFullscreen();
	}
	// 전체화면 해제
	function closeFullScreenMode() {
		if (document.exitFullscreen)
			document.exitFullscreen();
		else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
			document.webkitExitFullscreen();
		else if (document.mozCancelFullScreen) // Firefox
			document.mozCancelFullScreen();
		else if (document.msExitFullscreen) // IE or Edge
			document.msExitFullscreen();
	}
	function phoneNumber(value) {
		value = value.replace(/[^0-9]/g, "");
		return value.replace(
				/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,
				"$1-$2-$3"
		);
	}


</script>
</html>
