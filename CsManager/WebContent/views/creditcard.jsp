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
		<link href="<%=request.getContextPath()%>/css/plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet">
	    <script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
	    <script src="<%=request.getContextPath()%>/js/plugins/bootstrap-switch/bootstrap-switch.js"></script>
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
                                            <th class="project-action" style="text-align:center;">显示</th>
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
                                                        {{value.bank_describe}}
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        <img src="{{value.bank_icon}}" width="50px" height=""/>
                                                   </td>
                                                   <td class="project-action" style="text-align:center;">
                                                       <div class="switch">
                                                           <input type="checkbox" name="my-checkbox" checked/>
                                                       </div>
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
						     <script>
							     $(function(){
							    	 $("[name='my-checkbox']").bootstrapSwitch({
							                onText:'显示',
							                offText:'隐藏'
							         });
							     });
						         
						     </script>
	                       </div>
		                   </div>    
	    		      </div>
	    		 </div>
	    	</div>
	    </div>
	    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.3.6"></script>
	    <script src="<%=request.getContextPath()%>/js/content.min.js?v=1.0.0"></script>
	</body>
</html>