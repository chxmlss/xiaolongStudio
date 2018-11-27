<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Mirrored from www.zi-han.net/theme/hplus/form_validate.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:15 GMT -->
<head>
<%
String username = session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>修改密码</title>
  	<meta name="keywords" content="CsManager" />
	<meta name="description" content="晓龙工作室研发产品" />
    <link rel="shortcut icon" href="favicon.ico"/> 
    <link href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/animate.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/style.min862f.css?v=4.1.0" rel="stylesheet"/>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
      
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改密码</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="form" method="post" action="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">账号：</label>
                                <div class="col-sm-8">
                                    <input name="username" value="<%=username%>" type="text" class="form-control" readonly aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">原始密码：</label>
                                <div class="col-sm-8">
                                    <input name="oldPwd"  type="text" class="form-control" required="required" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">新密码：</label>
                                <div class="col-sm-8">
                                   <input name="newPwd"  type="text" class="form-control" required="required" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button class="btn btn-primary" id="submit">提交</button>
                                </div>
                                <div ><span style="color:red;font-size:16px;" id="msg"></span></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
             <div class="col-sm-3"></div>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=request.getContextPath()%>/js/content.min.js?v=1.0.0"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/validate/messages_zh.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/demo/form-validate-demo.min.js"></script>
    <script>
    $(document).ready(function(){
        $("#submit").click(function(){
        	$.ajax({
				url:"../business/changePwd.do",
				type:"post",
				dataType:"html",
				data: $("#form").serialize(),
				async:false,
				success:function(data){
				   $("#msg").html("修改成功");
				  
				},
				error:function(data){
					 $("#msg").html("修改失败");
				}
			});
        	 return false;
        });	
    });	   
    </script>
</body>


</html>
