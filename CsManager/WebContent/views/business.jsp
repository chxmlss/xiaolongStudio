<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/projects.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:44 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>业务管理</title>
   	<meta name="keywords" content="CsManager" />
	<meta name="description" content="晓龙工作室研发产品" />
	
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/jquery-confirm.css" rel="stylesheet"/>
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
                        <h5>业务统计</h5>
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
                                <div class="text-center">
                                    <div class="btn-group">
                                        <button class="btn btn-white" type="button" onclick="preLeft();">
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        {{each pages.pageIntal as page i}}
                                            <button class="btn btn-white pageContent" id="{{page}}" onclick="curPage('{{page}}')">{{page}}</button>
                                        {{/each}} 
                                        <button class="btn btn-white" type="button" onclick="preRight('{{pages.totalPage}}');">
                                            <i class="fa fa-chevron-right" ></i>
                                         </button>
                                    </div>
                                </div> 
                            </script>
                            <script type="text/javascript">
	                            var businessData;
	        					$.ajax({
	        						url:"../register/getGroupUserRegister.do",
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
        <div class="row hidden_countcard">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>注册人办卡数据</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row m-b-sm m-t-sm">
                           <div class="col-md-1">
                               <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                           </div>
                        </div>
                        <div class="project-list" id="countCard">
                           <script id="businessContent2" type="text/html">
                               <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <th class="project-status" style="text-align:center;">注册人姓名</th>
                                            <th class="project-title" style="text-align:center;">注册人身份证号</th>
                                            <th class="project-completion" style="text-align:center;">注册人手机号</th>
                                            <th class="project-completion" style="text-align:center;">办卡数量</th>
                                            <th class="project-people" style="text-align:center;">卡种</th>
                                            <th class="project-people" style="text-align:center;">创建日期</th>
                                        </tr>
                                        {{each registers as value i}}
                                               <tr>
                                                   <td class="project-status" style="text-align:center;">
                                                        {{value.register_name}}                                                
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        {{value.register_idcard}}                                                   
                                                   </td>
                                                   <td class="project-completion" style="text-align:center;">
                                                        {{value.register_telephone}}
                                                   </td>
                                                   <td class="project-completion" style="text-align:center;">
                                                        {{value.bank_count}}
                                                   </td>
                                                   <td class="project-people" style="text-align:center;">
                                                        {{value.register_bank}}
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        {{value.createDate}}
                                                   </td>
                                               </tr>       
                                        {{/each}}
                                    </tbody>  
                                </table>
                                  <div class="text-center">
                               <button class="btn btn-white" type="button" onclick="preLeft2();">
                                  <i class="fa fa-chevron-left"></i>
                               </button>
                               {{each pages.pageIntal as page i}}
                                    <button class="btn btn-white pageCountCard" id="page{{page}}" onclick="curPage2('{{page}}')">{{page}}</button>
                               {{/each}} 
                               <button class="btn btn-white" type="button" onclick="preRight2('{{pages.totalPage}}');">
                                  <i class="fa fa-chevron-right" ></i>
                               </button>
                            </div> 
                           </script>
                           <script type="text/javascript">
                           var userid;
                           function searchCardNum(useridValue){
                        	 userid = useridValue;
                        	$('.hidden_countcard').show();   
                   	    	$.ajax({
                   				url:"../register/getRegister.do",
                   				type:"post",
                   				dataType:"json",
                   				data:{"userid":userid},
                   				async:false,
                   				success:function(data){
                   					var html = template('businessContent2', data);
                   				    $('#countCard').html(html);
                   				}
                   			});
                   	    }
                          
					  </script> 
                     </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=request.getContextPath()%>/js/content.min.js?v=1.0.0"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-confirm.js"></script>

    <script>
       $(document).ready(function(){$("#loading-example-btn").click(function(){btn=$(this);simpleLoad(btn,true);simpleLoad(btn,false)})});function simpleLoad(btn,state){if(state){btn.children().addClass("fa-spin");btn.contents().last().replaceWith(" Loading")}else{setTimeout(function(){btn.children().removeClass("fa-spin");btn.contents().last().replaceWith(" Refresh")},2000)}};
    </script>
    <script>
	    //统计所有注册人和办卡数量
        function curPage(page){
        	var firstPage = $(".btn.btn-white.pageContent").first().attr("id");
        	var lastPage = $(".btn.btn-white.pageContent").last().attr("id");
        	var start = Number(firstPage);
        	var end = Number(lastPage);
        	$.ajax({
				url:"../register/getGroupUserRegister.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end},
				async:false,
				success:function(data){
					var html = template('businessContent', data);
				    $('#countRegisterAndCard').html(html);
				    $("#"+page).addClass("active");
				}
			});
        }
        function preLeft(){
        	var firstPage = $(".btn.btn-white.pageContent").first().attr("id");
        	var lastPage = $(".btn.btn-white.pageContent").last().attr("id");
        	if(firstPage == 1){
        		return false;
        	}
        	var page = Number(firstPage)-1;
        	var start = Number(firstPage)-1;
        	var end = Number(lastPage)-1;
        	$.ajax({
				url:"../register/getGroupUserRegister.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end},
				async:false,
				success:function(data){
					var html = template('businessContent', data);
				    $('#countRegisterAndCard').html(html);
				    $(".btn.btn-white.pageContent").first().addClass("active");
				}
			});
        }
        
        function preRight(totalPage){
        	var firstPage = $(".btn.btn-white.pageContent").first().attr("id");
        	var lastPage = $(".btn.btn-white.pageContent").last().attr("id");
        	if(lastPage == totalPage){
        		return false;
        	}
        	var page = Number(firstPage)+1;
        	var start = Number(firstPage)+1;
        	var end = Number(lastPage)+1;
        	$.ajax({
				url:"../register/getGroupUserRegister.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end},
				async:false,
				success:function(data){
					var html = template('businessContent', data);
				    $("#countRegisterAndCard").html(html);
				    $(".btn.btn-white.pageContent").first().addClass("active");
				}
			});
        }
        //根据员工分别统计注册人办卡数量
        function curPage2(page){
        	var firstPage = $(".btn.btn-white.pageCountCard").first().attr("id").substring(4);
        	var lastPage = $(".btn.btn-white.pageCountCard").last().attr("id").substring(4);
        	var start = Number(firstPage);
        	var end = Number(lastPage);
        	$.ajax({
				url:"../register/getRegister.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end,"userid":userid},
				async:false,
				success:function(data){
					var html = template('businessContent2', data);
				    $('#countCard').html(html);
				    $("#page"+page).addClass("active");
				}
			});
        }
        
        function preLeft2(){
        	var firstPage = $(".btn.btn-white.pageCountCard").first().attr("id").substring(4);
        	var lastPage = $(".btn.btn-white.pageCountCard").last().attr("id").substring(4);
        	if(firstPage == 1){
        		return false;
        	}
        	var page = Number(firstPage)-1;
        	var start = Number(firstPage)-1;
        	var end = Number(lastPage)-1;
        	$.ajax({
				url:"../register/getRegister.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end,"userid":userid},
				async:false,
				success:function(data){
					var html = template('businessContent2', data);
				    $('#countCard').html(html);
				    $(".btn.btn-white.pageCountCard").first().addClass("active");
				}
			});
        }
        
        function preRight2(totalPage){
        	var firstPage = $(".btn.btn-white.pageCountCard").first().attr("id").substring(4);
        	var lastPage = $(".btn.btn-white.pageCountCard").last().attr("id").substring(4);
        	if(lastPage == totalPage){
        		return false;
        	}
        	var page = Number(firstPage)+1;
        	var start = Number(firstPage)+1;
        	var end = Number(lastPage)+1;
        	$.ajax({
				url:"../register/getRegister.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end,"userid":userid},
				async:false,
				success:function(data){
					var html = template('businessContent2', data);
				    $("#countCard").html(html);
				    $(".btn.btn-white.pageCountCard").first().addClass("active");
				}
			});
        }
    </script>
    <script>
    $(document).ready(function(){
        $("#search").click(function(){
        	var name = $("#search_user").val();
        	var group = $("#search_group").val();
        	$.ajax({
				url:"../business/getGroupsInfo.do",
				type:"post",
				dataType:"json",
				data:{"name":name,"group":group},
				async:false,
				success:function(data){
					var html = template('personContent', data);
				    $('.project-list').html(html);
				}
			});
        });	
    });
    </script>
  </body>

</html>
