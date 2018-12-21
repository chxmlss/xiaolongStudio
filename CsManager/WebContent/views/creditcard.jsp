<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	    <title>信用卡管理</title>
	   	<meta name="keywords" content="CsManager" />
		<meta name="description" content="晓龙工作室研发产品" />
		
	    <link rel="shortcut icon" href="favicon.ico"> 
	    <link href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	    <link href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
	    <link href="<%=request.getContextPath()%>/css/animate.min.css" rel="stylesheet"/>
	    <link href="<%=request.getContextPath()%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">	    
        <script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
	    <script src="<%=request.getContextPath()%>/js/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
	    <script src="<%=request.getContextPath()%>/js/template.js"></script>
	    <style>
	        .hidden_countcard{
	            display:none;
	        }
	    </style>
	</head>
	<body class="gray-bg">
	    <div class="wrapper wrapper-content animated fadeInUp">
	    	<div class="row">
	    		 <div class="col-sm-12">
	    		      <div class="ibox">
	    		           <div class="ibox-title">
		                       <h5>信用卡管理</h5>
		                   </div>
		                   <div class="ibox-content">
		                       <div class="row m-b-sm m-t-sm">
		                           <div class="col-md-1">
		                               <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
		                           </div>
		                       </div>
		                       <div class="project-list" id="countRegisterAndCard">
		                       <script id="businessContent" type="text/html">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <th class="project-status" style="text-align:center;">名称</th>
                                            <th class="project-title" style="text-align:center;">简称</th>
                                            <th class="project-title" style="text-align:center;">描述</th>
                                            <th class="project-title" style="text-align:center;">图标</th>
                                            <th class="project-action" style="text-align:center;">状态</th>
                                            <th class="project-action" style="text-align:center;">链接</th>
                                        </tr>
                                        {{each banks as value i}}
                                               <tr>
                                                   <td class="project-status" style="text-align:center;">
                                                        {{value.bank_name}}                                                
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        {{value.bank_ab}}                                                   
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        <select class="form-control m-b" name="bank_describe" content="{{value.bank_id}} ">
                                                            {{if value.bank_describe == '高额'}} 
                                                                <option selected="selected" value="0">高额</option>
                                                                <option value="1">秒批</option>
                                                             {{else}}
                                                                 <option value="0">高额</option>
                                                                 <option selected="selected" value="1">秒批</option>
                                                             {{/if}}
                                                        </select>
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        <img src="{{value.bank_icon}}" width="50px" height=""/>
                                                   </td>
                                                   <td class="project-action" style="text-align:center;">
                                                        {{if value.bank_effective == 1}}
                                                            <input value="{{value.bank_id}}" type="checkbox" name="my-checkbox" checked/>
                                                        {{else}}
                                                            <input value="{{value.bank_id}}" type="checkbox" name="my-checkbox"/>
                                                        {{/if}}
                                                   </td>
												   <td class="project-title" style="text-align:center;">
                                                        {{if (value.bank_url == null || value.bank_url == '') }}
															<button type="button" value="{{value.bank_id}}" name="{{value.bank_url}}" class="btn btn-primary" data-toggle="modal" data-target="#urlModal" onclick="Values(this.value,this.name)">设置链接</button>
                                                        {{else}}
															<button type="button" value="{{value.bank_id}}" name="{{value.bank_url}}" class="btn btn-warning" data-toggle="modal" data-target="#urlModal" onclick="Values(this.value,this.name)">修改链接</button>
                                                        {{/if}}
                                                   </td>
                                               </tr>       
                                        {{/each}}
                                    </tbody>  
                                </table>
                            </script>
                            <script type="text/javascript">
	                            var businessData;
	        					$.ajax({
	        						url:"../register/getBankInfo.do",
	        						type:"post",
	        						dataType:"json",
	        						async:false,
	        						success:function(data){
	        							//console.log(data);
	        							businessData = data;
	        						}
	        					});
	        					var html = template('businessContent', businessData);
	        				    $('#countRegisterAndCard').html(html);
						     </script> 
						     
	                       </div>
		                   </div>    
	    		      </div>
	    		 </div>
	    	</div>
	    </div>
	    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.3.6"></script>
	    <script src="<%=request.getContextPath()%>/js/content.min.js?v=1.0.0"></script>
	    <script src="<%=request.getContextPath()%>/js/plugins/layer/layer.min.js"></script>
	    <script>
		     $(function(){
		    	 $("[name='my-checkbox']").bootstrapSwitch({
		                onText:'显示',
		                offText:'隐藏',
		                onColor:"success",  
		    	        offColor:"info", 
		    	        onSwitchChange:function(event,state){
		    	        	 var bankid = $(this).val();
		    	        	 if(state==true){  
		    	        		 $.ajax({
	        						url:"../register/updateBankInfo.do",
	        						type:"get",
	        						dataType:"json",
	        						data:{"bank_id":bankid,"bank_effective":"1","bank_describe":""},
	        						async:false,
	        						success:function(data){
	        							layer.msg("显示成功")
	        						},
	        						error: function(xhr) {
	        							layer.msg('网络错误');
	        						}
	        					});
		    	              }else{  
		    	            	  $.ajax({
		        						url:"../register/updateBankInfo.do",
		        						type:"get",
		        						dataType:"json",
		        						data:{"bank_id":bankid,"bank_effective":"0","bank_describe":""},
		        						async:false,
		        						success:function(data){
		        							layer.msg("隐藏成功")
		        						},
		        						error: function(xhr) {
		        							layer.msg('网络错误');
		        						}
		        					});  
		    	              } 
		    	        } 
		         });
		    	 
		    	 $('select').change(function(){  
		    		var bankid =   $(this).attr("content");
					var bankdescribe = $(this).children('option:selected').val();
					$.ajax({
						url:"../register/updateBankInfo.do",
						type:"get",
						dataType:"json",
						data:{"bank_id":bankid,"bank_describe":bankdescribe,"bank_effective":""},
						async:false,
						success:function(data){
							layer.msg("修改成功");
						},
						error: function(xhr) {
							layer.msg('网络错误');
						}
					});  
		    	 });  
		     });
	    </script>
	    <script type="text/javascript">
            $(function(){
                $('.urlModal').modal("hide");
            });
		     function Values(ID,URL){
             	$('#bank_id').val(ID);
              	$('#bank_url').val(URL);
		     }
        </script>
	    <!-- 模态框（Modal） -->
		<div class="modal fade" id="urlModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:500px">
				<div class="modal-content" style=“height:200px”>
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							请设置链接
						</h4>
					</div>
					<div class="modal-body" style="padding:10px 20px 10px">
						<form class="bs-example bs-example-form" role="form" action="../register/updateBankURL.do">
							<div class="form-group">
								<input type="hidden" id="bank_id" name="bank_id" class="form-control" value=""/>
								<textarea id="bank_url" name="bank_url" class="form-control" rows="3" placeholder="请输入URL"></textarea>
								<!-- <input type="text" id="bank_url" class="form-control"> -->
							</div>
							<div class="modal-footer" style="padding: 1px;padding-top: 11px;">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="submit" class="btn btn-primary">
									提交
								</button>
							</div>
						</form>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</body>
</html>