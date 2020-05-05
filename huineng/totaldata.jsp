<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String product_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

		<title>首页</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">
		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
	</head>
	<style>

	</style>

	<body>

	<jsp:include page="/static/view/top.jsp" flush="true"></jsp:include>

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">

					<jsp:include page="/static/view/left.jsp" flush="true"></jsp:include>

				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

					<h3 class="sub-header">财务数据汇总</h3>
					<div class="row total">
						<div class="col-xs-5">
							<div class="row">
								<div class="col-sm-3 totalborder">
									<h5>今日待收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>今日已收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>今日待付</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3">
									<h5>今日已付</h5>
									<p>1,200,000</p>
								</div>
							</div>

						</div>
						<div class="col-xs-5" style="float: right;">
							<div class="row">
								<div class="col-sm-3 totalborder">
									<h5>昨日待收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>昨日已收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>昨日待付</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3">
									<h5>昨日已付</h5>
									<p>1,200,000</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row total">
						<div class="col-xs-5">
							<div class="row">
								<div class="col-sm-3 totalborder">
									<h5>本周待收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>本周已收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>本周待付</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3">
									<h5>本周已付</h5>
									<p>1,200,000</p>
								</div>
							</div>

						</div>
						<div class="col-xs-5" style="float: right;">
							<div class="row">
								<div class="col-sm-3 totalborder">
									<h5>本月待收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>本月已收</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3 totalborder">
									<h5>本月待付</h5>
									<p>1,200,000</p>
								</div>
								<div class="col-sm-3">
									<h5>本月已付</h5>
									<p>1,200,000</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 totalborder">
							<div class="row">
								<div class="col-sm-4">
									<h5>当前募集目标</h5>
									<p>321,200,000</p>
								</div>
								<div class="col-sm-4">
									<h5>已募集</h5>
									<p>321,200,000</p>
								</div>
								<div class="col-sm-4">
									<h5>差额</h5>
									<p>20,200,000</p>
								</div>
							</div>
						</div>
						<div class="col-xs-4 totalborder">
							<div class="col-sm-6">
								<h5>当前募集总额</h5>
								<p>421,200,000</p>
							</div>
							<div class="col-sm-6">
								<h5>已放款</h5>
								<p>101,200,000</p>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="col-sm-6">
								<h5>预计收益</h5>
								<p>1,200,000</p>
							</div>
							<div class="col-sm-6">
								<h5>预计支出</h5>
								<p>200,000</p>
							</div>
						</div>
					</div>
					<h3 class="sub-header" style="padding-top: 20px;">产品数据汇总</h3>
					<div class="row total">
						<div class="col-xs-4">
							<div class="row">
								<div class="col-sm-4 totalborder">
									<h5>待发行</h5>
									<p>0</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>审核中</h5>
									<p>2</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>募集中</h5>
									<p>2</p>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="row">
								<div class="col-sm-4 totalborder">
									<h5>募集成功</h5>
									<p>3</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>运行中</h5>
									<p>10</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>运行中</h5>
									<p>3</p>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="row">
								<div class="col-sm-4 totalborder">
									<h5>运行中</h5>
									<p>3</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>总产品数量</h5>
									<p>25</p>
								</div>
								<div class="col-sm-4">
									<a class="btn btn-info totalbtn" href="#" role="button">产品详情</a>
								</div>
							</div>
						</div>
					</div>
					
					<h3 class="sub-header" style="padding-top: 20px;">项目数据汇总</h3>
					<div class="row total">
						<div class="col-xs-4">
							<div class="row">
								<div class="col-sm-4 totalborder">
									<h5>待发行</h5>
									<p>0</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>审核中</h5>
									<p>2</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>募集中</h5>
									<p>2</p>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="row">
								<div class="col-sm-4 totalborder">
									<h5>募集成功</h5>
									<p>3</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>运行中</h5>
									<p>10</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>运行中</h5>
									<p>3</p>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="row">
								<div class="col-sm-4 totalborder">
									<h5>运行中</h5>
									<p>3</p>
								</div>
								<div class="col-sm-4 totalborder">
									<h5>总产品数量</h5>
									<p>25</p>
								</div>
								<div class="col-sm-4">
									<a class="btn btn-info totalbtn" href="#" role="button">产品详情</a>
								</div>
							</div>
						</div>
					</div>
					
					<!--
                    	作者：784901633@qq.com
                    	时间：2017-09-01
                    	描述：右边
                    -->
				</div>
			</div>

		</div>

	</body>

</html>