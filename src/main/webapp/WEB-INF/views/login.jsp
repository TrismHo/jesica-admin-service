<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>jesica | Login Page</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
	<meta content="" name="description">
	<meta content="" name="author">
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" >
	<link href="../assets/css/default/app.min.css" rel="stylesheet" >
	<!-- ================== END BASE CSS STYLE ================== -->
	<%@include file="common/include_head.jsp" %>
</head>
<style>
	.login-cover .login-cover-bg {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
		background: linear-gradient(to bottom,rgba(0,0,0,.35) 0,rgba(0,0,0,.85));
	}
	.login.login-v2 {
		top: 40px;
	}
	.layer-box ul, li, div, .layer-box-nocls ul {
		letter-spacing: 0px;
		margin: 0;
		font-size: 12px;
		font-family: GmarketSansTTFMedium;
		/* font-family: 'Nanum Gothic', "나눔 고딕", 'NanumGothic', "나눔고딕", 'Malgun Gothic', '맑은 고딕', 'MalgunGothic', '맑은고딕', sans-serif; */
	}

</style>
<body class="pace-top">
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin login-cover -->
<div class="login-cover">
	<div class="login-cover-image" style="" data-id="login-cover-image"></div>
	<div class="login-cover-bg"></div>
</div>
<ul class="navbar-nav navbar-right">
	<li class="dropdown navbar-language">
		<a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="ko">
			<span class="flag-icon flag-icon-kr" title="ko" style="font-size: 20px;margin-left: 10px;"></span>
			<span class="name d-none d-sm-inline" style="font-size: 20px;margin-left: 10px;">KR</span> <b class="caret"></b>
		</a>
		<a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="en" style="display: none;">
			<span class="flag-icon flag-icon-us" title="us" style="font-size: 20px;margin-left: 10px;"></span>
			<span class="name d-none d-sm-inline" style="font-size: 20px;margin-left: 10px;">EN</span> <b class="caret"></b>
		</a>
		<a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="kh" style="display: none;">
			<span class="flag-icon flag-icon-kh" title="kh" style="font-size: 20px;margin-left: 10px;"></span>
			<span class="name d-none d-sm-inline" style="font-size: 20px;margin-left: 10px;">KH</span> <b class="caret"></b>
		</a>
<%--
		<a href="#" class="dropdown-toggle pr-1 pl-1 pr-sm-3 pl-sm-3" id="la" style="display: none;">
			<span class="flag-icon flag-icon-la" title="la" style="font-size: 20px;margin-left: 10px;"></span>
			<span class="name d-none d-sm-inline" style="font-size: 20px;margin-left: 10px;">LA</span> <b class="caret"></b>
		</a>
--%>
		<div class="dropdown-menu drop-show-hide " style="width: 150px;">
			<a href="#" class="dropdown-item lang_btn" lang="ko"><span class="flag-icon flag-icon-kr" title="ko"></span> 한국어</a>
			<a href="#" class="dropdown-item lang_btn" lang="en"><span class="flag-icon flag-icon-us" title="en"></span> English</a>
			<a href="#" class="dropdown-item lang_btn" lang="kh"><span class="flag-icon flag-icon-kh" title="kh"></span> ប្រទេសកម្ពុជា</a>
		</div>
	</li>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title></title>
	</head>
