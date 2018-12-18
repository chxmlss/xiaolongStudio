<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<% 
    String username = session.getAttribute("username")!=null?session.getAttribute("username").toString():"";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>CsManager主页</title>

  	<meta name="keywords" content="CsManager" />
	<meta name="description" content="晓龙工作室研发产品" />
	
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="<%=request.getContextPath()%>/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold"><%=username %></strong></span>
	                                <c:if test="${username == 'admin'}">
	                                   <span class="text-muted text-xs block">管理员 <b class="caret"></b></span>
	                                </c:if>
	                                 <c:if test="${username != 'admin'}">
	                                   <span class="text-muted text-xs block">普通用户 <b class="caret"></b></span>
	                                </c:if>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <!-- <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li> -->
                                <li>
                                    <a class="J_menuItem" href="<%=request.getContextPath()%>/views/modify.jsp">修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="toLogin.do">安全退出</a>
                                </li>
                            </ul>
                            
                        </div>
                        <div class="logo-element">smLong
                        </div>
                    </li>
                    <c:choose> 
	                    <c:when test="${username == 'admin'}">
	                        <li>
		                        <a href="#">
		                            <i class="fa fa-desktop"></i> 
		                            <span class="nav-label">团队管理</span>
		                            <span class="fa arrow"></span>
		                        </a>
		                        <ul class="nav nav-second-level">
		                            <li><a class="J_menuItem" href="<%=request.getContextPath()%>/views/persons.jsp">人员管理</a>
		                            </li>
		                            <li><a class="J_menuItem" href="<%=request.getContextPath()%>/views/groups.jsp">组织管理</a>
		                            </li>
		                        </ul>
	                        </li>
	                        <li>
	                            <a class="J_menuItem" href="<%=request.getContextPath()%>/views/business.jsp">
		                            <i class="fa fa-table"></i> 
		                            <span class="nav-label">业务统计</span>
		                        </a>
	                        </li>
	                         <li>
	                            <a class="J_menuItem" href="<%=request.getContextPath()%>/views/creditcard.jsp">
		                            <i class="fa fa-magic"></i> 
		                            <span class="nav-label">信用卡管理</span>
		                        </a>
	                        </li>
	                    </c:when>
	                    <c:otherwise>
	                        <li>
		                        <a class="J_menuItem" href="<%=request.getContextPath()%>/views/upload.jsp">
		                            <i class="fa fa-desktop"></i> 
		                            <span class="nav-label">图片上传</span>
		                        </a>
	                        </li>
	                         <li>
		                        <a class="J_menuItem" href="<%=request.getContextPath()%>/views/geturl.jsp">
		                            <i class="fa fa-edit"></i> 
		                            <span class="nav-label">二维码下载</span>
		                        </a>
	                        </li>
	                    </c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <div class="navbar-form-custom" style="width:90px;">
                            <div class="alert alert-success" style="margin-bottom:0px;" id="groupName"></div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                       <c:choose>
	                    <c:when test="${username == 'admin'}">
	                        <a href="javascript:;" class="active J_menuTab" data-id="persons.jsp">首页</a>
			             </c:when>
		                <c:otherwise>
		                     <a href="javascript:;" class="active J_menuTab" data-id="upload.jsp">首页</a>
		                </c:otherwise>
		                </c:choose>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </ul>
                </div>
                <a href="toLogin.do" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <c:choose>
	                <c:when test="${username == 'admin'}">
	                   <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="<%=request.getContextPath()%>/views/persons.jsp" frameborder="0" data-id="persons.jsp" seamless></iframe>
	                </c:when>
	                <c:otherwise>
	                     <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="<%=request.getContextPath()%>/views/upload.jsp" frameborder="0" data-id="upload.jsp" seamless></iframe>
	                </c:otherwise>
                </c:choose>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2017-2018 <a href="http://www.smLong.com/" target="_blank">晓龙工作室</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/layer/layer.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/hplus.min.js?v=4.1.0"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/contabs.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/pace/pace.min.js"></script>
    <script>
        $(function(){
        	$.ajax({
        		url:"../business/findGroupCapByUsername.do",
       			type:"post",
				dataType:"json",
				data:{"username":"<%=username%>"},
				async:false,
				success:function(data){
					console.log(data);
					var groupName = data.groupname;
					if(groupName == null || groupName == 'admin'){
						$("#groupName").hide();
					}else{
						$("#groupName").html(groupName+'组');
					}
				}	
        	});
        	
        });
    </script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
