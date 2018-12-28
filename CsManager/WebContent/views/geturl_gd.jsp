<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="<%=request.getContextPath()%>/css/regiser/public.css?v=3.4.0"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/regiser/wan.css?v=3.4.0"
	rel="stylesheet">
<style>
img {
	max-width: 100%;
}
</style>
<title>查看光大银行二维码</title>
</head>
<body>
	<div>
		<img src="../file/getPhotoImg.do?bank_id=2&bank_ab=CEB"/>
	</div>
</body>
</html>