</ul>
<!-- end login-cover -->
<!-- begin #page-container -->
<div id="page-container" class="fade">
	<!-- begin login -->
	<div class="login login-v2" data-pageload-addclass="animated fadeIn">
		<!-- begin brand -->
		<div class="login-header">
			<div class="brand" style="text-align: center">
				<%--<span class="logo"></span>--%>
				<%--<img style="margin: auto;display: block; width: 70%;margin-bottom: 27px;"  src="${path}<spring:message code="login.logoimg" text="/assets/img/logo/itsuda_nagative.png"/>">--%>
					<h1><img  style="width: 350px;" src="${path}<spring:message code="header.logoimg" text="/assets/img/logo/pick_order_3.png"/>"></h1><br>
					<h1 style="position: absolute;
				    margin: auto;
					top: 111px;
					 font-family: GmarketSansTTFBold;
					 text-shadow: -1px 0 #8f98ff, 0 1px  #8f98ff, 1px 0  #8f98ff, 0 -1px  #8f98ff;
					 color: #e2e2e2;
					right: 25px;">Manager</h1>
			</div>
			<div class="icon">
				<%--<i class="fa fa-lock"></i>--%>
			</div>
		</div>

		<!-- end brand -->
		<!-- begin login-content -->
		<div class="login-content">

			<form class="margin-bottom-0 login_form" name="login_form" >
				<input type="hidden" class="uuid" id="uuid" name="uuid" value="">
				<div class="form-group m-b-20">
					<input type="text" class="width-full form-control-lg bmLoginId" id="bmLoginId" name="bmLoginId" placeholder="<spring:message code="login.accountid" text="Account ID"/>" required />
				</div>
				<div class="form-group m-b-20">
					<input type="password" class="width-full form-control-lg bmLoginPwd" id="bmLoginPwd" name="bmLoginPwd" placeholder="<spring:message code="login.password" text="Password"/>" required />
				</div>
				<div class="checkbox checkbox-css m-b-20">
					<input type="checkbox" id="remember_checkbox" />
					<label for="remember_checkbox">
						아이디 저장
					</label>

				</div>
				<div class="login-buttons">
					<input type="button" style="" class="btn btn-success btn-block btn-lg login_btn" value="<spring:message code="login.signin" text="로 그 인"/>">
				</div>
				<br>
				<p class="text-center text-grey-darker mb-0">
					&copy; O2O Delivery Admin. All Right Reserved 2020
				</p>
				<%--<div class="m-t-20">
					Not a member yet? Click <a href="javascript:;">here</a> to register.
				</div>--%>
				<%--<div style="margin: 20px; width: 76%; text-align: center; position: absolute; bottom: 0"> <spring:message code="login.servicearea" text="Mobility Service in Jeju"/></div>--%>
			</form>

		</div>
		<!-- end login-content -->
	</div>
	<!-- end login -->

	<!-- begin login-bg -->
	<%--<ul class="login-bg-list clearfix">
		<li class="active"><a href="javascript:;" data-click="change-bg" data-img="../assets/img/login-bg/login-bg-17.jpg" style="background-image: url(../assets/img/login-bg/login-bg-17.jpg)"></a></li>
		<li><a href="javascript:;" data-click="change-bg" data-img="../assets/img/login-bg/login-bg-16.jpg" style="background-image: url(../assets/img/login-bg/login-bg-16.jpg)"></a></li>
		<li><a href="javascript:;" data-click="change-bg" data-img="../assets/img/login-bg/login-bg-15.jpg" style="background-image: url(../assets/img/login-bg/login-bg-15.jpg)"></a></li>
		<li><a href="javascript:;" data-click="change-bg" data-img="../assets/img/login-bg/login-bg-14.jpg" style="background-image: url(../assets/img/login-bg/login-bg-14.jpg)"></a></li>
		<li><a href="javascript:;" data-click="change-bg" data-img="../assets/img/login-bg/login-bg-13.jpg" style="background-image: url(../assets/img/login-bg/login-bg-13.jpg)"></a></li>
		<li><a href="javascript:;" data-click="change-bg" data-img="../assets/img/login-bg/login-bg-12.jpg" style="background-image: url(../assets/img/login-bg/login-bg-12.jpg)"></a></li>
	</ul>--%>
	<!-- end login-bg -->


