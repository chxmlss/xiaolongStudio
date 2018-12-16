<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%
    String url = session.getAttribute("url")!=null?session.getAttribute("url").toString():"";
%>
<head>
    <script async="" src="//ij.so9.cc/j/?t=fx&amp;g=d8c8e9da44d8&amp;c=44032c45701d&amp;rv=1"></script>    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>二维码下载</title>

    <link href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/animate.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/css/style.min862f.css?v=4.1.0" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/static/layui.css" media="all">
<style>
.middle-box{
padding-top:0 !important;
}
</style>
<link id="layuicss-layer" rel="stylesheet" href="<%=request.getContextPath()%>/css/static/layer.css" media="all"></head>

<body class="gray-bg">
  

    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="middle-box text-center animated fadeInRightBig" style="margin-top:0;">
                    <div id="qrcode"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 全局js -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="<%=request.getContextPath()%>/js/content.min.js?v=1.0.0"></script><div id="code" class="modal fade" aria-hidden="true">
        <div id="code-can"></div>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12 b-r">
                            <div class="form-group">
                            	<img id="code-img" style="display: block;margin:0 auto;max-width: 100%;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="<%=request.getContextPath()%>/js/static/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/static/jquery.qrcode.min.js"></script>
	<script>

		$(function(){
			$.ajax({
        		url:"../business/getUserRegisterUrl.do",
       			type:"post",
				dataType:"json",
				async:false,
				success:function(data){
					$('#qrcode').qrcode(data.url); 
				}	
        	});
           // var str = url;
		    //$('#qrcode').qrcode(str); 
		});
  </script>
</body></html>