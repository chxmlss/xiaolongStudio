<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String loginMsg = session.getAttribute("loginMsg")!=null?session.getAttribute("loginMsg").toString():"";
	String userid = session.getAttribute("userid")!=null?session.getAttribute("userid").toString():"";
%>
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	
	<title>CsManager登录</title>
	<meta name="keywords" content="CsManager" />
	<meta name="description" content="晓龙工作室研发产品" />
	<link rel="shortcut icon"
		href="<%=request.getContextPath()%>/img/favicon.ico" />
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
		rel="stylesheet" />
	<link
		href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0"
		rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/animate.min.css"
		rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/style.min.css"
		rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/login.min.css"
		rel="stylesheet" />
	<style type="text/css">
	.form-control.input_error {
		display: none;
		color: red;
		border: 1px solid red;
		border-radius: 1px;
		background: #FEEEEB;
	}
	
	input::-webkit-input-placeholder {
		/* placeholder颜色  */
		color: #aab2bd;
		/* placeholder字体大小  */
		font-size: 12px;
		/* placeholder位置  */
		text-align: left;
	}
	</style>
	<!--[if lt IE 9]>
	    <meta http-equiv="refresh" content="0;ie.html" />
	    <![endif]-->
	<script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
	<script>
		if (window.top !== window.self) {
			window.top.location = window.location
		};
	   
		$(function() {
			var loginMsg = "${loginMsg}";
		    if(loginMsg != ''){
		    	$(".form-control.input_error").val(loginMsg);
				$(".form-control.input_error").show();
				return false;
		    }
			$("#button").on('click', function() {
				var usr = $(".form-control.uname").val();
				var pwd = $(".form-control.pword.m-b").val();
				if (usr == '') {
					$(".form-control.input_error").val("用户名不能为空");
					$(".form-control.input_error").show();
					return false;
				} else if (pwd == '') {
					$(".form-control.input_error").val("密码不能为空");
					$(".form-control.input_error").show();
					return false;
				}
				$("#form").submit();
			});
	        
		});
	</script>

</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form id="form" method="post" action="scLogin.do">
					<h3 class="no-margins"><font color="#2ec2c8">CsManager系统登陆</font></h3>
					<input type="hidden" name="id" value="<%=userid%>"/>
					<input type="text" class="form-control input_error"
						disabled="disabled"/>
					<input type="text" class="form-control uname" placeholder="用户名"
						name="username" autocomplete="off" /> <input type="password"
						class="form-control pword m-b" placeholder="密码" name="password" />
					 <a href="#">忘记密码了？</a><input
						type="submit" class="btn btn-success btn-block" id="button"
						value="登陆" />
						
				</form>
			</div>
		</div>
		<!-- <div class="signup-footer">
			<div class="pull-left">&copy; 2018 All Rights Reserved. Sunway
			</div>
		</div> -->
	</div>

</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/login_v2.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:52 GMT -->
</html>