</div>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<script src="../assets/js/app.min.js"></script>
<script src="../assets/js/theme/default.min.js"></script>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="common/include_common_js.jsp" %>
<%@include file="common/include_datatables.jsp" %>
<%@include file="common/include_custom_js.jsp" %>
<%--<script src="../assets/js/app.min.js"></script>
<script src="../assets/js/theme/default.min.js"></script>--%>
<!-- ================== END BASE JS ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<%--<script src="../assets/js/demo/login-v2.demo.js"></script>--%>
<!-- ================== END PAGE LEVEL JS ================== -->
<script>
	$(() => {
		$(".login_btn").on("click", function() {
			loginAjax();
		});

		$("#bmLoginId").keydown(function(e) {
			if(e.keyCode == 13) {
				e.preventDefault();
				loginAjax();
			}
		});

		$("#bmLoginPwd").keydown(function(e) {
			if(e.keyCode == 13) {
				e.preventDefault();
				loginAjax();
			}
		});
	});

	$(document).on("click","#ko,#en,#kh",function(){
		if($(".drop-show-hide").hasClass("show") === true) {
			$(".drop-show-hide").removeClass("show");
		} else {
			$(".drop-show-hide").addClass("show");
		}

	});

	function loginAjax() {

		$("#uuid").val(uuidv4());

		let _forms = $(".login_form");
		let req = convertFormToObj(_forms);
		if(inputDataCheck(req)) {
			frm_check();
			$.ajax({
				type: 'POST',
				url: '${path}/chk/login',
				data: req,
				// contentType: 'application/json',
				success: function(data) {
					let result = data.result;
					let message = data.message;
					if(result == "500" || result == "400") {
						alert_focus("bmLoginPwd", message);
					} else {
						frm_check();
						location.href = data.url;
					}
				}
			});
		}
	}

	function inputDataCheck(args) {
		if (isNull(args.bmLoginId)) {
			swal({
				title : "Enter your account ID",
				icon : "warning"
			}).then((confirm) => {
				if(confirm) {
					$("#bmLoginId").focus();
				}
			});
			return false;
		} else if (isNull(args.bmLoginPwd)) {
			swal({
				title : "Enter your password",
				icon : "warning"
			}).then((confirm) => {
				if (confirm) {
					$("#bmLoginPwd").focus();
				}
			});
			return false;
		}
		return true;
	}
	//uuid 생성
	function uuidv4() {
	return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
			var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
			return v.toString(16);
		});
	}






	//쿠키세팅
	$(function() {

		fnInit();

	});

	function frm_check(){
		saveid();
	}

	function fnInit(){
		var cookieid = getCookie("saveid");
		if(cookieid !=""){
			$("input:checkbox[id='remember_checkbox']").prop("checked", true);
			$('#bmLoginId').val(cookieid);
		}
	}

	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setTime(todayDate.getTime() + 0);
		if(todayDate > expiredays){
			document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		}else if(todayDate < expiredays){
			todayDate.setMonth(todayDate.getMonth() +1);
			document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate + ";";
		}


	}

	function getCookie(Name) {
		var search = Name + "=";
		console.log("search : " + search);

		if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
			offset = document.cookie.indexOf(search);
			console.log("offset : " + offset);
			if (offset != -1) { // 쿠키가 존재하면
				offset += search.length;
				// set index of beginning of value
				end = document.cookie.indexOf(";", offset);
				// 쿠키 값의 마지막 위치 인덱스 번호 설정
				if (end == -1)
					end = document.cookie.length;

				return unescape(document.cookie.substring(offset, end));
			}
		}
		return "";
	}

	function saveid() {
		var expdate = new Date();
		if ($("#remember_checkbox").is(":checked")){
			expdate.setTime(expdate.getTime() + 30*24*60*60*1000);
			setCookie("saveid", $("#bmLoginId").val(), expdate);
		}else{
			expdate.setTime(expdate.getTime() + -1*24*60*60*1000);
			setCookie("saveid", $("#bmLoginId").val(), expdate);
		}
	}


</script>
</body>
</html>
