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

		<title>交易详情</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath%>mobile/apply/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/initiate.css"/>
		<script src="<%=basePath%>mobile/apply/js/jquery.min.js"></script>
		<script src="<%=basePath%>mobile/apply/js/bootstrap.min.js"></script>
	</head>
	<style>
	.head{ color: #333; }
	.table thead { background: #ededed; }
	.table>tbody>tr>td,.table>thead>tr>th{ border: none; }
	th{ text-align: center; }
	.head1{ font-size: 16px; }
	.btn{ background: #E9811E; color: #fff; padding: 3px 12px;margin-left: 10px;}
	.glyphicon { font-size: 12px; color: #fff; top: 0;}
	.col_525{
		color: #ed2525;
	}
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
					<b>交易详情</b>
				</div>
				
				<div class="step" style="margin-bottom: 0;">
					<div class="dis">
						<span class="col_7a7">挑战金额（元）：</span>
						<span class="col_11e">5000</span>
					</div>
					<div class="dis" style="margin-left: 30px;">
						<span class="col_7a7">管理费（元）：</span>
						<span class="col_11e">5000</span>
					</div>
					<div class="center">
						<div class="panel-body" style="padding:15px 140px;">
							<table class="table" style="word-break:break-all; word-wrap:break-all;">
								<thead class="center">
									<tr>
										<th>名称/代码</th>
										<th>单价</th>
										<th>成交金额</th>
										<th>数量</th>
										<th>操作</th>
										<th>时间</th>
									</tr>
								</thead>
								<tbody id="mypayment">
									<tr>
										<td>恒泰金融/50320</td>
										<td>20.0</td>
										<td class="col_525">-32.02</td>
										<td>4005</td>
										<td class="col_11e">买入</td>
										<td>2017-12-19</td>
									</tr>
									<tr>
										<td>恒泰金融/50320</td>
										<td>20.0</td>
										<td class="col_525">-32.02</td>
										<td>4005</td>
										<td class="col_11e">买入</td>
										<td>2017-12-19</td>
									</tr>
									
								</tbody>
							</table>
							
					   		
						</div>
					</div>
			   		
				</div>
				
			</div>
			
		</div>	
		
		
	
	</body>

</html>