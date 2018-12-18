<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/projects.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:44 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>人员管理</title>
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
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInUp">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>所有人员</h5>
                         <div class="ibox-tools">
                            <a data-toggle="modal" data-target="#addModal" class="btn btn-primary btn-xs">增加人员</a>
                            <div class="modal inmodal" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
		                          <div class="modal-dialog">
		                                <div class="modal-content animated bounceInRight">
		                                    <div class="modal-header">
		                                        <div class="ibox float-e-margins">
								                    <div class="ibox-title">
								                        <h5>增加员工</h5>
								                        <div class="ibox-tools">
								                            <a data-dismiss="modal">
								                                <i class="fa fa-times fa-2x"></i>
								                            </a>
								                        </div>
								                    </div>
								                    <div class="ibox-content">
								                        <form id="addForm" class="form-horizontal m-t" id="signupForm" method="post" action="">
								                            <input type="hidden" name="remarks" id="remarks"/>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">姓名：</label>
								                                <div class="col-sm-8">
								                                    <input name="name" class="form-control" type="text"/>
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                  <label class="col-sm-3 control-label">性别：</label>
								                                 <div class="col-sm-8">
								                                     <div style="float:left;">
								                                         <label><input type="radio" checked="checked" value="0" name="sex">男</label>
								                                         <label><input type="radio" value="1"  name="sex">女</label>    
								                                     </div>
								                                 </div>
								                            </div>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">联系方式：</label>
								                                <div class="col-sm-8">
								                                    <input name="tel" class="form-control" type="tel">
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">用户名：</label>
								                                <div class="col-sm-8">
								                                    <input  name="username" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" onchange="checkUsername(this.value);"/>
								                                     <span id="msg" class="help-block m-b-none" style="color:red;float:left;"></span>
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">密码：</label>
								                                <div class="col-sm-8">
								                                    <input name="password" class="form-control" type="text"/>
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                <div class="col-sm-8 col-sm-offset-3">
								                                    <button class="btn btn-primary" id="addSubmit">提交</button>
								                                </div>
								                            </div>
								                        </form>
								                    </div>
								                </div>
		                                    </div>
		                                </div>
		                            </div>
		
		                        </div>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-1">
                                <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                            <div class="col-md-11">
                                <div class="input-group">
                                    <input id="search_user" style="width:30%;margin-right:20px;" type="text" placeholder="请输入要查询人员姓名" class="input-sm form-control"/> 
                                    <span class="input-group-btn">
                                        <button id="search"  type="button" class="btn btn-sm btn-primary" > 搜索</button> 
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="project-list">
                            <script id="personContent" type="text/html">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <th class="project-status" style="text-align:center;">姓名</th>
                                            <th class="project-title" style="text-align:center;">性别</th>
                                            <th class="project-completion" style="text-align:center;">联系方式</th>
                                            <th class="project-completion" style="text-align:center;">账号名称</th>
                                            <th class="project-people" style="text-align:center;">账号密码</th>
                                            <th class="project-people" style="text-align:center;">是否分组</th>
                                            <th class="project-actions" style="text-align:center;">业务操作</th>
                                        </tr>
                                        {{each users as value i}}
                                               <tr>
                                                   <td class="project-status" style="text-align:center;">
                                                        {{value.name}}                                                
                                                   </td>
                                                   <td class="project-title" style="text-align:center;">
                                                        {{value.sex}}                                                   
                                                   </td>
                                                   <td class="project-completion" style="text-align:center;">
                                                        {{value.tel}}
                                                   </td>
                                                   <td class="project-completion" style="text-align:center;">
                                                        {{value.username}}
                                                   </td>
                                                   <td class="project-people" style="text-align:center;">
                                                        {{value.password}}
                                                   </td>
                                                   <td class="project-people" style="text-align:center;">
                                                        {{if value.isgroup == '0'}}
                                                                                                                                            否 
                                                        {{else}}
                                                                                                                                            是
                                                         {{/if}}
                                                   </td>
                                                   <td class="project-actions" style="text-align:center;">
                                                        <a class="btn btn-white btn-sm" onclick="delFunc('{{value.username}}')"><i class="fa fa-folder"></i> 删除 </a>
                                                        <a class="btn btn-white btn-sm" data-toggle="modal" data-target="#myModal" onclick="editFunc('{{value.name}}')"><i class="fa fa-pencil"></i> 编辑 </a>
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
	                            var personData;
	        					$.ajax({
	        						url:"../business/getUsersInfo.do",
	        						type:"post",
	        						dataType:"json",
	        						async:false,
	        						success:function(data){
	        							console.log(data);
	        							personData = data;
	        						}
	        					});
	        					var html = template('personContent', personData);
	        				    $('.project-list').html(html);
						     </script> 
						     <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
		                          <div class="modal-dialog">
		                                <div class="modal-content animated bounceInRight">
		                                    <div class="modal-header">
		                                        <div class="ibox float-e-margins">
								                    <div class="ibox-title">
								                        <h5>编辑员工</h5>
								                        <div class="ibox-tools">
								                            <a data-dismiss="modal">
								                                <i class="fa fa-times fa-2x"></i>
								                            </a>
								                        </div>
								                    </div>
								                    <div class="ibox-content">
								                        <form id="form" class="form-horizontal m-t" id="signupForm" method="post" action="">
								                            <input type="hidden" name="userid" id="userid"/>
								                            <input type="hidden" name="remarks" id="remarks"/>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">姓名：</label>
								                                <div class="col-sm-8">
								                                    <input id="name" name="name" class="form-control" type="text"/>
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                  <label class="col-sm-3 control-label">性别：</label>
								                                 <div class="col-sm-8">
								                                     <div style="float:left;">
								                                         <label><input type="radio" checked="checked" value="0" id="optionsRadios1" name="sex">男</label>
								                                         <label><input type="radio" value="1" id="optionsRadios2" name="sex">女</label>    
								                                     </div>
								                                 </div>
								                            </div>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">联系方式：</label>
								                                <div class="col-sm-8">
								                                    <input id="tel" name="tel" class="form-control" type="tel">
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">用户名：</label>
								                                <div class="col-sm-8">
								                                    <input id="username" name="username" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" readonly>
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                <label class="col-sm-3 control-label">密码：</label>
								                                <div class="col-sm-8">
								                                    <input id="password" name="password" class="form-control" type="text"/>
								                                </div>
								                            </div>
								                            <div class="form-group">
								                                <div class="col-sm-8 col-sm-offset-3">
								                                    <button class="btn btn-primary" id="submit">提交</button>
								                                </div>
								                            </div>
								                        </form>
								                    </div>
								                </div>
		                                    </div>
		                                </div>
		                            </div>
		
		                        </div>
                            </div>
                             
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
        function delFunc(username){
        	$.confirm({
                title: '确认',
                content: '确认删除该员工吗?',
                type: 'green',
                icon: 'glyphicon glyphicon-question-sign',
                buttons: {
                    ok: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function() {
                        	$.ajax({
                				url:"../business/delUser.do",
                				type:"post",
                				dataType:"json",
                				data:{"username":username},
                				async:false,
                				success:function(data){
                					var html = template('personContent', data);
                				    $('.project-list').html(html);
                				}
                			});
                        }
                    },
                    cancel: {
                        text: '取消',
                        btnClass: 'btn-primary'
                    }
                }
            });

        	
        }
        
        function editFunc(username){
        	$.ajax({
				url:"../business/getUsersInfo.do",
				type:"post",
				dataType:"json",
				data:{"name":username},
				async:false,
				success:function(data){
					 console.log(data);
					 $('#name').val(data.users[0].name);
					 if(data.users[0].sex == '男'){
						 $('#optionsRadios1').attr("checked","checked");
					 }else{
						 $('#optionsRadios2').attr("checked","checked");
					 }
					 $('#tel').val(data.users[0].tel);	 
					 $('#username').val(data.users[0].username);	 
					 $('#password').val(data.users[0].password);
					 $('#userid').val(data.users[0].id);	 
					 $('#remarks').val(data.users[0].remarks);
				}
			});
        }
        function curPage(page){
        	var firstPage = $(".btn.btn-white.pageContent").first().attr("id");
        	var lastPage = $(".btn.btn-white.pageContent").last().attr("id");
        	var start = Number(firstPage);
        	var end = Number(lastPage);
        	$.ajax({
				url:"../business/getUsersInfo.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end},
				async:false,
				success:function(data){
					var html = template('personContent', data);
				    $('.project-list').html(html);
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
				url:"../business/getUsersInfo.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end},
				async:false,
				success:function(data){
					var html = template('personContent', data);
				    $('.project-list').html(html);
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
				url:"../business/getUsersInfo.do",
				type:"post",
				dataType:"json",
				data:{"page":page,"start":start,"end":end},
				async:false,
				success:function(data){
					var html = template('personContent', data);
				    $('.project-list').html(html);
				    $(".btn.btn-white.pageContent").first().addClass("active");
				}
			});
        	
        }
        
        function checkUsername(username){
        	$.ajax({
				url:"../business/checkUsername.do",
				type:"post",
				dataType:"json",
				data:{"username":username},
				async:false,
				success:function(data){
					console.log(data);
					$("#msg").html("<i class='fa fa-info-circle'></i>"+data.msg);
				}
			});
        }
    </script>
    <script>
    $(document).ready(function(){
        $("#submit").click(function(){
        	$.ajax({
				url:"../business/changeUserInfo.do",
				type:"post",
				dataType:"html",
				data: $("#form").serialize(),
				async:false,
				success:function(data){
					var html = template('personContent', data);
				    $('.project-list').html(html);
				}
			});
        });	
        $("#addSubmit").click(function(){
        	$.ajax({
				url:"../business/addUser.do",
				type:"post",
				dataType:"html",
				data: $("#addForm").serialize(),
				async:false,
				success:function(data){
					var html = template('personContent', data);
				    $('.project-list').html(html);
				}
			});
        });	
        $("#search").click(function(){
        	var name = $("#search_user").val();
        	var group = $("#search_group").val();
        	$.ajax({
				url:"../business/getUsersInfo.do",
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
