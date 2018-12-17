<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript">
function test(){
	window.location.href="showBank.jsp";
	
}
	
	

</script>
<body>
	<a href="login/showBank.do?user=123">Test</a>
	<a onclick="test()">Test1</a>
</body>
</html>