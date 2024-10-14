<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>Color Admin | Login</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content name="description" />
	<meta content name="author" />
	<%@include file="common/include_head.jsp" %>
	<link href="../assets/css/vendor.min.css" rel="stylesheet" />
	<link href="../assets/css/default/app.min.css" rel="stylesheet" />

</head>
<style>
	.login.login-v1 .login-container .login-body .login-content .form-check-input {
		background-color: #495057;
		border-color: transparent;
	}
	.login.login-v1 .login-container .login-body .login-content .form-control {
		border-color: transparent;
		background: #495057;
		color: #fff;
	}
	.form-floating>.form-control, .form-floating>.form-control-plaintext, .form-floating>.form-select {
		height: calc(3.5rem + 2px);
		min-height: calc(3.5rem + 2px);
		line-height: 1.25;
	}
	.submit_btn_css {
		background-color: #05acac;
		color: #fff;
		margin-top: 20px;
	}
	.form-floating>.form-control-plaintext~label, .form-floating>.form-control:focus~label, .form-floating>.form-control:not(:placeholder-shown)~label, .form-floating>.form-select~label {
		color: rgba(var(--bs-body-color-rgb), .65);
		transform: scale(.85) translateY(-.5rem) translateX(.15rem);
	}
	.align-items-center {
		align-items: center !important;
	}
	.d-flex {
		display: flex !important;
	}
	.mb-20px {
		margin-bottom: 20px !important;
	}
	.form-floating {
		position: relative;
	}
	.login.login-v1 .login-container .login-header {
		width: 400px;
		padding: 0;
		margin: 0 auto;
		margin-bottom: 15px;
		font-weight: 300;
		position: relative;
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		justify-content: space-evenly;
	}

	.login.login-v1 {
		min-height: 100vh;
		width: 100%;
		background-image: url(/assets/img/login-bg/bg-login.png);
		background-size: cover;
		display: flex;
		align-items: center
	}
	.login.login-v1 .login-container .login-body .login-content .form-check-input:checked {
		background-color: #ddd;
	}
</style>
<body class="pace-top">



<div id="app" class="app">

	<div class="login login-v1" style="background-color: #eacccc;">

		<div class="login-container">

			<div class="login-header">
				<div class="brand">
					<div class="d-flex align-items-center">
						<img  style="width: 400px; border-radius: 20px; " src="${path}<spring:message code="header.logoimg" text="/assets/img/logo/top_title_png.png"/>">
					</div>
				</div>
			</div>


			<div class="login-body">
				<div class="login-content fs-13px">
					<form class="login_form" name="login_form">
						<input type="hidden" class="uuid" id="uuid" name="uuid" value="">
						<div class="form-floating mb-20px">
							<input type="text" class="form-control fs-13px h-45px bmLoginId" id="bmLoginId" name="bmLoginId" placeholder="Account ID" />
							<%--<label for="emailAddress" class="d-flex align-items-center">Email Address</label>--%>
						</div>
						<div class="form-floating mb-20px">
							<input type="password" class="form-control fs-13px h-45px bmLoginPwd" id="bmLoginPwd" name="bmLoginPwd" placeholder="Password" />
							<%--<label for="password" class="d-flex align-items-center">Password</label>--%>
						</div>
						<div class="form-check mb-20px">
							<input type="checkbox" class="form-check-input" id="remember_checkbox" />
							<label for="remember_checkbox" class="form-check-label"  for="remember_checkbox">
								아이디 저장
							</label>
						</div>
						<div class="login-buttons">
							<button type="button" class="btn btn-theme h-45px d-block w-100 btn-lg submit_btn_css login_btn">로&nbsp;&nbsp; 그&nbsp;&nbsp; 인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
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
						//frm_check();
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

</html>
