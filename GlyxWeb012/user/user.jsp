
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
	<meta name="renderer" content="webkit">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>账户资产</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
	<link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/assets.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
	<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/assets.js" ></script>
</head>
<style>


</style>

<body>
	<jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>

	<div class="container" style="margin-top: 95px;">
		<div class="row">
			<jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>
			<div class="col-md-9 pad7">
				<div class="right">
					<div class="lookup">
						<b>账户资产</b>
						<a id='zijl' href="<%=basePath %>pcTransation/converPcCapitalRecord.htm" class="navbar-right">资金记录 <span>&raquo;</span></a>
						<hr />
					</div>
					<div class="available">
						<span class="col_7a7">可用银两：</span>
						<b class="money" id="available" style="font-size: 20px;">0.00</b>
						<div class="withdrawals navbar-right">
							<div class="withdrawals">
								<img src="<%=basePath %>views/GlyxWeb/images/center.png"/>
								<div><a href="<%=basePath %>/pcTransation/converPcWithdrawCash.htm">提现</a></div>
							</div>
							<!--<div class="withdrawals" style="margin-left: 40px;">
								<img src='../images/Bankcard.png'/>
								<div>银行卡管理</div>
							</div>-->
						</div>
					</div>
					<div class="available">
						<div class="">
							<div class="">
								<img src="<%=basePath %>views/GlyxWeb/images/Money.png"/>
								<span class="withdtext">我的银两</span>
								<span id="balance" class="money">0.00</span>
								<div class="dis">
									<button class="btn" onclick="alert('功能待开发')">充值</button>
									<a href="<%=basePath %>pcTransation/converPcYlRecord.htm">
									<button class="details">交易详情<span class="glyphicon glyphicon-menu-right"></span></button>
									</a>
								</div>
								
							</div>
							<div style="margin-top: 15px;">
								<img src="<%=basePath %>views/GlyxWeb/images/niubi.png"/>
								<span class="withdtext">我的牛币</span>
								<span id="total" class="money">0.00</span>
								<div class="dis">
									<button class="btn" onclick="window.location.href='<%=basePath %>/pcTransation/converPcCopper.htm'">兑换</button>
									<a href="<%=basePath %>pcTransation/converPcnbRecord.htm">
										<button class="details">交易详情<span class="glyphicon glyphicon-menu-right"></span></button>
									</a>
									
								</div>
								
							</div>
							
						</div>
					</div>
					
				</div>
				<div class="bottom">
					<div class="ljsy">
						<div class="sub">
							<div><b>累计收益</b></div>
							<div><b id="profitLoss">0.00</b></div>
						</div>
					</div>
					<div class="ljsy1">
						<div class="sub">
							<div><b>累计收益</b></div>
							<div><b id="recommend">0.00</b></div>
						</div>
					</div>
					<div class="ljsy2">
						<div class="sub">
							<div><b>累计收益</b></div>
							<div><b id="amountFrozen">0.00</b></div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	</body>
	<script>
		$("#main-nav li").eq(0).addClass("active");
		$(".navul li").eq(3).addClass("active");
		$('#leftzc').attr('src','<%=basePath %>views/GlyxWeb/images/Property.png')
		
	</script>

</html>