<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>信用卡绿色通道</title>
<link
	href="<%=request.getContextPath()%>/css/confirmBank/public.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/confirmBank/last.css"
	rel="stylesheet">

</head>
<body>
	<div class="top flex flex-pack-center flex-align-center flex-warp">
		<div
			class="top-c flex flex-pack-center flex-align-center flex-1 flex-warp">
			<div class="img flex flex-pack-center flex-align-center box">
				<img src="../img/w2.png" />
			</div>
			<h3>信用卡绿色通道</h3>
		</div>
	</div>
	<div class="warn" style="padding-top: 2rem;padding-bottom: 5rem">
		<h3>注意事项</h3>
		<div class="warn-c box">
			<p>1、必须填写真实个人信息，否则无法在平台办理业务。</p>
			<p>2、申请信用卡不收取任何费用，凡是索取均为欺诈，请不要相信！</p>
		</div>
	</div>
	<div class="p-btn flex flex-pack-center flex-align-center">
		<span>下一步</span>
	</div>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script>

		$('.p-btn').on('click', 'span', function() {
			alert(1);
			/* $.ajax({
				type : "get",
				dataType : "json",
				url : '/index/index/addOrder.html',
				success : function(res) {
					if (res.status == 1) {
						location.href = res.msg;
					} else {
						layer.msg(res.msg);
					}
				},
				error : function(data) {
					layer.msg("网络错误");
				}

			}); */
		})
	</script>
</body>
</html>