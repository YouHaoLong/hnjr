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

		<title>发起挑战赛</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath%>mobile/apply/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/initiate.css"/>
		<script src="<%=basePath%>mobile/apply/js/jquery.min.js"></script>
		<script src="<%=basePath%>mobile/apply/js/bootstrap.min.js"></script>
	</head>
	<style>
	.main{
		padding-top: 0;
	}	
	.head{
		height: 200px;
		background: #E9811E;
		line-height: 200px;
		color: #fff;
	}
	</style>

	<body>
		<jsp:include page="menu.jsp" flush="true"></jsp:include>
		<div class="container" style="margin-top: 95px;">
			<div class="main">
				<div class="head">
					<b>发起挑战赛</b>
				</div>
				<div class="step" style="margin-bottom: 0;">
					<div class="center" style="border-bottom: 1px solid #e0e0e0;" >
					<ul class="nav navbar-nav nav_ul pad15" id="nav-tabs" style="width: 310px;margin: auto;">
						<li class="active">
							<a href="#t-tael" data-toggle="tab">发起挑战赛</a>
						</li>
						<li>
							<a href="#t-oxMoney" data-toggle="tab">当前挑战赛</a>
						</li>
						<li>
							<a href="#t-withdrawals" data-toggle="tab">历史挑战赛</a>
						</li>
					</ul>
					</div>
					<div class="center">
						<div class="withdlist">
							<div>参赛金额：</div>
							<select class="ipt" id="money">
								<option value="500">500</option>
						      	<option value="1000">1000</option>
						      	<option value="2000">2000</option>
						      	<option value="5000">5000</option>
						      	<option value="10000">10000</option>
						      	<option value="20000">20000</option>
						      	<option value="30000">30000</option>
							</select>
						</div>
						<div class="withdlist">
							<div class="">杠杆比例：</div>
							<select class="ipt" id="bili">
								<option value="2">1:2</option>
						      	<option value="3">1:3</option>
						      	<option value="4">1:4</option>
							</select>
						</div>
						<div class="withdlist">
							<div class="">参赛模式：</div>
							<select name="type" class="ipt" id="tztype">
								<option value="1">周赛</option>
				      			<option value="2">月赛</option>
							</select>
						</div>
						<div class="withdlist" style="text-align: center;margin-bottom: 20px;">
							<input type="checkbox" />
							<span>请阅读<a href="#middlePopover" class="col_11e">《预选操盘手选拨风险协议》</a></span>
						</div>
					</div>
			   		<div class="nextbtn">
			   			<button type="button" class="btn" onclick="aa()" >确定</button>
			   		</div>
				</div>
				<!--提示-->
				<div class="modal fade in" id="prompt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
								<div class="center">
									<h4 class="modal-title" id="myModalLabel">提示</h4>
								</div>
							</div>
							<div class="modal-body center">
								<div class="head1">
									您必须成为操盘手才可进行挑战赛的操作。
								</div>
								<div class="nextbtn" style="margin: 60px 0 40px;">
						   			<button type="button" class="btn" >立即申请</button>
						   		</div>
							
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
		</div>	
	</body>
<script>
	function aa () {
		$("#prompt").modal('show')
		
	}
</script>
</html>