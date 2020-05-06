<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>审核结果</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath%>mobile/apply/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/initiate.css"/>
		<script src="<%=basePath%>mobile/apply/js/jquery.min.js"></script>
		<script src="<%=basePath%>mobile/apply/js/bootstrap.min.js"></script>
	</head>
	<style>

	</style>

	<body>
		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
	    	<div class="container">
		    <div class="navbar-header">
		      
	  		<img src="<%=basePath%>mobile/apply/images/challenge/logo.png" style="height: 50px;"/>
		    </div>
		    <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
		      	<ul class="nav navbar-nav navul">
			        <li class="active"><a href="#">首页 </a></li>
			        <li><a href="#">挑战赛</a></li>
			        <li><a href="#">优财交易</a></li>
			        <li><a href="#">个人中心</a></li>
		      	</ul>
		      	<div class="retreat" style="float: right; margin-top: 13px;"><a href="#">退出</a></div>
		      	<div style="padding-left: 15px; float: right;" >
		      		<span class="glyphicon glyphicon-bell navbar-right" aria-hidden="true">
		      		<span class="badge navbar-right">1</span>
		      		</span>
		      	</div>
		      	<div style="padding:0 15px;" class="navbar-right">
		      		<img src="<%=basePath%>mobile/apply/images/challenge/Login.png"/>
		      		<span>您已登录成功,<span id="Username">134****3453</span></span>
		      		
		      	</div>
		      	
		    </div>
		  </div>
		</nav>
		<div class="container" style="margin-top: 95px;">
			<div class="main">
				<div class="head">
					<b>申购流程，只需4步完成！</b>
				</div>
				<div class="step">
					<div class="dis">
						<div class="substep">
							<img src="<%=basePath%>mobile/apply/images/challenge/read.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow.png"/>
						</div>
						<div class="wid75">阅读须知</div>
					</div>
					<div class="dis">
						<div class="substep">
							<img src="<%=basePath%>mobile/apply/images/challenge/fillIn.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow.png"/>
						</div>
						<div class="wid75">填写资料</div>
					</div>
					
					<div class="dis">
						<div class="substep">
							<img src="<%=basePath%>mobile/apply/images/challenge/submit.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow.png"/>
						</div>
						<div class="wid75">提交审核</div>
					</div>
					
					<div class="dis">
						<div class="substep" style="background: #E9811E;">
							<img src="<%=basePath%>mobile/apply/images/challenge/audit.png"/>
						</div>
						<div class="wid75">审核结果</div>
					</div>
					
				</div>
				<div class="center">
					<img src="<%=basePath%>mobile/apply/images/challenge/via.png"/>
					<div class="head1">
						<b>恭喜你，审核通过！</b>
					</div>
					<p>你已经成功发起挑战。</p>
				</div>
				
			</div>
			
		</div>	
		
		
	
	</body>

</html>