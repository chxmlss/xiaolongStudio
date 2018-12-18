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
	    <script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
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
                                            <th class="project-status" style="text-align:center;">小组名称</th>
                                            <th class="project-title" style="text-align:center;">组长姓名</th>
                                            <th class="project-title" style="text-align:center;">组员姓名</th>
                                            <th class="project-completion" style="text-align:center;">注册人数</th>
                                            <th class="project-title" style="text-align:center;">办卡数量</th>
                                        </tr>
                                        {{each registerGroupUsers as value i}}
                                               <tr onclick="searchCardNum('{{value.user_id}}');">
                                                   <td class="project-status" style="text-align:center;">
                                                        {{value.group_name}}                                                
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        {{value.group_leader}}                                                   
                                                   </td>
                                                   <td class="project-completion" style="text-align:center;">
                                                        {{value.user_name}}
                                                   </td>
                                                   <td class="project-completion" style="text-align:center;">
                                                        {{value.register_count}}
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        {{value.bank_count}}
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
	</body>
</html>